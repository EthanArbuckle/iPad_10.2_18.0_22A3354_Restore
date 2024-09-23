@implementation QSSLanguageDetected

- (QSSLanguageDetected)initWithFlatbuffData:(id)a3
{
  return -[QSSLanguageDetected initWithFlatbuffData:root:verify:](self, "initWithFlatbuffData:root:verify:", a3, 0, 0);
}

- (id)initAndVerifyWithFlatbuffData:(id)a3
{
  return -[QSSLanguageDetected initWithFlatbuffData:root:verify:](self, "initWithFlatbuffData:root:verify:", a3, 0, 1);
}

- (QSSLanguageDetected)initWithFlatbuffData:(id)a3 root:(const LanguageDetected *)a4
{
  return -[QSSLanguageDetected initWithFlatbuffData:root:verify:](self, "initWithFlatbuffData:root:verify:", a3, a4, 0);
}

- (QSSLanguageDetected)initWithFlatbuffData:(id)a3 root:(const LanguageDetected *)a4 verify:(BOOL)a5
{
  _BOOL4 v5;
  id v9;
  QSSLanguageDetected *v10;
  QSSLanguageDetected *v11;
  id *p_data;
  unsigned int *v13;
  unint64_t v14;
  uint64_t v15;
  unint64_t var0;
  uint64_t v18;
  unint64_t v19;
  siri::speech::schema_fb::LanguageDetected *root;
  uint64_t v21;
  NSMutableDictionary *storage;
  QSSLanguageDetected *v23;
  uint64_t v25;
  unint64_t v26;
  __int128 v27;
  uint64_t v28;
  uint64_t v29;
  objc_super v30;

  v5 = a5;
  v9 = a3;
  v30.receiver = self;
  v30.super_class = (Class)QSSLanguageDetected;
  v10 = -[QSSLanguageDetected init](&v30, sel_init);
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
      a4 = (const LanguageDetected *)v13 + *v13;
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
      root = (siri::speech::schema_fb::LanguageDetected *)v11->_root;
      if (root)
      {
        if (!siri::speech::schema_fb::LanguageDetected::Verify(root, (flatbuffers::Verifier *)&v25))
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

- (NSString)detected_locale
{
  const LanguageDetected *root;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  const LanguageDetected *v6;

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

- (NSArray)predictions
{
  void *v3;
  const LanguageDetected *root;
  const LanguageDetected *v5;
  uint64_t v6;
  const LanguageDetected *v7;
  uint64_t v8;
  uint64_t v9;
  const LanguageDetected *v10;
  uint64_t v11;
  QSSLanguageDetectionPrediction *v12;

  -[NSMutableDictionary objectForKeyedSubscript:](self->_storage, "objectForKeyedSubscript:", CFSTR("predictions"));
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
            v12 = -[QSSLanguageDetectionPrediction initWithFlatbuffData:root:verify:]([QSSLanguageDetectionPrediction alloc], "initWithFlatbuffData:root:verify:", self->_data, &v10[*(unsigned int *)v10->var0], 0);
            objc_msgSend(v3, "addObject:", v12);

            v10 += 4;
            v11 -= 4;
          }
          while (v11);
        }
      }
    }
    -[NSMutableDictionary setObject:forKeyedSubscript:](self->_storage, "setObject:forKeyedSubscript:", v3, CFSTR("predictions"));
  }
  return (NSArray *)v3;
}

- (Offset<siri::speech::schema_fb::LanguageDetected>)addObjectToBuffer:(void *)a3
{
  __CFString *v5;
  __CFString *v6;
  const char *v7;
  size_t v8;
  void *v9;
  void *v10;
  uint64_t v11;
  int *begin;
  uint64_t v13;
  int *value;
  uint64_t i;
  int v16;
  int v17;
  std::vector<int>::pointer end;
  int *v19;
  uint64_t v20;
  unint64_t v21;
  unint64_t v22;
  uint64_t v23;
  int *v24;
  int v25;
  int *v26;
  unsigned int v27;
  int v28;
  int v29;
  int v30;
  Offset<siri::speech::schema_fb::LanguageDetected> v31;
  unsigned int v33;
  void *v34;
  __int128 v35;
  __int128 v36;
  __int128 v37;
  __int128 v38;
  std::vector<int> v39;
  _BYTE v40[128];
  uint64_t v41;

  v41 = *MEMORY[0x24BDAC8D0];
  -[QSSLanguageDetected detected_locale](self, "detected_locale");
  v5 = (__CFString *)objc_claimAutoreleasedReturnValue();
  v6 = v5;
  if (!v5)
    v5 = &stru_24E246F88;
  v7 = (const char *)-[__CFString UTF8String](objc_retainAutorelease(v5), "UTF8String");
  v8 = strlen(v7);
  LODWORD(v7) = flatbuffers::FlatBufferBuilder::CreateString((flatbuffers::FlatBufferBuilder *)a3, v7, v8);

  memset(&v39, 0, sizeof(v39));
  -[QSSLanguageDetected predictions](self, "predictions");
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  std::vector<flatbuffers::Offset<siri::speech::schema_fb::RecognitionToken>>::reserve(&v39, objc_msgSend(v9, "count"));

  v37 = 0u;
  v38 = 0u;
  v35 = 0u;
  v36 = 0u;
  -[QSSLanguageDetected predictions](self, "predictions");
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  v11 = objc_msgSend(v10, "countByEnumeratingWithState:objects:count:", &v35, v40, 16);
  v33 = v7;
  begin = v39.__begin_;
  if (v11)
  {
    v13 = *(_QWORD *)v36;
    value = v39.__end_cap_.__value_;
    v34 = v10;
    do
    {
      for (i = 0; i != v11; ++i)
      {
        if (*(_QWORD *)v36 != v13)
          objc_enumerationMutation(v10);
        v16 = objc_msgSend(*(id *)(*((_QWORD *)&v35 + 1) + 8 * i), "addObjectToBuffer:", a3);
        v17 = v16;
        end = v39.__end_;
        if (v39.__end_ >= value)
        {
          v20 = v39.__end_ - begin;
          v21 = v20 + 1;
          if ((unint64_t)(v20 + 1) >> 62)
          {
            v39.__begin_ = begin;
            std::vector<flatbuffers::Offset<siri::speech::schema_fb::RecognitionToken>>::__throw_length_error[abi:ne180100]();
          }
          if (((char *)value - (char *)begin) >> 1 > v21)
            v21 = ((char *)value - (char *)begin) >> 1;
          if ((unint64_t)((char *)value - (char *)begin) >= 0x7FFFFFFFFFFFFFFCLL)
            v22 = 0x3FFFFFFFFFFFFFFFLL;
          else
            v22 = v21;
          if (v22)
            v22 = (unint64_t)std::__allocate_at_least[abi:ne180100]<std::allocator<flatbuffers::Offset<siri::speech::schema_fb::RecognitionToken>>>(v22);
          else
            v23 = 0;
          v24 = (int *)(v22 + 4 * v20);
          *v24 = v17;
          v19 = v24 + 1;
          while (end != begin)
          {
            v25 = *--end;
            *--v24 = v25;
          }
          value = (int *)(v22 + 4 * v23);
          v39.__end_ = v19;
          if (begin)
            operator delete(begin);
          begin = v24;
          v10 = v34;
        }
        else
        {
          *v39.__end_ = v16;
          v19 = end + 1;
        }
        v39.__end_ = v19;
      }
      v39.__end_cap_.__value_ = value;
      v39.__begin_ = begin;
      v11 = objc_msgSend(v10, "countByEnumeratingWithState:objects:count:", &v35, v40, 16);
    }
    while (v11);
  }
  else
  {
    v19 = v39.__end_;
  }

  if (v19 == begin)
    v26 = (int *)&flatbuffers::data<flatbuffers::Offset<siri::speech::schema_fb::LanguageDetectionPrediction>,std::allocator<flatbuffers::Offset<siri::speech::schema_fb::LanguageDetectionPrediction>>>(std::vector<flatbuffers::Offset<siri::speech::schema_fb::LanguageDetectionPrediction>> const&)::t;
  else
    v26 = begin;
  v27 = flatbuffers::FlatBufferBuilder::CreateVector<siri::speech::schema_fb::RecognitionToken>((flatbuffers::FlatBufferBuilder *)a3, (uint64_t)v26, v19 - begin);
  flatbuffers::FlatBufferBuilder::NotNested((uint64_t)a3);
  *((_BYTE *)a3 + 70) = 1;
  v28 = *((_DWORD *)a3 + 8);
  v29 = *((_DWORD *)a3 + 12);
  v30 = *((_DWORD *)a3 + 10);
  flatbuffers::FlatBufferBuilder::AddOffset<flatbuffers::Vector<unsigned char>>((flatbuffers::FlatBufferBuilder *)a3, 4, v33);
  flatbuffers::FlatBufferBuilder::AddOffset<flatbuffers::Vector<unsigned char>>((flatbuffers::FlatBufferBuilder *)a3, 6, v27);
  v31.var0 = flatbuffers::FlatBufferBuilder::EndTable((flatbuffers::FlatBufferBuilder *)a3, v28 - v29 + v30);
  if (begin)
  {
    v39.__end_ = begin;
    operator delete(begin);
  }
  return v31;
}

- (id)flatbuffData
{
  Offset<siri::speech::schema_fb::LanguageDetected> v2;
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
  v2.var0 = -[QSSLanguageDetected addObjectToBuffer:](self, "addObjectToBuffer:", &v11);
  flatbuffers::FlatBufferBuilder::Finish((flatbuffers::FlatBufferBuilder *)&v11, v2.var0, v3);
  v4 = (flatbuffers::FlatBufferBuilder *)operator new();
  flatbuffers::FlatBufferBuilder::Release(v4, (uint64_t)&v11);
  v5 = objc_alloc(MEMORY[0x24BDBCE50]);
  v6 = *((_QWORD *)v4 + 4);
  v7 = *((_QWORD *)v4 + 5);
  v10[0] = MEMORY[0x24BDAC760];
  v10[1] = 3221225472;
  v10[2] = __35__QSSLanguageDetected_flatbuffData__block_invoke;
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

flatbuffers::DetachedBuffer *__35__QSSLanguageDetected_flatbuffData__block_invoke(uint64_t a1)
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
