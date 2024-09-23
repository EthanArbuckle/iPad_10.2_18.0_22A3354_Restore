@implementation UGCPhotoViewerDataSource

- (UGCPhotoViewerDataSource)initWithMapItem:(id)a3 delegate:(id)a4
{
  id v7;
  id v8;
  UGCPhotoViewerDataSource *v9;
  UGCPhotoViewerDataSource *v10;
  objc_super v12;

  v7 = a3;
  v8 = a4;
  v12.receiver = self;
  v12.super_class = (Class)UGCPhotoViewerDataSource;
  v9 = -[UGCPhotoViewerDataSource init](&v12, "init");
  v10 = v9;
  if (v9)
  {
    objc_storeStrong((id *)&v9->_mapItem, a3);
    v10->_albumIndex = 0;
    objc_storeWeak((id *)&v10->_delegate, v8);
  }

  return v10;
}

- (void)setActive:(BOOL)a3
{
  if (self->_active != a3)
  {
    self->_active = a3;
    if (a3)
      -[UGCPhotoViewerDataSource _createDataSourceIfNeeded](self, "_createDataSourceIfNeeded");
  }
}

- (void)_createDataSourceIfNeeded
{
  NSMutableArray *v3;
  NSMutableArray *dataProviders;
  id WeakRetained;
  UGCUserUploadedPhotoDataProvider *v6;
  UGCPhotoViewerDataProviding *userUploadDataProvider;
  void *v8;
  unsigned int v9;
  unint64_t indexOfTappedPhoto;
  void *v11;
  id v12;

  if (!self->_dataProviders)
  {
    v3 = (NSMutableArray *)objc_alloc_init((Class)NSMutableArray);
    dataProviders = self->_dataProviders;
    self->_dataProviders = v3;

    WeakRetained = objc_loadWeakRetained((id *)&self->_delegate);
    v12 = (id)objc_claimAutoreleasedReturnValue(objc_msgSend(WeakRetained, "userUploadDataProviderForDataSource:", self));

    if (v12)
    {
      if (objc_msgSend(v12, "hasUserUploadedImages"))
      {
        v6 = -[UGCUserUploadedPhotoDataProvider initWithLookupResult:delegate:]([UGCUserUploadedPhotoDataProvider alloc], "initWithLookupResult:delegate:", v12, self);
        userUploadDataProvider = self->_userUploadDataProvider;
        self->_userUploadDataProvider = (UGCPhotoViewerDataProviding *)v6;

        if (self->_userUploadDataProvider)
          -[NSMutableArray addObject:](self->_dataProviders, "addObject:");
      }
    }
    if (-[MKMapItem _mapkit_supportsFullScreenExperience](self->_mapItem, "_mapkit_supportsFullScreenExperience"))
    {
      v8 = (void *)objc_claimAutoreleasedReturnValue(-[MKMapItem _geoMapItem](self->_mapItem, "_geoMapItem"));
      v9 = objc_msgSend(v8, "_hasCaptionedPhotoAlbum");

      if (v9)
        -[UGCPhotoViewerDataSource _initComingledVendorPhotos](self, "_initComingledVendorPhotos");
      else
        -[UGCPhotoViewerDataSource _initSingleVendorPhotos](self, "_initSingleVendorPhotos");
    }
    indexOfTappedPhoto = self->_indexOfTappedPhoto;
    v11 = (void *)objc_claimAutoreleasedReturnValue(-[NSMutableArray firstObject](self->_dataProviders, "firstObject"));
    objc_msgSend(v11, "setIndexOfTappedPhoto:", indexOfTappedPhoto);

  }
}

- (UGCPhotoAlbumCategory)currentAlbumCategory
{
  void *v2;
  void *v3;

  v2 = (void *)objc_claimAutoreleasedReturnValue(-[UGCPhotoViewerDataSource _dataProviderForAlbumIndex:](self, "_dataProviderForAlbumIndex:", -[UGCPhotoViewerDataSource albumIndex](self, "albumIndex")));
  v3 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v2, "albumCategory"));

  return (UGCPhotoAlbumCategory *)v3;
}

- (NSArray)albumCategories
{
  return (NSArray *)sub_10039DCD4(self->_dataProviders, &stru_1011C9BD0);
}

- (id)_dataProviderForAlbumIndex:(unint64_t)a3
{
  void *v5;

  if ((unint64_t)-[NSMutableArray count](self->_dataProviders, "count") <= a3)
    v5 = 0;
  else
    v5 = (void *)objc_claimAutoreleasedReturnValue(-[NSMutableArray objectAtIndexedSubscript:](self->_dataProviders, "objectAtIndexedSubscript:", a3));
  return v5;
}

- (void)_initComingledVendorPhotos
{
  void *v3;
  void *v4;
  id v5;
  id v6;
  uint64_t v7;
  void *v8;
  void *v9;
  UGCPhotoViewerComingledBatchRequester *v10;
  MKMapItem *mapItem;
  void *v12;
  UGCPhotoViewerComingledBatchRequester *v13;
  void *v14;
  id v15;
  UGCPhotoAlbumCategory *v16;
  void *v17;
  UGCPhotoAlbumCategory *v18;
  void *v19;
  UGCPlaceDataPhotoListDataProvider *v20;
  uint64_t UInteger;
  id v22;
  id obj;
  __int128 v24;
  __int128 v25;
  __int128 v26;
  __int128 v27;
  _BYTE v28[128];

  v24 = 0u;
  v25 = 0u;
  v26 = 0u;
  v27 = 0u;
  v3 = (void *)objc_claimAutoreleasedReturnValue(-[MKMapItem _geoMapItem](self->_mapItem, "_geoMapItem"));
  v4 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v3, "_captionedPhotoAlbums"));

  obj = v4;
  v5 = objc_msgSend(v4, "countByEnumeratingWithState:objects:count:", &v24, v28, 16);
  if (v5)
  {
    v6 = v5;
    v7 = *(_QWORD *)v25;
    do
    {
      v8 = 0;
      do
      {
        if (*(_QWORD *)v25 != v7)
          objc_enumerationMutation(obj);
        v9 = *(void **)(*((_QWORD *)&v24 + 1) + 8 * (_QWORD)v8);
        v10 = [UGCPhotoViewerComingledBatchRequester alloc];
        mapItem = self->_mapItem;
        v12 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v9, "categoryId"));
        v13 = -[UGCPhotoViewerComingledBatchRequester initWithMapItem:categoryId:](v10, "initWithMapItem:categoryId:", mapItem, v12);

        v14 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v9, "categoryName"));
        v15 = objc_msgSend(v14, "length");

        v16 = [UGCPhotoAlbumCategory alloc];
        if (v15)
        {
          v17 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v9, "categoryName"));
          v18 = -[UGCPhotoAlbumCategory initWithTitle:categoryType:](v16, "initWithTitle:categoryType:", v17, 1);
        }
        else
        {
          v17 = (void *)objc_claimAutoreleasedReturnValue(+[NSBundle mainBundle](NSBundle, "mainBundle"));
          v19 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v17, "localizedStringForKey:value:table:", CFSTR("Other [More Photos]"), CFSTR("localized string not found"), 0));
          v18 = -[UGCPhotoAlbumCategory initWithTitle:categoryType:](v16, "initWithTitle:categoryType:", v19, 0);

        }
        if (objc_msgSend(v9, "totalNumberOfPhotosAvailable"))
        {
          v20 = [UGCPlaceDataPhotoListDataProvider alloc];
          UInteger = GEOConfigGetUInteger(MapsConfig_UGCPhotoViewerInitialCount, off_1014B3D08);
          v22 = -[UGCPlaceDataPhotoListDataProvider initWitBatchRequester:initialCount:batchCount:totalCount:albumCategory:delegate:](v20, "initWitBatchRequester:initialCount:batchCount:totalCount:albumCategory:delegate:", v13, UInteger, GEOConfigGetUInteger(MapsConfig_UGCPhotoViewerBatchCount, off_1014B3D18), objc_msgSend(v9, "totalNumberOfPhotosAvailable"), v18, self);
          -[NSMutableArray addObject:](self->_dataProviders, "addObject:", v22);

        }
        v8 = (char *)v8 + 1;
      }
      while (v6 != v8);
      v6 = objc_msgSend(obj, "countByEnumeratingWithState:objects:count:", &v24, v28, 16);
    }
    while (v6);
  }

}

- (void)_initSingleVendorPhotos
{
  void *v3;
  id v4;
  UGCPhotoAlbumCategory *v5;
  void *v6;
  void *v7;
  UGCPhotoViewerBatchRequester *v8;
  UGCPlaceDataPhotoListDataProvider *v9;
  uint64_t UInteger;
  uint64_t v11;
  void *v12;
  id v13;
  UGCPhotoAlbumCategory *v14;

  v3 = (void *)objc_claimAutoreleasedReturnValue(-[MKMapItem _mapkit_resolvedFlatPhotoList](self->_mapItem, "_mapkit_resolvedFlatPhotoList"));
  v4 = objc_msgSend(v3, "count");

  if (v4)
  {
    v5 = [UGCPhotoAlbumCategory alloc];
    v6 = (void *)objc_claimAutoreleasedReturnValue(+[NSBundle mainBundle](NSBundle, "mainBundle"));
    v7 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v6, "localizedStringForKey:value:table:", CFSTR("Other [More Photos]"), CFSTR("localized string not found"), 0));
    v14 = -[UGCPhotoAlbumCategory initWithTitle:categoryType:](v5, "initWithTitle:categoryType:", v7, 0);

    v8 = -[UGCPhotoViewerBatchRequester initWithMapItem:]([UGCPhotoViewerBatchRequester alloc], "initWithMapItem:", self->_mapItem);
    v9 = [UGCPlaceDataPhotoListDataProvider alloc];
    UInteger = GEOConfigGetUInteger(MapsConfig_UGCPhotoViewerInitialCount, off_1014B3D08);
    v11 = GEOConfigGetUInteger(MapsConfig_UGCPhotoViewerBatchCount, off_1014B3D18);
    v12 = (void *)objc_claimAutoreleasedReturnValue(-[MKMapItem _geoMapItem](self->_mapItem, "_geoMapItem"));
    v13 = -[UGCPlaceDataPhotoListDataProvider initWitBatchRequester:initialCount:batchCount:totalCount:albumCategory:delegate:](v9, "initWitBatchRequester:initialCount:batchCount:totalCount:albumCategory:delegate:", v8, UInteger, v11, objc_msgSend(v12, "_totalPhotoCount"), v14, self);

    -[NSMutableArray addObject:](self->_dataProviders, "addObject:", v13);
  }
}

- (unint64_t)numberOfCategories
{
  return (unint64_t)-[NSMutableArray count](self->_dataProviders, "count");
}

- (void)setIndexOfTappedPhoto:(unint64_t)a3
{
  id v4;

  if (self->_indexOfTappedPhoto != a3)
  {
    self->_indexOfTappedPhoto = a3;
    v4 = (id)objc_claimAutoreleasedReturnValue(-[NSMutableArray firstObject](self->_dataProviders, "firstObject"));
    objc_msgSend(v4, "setIndexOfTappedPhoto:", a3);

  }
}

- (BOOL)hasReachedTotalCount
{
  void *v2;
  unsigned __int8 v3;

  v2 = (void *)objc_claimAutoreleasedReturnValue(-[UGCPhotoViewerDataSource currentDataProvider](self, "currentDataProvider"));
  v3 = objc_msgSend(v2, "hasReachedTotalCount");

  return v3;
}

- (void)fetchNextBatchRequestIfNeeded
{
  id v3;
  NSObject *v4;
  id v5;
  uint8_t buf[16];

  if (-[UGCPhotoViewerDataSource isActive](self, "isActive"))
  {
    v5 = (id)objc_claimAutoreleasedReturnValue(-[UGCPhotoViewerDataSource currentDataProvider](self, "currentDataProvider"));
    objc_msgSend(v5, "fetchNextBatchRequestIfNeeded");

  }
  else
  {
    v3 = sub_10043325C();
    v4 = objc_claimAutoreleasedReturnValue(v3);
    if (os_log_type_enabled(v4, OS_LOG_TYPE_ERROR))
    {
      *(_WORD *)buf = 0;
      _os_log_impl((void *)&_mh_execute_header, v4, OS_LOG_TYPE_ERROR, "Trying to fetch the next request while it is not active", buf, 2u);
    }

  }
}

- (NSArray)currentPhotoList
{
  void *v2;
  void *v3;

  v2 = (void *)objc_claimAutoreleasedReturnValue(-[UGCPhotoViewerDataSource currentDataProvider](self, "currentDataProvider"));
  v3 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v2, "photoList"));

  return (NSArray *)v3;
}

- (NSArray)currentVendorNameList
{
  void *v2;
  void *v3;

  v2 = (void *)objc_claimAutoreleasedReturnValue(-[UGCPhotoViewerDataSource currentDataProvider](self, "currentDataProvider"));
  v3 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v2, "attributionNames"));

  return (NSArray *)v3;
}

- (UGCPhotoViewerDataProvider)currentDataProvider
{
  unint64_t albumIndex;
  void *v4;

  albumIndex = self->_albumIndex;
  if (albumIndex >= (unint64_t)-[NSMutableArray count](self->_dataProviders, "count"))
    v4 = 0;
  else
    v4 = (void *)objc_claimAutoreleasedReturnValue(-[NSMutableArray objectAtIndexedSubscript:](self->_dataProviders, "objectAtIndexedSubscript:", self->_albumIndex));
  return (UGCPhotoViewerDataProvider *)v4;
}

- (void)photoViewerDataProvider:(id)a3 didUpdateWithPhotos:(id)a4
{
  id v5;
  id v6;
  id WeakRetained;

  v5 = a3;
  v6 = (id)objc_claimAutoreleasedReturnValue(-[UGCPhotoViewerDataSource currentDataProvider](self, "currentDataProvider"));

  if (v6 == v5)
  {
    WeakRetained = objc_loadWeakRetained((id *)&self->_delegate);
    objc_msgSend(WeakRetained, "photoViewerDataSourceDidUpdate:", self);

  }
}

- (void)photoViewerDataProvider:(id)a3 failedBatchRequestWithError:(id)a4 range:(_NSRange)a5
{
  id v7;
  id v8;
  id WeakRetained;
  id v10;

  v10 = a4;
  v7 = a3;
  v8 = (id)objc_claimAutoreleasedReturnValue(-[UGCPhotoViewerDataSource currentDataProvider](self, "currentDataProvider"));

  if (v8 == v7)
  {
    WeakRetained = objc_loadWeakRetained((id *)&self->_delegate);
    objc_msgSend(WeakRetained, "photoViewerDataSourceDidUpdate:withError:", self, v10);

  }
}

- (id)photoViewerDataProviderRequestsMapItem:(id)a3
{
  return self->_mapItem;
}

- (BOOL)hasDataToShow
{
  void *v2;
  unsigned __int8 v3;

  v2 = (void *)objc_claimAutoreleasedReturnValue(-[UGCPhotoViewerDataSource currentDataProvider](self, "currentDataProvider"));
  v3 = objc_msgSend(v2, "hasDataToShow");

  return v3;
}

- (BOOL)isAllowedToShowAddPhotosCallToAction
{
  void *v3;
  unsigned int v4;

  v3 = (void *)objc_claimAutoreleasedReturnValue(-[UGCPhotoViewerDataSource currentDataProvider](self, "currentDataProvider"));
  v4 = objc_msgSend(v3, "isAllowedToShowAddPhotoCallToAction");

  if (v4)
    return +[MKPOIEnrichmentAvailibility shouldShowPhotosCallToActionForMapItem:](MKPOIEnrichmentAvailibility, "shouldShowPhotosCallToActionForMapItem:", self->_mapItem);
  else
    return 0;
}

- (BOOL)isSingleVendorThatHasPhotosNeedingObfuscation
{
  void *v3;
  unsigned int v4;
  void *v5;
  BOOL v6;

  v3 = (void *)objc_claimAutoreleasedReturnValue(-[UGCPhotoViewerDataSource currentDataProvider](self, "currentDataProvider"));
  v4 = objc_msgSend(v3, "hasPhotosThatShouldBeObfuscatedWhenInFullScreen");

  if (!v4)
    return 0;
  v5 = (void *)objc_claimAutoreleasedReturnValue(-[MKMapItem _allPhotoAttributions](self->_mapItem, "_allPhotoAttributions"));
  v6 = objc_msgSend(v5, "count") == (id)1;

  return v6;
}

- (unint64_t)totalNumberOfPhotosForCurrentDataProvider
{
  void *v2;
  id v3;

  v2 = (void *)objc_claimAutoreleasedReturnValue(-[UGCPhotoViewerDataSource currentDataProvider](self, "currentDataProvider"));
  v3 = objc_msgSend(v2, "totalNumberOfPhotos");

  return (unint64_t)v3;
}

- (BOOL)isActive
{
  return self->_active;
}

- (unint64_t)albumIndex
{
  return self->_albumIndex;
}

- (void)setAlbumIndex:(unint64_t)a3
{
  self->_albumIndex = a3;
}

- (unint64_t)indexOfTappedPhoto
{
  return self->_indexOfTappedPhoto;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_userUploadDataProvider, 0);
  objc_destroyWeak((id *)&self->_delegate);
  objc_storeStrong((id *)&self->_dataProviders, 0);
  objc_storeStrong((id *)&self->_mapItem, 0);
}

@end
