@implementation _PXMappingAudioAssetFetchResult

- (_PXMappingAudioAssetFetchResult)initWithFetchResult:(id)a3 block:(id)a4
{
  id v7;
  id v8;
  _PXMappingAudioAssetFetchResult *v9;
  _PXMappingAudioAssetFetchResult *v10;
  uint64_t v11;
  id block;
  objc_super v14;

  v7 = a3;
  v8 = a4;
  v14.receiver = self;
  v14.super_class = (Class)_PXMappingAudioAssetFetchResult;
  v9 = -[_PXMappingAudioAssetFetchResult init](&v14, sel_init);
  v10 = v9;
  if (v9)
  {
    objc_storeStrong((id *)&v9->_fetchResult, a3);
    v11 = objc_msgSend(v8, "copy");
    block = v10->_block;
    v10->_block = (id)v11;

  }
  return v10;
}

- (int64_t)count
{
  return -[PXAudioAssetFetchResult count](self->_fetchResult, "count");
}

- (id)objectAtIndex:(unint64_t)a3
{
  void (**block)(id, void *);
  void *v4;
  void *v5;

  block = (void (**)(id, void *))self->_block;
  -[PXAudioAssetFetchResult objectAtIndexedSubscript:](self->_fetchResult, "objectAtIndexedSubscript:", a3);
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  block[2](block, v4);
  v5 = (void *)objc_claimAutoreleasedReturnValue();

  return v5;
}

- (PXAudioAsset)firstObject
{
  void (**block)(id, void *);
  void *v4;
  void *v5;

  if (-[_PXMappingAudioAssetFetchResult count](self, "count") < 1)
  {
    v5 = 0;
  }
  else
  {
    block = (void (**)(id, void *))self->_block;
    -[PXAudioAssetFetchResult firstObject](self->_fetchResult, "firstObject");
    v4 = (void *)objc_claimAutoreleasedReturnValue();
    block[2](block, v4);
    v5 = (void *)objc_claimAutoreleasedReturnValue();

  }
  return (PXAudioAsset *)v5;
}

- (PXAudioAsset)lastObject
{
  void (**block)(id, void *);
  void *v4;
  void *v5;

  if (-[_PXMappingAudioAssetFetchResult count](self, "count") < 1)
  {
    v5 = 0;
  }
  else
  {
    block = (void (**)(id, void *))self->_block;
    -[PXAudioAssetFetchResult lastObject](self->_fetchResult, "lastObject");
    v4 = (void *)objc_claimAutoreleasedReturnValue();
    block[2](block, v4);
    v5 = (void *)objc_claimAutoreleasedReturnValue();

  }
  return (PXAudioAsset *)v5;
}

- (id)objectsAtIndexes:(id)a3
{
  void *v3;
  void *v4;

  -[PXAudioAssetFetchResult objectsAtIndexes:](self->_fetchResult, "objectsAtIndexes:", a3);
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  PXMap();
  v4 = (void *)objc_claimAutoreleasedReturnValue();

  return v4;
}

- (BOOL)containsObject:(id)a3
{
  id v4;
  PXAudioAssetFetchResult *fetchResult;
  id v6;
  _QWORD v8[4];
  id v9;
  _PXMappingAudioAssetFetchResult *v10;
  uint64_t *v11;
  uint64_t v12;
  uint64_t *v13;
  uint64_t v14;
  char v15;

  v4 = a3;
  v12 = 0;
  v13 = &v12;
  v14 = 0x2020000000;
  v15 = 0;
  fetchResult = self->_fetchResult;
  v8[0] = MEMORY[0x1E0C809B0];
  v8[1] = 3221225472;
  v8[2] = __50___PXMappingAudioAssetFetchResult_containsObject___block_invoke;
  v8[3] = &unk_1E5137490;
  v6 = v4;
  v9 = v6;
  v10 = self;
  v11 = &v12;
  -[PXAudioAssetFetchResult enumerateObjectsUsingBlock:](fetchResult, "enumerateObjectsUsingBlock:", v8);
  LOBYTE(self) = *((_BYTE *)v13 + 24);

  _Block_object_dispose(&v12, 8);
  return (char)self;
}

- (void)enumerateObjectsUsingBlock:(id)a3
{
  id v4;
  PXAudioAssetFetchResult *fetchResult;
  id v6;
  _QWORD v7[5];
  id v8;

  v4 = a3;
  fetchResult = self->_fetchResult;
  v7[0] = MEMORY[0x1E0C809B0];
  v7[1] = 3221225472;
  v7[2] = __62___PXMappingAudioAssetFetchResult_enumerateObjectsUsingBlock___block_invoke;
  v7[3] = &unk_1E51374B8;
  v7[4] = self;
  v8 = v4;
  v6 = v4;
  -[PXAudioAssetFetchResult enumerateObjectsUsingBlock:](fetchResult, "enumerateObjectsUsingBlock:", v7);

}

- (void).cxx_destruct
{
  objc_storeStrong(&self->_block, 0);
  objc_storeStrong((id *)&self->_fetchResult, 0);
}

@end
