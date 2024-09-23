@implementation BKLibraryBooksDragItemDetails

- (BKLibraryBooksDragItemDetails)initWithCollectionID:(id)a3 assetID:(id)a4 bvcType:(int64_t)a5
{
  id v8;
  id v9;
  BKLibraryBooksDragItemDetails *v10;
  NSString *v11;
  NSString *sourceCollectionID;
  NSString *v13;
  NSString *assetID;
  objc_super v16;

  v8 = a3;
  v9 = a4;
  v16.receiver = self;
  v16.super_class = (Class)BKLibraryBooksDragItemDetails;
  v10 = -[BKLibraryBooksDragItemDetails init](&v16, "init");
  if (v10)
  {
    v11 = (NSString *)objc_msgSend(v8, "copy");
    sourceCollectionID = v10->_sourceCollectionID;
    v10->_sourceCollectionID = v11;

    v13 = (NSString *)objc_msgSend(v9, "copy");
    assetID = v10->_assetID;
    v10->_assetID = v13;

    v10->_bvcType = a5;
  }

  return v10;
}

- (NSString)sourceCollectionID
{
  return self->_sourceCollectionID;
}

- (NSString)assetID
{
  return self->_assetID;
}

- (int64_t)bvcType
{
  return self->_bvcType;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_assetID, 0);
  objc_storeStrong((id *)&self->_sourceCollectionID, 0);
}

@end
