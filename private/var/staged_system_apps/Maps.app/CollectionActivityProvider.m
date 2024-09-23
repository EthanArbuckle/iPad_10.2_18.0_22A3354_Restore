@implementation CollectionActivityProvider

- (CollectionActivityProvider)initWithCollectionHandlerInfo:(id)a3
{
  id v5;
  CollectionActivityProvider *v6;
  CollectionActivityProvider *v7;
  uint64_t v8;
  id v9;
  uint64_t v10;
  NSArray *mapItems;
  CollectionActivityProvider *v12;
  objc_super v14;

  v5 = a3;
  if (objc_msgSend(v5, "canShare"))
  {
    v14.receiver = self;
    v14.super_class = (Class)CollectionActivityProvider;
    v6 = -[CollectionActivityProvider init](&v14, "init");
    v7 = v6;
    if (v6)
    {
      objc_storeStrong((id *)&v6->_collectionInfo, a3);
      v8 = objc_opt_class(CollectionHandler);
      if ((objc_opt_isKindOfClass(v5, v8) & 1) != 0)
      {
        v9 = v5;
        if (objc_msgSend(v9, "contentType") == (id)1)
        {
          v10 = objc_claimAutoreleasedReturnValue(objc_msgSend(v9, "content"));
          mapItems = v7->_mapItems;
          v7->_mapItems = (NSArray *)v10;

        }
      }
    }
    self = v7;
    v12 = self;
  }
  else
  {
    v12 = 0;
  }

  return v12;
}

- (CollectionHandlerInfo)collectionInfo
{
  return self->_collectionInfo;
}

- (NSArray)mapItems
{
  return self->_mapItems;
}

- (void)setMapItems:(id)a3
{
  objc_storeStrong((id *)&self->_mapItems, a3);
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_mapItems, 0);
  objc_storeStrong((id *)&self->_collectionInfo, 0);
}

@end
