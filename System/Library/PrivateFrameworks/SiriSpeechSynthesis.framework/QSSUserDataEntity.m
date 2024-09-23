@implementation QSSUserDataEntity

- (QSSUserDataEntity)initWithFlatbuffData:(id)a3
{
  return -[QSSUserDataEntity initWithFlatbuffData:root:verify:](self, "initWithFlatbuffData:root:verify:", a3, 0, 0);
}

- (id)initAndVerifyWithFlatbuffData:(id)a3
{
  return -[QSSUserDataEntity initWithFlatbuffData:root:verify:](self, "initWithFlatbuffData:root:verify:", a3, 0, 1);
}

- (QSSUserDataEntity)initWithFlatbuffData:(id)a3 root:(const UserDataEntity *)a4
{
  return -[QSSUserDataEntity initWithFlatbuffData:root:verify:](self, "initWithFlatbuffData:root:verify:", a3, a4, 0);
}

- (QSSUserDataEntity)initWithFlatbuffData:(id)a3 root:(const UserDataEntity *)a4 verify:(BOOL)a5
{
  _BOOL4 v5;
  id v9;
  QSSUserDataEntity *v10;
  QSSUserDataEntity *v11;
  id *p_data;
  unsigned int *v13;
  unint64_t v14;
  uint64_t v15;
  unint64_t var0;
  uint64_t v18;
  unint64_t v19;
  siri::speech::schema_fb::UserDataEntity *root;
  uint64_t v21;
  NSMutableDictionary *storage;
  QSSUserDataEntity *v23;
  uint64_t v25;
  unint64_t v26;
  __int128 v27;
  uint64_t v28;
  uint64_t v29;
  objc_super v30;

  v5 = a5;
  v9 = a3;
  v30.receiver = self;
  v30.super_class = (Class)QSSUserDataEntity;
  v10 = -[QSSUserDataEntity init](&v30, sel_init);
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
      a4 = (const UserDataEntity *)v13 + *v13;
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
      root = (siri::speech::schema_fb::UserDataEntity *)v11->_root;
      if (root)
      {
        if (!siri::speech::schema_fb::UserDataEntity::Verify(root, (flatbuffers::Verifier *)&v25))
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

- (NSArray)attributes
{
  void *v3;
  const UserDataEntity *root;
  const UserDataEntity *v5;
  uint64_t v6;
  const UserDataEntity *v7;
  uint64_t v8;
  uint64_t v9;
  const UserDataEntity *v10;
  uint64_t v11;
  QSSWord *v12;

  -[NSMutableDictionary objectForKeyedSubscript:](self->_storage, "objectForKeyedSubscript:", CFSTR("attributes"));
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
            v12 = -[QSSWord initWithFlatbuffData:root:verify:]([QSSWord alloc], "initWithFlatbuffData:root:verify:", self->_data, &v10[*(unsigned int *)v10->var0], 0);
            objc_msgSend(v3, "addObject:", v12);

            v10 += 4;
            v11 -= 4;
          }
          while (v11);
        }
      }
    }
    -[NSMutableDictionary setObject:forKeyedSubscript:](self->_storage, "setObject:forKeyedSubscript:", v3, CFSTR("attributes"));
  }
  return (NSArray *)v3;
}

- (Offset<siri::speech::schema_fb::UserDataEntity>)addObjectToBuffer:(void *)a3
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
  char *v27;
  uint64_t v28;
  int v29;
  unsigned int v30;
  uint64_t v31;
  uint64_t v32;
  uint64_t v33;
  int v34;
  Offset<siri::speech::schema_fb::UserDataEntity> v35;
  void *v37;
  __int128 v38;
  __int128 v39;
  __int128 v40;
  __int128 v41;
  _BYTE v42[128];
  uint64_t v43;

  v43 = *MEMORY[0x24BDAC8D0];
  -[QSSUserDataEntity attributes](self, "attributes");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  v6 = objc_msgSend(v5, "count");
  if (v6)
  {
    if (v6 >> 62)
      std::vector<flatbuffers::Offset<siri::speech::schema_fb::RecognitionToken>>::__throw_length_error[abi:ne180100]();
    v7 = (char *)std::__allocate_at_least[abi:ne180100]<std::allocator<flatbuffers::Offset<siri::speech::schema_fb::RecognitionToken>>>(v6);
    v9 = &v7[4 * v8];
  }
  else
  {
    v7 = 0;
    v9 = 0;
  }

  v40 = 0u;
  v41 = 0u;
  v38 = 0u;
  v39 = 0u;
  -[QSSUserDataEntity attributes](self, "attributes");
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  v11 = objc_msgSend(v10, "countByEnumeratingWithState:objects:count:", &v38, v42, 16);
  if (v11)
  {
    v12 = *(_QWORD *)v39;
    v13 = v7;
    v37 = v10;
    do
    {
      for (i = 0; i != v11; ++i)
      {
        if (*(_QWORD *)v39 != v12)
          objc_enumerationMutation(v10);
        v15 = objc_msgSend(*(id *)(*((_QWORD *)&v38 + 1) + 8 * i), "addObjectToBuffer:", a3);
        v16 = v15;
        if (v13 >= v9)
        {
          v17 = (v13 - v7) >> 2;
          v18 = v17 + 1;
          if ((unint64_t)(v17 + 1) >> 62)
            std::vector<flatbuffers::Offset<siri::speech::schema_fb::RecognitionToken>>::__throw_length_error[abi:ne180100]();
          if ((v9 - v7) >> 1 > v18)
            v18 = (v9 - v7) >> 1;
          if ((unint64_t)(v9 - v7) >= 0x7FFFFFFFFFFFFFFCLL)
            v19 = 0x3FFFFFFFFFFFFFFFLL;
          else
            v19 = v18;
          if (v19)
            v19 = (unint64_t)std::__allocate_at_least[abi:ne180100]<std::allocator<flatbuffers::Offset<siri::speech::schema_fb::RecognitionToken>>>(v19);
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
          v10 = v37;
        }
        else
        {
          *(_DWORD *)v13 = v15;
          v13 += 4;
        }
      }
      v11 = objc_msgSend(v10, "countByEnumeratingWithState:objects:count:", &v38, v42, 16);
    }
    while (v11);
  }
  else
  {
    v13 = v7;
  }

  v24 = v13 - v7;
  if (v13 == v7)
    v25 = (char *)&flatbuffers::data<flatbuffers::Offset<siri::speech::schema_fb::Word>,std::allocator<flatbuffers::Offset<siri::speech::schema_fb::Word>>>(std::vector<flatbuffers::Offset<siri::speech::schema_fb::Word>> const&)::t;
  else
    v25 = v7;
  v26 = v24 >> 2;
  flatbuffers::FlatBufferBuilder::StartVector((flatbuffers::FlatBufferBuilder *)a3, v24 >> 2, 4uLL);
  if (v7 == v13)
  {
    LODWORD(v26) = 0;
  }
  else
  {
    v27 = v25 - 4;
    v28 = v26;
    do
    {
      v29 = flatbuffers::FlatBufferBuilder::ReferTo((flatbuffers::FlatBufferBuilder *)a3, *(_DWORD *)&v27[4 * v28]);
      flatbuffers::FlatBufferBuilder::PushElement<unsigned int>((uint64_t)a3, v29);
      --v28;
    }
    while (v28);
  }
  v30 = flatbuffers::FlatBufferBuilder::EndVector((flatbuffers::FlatBufferBuilder *)a3, v26);
  flatbuffers::FlatBufferBuilder::NotNested((uint64_t)a3);
  *((_BYTE *)a3 + 70) = 1;
  v31 = *((_QWORD *)a3 + 5);
  v32 = *((_QWORD *)a3 + 6);
  v33 = *((_QWORD *)a3 + 4);
  if (v30)
  {
    v34 = flatbuffers::FlatBufferBuilder::ReferTo((flatbuffers::FlatBufferBuilder *)a3, v30);
    flatbuffers::FlatBufferBuilder::AddElement<unsigned int>((unint64_t)a3, 4, v34);
  }
  v35.var0 = flatbuffers::FlatBufferBuilder::EndTable((flatbuffers::FlatBufferBuilder *)a3, (int)v33 - (int)v32 + (int)v31);
  if (v7)
    operator delete(v7);
  return v35;
}

- (id)flatbuffData
{
  Offset<siri::speech::schema_fb::UserDataEntity> v2;
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
  v2.var0 = -[QSSUserDataEntity addObjectToBuffer:](self, "addObjectToBuffer:", &v11);
  flatbuffers::FlatBufferBuilder::Finish((flatbuffers::FlatBufferBuilder *)&v11, v2.var0, v3);
  v4 = (flatbuffers::FlatBufferBuilder *)operator new();
  flatbuffers::FlatBufferBuilder::Release(v4, (uint64_t)&v11);
  v5 = objc_alloc(MEMORY[0x24BDBCE50]);
  v6 = *((_QWORD *)v4 + 4);
  v7 = *((_QWORD *)v4 + 5);
  v10[0] = MEMORY[0x24BDAC760];
  v10[1] = 3221225472;
  v10[2] = __33__QSSUserDataEntity_flatbuffData__block_invoke;
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

flatbuffers::DetachedBuffer *__33__QSSUserDataEntity_flatbuffData__block_invoke(uint64_t a1)
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
