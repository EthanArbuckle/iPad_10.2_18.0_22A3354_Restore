@implementation SearchResultOutlineCellModel

- (SearchResultOutlineCellModel)initWithSearchResult:(id)a3 currentLocation:(id)a4 searchCategory:(id)a5 displayDistance:(BOOL)a6 distanceUnit:(int64_t)a7 prefersAddressOverCategory:(BOOL)a8 placeContextViewModel:(id)a9 placeContextViewModelDelegate:(id)a10
{
  id v14;
  id v15;
  id v16;
  id v17;
  SearchResultOutlineCellModel *v18;
  SearchResultOutlineCellModel *v19;
  id v24;
  objc_super v25;

  v24 = a3;
  v14 = a4;
  v15 = a5;
  v16 = a9;
  v17 = a10;
  v25.receiver = self;
  v25.super_class = (Class)SearchResultOutlineCellModel;
  v18 = -[SearchResultOutlineCellModel init](&v25, "init");
  v19 = v18;
  if (v18)
  {
    objc_storeStrong((id *)&v18->_searchResult, a3);
    objc_storeStrong((id *)&v19->_currentLocation, a4);
    objc_storeStrong((id *)&v19->_searchCategory, a5);
    v19->_displayDistance = a6;
    v19->_distanceUnit = a7;
    v19->_prefersAddressOverCategory = a8;
    objc_storeStrong((id *)&v19->_placeContextViewModel, a9);
    objc_storeStrong((id *)&v19->_placeContextViewModelDelegate, a10);
  }

  return v19;
}

- (unint64_t)hash
{
  unint64_t v3;
  unint64_t v4;

  v3 = -[SearchResult hash](self->_searchResult, "hash");
  v4 = (unint64_t)-[GEOLocation hash](self->_currentLocation, "hash") ^ v3;
  return v4 ^ (unint64_t)-[GEOSearchCategory hash](self->_searchCategory, "hash");
}

- (BOOL)isEqual:(id)a3
{
  SearchResultOutlineCellModel *v4;
  SearchResultOutlineCellModel *v5;
  uint64_t v6;
  SearchResultOutlineCellModel *v7;
  SearchResult *v8;
  SearchResult *v9;
  GEOLocation *v10;
  GEOLocation *v11;
  GEOSearchCategory *v12;
  GEOSearchCategory *v13;
  PlaceContextViewModel *v14;
  PlaceContextViewModel *v15;
  PlaceContextViewModelCellDelegate *v16;
  PlaceContextViewModelCellDelegate *v17;
  unsigned __int8 v18;

  v4 = (SearchResultOutlineCellModel *)a3;
  v5 = v4;
  if (v4 == self)
  {
    v18 = 1;
  }
  else if (v4 && (v6 = objc_opt_class(self), (objc_opt_isKindOfClass(v5, v6) & 1) != 0))
  {
    v7 = v5;
    v8 = (SearchResult *)objc_claimAutoreleasedReturnValue(-[SearchResultOutlineCellModel searchResult](v7, "searchResult"));
    v9 = v8;
    if (v8 == self->_searchResult || -[SearchResult isEqual:](v8, "isEqual:"))
    {
      v10 = (GEOLocation *)objc_claimAutoreleasedReturnValue(-[SearchResultOutlineCellModel currentLocation](v7, "currentLocation"));
      v11 = v10;
      if (v10 == self->_currentLocation || -[GEOLocation isEqual:](v10, "isEqual:"))
      {
        v12 = (GEOSearchCategory *)objc_claimAutoreleasedReturnValue(-[SearchResultOutlineCellModel searchCategory](v7, "searchCategory"));
        v13 = v12;
        if ((v12 == self->_searchCategory || -[GEOSearchCategory isEqual:](v12, "isEqual:"))
          && self->_displayDistance == -[SearchResultOutlineCellModel displayDistance](v7, "displayDistance")
          && -[SearchResultOutlineCellModel distanceUnit](v7, "distanceUnit") == self->_distanceUnit
          && self->_prefersAddressOverCategory == -[SearchResultOutlineCellModel prefersAddressOverCategory](v7, "prefersAddressOverCategory"))
        {
          v14 = (PlaceContextViewModel *)objc_claimAutoreleasedReturnValue(-[SearchResultOutlineCellModel placeContextViewModel](v7, "placeContextViewModel"));
          v15 = v14;
          if (v14 == self->_placeContextViewModel || -[PlaceContextViewModel isEqual:](v14, "isEqual:"))
          {
            v16 = (PlaceContextViewModelCellDelegate *)objc_claimAutoreleasedReturnValue(-[SearchResultOutlineCellModel placeContextViewModelDelegate](v7, "placeContextViewModelDelegate"));
            v17 = v16;
            if (v16 == self->_placeContextViewModelDelegate)
              v18 = 1;
            else
              v18 = -[PlaceContextViewModelCellDelegate isEqual:](v16, "isEqual:");

          }
          else
          {
            v18 = 0;
          }

        }
        else
        {
          v18 = 0;
        }

      }
      else
      {
        v18 = 0;
      }

    }
    else
    {
      v18 = 0;
    }

  }
  else
  {
    v18 = 0;
  }

  return v18;
}

- (UICollectionViewCellRegistration)cellRegistration
{
  return (UICollectionViewCellRegistration *)+[SearchResultOutlineCellRegistration sharedRegistration](SearchResultOutlineCellRegistration, "sharedRegistration");
}

- (BOOL)needsReloadFromPreviousViewModel:(id)a3
{
  return !-[SearchResultOutlineCellModel isEqual:](self, "isEqual:", a3);
}

- (SearchResult)searchResult
{
  return self->_searchResult;
}

- (GEOLocation)currentLocation
{
  return self->_currentLocation;
}

- (GEOSearchCategory)searchCategory
{
  return self->_searchCategory;
}

- (BOOL)displayDistance
{
  return self->_displayDistance;
}

- (int64_t)distanceUnit
{
  return self->_distanceUnit;
}

- (BOOL)prefersAddressOverCategory
{
  return self->_prefersAddressOverCategory;
}

- (PlaceContextViewModel)placeContextViewModel
{
  return self->_placeContextViewModel;
}

- (PlaceContextViewModelCellDelegate)placeContextViewModelDelegate
{
  return self->_placeContextViewModelDelegate;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_placeContextViewModelDelegate, 0);
  objc_storeStrong((id *)&self->_placeContextViewModel, 0);
  objc_storeStrong((id *)&self->_searchCategory, 0);
  objc_storeStrong((id *)&self->_currentLocation, 0);
  objc_storeStrong((id *)&self->_searchResult, 0);
}

@end
