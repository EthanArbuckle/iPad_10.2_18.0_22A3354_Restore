@implementation PLPrimaryResourceDataStoreReferenceFileKey

- (PLPrimaryResourceDataStoreReferenceFileKey)initWithResourceType:(unsigned int)a3
{
  __int16 v3;
  PLPrimaryResourceDataStoreReferenceFileKey *result;
  objc_super v5;

  if (a3 >= 0x20)
    __assert_rtn("-[PLPrimaryResourceDataStoreReferenceFileKey initWithResourceType:]", "PLPrimaryResourceDataStoreReferenceFileKey.m", 105, "resourceType <= kPLResourceTypeMax");
  v3 = a3;
  v5.receiver = self;
  v5.super_class = (Class)PLPrimaryResourceDataStoreReferenceFileKey;
  result = -[PLPrimaryResourceDataStoreKey _init](&v5, sel__init);
  if (result)
    *(_WORD *)&result->_keyStruct = *(_WORD *)&result->_keyStruct & 0x8000 | (v3 << 10) | 4;
  return result;
}

- (id)initFromExistingLocationOfExternalResource:(id)a3 asset:(id)a4
{
  id v6;
  id v7;
  void *v8;
  PLPrimaryResourceDataStoreReferenceFileKey *v9;
  objc_super v11;

  v6 = a3;
  v11.receiver = self;
  v11.super_class = (Class)PLPrimaryResourceDataStoreReferenceFileKey;
  v7 = -[PLPrimaryResourceDataStoreKey _initFromExistingLocationOfExternalResource:asset:](&v11, sel__initFromExistingLocationOfExternalResource_asset_, v6, a4);
  if (v7)
  {
    v8 = v7;
    if (objc_msgSend(v6, "resourceType") > 0x1F)
      v9 = 0;
    else
      v9 = -[PLPrimaryResourceDataStoreReferenceFileKey initWithResourceType:]([PLPrimaryResourceDataStoreReferenceFileKey alloc], "initWithResourceType:", objc_msgSend(v6, "resourceType"));

  }
  else
  {
    v9 = 0;
  }

  return v9;
}

- (id)fileURLForAssetID:(id)a3 inContext:(id)a4
{
  id v6;
  id v7;
  NSURL *v8;
  NSURL *cachedUrl;
  NSURL *v10;

  v6 = a3;
  v7 = a4;
  os_unfair_lock_lock((os_unfair_lock_t)&fileURLForAssetID_inContext__cacheUrlLock);
  if (!self->_cachedUrl)
  {
    _urlForKeyStruct((unsigned __int16 *)&self->_keyStruct, v6, v7);
    v8 = (NSURL *)objc_claimAutoreleasedReturnValue();
    cachedUrl = self->_cachedUrl;
    self->_cachedUrl = v8;

  }
  os_unfair_lock_unlock((os_unfair_lock_t)&fileURLForAssetID_inContext__cacheUrlLock);
  v10 = self->_cachedUrl;

  return v10;
}

- (id)fileURLForAssetID:(id)a3
{
  return -[PLPrimaryResourceDataStoreReferenceFileKey fileURLForAssetID:inContext:](self, "fileURLForAssetID:inContext:", a3, 0);
}

- (id)keyData
{
  return (id)objc_msgSend(MEMORY[0x1E0C99D50], "dataWithBytes:length:", &self->_keyStruct, 2);
}

- (PLPrimaryResourceDataStoreReferenceFileKey)initWithKeyStruct:(const void *)a3
{
  PLPrimaryResourceDataStoreReferenceFileKey *result;
  objc_super v5;

  v5.receiver = self;
  v5.super_class = (Class)PLPrimaryResourceDataStoreReferenceFileKey;
  result = -[PLPrimaryResourceDataStoreKey _initWithKeyStruct:](&v5, sel__initWithKeyStruct_);
  if (result)
    *(_WORD *)&result->_keyStruct = *(_WORD *)a3;
  return result;
}

- (id)uniformTypeIdentifier
{
  return 0;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_cachedUrl, 0);
}

+ (unsigned)keyLengthWithDataPreview:(unsigned __int8)a3
{
  return 2;
}

+ (id)fileURLForPayloadKeyData:(unint64_t)a3 assetID:(id)a4
{
  unint64_t v5;

  v5 = a3;
  _urlForKeyStruct((unsigned __int16 *)&v5, a4, 0);
  return (id)objc_claimAutoreleasedReturnValue();
}

@end
