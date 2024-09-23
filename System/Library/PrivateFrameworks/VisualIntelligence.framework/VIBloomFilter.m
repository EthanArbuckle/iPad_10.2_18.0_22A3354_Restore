@implementation VIBloomFilter

- (VIBloomFilter)initWithNumberOfHashes:(unsigned int)a3 numberOfBits:(unint64_t)a4 seed:(unsigned int)a5
{
  VIBloomFilter *v8;
  VIBloomFilter *v9;
  VIBitVector *v10;
  VIBitVector *bits;
  objc_super v13;

  v13.receiver = self;
  v13.super_class = (Class)VIBloomFilter;
  v8 = -[VIBloomFilter init](&v13, sel_init);
  v9 = v8;
  if (v8)
  {
    v8->_numberOfBits = a4;
    v8->_seed = a5;
    v8->_numberOfHashes = a3;
    v8->_numberOfAddedItems = 0;
    v10 = -[VIBitVector initWithNumberOfBits:]([VIBitVector alloc], "initWithNumberOfBits:", v8->_numberOfBits);
    bits = v9->_bits;
    v9->_bits = v10;

  }
  return v9;
}

- (VIBloomFilter)initWithData:(id)a3 numberOfHashes:(unsigned int)a4 numberOfBits:(unsigned int)a5 seed:(unsigned int)a6 error:(id *)a7
{
  id v12;
  VIBloomFilter *v13;
  VIBloomFilter *v14;
  VIBitVector *v15;
  VIBitVector *bits;
  unint64_t numberOfBits;
  void *v18;
  void *v19;
  objc_super v21;
  uint64_t v22;
  _QWORD v23[2];

  v23[1] = *MEMORY[0x1E0C80C00];
  v12 = a3;
  v21.receiver = self;
  v21.super_class = (Class)VIBloomFilter;
  v13 = -[VIBloomFilter init](&v21, sel_init);
  v14 = v13;
  if (!v13)
    goto LABEL_5;
  v13->_numberOfBits = a5;
  v13->_seed = a6;
  v13->_numberOfHashes = a4;
  v13->_numberOfAddedItems = 0;
  v15 = -[VIBitVector initWithData:]([VIBitVector alloc], "initWithData:", v12);
  bits = v14->_bits;
  v14->_bits = v15;

  numberOfBits = v14->_numberOfBits;
  if (numberOfBits > -[VIBitVector numberOfBits](v14->_bits, "numberOfBits"))
  {
    if (a7)
    {
      v22 = *MEMORY[0x1E0CB2D50];
      objc_msgSend(MEMORY[0x1E0CB3940], "stringWithFormat:", CFSTR("Incompatible data with bits: %lu and number of bits %lu"), -[VIBitVector numberOfBits](v14->_bits, "numberOfBits"), v14->_numberOfBits);
      v18 = (void *)objc_claimAutoreleasedReturnValue();
      v23[0] = v18;
      objc_msgSend(MEMORY[0x1E0C99D80], "dictionaryWithObjects:forKeys:count:", v23, &v22, 1);
      v19 = (void *)objc_claimAutoreleasedReturnValue();

      objc_msgSend(MEMORY[0x1E0CB35C8], "errorWithDomain:code:userInfo:", CFSTR("com.apple.argos.bloom_filter.error_domain"), 1, v19);
      *a7 = (id)objc_claimAutoreleasedReturnValue();

      a7 = 0;
    }
  }
  else
  {
LABEL_5:
    a7 = v14;
  }

  return (VIBloomFilter *)a7;
}

- (void)addItem:(id)a3
{
  int v4;
  uint64_t v5;
  uint64_t v6;
  _QWORD v7[3];

  v7[2] = *MEMORY[0x1E0C80C00];
  _HashItem(a3, v7);
  if (self->_numberOfHashes)
  {
    v4 = 0;
    v5 = v7[0];
    v6 = v7[1];
    do
      -[VIBitVector setAtIndex:](self->_bits, "setAtIndex:", (v5 + v6 * (unint64_t)v4++) % self->_numberOfBits);
    while (self->_numberOfHashes > v4);
  }
  ++self->_numberOfAddedItems;
}

- (BOOL)containsItem:(id)a3
{
  unsigned __int8 v4;
  uint64_t v5;
  uint64_t v6;
  BOOL result;
  _QWORD v8[3];

  v8[2] = *MEMORY[0x1E0C80C00];
  _HashItem(a3, v8);
  if (!self->_numberOfHashes)
    return 1;
  v4 = 0;
  v5 = v8[0];
  v6 = v8[1];
  do
  {
    result = -[VIBitVector checkAtIndex:](self->_bits, "checkAtIndex:", (v5 + v6 * (unint64_t)v4) % self->_numberOfBits);
    if (!result)
      break;
    ++v4;
  }
  while (self->_numberOfHashes > v4);
  return result;
}

- (id)data
{
  return -[VIBitVector data](self->_bits, "data");
}

- (id)description
{
  return (id)objc_msgSend(MEMORY[0x1E0CB3940], "stringWithFormat:", CFSTR("numberOfBits: %ld, numberOfHashes: %d, seed: %d"), self->_numberOfBits, self->_numberOfHashes, self->_seed);
}

- (unsigned)seed
{
  return self->_seed;
}

- (unint64_t)numberOfBits
{
  return self->_numberOfBits;
}

- (unsigned)numberOfHashes
{
  return self->_numberOfHashes;
}

- (unsigned)numberOfAddedItems
{
  return self->_numberOfAddedItems;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_bits, 0);
}

@end
