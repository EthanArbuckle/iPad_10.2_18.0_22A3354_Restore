@implementation FLTCDMCATIBloomFilters

- (FLTCDMCATIBloomFilters)initWithFlatbuffData:(id)a3
{
  return -[FLTCDMCATIBloomFilters initWithFlatbuffData:root:verify:](self, "initWithFlatbuffData:root:verify:", a3, 0, 0);
}

- (id)initAndVerifyWithFlatbuffData:(id)a3
{
  return -[FLTCDMCATIBloomFilters initWithFlatbuffData:root:verify:](self, "initWithFlatbuffData:root:verify:", a3, 0, 1);
}

- (FLTCDMCATIBloomFilters)initWithFlatbuffData:(id)a3 root:(const CDMCATIBloomFilters *)a4
{
  return -[FLTCDMCATIBloomFilters initWithFlatbuffData:root:verify:](self, "initWithFlatbuffData:root:verify:", a3, a4, 0);
}

- (FLTCDMCATIBloomFilters)initWithFlatbuffData:(id)a3 root:(const CDMCATIBloomFilters *)a4 verify:(BOOL)a5
{
  _BOOL4 v5;
  id v9;
  FLTCDMCATIBloomFilters *v10;
  id *p_data;
  unsigned int *v12;
  unint64_t v13;
  uint64_t v14;
  const CDMCATIBloomFilters *root;
  uint64_t v17;
  unint64_t v18;
  apple::aiml::flatbuffers2::Table *v19;
  unsigned __int16 *v20;
  uint64_t v21;
  uint64_t v22;
  uint64_t v23;
  CDMCATISwiftBloomFilter *v24;
  unint64_t v25;
  CDMCATISwiftBloomFilter *v26;
  FLTCDMCATIBloomFilters *v27;
  _QWORD v29[2];
  __int128 v30;
  uint64_t v31;
  char v32;
  objc_super v33;

  v5 = a5;
  v9 = a3;
  v33.receiver = self;
  v33.super_class = (Class)FLTCDMCATIBloomFilters;
  v10 = -[FLTCDMCATIBloomFilters init](&v33, sel_init);
  if (!v10)
    goto LABEL_28;
  if (!v9 || !objc_msgSend(v9, "length"))
    goto LABEL_29;
  p_data = (id *)&v10->_data;
  objc_storeStrong((id *)&v10->_data, a3);
  if (!a4)
  {
    v12 = (unsigned int *)objc_msgSend(*p_data, "bytes");
    a4 = (const CDMCATIBloomFilters *)v12 + *v12;
  }
  v10->_root = a4;
  if (!v5)
    goto LABEL_28;
  v13 = objc_msgSend(*p_data, "bytes");
  v14 = objc_msgSend(*p_data, "length");
  root = v10->_root;
  if ((unint64_t)root < v13 || (unint64_t)root > v13 + v14)
    goto LABEL_29;
  v17 = objc_msgSend(*p_data, "bytes");
  v18 = objc_msgSend(*p_data, "length");
  v29[0] = v17;
  v29[1] = v18;
  v30 = xmmword_1C2047DF0;
  v31 = 0;
  v32 = 1;
  if (v18 >= 0x7FFFFFFF)
    __assert_rtn("Verifier", "flatbuffers.h", 2285, "size_ < FLATBUFFERS_MAX_BUFFER_SIZE");
  v19 = (apple::aiml::flatbuffers2::Table *)v10->_root;
  if (!v19)
    goto LABEL_28;
  if (!apple::aiml::flatbuffers2::Verifier::VerifyTableStart((apple::aiml::flatbuffers2::Verifier *)v29, v10->_root->var0))goto LABEL_29;
  if (!apple::aiml::flatbuffers2::Table::VerifyOffset(v19, (const apple::aiml::flatbuffers2::Verifier *)v29, 4u))
    goto LABEL_29;
  v20 = (unsigned __int16 *)((char *)v19 - *(int *)v19);
  if (*v20 >= 5u)
  {
    v21 = v20[2];
    if (v21)
    {
      if (!CDMCATISwiftBloomFilter::Verify((CDMCATISwiftBloomFilter *)v19 + v21 + *(unsigned int *)((char *)v19 + v21), (apple::aiml::flatbuffers2::Verifier *)v29))goto LABEL_29;
    }
  }
  if (!apple::aiml::flatbuffers2::Table::VerifyOffset(v19, (const apple::aiml::flatbuffers2::Verifier *)v29, 6u))
    goto LABEL_29;
  v22 = *(int *)v19;
  if (*(unsigned __int16 *)((char *)v19 - v22) < 7u)
    goto LABEL_28;
  if (*(_WORD *)((char *)v19 - v22 + 6))
  {
    if (apple::aiml::flatbuffers2::Verifier::VerifyVectorOrString((apple::aiml::flatbuffers2::Verifier *)v29, (const unsigned __int8 *)v19+ *(unsigned __int16 *)((char *)v19 - v22 + 6)+ *(unsigned int *)((char *)v19 + *(unsigned __int16 *)((char *)v19 - v22 + 6)), 4uLL, 0))
    {
      v22 = *(int *)v19;
      if (*(unsigned __int16 *)((char *)v19 - v22) < 7u)
        goto LABEL_28;
      goto LABEL_23;
    }
LABEL_29:
    v27 = 0;
    goto LABEL_30;
  }
LABEL_23:
  v23 = *(unsigned __int16 *)((char *)v19 - v22 + 6);
  if (v23)
  {
    v24 = (CDMCATISwiftBloomFilter *)v19 + v23 + *(unsigned int *)((char *)v19 + v23);
    if (*(_DWORD *)v24->var0)
    {
      v25 = 0;
      v26 = v24 + 4;
      while (CDMCATISwiftBloomFilter::Verify(&v26[*(unsigned int *)v26->var0], (apple::aiml::flatbuffers2::Verifier *)v29))
      {
        ++v25;
        v26 += 4;
        if (v25 >= *(unsigned int *)v24->var0)
          goto LABEL_28;
      }
      goto LABEL_29;
    }
  }
LABEL_28:
  v27 = v10;
LABEL_30:

  return v27;
}

- (FLTCDMCATISwiftBloomFilter)general_bf
{
  FLTCDMCATISwiftBloomFilter *v3;
  FLTCDMCATISwiftBloomFilter *v4;
  const CDMCATIBloomFilters *root;
  const CDMCATIBloomFilters *v6;
  uint64_t v7;
  const CDMCATIBloomFilters *v8;

  -[NSMutableDictionary objectForKeyedSubscript:](self->_storage, "objectForKeyedSubscript:", CFSTR("general_bf"));
  v3 = (FLTCDMCATISwiftBloomFilter *)objc_claimAutoreleasedReturnValue();
  if (!v3)
  {
    v4 = [FLTCDMCATISwiftBloomFilter alloc];
    root = self->_root;
    v6 = &root[-*(int *)root->var0];
    if (*(unsigned __int16 *)v6->var0 >= 5u && (v7 = *(unsigned __int16 *)v6[4].var0) != 0)
      v8 = &root[v7 + *(unsigned int *)root[v7].var0];
    else
      v8 = 0;
    v3 = -[FLTCDMCATISwiftBloomFilter initWithFlatbuffData:root:verify:](v4, "initWithFlatbuffData:root:verify:", self->_data, v8, 0);
    -[NSMutableDictionary setObject:forKeyedSubscript:](self->_storage, "setObject:forKeyedSubscript:", v3, CFSTR("general_bf"));
  }
  return v3;
}

- (NSArray)array_bf
{
  id v3;
  void *v4;
  _QWORD v6[4];
  id v7;

  -[NSMutableDictionary objectForKeyedSubscript:](self->_storage, "objectForKeyedSubscript:", CFSTR("array_bf"));
  v3 = (id)objc_claimAutoreleasedReturnValue();
  if (!v3)
  {
    objc_msgSend(MEMORY[0x1E0C99DE8], "array");
    v4 = (void *)objc_claimAutoreleasedReturnValue();
    v6[0] = MEMORY[0x1E0C809B0];
    v6[1] = 3221225472;
    v6[2] = __34__FLTCDMCATIBloomFilters_array_bf__block_invoke;
    v6[3] = &unk_1E7BB1588;
    v3 = v4;
    v7 = v3;
    -[FLTCDMCATIBloomFilters array_bf_enumerateObjectsUsingBlock:](self, "array_bf_enumerateObjectsUsingBlock:", v6);
    -[NSMutableDictionary setObject:forKeyedSubscript:](self->_storage, "setObject:forKeyedSubscript:", v3, CFSTR("array_bf"));

  }
  return (NSArray *)v3;
}

- (id)array_bf_objectAtIndex:(unint64_t)a3
{
  void *v5;
  void *v6;
  FLTCDMCATISwiftBloomFilter *v7;
  FLTCDMCATISwiftBloomFilter *v8;
  const CDMCATIBloomFilters *root;
  const CDMCATIBloomFilters *v10;
  uint64_t v11;
  const CDMCATIBloomFilters *v12;

  -[NSMutableDictionary objectForKeyedSubscript:](self->_storage, "objectForKeyedSubscript:", CFSTR("array_bf"));
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  v6 = v5;
  if (v5)
  {
    objc_msgSend(v5, "objectAtIndexedSubscript:", a3);
    v7 = (FLTCDMCATISwiftBloomFilter *)objc_claimAutoreleasedReturnValue();
  }
  else
  {
    root = self->_root;
    v10 = &root[-*(int *)root->var0];
    if (*(unsigned __int16 *)v10->var0 < 7u || (v11 = *(unsigned __int16 *)v10[6].var0) == 0)
    {
      v8 = 0;
      goto LABEL_9;
    }
    v12 = &root[v11 + *(unsigned int *)root[v11].var0];
    if (*(_DWORD *)v12->var0 <= a3)
      __assert_rtn("Get", "flatbuffers.h", 275, "i < size()");
    v7 = -[FLTCDMCATISwiftBloomFilter initWithFlatbuffData:root:verify:]([FLTCDMCATISwiftBloomFilter alloc], "initWithFlatbuffData:root:verify:", self->_data, &v12[4 * a3 + 4 + *(unsigned int *)v12[4 * a3 + 4].var0], 0);
  }
  v8 = v7;
LABEL_9:

  return v8;
}

- (unint64_t)array_bf_count
{
  void *v3;
  void *v4;
  unint64_t v5;
  const CDMCATIBloomFilters *root;
  const CDMCATIBloomFilters *v7;
  uint64_t v8;

  -[NSMutableDictionary objectForKeyedSubscript:](self->_storage, "objectForKeyedSubscript:", CFSTR("array_bf"));
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

- (void)array_bf_enumerateObjectsUsingBlock:(id)a3
{
  void (**v4)(id, FLTCDMCATISwiftBloomFilter *, uint64_t, unsigned __int8 *);
  void *v5;
  void *v6;
  const CDMCATIBloomFilters *root;
  const CDMCATIBloomFilters *v8;
  uint64_t v9;
  const CDMCATIBloomFilters *v10;
  uint64_t v11;
  uint64_t v12;
  const CDMCATIBloomFilters *v13;
  uint64_t v14;
  uint64_t v15;
  FLTCDMCATISwiftBloomFilter *v16;
  int v17;
  uint64_t v18;
  unsigned __int8 v19;

  v4 = (void (**)(id, FLTCDMCATISwiftBloomFilter *, uint64_t, unsigned __int8 *))a3;
  -[NSMutableDictionary objectForKeyedSubscript:](self->_storage, "objectForKeyedSubscript:", CFSTR("array_bf"));
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
        v19 = 0;
        v10 = &root[v9];
        v11 = *(unsigned int *)v10->var0;
        v13 = &v10[v11 + 4];
        v12 = *(unsigned int *)v10[v11].var0;
        if ((_DWORD)v12)
        {
          v14 = 0;
          v15 = 4 * v12 - 4;
          do
          {
            v16 = -[FLTCDMCATISwiftBloomFilter initWithFlatbuffData:root:verify:]([FLTCDMCATISwiftBloomFilter alloc], "initWithFlatbuffData:root:verify:", self->_data, &v13[*(unsigned int *)v13->var0], 0);
            v4[2](v4, v16, v14, &v19);
            v17 = v19;

            if (v17)
              break;
            ++v14;
            v13 += 4;
            v18 = v15;
            v15 -= 4;
          }
          while (v18);
        }
      }
    }
  }

}

- (Offset<CDMCATIBloomFilters>)addObjectToBuffer:(void *)a3
{
  void *v5;
  unsigned int v6;
  void *v7;
  unint64_t v8;
  char *v9;
  uint64_t v10;
  char *v11;
  void *v12;
  uint64_t v13;
  uint64_t v14;
  char *v15;
  uint64_t i;
  int v17;
  int v18;
  uint64_t v19;
  unint64_t v20;
  unint64_t v21;
  uint64_t v22;
  char *v23;
  char *v24;
  int v25;
  uint64_t v26;
  char *v27;
  uint64_t v28;
  char *v29;
  uint64_t v30;
  int v31;
  unsigned int v32;
  int v33;
  int v34;
  int v35;
  int v36;
  int v37;
  Offset<CDMCATIBloomFilters> v38;
  unsigned int v40;
  void *v41;
  __int128 v42;
  __int128 v43;
  __int128 v44;
  __int128 v45;
  _BYTE v46[128];
  uint64_t v47;

  v47 = *MEMORY[0x1E0C80C00];
  -[FLTCDMCATIBloomFilters general_bf](self, "general_bf");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  v6 = objc_msgSend(v5, "addObjectToBuffer:", a3);

  -[FLTCDMCATIBloomFilters array_bf](self, "array_bf");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  v8 = objc_msgSend(v7, "count");
  if (v8)
  {
    if (v8 >> 62)
      std::vector<std::string>::__throw_length_error[abi:ne180100]();
    v9 = (char *)std::__allocate_at_least[abi:ne180100]<std::allocator<float>>(v8);
    v11 = &v9[4 * v10];
  }
  else
  {
    v9 = 0;
    v11 = 0;
  }

  v44 = 0u;
  v45 = 0u;
  v42 = 0u;
  v43 = 0u;
  -[FLTCDMCATIBloomFilters array_bf](self, "array_bf");
  v12 = (void *)objc_claimAutoreleasedReturnValue();
  v13 = objc_msgSend(v12, "countByEnumeratingWithState:objects:count:", &v42, v46, 16);
  v40 = v6;
  if (v13)
  {
    v14 = *(_QWORD *)v43;
    v15 = v9;
    v41 = v12;
    do
    {
      for (i = 0; i != v13; ++i)
      {
        if (*(_QWORD *)v43 != v14)
          objc_enumerationMutation(v12);
        v17 = objc_msgSend(*(id *)(*((_QWORD *)&v42 + 1) + 8 * i), "addObjectToBuffer:", a3);
        v18 = v17;
        if (v15 >= v11)
        {
          v19 = (v15 - v9) >> 2;
          v20 = v19 + 1;
          if ((unint64_t)(v19 + 1) >> 62)
            std::vector<std::string>::__throw_length_error[abi:ne180100]();
          if ((v11 - v9) >> 1 > v20)
            v20 = (v11 - v9) >> 1;
          if ((unint64_t)(v11 - v9) >= 0x7FFFFFFFFFFFFFFCLL)
            v21 = 0x3FFFFFFFFFFFFFFFLL;
          else
            v21 = v20;
          if (v21)
            v21 = (unint64_t)std::__allocate_at_least[abi:ne180100]<std::allocator<float>>(v21);
          else
            v22 = 0;
          v23 = (char *)(v21 + 4 * v19);
          *(_DWORD *)v23 = v18;
          v24 = v23 + 4;
          while (v15 != v9)
          {
            v25 = *((_DWORD *)v15 - 1);
            v15 -= 4;
            *((_DWORD *)v23 - 1) = v25;
            v23 -= 4;
          }
          v11 = (char *)(v21 + 4 * v22);
          if (v9)
            operator delete(v9);
          v9 = v23;
          v15 = v24;
          v12 = v41;
        }
        else
        {
          *(_DWORD *)v15 = v17;
          v15 += 4;
        }
      }
      v13 = objc_msgSend(v12, "countByEnumeratingWithState:objects:count:", &v42, v46, 16);
    }
    while (v13);
  }
  else
  {
    v15 = v9;
  }

  v26 = v15 - v9;
  if (v15 == v9)
    v27 = (char *)&apple::aiml::flatbuffers2::data<apple::aiml::flatbuffers2::Offset<CDMCATISwiftBloomFilter>,std::allocator<apple::aiml::flatbuffers2::Offset<CDMCATISwiftBloomFilter>>>(std::vector<apple::aiml::flatbuffers2::Offset<CDMCATISwiftBloomFilter>> const&)::t;
  else
    v27 = v9;
  v28 = v26 >> 2;
  apple::aiml::flatbuffers2::FlatBufferBuilder::StartVector((apple::aiml::flatbuffers2::FlatBufferBuilder *)a3, v26 >> 2, 4uLL);
  if (v9 == v15)
  {
    LODWORD(v28) = 0;
  }
  else
  {
    v29 = v27 - 4;
    v30 = v28;
    do
    {
      v31 = apple::aiml::flatbuffers2::FlatBufferBuilder::ReferTo((apple::aiml::flatbuffers2::FlatBufferBuilder *)a3, *(_DWORD *)&v29[4 * v30]);
      apple::aiml::flatbuffers2::FlatBufferBuilder::PushElement<unsigned int>((uint64_t)a3, v31);
      --v30;
    }
    while (v30);
  }
  v32 = apple::aiml::flatbuffers2::FlatBufferBuilder::EndVector((apple::aiml::flatbuffers2::FlatBufferBuilder *)a3, v28);
  apple::aiml::flatbuffers2::FlatBufferBuilder::NotNested((uint64_t)a3);
  *((_BYTE *)a3 + 70) = 1;
  v33 = *((_DWORD *)a3 + 8);
  v34 = *((_DWORD *)a3 + 12);
  v35 = *((_DWORD *)a3 + 10);
  if (v40)
  {
    v36 = apple::aiml::flatbuffers2::FlatBufferBuilder::ReferTo((apple::aiml::flatbuffers2::FlatBufferBuilder *)a3, v40);
    apple::aiml::flatbuffers2::FlatBufferBuilder::AddElement<unsigned int>((unint64_t)a3, 4, v36, 0);
  }
  if (v32)
  {
    v37 = apple::aiml::flatbuffers2::FlatBufferBuilder::ReferTo((apple::aiml::flatbuffers2::FlatBufferBuilder *)a3, v32);
    apple::aiml::flatbuffers2::FlatBufferBuilder::AddElement<unsigned int>((unint64_t)a3, 6, v37, 0);
  }
  v38.var0 = apple::aiml::flatbuffers2::FlatBufferBuilder::EndTable((apple::aiml::flatbuffers2::FlatBufferBuilder *)a3, v33 - v34 + v35);
  if (v9)
    operator delete(v9);
  return v38;
}

- (id)flatbuffData
{
  Offset<CDMCATIBloomFilters> v2;
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
  v2.var0 = -[FLTCDMCATIBloomFilters addObjectToBuffer:](self, "addObjectToBuffer:", &v11);
  apple::aiml::flatbuffers2::FlatBufferBuilder::Finish((apple::aiml::flatbuffers2::FlatBufferBuilder *)&v11, v2.var0, v3);
  v4 = (apple::aiml::flatbuffers2::FlatBufferBuilder *)operator new();
  apple::aiml::flatbuffers2::FlatBufferBuilder::Release(v4, (uint64_t)&v11);
  v5 = objc_alloc(MEMORY[0x1E0C99D50]);
  v6 = *((_QWORD *)v4 + 4);
  v7 = *((_QWORD *)v4 + 5);
  v10[0] = MEMORY[0x1E0C809B0];
  v10[1] = 3221225472;
  v10[2] = __38__FLTCDMCATIBloomFilters_flatbuffData__block_invoke;
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

apple::aiml::flatbuffers2::DetachedBuffer *__38__FLTCDMCATIBloomFilters_flatbuffData__block_invoke(uint64_t a1)
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

uint64_t __34__FLTCDMCATIBloomFilters_array_bf__block_invoke(uint64_t a1, uint64_t a2)
{
  return objc_msgSend(*(id *)(a1 + 32), "addObject:", a2);
}

@end
