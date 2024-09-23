@implementation CuratedCollectionActivityProvider

- (CuratedCollectionActivityProvider)initWithCuratedCollection:(id)a3 refinedMapItems:(id)a4
{
  id v7;
  id v8;
  CuratedCollectionActivityProvider *v9;
  CuratedCollectionActivityProvider *v10;
  NSArray *v11;
  NSArray *refinedMapItems;
  objc_super v14;

  v7 = a3;
  v8 = a4;
  v14.receiver = self;
  v14.super_class = (Class)CuratedCollectionActivityProvider;
  v9 = -[CuratedCollectionActivityProvider init](&v14, "init");
  v10 = v9;
  if (v9)
  {
    objc_storeStrong((id *)&v9->_curatedCollection, a3);
    v11 = (NSArray *)objc_msgSend(v8, "copy");
    refinedMapItems = v10->_refinedMapItems;
    v10->_refinedMapItems = v11;

  }
  return v10;
}

- (CuratedCollectionActivityProvider)initWithPublisher:(id)a3
{
  id v5;
  CuratedCollectionActivityProvider *v6;
  CuratedCollectionActivityProvider *v7;
  objc_super v9;

  v5 = a3;
  v9.receiver = self;
  v9.super_class = (Class)CuratedCollectionActivityProvider;
  v6 = -[CuratedCollectionActivityProvider init](&v9, "init");
  v7 = v6;
  if (v6)
    objc_storeStrong((id *)&v6->_publisher, a3);

  return v7;
}

- (NSString)title
{
  void *v3;
  void *v4;
  void *v5;
  void *v6;

  v3 = (void *)objc_claimAutoreleasedReturnValue(-[CuratedCollectionActivityProvider curatedCollection](self, "curatedCollection"));

  if (v3)
  {
    v4 = (void *)objc_claimAutoreleasedReturnValue(-[CuratedCollectionActivityProvider curatedCollection](self, "curatedCollection"));
    v5 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v4, "collectionTitle"));
LABEL_5:

    return (NSString *)v5;
  }
  v5 = (void *)objc_claimAutoreleasedReturnValue(-[CuratedCollectionActivityProvider publisher](self, "publisher"));

  if (v5)
  {
    v4 = (void *)objc_claimAutoreleasedReturnValue(-[CuratedCollectionActivityProvider publisher](self, "publisher"));
    v6 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v4, "publisherAttribution"));
    v5 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v6, "displayName"));

    goto LABEL_5;
  }
  return (NSString *)v5;
}

- (NSURL)url
{
  void *v3;
  void *v4;
  uint64_t v5;
  void *v6;

  v3 = (void *)objc_claimAutoreleasedReturnValue(-[CuratedCollectionActivityProvider curatedCollection](self, "curatedCollection"));

  if (v3)
  {
    v4 = (void *)objc_claimAutoreleasedReturnValue(-[CuratedCollectionActivityProvider curatedCollection](self, "curatedCollection"));
    v5 = objc_claimAutoreleasedReturnValue(objc_msgSend(v4, "collectionURL"));
LABEL_5:
    v6 = (void *)v5;

    return (NSURL *)v6;
  }
  v6 = (void *)objc_claimAutoreleasedReturnValue(-[CuratedCollectionActivityProvider publisher](self, "publisher"));

  if (v6)
  {
    v4 = (void *)objc_claimAutoreleasedReturnValue(-[CuratedCollectionActivityProvider publisher](self, "publisher"));
    v5 = objc_claimAutoreleasedReturnValue(objc_msgSend(v4, "publisherURL"));
    goto LABEL_5;
  }
  return (NSURL *)v6;
}

- (GEOPlaceCollection)curatedCollection
{
  return self->_curatedCollection;
}

- (NSArray)refinedMapItems
{
  return self->_refinedMapItems;
}

- (GEOPublisher)publisher
{
  return self->_publisher;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_publisher, 0);
  objc_storeStrong((id *)&self->_refinedMapItems, 0);
  objc_storeStrong((id *)&self->_curatedCollection, 0);
}

@end
