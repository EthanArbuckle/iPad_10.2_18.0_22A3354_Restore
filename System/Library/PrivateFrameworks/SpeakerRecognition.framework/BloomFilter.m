@implementation BloomFilter

- (BloomFilter)initWithExpectedNumberOfItems:(unint64_t)a3 falsePositiveRate:(double)a4 seed:(unsigned int)a5
{
  BloomFilter *v8;
  unint64_t v9;
  unint64_t v10;
  BitVector *v11;
  BitVector *bitVector;
  void *v13;
  uint64_t v14;
  unint64_t expectedNumberOfItems;
  double falsePositiveRate;
  unint64_t numberHashes;
  unint64_t numberOfBits;
  BitVector *v19;
  NSObject *v20;
  void *v21;
  objc_super v23;
  uint8_t buf[4];
  const char *v25;
  __int16 v26;
  unint64_t v27;
  __int16 v28;
  double v29;
  __int16 v30;
  unint64_t v31;
  __int16 v32;
  unint64_t v33;
  __int16 v34;
  uint64_t v35;
  __int16 v36;
  void *v37;
  uint64_t v38;

  v38 = *MEMORY[0x24BDAC8D0];
  v23.receiver = self;
  v23.super_class = (Class)BloomFilter;
  v8 = -[BloomFilter init](&v23, sel_init);
  if (v8)
  {
    SSRLogInitIfNeeded();
    v8->_seed = a5;
    v9 = a3 + a5;
    v8->_expectedNumberOfItems = v9;
    v8->_falsePositiveRate = a4;
    v10 = vcvtpd_u64_f64(log(a4) * (double)v9 / -0.480453014);
    v8->_numberOfBits = v10;
    v8->_numberHashes = vcvtpd_u64_f64((double)(v10 / v9) * 0.693147181);
    v11 = -[BitVector initWithNumberOfBits:]([BitVector alloc], "initWithNumberOfBits:", v8->_numberOfBits);
    bitVector = v8->_bitVector;
    v8->_bitVector = v11;

    v13 = (void *)*MEMORY[0x24BE284B8];
    if (os_log_type_enabled((os_log_t)*MEMORY[0x24BE284B8], OS_LOG_TYPE_INFO))
    {
      v14 = a5;
      expectedNumberOfItems = v8->_expectedNumberOfItems;
      falsePositiveRate = v8->_falsePositiveRate;
      numberOfBits = v8->_numberOfBits;
      numberHashes = v8->_numberHashes;
      v19 = v8->_bitVector;
      v20 = v13;
      -[BitVector description](v19, "description");
      v21 = (void *)objc_claimAutoreleasedReturnValue();
      *(_DWORD *)buf = 136316674;
      v25 = "-[BloomFilter initWithExpectedNumberOfItems:falsePositiveRate:seed:]";
      v26 = 2048;
      v27 = expectedNumberOfItems;
      v28 = 2048;
      v29 = falsePositiveRate;
      v30 = 2048;
      v31 = numberOfBits;
      v32 = 2048;
      v33 = numberHashes;
      v34 = 2048;
      v35 = v14;
      v36 = 2112;
      v37 = v21;
      _os_log_impl(&dword_2117D4000, v20, OS_LOG_TYPE_INFO, "%s _expectedNumberOfItems: %lu\n _falsePositiveRate: %f\n _numberOfBits: %lu\n _numberHashes: %lu\n seed: %lu\n BitVector: %@\n", buf, 0x48u);

    }
  }
  return v8;
}

- (void)_loadBitVectorData:(id)a3
{
  -[BitVector loadData:](self->_bitVector, "loadData:", a3);
}

- (void)add:(id)a3
{
  uint64_t v4;
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  int v9;
  id v10;

  v10 = objc_retainAutorelease(a3);
  v4 = +[MurmurHasher hash128WithKey:length:seed:](MurmurHasher, "hash128WithKey:length:seed:", objc_msgSend(v10, "bytes"), objc_msgSend(v10, "length"), self->_seed);
  if (self->_numberHashes)
  {
    v6 = v4;
    v7 = v5;
    v8 = 0;
    v9 = 0;
    do
    {
      -[BitVector setAtIndex:](self->_bitVector, "setAtIndex:", (v6 + v8 * v7) % self->_numberOfBits);
      v8 = ++v9;
    }
    while (self->_numberHashes > v9);
  }

}

- (BOOL)contains:(id)a3
{
  id v4;
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t v9;
  int v10;
  BOOL v11;

  v4 = objc_retainAutorelease(a3);
  v5 = +[MurmurHasher hash128WithKey:length:seed:](MurmurHasher, "hash128WithKey:length:seed:", objc_msgSend(v4, "bytes"), objc_msgSend(v4, "length"), self->_seed);
  if (self->_numberHashes)
  {
    v7 = v5;
    v8 = v6;
    v9 = 0;
    v10 = 0;
    do
    {
      v11 = -[BitVector testAtIndex:](self->_bitVector, "testAtIndex:", (v7 + v9 * v8) % self->_numberOfBits);
      if (!v11)
        break;
      v9 = ++v10;
    }
    while (self->_numberHashes > v10);
  }
  else
  {
    v11 = 1;
  }

  return v11;
}

- (BloomFilter)initWithCoder:(id)a3
{
  id v4;
  void *v5;
  uint64_t v6;
  double v7;
  double v8;
  void *v9;
  uint64_t v10;
  BloomFilter *v11;

  v4 = a3;
  objc_msgSend(v4, "decodeObjectOfClass:forKey:", objc_opt_class(), CFSTR("SSRBitVector-Data"));
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  v6 = objc_msgSend(v4, "decodeInt32ForKey:", CFSTR("SSRBloomFilter-Seed"));
  objc_msgSend(v4, "decodeDoubleForKey:", CFSTR("SSRBloomFilter-FalsePositiveRate"));
  v8 = v7;
  objc_msgSend(v4, "decodeObjectOfClass:forKey:", objc_opt_class(), CFSTR("SSRBloomFilter-NumItems"));
  v9 = (void *)objc_claimAutoreleasedReturnValue();

  v10 = objc_msgSend(v9, "unsignedIntegerValue") - v6;
  v11 = -[BloomFilter initWithExpectedNumberOfItems:falsePositiveRate:seed:](self, "initWithExpectedNumberOfItems:falsePositiveRate:seed:", v10, v6, v8);
  -[BloomFilter _loadBitVectorData:](v11, "_loadBitVectorData:", v5);

  return v11;
}

- (void)encodeWithCoder:(id)a3
{
  BitVector *bitVector;
  void *v5;
  void *v6;
  id v7;

  bitVector = self->_bitVector;
  v7 = a3;
  -[BitVector bvData](bitVector, "bvData");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v7, "encodeObject:forKey:", v5, CFSTR("SSRBitVector-Data"));

  objc_msgSend(MEMORY[0x24BDD16E0], "numberWithUnsignedInteger:", self->_expectedNumberOfItems);
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v7, "encodeObject:forKey:", v6, CFSTR("SSRBloomFilter-NumItems"));

  objc_msgSend(v7, "encodeDouble:forKey:", CFSTR("SSRBloomFilter-FalsePositiveRate"), self->_falsePositiveRate);
  objc_msgSend(v7, "encodeInt32:forKey:", self->_seed, CFSTR("SSRBloomFilter-Seed"));

}

- (unsigned)seed
{
  return self->_seed;
}

- (unint64_t)expectedNumberOfItems
{
  return self->_expectedNumberOfItems;
}

- (double)falsePositiveRate
{
  return self->_falsePositiveRate;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_bitVector, 0);
}

+ (BOOL)supportsSecureCoding
{
  return 1;
}

@end
