@implementation _PXAudioAssetArrayFetchResult

- (_PXAudioAssetArrayFetchResult)initWithArray:(id)a3
{
  id v4;
  _PXAudioAssetArrayFetchResult *v5;
  uint64_t v6;
  NSArray *assets;
  objc_super v9;

  v4 = a3;
  v9.receiver = self;
  v9.super_class = (Class)_PXAudioAssetArrayFetchResult;
  v5 = -[_PXAudioAssetArrayFetchResult init](&v9, sel_init);
  if (v5)
  {
    v6 = objc_msgSend(v4, "copy");
    assets = v5->_assets;
    v5->_assets = (NSArray *)v6;

  }
  return v5;
}

- (_PXAudioAssetArrayFetchResult)init
{
  return -[_PXAudioAssetArrayFetchResult initWithArray:](self, "initWithArray:", 0);
}

- (NSString)description
{
  return (NSString *)objc_autoreleaseReturnValue((id)objc_msgSend(objc_alloc(MEMORY[0x1E0CB3940]), "initWithFormat:", CFSTR("<%@; %p; Assets: %@>"),
                                                       objc_opt_class(),
                                                       self,
                                                       self->_assets));
}

- (int64_t)count
{
  return -[NSArray count](self->_assets, "count");
}

- (id)objectAtIndex:(unint64_t)a3
{
  return -[NSArray objectAtIndexedSubscript:](self->_assets, "objectAtIndexedSubscript:", a3);
}

- (id)objectsAtIndexes:(id)a3
{
  return -[NSArray objectsAtIndexes:](self->_assets, "objectsAtIndexes:", a3);
}

- (BOOL)containsObject:(id)a3
{
  return -[NSArray containsObject:](self->_assets, "containsObject:", a3);
}

- (PXAudioAsset)firstObject
{
  return (PXAudioAsset *)-[NSArray firstObject](self->_assets, "firstObject");
}

- (PXAudioAsset)lastObject
{
  return (PXAudioAsset *)-[NSArray lastObject](self->_assets, "lastObject");
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
  if (-[_PXAudioAssetArrayFetchResult count](self, "count"))
  {
    v5 = 0;
    do
    {
      -[NSArray objectAtIndexedSubscript:](self->_assets, "objectAtIndexedSubscript:", v5);
      v6 = (void *)objc_claimAutoreleasedReturnValue();
      v4[2](v4, v6, v5, &v8);
      v7 = v8;

      if (v7)
        break;
      ++v5;
    }
    while (v5 < -[_PXAudioAssetArrayFetchResult count](self, "count"));
  }

}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_assets, 0);
}

@end
