@implementation CuratedCollectionItemCellModel

- (CuratedCollectionItemCellModel)initWithMKPlaceCollectionMapItem:(id)a3 usingAttribution:(id)a4 itemDescription:(id)a5 itemInUserCollection:(BOOL)a6 libraryOperationsCoordinator:(id)a7 appClip:(id)a8
{
  id v15;
  id v16;
  id v17;
  id v18;
  CuratedCollectionItemCellModel *v19;
  CuratedCollectionItemCellModel *v20;
  NSAttributedString *v21;
  NSAttributedString *itemDescription;
  id v24;
  objc_super v25;

  v24 = a3;
  v15 = a4;
  v16 = a5;
  v17 = a7;
  v18 = a8;
  v25.receiver = self;
  v25.super_class = (Class)CuratedCollectionItemCellModel;
  v19 = -[CuratedCollectionItemCellModel init](&v25, "init");
  v20 = v19;
  if (v19)
  {
    objc_storeStrong((id *)&v19->_collectionItem, a3);
    objc_storeStrong((id *)&v20->_attribution, a4);
    v21 = (NSAttributedString *)objc_msgSend(v16, "copy");
    itemDescription = v20->_itemDescription;
    v20->_itemDescription = v21;

    v20->_isItemInUserCollection = a6;
    objc_storeStrong((id *)&v20->_libraryOperationsCoordinator, a7);
    objc_storeStrong((id *)&v20->_appClip, a8);
  }

  return v20;
}

- (NSAttributedString)fullReviewString
{
  void *v3;
  void *v4;
  void *v5;
  void *v6;
  void *v7;
  void *v8;
  void *v9;
  uint64_t v10;
  id v11;
  void *v12;
  void *v13;
  id v14;
  NSAttributedStringKey v16;
  void *v17;

  v3 = (void *)objc_claimAutoreleasedReturnValue(-[CuratedCollectionItemCellModel collectionItem](self, "collectionItem"));
  v4 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v3, "placeCollectionItem"));
  v5 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v4, "reviewUrl"));

  if (v5)
  {
    v6 = (void *)objc_claimAutoreleasedReturnValue(-[CuratedCollectionItemCellModel collectionItem](self, "collectionItem"));
    v7 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v6, "placeCollectionItem"));
    v8 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v7, "reviewText"));

    if (!objc_msgSend(v8, "length"))
    {
      v9 = (void *)objc_claimAutoreleasedReturnValue(+[NSBundle mainBundle](NSBundle, "mainBundle"));
      v10 = objc_claimAutoreleasedReturnValue(objc_msgSend(v9, "localizedStringForKey:value:table:", CFSTR("[Curated Collection View] Read review text"), CFSTR("localized string not found"), 0));

      v8 = (void *)v10;
    }
    v11 = objc_msgSend(objc_alloc((Class)NSMutableAttributedString), "initWithString:", v8);
    v16 = NSFontAttributeName;
    v12 = (void *)objc_claimAutoreleasedReturnValue(+[UIFont system15](UIFont, "system15"));
    v17 = v12;
    v13 = (void *)objc_claimAutoreleasedReturnValue(+[NSDictionary dictionaryWithObjects:forKeys:count:](NSDictionary, "dictionaryWithObjects:forKeys:count:", &v17, &v16, 1));
    objc_msgSend(v11, "addAttributes:range:", v13, 0, objc_msgSend(v8, "length"));

    objc_msgSend(v11, "addAttribute:value:range:", NSLinkAttributeName, v5, 0, objc_msgSend(v8, "length"));
    v14 = objc_msgSend(v11, "copy");

  }
  else
  {
    v14 = 0;
  }

  return (NSAttributedString *)v14;
}

- (CuratedCollectionPlaceSummaryViewModel)placeSummaryModel
{
  CuratedCollectionPlaceSummaryViewModel *v3;
  void *v4;
  void *v5;
  CuratedCollectionPlaceSummaryViewModel *v6;
  CuratedCollectionPlaceSummaryViewModel *placeSummaryModel;
  void *v8;

  if (!self->_placeSummaryModel)
  {
    v3 = [CuratedCollectionPlaceSummaryViewModel alloc];
    v4 = (void *)objc_claimAutoreleasedReturnValue(-[CuratedCollectionItemCellModel collectionItem](self, "collectionItem"));
    v5 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v4, "mapItem"));
    v6 = -[CuratedCollectionPlaceSummaryViewModel initWithMapItem:](v3, "initWithMapItem:", v5);
    placeSummaryModel = self->_placeSummaryModel;
    self->_placeSummaryModel = v6;

  }
  v8 = (void *)objc_claimAutoreleasedReturnValue(-[CuratedCollectionItemCellModel currentLocation](self, "currentLocation"));
  -[CuratedCollectionPlaceSummaryViewModel setCurrentLocation:](self->_placeSummaryModel, "setCurrentLocation:", v8);

  return self->_placeSummaryModel;
}

- (BOOL)hasImage
{
  void *v2;
  BOOL v3;

  v2 = (void *)objc_claimAutoreleasedReturnValue(-[CuratedCollectionItemCellModel _collectionItemImage](self, "_collectionItemImage"));
  v3 = v2 != 0;

  return v3;
}

- (void)loadImageForSize:(CGSize)a3 completion:(id)a4
{
  double height;
  double width;
  id v7;
  void *v8;
  double v9;
  double v10;
  void *v11;
  void *v12;
  void *v13;
  void *v14;
  void *v15;
  id v16;
  _QWORD v17[4];
  id v18;

  height = a3.height;
  width = a3.width;
  v7 = a4;
  v8 = (void *)objc_claimAutoreleasedReturnValue(+[MKSystemController sharedInstance](MKSystemController, "sharedInstance"));
  objc_msgSend(v8, "screenScale");
  v10 = v9;

  v11 = (void *)objc_claimAutoreleasedReturnValue(-[CuratedCollectionItemCellModel _collectionItemImage](self, "_collectionItemImage"));
  v12 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v11, "bestPhotoForSize:allowSmaller:", 1, width * v10, height * v10));
  -[CuratedCollectionItemCellModel setPhotoInfo:](self, "setPhotoInfo:", v12);

  v13 = (void *)objc_claimAutoreleasedReturnValue(+[MKAppImageManager sharedImageManager](MKAppImageManager, "sharedImageManager"));
  v14 = (void *)objc_claimAutoreleasedReturnValue(-[CuratedCollectionItemCellModel photoInfo](self, "photoInfo"));
  v15 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v14, "url"));
  v17[0] = _NSConcreteStackBlock;
  v17[1] = 3221225472;
  v17[2] = sub_1008623CC;
  v17[3] = &unk_1011B2D20;
  v18 = v7;
  v16 = v7;
  objc_msgSend(v13, "loadAppImageAtURL:completionHandler:", v15, v17);

}

- (void)cancelImageDownload
{
  void *v3;
  void *v4;
  id v5;

  v5 = (id)objc_claimAutoreleasedReturnValue(+[MKAppImageManager sharedImageManager](MKAppImageManager, "sharedImageManager"));
  v3 = (void *)objc_claimAutoreleasedReturnValue(-[CuratedCollectionItemCellModel photoInfo](self, "photoInfo"));
  v4 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v3, "url"));
  objc_msgSend(v5, "cancelLoadAppImageAtURL:", v4);

}

- (NSString)imageAttribution
{
  void *v3;
  void *v4;
  void *v5;
  void *v6;
  void *v7;
  void *v8;
  void *v9;
  unsigned int v10;
  void *v11;
  void *v12;
  void *v13;
  void *v14;
  void *v15;
  unsigned __int8 v16;
  void *v17;
  void *v18;
  void *v19;
  void *v20;

  v3 = (void *)objc_claimAutoreleasedReturnValue(-[CuratedCollectionItemCellModel collectionItem](self, "collectionItem"));
  v4 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v3, "placeCollectionItem"));
  v5 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v4, "photos"));
  v6 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v5, "firstObject"));

  if (!v6)
  {
    v8 = (void *)objc_claimAutoreleasedReturnValue(-[CuratedCollectionItemCellModel collectionItem](self, "collectionItem"));
    v9 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v8, "placeCollectionItem"));
    v10 = objc_msgSend(v9, "supportsPhotoFallback");

    if (v10)
    {
      v11 = (void *)objc_claimAutoreleasedReturnValue(-[CuratedCollectionItemCellModel collectionItem](self, "collectionItem"));
      v12 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v11, "mapItem"));
      v13 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v12, "_geoMapItem"));
      v14 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v13, "_photos"));
      v6 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v14, "firstObject"));

      if (v6)
      {
        v15 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v6, "attribution"));
        v16 = objc_msgSend(v15, "shouldSuppressPhotoAttribution");

        if ((v16 & 1) == 0)
        {
          v17 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v6, "attribution"));
          v18 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v17, "providerName"));

          if (objc_msgSend(v18, "length"))
          {
            v19 = (void *)objc_claimAutoreleasedReturnValue(+[NSBundle mainBundle](NSBundle, "mainBundle"));
            v20 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v19, "localizedStringForKey:value:table:", CFSTR("Photo from [provider]"), CFSTR("localized string not found"), 0));
            v7 = (void *)objc_claimAutoreleasedReturnValue(+[NSString stringWithFormat:](NSString, "stringWithFormat:", v20, v18));

            goto LABEL_10;
          }

        }
      }
    }
    else
    {
      v6 = 0;
    }
    v7 = 0;
    goto LABEL_10;
  }
  v7 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v6, "author"));
LABEL_10:

  return (NSString *)v7;
}

- (id)_collectionItemImage
{
  void *v3;
  void *v4;
  void *v5;
  void *v6;
  void *v7;
  void *v8;
  unsigned int v9;
  void *v10;
  void *v11;
  void *v12;
  void *v13;

  v3 = (void *)objc_claimAutoreleasedReturnValue(-[CuratedCollectionItemCellModel collectionItem](self, "collectionItem"));
  v4 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v3, "placeCollectionItem"));
  v5 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v4, "photos"));
  v6 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v5, "firstObject"));

  if (!v6)
  {
    v7 = (void *)objc_claimAutoreleasedReturnValue(-[CuratedCollectionItemCellModel collectionItem](self, "collectionItem"));
    v8 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v7, "placeCollectionItem"));
    v9 = objc_msgSend(v8, "supportsPhotoFallback");

    if (v9)
    {
      v10 = (void *)objc_claimAutoreleasedReturnValue(-[CuratedCollectionItemCellModel collectionItem](self, "collectionItem"));
      v11 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v10, "mapItem"));
      v12 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v11, "_geoMapItem"));
      v13 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v12, "_photos"));
      v6 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v13, "firstObject"));

    }
    else
    {
      v6 = 0;
    }
  }
  return v6;
}

- (BOOL)isItemInLibrary
{
  void *v2;
  unsigned __int8 v3;

  v2 = (void *)objc_claimAutoreleasedReturnValue(-[CuratedCollectionItemCellModel libraryOperationsCoordinator](self, "libraryOperationsCoordinator"));
  v3 = objc_msgSend(v2, "isPlaceInLibrary");

  return v3;
}

- (GEOLocation)currentLocation
{
  return self->_currentLocation;
}

- (void)setCurrentLocation:(id)a3
{
  objc_storeStrong((id *)&self->_currentLocation, a3);
}

- (_TtC4Maps39CuratedCollectionItemLibraryCoordinator)libraryOperationsCoordinator
{
  return self->_libraryOperationsCoordinator;
}

- (BOOL)isItemInUserCollection
{
  return self->_isItemInUserCollection;
}

- (void)setIsItemInUserCollection:(BOOL)a3
{
  self->_isItemInUserCollection = a3;
}

- (MKPlaceCollectionMapItem)collectionItem
{
  return self->_collectionItem;
}

- (NSAttributedString)itemDescription
{
  return self->_itemDescription;
}

- (GEOAppStoreAppClip)appClip
{
  return self->_appClip;
}

- (GEOMapItemPhotoInfo)photoInfo
{
  return self->_photoInfo;
}

- (void)setPhotoInfo:(id)a3
{
  objc_storeStrong((id *)&self->_photoInfo, a3);
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_photoInfo, 0);
  objc_storeStrong((id *)&self->_appClip, 0);
  objc_storeStrong((id *)&self->_itemDescription, 0);
  objc_storeStrong((id *)&self->_collectionItem, 0);
  objc_storeStrong((id *)&self->_libraryOperationsCoordinator, 0);
  objc_storeStrong((id *)&self->_currentLocation, 0);
  objc_storeStrong((id *)&self->_attribution, 0);
  objc_storeStrong((id *)&self->_placeSummaryModel, 0);
}

@end
