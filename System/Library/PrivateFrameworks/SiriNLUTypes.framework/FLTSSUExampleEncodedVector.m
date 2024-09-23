@implementation FLTSSUExampleEncodedVector

- (FLTSSUExampleEncodedVector)initWithFlatbuffData:(id)a3
{
  return -[FLTSSUExampleEncodedVector initWithFlatbuffData:root:verify:](self, "initWithFlatbuffData:root:verify:", a3, 0, 0);
}

- (id)initAndVerifyWithFlatbuffData:(id)a3
{
  return -[FLTSSUExampleEncodedVector initWithFlatbuffData:root:verify:](self, "initWithFlatbuffData:root:verify:", a3, 0, 1);
}

- (FLTSSUExampleEncodedVector)initWithFlatbuffData:(id)a3 root:(const SSUExampleEncodedVector *)a4
{
  return -[FLTSSUExampleEncodedVector initWithFlatbuffData:root:verify:](self, "initWithFlatbuffData:root:verify:", a3, a4, 0);
}

- (FLTSSUExampleEncodedVector)initWithFlatbuffData:(id)a3 root:(const SSUExampleEncodedVector *)a4 verify:(BOOL)a5
{
  _BOOL4 v5;
  id v9;
  FLTSSUExampleEncodedVector *v10;
  id *p_data;
  unsigned int *v12;
  unint64_t v13;
  uint64_t v14;
  const SSUExampleEncodedVector *root;
  uint64_t v17;
  unint64_t v18;
  SSUExampleEncodedVector *v19;
  FLTSSUExampleEncodedVector *v20;
  _QWORD v22[2];
  __int128 v23;
  uint64_t v24;
  char v25;
  objc_super v26;

  v5 = a5;
  v9 = a3;
  v26.receiver = self;
  v26.super_class = (Class)FLTSSUExampleEncodedVector;
  v10 = -[FLTSSUExampleEncodedVector init](&v26, sel_init);
  if (!v10)
    goto LABEL_14;
  if (!v9 || !objc_msgSend(v9, "length"))
    goto LABEL_15;
  p_data = (id *)&v10->_data;
  objc_storeStrong((id *)&v10->_data, a3);
  if (!a4)
  {
    v12 = (unsigned int *)objc_msgSend(*p_data, "bytes");
    a4 = (const SSUExampleEncodedVector *)v12 + *v12;
  }
  v10->_root = a4;
  if (!v5)
    goto LABEL_14;
  v13 = objc_msgSend(*p_data, "bytes");
  v14 = objc_msgSend(*p_data, "length");
  root = v10->_root;
  if ((unint64_t)root < v13 || (unint64_t)root > v13 + v14)
    goto LABEL_15;
  v17 = objc_msgSend(*p_data, "bytes");
  v18 = objc_msgSend(*p_data, "length");
  v22[0] = v17;
  v22[1] = v18;
  v23 = xmmword_1C2047DF0;
  v24 = 0;
  v25 = 1;
  if (v18 >= 0x7FFFFFFF)
    __assert_rtn("Verifier", "flatbuffers.h", 2285, "size_ < FLATBUFFERS_MAX_BUFFER_SIZE");
  v19 = (SSUExampleEncodedVector *)v10->_root;
  if (v19 && !SSUExampleEncodedVector::Verify(v19, (apple::aiml::flatbuffers2::Verifier *)v22))
LABEL_15:
    v20 = 0;
  else
LABEL_14:
    v20 = v10;

  return v20;
}

- (NSArray)data
{
  id v3;
  void *v4;
  _QWORD v6[4];
  id v7;

  -[NSMutableDictionary objectForKeyedSubscript:](self->_storage, "objectForKeyedSubscript:", CFSTR("data"));
  v3 = (id)objc_claimAutoreleasedReturnValue();
  if (!v3)
  {
    objc_msgSend(MEMORY[0x1E0C99DE8], "array");
    v4 = (void *)objc_claimAutoreleasedReturnValue();
    v6[0] = MEMORY[0x1E0C809B0];
    v6[1] = 3221225472;
    v6[2] = __34__FLTSSUExampleEncodedVector_data__block_invoke;
    v6[3] = &unk_1E7BB1588;
    v3 = v4;
    v7 = v3;
    -[FLTSSUExampleEncodedVector data_enumerateObjectsUsingBlock:](self, "data_enumerateObjectsUsingBlock:", v6);
    -[NSMutableDictionary setObject:forKeyedSubscript:](self->_storage, "setObject:forKeyedSubscript:", v3, CFSTR("data"));

  }
  return (NSArray *)v3;
}

- (id)data_objectAtIndex:(unint64_t)a3
{
  void *v5;
  double v6;
  void *v7;
  uint64_t v8;
  void *v9;
  const SSUExampleEncodedVector *root;
  const SSUExampleEncodedVector *v11;
  uint64_t v12;
  const SSUExampleEncodedVector *v13;

  -[NSMutableDictionary objectForKeyedSubscript:](self->_storage, "objectForKeyedSubscript:", CFSTR("data"));
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
      goto LABEL_9;
    }
    v13 = &root[v12 + *(unsigned int *)root[v12].var0];
    if (*(_DWORD *)v13->var0 <= a3)
      __assert_rtn("Get", "flatbuffers.h", 275, "i < size()");
    LODWORD(v6) = *(_DWORD *)v13[4 * a3 + 4].var0;
    objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithFloat:", v6);
    v8 = objc_claimAutoreleasedReturnValue();
  }
  v9 = (void *)v8;
LABEL_9:

  return v9;
}

- (unint64_t)data_count
{
  void *v3;
  void *v4;
  unint64_t v5;
  const SSUExampleEncodedVector *root;
  const SSUExampleEncodedVector *v7;
  uint64_t v8;

  -[NSMutableDictionary objectForKeyedSubscript:](self->_storage, "objectForKeyedSubscript:", CFSTR("data"));
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

- (void)data_enumerateObjectsUsingBlock:(id)a3
{
  void (**v4)(id, void *, uint64_t, unsigned __int8 *);
  void *v5;
  double v6;
  void *v7;
  const SSUExampleEncodedVector *root;
  const SSUExampleEncodedVector *v9;
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
  -[NSMutableDictionary objectForKeyedSubscript:](self->_storage, "objectForKeyedSubscript:", CFSTR("data"));
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
            objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithFloat:", v6);
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

- (Offset<SSUExampleEncodedVector>)addObjectToBuffer:(void *)a3
{
  void *v5;
  unint64_t v6;
  char *v7;
  uint64_t v8;
  char *v9;
  void *v10;
  uint64_t v11;
  uint64_t v12;
  char *v13;
  uint64_t i;
  int v15;
  int v16;
  uint64_t v17;
  unint64_t v18;
  unint64_t v19;
  uint64_t v20;
  char *v21;
  char *v22;
  int v23;
  uint64_t v24;
  char *v25;
  uint64_t v26;
  void *v27;
  unsigned int v28;
  uint64_t v29;
  uint64_t v30;
  uint64_t v31;
  int v32;
  Offset<SSUExampleEncodedVector> v33;
  apple::aiml::flatbuffers2::FlatBufferBuilder *v35;
  __int128 v36;
  __int128 v37;
  __int128 v38;
  __int128 v39;
  _BYTE v40[128];
  uint64_t v41;

  v41 = *MEMORY[0x1E0C80C00];
  -[FLTSSUExampleEncodedVector data](self, "data");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  v6 = objc_msgSend(v5, "count");
  if (v6)
  {
    if (v6 >> 62)
      std::vector<std::string>::__throw_length_error[abi:ne180100]();
    v7 = (char *)std::__allocate_at_least[abi:ne180100]<std::allocator<float>>(v6);
    v9 = &v7[4 * v8];
  }
  else
  {
    v7 = 0;
    v9 = 0;
  }

  v38 = 0u;
  v39 = 0u;
  v36 = 0u;
  v37 = 0u;
  -[FLTSSUExampleEncodedVector data](self, "data");
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  v11 = objc_msgSend(v10, "countByEnumeratingWithState:objects:count:", &v36, v40, 16);
  v35 = (apple::aiml::flatbuffers2::FlatBufferBuilder *)a3;
  if (v11)
  {
    v12 = *(_QWORD *)v37;
    v13 = v7;
    do
    {
      for (i = 0; i != v11; ++i)
      {
        if (*(_QWORD *)v37 != v12)
          objc_enumerationMutation(v10);
        objc_msgSend(*(id *)(*((_QWORD *)&v36 + 1) + 8 * i), "floatValue");
        v16 = v15;
        if (v13 >= v9)
        {
          v17 = (v13 - v7) >> 2;
          v18 = v17 + 1;
          if ((unint64_t)(v17 + 1) >> 62)
            std::vector<std::string>::__throw_length_error[abi:ne180100]();
          if ((v9 - v7) >> 1 > v18)
            v18 = (v9 - v7) >> 1;
          if ((unint64_t)(v9 - v7) >= 0x7FFFFFFFFFFFFFFCLL)
            v19 = 0x3FFFFFFFFFFFFFFFLL;
          else
            v19 = v18;
          if (v19)
            v19 = (unint64_t)std::__allocate_at_least[abi:ne180100]<std::allocator<float>>(v19);
          else
            v20 = 0;
          v21 = (char *)(v19 + 4 * v17);
          *(_DWORD *)v21 = v16;
          v22 = v21 + 4;
          while (v13 != v7)
          {
            v23 = *((_DWORD *)v13 - 1);
            v13 -= 4;
            *((_DWORD *)v21 - 1) = v23;
            v21 -= 4;
          }
          v9 = (char *)(v19 + 4 * v20);
          if (v7)
            operator delete(v7);
          v7 = v21;
          v13 = v22;
        }
        else
        {
          *(_DWORD *)v13 = v15;
          v13 += 4;
        }
      }
      v11 = objc_msgSend(v10, "countByEnumeratingWithState:objects:count:", &v36, v40, 16);
    }
    while (v11);
  }
  else
  {
    v13 = v7;
  }

  v24 = v13 - v7;
  if (v13 == v7)
    v25 = (char *)&apple::aiml::flatbuffers2::data<float,std::allocator<float>>(std::vector<float> const&)::t;
  else
    v25 = v7;
  v26 = v24 >> 2;
  apple::aiml::flatbuffers2::FlatBufferBuilder::StartVector(v35, v24 >> 2, 4uLL);
  if (v7 == v13)
  {
    LODWORD(v26) = 0;
  }
  else
  {
    apple::aiml::flatbuffers2::vector_downward::ensure_space(v35, v13 - v7);
    v27 = (void *)(*((_QWORD *)v35 + 6) - v24);
    *((_QWORD *)v35 + 6) = v27;
    memcpy(v27, v25, v13 - v7);
  }
  v28 = apple::aiml::flatbuffers2::FlatBufferBuilder::EndVector(v35, v26);
  apple::aiml::flatbuffers2::FlatBufferBuilder::NotNested((uint64_t)v35);
  *((_BYTE *)v35 + 70) = 1;
  v29 = *((_QWORD *)v35 + 5);
  v30 = *((_QWORD *)v35 + 6);
  v31 = *((_QWORD *)v35 + 4);
  if (v28)
  {
    v32 = apple::aiml::flatbuffers2::FlatBufferBuilder::ReferTo(v35, v28);
    apple::aiml::flatbuffers2::FlatBufferBuilder::AddElement<unsigned int>((unint64_t)v35, 4, v32, 0);
  }
  v33.var0 = apple::aiml::flatbuffers2::FlatBufferBuilder::EndTable(v35, (int)v31 - (int)v30 + (int)v29);
  if (v7)
    operator delete(v7);
  return v33;
}

- (id)flatbuffData
{
  Offset<SSUExampleEncodedVector> v2;
  const char *v3;
  apple::aiml::flatbuffers2::FlatBufferBuilder *v4;
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
  v13 = xmmword_1C2047E00;
  v14 = 0u;
  v15 = 0u;
  v16 = 0;
  v17 = 1;
  v18 = 256;
  v19 = 0;
  v2.var0 = -[FLTSSUExampleEncodedVector addObjectToBuffer:](self, "addObjectToBuffer:", &v11);
  apple::aiml::flatbuffers2::FlatBufferBuilder::Finish((apple::aiml::flatbuffers2::FlatBufferBuilder *)&v11, v2.var0, v3);
  v4 = (apple::aiml::flatbuffers2::FlatBufferBuilder *)operator new();
  apple::aiml::flatbuffers2::FlatBufferBuilder::Release(v4, (uint64_t)&v11);
  v5 = objc_alloc(MEMORY[0x1E0C99D50]);
  v6 = *((_QWORD *)v4 + 4);
  v7 = *((_QWORD *)v4 + 5);
  v10[0] = MEMORY[0x1E0C809B0];
  v10[1] = 3221225472;
  v10[2] = __42__FLTSSUExampleEncodedVector_flatbuffData__block_invoke;
  v10[3] = &__block_descriptor_40_e12_v24__0_v8Q16l;
  v10[4] = v4;
  v8 = (void *)objc_msgSend(v5, "initWithBytesNoCopy:length:deallocator:", v6, v7, v10);
  apple::aiml::flatbuffers2::FlatBufferBuilder::~FlatBufferBuilder((apple::aiml::flatbuffers2::FlatBufferBuilder *)&v11);
  return v8;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_data, 0);
  objc_storeStrong((id *)&self->_storage, 0);
}

apple::aiml::flatbuffers2::DetachedBuffer *__42__FLTSSUExampleEncodedVector_flatbuffData__block_invoke(uint64_t a1)
{
  apple::aiml::flatbuffers2::DetachedBuffer *result;

  result = *(apple::aiml::flatbuffers2::DetachedBuffer **)(a1 + 32);
  if (result)
  {
    apple::aiml::flatbuffers2::DetachedBuffer::~DetachedBuffer(result);
    JUMPOUT(0x1C3BB720CLL);
  }
  return result;
}

uint64_t __34__FLTSSUExampleEncodedVector_data__block_invoke(uint64_t a1, uint64_t a2)
{
  return objc_msgSend(*(id *)(a1 + 32), "addObject:", a2);
}

@end
