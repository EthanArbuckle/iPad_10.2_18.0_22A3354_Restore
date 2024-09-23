@implementation SearchResultVenueSubDataProvider

- (SearchResultVenueSubDataProvider)initWithDelegate:(id)a3
{
  id v4;
  SearchResultVenueSubDataProvider *v5;
  SearchResultVenueSubDataProvider *v6;
  objc_super v8;

  v4 = a3;
  v8.receiver = self;
  v8.super_class = (Class)SearchResultVenueSubDataProvider;
  v5 = -[SearchResultVenueSubDataProvider init](&v8, "init");
  v6 = v5;
  if (v5)
    objc_storeWeak((id *)&v5->_delegate, v4);

  return v6;
}

- (void)setVenueCardItem:(id)a3
{
  VenueCategoryCardItem *v6;
  VenueCategoryCardItem *venueCardItem;
  id v8;
  NSObject *v9;
  void *v10;
  id v11;
  NSString *v12;
  void *v13;
  VenueCategoryCardItem *v14;
  GEOSearchCategory *v15;
  GEOSearchCategory *currentCategory;
  void *v17;
  void *v18;
  NSArray *v19;
  NSArray *browseCategories;
  void *v21;
  void *v22;
  NSArray *v23;
  NSArray *subcategories;
  NSArray *v25;
  NSArray *buildings;
  void *v27;
  VenueCategoryContentDownloader *v28;
  id WeakRetained;
  VenueCategoryContentDownloader *v30;
  VenueCategoryContentDownloader *contentDownloader;
  int v32;
  void *v33;
  __int16 v34;
  void *v35;
  __int16 v36;
  VenueCategoryCardItem *v37;

  v6 = (VenueCategoryCardItem *)a3;
  venueCardItem = self->_venueCardItem;
  if (venueCardItem != v6 && (-[VenueCategoryCardItem isEqual:](venueCardItem, "isEqual:", v6) & 1) == 0)
  {
    v8 = sub_100432EDC();
    v9 = objc_claimAutoreleasedReturnValue(v8);
    if (os_log_type_enabled(v9, OS_LOG_TYPE_INFO))
    {
      v10 = (void *)objc_opt_class(self);
      v11 = v10;
      v12 = NSStringFromSelector(a2);
      v13 = (void *)objc_claimAutoreleasedReturnValue(v12);
      v14 = self->_venueCardItem;
      v32 = 138412802;
      v33 = v10;
      v34 = 2112;
      v35 = v13;
      v36 = 2112;
      v37 = v14;
      _os_log_impl((void *)&_mh_execute_header, v9, OS_LOG_TYPE_INFO, "%@ %@, updates = %@", (uint8_t *)&v32, 0x20u);

    }
    objc_storeStrong((id *)&self->_venueCardItem, a3);
    v15 = (GEOSearchCategory *)objc_claimAutoreleasedReturnValue(-[VenueCategoryCardItem venueSearchCategory](self->_venueCardItem, "venueSearchCategory"));
    currentCategory = self->_currentCategory;
    self->_currentCategory = v15;

    v17 = (void *)objc_claimAutoreleasedReturnValue(-[VenueCategoryCardItem venueMapItem](self->_venueCardItem, "venueMapItem"));
    v18 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v17, "_browseCategories"));
    v19 = (NSArray *)objc_msgSend(v18, "copy");
    browseCategories = self->_browseCategories;
    self->_browseCategories = v19;

    v21 = (void *)objc_claimAutoreleasedReturnValue(-[VenueCategoryCardItem venueSearchCategory](self->_venueCardItem, "venueSearchCategory"));
    v22 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v21, "subcategories"));
    v23 = (NSArray *)objc_msgSend(v22, "copy");
    subcategories = self->_subcategories;
    self->_subcategories = v23;

    v25 = (NSArray *)objc_claimAutoreleasedReturnValue(-[SearchResultVenueSubDataProvider _sortedBuildings](self, "_sortedBuildings"));
    buildings = self->_buildings;
    self->_buildings = v25;

    v27 = (void *)objc_claimAutoreleasedReturnValue(-[VenueCategoryCardItem venueSearchCategory](v6, "venueSearchCategory"));
    self->_subcategoriesType = objc_msgSend(v27, "subCategoryType");

    v28 = [VenueCategoryContentDownloader alloc];
    WeakRetained = objc_loadWeakRetained((id *)&self->_delegate);
    v30 = -[VenueCategoryContentDownloader initWithDelegate:venueCategoryCardItem:](v28, "initWithDelegate:venueCategoryCardItem:", WeakRetained, self->_venueCardItem);
    contentDownloader = self->_contentDownloader;
    self->_contentDownloader = v30;

  }
}

- (void)performSearchWithActionCoordination:(id)a3
{
  id v4;
  id v5;

  v4 = a3;
  v5 = (id)objc_claimAutoreleasedReturnValue(-[SearchResultVenueSubDataProvider currentCategory](self, "currentCategory"));
  -[VenueCategoryContentDownloader performSearchWithSearchCategory:subcategoriesType:filter:shouldFrameMapViewport:actionCoordination:](self->_contentDownloader, "performSearchWithSearchCategory:subcategoriesType:filter:shouldFrameMapViewport:actionCoordination:", v5, -[SearchResultVenueSubDataProvider subcategoriesType](self, "subcategoriesType"), 0, objc_msgSend(v5, "isSubCategorySameAsTopLevel") ^ 1, v4);

}

- (id)_sortedBuildings
{
  VenueCategoryCardItem *venueCardItem;
  void *v3;
  void *v4;
  void *v5;
  id v6;
  VenueAllBuildings *v7;
  void *v8;
  void *v9;
  VenueAllBuildings *v10;
  AlphabeticallyOrderedDataSource *v11;
  void *v12;
  id v13;

  venueCardItem = self->_venueCardItem;
  if (venueCardItem)
  {
    v3 = (void *)objc_claimAutoreleasedReturnValue(-[VenueCategoryCardItem venueMapItem](venueCardItem, "venueMapItem"));
    v4 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v3, "_venueInfo"));
    v5 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v4, "filters"));

    v6 = objc_msgSend(objc_alloc((Class)NSMutableArray), "initWithCapacity:", (char *)objc_msgSend(v5, "count") + 1);
    v7 = [VenueAllBuildings alloc];
    v8 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v3, "_venueInfo"));
    v9 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v8, "venueIdentifier"));
    v10 = -[VenueAllBuildings initWithVenueIdentifier:](v7, "initWithVenueIdentifier:", v9);
    objc_msgSend(v6, "addObject:", v10);

    v11 = -[AlphabeticallyOrderedDataSource initWithObjects:]([AlphabeticallyOrderedDataSource alloc], "initWithObjects:", v5);
    v12 = (void *)objc_claimAutoreleasedReturnValue(-[AlphabeticallyOrderedDataSource orderedObjects](v11, "orderedObjects"));
    objc_msgSend(v6, "addObjectsFromArray:", v12);

    v13 = objc_msgSend(v6, "copy");
  }
  else
  {
    v13 = &__NSArray0__struct;
  }
  return v13;
}

- (void)setVenueContents:(id)a3
{
  id v4;
  NSArray *v5;
  NSArray *v6;
  NSArray *v7;
  NSArray *venueContents;
  AlphabeticallyOrderedDataSource *v9;

  v4 = a3;
  v9 = -[AlphabeticallyOrderedDataSource initWithObjects:]([AlphabeticallyOrderedDataSource alloc], "initWithObjects:", v4);

  v5 = (NSArray *)objc_claimAutoreleasedReturnValue(-[AlphabeticallyOrderedDataSource orderedObjects](v9, "orderedObjects"));
  v6 = v5;
  if (v5 != self->_venueContents && (-[NSArray isEqual:](v5, "isEqual:") & 1) == 0)
  {
    v7 = (NSArray *)-[NSArray copy](v6, "copy");
    venueContents = self->_venueContents;
    self->_venueContents = v7;

  }
}

- (VenueCategoryCardItem)venueCardItem
{
  return self->_venueCardItem;
}

- (NSArray)venueContents
{
  return self->_venueContents;
}

- (GEOSearchCategory)currentCategory
{
  return self->_currentCategory;
}

- (void)setCurrentCategory:(id)a3
{
  objc_storeStrong((id *)&self->_currentCategory, a3);
}

- (NSArray)browseCategories
{
  return self->_browseCategories;
}

- (NSArray)subcategories
{
  return self->_subcategories;
}

- (int)subcategoriesType
{
  return self->_subcategoriesType;
}

- (NSArray)buildings
{
  return self->_buildings;
}

- (VenueCategoryContentDownloader)contentDownloader
{
  return self->_contentDownloader;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_contentDownloader, 0);
  objc_storeStrong((id *)&self->_buildings, 0);
  objc_storeStrong((id *)&self->_subcategories, 0);
  objc_storeStrong((id *)&self->_browseCategories, 0);
  objc_storeStrong((id *)&self->_currentCategory, 0);
  objc_storeStrong((id *)&self->_venueContents, 0);
  objc_storeStrong((id *)&self->_venueCardItem, 0);
  objc_destroyWeak((id *)&self->_delegate);
}

@end
