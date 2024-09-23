@implementation PXDisplayAssetFetchResultEnumerator

- (PXDisplayAssetFetchResultEnumerator)initWithDisplayAssetFetchResult:(id)a3
{
  id v5;
  PXDisplayAssetFetchResultEnumerator *v6;
  PXDisplayAssetFetchResultEnumerator *v7;
  objc_super v9;

  v5 = a3;
  v9.receiver = self;
  v9.super_class = (Class)PXDisplayAssetFetchResultEnumerator;
  v6 = -[PXDisplayAssetFetchResultEnumerator init](&v9, sel_init);
  v7 = v6;
  if (v6)
    objc_storeStrong((id *)&v6->_fetchResult, a3);

  return v7;
}

- (PXDisplayAssetFetchResultEnumerator)init
{
  void *v4;

  objc_msgSend(MEMORY[0x24BDD1448], "currentHandler");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "handleFailureInMethod:object:file:lineNumber:description:", a2, self, CFSTR("PXDisplayAssetFetchResultEnumerator.m"), 28, CFSTR("%s is not available as initializer"), "-[PXDisplayAssetFetchResultEnumerator init]");

  abort();
}

- (id)copyWithZone:(_NSZone *)a3
{
  return -[PXDisplayAssetFetchResultEnumerator initWithDisplayAssetFetchResult:]([PXDisplayAssetFetchResultEnumerator alloc], "initWithDisplayAssetFetchResult:", self->_fetchResult);
}

- (void)reset
{
  self->_currentIndex = 0;
}

- (unint64_t)count
{
  return -[PXDisplayAssetFetchResult count](self->_fetchResult, "count");
}

- (id)nextObject
{
  unint64_t currentIndex;
  void *v4;

  currentIndex = self->_currentIndex;
  if (currentIndex >= -[PXDisplayAssetFetchResultEnumerator count](self, "count"))
  {
    v4 = 0;
  }
  else
  {
    -[PXDisplayAssetFetchResult objectAtIndex:](self->_fetchResult, "objectAtIndex:", self->_currentIndex);
    v4 = (void *)objc_claimAutoreleasedReturnValue();
    ++self->_currentIndex;
  }
  return v4;
}

- (id)firstObject
{
  return (id)-[PXDisplayAssetFetchResult firstObject](self->_fetchResult, "firstObject");
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_fetchResult, 0);
}

@end
