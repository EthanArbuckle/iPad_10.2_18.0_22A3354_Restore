@implementation FLTCDMCATISwiftBloomFilter

- (FLTCDMCATISwiftBloomFilter)initWithFlatbuffData:(id)a3
{
  return -[FLTCDMCATISwiftBloomFilter initWithFlatbuffData:root:verify:](self, "initWithFlatbuffData:root:verify:", a3, 0, 0);
}

- (id)initAndVerifyWithFlatbuffData:(id)a3
{
  return -[FLTCDMCATISwiftBloomFilter initWithFlatbuffData:root:verify:](self, "initWithFlatbuffData:root:verify:", a3, 0, 1);
}

- (FLTCDMCATISwiftBloomFilter)initWithFlatbuffData:(id)a3 root:(const CDMCATISwiftBloomFilter *)a4
{
  return -[FLTCDMCATISwiftBloomFilter initWithFlatbuffData:root:verify:](self, "initWithFlatbuffData:root:verify:", a3, a4, 0);
}

- (FLTCDMCATISwiftBloomFilter)initWithFlatbuffData:(id)a3 root:(const CDMCATISwiftBloomFilter *)a4 verify:(BOOL)a5
{
  _BOOL4 v5;
  id v9;
  FLTCDMCATISwiftBloomFilter *v10;
  id *p_data;
  unsigned int *v12;
  unint64_t v13;
  uint64_t v14;
  const CDMCATISwiftBloomFilter *root;
  uint64_t v17;
  unint64_t v18;
  CDMCATISwiftBloomFilter *v19;
  FLTCDMCATISwiftBloomFilter *v20;
  _QWORD v22[2];
  __int128 v23;
  uint64_t v24;
  char v25;
  objc_super v26;

  v5 = a5;
  v9 = a3;
  v26.receiver = self;
  v26.super_class = (Class)FLTCDMCATISwiftBloomFilter;
  v10 = -[FLTCDMCATISwiftBloomFilter init](&v26, sel_init);
  if (!v10)
    goto LABEL_14;
  if (!v9 || !objc_msgSend(v9, "length"))
    goto LABEL_15;
  p_data = (id *)&v10->_data;
  objc_storeStrong((id *)&v10->_data, a3);
  if (!a4)
  {
    v12 = (unsigned int *)objc_msgSend(*p_data, "bytes");
    a4 = (const CDMCATISwiftBloomFilter *)v12 + *v12;
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
  v19 = (CDMCATISwiftBloomFilter *)v10->_root;
  if (v19 && !CDMCATISwiftBloomFilter::Verify(v19, (apple::aiml::flatbuffers2::Verifier *)v22))
LABEL_15:
    v20 = 0;
  else
LABEL_14:
    v20 = v10;

  return v20;
}

- (FLTCDMCATISwiftBitVector)bit_vector
{
  FLTCDMCATISwiftBitVector *v3;
  FLTCDMCATISwiftBitVector *v4;
  const CDMCATISwiftBloomFilter *root;
  const CDMCATISwiftBloomFilter *v6;
  uint64_t v7;
  const CDMCATISwiftBloomFilter *v8;

  -[NSMutableDictionary objectForKeyedSubscript:](self->_storage, "objectForKeyedSubscript:", CFSTR("bit_vector"));
  v3 = (FLTCDMCATISwiftBitVector *)objc_claimAutoreleasedReturnValue();
  if (!v3)
  {
    v4 = [FLTCDMCATISwiftBitVector alloc];
    root = self->_root;
    v6 = &root[-*(int *)root->var0];
    if (*(unsigned __int16 *)v6->var0 >= 5u && (v7 = *(unsigned __int16 *)v6[4].var0) != 0)
      v8 = &root[v7 + *(unsigned int *)root[v7].var0];
    else
      v8 = 0;
    v3 = -[FLTCDMCATISwiftBitVector initWithFlatbuffData:root:verify:](v4, "initWithFlatbuffData:root:verify:", self->_data, v8, 0);
    -[NSMutableDictionary setObject:forKeyedSubscript:](self->_storage, "setObject:forKeyedSubscript:", v3, CFSTR("bit_vector"));
  }
  return v3;
}

- (unint64_t)number_of_bits
{
  const CDMCATISwiftBloomFilter *root;
  const CDMCATISwiftBloomFilter *v3;
  uint64_t v4;

  root = self->_root;
  v3 = &root[-*(int *)root->var0];
  if (*(unsigned __int16 *)v3->var0 >= 7u && (v4 = *(unsigned __int16 *)v3[6].var0) != 0)
    return *(_QWORD *)root[v4].var0;
  else
    return 0;
}

- (unint64_t)number_of_hashes
{
  const CDMCATISwiftBloomFilter *root;
  const CDMCATISwiftBloomFilter *v3;
  uint64_t v4;

  root = self->_root;
  v3 = &root[-*(int *)root->var0];
  if (*(unsigned __int16 *)v3->var0 >= 9u && (v4 = *(unsigned __int16 *)v3[8].var0) != 0)
    return *(_QWORD *)root[v4].var0;
  else
    return 0;
}

- (unint64_t)seed
{
  const CDMCATISwiftBloomFilter *root;
  const CDMCATISwiftBloomFilter *v3;
  uint64_t v4;

  root = self->_root;
  v3 = &root[-*(int *)root->var0];
  if (*(unsigned __int16 *)v3->var0 >= 0xBu && (v4 = *(unsigned __int16 *)v3[10].var0) != 0)
    return *(_QWORD *)root[v4].var0;
  else
    return 0;
}

- (unsigned)expected_number_of_items
{
  const CDMCATISwiftBloomFilter *root;
  const CDMCATISwiftBloomFilter *v3;
  uint64_t v4;

  root = self->_root;
  v3 = &root[-*(int *)root->var0];
  if (*(unsigned __int16 *)v3->var0 >= 0xDu && (v4 = *(unsigned __int16 *)v3[12].var0) != 0)
    return *(_DWORD *)root[v4].var0;
  else
    return 0;
}

- (double)false_positive_rate
{
  const CDMCATISwiftBloomFilter *root;
  const CDMCATISwiftBloomFilter *v3;
  double result;
  uint64_t v5;

  root = self->_root;
  v3 = &root[-*(int *)root->var0];
  result = 0.0;
  if (*(unsigned __int16 *)v3->var0 >= 0xFu)
  {
    v5 = *(unsigned __int16 *)v3[14].var0;
    if (v5)
      return *(double *)root[v5].var0;
  }
  return result;
}

- (NSString)name
{
  const CDMCATISwiftBloomFilter *root;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  const CDMCATISwiftBloomFilter *v6;

  root = self->_root;
  v3 = *(int *)root->var0;
  v4 = *(unsigned __int16 *)root[-v3 + 16].var0;
  if (*(_WORD *)root[-v3 + 16].var0)
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
  return (NSString *)(id)objc_msgSend(objc_alloc(MEMORY[0x1E0CB3940]), "initWithBytes:length:encoding:", &v6[4], *(unsigned int *)root[v4 + v5].var0, 4);
}

- (unsigned)number_of_items
{
  const CDMCATISwiftBloomFilter *root;
  const CDMCATISwiftBloomFilter *v3;
  uint64_t v4;

  root = self->_root;
  v3 = &root[-*(int *)root->var0];
  if (*(unsigned __int16 *)v3->var0 >= 0x13u && (v4 = *(unsigned __int16 *)v3[18].var0) != 0)
    return *(_DWORD *)root[v4].var0;
  else
    return 0;
}

- (unsigned)expected_items_buffer
{
  const CDMCATISwiftBloomFilter *root;
  const CDMCATISwiftBloomFilter *v3;
  uint64_t v4;

  root = self->_root;
  v3 = &root[-*(int *)root->var0];
  if (*(unsigned __int16 *)v3->var0 >= 0x15u && (v4 = *(unsigned __int16 *)v3[20].var0) != 0)
    return *(_DWORD *)root[v4].var0;
  else
    return 1234;
}

- (Offset<CDMCATISwiftBloomFilter>)addObjectToBuffer:(void *)a3
{
  void *v5;
  unsigned int v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t v9;
  int v10;
  double v11;
  double v12;
  __CFString *v13;
  __CFString *v14;
  const char *v15;
  size_t v16;
  int v17;
  uint64_t v18;
  uint64_t v19;
  uint64_t v20;
  int v21;
  uint64_t v22;
  uint64_t v23;
  unsigned int v24;
  int v26;
  unsigned int String;

  -[FLTCDMCATISwiftBloomFilter bit_vector](self, "bit_vector");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  v6 = objc_msgSend(v5, "addObjectToBuffer:", a3);

  v7 = -[FLTCDMCATISwiftBloomFilter number_of_bits](self, "number_of_bits");
  v8 = -[FLTCDMCATISwiftBloomFilter number_of_hashes](self, "number_of_hashes");
  v9 = -[FLTCDMCATISwiftBloomFilter seed](self, "seed");
  v10 = -[FLTCDMCATISwiftBloomFilter expected_number_of_items](self, "expected_number_of_items");
  -[FLTCDMCATISwiftBloomFilter false_positive_rate](self, "false_positive_rate");
  v12 = v11;
  -[FLTCDMCATISwiftBloomFilter name](self, "name");
  v13 = (__CFString *)objc_claimAutoreleasedReturnValue();
  v14 = v13;
  if (!v13)
    v13 = &stru_1E7BB3508;
  v15 = (const char *)-[__CFString UTF8String](objc_retainAutorelease(v13), "UTF8String");
  v16 = strlen(v15);
  String = apple::aiml::flatbuffers2::FlatBufferBuilder::CreateString((apple::aiml::flatbuffers2::FlatBufferBuilder *)a3, v15, v16);

  v17 = -[FLTCDMCATISwiftBloomFilter number_of_items](self, "number_of_items");
  v26 = -[FLTCDMCATISwiftBloomFilter expected_items_buffer](self, "expected_items_buffer");
  apple::aiml::flatbuffers2::FlatBufferBuilder::NotNested((uint64_t)a3);
  *((_BYTE *)a3 + 70) = 1;
  v19 = *((_QWORD *)a3 + 5);
  v18 = *((_QWORD *)a3 + 6);
  v20 = *((_QWORD *)a3 + 4);
  if (v6)
  {
    v21 = apple::aiml::flatbuffers2::FlatBufferBuilder::ReferTo((apple::aiml::flatbuffers2::FlatBufferBuilder *)a3, v6);
    apple::aiml::flatbuffers2::FlatBufferBuilder::AddElement<unsigned int>((unint64_t)a3, 4, v21, 0);
  }
  apple::aiml::flatbuffers2::FlatBufferBuilder::AddElement<unsigned long long>((apple::aiml::flatbuffers2::vector_downward *)a3, 6, v7);
  apple::aiml::flatbuffers2::FlatBufferBuilder::AddElement<unsigned long long>((apple::aiml::flatbuffers2::vector_downward *)a3, 8, v8);
  apple::aiml::flatbuffers2::FlatBufferBuilder::AddElement<unsigned long long>((apple::aiml::flatbuffers2::vector_downward *)a3, 10, v9);
  apple::aiml::flatbuffers2::FlatBufferBuilder::AddElement<unsigned int>((unint64_t)a3, 12, v10, 0);
  if (v12 != 0.0 || *((_BYTE *)a3 + 80))
  {
    apple::aiml::flatbuffers2::FlatBufferBuilder::Align((apple::aiml::flatbuffers2::FlatBufferBuilder *)a3, 8uLL);
    apple::aiml::flatbuffers2::vector_downward::ensure_space((apple::aiml::flatbuffers2::vector_downward *)a3, 8uLL);
    v22 = *((_QWORD *)a3 + 6);
    *(double *)(v22 - 8) = v12;
    v22 -= 8;
    *((_QWORD *)a3 + 6) = v22;
    v23 = (*((_DWORD *)a3 + 8) - v22 + *((_DWORD *)a3 + 10));
    apple::aiml::flatbuffers2::vector_downward::ensure_space((apple::aiml::flatbuffers2::vector_downward *)a3, 8uLL);
    **((_QWORD **)a3 + 7) = v23 | 0xE00000000;
    *((_QWORD *)a3 + 7) += 8;
    ++*((_DWORD *)a3 + 16);
    v24 = *((unsigned __int16 *)a3 + 34);
    if (v24 <= 0xE)
      LOWORD(v24) = 14;
    *((_WORD *)a3 + 34) = v24;
  }
  apple::aiml::flatbuffers2::FlatBufferBuilder::AddOffset<apple::aiml::flatbuffers2::String>((apple::aiml::flatbuffers2::FlatBufferBuilder *)a3, 16, String);
  apple::aiml::flatbuffers2::FlatBufferBuilder::AddElement<unsigned int>((unint64_t)a3, 18, v17, 0);
  apple::aiml::flatbuffers2::FlatBufferBuilder::AddElement<unsigned int>((unint64_t)a3, 20, v26, 1234);
  return (Offset<CDMCATISwiftBloomFilter>)apple::aiml::flatbuffers2::FlatBufferBuilder::EndTable((apple::aiml::flatbuffers2::FlatBufferBuilder *)a3, (int)v20 - (int)v18 + (int)v19);
}

- (id)flatbuffData
{
  Offset<CDMCATISwiftBloomFilter> v2;
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
  v2.var0 = -[FLTCDMCATISwiftBloomFilter addObjectToBuffer:](self, "addObjectToBuffer:", &v11);
  apple::aiml::flatbuffers2::FlatBufferBuilder::Finish((apple::aiml::flatbuffers2::FlatBufferBuilder *)&v11, v2.var0, v3);
  v4 = (apple::aiml::flatbuffers2::FlatBufferBuilder *)operator new();
  apple::aiml::flatbuffers2::FlatBufferBuilder::Release(v4, (uint64_t)&v11);
  v5 = objc_alloc(MEMORY[0x1E0C99D50]);
  v6 = *((_QWORD *)v4 + 4);
  v7 = *((_QWORD *)v4 + 5);
  v10[0] = MEMORY[0x1E0C809B0];
  v10[1] = 3221225472;
  v10[2] = __42__FLTCDMCATISwiftBloomFilter_flatbuffData__block_invoke;
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

apple::aiml::flatbuffers2::DetachedBuffer *__42__FLTCDMCATISwiftBloomFilter_flatbuffData__block_invoke(uint64_t a1)
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

@end
