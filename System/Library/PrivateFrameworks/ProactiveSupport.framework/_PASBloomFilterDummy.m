@implementation _PASBloomFilterDummy

- (_PASBloomFilterDummy)initWithResult:(BOOL)a3
{
  _PASBloomFilterDummy *result;
  objc_super v5;

  v5.receiver = self;
  v5.super_class = (Class)_PASBloomFilterDummy;
  result = -[_PASBloomFilter initDummy](&v5, sel_initDummy);
  if (result)
    *((_BYTE *)&result->super._hashArrayLength + 4) = a3;
  return result;
}

- (BOOL)getWithHashes:(id)a3
{
  return *((_BYTE *)&self->super._hashArrayLength + 4);
}

+ (id)instanceThatAlwaysReturns:(BOOL)a3
{
  return -[_PASBloomFilterDummy initWithResult:]([_PASBloomFilterDummy alloc], "initWithResult:", a3);
}

@end
