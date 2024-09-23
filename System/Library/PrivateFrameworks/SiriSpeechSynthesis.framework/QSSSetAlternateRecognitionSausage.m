@implementation QSSSetAlternateRecognitionSausage

- (QSSSetAlternateRecognitionSausage)initWithFlatbuffData:(id)a3
{
  return -[QSSSetAlternateRecognitionSausage initWithFlatbuffData:root:verify:](self, "initWithFlatbuffData:root:verify:", a3, 0, 0);
}

- (id)initAndVerifyWithFlatbuffData:(id)a3
{
  return -[QSSSetAlternateRecognitionSausage initWithFlatbuffData:root:verify:](self, "initWithFlatbuffData:root:verify:", a3, 0, 1);
}

- (QSSSetAlternateRecognitionSausage)initWithFlatbuffData:(id)a3 root:(const SetAlternateRecognitionSausage *)a4
{
  return -[QSSSetAlternateRecognitionSausage initWithFlatbuffData:root:verify:](self, "initWithFlatbuffData:root:verify:", a3, a4, 0);
}

- (QSSSetAlternateRecognitionSausage)initWithFlatbuffData:(id)a3 root:(const SetAlternateRecognitionSausage *)a4 verify:(BOOL)a5
{
  _BOOL4 v5;
  id v9;
  QSSSetAlternateRecognitionSausage *v10;
  QSSSetAlternateRecognitionSausage *v11;
  id *p_data;
  unsigned int *v13;
  unint64_t v14;
  uint64_t v15;
  unint64_t var0;
  uint64_t v18;
  unint64_t v19;
  siri::speech::schema_fb::RecognitionSausage *root;
  uint64_t v21;
  NSMutableDictionary *storage;
  QSSSetAlternateRecognitionSausage *v23;
  uint64_t v25;
  unint64_t v26;
  __int128 v27;
  uint64_t v28;
  uint64_t v29;
  objc_super v30;

  v5 = a5;
  v9 = a3;
  v30.receiver = self;
  v30.super_class = (Class)QSSSetAlternateRecognitionSausage;
  v10 = -[QSSSetAlternateRecognitionSausage init](&v30, sel_init);
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
      a4 = (const SetAlternateRecognitionSausage *)v13 + *v13;
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
      root = (siri::speech::schema_fb::RecognitionSausage *)v11->_root;
      if (root)
      {
        if (!siri::speech::schema_fb::RecognitionSausage::Verify(root, (flatbuffers::Verifier *)&v25))
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

- (NSArray)positional_tok_phrase_alt
{
  void *v3;
  const SetAlternateRecognitionSausage *root;
  const SetAlternateRecognitionSausage *v5;
  uint64_t v6;
  const SetAlternateRecognitionSausage *v7;
  uint64_t v8;
  uint64_t v9;
  const SetAlternateRecognitionSausage *v10;
  uint64_t v11;
  QSSRecognitionPhraseTokensAlternatives *v12;

  -[NSMutableDictionary objectForKeyedSubscript:](self->_storage, "objectForKeyedSubscript:", CFSTR("positional_tok_phrase_alt"));
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
            v12 = -[QSSRecognitionPhraseTokensAlternatives initWithFlatbuffData:root:verify:]([QSSRecognitionPhraseTokensAlternatives alloc], "initWithFlatbuffData:root:verify:", self->_data, &v10[*(unsigned int *)v10->var0], 0);
            objc_msgSend(v3, "addObject:", v12);

            v10 += 4;
            v11 -= 4;
          }
          while (v11);
        }
      }
    }
    -[NSMutableDictionary setObject:forKeyedSubscript:](self->_storage, "setObject:forKeyedSubscript:", v3, CFSTR("positional_tok_phrase_alt"));
  }
  return (NSArray *)v3;
}

- (Offset<siri::speech::schema_fb::SetAlternateRecognitionSausage>)addObjectToBuffer:(void *)a3
{
  void *v5;
  void *v6;
  uint64_t v7;
  int *begin;
  uint64_t v9;
  int *value;
  uint64_t i;
  int v12;
  int v13;
  std::vector<int>::pointer end;
  int *v15;
  uint64_t v16;
  unint64_t v17;
  unint64_t v18;
  uint64_t v19;
  int *v20;
  int v21;
  int *v22;
  unsigned int v23;
  uint64_t v24;
  uint64_t v25;
  uint64_t v26;
  Offset<siri::speech::schema_fb::SetAlternateRecognitionSausage> v27;
  id obj;
  __int128 v30;
  __int128 v31;
  __int128 v32;
  __int128 v33;
  std::vector<int> v34;
  _BYTE v35[128];
  uint64_t v36;

  v36 = *MEMORY[0x24BDAC8D0];
  memset(&v34, 0, sizeof(v34));
  -[QSSSetAlternateRecognitionSausage positional_tok_phrase_alt](self, "positional_tok_phrase_alt");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  std::vector<flatbuffers::Offset<siri::speech::schema_fb::RecognitionToken>>::reserve(&v34, objc_msgSend(v5, "count"));

  v32 = 0u;
  v33 = 0u;
  v30 = 0u;
  v31 = 0u;
  -[QSSSetAlternateRecognitionSausage positional_tok_phrase_alt](self, "positional_tok_phrase_alt");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  v7 = objc_msgSend(v6, "countByEnumeratingWithState:objects:count:", &v30, v35, 16);
  obj = v6;
  begin = v34.__begin_;
  if (v7)
  {
    v9 = *(_QWORD *)v31;
    value = v34.__end_cap_.__value_;
    do
    {
      for (i = 0; i != v7; ++i)
      {
        if (*(_QWORD *)v31 != v9)
          objc_enumerationMutation(obj);
        v12 = objc_msgSend(*(id *)(*((_QWORD *)&v30 + 1) + 8 * i), "addObjectToBuffer:", a3);
        v13 = v12;
        end = v34.__end_;
        if (v34.__end_ >= value)
        {
          v16 = v34.__end_ - begin;
          v17 = v16 + 1;
          if ((unint64_t)(v16 + 1) >> 62)
          {
            v34.__begin_ = begin;
            std::vector<flatbuffers::Offset<siri::speech::schema_fb::RecognitionToken>>::__throw_length_error[abi:ne180100]();
          }
          if (((char *)value - (char *)begin) >> 1 > v17)
            v17 = ((char *)value - (char *)begin) >> 1;
          if ((unint64_t)((char *)value - (char *)begin) >= 0x7FFFFFFFFFFFFFFCLL)
            v18 = 0x3FFFFFFFFFFFFFFFLL;
          else
            v18 = v17;
          if (v18)
            v18 = (unint64_t)std::__allocate_at_least[abi:ne180100]<std::allocator<flatbuffers::Offset<siri::speech::schema_fb::RecognitionToken>>>(v18);
          else
            v19 = 0;
          v20 = (int *)(v18 + 4 * v16);
          *v20 = v13;
          v15 = v20 + 1;
          while (end != begin)
          {
            v21 = *--end;
            *--v20 = v21;
          }
          value = (int *)(v18 + 4 * v19);
          v34.__end_ = v15;
          if (begin)
            operator delete(begin);
          begin = v20;
        }
        else
        {
          *v34.__end_ = v12;
          v15 = end + 1;
        }
        v34.__end_ = v15;
      }
      v34.__end_cap_.__value_ = value;
      v34.__begin_ = begin;
      v7 = objc_msgSend(obj, "countByEnumeratingWithState:objects:count:", &v30, v35, 16);
    }
    while (v7);
  }
  else
  {
    v15 = v34.__end_;
  }

  if (v15 == begin)
    v22 = (int *)&flatbuffers::data<flatbuffers::Offset<siri::speech::schema_fb::RecognitionPhraseTokensAlternatives>,std::allocator<flatbuffers::Offset<siri::speech::schema_fb::RecognitionPhraseTokensAlternatives>>>(std::vector<flatbuffers::Offset<siri::speech::schema_fb::RecognitionPhraseTokensAlternatives>> const&)::t;
  else
    v22 = begin;
  v23 = flatbuffers::FlatBufferBuilder::CreateVector<siri::speech::schema_fb::RecognitionToken>((flatbuffers::FlatBufferBuilder *)a3, (uint64_t)v22, v15 - begin);
  flatbuffers::FlatBufferBuilder::NotNested((uint64_t)a3);
  *((_BYTE *)a3 + 70) = 1;
  v24 = *((_QWORD *)a3 + 5);
  v25 = *((_QWORD *)a3 + 6);
  v26 = *((_QWORD *)a3 + 4);
  flatbuffers::FlatBufferBuilder::AddOffset<flatbuffers::Vector<flatbuffers::Offset<siri::speech::schema_fb::RecognitionPhraseTokensAlternatives>>>((flatbuffers::FlatBufferBuilder *)a3, v23);
  v27.var0 = flatbuffers::FlatBufferBuilder::EndTable((flatbuffers::FlatBufferBuilder *)a3, (int)v26 - (int)v25 + (int)v24);
  if (begin)
  {
    v34.__end_ = begin;
    operator delete(begin);
  }
  return v27;
}

- (id)flatbuffData
{
  Offset<siri::speech::schema_fb::SetAlternateRecognitionSausage> v2;
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
  v2.var0 = -[QSSSetAlternateRecognitionSausage addObjectToBuffer:](self, "addObjectToBuffer:", &v11);
  flatbuffers::FlatBufferBuilder::Finish((flatbuffers::FlatBufferBuilder *)&v11, v2.var0, v3);
  v4 = (flatbuffers::FlatBufferBuilder *)operator new();
  flatbuffers::FlatBufferBuilder::Release(v4, (uint64_t)&v11);
  v5 = objc_alloc(MEMORY[0x24BDBCE50]);
  v6 = *((_QWORD *)v4 + 4);
  v7 = *((_QWORD *)v4 + 5);
  v10[0] = MEMORY[0x24BDAC760];
  v10[1] = 3221225472;
  v10[2] = __49__QSSSetAlternateRecognitionSausage_flatbuffData__block_invoke;
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

flatbuffers::DetachedBuffer *__49__QSSSetAlternateRecognitionSausage_flatbuffData__block_invoke(uint64_t a1)
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
