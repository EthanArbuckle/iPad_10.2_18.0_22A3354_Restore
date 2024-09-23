@implementation FTTextToSpeechSpeechFeatureResponse

- (FTTextToSpeechSpeechFeatureResponse)initWithFlatbuffData:(id)a3
{
  return -[FTTextToSpeechSpeechFeatureResponse initWithFlatbuffData:root:verify:](self, "initWithFlatbuffData:root:verify:", a3, 0, 0);
}

- (id)initAndVerifyWithFlatbuffData:(id)a3
{
  return -[FTTextToSpeechSpeechFeatureResponse initWithFlatbuffData:root:verify:](self, "initWithFlatbuffData:root:verify:", a3, 0, 1);
}

- (FTTextToSpeechSpeechFeatureResponse)initWithFlatbuffData:(id)a3 root:(const TextToSpeechSpeechFeatureResponse *)a4
{
  return -[FTTextToSpeechSpeechFeatureResponse initWithFlatbuffData:root:verify:](self, "initWithFlatbuffData:root:verify:", a3, a4, 0);
}

- (FTTextToSpeechSpeechFeatureResponse)initWithFlatbuffData:(id)a3 root:(const TextToSpeechSpeechFeatureResponse *)a4 verify:(BOOL)a5
{
  _BOOL4 v5;
  id v9;
  FTTextToSpeechSpeechFeatureResponse *v10;
  id *p_data;
  unsigned int *v12;
  unint64_t v13;
  uint64_t v14;
  const TextToSpeechSpeechFeatureResponse *root;
  uint64_t v17;
  uint64_t v18;
  siri::speech::schema_fb::TextToSpeechSpeechFeatureResponse *v19;
  FTTextToSpeechSpeechFeatureResponse *v20;
  _QWORD v22[2];
  __int128 v23;
  uint64_t v24;
  char v25;
  objc_super v26;

  v5 = a5;
  v9 = a3;
  v26.receiver = self;
  v26.super_class = (Class)FTTextToSpeechSpeechFeatureResponse;
  v10 = -[FTTextToSpeechSpeechFeatureResponse init](&v26, sel_init);
  if (!v10)
    goto LABEL_13;
  if (!v9 || !objc_msgSend(v9, "length"))
    goto LABEL_14;
  p_data = (id *)&v10->_data;
  objc_storeStrong((id *)&v10->_data, a3);
  if (!a4)
  {
    v12 = (unsigned int *)objc_msgSend(*p_data, "bytes");
    a4 = (const TextToSpeechSpeechFeatureResponse *)v12 + *v12;
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
  v19 = (siri::speech::schema_fb::TextToSpeechSpeechFeatureResponse *)v10->_root;
  if (!v19)
    goto LABEL_13;
  if (!siri::speech::schema_fb::TextToSpeechSpeechFeatureResponse::Verify(v19, (apple::aiml::flatbuffers2::Verifier *)v22))LABEL_14:v20 = 0;
  else
LABEL_13:
    v20 = v10;

  return v20;
}

- (NSString)speech_id
{
  const TextToSpeechSpeechFeatureResponse *root;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  const TextToSpeechSpeechFeatureResponse *v6;

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
  const TextToSpeechSpeechFeatureResponse *root;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  const TextToSpeechSpeechFeatureResponse *v6;

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

- (int)error_code
{
  const TextToSpeechSpeechFeatureResponse *root;
  const TextToSpeechSpeechFeatureResponse *v3;
  uint64_t v4;

  root = self->_root;
  v3 = &root[-*(int *)root->var0];
  if (*(unsigned __int16 *)v3->var0 >= 9u && (v4 = *(unsigned __int16 *)v3[8].var0) != 0)
    return *(_DWORD *)root[v4].var0;
  else
    return 0;
}

- (NSString)error_str
{
  const TextToSpeechSpeechFeatureResponse *root;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  const TextToSpeechSpeechFeatureResponse *v6;

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

- (NSArray)features
{
  id v3;
  void *v4;
  _QWORD v6[4];
  id v7;

  -[NSMutableDictionary objectForKeyedSubscript:](self->_storage, "objectForKeyedSubscript:", CFSTR("features"));
  v3 = (id)objc_claimAutoreleasedReturnValue();
  if (!v3)
  {
    objc_msgSend(MEMORY[0x24BDBCEB8], "array");
    v4 = (void *)objc_claimAutoreleasedReturnValue();
    v6[0] = MEMORY[0x24BDAC760];
    v6[1] = 3221225472;
    v6[2] = __47__FTTextToSpeechSpeechFeatureResponse_features__block_invoke;
    v6[3] = &unk_251A14A10;
    v3 = v4;
    v7 = v3;
    -[FTTextToSpeechSpeechFeatureResponse features_enumerateObjectsUsingBlock:](self, "features_enumerateObjectsUsingBlock:", v6);
    -[NSMutableDictionary setObject:forKeyedSubscript:](self->_storage, "setObject:forKeyedSubscript:", v3, CFSTR("features"));

  }
  return (NSArray *)v3;
}

uint64_t __47__FTTextToSpeechSpeechFeatureResponse_features__block_invoke(uint64_t a1, uint64_t a2)
{
  return objc_msgSend(*(id *)(a1 + 32), "addObject:", a2);
}

- (id)features_objectAtIndex:(unint64_t)a3
{
  void *v5;
  void *v6;
  FTTextToSpeechSpeechFeatureOutputFeature *v7;
  FTTextToSpeechSpeechFeatureOutputFeature *v8;
  const TextToSpeechSpeechFeatureResponse *root;
  const TextToSpeechSpeechFeatureResponse *v10;
  uint64_t v11;
  uint64_t v12;

  -[NSMutableDictionary objectForKeyedSubscript:](self->_storage, "objectForKeyedSubscript:", CFSTR("features"));
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  v6 = v5;
  if (v5)
  {
    objc_msgSend(v5, "objectAtIndexedSubscript:", a3);
    v7 = (FTTextToSpeechSpeechFeatureOutputFeature *)objc_claimAutoreleasedReturnValue();
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
    v12 = (uint64_t)&root[4 * a3 + v11 + *(unsigned int *)root[v11].var0];
    v7 = -[FTTextToSpeechSpeechFeatureOutputFeature initWithFlatbuffData:root:verify:]([FTTextToSpeechSpeechFeatureOutputFeature alloc], "initWithFlatbuffData:root:verify:", self->_data, v12 + 4 + *(unsigned int *)(v12 + 4), 0);
  }
  v8 = v7;
LABEL_8:

  return v8;
}

- (unint64_t)features_count
{
  void *v3;
  void *v4;
  unint64_t v5;
  const TextToSpeechSpeechFeatureResponse *root;
  const TextToSpeechSpeechFeatureResponse *v7;
  uint64_t v8;

  -[NSMutableDictionary objectForKeyedSubscript:](self->_storage, "objectForKeyedSubscript:", CFSTR("features"));
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

- (void)features_enumerateObjectsUsingBlock:(id)a3
{
  void (**v4)(id, FTTextToSpeechSpeechFeatureOutputFeature *, uint64_t, unsigned __int8 *);
  void *v5;
  void *v6;
  const TextToSpeechSpeechFeatureResponse *root;
  const TextToSpeechSpeechFeatureResponse *v8;
  uint64_t v9;
  const TextToSpeechSpeechFeatureResponse *v10;
  uint64_t v11;
  uint64_t v12;
  uint64_t v13;
  uint64_t v14;
  uint64_t v15;
  uint64_t v16;
  FTTextToSpeechSpeechFeatureOutputFeature *v17;
  int v18;
  uint64_t v19;
  unsigned __int8 v20;

  v4 = (void (**)(id, FTTextToSpeechSpeechFeatureOutputFeature *, uint64_t, unsigned __int8 *))a3;
  -[NSMutableDictionary objectForKeyedSubscript:](self->_storage, "objectForKeyedSubscript:", CFSTR("features"));
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
            v17 = -[FTTextToSpeechSpeechFeatureOutputFeature initWithFlatbuffData:root:verify:]([FTTextToSpeechSpeechFeatureOutputFeature alloc], "initWithFlatbuffData:root:verify:", self->_data, v13 + v14 + *(unsigned int *)(v13 + 4 * v15), 0);
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

- (Offset<siri::speech::schema_fb::TextToSpeechSpeechFeatureResponse>)addObjectToBuffer:(void *)a3
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
  int v15;
  __CFString *v16;
  __CFString *v17;
  const char *v18;
  size_t v19;
  void *v20;
  void *v21;
  uint64_t v22;
  uint64_t v23;
  uint64_t i;
  int v25;
  int v26;
  std::vector<int>::pointer end;
  int *v28;
  std::vector<int>::pointer begin;
  int64_t v30;
  unint64_t v31;
  int64_t v32;
  unint64_t v33;
  char *v34;
  int *v35;
  int v36;
  std::vector<int>::pointer v37;
  int v38;
  int v39;
  int v40;
  int v41;
  Offset<siri::speech::schema_fb::TextToSpeechSpeechFeatureResponse> v42;
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
  -[FTTextToSpeechSpeechFeatureResponse speech_id](self, "speech_id");
  v5 = (__CFString *)objc_claimAutoreleasedReturnValue();
  v6 = v5;
  if (!v5)
    v5 = &stru_251A15610;
  v7 = (const char *)-[__CFString UTF8String](objc_retainAutorelease(v5), "UTF8String");
  v8 = strlen(v7);
  String = apple::aiml::flatbuffers2::FlatBufferBuilder::CreateString((apple::aiml::flatbuffers2::FlatBufferBuilder *)a3, v7, v8);

  -[FTTextToSpeechSpeechFeatureResponse session_id](self, "session_id");
  v10 = (__CFString *)objc_claimAutoreleasedReturnValue();
  v11 = v10;
  if (!v10)
    v10 = &stru_251A15610;
  v12 = (const char *)-[__CFString UTF8String](objc_retainAutorelease(v10), "UTF8String");
  v13 = strlen(v12);
  v14 = apple::aiml::flatbuffers2::FlatBufferBuilder::CreateString((apple::aiml::flatbuffers2::FlatBufferBuilder *)a3, v12, v13);

  v15 = -[FTTextToSpeechSpeechFeatureResponse error_code](self, "error_code");
  -[FTTextToSpeechSpeechFeatureResponse error_str](self, "error_str");
  v16 = (__CFString *)objc_claimAutoreleasedReturnValue();
  v17 = v16;
  if (!v16)
    v16 = &stru_251A15610;
  v18 = (const char *)-[__CFString UTF8String](objc_retainAutorelease(v16), "UTF8String");
  v19 = strlen(v18);
  LODWORD(v18) = apple::aiml::flatbuffers2::FlatBufferBuilder::CreateString((apple::aiml::flatbuffers2::FlatBufferBuilder *)a3, v18, v19);

  memset(&v52, 0, sizeof(v52));
  -[FTTextToSpeechSpeechFeatureResponse features](self, "features");
  v20 = (void *)objc_claimAutoreleasedReturnValue();
  std::vector<apple::aiml::flatbuffers2::Offset<siri::speech::schema_fb::RecognitionToken>>::reserve(&v52, objc_msgSend(v20, "count"));

  v50 = 0u;
  v51 = 0u;
  v48 = 0u;
  v49 = 0u;
  -[FTTextToSpeechSpeechFeatureResponse features](self, "features");
  v21 = (void *)objc_claimAutoreleasedReturnValue();
  v44 = (int)v18;
  v45 = v14;
  v46 = v15;
  v47 = String;
  v22 = objc_msgSend(v21, "countByEnumeratingWithState:objects:count:", &v48, v53, 16);
  if (v22)
  {
    v23 = *(_QWORD *)v49;
    do
    {
      for (i = 0; i != v22; ++i)
      {
        if (*(_QWORD *)v49 != v23)
          objc_enumerationMutation(v21);
        v25 = objc_msgSend(*(id *)(*((_QWORD *)&v48 + 1) + 8 * i), "addObjectToBuffer:", a3);
        v26 = v25;
        end = v52.__end_;
        if (v52.__end_ >= v52.__end_cap_.__value_)
        {
          begin = v52.__begin_;
          v30 = v52.__end_ - v52.__begin_;
          v31 = v30 + 1;
          if ((unint64_t)(v30 + 1) >> 62)
            std::vector<unsigned short>::__throw_length_error[abi:ne180100]();
          v32 = (char *)v52.__end_cap_.__value_ - (char *)v52.__begin_;
          if (((char *)v52.__end_cap_.__value_ - (char *)v52.__begin_) >> 1 > v31)
            v31 = v32 >> 1;
          if ((unint64_t)v32 >= 0x7FFFFFFFFFFFFFFCLL)
            v33 = 0x3FFFFFFFFFFFFFFFLL;
          else
            v33 = v31;
          if (v33)
          {
            v34 = (char *)std::__allocate_at_least[abi:ne180100]<std::allocator<apple::aiml::flatbuffers2::Offset<siri::speech::schema_fb::RecognitionToken>>>((uint64_t)&v52.__end_cap_, v33);
            begin = v52.__begin_;
            end = v52.__end_;
          }
          else
          {
            v34 = 0;
          }
          v35 = (int *)&v34[4 * v30];
          *v35 = v26;
          v28 = v35 + 1;
          while (end != begin)
          {
            v36 = *--end;
            *--v35 = v36;
          }
          v52.__begin_ = v35;
          v52.__end_ = v28;
          v52.__end_cap_.__value_ = (int *)&v34[4 * v33];
          if (begin)
            operator delete(begin);
        }
        else
        {
          *v52.__end_ = v25;
          v28 = end + 1;
        }
        v52.__end_ = v28;
      }
      v22 = objc_msgSend(v21, "countByEnumeratingWithState:objects:count:", &v48, v53, 16);
    }
    while (v22);
  }

  if (v52.__end_ == v52.__begin_)
    v37 = (std::vector<int>::pointer)&apple::aiml::flatbuffers2::data<apple::aiml::flatbuffers2::Offset<siri::speech::schema_fb::TextToSpeechSpeechFeatureOutputFeature>,std::allocator<apple::aiml::flatbuffers2::Offset<siri::speech::schema_fb::TextToSpeechSpeechFeatureOutputFeature>>>(std::vector<apple::aiml::flatbuffers2::Offset<siri::speech::schema_fb::TextToSpeechSpeechFeatureOutputFeature>> const&)::t;
  else
    v37 = v52.__begin_;
  v38 = apple::aiml::flatbuffers2::FlatBufferBuilder::CreateVector<apple::aiml::flatbuffers2::String>((apple::aiml::flatbuffers2::FlatBufferBuilder *)a3, (uint64_t)v37, v52.__end_ - v52.__begin_);
  *((_BYTE *)a3 + 70) = 1;
  v39 = *((_DWORD *)a3 + 8);
  v40 = *((_DWORD *)a3 + 12);
  v41 = *((_DWORD *)a3 + 10);
  apple::aiml::flatbuffers2::FlatBufferBuilder::AddOffset<apple::aiml::flatbuffers2::String>((char *)a3, 4, v47);
  apple::aiml::flatbuffers2::FlatBufferBuilder::AddOffset<apple::aiml::flatbuffers2::String>((char *)a3, 6, v45);
  apple::aiml::flatbuffers2::FlatBufferBuilder::AddElement<unsigned int>((char *)a3, 8, v46, 0);
  apple::aiml::flatbuffers2::FlatBufferBuilder::AddOffset<apple::aiml::flatbuffers2::String>((char *)a3, 10, v44);
  apple::aiml::flatbuffers2::FlatBufferBuilder::AddOffset<apple::aiml::flatbuffers2::String>((char *)a3, 12, v38);
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
  apple::aiml::flatbuffers2::FlatBufferBuilder::Finish((apple::aiml::flatbuffers2::FlatBufferBuilder *)&v11, -[FTTextToSpeechSpeechFeatureResponse addObjectToBuffer:](self, "addObjectToBuffer:", &v11), 0, 0);
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
  v10[2] = __51__FTTextToSpeechSpeechFeatureResponse_flatbuffData__block_invoke;
  v10[3] = &__block_descriptor_40_e12_v24__0_v8Q16l;
  v10[4] = v2;
  v8 = (void *)objc_msgSend(v7, "initWithBytesNoCopy:length:deallocator:", v5, v6, v10);
  apple::aiml::flatbuffers2::FlatBufferBuilder::~FlatBufferBuilder((apple::aiml::flatbuffers2::FlatBufferBuilder *)&v11);
  return v8;
}

apple::aiml::flatbuffers2::DetachedBuffer *__51__FTTextToSpeechSpeechFeatureResponse_flatbuffData__block_invoke(uint64_t a1)
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
