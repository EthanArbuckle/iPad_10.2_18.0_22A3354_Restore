@implementation _PXAudioAssetSubrangeFetchResult

- (_PXAudioAssetSubrangeFetchResult)initWithFetchResult:(id)a3 subrange:(_NSRange)a4
{
  NSUInteger length;
  NSUInteger location;
  id v9;
  _PXAudioAssetSubrangeFetchResult *v10;
  void *v12;
  objc_super v13;

  length = a4.length;
  location = a4.location;
  v9 = a3;
  v13.receiver = self;
  v13.super_class = (Class)_PXAudioAssetSubrangeFetchResult;
  v10 = -[_PXAudioAssetSubrangeFetchResult init](&v13, sel_init);
  if (v10)
  {
    if (objc_msgSend(v9, "count") < location + length)
    {
      objc_msgSend(MEMORY[0x1E0CB3488], "currentHandler");
      v12 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v12, "handleFailureInMethod:object:file:lineNumber:description:", a2, v10, CFSTR("PXAudioAssetFetchResult.m"), 128, CFSTR("subrange must be within the count of the given fetch result."));

    }
    objc_storeStrong((id *)&v10->_fetchResult, a3);
    v10->_subrange.location = location;
    v10->_subrange.length = length;
  }

  return v10;
}

- (_PXAudioAssetSubrangeFetchResult)init
{
  void *v4;

  objc_msgSend(MEMORY[0x1E0CB3488], "currentHandler");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "handleFailureInMethod:object:file:lineNumber:description:", a2, self, CFSTR("PXAudioAssetFetchResult.m"), 136, CFSTR("%s is not available as initializer"), "-[_PXAudioAssetSubrangeFetchResult init]");

  abort();
}

- (NSString)description
{
  id v3;
  uint64_t v4;
  PXAudioAssetFetchResult *fetchResult;
  void *v6;
  void *v7;

  v3 = objc_alloc(MEMORY[0x1E0CB3940]);
  v4 = objc_opt_class();
  fetchResult = self->_fetchResult;
  NSStringFromRange(self->_subrange);
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  v7 = (void *)objc_msgSend(v3, "initWithFormat:", CFSTR("<%@; %p; fetch result: %@; subrange: %@>"),
                 v4,
                 self,
                 fetchResult,
                 v6);

  return (NSString *)v7;
}

- (int64_t)count
{
  return self->_subrange.length;
}

- (id)objectAtIndex:(unint64_t)a3
{
  NSUInteger location;
  NSUInteger v5;
  void *v10;

  location = self->_subrange.location;
  v5 = location + a3;
  if (location > location + a3 || self->_subrange.length <= a3)
  {
    objc_msgSend(MEMORY[0x1E0CB3488], "currentHandler");
    v10 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v10, "handleFailureInMethod:object:file:lineNumber:description:", a2, self, CFSTR("PXAudioAssetFetchResult.m"), 151, CFSTR("Index %lu out of bounds in %@"), a3, self);

  }
  return (id)-[PXAudioAssetFetchResult objectAtIndexedSubscript:](self->_fetchResult, "objectAtIndexedSubscript:", v5);
}

- (id)objectsAtIndexes:(id)a3
{
  id v5;
  void *v6;
  unint64_t v7;
  NSUInteger location;
  NSUInteger v9;
  BOOL v10;
  void *v11;
  void *v13;

  v5 = a3;
  v6 = (void *)objc_msgSend(v5, "mutableCopy");
  objc_msgSend(v6, "shiftIndexesStartingAtIndex:by:", 0, self->_subrange.location);
  v7 = objc_msgSend(v6, "lastIndex");
  location = self->_subrange.location;
  v10 = v7 >= location;
  v9 = v7 - location;
  v10 = !v10 || v9 >= self->_subrange.length;
  if (v10)
  {
    objc_msgSend(MEMORY[0x1E0CB3488], "currentHandler");
    v13 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v13, "handleFailureInMethod:object:file:lineNumber:description:", a2, self, CFSTR("PXAudioAssetFetchResult.m"), 162, CFSTR("Indexes %@ out of bounds in %@"), v5, self);

  }
  -[PXAudioAssetFetchResult objectsAtIndexes:](self->_fetchResult, "objectsAtIndexes:", v6);
  v11 = (void *)objc_claimAutoreleasedReturnValue();

  return v11;
}

- (BOOL)containsObject:(id)a3
{
  return -[PXAudioAssetFetchResult containsObject:](self->_fetchResult, "containsObject:", a3);
}

- (PXAudioAsset)firstObject
{
  return (PXAudioAsset *)-[PXAudioAssetFetchResult objectAtIndexedSubscript:](self->_fetchResult, "objectAtIndexedSubscript:", self->_subrange.location);
}

- (PXAudioAsset)lastObject
{
  return (PXAudioAsset *)-[PXAudioAssetFetchResult objectAtIndexedSubscript:](self->_fetchResult, "objectAtIndexedSubscript:", self->_subrange.length + self->_subrange.location);
}

- (void)enumerateObjectsUsingBlock:(id)a3
{
  void (**v4)(id, void *, unint64_t, _BYTE *);
  unint64_t v5;
  void *v6;
  int v7;
  unsigned __int8 v8;

  v4 = (void (**)(id, void *, unint64_t, _BYTE *))a3;
  v8 = 0;
  if (-[_PXAudioAssetSubrangeFetchResult count](self, "count"))
  {
    v5 = 0;
    do
    {
      -[_PXAudioAssetSubrangeFetchResult objectAtIndex:](self, "objectAtIndex:", v5);
      v6 = (void *)objc_claimAutoreleasedReturnValue();
      v4[2](v4, v6, v5, &v8);
      v7 = v8;

      if (v7)
        break;
      ++v5;
    }
    while (v5 < -[_PXAudioAssetSubrangeFetchResult count](self, "count"));
  }

}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_fetchResult, 0);
}

@end
