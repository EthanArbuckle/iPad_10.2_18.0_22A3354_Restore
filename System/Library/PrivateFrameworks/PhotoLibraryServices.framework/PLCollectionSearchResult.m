@implementation PLCollectionSearchResult

- (unint64_t)type
{
  return 2;
}

- (PLCollectionSearchResult)initWithGroupResult:(id)a3 collectionResult:(id)a4 libraryScope:(unint64_t)a5
{
  id v9;
  PLCollectionSearchResult *v10;
  PLCollectionSearchResult *v11;
  objc_super v13;

  v9 = a4;
  v13.receiver = self;
  v13.super_class = (Class)PLCollectionSearchResult;
  v10 = -[PLSearchResult initWithGroupResult:](&v13, sel_initWithGroupResult_, a3);
  v11 = v10;
  if (v10)
  {
    objc_storeStrong((id *)&v10->_collectionResult, a4);
    v11->_libraryScope = a5;
  }

  return v11;
}

- (PLCollectionSearchResult)initWithCollectionResult:(id)a3 libraryScope:(unint64_t)a4
{
  id v7;
  PLCollectionSearchResult *v8;
  PLCollectionSearchResult *v9;
  objc_super v11;

  v7 = a3;
  v11.receiver = self;
  v11.super_class = (Class)PLCollectionSearchResult;
  v8 = -[PLCollectionSearchResult init](&v11, sel_init);
  v9 = v8;
  if (v8)
  {
    objc_storeStrong((id *)&v8->_collectionResult, a3);
    v9->_libraryScope = a4;
  }

  return v9;
}

- (id)keyAssetUUID
{
  id v2;
  unint64_t v4;
  void *v5;
  uint64_t v6;
  void *v7;
  void *v8;
  void *v9;

  v4 = -[PLCollectionSearchResult libraryScope](self, "libraryScope");
  switch(v4)
  {
    case 0uLL:
      -[PLCollectionSearchResult collectionResult](self, "collectionResult");
      v5 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v5, "keyAssetUUIDPrivate");
      v7 = (void *)objc_claimAutoreleasedReturnValue();
      v8 = v7;
      if (v7)
      {
        v2 = v7;
      }
      else
      {
        -[PLCollectionSearchResult collectionResult](self, "collectionResult");
        v9 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v9, "keyAssetUUIDShared");
        v2 = (id)objc_claimAutoreleasedReturnValue();

      }
      goto LABEL_11;
    case 2uLL:
      -[PLCollectionSearchResult collectionResult](self, "collectionResult");
      v5 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v5, "keyAssetUUIDShared");
      v6 = objc_claimAutoreleasedReturnValue();
      goto LABEL_8;
    case 1uLL:
      -[PLCollectionSearchResult collectionResult](self, "collectionResult");
      v5 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v5, "keyAssetUUIDPrivate");
      v6 = objc_claimAutoreleasedReturnValue();
LABEL_8:
      v2 = (id)v6;
LABEL_11:

      break;
  }
  return v2;
}

- (unint64_t)assetCount
{
  unint64_t v2;
  unint64_t v4;
  void *v5;
  uint64_t v6;
  uint64_t v7;
  void *v8;

  v4 = -[PLCollectionSearchResult libraryScope](self, "libraryScope");
  switch(v4)
  {
    case 0uLL:
      -[PLCollectionSearchResult collectionResult](self, "collectionResult");
      v5 = (void *)objc_claimAutoreleasedReturnValue();
      v7 = objc_msgSend(v5, "assetsCountPrivate");
      -[PLCollectionSearchResult collectionResult](self, "collectionResult");
      v8 = (void *)objc_claimAutoreleasedReturnValue();
      v2 = objc_msgSend(v8, "assetsCountShared") + v7;

LABEL_8:
      return v2;
    case 2uLL:
      -[PLCollectionSearchResult collectionResult](self, "collectionResult");
      v5 = (void *)objc_claimAutoreleasedReturnValue();
      v6 = objc_msgSend(v5, "assetsCountShared");
      goto LABEL_7;
    case 1uLL:
      -[PLCollectionSearchResult collectionResult](self, "collectionResult");
      v5 = (void *)objc_claimAutoreleasedReturnValue();
      v6 = objc_msgSend(v5, "assetsCountPrivate");
LABEL_7:
      v2 = v6;
      goto LABEL_8;
  }
  return v2;
}

- (NSString)uuid
{
  return -[PSICollectionResult uuid](self->_collectionResult, "uuid");
}

- (NSString)title
{
  return -[PSICollectionResult title](self->_collectionResult, "title");
}

- (NSString)subtitle
{
  return -[PSICollectionResult subtitle](self->_collectionResult, "subtitle");
}

- (NSDate)sortDate
{
  return -[PSICollectionResult sortDate](self->_collectionResult, "sortDate");
}

- (PSIDate)startDate
{
  return -[PSICollectionResult startDate](self->_collectionResult, "startDate");
}

- (PSIDate)endDate
{
  return -[PSICollectionResult endDate](self->_collectionResult, "endDate");
}

- (unint64_t)collectionType
{
  return -[PSICollectionResult type](self->_collectionResult, "type");
}

- (PSICollectionResult)collectionResult
{
  return self->_collectionResult;
}

- (unint64_t)libraryScope
{
  return self->_libraryScope;
}

- (void)setLibraryScope:(unint64_t)a3
{
  self->_libraryScope = a3;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_collectionResult, 0);
}

@end
