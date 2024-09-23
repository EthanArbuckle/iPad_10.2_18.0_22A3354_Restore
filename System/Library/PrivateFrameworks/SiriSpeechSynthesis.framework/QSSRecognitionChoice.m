@implementation QSSRecognitionChoice

- (QSSRecognitionChoice)initWithFlatbuffData:(id)a3
{
  return -[QSSRecognitionChoice initWithFlatbuffData:root:verify:](self, "initWithFlatbuffData:root:verify:", a3, 0, 0);
}

- (id)initAndVerifyWithFlatbuffData:(id)a3
{
  return -[QSSRecognitionChoice initWithFlatbuffData:root:verify:](self, "initWithFlatbuffData:root:verify:", a3, 0, 1);
}

- (QSSRecognitionChoice)initWithFlatbuffData:(id)a3 root:(const RecognitionChoice *)a4
{
  return -[QSSRecognitionChoice initWithFlatbuffData:root:verify:](self, "initWithFlatbuffData:root:verify:", a3, a4, 0);
}

- (QSSRecognitionChoice)initWithFlatbuffData:(id)a3 root:(const RecognitionChoice *)a4 verify:(BOOL)a5
{
  _BOOL4 v5;
  id v9;
  QSSRecognitionChoice *v10;
  QSSRecognitionChoice *v11;
  id *p_data;
  unsigned int *v13;
  unint64_t v14;
  uint64_t v15;
  unint64_t var0;
  uint64_t v18;
  unint64_t v19;
  siri::speech::schema_fb::RecognitionChoice *root;
  uint64_t v21;
  NSMutableDictionary *storage;
  QSSRecognitionChoice *v23;
  uint64_t v25;
  unint64_t v26;
  __int128 v27;
  uint64_t v28;
  uint64_t v29;
  objc_super v30;

  v5 = a5;
  v9 = a3;
  v30.receiver = self;
  v30.super_class = (Class)QSSRecognitionChoice;
  v10 = -[QSSRecognitionChoice init](&v30, sel_init);
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
      a4 = (const RecognitionChoice *)v13 + *v13;
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
      root = (siri::speech::schema_fb::RecognitionChoice *)v11->_root;
      if (root)
      {
        if (!siri::speech::schema_fb::RecognitionChoice::Verify(root, (flatbuffers::Verifier *)&v25))
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

- (NSArray)alternative_index
{
  void *v3;
  const RecognitionChoice *root;
  const RecognitionChoice *v5;
  uint64_t v6;
  const RecognitionChoice *v7;
  uint64_t v8;
  uint64_t v9;
  unsigned int *var0;
  uint64_t v11;
  void *v12;

  -[NSMutableDictionary objectForKeyedSubscript:](self->_storage, "objectForKeyedSubscript:", CFSTR("alternative_index"));
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
        var0 = (unsigned int *)v7[v8 + 4].var0;
        v9 = *(unsigned int *)v7[v8].var0;
        if ((_DWORD)v9)
        {
          v11 = 4 * v9;
          do
          {
            objc_msgSend(MEMORY[0x24BDD16E0], "numberWithInt:", *var0);
            v12 = (void *)objc_claimAutoreleasedReturnValue();
            objc_msgSend(v3, "addObject:", v12);

            ++var0;
            v11 -= 4;
          }
          while (v11);
        }
      }
    }
    -[NSMutableDictionary setObject:forKeyedSubscript:](self->_storage, "setObject:forKeyedSubscript:", v3, CFSTR("alternative_index"));
  }
  return (NSArray *)v3;
}

- (int)confidence
{
  const RecognitionChoice *root;
  const RecognitionChoice *v3;
  uint64_t v4;

  root = self->_root;
  v3 = &root[-*(int *)root->var0];
  if (*(unsigned __int16 *)v3->var0 >= 7u && (v4 = *(unsigned __int16 *)v3[6].var0) != 0)
    return *(_DWORD *)root[v4].var0;
  else
    return 0;
}

- (Offset<siri::speech::schema_fb::RecognitionChoice>)addObjectToBuffer:(void *)a3
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
  int v24;
  int v25;
  int v26;
  int v27;
  Offset<siri::speech::schema_fb::RecognitionChoice> v28;
  QSSRecognitionChoice *v30;
  flatbuffers::FlatBufferBuilder *v31;
  __int128 v32;
  __int128 v33;
  __int128 v34;
  __int128 v35;
  std::vector<int> v36;
  _BYTE v37[128];
  uint64_t v38;

  v38 = *MEMORY[0x24BDAC8D0];
  memset(&v36, 0, sizeof(v36));
  -[QSSRecognitionChoice alternative_index](self, "alternative_index");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  std::vector<flatbuffers::Offset<siri::speech::schema_fb::RecognitionToken>>::reserve(&v36, objc_msgSend(v5, "count"));

  v34 = 0u;
  v35 = 0u;
  v32 = 0u;
  v33 = 0u;
  -[QSSRecognitionChoice alternative_index](self, "alternative_index");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  v7 = objc_msgSend(v6, "countByEnumeratingWithState:objects:count:", &v32, v37, 16);
  v30 = self;
  v31 = (flatbuffers::FlatBufferBuilder *)a3;
  begin = v36.__begin_;
  if (v7)
  {
    v9 = *(_QWORD *)v33;
    value = v36.__end_cap_.__value_;
    do
    {
      for (i = 0; i != v7; ++i)
      {
        if (*(_QWORD *)v33 != v9)
          objc_enumerationMutation(v6);
        v12 = objc_msgSend(*(id *)(*((_QWORD *)&v32 + 1) + 8 * i), "intValue", v30);
        v13 = v12;
        end = v36.__end_;
        if (v36.__end_ >= value)
        {
          v16 = v36.__end_ - begin;
          v17 = v16 + 1;
          if ((unint64_t)(v16 + 1) >> 62)
          {
            v36.__begin_ = begin;
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
          v36.__end_ = v15;
          if (begin)
            operator delete(begin);
          begin = v20;
        }
        else
        {
          *v36.__end_ = v12;
          v15 = end + 1;
        }
        v36.__end_ = v15;
      }
      v36.__end_cap_.__value_ = value;
      v36.__begin_ = begin;
      v7 = objc_msgSend(v6, "countByEnumeratingWithState:objects:count:", &v32, v37, 16);
    }
    while (v7);
  }
  else
  {
    v15 = v36.__end_;
  }

  if (v15 == begin)
    v22 = (int *)&flatbuffers::data<int,std::allocator<int>>(std::vector<int> const&)::t;
  else
    v22 = begin;
  v23 = flatbuffers::FlatBufferBuilder::CreateVector<int>(v31, v22, v15 - begin);
  v24 = -[QSSRecognitionChoice confidence](v30, "confidence");
  flatbuffers::FlatBufferBuilder::NotNested((uint64_t)v31);
  *((_BYTE *)v31 + 70) = 1;
  v25 = *((_DWORD *)v31 + 8);
  v26 = *((_DWORD *)v31 + 12);
  v27 = *((_DWORD *)v31 + 10);
  flatbuffers::FlatBufferBuilder::AddOffset<flatbuffers::Vector<unsigned char>>(v31, 4, v23);
  flatbuffers::FlatBufferBuilder::AddElement<unsigned int>((unint64_t)v31, 6, v24);
  v28.var0 = flatbuffers::FlatBufferBuilder::EndTable(v31, v25 - v26 + v27);
  if (begin)
  {
    v36.__end_ = begin;
    operator delete(begin);
  }
  return v28;
}

- (id)flatbuffData
{
  Offset<siri::speech::schema_fb::RecognitionChoice> v2;
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
  v2.var0 = -[QSSRecognitionChoice addObjectToBuffer:](self, "addObjectToBuffer:", &v11);
  flatbuffers::FlatBufferBuilder::Finish((flatbuffers::FlatBufferBuilder *)&v11, v2.var0, v3);
  v4 = (flatbuffers::FlatBufferBuilder *)operator new();
  flatbuffers::FlatBufferBuilder::Release(v4, (uint64_t)&v11);
  v5 = objc_alloc(MEMORY[0x24BDBCE50]);
  v6 = *((_QWORD *)v4 + 4);
  v7 = *((_QWORD *)v4 + 5);
  v10[0] = MEMORY[0x24BDAC760];
  v10[1] = 3221225472;
  v10[2] = __36__QSSRecognitionChoice_flatbuffData__block_invoke;
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

flatbuffers::DetachedBuffer *__36__QSSRecognitionChoice_flatbuffData__block_invoke(uint64_t a1)
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
