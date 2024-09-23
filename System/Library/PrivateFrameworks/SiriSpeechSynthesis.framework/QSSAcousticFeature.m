@implementation QSSAcousticFeature

- (QSSAcousticFeature)initWithFlatbuffData:(id)a3
{
  return -[QSSAcousticFeature initWithFlatbuffData:root:verify:](self, "initWithFlatbuffData:root:verify:", a3, 0, 0);
}

- (id)initAndVerifyWithFlatbuffData:(id)a3
{
  return -[QSSAcousticFeature initWithFlatbuffData:root:verify:](self, "initWithFlatbuffData:root:verify:", a3, 0, 1);
}

- (QSSAcousticFeature)initWithFlatbuffData:(id)a3 root:(const AcousticFeature *)a4
{
  return -[QSSAcousticFeature initWithFlatbuffData:root:verify:](self, "initWithFlatbuffData:root:verify:", a3, a4, 0);
}

- (QSSAcousticFeature)initWithFlatbuffData:(id)a3 root:(const AcousticFeature *)a4 verify:(BOOL)a5
{
  _BOOL4 v5;
  id v9;
  QSSAcousticFeature *v10;
  QSSAcousticFeature *v11;
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
  QSSAcousticFeature *v23;
  uint64_t v25;
  unint64_t v26;
  __int128 v27;
  uint64_t v28;
  uint64_t v29;
  objc_super v30;

  v5 = a5;
  v9 = a3;
  v30.receiver = self;
  v30.super_class = (Class)QSSAcousticFeature;
  v10 = -[QSSAcousticFeature init](&v30, sel_init);
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
      a4 = (const AcousticFeature *)v13 + *v13;
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

- (NSArray)acoustic_feature_per_frame
{
  void *v3;
  double v4;
  const AcousticFeature *root;
  const AcousticFeature *v6;
  uint64_t v7;
  const AcousticFeature *v8;
  uint64_t v9;
  uint64_t v10;
  const AcousticFeature *v11;
  uint64_t v12;
  void *v13;

  -[NSMutableDictionary objectForKeyedSubscript:](self->_storage, "objectForKeyedSubscript:", CFSTR("acoustic_feature_per_frame"));
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  if (!v3)
  {
    objc_msgSend(MEMORY[0x24BDBCEB8], "array");
    v3 = (void *)objc_claimAutoreleasedReturnValue();
    root = self->_root;
    v6 = &root[-*(int *)root->var0];
    if (*(unsigned __int16 *)v6->var0 >= 5u)
    {
      v7 = *(unsigned __int16 *)v6[4].var0;
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
    -[NSMutableDictionary setObject:forKeyedSubscript:](self->_storage, "setObject:forKeyedSubscript:", v3, CFSTR("acoustic_feature_per_frame"));
  }
  return (NSArray *)v3;
}

- (float)frame_duration
{
  const AcousticFeature *root;
  const AcousticFeature *v3;
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

- (Offset<siri::speech::schema_fb::AcousticFeature>)addObjectToBuffer:(void *)a3
{
  void *v5;
  void *v6;
  uint64_t v7;
  _BYTE *v8;
  uint64_t v9;
  unint64_t v10;
  uint64_t i;
  int v12;
  int v13;
  char *v14;
  char *v15;
  uint64_t v16;
  unint64_t v17;
  unint64_t v18;
  uint64_t v19;
  _DWORD *v20;
  int v21;
  const void *v22;
  unsigned int v23;
  float v24;
  float v25;
  int v26;
  int v27;
  int v28;
  Offset<siri::speech::schema_fb::AcousticFeature> v29;
  QSSAcousticFeature *v31;
  flatbuffers::FlatBufferBuilder *v32;
  __int128 v33;
  __int128 v34;
  __int128 v35;
  __int128 v36;
  _BYTE *v37;
  char *v38;
  unint64_t v39;
  _BYTE v40[128];
  uint64_t v41;

  v41 = *MEMORY[0x24BDAC8D0];
  v37 = 0;
  v38 = 0;
  v39 = 0;
  -[QSSAcousticFeature acoustic_feature_per_frame](self, "acoustic_feature_per_frame");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  std::vector<float>::reserve((void **)&v37, objc_msgSend(v5, "count"));

  v35 = 0u;
  v36 = 0u;
  v33 = 0u;
  v34 = 0u;
  -[QSSAcousticFeature acoustic_feature_per_frame](self, "acoustic_feature_per_frame");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  v7 = objc_msgSend(v6, "countByEnumeratingWithState:objects:count:", &v33, v40, 16);
  v31 = self;
  v32 = (flatbuffers::FlatBufferBuilder *)a3;
  v8 = v37;
  if (v7)
  {
    v9 = *(_QWORD *)v34;
    v10 = v39;
    do
    {
      for (i = 0; i != v7; ++i)
      {
        if (*(_QWORD *)v34 != v9)
          objc_enumerationMutation(v6);
        objc_msgSend(*(id *)(*((_QWORD *)&v33 + 1) + 8 * i), "floatValue", v31);
        v13 = v12;
        v14 = v38;
        if ((unint64_t)v38 >= v10)
        {
          v16 = (v38 - v8) >> 2;
          v17 = v16 + 1;
          if ((unint64_t)(v16 + 1) >> 62)
          {
            v37 = v8;
            std::vector<flatbuffers::Offset<siri::speech::schema_fb::RecognitionToken>>::__throw_length_error[abi:ne180100]();
          }
          if ((uint64_t)(v10 - (_QWORD)v8) >> 1 > v17)
            v17 = (uint64_t)(v10 - (_QWORD)v8) >> 1;
          if (v10 - (unint64_t)v8 >= 0x7FFFFFFFFFFFFFFCLL)
            v18 = 0x3FFFFFFFFFFFFFFFLL;
          else
            v18 = v17;
          if (v18)
            v18 = (unint64_t)std::__allocate_at_least[abi:ne180100]<std::allocator<flatbuffers::Offset<siri::speech::schema_fb::RecognitionToken>>>(v18);
          else
            v19 = 0;
          v20 = (_DWORD *)(v18 + 4 * v16);
          *v20 = v13;
          v15 = (char *)(v20 + 1);
          while (v14 != v8)
          {
            v21 = *((_DWORD *)v14 - 1);
            v14 -= 4;
            *--v20 = v21;
          }
          v10 = v18 + 4 * v19;
          v38 = v15;
          if (v8)
            operator delete(v8);
          v8 = v20;
        }
        else
        {
          *(_DWORD *)v38 = v12;
          v15 = v14 + 4;
        }
        v38 = v15;
      }
      v39 = v10;
      v37 = v8;
      v7 = objc_msgSend(v6, "countByEnumeratingWithState:objects:count:", &v33, v40, 16);
    }
    while (v7);
  }
  else
  {
    v15 = v38;
  }

  if (v15 == v8)
    v22 = &flatbuffers::data<float,std::allocator<float>>(std::vector<float> const&)::t;
  else
    v22 = v8;
  v23 = flatbuffers::FlatBufferBuilder::CreateVector<int>(v32, v22, (v15 - v8) >> 2);
  -[QSSAcousticFeature frame_duration](v31, "frame_duration");
  v25 = v24;
  flatbuffers::FlatBufferBuilder::NotNested((uint64_t)v32);
  *((_BYTE *)v32 + 70) = 1;
  v26 = *((_DWORD *)v32 + 8);
  v27 = *((_DWORD *)v32 + 12);
  v28 = *((_DWORD *)v32 + 10);
  flatbuffers::FlatBufferBuilder::AddOffset<flatbuffers::Vector<unsigned char>>(v32, 4, v23);
  flatbuffers::FlatBufferBuilder::AddElement<float>(v32, 6, v25);
  v29.var0 = flatbuffers::FlatBufferBuilder::EndTable(v32, v26 - v27 + v28);
  if (v8)
  {
    v38 = v8;
    operator delete(v8);
  }
  return v29;
}

- (id)flatbuffData
{
  Offset<siri::speech::schema_fb::AcousticFeature> v2;
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
  v2.var0 = -[QSSAcousticFeature addObjectToBuffer:](self, "addObjectToBuffer:", &v11);
  flatbuffers::FlatBufferBuilder::Finish((flatbuffers::FlatBufferBuilder *)&v11, v2.var0, v3);
  v4 = (flatbuffers::FlatBufferBuilder *)operator new();
  flatbuffers::FlatBufferBuilder::Release(v4, (uint64_t)&v11);
  v5 = objc_alloc(MEMORY[0x24BDBCE50]);
  v6 = *((_QWORD *)v4 + 4);
  v7 = *((_QWORD *)v4 + 5);
  v10[0] = MEMORY[0x24BDAC760];
  v10[1] = 3221225472;
  v10[2] = __34__QSSAcousticFeature_flatbuffData__block_invoke;
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

flatbuffers::DetachedBuffer *__34__QSSAcousticFeature_flatbuffData__block_invoke(uint64_t a1)
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
