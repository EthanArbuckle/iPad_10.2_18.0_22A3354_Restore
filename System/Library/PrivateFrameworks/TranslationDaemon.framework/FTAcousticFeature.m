@implementation FTAcousticFeature

- (FTAcousticFeature)initWithFlatbuffData:(id)a3
{
  return -[FTAcousticFeature initWithFlatbuffData:root:verify:](self, "initWithFlatbuffData:root:verify:", a3, 0, 0);
}

- (id)initAndVerifyWithFlatbuffData:(id)a3
{
  return -[FTAcousticFeature initWithFlatbuffData:root:verify:](self, "initWithFlatbuffData:root:verify:", a3, 0, 1);
}

- (FTAcousticFeature)initWithFlatbuffData:(id)a3 root:(const AcousticFeature *)a4
{
  return -[FTAcousticFeature initWithFlatbuffData:root:verify:](self, "initWithFlatbuffData:root:verify:", a3, a4, 0);
}

- (FTAcousticFeature)initWithFlatbuffData:(id)a3 root:(const AcousticFeature *)a4 verify:(BOOL)a5
{
  _BOOL4 v5;
  id v9;
  FTAcousticFeature *v10;
  id *p_data;
  unsigned int *v12;
  unint64_t v13;
  uint64_t v14;
  const AcousticFeature *root;
  uint64_t v17;
  uint64_t v18;
  siri::speech::schema_fb::RecognitionChoice *v19;
  FTAcousticFeature *v20;
  _QWORD v22[2];
  __int128 v23;
  uint64_t v24;
  char v25;
  objc_super v26;

  v5 = a5;
  v9 = a3;
  v26.receiver = self;
  v26.super_class = (Class)FTAcousticFeature;
  v10 = -[FTAcousticFeature init](&v26, sel_init);
  if (!v10)
    goto LABEL_13;
  if (!v9 || !objc_msgSend(v9, "length"))
    goto LABEL_14;
  p_data = (id *)&v10->_data;
  objc_storeStrong((id *)&v10->_data, a3);
  if (!a4)
  {
    v12 = (unsigned int *)objc_msgSend(*p_data, "bytes");
    a4 = (const AcousticFeature *)v12 + *v12;
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
  v19 = (siri::speech::schema_fb::RecognitionChoice *)v10->_root;
  if (!v19)
    goto LABEL_13;
  if (!siri::speech::schema_fb::RecognitionChoice::Verify(v19, (apple::aiml::flatbuffers2::Verifier *)v22))
LABEL_14:
    v20 = 0;
  else
LABEL_13:
    v20 = v10;

  return v20;
}

- (NSArray)acoustic_feature_per_frame
{
  id v3;
  void *v4;
  _QWORD v6[4];
  id v7;

  -[NSMutableDictionary objectForKeyedSubscript:](self->_storage, "objectForKeyedSubscript:", CFSTR("acoustic_feature_per_frame"));
  v3 = (id)objc_claimAutoreleasedReturnValue();
  if (!v3)
  {
    objc_msgSend(MEMORY[0x24BDBCEB8], "array");
    v4 = (void *)objc_claimAutoreleasedReturnValue();
    v6[0] = MEMORY[0x24BDAC760];
    v6[1] = 3221225472;
    v6[2] = __47__FTAcousticFeature_acoustic_feature_per_frame__block_invoke;
    v6[3] = &unk_251A14A10;
    v3 = v4;
    v7 = v3;
    -[FTAcousticFeature acoustic_feature_per_frame_enumerateObjectsUsingBlock:](self, "acoustic_feature_per_frame_enumerateObjectsUsingBlock:", v6);
    -[NSMutableDictionary setObject:forKeyedSubscript:](self->_storage, "setObject:forKeyedSubscript:", v3, CFSTR("acoustic_feature_per_frame"));

  }
  return (NSArray *)v3;
}

uint64_t __47__FTAcousticFeature_acoustic_feature_per_frame__block_invoke(uint64_t a1, uint64_t a2)
{
  return objc_msgSend(*(id *)(a1 + 32), "addObject:", a2);
}

- (id)acoustic_feature_per_frame_objectAtIndex:(unint64_t)a3
{
  void *v5;
  double v6;
  void *v7;
  uint64_t v8;
  void *v9;
  const AcousticFeature *root;
  const AcousticFeature *v11;
  uint64_t v12;

  -[NSMutableDictionary objectForKeyedSubscript:](self->_storage, "objectForKeyedSubscript:", CFSTR("acoustic_feature_per_frame"));
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
    if (*(unsigned __int16 *)v11->var0 < 5u || (v12 = *(unsigned __int16 *)v11[4].var0) == 0)
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

- (unint64_t)acoustic_feature_per_frame_count
{
  void *v3;
  void *v4;
  unint64_t v5;
  const AcousticFeature *root;
  const AcousticFeature *v7;
  uint64_t v8;

  -[NSMutableDictionary objectForKeyedSubscript:](self->_storage, "objectForKeyedSubscript:", CFSTR("acoustic_feature_per_frame"));
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
    if (*(unsigned __int16 *)v7->var0 >= 5u && (v8 = *(unsigned __int16 *)v7[4].var0) != 0)
      v5 = *(unsigned int *)root[v8 + *(unsigned int *)root[v8].var0].var0;
    else
      v5 = 0;
  }

  return v5;
}

- (void)acoustic_feature_per_frame_enumerateObjectsUsingBlock:(id)a3
{
  void (**v4)(id, void *, uint64_t, unsigned __int8 *);
  void *v5;
  double v6;
  void *v7;
  const AcousticFeature *root;
  const AcousticFeature *v9;
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
  -[NSMutableDictionary objectForKeyedSubscript:](self->_storage, "objectForKeyedSubscript:", CFSTR("acoustic_feature_per_frame"));
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
    if (*(unsigned __int16 *)v9->var0 >= 5u)
    {
      v10 = *(unsigned __int16 *)v9[4].var0;
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
  uint64_t v8;
  uint64_t i;
  int v10;
  int v11;
  char *v12;
  char *v13;
  char *v14;
  uint64_t v15;
  unint64_t v16;
  uint64_t v17;
  unint64_t v18;
  char *v19;
  char *v20;
  int v21;
  const unsigned __int8 *v22;
  int v23;
  float v24;
  float v25;
  int v26;
  int v27;
  int v28;
  Offset<siri::speech::schema_fb::AcousticFeature> v29;
  __int128 v31;
  __int128 v32;
  __int128 v33;
  __int128 v34;
  void *__p;
  char *v36;
  char *v37;
  _BYTE v38[128];
  uint64_t v39;

  v39 = *MEMORY[0x24BDAC8D0];
  __p = 0;
  v36 = 0;
  v37 = 0;
  -[FTAcousticFeature acoustic_feature_per_frame](self, "acoustic_feature_per_frame");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  std::vector<float>::reserve(&__p, objc_msgSend(v5, "count"));

  v33 = 0u;
  v34 = 0u;
  v31 = 0u;
  v32 = 0u;
  -[FTAcousticFeature acoustic_feature_per_frame](self, "acoustic_feature_per_frame", 0);
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  v7 = objc_msgSend(v6, "countByEnumeratingWithState:objects:count:", &v31, v38, 16);
  if (v7)
  {
    v8 = *(_QWORD *)v32;
    do
    {
      for (i = 0; i != v7; ++i)
      {
        if (*(_QWORD *)v32 != v8)
          objc_enumerationMutation(v6);
        objc_msgSend(*(id *)(*((_QWORD *)&v31 + 1) + 8 * i), "floatValue");
        v11 = v10;
        v12 = v36;
        if (v36 >= v37)
        {
          v14 = (char *)__p;
          v15 = (v36 - (_BYTE *)__p) >> 2;
          v16 = v15 + 1;
          if ((unint64_t)(v15 + 1) >> 62)
            std::vector<unsigned short>::__throw_length_error[abi:ne180100]();
          v17 = v37 - (_BYTE *)__p;
          if ((v37 - (_BYTE *)__p) >> 1 > v16)
            v16 = v17 >> 1;
          if ((unint64_t)v17 >= 0x7FFFFFFFFFFFFFFCLL)
            v18 = 0x3FFFFFFFFFFFFFFFLL;
          else
            v18 = v16;
          if (v18)
          {
            v19 = (char *)std::__allocate_at_least[abi:ne180100]<std::allocator<apple::aiml::flatbuffers2::Offset<siri::speech::schema_fb::RecognitionToken>>>((uint64_t)&v37, v18);
            v14 = (char *)__p;
            v12 = v36;
          }
          else
          {
            v19 = 0;
          }
          v20 = &v19[4 * v15];
          *(_DWORD *)v20 = v11;
          v13 = v20 + 4;
          while (v12 != v14)
          {
            v21 = *((_DWORD *)v12 - 1);
            v12 -= 4;
            *((_DWORD *)v20 - 1) = v21;
            v20 -= 4;
          }
          __p = v20;
          v36 = v13;
          v37 = &v19[4 * v18];
          if (v14)
            operator delete(v14);
        }
        else
        {
          *(_DWORD *)v36 = v10;
          v13 = v12 + 4;
        }
        v36 = v13;
      }
      v7 = objc_msgSend(v6, "countByEnumeratingWithState:objects:count:", &v31, v38, 16);
    }
    while (v7);
  }

  if (v36 == __p)
    v22 = (const unsigned __int8 *)&apple::aiml::flatbuffers2::data<float,std::allocator<float>>(std::vector<float> const&)::t;
  else
    v22 = (const unsigned __int8 *)__p;
  v23 = apple::aiml::flatbuffers2::FlatBufferBuilder::CreateVector<int>((apple::aiml::flatbuffers2::FlatBufferBuilder *)a3, v22, (v36 - (_BYTE *)__p) >> 2);
  -[FTAcousticFeature frame_duration](self, "frame_duration");
  v25 = v24;
  *((_BYTE *)a3 + 70) = 1;
  v26 = *((_DWORD *)a3 + 8);
  v27 = *((_DWORD *)a3 + 12);
  v28 = *((_DWORD *)a3 + 10);
  apple::aiml::flatbuffers2::FlatBufferBuilder::AddOffset<apple::aiml::flatbuffers2::String>((char *)a3, 4, v23);
  apple::aiml::flatbuffers2::FlatBufferBuilder::AddElement<float>((char *)a3, 6, v25, 0.0);
  v29.var0 = apple::aiml::flatbuffers2::FlatBufferBuilder::EndTable((apple::aiml::flatbuffers2::FlatBufferBuilder *)a3, (unsigned __int16)v26 - (unsigned __int16)v27 + v28);
  if (__p)
  {
    v36 = (char *)__p;
    operator delete(__p);
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
  apple::aiml::flatbuffers2::FlatBufferBuilder::Finish((apple::aiml::flatbuffers2::FlatBufferBuilder *)&v11, -[FTAcousticFeature addObjectToBuffer:](self, "addObjectToBuffer:", &v11), 0, 0);
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
  v10[2] = __33__FTAcousticFeature_flatbuffData__block_invoke;
  v10[3] = &__block_descriptor_40_e12_v24__0_v8Q16l;
  v10[4] = v2;
  v8 = (void *)objc_msgSend(v7, "initWithBytesNoCopy:length:deallocator:", v5, v6, v10);
  apple::aiml::flatbuffers2::FlatBufferBuilder::~FlatBufferBuilder((apple::aiml::flatbuffers2::FlatBufferBuilder *)&v11);
  return v8;
}

apple::aiml::flatbuffers2::DetachedBuffer *__33__FTAcousticFeature_flatbuffData__block_invoke(uint64_t a1)
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
