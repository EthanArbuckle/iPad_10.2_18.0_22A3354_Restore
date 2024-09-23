@implementation SearchHomeCollectionsDataProvider

- (SearchHomeCollectionsDataProvider)initWithObjects:(id)a3 type:(int64_t)a4 identifier:(id)a5 title:(id)a6
{
  id v10;
  id v11;
  id v12;
  SearchHomeCollectionsDataProvider *v13;
  NSArray *v14;
  NSArray *objects;
  id v16;
  void *v17;
  id v18;
  uint64_t v19;
  NSArray *viewModels;
  NSString *v21;
  NSString *identifier;
  NSString *v23;
  NSString *title;
  objc_super v26;

  v10 = a3;
  v11 = a5;
  v12 = a6;
  v26.receiver = self;
  v26.super_class = (Class)SearchHomeCollectionsDataProvider;
  v13 = -[SearchHomeCollectionsDataProvider init](&v26, "init");
  if (v13)
  {
    v14 = (NSArray *)objc_msgSend(v10, "copy");
    objects = v13->_objects;
    v13->_objects = v14;

    v16 = objc_alloc((Class)MKPlaceCollectionsLogicController);
    v17 = (void *)objc_claimAutoreleasedReturnValue(+[CuratedCollectionSyncManager sharedManager](CuratedCollectionSyncManager, "sharedManager"));
    v18 = objc_msgSend(v16, "initWithPlaceCollections:usingSyncCoordinator:inContext:", v10, v17, 3);

    v19 = objc_claimAutoreleasedReturnValue(objc_msgSend(v18, "collections"));
    viewModels = v13->_viewModels;
    v13->_viewModels = (NSArray *)v19;

    v13->_type = a4;
    v21 = (NSString *)objc_msgSend(v11, "copy");
    identifier = v13->_identifier;
    v13->_identifier = v21;

    v23 = (NSString *)objc_msgSend(v12, "copy");
    title = v13->_title;
    v13->_title = v23;

  }
  return v13;
}

- (id)headerAccessibilityIdentifier
{
  return CFSTR("SearchHomeCollections");
}

- (BOOL)itemIsSaved:(id)a3
{
  id v4;
  void *v5;
  id v6;
  void *v7;
  id v8;
  void *v9;
  void *v10;

  v4 = a3;
  v5 = (void *)objc_claimAutoreleasedReturnValue(-[SearchHomeCollectionsDataProvider objects](self, "objects"));
  v6 = objc_msgSend(v5, "indexOfObject:", v4);

  v7 = (void *)objc_claimAutoreleasedReturnValue(-[SearchHomeCollectionsDataProvider viewModels](self, "viewModels"));
  v8 = objc_msgSend(v7, "count");

  if (v6 >= v8)
    return 0;
  v9 = (void *)objc_claimAutoreleasedReturnValue(-[SearchHomeCollectionsDataProvider viewModels](self, "viewModels"));
  v10 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v9, "objectAtIndex:", v6));

  LOBYTE(v9) = objc_msgSend(v10, "isSaved");
  return (char)v9;
}

- (void)configureWithExploreGuides:(id)a3
{
  objc_storeStrong((id *)&self->_exploreGuides, a3);
}

- (int64_t)type
{
  return self->_type;
}

- (NSString)identifier
{
  return self->_identifier;
}

- (NSString)title
{
  return self->_title;
}

- (GEOExploreGuides)exploreGuides
{
  return self->_exploreGuides;
}

- (NSArray)objects
{
  return self->_objects;
}

- (void)setObjects:(id)a3
{
  objc_storeStrong((id *)&self->_objects, a3);
}

- (NSArray)viewModels
{
  return self->_viewModels;
}

- (void)setViewModels:(id)a3
{
  objc_storeStrong((id *)&self->_viewModels, a3);
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_viewModels, 0);
  objc_storeStrong((id *)&self->_objects, 0);
  objc_storeStrong((id *)&self->_exploreGuides, 0);
  objc_storeStrong((id *)&self->_title, 0);
  objc_storeStrong((id *)&self->_identifier, 0);
}

@end
