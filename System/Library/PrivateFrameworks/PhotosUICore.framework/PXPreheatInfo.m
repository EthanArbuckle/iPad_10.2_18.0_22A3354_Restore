@implementation PXPreheatInfo

- (PXPreheatInfo)initWithFetchResult:(id)a3 origin:(int64_t)a4
{
  id v7;
  PXPreheatInfo *v8;
  NSMutableIndexSet *v9;
  NSMutableIndexSet *preheatedIndexes;
  objc_super v12;

  v7 = a3;
  v12.receiver = self;
  v12.super_class = (Class)PXPreheatInfo;
  v8 = -[PXPreheatInfo init](&v12, sel_init);
  if (v8)
  {
    v9 = (NSMutableIndexSet *)objc_alloc_init(MEMORY[0x1E0CB3788]);
    preheatedIndexes = v8->_preheatedIndexes;
    v8->_preheatedIndexes = v9;

    objc_storeStrong((id *)&v8->_fetchResult, a3);
    v8->_preheatOrigin = a4;
  }

  return v8;
}

- (void)markAsFinished
{
  NSMutableIndexSet *preheatedIndexes;
  PXDisplayAssetFetchResult *fetchResult;

  preheatedIndexes = self->_preheatedIndexes;
  self->_preheatedIndexes = 0;

  fetchResult = self->_fetchResult;
  self->_fetchResult = 0;

}

- (BOOL)finished
{
  unint64_t v3;

  v3 = -[NSMutableIndexSet count](self->_preheatedIndexes, "count");
  return v3 >= -[PXDisplayAssetFetchResult count](self->_fetchResult, "count");
}

- (NSMutableIndexSet)preheatedIndexes
{
  return self->_preheatedIndexes;
}

- (PXDisplayAssetFetchResult)fetchResult
{
  return self->_fetchResult;
}

- (int64_t)preheatOrigin
{
  return self->_preheatOrigin;
}

- (int64_t)cachedBytes
{
  return self->_cachedBytes;
}

- (void)setCachedBytes:(int64_t)a3
{
  self->_cachedBytes = a3;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_fetchResult, 0);
  objc_storeStrong((id *)&self->_preheatedIndexes, 0);
}

@end
