@implementation FLTSSUCategory

- (FLTSSUCategory)initWithFlatbuffData:(id)a3
{
  return -[FLTSSUCategory initWithFlatbuffData:root:verify:](self, "initWithFlatbuffData:root:verify:", a3, 0, 0);
}

- (id)initAndVerifyWithFlatbuffData:(id)a3
{
  return -[FLTSSUCategory initWithFlatbuffData:root:verify:](self, "initWithFlatbuffData:root:verify:", a3, 0, 1);
}

- (FLTSSUCategory)initWithFlatbuffData:(id)a3 root:(const SSUCategory *)a4
{
  return -[FLTSSUCategory initWithFlatbuffData:root:verify:](self, "initWithFlatbuffData:root:verify:", a3, a4, 0);
}

- (FLTSSUCategory)initWithFlatbuffData:(id)a3 root:(const SSUCategory *)a4 verify:(BOOL)a5
{
  _BOOL4 v5;
  id v9;
  FLTSSUCategory *v10;
  id *p_data;
  unsigned int *v12;
  unint64_t v13;
  uint64_t v14;
  const SSUCategory *root;
  uint64_t v17;
  unint64_t v18;
  SSUCategory *v19;
  FLTSSUCategory *v20;
  _QWORD v22[2];
  __int128 v23;
  uint64_t v24;
  char v25;
  objc_super v26;

  v5 = a5;
  v9 = a3;
  v26.receiver = self;
  v26.super_class = (Class)FLTSSUCategory;
  v10 = -[FLTSSUCategory init](&v26, sel_init);
  if (!v10)
    goto LABEL_14;
  if (!v9 || !objc_msgSend(v9, "length"))
    goto LABEL_15;
  p_data = (id *)&v10->_data;
  objc_storeStrong((id *)&v10->_data, a3);
  if (!a4)
  {
    v12 = (unsigned int *)objc_msgSend(*p_data, "bytes");
    a4 = (const SSUCategory *)v12 + *v12;
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
  v19 = (SSUCategory *)v10->_root;
  if (v19 && !SSUCategory::Verify(v19, (apple::aiml::flatbuffers2::Verifier *)v22))
LABEL_15:
    v20 = 0;
  else
LABEL_14:
    v20 = v10;

  return v20;
}

- (int64_t)type
{
  const SSUCategory *root;
  const SSUCategory *v3;
  uint64_t v4;

  root = self->_root;
  v3 = &root[-*(int *)root->var0];
  if (*(unsigned __int16 *)v3->var0 >= 5u && (v4 = *(unsigned __int16 *)v3[4].var0) != 0)
    return (char)root[v4].var0[0];
  else
    return 0;
}

- (NSArray)groups
{
  id v3;
  void *v4;
  _QWORD v6[4];
  id v7;

  -[NSMutableDictionary objectForKeyedSubscript:](self->_storage, "objectForKeyedSubscript:", CFSTR("groups"));
  v3 = (id)objc_claimAutoreleasedReturnValue();
  if (!v3)
  {
    objc_msgSend(MEMORY[0x1E0C99DE8], "array");
    v4 = (void *)objc_claimAutoreleasedReturnValue();
    v6[0] = MEMORY[0x1E0C809B0];
    v6[1] = 3221225472;
    v6[2] = __24__FLTSSUCategory_groups__block_invoke;
    v6[3] = &unk_1E7BB1588;
    v3 = v4;
    v7 = v3;
    -[FLTSSUCategory groups_enumerateObjectsUsingBlock:](self, "groups_enumerateObjectsUsingBlock:", v6);
    -[NSMutableDictionary setObject:forKeyedSubscript:](self->_storage, "setObject:forKeyedSubscript:", v3, CFSTR("groups"));

  }
  return (NSArray *)v3;
}

- (id)groups_objectAtIndex:(unint64_t)a3
{
  void *v5;
  void *v6;
  FLTSSUCategoryGroup *v7;
  FLTSSUCategoryGroup *v8;
  const SSUCategory *root;
  const SSUCategory *v10;
  uint64_t v11;
  const SSUCategory *v12;

  -[NSMutableDictionary objectForKeyedSubscript:](self->_storage, "objectForKeyedSubscript:", CFSTR("groups"));
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  v6 = v5;
  if (v5)
  {
    objc_msgSend(v5, "objectAtIndexedSubscript:", a3);
    v7 = (FLTSSUCategoryGroup *)objc_claimAutoreleasedReturnValue();
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
    v7 = -[FLTSSUCategoryGroup initWithFlatbuffData:root:verify:]([FLTSSUCategoryGroup alloc], "initWithFlatbuffData:root:verify:", self->_data, &v12[4 * a3 + 4 + *(unsigned int *)v12[4 * a3 + 4].var0], 0);
  }
  v8 = v7;
LABEL_9:

  return v8;
}

- (unint64_t)groups_count
{
  void *v3;
  void *v4;
  unint64_t v5;
  const SSUCategory *root;
  const SSUCategory *v7;
  uint64_t v8;

  -[NSMutableDictionary objectForKeyedSubscript:](self->_storage, "objectForKeyedSubscript:", CFSTR("groups"));
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

- (void)groups_enumerateObjectsUsingBlock:(id)a3
{
  void (**v4)(id, FLTSSUCategoryGroup *, uint64_t, unsigned __int8 *);
  void *v5;
  void *v6;
  const SSUCategory *root;
  const SSUCategory *v8;
  uint64_t v9;
  const SSUCategory *v10;
  uint64_t v11;
  uint64_t v12;
  const SSUCategory *v13;
  uint64_t v14;
  uint64_t v15;
  FLTSSUCategoryGroup *v16;
  int v17;
  uint64_t v18;
  unsigned __int8 v19;

  v4 = (void (**)(id, FLTSSUCategoryGroup *, uint64_t, unsigned __int8 *))a3;
  -[NSMutableDictionary objectForKeyedSubscript:](self->_storage, "objectForKeyedSubscript:", CFSTR("groups"));
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
            v16 = -[FLTSSUCategoryGroup initWithFlatbuffData:root:verify:]([FLTSSUCategoryGroup alloc], "initWithFlatbuffData:root:verify:", self->_data, &v13[*(unsigned int *)v13->var0], 0);
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

- (Offset<SSUCategory>)addObjectToBuffer:(void *)a3
{
  int64_t v5;
  void *v6;
  unint64_t v7;
  char *v8;
  uint64_t v9;
  char *v10;
  void *v11;
  uint64_t v12;
  uint64_t v13;
  char *v14;
  uint64_t i;
  int v16;
  int v17;
  uint64_t v18;
  unint64_t v19;
  unint64_t v20;
  uint64_t v21;
  char *v22;
  char *v23;
  int v24;
  uint64_t v25;
  char *v26;
  uint64_t v27;
  char *v28;
  uint64_t v29;
  int v30;
  unsigned int v31;
  int v32;
  int v33;
  int v34;
  uint64_t v35;
  uint64_t v36;
  uint64_t v37;
  uint64_t v38;
  unsigned int v39;
  int v40;
  Offset<SSUCategory> v41;
  int64_t v43;
  void *v44;
  __int128 v45;
  __int128 v46;
  __int128 v47;
  __int128 v48;
  _BYTE v49[128];
  uint64_t v50;

  v50 = *MEMORY[0x1E0C80C00];
  v5 = -[FLTSSUCategory type](self, "type");
  -[FLTSSUCategory groups](self, "groups");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  v7 = objc_msgSend(v6, "count");
  if (v7)
  {
    if (v7 >> 62)
      std::vector<std::string>::__throw_length_error[abi:ne180100]();
    v8 = (char *)std::__allocate_at_least[abi:ne180100]<std::allocator<float>>(v7);
    v10 = &v8[4 * v9];
  }
  else
  {
    v8 = 0;
    v10 = 0;
  }

  v47 = 0u;
  v48 = 0u;
  v45 = 0u;
  v46 = 0u;
  -[FLTSSUCategory groups](self, "groups");
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  v12 = objc_msgSend(v11, "countByEnumeratingWithState:objects:count:", &v45, v49, 16);
  v43 = v5;
  if (v12)
  {
    v13 = *(_QWORD *)v46;
    v14 = v8;
    v44 = v11;
    do
    {
      for (i = 0; i != v12; ++i)
      {
        if (*(_QWORD *)v46 != v13)
          objc_enumerationMutation(v11);
        v16 = objc_msgSend(*(id *)(*((_QWORD *)&v45 + 1) + 8 * i), "addObjectToBuffer:", a3, v43);
        v17 = v16;
        if (v14 >= v10)
        {
          v18 = (v14 - v8) >> 2;
          v19 = v18 + 1;
          if ((unint64_t)(v18 + 1) >> 62)
            std::vector<std::string>::__throw_length_error[abi:ne180100]();
          if ((v10 - v8) >> 1 > v19)
            v19 = (v10 - v8) >> 1;
          if ((unint64_t)(v10 - v8) >= 0x7FFFFFFFFFFFFFFCLL)
            v20 = 0x3FFFFFFFFFFFFFFFLL;
          else
            v20 = v19;
          if (v20)
            v20 = (unint64_t)std::__allocate_at_least[abi:ne180100]<std::allocator<float>>(v20);
          else
            v21 = 0;
          v22 = (char *)(v20 + 4 * v18);
          *(_DWORD *)v22 = v17;
          v23 = v22 + 4;
          while (v14 != v8)
          {
            v24 = *((_DWORD *)v14 - 1);
            v14 -= 4;
            *((_DWORD *)v22 - 1) = v24;
            v22 -= 4;
          }
          v10 = (char *)(v20 + 4 * v21);
          if (v8)
            operator delete(v8);
          v8 = v22;
          v14 = v23;
          v11 = v44;
        }
        else
        {
          *(_DWORD *)v14 = v16;
          v14 += 4;
        }
      }
      v12 = objc_msgSend(v11, "countByEnumeratingWithState:objects:count:", &v45, v49, 16);
    }
    while (v12);
  }
  else
  {
    v14 = v8;
  }

  v25 = v14 - v8;
  if (v14 == v8)
    v26 = (char *)&apple::aiml::flatbuffers2::data<apple::aiml::flatbuffers2::Offset<SSUCategoryGroup>,std::allocator<apple::aiml::flatbuffers2::Offset<SSUCategoryGroup>>>(std::vector<apple::aiml::flatbuffers2::Offset<SSUCategoryGroup>> const&)::t;
  else
    v26 = v8;
  v27 = v25 >> 2;
  apple::aiml::flatbuffers2::FlatBufferBuilder::StartVector((apple::aiml::flatbuffers2::FlatBufferBuilder *)a3, v25 >> 2, 4uLL);
  if (v8 == v14)
  {
    LODWORD(v27) = 0;
  }
  else
  {
    v28 = v26 - 4;
    v29 = v27;
    do
    {
      v30 = apple::aiml::flatbuffers2::FlatBufferBuilder::ReferTo((apple::aiml::flatbuffers2::FlatBufferBuilder *)a3, *(_DWORD *)&v28[4 * v29]);
      apple::aiml::flatbuffers2::FlatBufferBuilder::PushElement<unsigned int>((uint64_t)a3, v30);
      --v29;
    }
    while (v29);
  }
  v31 = apple::aiml::flatbuffers2::FlatBufferBuilder::EndVector((apple::aiml::flatbuffers2::FlatBufferBuilder *)a3, v27);
  apple::aiml::flatbuffers2::FlatBufferBuilder::NotNested((uint64_t)a3);
  *((_BYTE *)a3 + 70) = 1;
  v32 = *((_DWORD *)a3 + 8);
  v33 = *((_DWORD *)a3 + 12);
  v34 = *((_DWORD *)a3 + 10);
  if ((_BYTE)v43 || *((_BYTE *)a3 + 80))
  {
    apple::aiml::flatbuffers2::FlatBufferBuilder::Align((apple::aiml::flatbuffers2::FlatBufferBuilder *)a3, 1uLL);
    apple::aiml::flatbuffers2::vector_downward::ensure_space((apple::aiml::flatbuffers2::vector_downward *)a3, 1uLL);
    v35 = *((_QWORD *)a3 + 6);
    *((_QWORD *)a3 + 6) = v35 - 1;
    *(_BYTE *)(v35 - 1) = v43;
    v36 = *((_QWORD *)a3 + 5);
    v37 = *((_QWORD *)a3 + 6);
    v38 = *((_QWORD *)a3 + 4);
    apple::aiml::flatbuffers2::vector_downward::ensure_space((apple::aiml::flatbuffers2::vector_downward *)a3, 8uLL);
    **((_QWORD **)a3 + 7) = (v38 - v37 + v36) | 0x400000000;
    *((_QWORD *)a3 + 7) += 8;
    ++*((_DWORD *)a3 + 16);
    v39 = *((unsigned __int16 *)a3 + 34);
    if (v39 <= 4)
      LOWORD(v39) = 4;
    *((_WORD *)a3 + 34) = v39;
  }
  if (v31)
  {
    v40 = apple::aiml::flatbuffers2::FlatBufferBuilder::ReferTo((apple::aiml::flatbuffers2::FlatBufferBuilder *)a3, v31);
    apple::aiml::flatbuffers2::FlatBufferBuilder::AddElement<unsigned int>((unint64_t)a3, 6, v40, 0);
  }
  v41.var0 = apple::aiml::flatbuffers2::FlatBufferBuilder::EndTable((apple::aiml::flatbuffers2::FlatBufferBuilder *)a3, v32 - v33 + v34);
  if (v8)
    operator delete(v8);
  return v41;
}

- (id)flatbuffData
{
  Offset<SSUCategory> v2;
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
  v2.var0 = -[FLTSSUCategory addObjectToBuffer:](self, "addObjectToBuffer:", &v11);
  apple::aiml::flatbuffers2::FlatBufferBuilder::Finish((apple::aiml::flatbuffers2::FlatBufferBuilder *)&v11, v2.var0, v3);
  v4 = (apple::aiml::flatbuffers2::FlatBufferBuilder *)operator new();
  apple::aiml::flatbuffers2::FlatBufferBuilder::Release(v4, (uint64_t)&v11);
  v5 = objc_alloc(MEMORY[0x1E0C99D50]);
  v6 = *((_QWORD *)v4 + 4);
  v7 = *((_QWORD *)v4 + 5);
  v10[0] = MEMORY[0x1E0C809B0];
  v10[1] = 3221225472;
  v10[2] = __30__FLTSSUCategory_flatbuffData__block_invoke;
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

apple::aiml::flatbuffers2::DetachedBuffer *__30__FLTSSUCategory_flatbuffData__block_invoke(uint64_t a1)
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

uint64_t __24__FLTSSUCategory_groups__block_invoke(uint64_t a1, uint64_t a2)
{
  return objc_msgSend(*(id *)(a1 + 32), "addObject:", a2);
}

@end
