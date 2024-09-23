@implementation FLTSSUExample

- (FLTSSUExample)initWithFlatbuffData:(id)a3
{
  return -[FLTSSUExample initWithFlatbuffData:root:verify:](self, "initWithFlatbuffData:root:verify:", a3, 0, 0);
}

- (id)initAndVerifyWithFlatbuffData:(id)a3
{
  return -[FLTSSUExample initWithFlatbuffData:root:verify:](self, "initWithFlatbuffData:root:verify:", a3, 0, 1);
}

- (FLTSSUExample)initWithFlatbuffData:(id)a3 root:(const SSUExample *)a4
{
  return -[FLTSSUExample initWithFlatbuffData:root:verify:](self, "initWithFlatbuffData:root:verify:", a3, a4, 0);
}

- (FLTSSUExample)initWithFlatbuffData:(id)a3 root:(const SSUExample *)a4 verify:(BOOL)a5
{
  _BOOL4 v5;
  id v9;
  FLTSSUExample *v10;
  FLTSSUExample *v11;
  id *p_data;
  unsigned int *v13;
  unint64_t v14;
  uint64_t v15;
  unint64_t var0;
  uint64_t v18;
  unint64_t v19;
  SSUExample *root;
  uint64_t v21;
  NSMutableDictionary *storage;
  FLTSSUExample *v23;
  uint64_t v25;
  unint64_t v26;
  __int128 v27;
  uint64_t v28;
  uint64_t v29;
  objc_super v30;

  v5 = a5;
  v9 = a3;
  v30.receiver = self;
  v30.super_class = (Class)FLTSSUExample;
  v10 = -[FLTSSUExample init](&v30, sel_init);
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
      a4 = (const SSUExample *)v13 + *v13;
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
      v27 = xmmword_1C2047DF0;
      v28 = 0;
      LOBYTE(v29) = 1;
      if (v19 >= 0x7FFFFFFF)
        __assert_rtn("Verifier", "flatbuffers.h", 2285, "size_ < FLATBUFFERS_MAX_BUFFER_SIZE");
      root = (SSUExample *)v11->_root;
      if (root)
      {
        if (!SSUExample::Verify(root, (apple::aiml::flatbuffers2::Verifier *)&v25))
        {
LABEL_16:
          v23 = 0;
          goto LABEL_17;
        }
      }
    }
    objc_msgSend(MEMORY[0x1E0C99E08], "dictionary", v25, v26, v27, v28, v29);
    v21 = objc_claimAutoreleasedReturnValue();
    storage = v11->_storage;
    v11->_storage = (NSMutableDictionary *)v21;

  }
  v23 = v11;
LABEL_17:

  return v23;
}

- (int64_t)data_type
{
  const SSUExample *root;
  const SSUExample *v3;
  uint64_t v4;

  root = self->_root;
  v3 = &root[-*(int *)root->var0];
  if (*(unsigned __int16 *)v3->var0 >= 5u && (v4 = *(unsigned __int16 *)v3[4].var0) != 0)
    return root[v4].var0[0];
  else
    return 0;
}

- (FLTSSUExampleUtterance)dataAsFLTSSUExampleUtterance
{
  FLTSSUExampleUtterance *v3;
  FLTSSUExampleUtterance *v4;
  const SSUExample *root;
  const SSUExample *v6;
  uint64_t v7;
  const SSUExample *v8;

  if (-[FLTSSUExample data_type](self, "data_type") == 1)
  {
    -[NSMutableDictionary objectForKeyedSubscript:](self->_storage, "objectForKeyedSubscript:", CFSTR("data"));
    v3 = (FLTSSUExampleUtterance *)objc_claimAutoreleasedReturnValue();
    if (!v3)
    {
      v4 = [FLTSSUExampleUtterance alloc];
      root = self->_root;
      v6 = &root[-*(int *)root->var0];
      if (*(unsigned __int16 *)v6->var0 >= 7u && (v7 = *(unsigned __int16 *)v6[6].var0) != 0)
        v8 = &root[v7 + *(unsigned int *)root[v7].var0];
      else
        v8 = 0;
      v3 = -[FLTSSUExampleUtterance initWithFlatbuffData:root:verify:](v4, "initWithFlatbuffData:root:verify:", self->_data, v8, 0);
      -[NSMutableDictionary setObject:forKeyedSubscript:](self->_storage, "setObject:forKeyedSubscript:", v3, CFSTR("data"));
    }
  }
  else
  {
    v3 = 0;
  }
  return v3;
}

- (FLTSSUExampleEncodedVector)dataAsFLTSSUExampleEncodedVector
{
  FLTSSUExampleEncodedVector *v3;
  FLTSSUExampleEncodedVector *v4;
  const SSUExample *root;
  const SSUExample *v6;
  uint64_t v7;
  const SSUExample *v8;

  if (-[FLTSSUExample data_type](self, "data_type") == 2)
  {
    -[NSMutableDictionary objectForKeyedSubscript:](self->_storage, "objectForKeyedSubscript:", CFSTR("data"));
    v3 = (FLTSSUExampleEncodedVector *)objc_claimAutoreleasedReturnValue();
    if (!v3)
    {
      v4 = [FLTSSUExampleEncodedVector alloc];
      root = self->_root;
      v6 = &root[-*(int *)root->var0];
      if (*(unsigned __int16 *)v6->var0 >= 7u && (v7 = *(unsigned __int16 *)v6[6].var0) != 0)
        v8 = &root[v7 + *(unsigned int *)root[v7].var0];
      else
        v8 = 0;
      v3 = -[FLTSSUExampleEncodedVector initWithFlatbuffData:root:verify:](v4, "initWithFlatbuffData:root:verify:", self->_data, v8, 0);
      -[NSMutableDictionary setObject:forKeyedSubscript:](self->_storage, "setObject:forKeyedSubscript:", v3, CFSTR("data"));
    }
  }
  else
  {
    v3 = 0;
  }
  return v3;
}

- (FLTBFBufferAccessor)data
{
  int64_t v3;
  void *v4;

  v3 = -[FLTSSUExample data_type](self, "data_type");
  if (v3 == 2)
  {
    -[FLTSSUExample dataAsFLTSSUExampleEncodedVector](self, "dataAsFLTSSUExampleEncodedVector");
    v4 = (void *)objc_claimAutoreleasedReturnValue();
  }
  else if (v3 == 1)
  {
    -[FLTSSUExample dataAsFLTSSUExampleUtterance](self, "dataAsFLTSSUExampleUtterance");
    v4 = (void *)objc_claimAutoreleasedReturnValue();
  }
  else
  {
    v4 = 0;
  }
  return (FLTBFBufferAccessor *)v4;
}

- (Offset<SSUExample>)addObjectToBuffer:(void *)a3
{
  char v5;
  void *v6;
  unsigned int v7;
  void *v8;
  unsigned int v9;
  unsigned int v10;
  uint64_t v11;
  uint64_t v12;
  uint64_t v13;
  _BYTE *v14;
  uint64_t v15;
  __int16 v16;

  v5 = -[FLTSSUExample data_type](self, "data_type");
  if (-[FLTSSUExample data_type](self, "data_type") == 1)
  {
    -[FLTSSUExample dataAsFLTSSUExampleUtterance](self, "dataAsFLTSSUExampleUtterance");
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    v7 = objc_msgSend(v6, "addObjectToBuffer:", a3);

  }
  else
  {
    v7 = 0;
  }
  if (-[FLTSSUExample data_type](self, "data_type") == 2)
  {
    -[FLTSSUExample dataAsFLTSSUExampleEncodedVector](self, "dataAsFLTSSUExampleEncodedVector");
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    v9 = objc_msgSend(v8, "addObjectToBuffer:", a3);

    v10 = v9;
  }
  else
  {
    v10 = 0;
  }
  apple::aiml::flatbuffers2::FlatBufferBuilder::NotNested((uint64_t)a3);
  *((_BYTE *)a3 + 70) = 1;
  v11 = *((_QWORD *)a3 + 5);
  v12 = *((_QWORD *)a3 + 6);
  v13 = *((_QWORD *)a3 + 4);
  if (v5 || *((_BYTE *)a3 + 80))
  {
    apple::aiml::flatbuffers2::FlatBufferBuilder::Align((apple::aiml::flatbuffers2::FlatBufferBuilder *)a3, 1uLL);
    apple::aiml::flatbuffers2::vector_downward::ensure_space((apple::aiml::flatbuffers2::vector_downward *)a3, 1uLL);
    v14 = (_BYTE *)(*((_QWORD *)a3 + 6) - 1);
    *((_QWORD *)a3 + 6) = v14;
    *v14 = v5;
    v15 = (*((_DWORD *)a3 + 8) - *((_DWORD *)a3 + 12) + *((_DWORD *)a3 + 10));
    apple::aiml::flatbuffers2::vector_downward::ensure_space((apple::aiml::flatbuffers2::vector_downward *)a3, 8uLL);
    **((_QWORD **)a3 + 7) = v15 | 0x400000000;
    *((_QWORD *)a3 + 7) += 8;
    ++*((_DWORD *)a3 + 16);
    if (*((unsigned __int16 *)a3 + 34) <= 4u)
      v16 = 4;
    else
      v16 = *((_WORD *)a3 + 34);
    *((_WORD *)a3 + 34) = v16;
  }
  if (-[FLTSSUExample data_type](self, "data_type") == 1)
    apple::aiml::flatbuffers2::FlatBufferBuilder::AddOffset<void>((apple::aiml::flatbuffers2::FlatBufferBuilder *)a3, v7);
  if (-[FLTSSUExample data_type](self, "data_type") == 2)
    apple::aiml::flatbuffers2::FlatBufferBuilder::AddOffset<void>((apple::aiml::flatbuffers2::FlatBufferBuilder *)a3, v10);
  return (Offset<SSUExample>)apple::aiml::flatbuffers2::FlatBufferBuilder::EndTable((apple::aiml::flatbuffers2::FlatBufferBuilder *)a3, (int)v13 - (int)v12 + (int)v11);
}

- (id)flatbuffData
{
  Offset<SSUExample> v2;
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
  v2.var0 = -[FLTSSUExample addObjectToBuffer:](self, "addObjectToBuffer:", &v11);
  apple::aiml::flatbuffers2::FlatBufferBuilder::Finish((apple::aiml::flatbuffers2::FlatBufferBuilder *)&v11, v2.var0, v3);
  v4 = (apple::aiml::flatbuffers2::FlatBufferBuilder *)operator new();
  apple::aiml::flatbuffers2::FlatBufferBuilder::Release(v4, (uint64_t)&v11);
  v5 = objc_alloc(MEMORY[0x1E0C99D50]);
  v6 = *((_QWORD *)v4 + 4);
  v7 = *((_QWORD *)v4 + 5);
  v10[0] = MEMORY[0x1E0C809B0];
  v10[1] = 3221225472;
  v10[2] = __29__FLTSSUExample_flatbuffData__block_invoke;
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

apple::aiml::flatbuffers2::DetachedBuffer *__29__FLTSSUExample_flatbuffData__block_invoke(uint64_t a1)
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

+ (Class)data_immutableClassForType:(int64_t)a3
{
  if (a3 != 1 && a3 != 2)
    return (Class)0;
  objc_opt_class();
  return (Class)(id)objc_claimAutoreleasedReturnValue();
}

+ (int64_t)data_typeForImmutableObject:(id)a3
{
  id v3;
  int64_t v4;

  v3 = a3;
  if ((objc_msgSend(v3, "isMemberOfClass:", objc_opt_class()) & 1) != 0)
  {
    v4 = 1;
  }
  else if (objc_msgSend(v3, "isMemberOfClass:", objc_opt_class()))
  {
    v4 = 2;
  }
  else
  {
    v4 = 0;
  }

  return v4;
}

@end
