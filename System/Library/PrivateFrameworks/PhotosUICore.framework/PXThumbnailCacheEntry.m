@implementation PXThumbnailCacheEntry

- (PXThumbnailCacheEntry)initWithObjectID:(id)a3 dataSpec:(const PHAssetResourceTableDataSpecification *)a4 data:(id)a5
{
  id v9;
  id v10;
  PXThumbnailCacheEntry *v11;
  PXThumbnailCacheEntry *v12;
  __int128 v13;
  objc_super v15;

  v9 = a3;
  v10 = a5;
  v15.receiver = self;
  v15.super_class = (Class)PXThumbnailCacheEntry;
  v11 = -[PXThumbnailCacheEntry init](&v15, sel_init);
  v12 = v11;
  if (v11)
  {
    objc_storeStrong((id *)&v11->_objectID, a3);
    v13 = *(_OWORD *)&a4->width;
    *(_OWORD *)&v12->_dataSpec.dataHeight = *(_OWORD *)&a4->dataHeight;
    *(_OWORD *)&v12->_dataSpec.width = v13;
    objc_storeStrong((id *)&v12->_data, a5);
  }

  return v12;
}

- (NSManagedObjectID)objectID
{
  return self->_objectID;
}

- (PHAssetResourceTableDataSpecification)dataSpec
{
  __int128 v3;

  v3 = *(_OWORD *)&self[1].bytesPerRow;
  *(_OWORD *)&retstr->width = *(_OWORD *)&self->kind;
  *(_OWORD *)&retstr->dataHeight = v3;
  return self;
}

- (NSData)data
{
  return self->_data;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_data, 0);
  objc_storeStrong((id *)&self->_objectID, 0);
}

@end
