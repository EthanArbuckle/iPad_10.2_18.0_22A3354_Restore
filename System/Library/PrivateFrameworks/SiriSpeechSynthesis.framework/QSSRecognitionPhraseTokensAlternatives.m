@implementation QSSRecognitionPhraseTokensAlternatives

- (QSSRecognitionPhraseTokensAlternatives)initWithFlatbuffData:(id)a3
{
  return -[QSSRecognitionPhraseTokensAlternatives initWithFlatbuffData:root:verify:](self, "initWithFlatbuffData:root:verify:", a3, 0, 0);
}

- (id)initAndVerifyWithFlatbuffData:(id)a3
{
  return -[QSSRecognitionPhraseTokensAlternatives initWithFlatbuffData:root:verify:](self, "initWithFlatbuffData:root:verify:", a3, 0, 1);
}

- (QSSRecognitionPhraseTokensAlternatives)initWithFlatbuffData:(id)a3 root:(const RecognitionPhraseTokensAlternatives *)a4
{
  return -[QSSRecognitionPhraseTokensAlternatives initWithFlatbuffData:root:verify:](self, "initWithFlatbuffData:root:verify:", a3, a4, 0);
}

- (QSSRecognitionPhraseTokensAlternatives)initWithFlatbuffData:(id)a3 root:(const RecognitionPhraseTokensAlternatives *)a4 verify:(BOOL)a5
{
  _BOOL4 v5;
  id v9;
  QSSRecognitionPhraseTokensAlternatives *v10;
  QSSRecognitionPhraseTokensAlternatives *v11;
  id *p_data;
  unsigned int *v13;
  unint64_t v14;
  uint64_t v15;
  unint64_t var0;
  uint64_t v18;
  unint64_t v19;
  siri::speech::schema_fb::RecognitionPhraseTokensAlternatives *root;
  uint64_t v21;
  NSMutableDictionary *storage;
  QSSRecognitionPhraseTokensAlternatives *v23;
  uint64_t v25;
  unint64_t v26;
  __int128 v27;
  uint64_t v28;
  uint64_t v29;
  objc_super v30;

  v5 = a5;
  v9 = a3;
  v30.receiver = self;
  v30.super_class = (Class)QSSRecognitionPhraseTokensAlternatives;
  v10 = -[QSSRecognitionPhraseTokensAlternatives init](&v30, sel_init);
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
      a4 = (const RecognitionPhraseTokensAlternatives *)v13 + *v13;
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
      root = (siri::speech::schema_fb::RecognitionPhraseTokensAlternatives *)v11->_root;
      if (root)
      {
        if (!siri::speech::schema_fb::RecognitionPhraseTokensAlternatives::Verify(root, (flatbuffers::Verifier *)&v25))
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

- (NSArray)tok_phrases
{
  void *v3;
  const RecognitionPhraseTokensAlternatives *root;
  const RecognitionPhraseTokensAlternatives *v5;
  uint64_t v6;
  const RecognitionPhraseTokensAlternatives *v7;
  uint64_t v8;
  uint64_t v9;
  const RecognitionPhraseTokensAlternatives *v10;
  uint64_t v11;
  QSSRecognitionPhraseTokens *v12;

  -[NSMutableDictionary objectForKeyedSubscript:](self->_storage, "objectForKeyedSubscript:", CFSTR("tok_phrases"));
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
            v12 = -[QSSRecognitionPhraseTokens initWithFlatbuffData:root:verify:]([QSSRecognitionPhraseTokens alloc], "initWithFlatbuffData:root:verify:", self->_data, &v10[*(unsigned int *)v10->var0], 0);
            objc_msgSend(v3, "addObject:", v12);

            v10 += 4;
            v11 -= 4;
          }
          while (v11);
        }
      }
    }
    -[NSMutableDictionary setObject:forKeyedSubscript:](self->_storage, "setObject:forKeyedSubscript:", v3, CFSTR("tok_phrases"));
  }
  return (NSArray *)v3;
}

- (BOOL)has_unsuggested_alternatives
{
  const RecognitionPhraseTokensAlternatives *root;
  const RecognitionPhraseTokensAlternatives *v3;
  uint64_t v4;

  root = self->_root;
  v3 = &root[-*(int *)root->var0];
  return *(unsigned __int16 *)v3->var0 >= 7u && (v4 = *(unsigned __int16 *)v3[6].var0) != 0 && root[v4].var0[0] != 0;
}

- (Offset<siri::speech::schema_fb::RecognitionPhraseTokensAlternatives>)addObjectToBuffer:(void *)a3
{
  void *v5;
  uint64_t v6;
  int *begin;
  uint64_t v8;
  int *value;
  uint64_t i;
  int v11;
  int v12;
  std::vector<int>::pointer end;
  int *v14;
  uint64_t v15;
  unint64_t v16;
  unint64_t v17;
  uint64_t v18;
  int *v19;
  int v20;
  int *v21;
  unsigned int v22;
  int v23;
  int v24;
  int v25;
  int v26;
  Offset<siri::speech::schema_fb::RecognitionPhraseTokensAlternatives> v27;
  QSSRecognitionPhraseTokensAlternatives *v29;
  id obj;
  __int128 v31;
  __int128 v32;
  __int128 v33;
  __int128 v34;
  std::vector<int> v35;
  _BYTE v36[128];
  uint64_t v37;

  v37 = *MEMORY[0x24BDAC8D0];
  memset(&v35, 0, sizeof(v35));
  -[QSSRecognitionPhraseTokensAlternatives tok_phrases](self, "tok_phrases");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  std::vector<flatbuffers::Offset<siri::speech::schema_fb::RecognitionToken>>::reserve(&v35, objc_msgSend(v5, "count"));

  v33 = 0u;
  v34 = 0u;
  v31 = 0u;
  v32 = 0u;
  -[QSSRecognitionPhraseTokensAlternatives tok_phrases](self, "tok_phrases");
  obj = (id)objc_claimAutoreleasedReturnValue();
  v6 = objc_msgSend(obj, "countByEnumeratingWithState:objects:count:", &v31, v36, 16);
  v29 = self;
  begin = v35.__begin_;
  if (v6)
  {
    v8 = *(_QWORD *)v32;
    value = v35.__end_cap_.__value_;
    do
    {
      for (i = 0; i != v6; ++i)
      {
        if (*(_QWORD *)v32 != v8)
          objc_enumerationMutation(obj);
        v11 = objc_msgSend(*(id *)(*((_QWORD *)&v31 + 1) + 8 * i), "addObjectToBuffer:", a3, v29);
        v12 = v11;
        end = v35.__end_;
        if (v35.__end_ >= value)
        {
          v15 = v35.__end_ - begin;
          v16 = v15 + 1;
          if ((unint64_t)(v15 + 1) >> 62)
          {
            v35.__begin_ = begin;
            std::vector<flatbuffers::Offset<siri::speech::schema_fb::RecognitionToken>>::__throw_length_error[abi:ne180100]();
          }
          if (((char *)value - (char *)begin) >> 1 > v16)
            v16 = ((char *)value - (char *)begin) >> 1;
          if ((unint64_t)((char *)value - (char *)begin) >= 0x7FFFFFFFFFFFFFFCLL)
            v17 = 0x3FFFFFFFFFFFFFFFLL;
          else
            v17 = v16;
          if (v17)
            v17 = (unint64_t)std::__allocate_at_least[abi:ne180100]<std::allocator<flatbuffers::Offset<siri::speech::schema_fb::RecognitionToken>>>(v17);
          else
            v18 = 0;
          v19 = (int *)(v17 + 4 * v15);
          *v19 = v12;
          v14 = v19 + 1;
          while (end != begin)
          {
            v20 = *--end;
            *--v19 = v20;
          }
          value = (int *)(v17 + 4 * v18);
          v35.__end_ = v14;
          if (begin)
            operator delete(begin);
          begin = v19;
        }
        else
        {
          *v35.__end_ = v11;
          v14 = end + 1;
        }
        v35.__end_ = v14;
      }
      v35.__end_cap_.__value_ = value;
      v35.__begin_ = begin;
      v6 = objc_msgSend(obj, "countByEnumeratingWithState:objects:count:", &v31, v36, 16);
    }
    while (v6);
  }
  else
  {
    v14 = v35.__end_;
  }

  if (v14 == begin)
    v21 = (int *)&flatbuffers::data<flatbuffers::Offset<siri::speech::schema_fb::RecognitionPhraseTokens>,std::allocator<flatbuffers::Offset<siri::speech::schema_fb::RecognitionPhraseTokens>>>(std::vector<flatbuffers::Offset<siri::speech::schema_fb::RecognitionPhraseTokens>> const&)::t;
  else
    v21 = begin;
  v22 = flatbuffers::FlatBufferBuilder::CreateVector<siri::speech::schema_fb::RecognitionToken>((flatbuffers::FlatBufferBuilder *)a3, (uint64_t)v21, v14 - begin);
  v23 = -[QSSRecognitionPhraseTokensAlternatives has_unsuggested_alternatives](v29, "has_unsuggested_alternatives");
  flatbuffers::FlatBufferBuilder::NotNested((uint64_t)a3);
  *((_BYTE *)a3 + 70) = 1;
  v24 = *((_DWORD *)a3 + 8);
  v25 = *((_DWORD *)a3 + 12);
  v26 = *((_DWORD *)a3 + 10);
  flatbuffers::FlatBufferBuilder::AddOffset<flatbuffers::Vector<unsigned char>>((flatbuffers::FlatBufferBuilder *)a3, 4, v22);
  flatbuffers::FlatBufferBuilder::AddElement<unsigned char>((flatbuffers::vector_downward *)a3, 6, v23);
  v27.var0 = flatbuffers::FlatBufferBuilder::EndTable((flatbuffers::FlatBufferBuilder *)a3, v24 - v25 + v26);
  if (begin)
  {
    v35.__end_ = begin;
    operator delete(begin);
  }
  return v27;
}

- (id)flatbuffData
{
  Offset<siri::speech::schema_fb::RecognitionPhraseTokensAlternatives> v2;
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
  v2.var0 = -[QSSRecognitionPhraseTokensAlternatives addObjectToBuffer:](self, "addObjectToBuffer:", &v11);
  flatbuffers::FlatBufferBuilder::Finish((flatbuffers::FlatBufferBuilder *)&v11, v2.var0, v3);
  v4 = (flatbuffers::FlatBufferBuilder *)operator new();
  flatbuffers::FlatBufferBuilder::Release(v4, (uint64_t)&v11);
  v5 = objc_alloc(MEMORY[0x24BDBCE50]);
  v6 = *((_QWORD *)v4 + 4);
  v7 = *((_QWORD *)v4 + 5);
  v10[0] = MEMORY[0x24BDAC760];
  v10[1] = 3221225472;
  v10[2] = __54__QSSRecognitionPhraseTokensAlternatives_flatbuffData__block_invoke;
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

flatbuffers::DetachedBuffer *__54__QSSRecognitionPhraseTokensAlternatives_flatbuffData__block_invoke(uint64_t a1)
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
