@implementation CuratedCollectionDescriptionCellModel

- (CuratedCollectionDescriptionCellModel)initWithCollection:(id)a3 collectionDescription:(id)a4
{
  id v7;
  id v8;
  CuratedCollectionDescriptionCellModel *v9;
  CuratedCollectionDescriptionCellModel *v10;
  NSAttributedString *v11;
  NSAttributedString *collectionDescription;
  objc_super v14;

  v7 = a3;
  v8 = a4;
  v14.receiver = self;
  v14.super_class = (Class)CuratedCollectionDescriptionCellModel;
  v9 = -[CuratedCollectionDescriptionCellModel init](&v14, "init");
  v10 = v9;
  if (v9)
  {
    objc_storeStrong((id *)&v9->_collection, a3);
    v11 = (NSAttributedString *)objc_msgSend(v8, "copy");
    collectionDescription = v10->_collectionDescription;
    v10->_collectionDescription = v11;

    if (qword_1014D22F8 != -1)
      dispatch_once(&qword_1014D22F8, &stru_1011B3D70);
  }

  return v10;
}

- (BOOL)hasAuthorImage
{
  void *v2;
  void *v3;
  BOOL v4;

  v2 = (void *)objc_claimAutoreleasedReturnValue(-[CuratedCollectionDescriptionCellModel collection](self, "collection"));
  v3 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v2, "authorPhoto"));
  v4 = v3 != 0;

  return v4;
}

- (BOOL)hasAuthorName
{
  void *v2;
  void *v3;
  BOOL v4;

  v2 = (void *)objc_claimAutoreleasedReturnValue(-[CuratedCollectionDescriptionCellModel collection](self, "collection"));
  v3 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v2, "authorName"));
  v4 = v3 != 0;

  return v4;
}

- (void)loadAuthorImageForSize:(CGSize)a3 completion:(id)a4
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
  void *v16;
  _QWORD v17[4];
  id v18;
  id v19[3];
  id location;

  height = a3.height;
  width = a3.width;
  v7 = a4;
  v8 = (void *)objc_claimAutoreleasedReturnValue(+[MKSystemController sharedInstance](MKSystemController, "sharedInstance"));
  objc_msgSend(v8, "screenScale");
  v10 = v9;

  v11 = (void *)objc_claimAutoreleasedReturnValue(-[CuratedCollectionDescriptionCellModel collection](self, "collection"));
  v12 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v11, "authorPhoto"));

  v13 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v12, "bestPhotoForSize:allowSmaller:", 1, width * v10, height * v10));
  -[CuratedCollectionDescriptionCellModel setPhotoInfo:](self, "setPhotoInfo:", v13);

  if (-[CuratedCollectionDescriptionCellModel hasAuthorImage](self, "hasAuthorImage"))
  {
    objc_initWeak(&location, self);
    v14 = (void *)objc_claimAutoreleasedReturnValue(+[MKAppImageManager sharedImageManager](MKAppImageManager, "sharedImageManager"));
    v15 = (void *)objc_claimAutoreleasedReturnValue(-[CuratedCollectionDescriptionCellModel photoInfo](self, "photoInfo"));
    v16 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v15, "url"));
    v17[0] = _NSConcreteStackBlock;
    v17[1] = 3221225472;
    v17[2] = sub_1003A7930;
    v17[3] = &unk_1011B3D98;
    objc_copyWeak(v19, &location);
    v19[1] = *(id *)&width;
    v19[2] = *(id *)&height;
    v18 = v7;
    objc_msgSend(v14, "loadAppImageAtURL:completionHandler:", v16, v17);

    objc_destroyWeak(v19);
    objc_destroyWeak(&location);
  }
  else
  {
    -[CuratedCollectionDescriptionCellModel _loadCompanyLogoForSize:authorError:completion:](self, "_loadCompanyLogoForSize:authorError:completion:", 0, v7, width, height);
  }

}

- (void)_loadCompanyLogoForSize:(CGSize)a3 authorError:(id)a4 completion:(id)a5
{
  id v7;
  id v8;
  void *v9;
  double v10;
  double v11;
  void *v12;
  void *v13;
  id v14;
  void *v15;
  void *v16;
  void *v17;
  void *v18;
  id v19;
  id v20;
  _QWORD v21[4];
  id v22;
  id v23;

  v7 = a4;
  v8 = a5;
  v9 = (void *)objc_claimAutoreleasedReturnValue(+[MKSystemController sharedInstance](MKSystemController, "sharedInstance"));
  objc_msgSend(v9, "screenScale");
  v11 = v10;

  v12 = (void *)objc_claimAutoreleasedReturnValue(-[CuratedCollectionDescriptionCellModel collection](self, "collection"));
  v13 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v12, "publisherAttribution"));
  v14 = objc_msgSend(v13, "iconIdentifier");

  v15 = (void *)objc_claimAutoreleasedReturnValue(-[CuratedCollectionDescriptionCellModel collection](self, "collection"));
  v16 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v15, "publisherAttribution"));
  v17 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v16, "displayName"));

  v18 = (void *)objc_claimAutoreleasedReturnValue(+[MKPlaceCollectionsPublisherIconManager sharedInstance](MKPlaceCollectionsPublisherIconManager, "sharedInstance"));
  v21[0] = _NSConcreteStackBlock;
  v21[1] = 3221225472;
  v21[2] = sub_1003A7B18;
  v21[3] = &unk_1011ACC70;
  v22 = v7;
  v23 = v8;
  v19 = v7;
  v20 = v8;
  objc_msgSend(v18, "iconForPublisherNamed:usingId:contentScale:onCompletion:", v17, v14, v21, v11);

}

- (void)cancelAuthorImageDownload
{
  void *v3;
  void *v4;
  id v5;

  v5 = (id)objc_claimAutoreleasedReturnValue(+[MKAppImageManager sharedImageManager](MKAppImageManager, "sharedImageManager"));
  v3 = (void *)objc_claimAutoreleasedReturnValue(-[CuratedCollectionDescriptionCellModel photoInfo](self, "photoInfo"));
  v4 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v3, "url"));
  objc_msgSend(v5, "cancelLoadAppImageAtURL:", v4);

}

- (NSString)authorName
{
  void *v3;
  void *v4;

  if (-[CuratedCollectionDescriptionCellModel hasAuthorName](self, "hasAuthorName"))
  {
    v3 = (void *)objc_claimAutoreleasedReturnValue(-[CuratedCollectionDescriptionCellModel collection](self, "collection"));
    v4 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v3, "authorName"));

  }
  else
  {
    v4 = (void *)objc_claimAutoreleasedReturnValue(-[CuratedCollectionDescriptionCellModel companyName](self, "companyName"));
  }
  return (NSString *)v4;
}

- (NSString)companyName
{
  void *v2;
  void *v3;
  void *v4;

  v2 = (void *)objc_claimAutoreleasedReturnValue(-[CuratedCollectionDescriptionCellModel collection](self, "collection"));
  v3 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v2, "publisherAttribution"));
  v4 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v3, "displayName"));

  return (NSString *)v4;
}

- (NSString)collectionMetadata
{
  void *v3;
  void *v4;
  void *v5;
  void *v6;
  void *v7;
  void *v8;
  void *v9;
  void *v10;
  void *v11;
  void *v12;
  void *v13;
  void *v14;
  void *v15;
  void *v16;
  void *v17;
  void *v18;
  void *v19;
  void *v20;
  void *v21;
  uint64_t v22;
  void *v23;
  id v24;
  void *v25;
  uint64_t v26;
  void *v27;
  _QWORD v29[2];
  void *v30;

  v3 = (void *)objc_claimAutoreleasedReturnValue(+[NSBundle mainBundle](NSBundle, "mainBundle"));
  v4 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v3, "localizedStringForKey:value:table:", CFSTR("Number of places [Curated Collection]"), CFSTR("localized string not found"), 0));
  v5 = (void *)objc_claimAutoreleasedReturnValue(-[CuratedCollectionDescriptionCellModel collection](self, "collection"));
  v6 = (void *)objc_claimAutoreleasedReturnValue(+[NSString stringWithFormat:](NSString, "stringWithFormat:", v4, objc_msgSend(v5, "numberOfItems")));

  v7 = (void *)objc_claimAutoreleasedReturnValue(+[NSDate date](NSDate, "date"));
  v8 = (void *)objc_claimAutoreleasedReturnValue(+[NSCalendar currentCalendar](NSCalendar, "currentCalendar"));
  v9 = (void *)objc_claimAutoreleasedReturnValue(-[CuratedCollectionDescriptionCellModel collection](self, "collection"));
  v10 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v9, "lastModifiedDate"));
  v11 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v8, "components:fromDate:toDate:options:", 16, v10, v7, 0));

  v12 = 0;
  if ((uint64_t)objc_msgSend(v11, "day") <= 14)
  {
    v13 = (void *)qword_1014D2300;
    v14 = (void *)objc_claimAutoreleasedReturnValue(-[CuratedCollectionDescriptionCellModel collection](self, "collection"));
    v15 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v14, "lastModifiedDate"));
    v16 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v13, "localizedStringForDate:relativeToDate:", v15, v7));

    v17 = (void *)objc_claimAutoreleasedReturnValue(+[NSBundle mainBundle](NSBundle, "mainBundle"));
    v18 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v17, "localizedStringForKey:value:table:", CFSTR("[Curated Collection] Updated"), CFSTR("localized string not found"), 0));
    v12 = (void *)objc_claimAutoreleasedReturnValue(+[NSString localizedStringWithFormat:](NSString, "localizedStringWithFormat:", v18, v16));

  }
  v19 = (void *)objc_claimAutoreleasedReturnValue(+[NSBundle mainBundle](NSBundle, "mainBundle"));
  v20 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v19, "localizedStringForKey:value:table:", CFSTR(" · [List view details separator]"), CFSTR("localized string not found"), 0));

  v30 = v6;
  v21 = (void *)objc_claimAutoreleasedReturnValue(+[NSArray arrayWithObjects:count:](NSArray, "arrayWithObjects:count:", &v30, 1));
  if (v12)
  {
    v29[0] = v6;
    v29[1] = v12;
    v22 = objc_claimAutoreleasedReturnValue(+[NSArray arrayWithObjects:count:](NSArray, "arrayWithObjects:count:", v29, 2));

    v21 = (void *)v22;
  }
  v23 = (void *)objc_claimAutoreleasedReturnValue(+[UIApplication sharedApplication](UIApplication, "sharedApplication"));
  v24 = objc_msgSend(v23, "userInterfaceLayoutDirection");

  if (v24 == (id)1)
  {
    v25 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v21, "reverseObjectEnumerator"));
    v26 = objc_claimAutoreleasedReturnValue(objc_msgSend(v25, "allObjects"));

    v21 = (void *)v26;
  }
  v27 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v21, "componentsJoinedByString:", v20));

  return (NSString *)v27;
}

- (GEOPlaceCollection)collection
{
  return self->_collection;
}

- (NSAttributedString)collectionDescription
{
  return self->_collectionDescription;
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
  objc_storeStrong((id *)&self->_collectionDescription, 0);
  objc_storeStrong((id *)&self->_collection, 0);
}

@end
