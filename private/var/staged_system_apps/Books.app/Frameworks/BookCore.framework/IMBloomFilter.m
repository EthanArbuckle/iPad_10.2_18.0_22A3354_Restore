@implementation IMBloomFilter

- (IMBloomFilter)initWithSpecification:(id *)a3 hashProvider:(id)a4
{
  id v6;
  IMBloomFilter *v7;
  IMBloomFilter *v8;
  __int128 v9;
  id v10;
  id hashProvider;
  double v12;
  size_t v13;
  objc_super v15;

  v6 = a4;
  v15.receiver = self;
  v15.super_class = (Class)IMBloomFilter;
  v7 = -[IMBloomFilter init](&v15, "init");
  v8 = v7;
  if (v7)
  {
    v9 = *(_OWORD *)&a3->var0;
    v7->_specification.numberOfHashFunctions = a3->var2;
    *(_OWORD *)&v7->_specification.expectedNumberOfInsertions = v9;
    v10 = objc_msgSend(v6, "copy");
    hashProvider = v8->_hashProvider;
    v8->_hashProvider = v10;

    v12 = v8->_specification.loadFactor * (double)v8->_specification.expectedNumberOfInsertions * 0.125;
    if (v12 < 1.0)
      v12 = 1.0;
    v13 = malloc_good_size((uint64_t)v12);
    v8->_bitVector.byteCount = v13;
    v8->_bitVector.bytes = (char *)malloc_type_calloc(1uLL, v13, 0x1D482DBCuLL);
  }

  return v8;
}

+ (BOOL)supportsSecureCoding
{
  return 1;
}

- (void)encodeWithCoder:(id)a3
{
  $D8CE038B2BFE8E0EE83F5A270A705C16 *p_specification;
  id v5;

  p_specification = &self->_specification;
  v5 = a3;
  objc_msgSend(v5, "encodeBytes:length:forKey:", p_specification, 24, CFSTR("specification"));
  objc_msgSend(v5, "encodeBytes:length:forKey:", self->_bitVector.bytes, self->_bitVector.byteCount, CFSTR("bytes"));

}

- (IMBloomFilter)initWithCoder:(id)a3
{
  id v4;
  IMBloomFilter *v5;
  id v6;
  _QWORD *v7;
  int64_t v8;
  id v9;
  size_t v10;
  char *v11;
  id v12;
  void *v13;
  id v14;
  id hashProvider;
  size_t size;
  uint64_t v18;
  objc_super v19;

  v4 = a3;
  v19.receiver = self;
  v19.super_class = (Class)IMBloomFilter;
  v5 = -[IMBloomFilter init](&v19, "init");
  if (v5)
  {
    v18 = 0;
    v6 = objc_retainAutorelease(v4);
    v7 = objc_msgSend(v6, "decodeBytesForKey:returnedLength:", CFSTR("specification"), &v18);
    v8 = v7[2];
    *(_OWORD *)&v5->_specification.expectedNumberOfInsertions = *(_OWORD *)v7;
    v5->_specification.numberOfHashFunctions = v8;
    size = 0;
    v9 = objc_msgSend(objc_retainAutorelease(v6), "decodeBytesForKey:returnedLength:", CFSTR("bytes"), &size);
    v10 = size;
    v5->_bitVector.byteCount = size;
    v11 = (char *)malloc_type_malloc(v10, 0xA50B004uLL);
    v5->_bitVector.bytes = v11;
    memcpy(v11, v9, v5->_bitVector.byteCount);
    v12 = IMBloomFilterCharacterHashProvider();
    v13 = (void *)objc_claimAutoreleasedReturnValue(v12);
    v14 = objc_msgSend(v13, "copy");
    hashProvider = v5->_hashProvider;
    v5->_hashProvider = v14;

  }
  return v5;
}

- (void)dealloc
{
  char *bytes;
  objc_super v4;

  bytes = self->_bitVector.bytes;
  if (bytes)
  {
    free(bytes);
    self->_bitVector.bytes = 0;
  }
  v4.receiver = self;
  v4.super_class = (Class)IMBloomFilter;
  -[IMBloomFilter dealloc](&v4, "dealloc");
}

- (void)addKey:(const void *)a3
{
  int64_t v4;
  _QWORD *v5;
  int v6;
  uint64_t v7;
  _OWORD v8[7];

  memset(v8, 0, sizeof(v8));
  sub_159C20((uint64_t)v8, self);
  if (self->_specification.numberOfHashFunctions >= 1)
  {
    v4 = 0;
    v5 = (_QWORD *)v8 + 1;
    do
    {
      v6 = 1 << *((_BYTE *)v5 - 8);
      v7 = *v5;
      v5 += 2;
      self->_bitVector.bytes[v7] |= v6;
      ++v4;
    }
    while (v4 < self->_specification.numberOfHashFunctions);
  }
}

- (BOOL)mightContainKey:(const void *)a3
{
  int64_t v4;
  _QWORD *v5;
  uint64_t v6;
  char v7;
  _OWORD v9[7];

  memset(v9, 0, sizeof(v9));
  sub_159C20((uint64_t)v9, self);
  v4 = (self->_specification.numberOfHashFunctions & ~(self->_specification.numberOfHashFunctions >> 63)) + 1;
  v5 = (_QWORD *)v9 + 1;
  do
  {
    if (!--v4)
      break;
    v6 = *v5;
    v7 = *((_BYTE *)v5 - 8);
    v5 += 2;
  }
  while (((self->_bitVector.bytes[v6] >> v7) & 1) != 0);
  return v4 == 0;
}

- (NSString)usageDescription
{
  unint64_t byteCount;
  uint64_t v3;
  uint64_t v4;
  int64x2_t v5;
  uint32x2_t v6;
  uint64_t v7;
  int32x2_t v8;
  uint64_t v9;
  float v10;

  byteCount = self->_bitVector.byteCount;
  if (byteCount)
  {
    v3 = 0;
    v4 = 0;
    do
    {
      v5 = (int64x2_t)(unint64_t)v4;
      v6 = (uint32x2_t)vdup_n_s32(self->_bitVector.bytes[v3]);
      v7 = 8;
      v8 = (int32x2_t)0x100000000;
      do
      {
        v5 = (int64x2_t)vaddw_u32((uint64x2_t)v5, (uint32x2_t)(*(_QWORD *)&vshl_u32(v6, (uint32x2_t)vneg_s32(v8)) & 0xFFFFFF01FFFFFF01));
        v8 = vadd_s32(v8, (int32x2_t)0x200000002);
        v7 -= 2;
      }
      while (v7);
      v9 = vaddvq_s64(v5);
      v4 = v9;
      ++v3;
    }
    while (v3 != byteCount);
    v10 = (float)v9;
  }
  else
  {
    v10 = 0.0;
  }
  return +[NSString stringWithFormat:](NSString, "stringWithFormat:", CFSTR("%.2f%% of bits turned on."), (float)((float)(v10 / (float)(8 * byteCount)) * 100.0));
}

- (int64_t)indexSize
{
  return self->_bitVector.byteCount;
}

- (void).cxx_destruct
{
  objc_storeStrong(&self->_hashProvider, 0);
}

@end
