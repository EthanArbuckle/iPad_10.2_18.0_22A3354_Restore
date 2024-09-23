@implementation _PASBloomFilterForWriting

- (void)setWithHashes:(id)a3
{
  NSData *v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  int v9;
  unsigned int v10;
  int v11;
  uint64_t v12;
  char v13;

  v5 = self->super._data;
  v6 = objc_msgSend(objc_retainAutorelease(a3), "hashes");
  v13 = 0;
  if (self->super._numHashFunctions >= 1)
  {
    v7 = v6;
    v8 = 0;
    do
    {
      v9 = *(_DWORD *)(v7 + 4 * v8);
      if (v9 < 0)
        v9 = -v9;
      v10 = v9 % self->super._numBits;
      v11 = 1 << (v10 & 7);
      v12 = (v10 >> 3) + 16;
      -[NSData getBytes:range:](v5, "getBytes:range:", &v13, v12, 1);
      v13 |= v11;
      -[NSData replaceBytesInRange:withBytes:length:](v5, "replaceBytesInRange:withBytes:length:", v12, 1, &v13, 1);
      ++v8;
    }
    while (v8 < self->super._numHashFunctions);
  }

}

- (BOOL)saveToFile:(id)a3
{
  return -[NSData writeToFile:atomically:](self->super._data, "writeToFile:atomically:", a3, 0);
}

+ (id)bloomFilterInMemoryWithNumberOfValuesN:(unint64_t)a3 errorRateP:(float)a4
{
  uint64_t v4;
  unint64_t v5;
  float v6;
  double v7;
  double v8;
  unint64_t v9;
  _PASBloomFilterForWriting *v10;
  void *v11;
  uint64_t v13;
  unsigned int v14;
  unsigned int v15;

  v5 = 1000;
  if (a3 > 0x3E8)
    v5 = a3;
  v6 = 0.00001;
  if (a4 >= 0.00001)
  {
    v6 = a4;
    if (a4 > 0.99999)
      v6 = 0.99999;
  }
  v7 = (double)v5;
  v8 = (double)(unint64_t)ceil(log(v6) * (double)v5 / -0.480453014);
  LODWORD(v4) = vcvtad_u64_f64(v8 * 0.693147181 / v7);
  if (v4 <= 0x40
    && (v9 = vcvtps_u32_f32((float)(vcvtpd_u64_f64(v8 * 0.125) + 16) * 0.000061035), v9 << 14 <= 0x40000000))
  {
    v11 = (void *)objc_msgSend(objc_alloc(MEMORY[0x1E0C99DF0]), "initWithLength:", v9 << 14);
    v14 = bswap32(objc_msgSend(v11, "length", 0x1000000173F00B7) - 16);
    v15 = bswap32(v4);
    objc_msgSend(v11, "replaceBytesInRange:withBytes:length:", 0, 16, &v13, 16);
    v10 = -[_PASBloomFilter initWithData:numBits:hashFunctionCode:numHashFunctions:]([_PASBloomFilterForWriting alloc], "initWithData:numBits:hashFunctionCode:numHashFunctions:", v11, (((_DWORD)v9 << 17) - 128), 1, v4);

  }
  else
  {
    v10 = 0;
  }
  return v10;
}

@end
