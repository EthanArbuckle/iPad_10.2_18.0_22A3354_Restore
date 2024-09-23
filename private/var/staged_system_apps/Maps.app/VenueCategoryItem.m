@implementation VenueCategoryItem

- (VenueCategoryItem)initWithSearchCategory:(id)a3 venueIdentifier:(id)a4 displayMode:(int)a5 isAutoCompleteCategory:(BOOL)a6 shouldFrameMapViewport:(BOOL)a7
{
  id v13;
  id v14;
  VenueCategoryItem *v15;
  VenueCategoryItem *v16;
  objc_super v18;

  v13 = a3;
  v14 = a4;
  v18.receiver = self;
  v18.super_class = (Class)VenueCategoryItem;
  v15 = -[VenueCategoryItem init](&v18, "init");
  v16 = v15;
  if (v15)
  {
    objc_storeStrong((id *)&v15->_searchCategory, a3);
    objc_storeStrong((id *)&v16->_venueIdentifier, a4);
    v16->_displayMode = a5;
    v16->_isAutoCompleteCategory = a6;
    v16->_shouldFrameMapViewport = a7;
  }

  return v16;
}

- (BOOL)isEqual:(id)a3
{
  VenueCategoryItem *v4;
  uint64_t v5;
  VenueCategoryItem *v6;
  void *v7;
  void *v8;
  void *v9;
  void *v10;
  unsigned int v11;
  unsigned int v12;
  unsigned int v13;
  unsigned int v15;

  v4 = (VenueCategoryItem *)a3;
  if (v4 == self)
  {
    LOBYTE(v13) = 1;
  }
  else
  {
    v5 = objc_opt_class(VenueCategoryItem);
    if ((objc_opt_isKindOfClass(v4, v5) & 1) != 0)
    {
      v6 = v4;
      v7 = (void *)objc_claimAutoreleasedReturnValue(-[VenueCategoryItem searchCategory](self, "searchCategory"));
      v8 = (void *)objc_claimAutoreleasedReturnValue(-[VenueCategoryItem searchCategory](v6, "searchCategory"));
      if (objc_msgSend(v7, "isEqual:", v8))
      {
        v9 = (void *)objc_claimAutoreleasedReturnValue(-[VenueCategoryItem venueIdentifier](self, "venueIdentifier"));
        v10 = (void *)objc_claimAutoreleasedReturnValue(-[VenueCategoryItem venueIdentifier](v6, "venueIdentifier"));
        if (objc_msgSend(v9, "isEqual:", v10)
          && (v11 = -[VenueCategoryItem displayMode](self, "displayMode"),
              v11 == -[VenueCategoryItem displayMode](v6, "displayMode"))
          && (v12 = -[VenueCategoryItem isAutoCompleteCategory](self, "isAutoCompleteCategory"),
              v12 == -[VenueCategoryItem isAutoCompleteCategory](v6, "isAutoCompleteCategory")))
        {
          v15 = -[VenueCategoryItem shouldFrameMapViewport](self, "shouldFrameMapViewport");
          v13 = v15 ^ -[VenueCategoryItem shouldFrameMapViewport](v6, "shouldFrameMapViewport") ^ 1;
        }
        else
        {
          LOBYTE(v13) = 0;
        }

      }
      else
      {
        LOBYTE(v13) = 0;
      }

    }
    else
    {
      LOBYTE(v13) = 0;
    }
  }

  return v13;
}

- (GEOSearchCategory)searchCategory
{
  return self->_searchCategory;
}

- (GEOVenueIdentifier)venueIdentifier
{
  return self->_venueIdentifier;
}

- (int)displayMode
{
  return self->_displayMode;
}

- (BOOL)isAutoCompleteCategory
{
  return self->_isAutoCompleteCategory;
}

- (BOOL)shouldFrameMapViewport
{
  return self->_shouldFrameMapViewport;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_venueIdentifier, 0);
  objc_storeStrong((id *)&self->_searchCategory, 0);
}

@end
