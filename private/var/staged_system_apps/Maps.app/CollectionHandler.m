@implementation CollectionHandler

- (NSString)description
{
  void *v3;
  void *v4;
  void *v5;
  void *v6;

  v3 = (void *)objc_claimAutoreleasedReturnValue(-[CollectionHandler identifier](self, "identifier"));
  v4 = (void *)objc_claimAutoreleasedReturnValue(-[CollectionHandler content](self, "content"));
  v5 = (void *)objc_claimAutoreleasedReturnValue(+[NSNumber numberWithUnsignedInteger:](NSNumber, "numberWithUnsignedInteger:", objc_msgSend(v4, "count")));
  v6 = (void *)objc_claimAutoreleasedReturnValue(+[NSString stringWithFormat:](NSString, "stringWithFormat:", CFSTR("<%p %@ %@ places"), self, v3, v5));

  return (NSString *)v6;
}

- (unint64_t)numberOfItems
{
  void *v2;
  id v3;

  v2 = (void *)objc_claimAutoreleasedReturnValue(-[CollectionHandler content](self, "content"));
  v3 = objc_msgSend(v2, "count");

  return (unint64_t)v3;
}

+ (CGSize)photoSize
{
  double v2;
  double v3;
  CGSize result;

  v2 = 70.0;
  v3 = 70.0;
  result.height = v3;
  result.width = v2;
  return result;
}

+ (id)addToCollection
{
  return +[PlaceholderCollectionHandler sharedInstance](PlaceholderCollectionHandler, "sharedInstance");
}

+ (id)collection
{
  id v2;
  UserCollectionHandler *v3;
  void *v4;

  v2 = objc_alloc_init((Class)MSCollection);
  v3 = -[UserCollectionHandler initWithCollection:]([UserCollectionHandler alloc], "initWithCollection:", v2);
  v4 = (void *)objc_claimAutoreleasedReturnValue(+[CollectionManager sharedManager](CollectionManager, "sharedManager"));
  -[CollectionHandler setCollectionOperation:](v3, "setCollectionOperation:", v4);

  -[UserCollectionHandler setNeedsToBePersisted:](v3, "setNeedsToBePersisted:", 1);
  return v3;
}

+ (id)collectionWithCollection:(id)a3
{
  id v3;
  uint64_t v4;
  char isKindOfClass;
  __objc2_class **v6;
  id v7;
  void *v8;

  v3 = a3;
  v4 = objc_opt_class(MSCachedCuratedCollection);
  isKindOfClass = objc_opt_isKindOfClass(v3, v4);
  v6 = &off_101196100;
  if ((isKindOfClass & 1) == 0)
    v6 = off_1011984B8;
  v7 = objc_msgSend(objc_alloc(*v6), "initWithCollection:", v3);
  v8 = (void *)objc_claimAutoreleasedReturnValue(+[CollectionManager sharedManager](CollectionManager, "sharedManager"));
  objc_msgSend(v7, "setCollectionOperation:", v8);

  return v7;
}

+ (id)collectionWithMapsSyncCollection:(id)a3
{
  return +[CollectionHandler collectionWithCollection:](CollectionHandler, "collectionWithCollection:", a3);
}

+ (id)collectionWithMapsSyncCachedCuratedCollection:(id)a3
{
  return +[CollectionHandler collectionWithCollection:](CollectionHandler, "collectionWithCollection:", a3);
}

- (CollectionHandler)initWithCollection:(id)a3
{
  id v5;
  CollectionHandler *v6;
  CollectionHandler *v7;

  v5 = a3;
  v6 = -[CollectionHandler init](self, "init");
  v7 = v6;
  if (v6)
  {
    objc_storeStrong((id *)&v6->_collection, a3);
    -[CollectionHandler _loadSortType](v7, "_loadSortType");
  }

  return v7;
}

+ (id)collectionWithStorage:(id)a3
{
  id v3;
  id v4;
  URLCollectionHandler *v5;
  void *v6;
  URLCollectionHandler *v7;

  v3 = a3;
  v4 = objc_alloc_init((Class)MSCollection);
  v5 = [URLCollectionHandler alloc];
  v6 = (void *)objc_claimAutoreleasedReturnValue(+[CollectionManager sharedManager](CollectionManager, "sharedManager"));
  v7 = -[URLCollectionHandler initWithStorage:collectionOperation:](v5, "initWithStorage:collectionOperation:", v3, v6);

  -[CollectionHandler setCollection:](v7, "setCollection:", v4);
  return v7;
}

+ (id)collectionWithCollectionHandler:(id)a3
{
  void *v3;
  void *v4;

  v3 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(a3, "collection"));
  v4 = (void *)objc_claimAutoreleasedReturnValue(+[CollectionHandler collectionWithCollection:](CollectionHandler, "collectionWithCollection:", v3));

  return v4;
}

+ (id)mspArrayForCollectionHandlers:(id)a3
{
  id v3;
  void *v4;
  id v5;
  id v6;
  id v7;
  uint64_t v8;
  void *i;
  void *v10;
  void *v11;
  void *v12;
  id v13;
  __int128 v15;
  __int128 v16;
  __int128 v17;
  __int128 v18;
  _BYTE v19[128];

  v3 = a3;
  v4 = (void *)objc_claimAutoreleasedReturnValue(+[NSMutableArray arrayWithCapacity:](NSMutableArray, "arrayWithCapacity:", objc_msgSend(v3, "count")));
  v15 = 0u;
  v16 = 0u;
  v17 = 0u;
  v18 = 0u;
  v5 = v3;
  v6 = objc_msgSend(v5, "countByEnumeratingWithState:objects:count:", &v15, v19, 16);
  if (v6)
  {
    v7 = v6;
    v8 = *(_QWORD *)v16;
    do
    {
      for (i = 0; i != v7; i = (char *)i + 1)
      {
        if (*(_QWORD *)v16 != v8)
          objc_enumerationMutation(v5);
        v10 = *(void **)(*((_QWORD *)&v15 + 1) + 8 * (_QWORD)i);
        v11 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v10, "collection", (_QWORD)v15));

        if (v11)
        {
          v12 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v10, "collection"));
          objc_msgSend(v4, "addObject:", v12);

        }
      }
      v7 = objc_msgSend(v5, "countByEnumeratingWithState:objects:count:", &v15, v19, 16);
    }
    while (v7);
  }

  v13 = objc_msgSend(v4, "copy");
  return v13;
}

+ (id)collectionAllSavedPlaces
{
  return objc_alloc_init(AllPlacesCollectionHandler);
}

+ (id)favoriteCollection
{
  return objc_alloc_init(_TtC4Maps25FavoriteCollectionHandler);
}

- (CollectionHandler)init
{
  CollectionHandler *v2;
  uint64_t v3;
  NSHashTable *observers;
  objc_super v6;

  v6.receiver = self;
  v6.super_class = (Class)CollectionHandler;
  v2 = -[CollectionHandler init](&v6, "init");
  if (v2)
  {
    v3 = objc_claimAutoreleasedReturnValue(+[NSHashTable weakObjectsHashTable](NSHashTable, "weakObjectsHashTable"));
    observers = v2->_observers;
    v2->_observers = (NSHashTable *)v3;

    v2->_sortType = 0;
  }
  return v2;
}

- (BOOL)beingModified
{
  return 0;
}

- (void)touch
{
  void *v3;
  id WeakRetained;

  WeakRetained = objc_loadWeakRetained((id *)&self->_collectionOperation);
  v3 = (void *)objc_claimAutoreleasedReturnValue(-[CollectionHandler collection](self, "collection"));
  objc_msgSend(WeakRetained, "touchCollection:", v3);

}

- (void)setSortType:(int64_t)a3
{
  if (self->_sortType != a3)
  {
    self->_sortType = a3;
    -[CollectionHandler _storeSortType](self, "_storeSortType");
    -[CollectionHandler updateSorting](self, "updateSorting");
  }
}

- (void)_storeSortType
{
  void *v3;
  uint64_t v4;
  void *v5;
  void *v6;
  id v7;
  void *v8;
  void *v9;
  void *v10;
  id v11;
  id v12;

  v3 = (void *)objc_claimAutoreleasedReturnValue(+[NSUserDefaults standardUserDefaults](NSUserDefaults, "standardUserDefaults"));
  v4 = objc_claimAutoreleasedReturnValue(objc_msgSend(v3, "objectForKey:", CFSTR("__internal_CollectionSortStorage")));
  v5 = (void *)v4;
  v6 = &__NSDictionary0__struct;
  if (v4)
    v6 = (void *)v4;
  v7 = v6;

  v12 = objc_msgSend(v7, "mutableCopy");
  v8 = (void *)objc_claimAutoreleasedReturnValue(+[NSNumber numberWithInteger:](NSNumber, "numberWithInteger:", self->_sortType));
  v9 = (void *)objc_claimAutoreleasedReturnValue(-[CollectionHandler identifier](self, "identifier"));
  objc_msgSend(v12, "setObject:forKeyedSubscript:", v8, v9);

  v10 = (void *)objc_claimAutoreleasedReturnValue(+[NSUserDefaults standardUserDefaults](NSUserDefaults, "standardUserDefaults"));
  v11 = objc_msgSend(v12, "copy");
  objc_msgSend(v10, "setObject:forKey:", v11, CFSTR("__internal_CollectionSortStorage"));

}

- (void)_loadSortType
{
  void *v3;
  void *v4;
  void *v5;
  id v6;
  id v7;

  v3 = (void *)objc_claimAutoreleasedReturnValue(+[NSUserDefaults standardUserDefaults](NSUserDefaults, "standardUserDefaults"));
  v7 = (id)objc_claimAutoreleasedReturnValue(objc_msgSend(v3, "objectForKey:", CFSTR("__internal_CollectionSortStorage")));

  v4 = (void *)objc_claimAutoreleasedReturnValue(-[CollectionHandler identifier](self, "identifier"));
  v5 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v7, "objectForKeyedSubscript:", v4));

  if (v5)
    v6 = objc_msgSend(v5, "integerValue");
  else
    v6 = 0;
  self->_sortType = (int64_t)v6;

}

- (void)updateSorting
{
  void *v3;
  id v4;
  int64_t sortType;
  void *v6;
  NSArray *v7;
  NSArray *v8;
  void *v9;
  uint64_t v10;
  uint64_t v11;
  uint64_t v12;
  NSArray *v13;
  NSArray *content;
  id v15;
  id v16;
  id v17;
  uint64_t v18;
  void *v19;
  __int128 v20;
  __int128 v21;
  __int128 v22;
  __int128 v23;
  _QWORD v24[6];
  _BYTE v25[128];

  v3 = (void *)objc_claimAutoreleasedReturnValue(-[CollectionHandler originalContent](self, "originalContent"));
  v4 = objc_msgSend(v3, "copy");

  sortType = self->_sortType;
  if (sortType == 2)
  {
    v6 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v4, "sortedArrayUsingComparator:", &stru_1011DC230));
    v7 = (NSArray *)objc_msgSend(v6, "copy");
  }
  else
  {
    if (sortType == 1)
    {
      v9 = (void *)objc_claimAutoreleasedReturnValue(+[MKLocationManager sharedLocationManager](MKLocationManager, "sharedLocationManager"));
      v6 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v9, "lastLocation"));

      objc_msgSend(v6, "coordinate");
      v11 = v10;
      objc_msgSend(v6, "coordinate");
      v24[0] = _NSConcreteStackBlock;
      v24[1] = 3221225472;
      v24[2] = sub_10092582C;
      v24[3] = &unk_1011DC210;
      v24[4] = v11;
      v24[5] = v12;
      v8 = (NSArray *)objc_claimAutoreleasedReturnValue(objc_msgSend(v4, "sortedArrayUsingComparator:", v24));
      v13 = (NSArray *)-[NSArray copy](v8, "copy");
      content = self->_content;
      self->_content = v13;

      goto LABEL_8;
    }
    if (sortType)
      goto LABEL_9;
    v6 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v4, "reverseObjectEnumerator"));
    v7 = (NSArray *)objc_claimAutoreleasedReturnValue(objc_msgSend(v6, "allObjects"));
  }
  v8 = self->_content;
  self->_content = v7;
LABEL_8:

LABEL_9:
  v22 = 0u;
  v23 = 0u;
  v20 = 0u;
  v21 = 0u;
  v15 = -[NSHashTable copy](self->_observers, "copy", 0);
  v16 = objc_msgSend(v15, "countByEnumeratingWithState:objects:count:", &v20, v25, 16);
  if (v16)
  {
    v17 = v16;
    v18 = *(_QWORD *)v21;
    do
    {
      v19 = 0;
      do
      {
        if (*(_QWORD *)v21 != v18)
          objc_enumerationMutation(v15);
        objc_msgSend(*(id *)(*((_QWORD *)&v20 + 1) + 8 * (_QWORD)v19), "collectionHandlerContentUpdated:", self);
        v19 = (char *)v19 + 1;
      }
      while (v17 != v19);
      v17 = objc_msgSend(v15, "countByEnumeratingWithState:objects:count:", &v20, v25, 16);
    }
    while (v17);
  }

  -[CollectionHandler notifyObserversInfoUpdated](self, "notifyObserversInfoUpdated");
}

- (void)initContent
{
  -[CollectionHandler updateSorting](self, "updateSorting");
  -[CollectionHandler loadImage](self, "loadImage");
}

- (NSURL)sharingURL
{
  return 0;
}

- (void)loadImage
{
  _QWORD *v3;
  void *v4;
  void *v5;
  void *v6;
  void *v7;
  void *v8;
  void *v9;
  id v10;
  uint64_t v11;
  void *i;
  void *v13;
  void *v14;
  void *v15;
  void *v16;
  void *v17;
  void *v18;
  _BOOL4 v19;
  void *v20;
  _QWORD v21[4];
  _QWORD *v22;
  id v23;
  __int128 v24;
  __int128 v25;
  __int128 v26;
  __int128 v27;
  _QWORD v28[4];
  id v29;
  id location;
  _BYTE v31[128];

  objc_initWeak(&location, self);
  v28[0] = _NSConcreteStackBlock;
  v28[1] = 3221225472;
  v28[2] = sub_100925DFC;
  v28[3] = &unk_1011ADDF0;
  objc_copyWeak(&v29, &location);
  v3 = objc_retainBlock(v28);
  v4 = (void *)objc_claimAutoreleasedReturnValue(-[CollectionHandler collection](self, "collection"));
  v5 = (void *)objc_claimAutoreleasedReturnValue(-[CollectionHandler stagedImage](self, "stagedImage"));

  if (v5)
  {
    v6 = (void *)objc_claimAutoreleasedReturnValue(-[CollectionHandler stagedImage](self, "stagedImage"));
    ((void (*)(_QWORD *, void *))v3[2])(v3, v6);
  }
  else
  {
    v7 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v4, "image"));

    if (!v7)
    {
      if ((id)-[CollectionHandler contentType](self, "contentType") == (id)1)
      {
        v26 = 0u;
        v27 = 0u;
        v24 = 0u;
        v25 = 0u;
        v9 = (void *)objc_claimAutoreleasedReturnValue(-[CollectionHandler originalContent](self, "originalContent"));
        v10 = objc_msgSend(v9, "countByEnumeratingWithState:objects:count:", &v24, v31, 16);
        if (v10)
        {
          v11 = *(_QWORD *)v25;
          while (2)
          {
            for (i = 0; i != v10; i = (char *)i + 1)
            {
              if (*(_QWORD *)v25 != v11)
                objc_enumerationMutation(v9);
              v13 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(*(id *)(*((_QWORD *)&v24 + 1)
                                                                                 + 8 * (_QWORD)i), "_geoMapItem"));
              v14 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v13, "_photos"));
              objc_msgSend((id)objc_opt_class(self), "photoSize");
              v15 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v14, "_geo_firstPhotoOfAtLeastSize:"));

              if (v15)
              {
                v6 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v15, "url"));

                goto LABEL_20;
              }
            }
            v10 = objc_msgSend(v9, "countByEnumeratingWithState:objects:count:", &v24, v31, 16);
            if (v10)
              continue;
            break;
          }
        }

      }
      else
      {
        v16 = (void *)objc_claimAutoreleasedReturnValue(-[CollectionHandler collection](self, "collection"));
        v17 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v16, "imageUrl"));

        if (v17)
        {
          v9 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v4, "imageUrl"));
          v6 = (void *)objc_claimAutoreleasedReturnValue(+[NSURL URLWithString:](NSURL, "URLWithString:", v9));
LABEL_20:

          if (v6)
          {
            v18 = (void *)objc_claimAutoreleasedReturnValue(-[CollectionHandler cachedImage](self, "cachedImage"));
            v19 = v18 == 0;

            if (v19)
              -[CollectionHandler loadDefaultImage](self, "loadDefaultImage");
            v20 = (void *)objc_claimAutoreleasedReturnValue(+[MKAppImageManager sharedCollectionCoverImageManager](MKAppImageManager, "sharedCollectionCoverImageManager"));
            v21[0] = _NSConcreteStackBlock;
            v21[1] = 3221225472;
            v21[2] = sub_100925E74;
            v21[3] = &unk_1011DC258;
            v22 = v3;
            objc_copyWeak(&v23, &location);
            objc_msgSend(v20, "loadAppImageAtURL:completionHandler:", v6, v21);

            objc_destroyWeak(&v23);
            goto LABEL_5;
          }
        }
      }
      -[CollectionHandler loadDefaultImage](self, "loadDefaultImage");
      goto LABEL_6;
    }
    v8 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v4, "image"));
    v6 = (void *)objc_claimAutoreleasedReturnValue(+[UIImage imageWithData:](UIImage, "imageWithData:", v8));

    ((void (*)(_QWORD *, void *))v3[2])(v3, v6);
  }
LABEL_5:

LABEL_6:
  objc_destroyWeak(&v29);
  objc_destroyWeak(&location);
}

- (void)loadDefaultImage
{
  void *v3;
  double v4;
  double v5;
  void *v6;
  id v7;
  _QWORD *v8;
  void *v9;
  const __CFString *v10;
  void *v11;
  void *v12;
  _QWORD v13[5];

  if (!-[CollectionHandler hasDefaultImage](self, "hasDefaultImage"))
  {
    v3 = (void *)objc_claimAutoreleasedReturnValue(+[UIScreen mainScreen](UIScreen, "mainScreen"));
    objc_msgSend(v3, "scale");
    v5 = v4;

    v6 = (void *)objc_claimAutoreleasedReturnValue(+[UIDevice currentDevice](UIDevice, "currentDevice"));
    v7 = objc_msgSend(v6, "userInterfaceIdiom");

    v13[0] = _NSConcreteStackBlock;
    v13[1] = 3221225472;
    v13[2] = sub_10092601C;
    v13[3] = &unk_1011BAA70;
    v13[4] = self;
    v8 = objc_retainBlock(v13);
    if (v7 == (id)5)
    {
      v9 = (void *)objc_claimAutoreleasedReturnValue(-[CollectionHandler originalContent](self, "originalContent"));
      if (objc_msgSend(v9, "count"))
        v10 = CFSTR("NoImageGuideIcon");
      else
        v10 = CFSTR("NewGuideIcon");
      v11 = (void *)objc_claimAutoreleasedReturnValue(+[UIImage imageNamed:](UIImage, "imageNamed:", v10));
    }
    else
    {
      v9 = (void *)objc_claimAutoreleasedReturnValue(+[UIImage maps_emptyImageScale:](UIImage, "maps_emptyImageScale:", v5));
      v12 = (void *)objc_claimAutoreleasedReturnValue(+[UIColor whiteColor](UIColor, "whiteColor"));
      v11 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v9, "imageWithTintColor:", v12));

    }
    ((void (*)(_QWORD *, void *))v8[2])(v8, v11);

  }
}

- (int)showAction
{
  return 17099;
}

- (unint64_t)bucketedNumberOfItems
{
  unint64_t result;
  int v3;

  result = -[CollectionHandler numberOfItems](self, "numberOfItems");
  if (result >= 5)
  {
    if (result <= 0xE)
    {
      v3 = result - 5 * (result / 5u);
LABEL_4:
      result -= v3;
      return result;
    }
    if (result >= 0x19)
    {
      if (result >= 0x28)
      {
        if (result <= 0x63)
        {
          v3 = result - 20 * (result / 0x14u);
          goto LABEL_4;
        }
        return 100 * (result / 0x64);
      }
      else
      {
        return 25;
      }
    }
    else
    {
      return 15;
    }
  }
  return result;
}

- (int64_t)contentType
{
  return 0;
}

- (int64_t)handlerType
{
  return 0;
}

- (void)createCollection:(id)a3
{
  id v4;
  void *v5;
  id v6;

  v4 = a3;
  v6 = (id)objc_claimAutoreleasedReturnValue(-[CollectionHandler collectionOperation](self, "collectionOperation"));
  v5 = (void *)objc_claimAutoreleasedReturnValue(-[CollectionHandler collection](self, "collection"));
  objc_msgSend(v6, "createCollection:completion:", v5, v4);

}

- (void)updateCollection:(id)a3
{
  void *v4;
  void *v5;
  id v6;

  v6 = a3;
  if (-[CollectionHandler hasBeenModified](self, "hasBeenModified"))
  {
    -[CollectionHandler setHasBeenModified:](self, "setHasBeenModified:", 0);
    v4 = (void *)objc_claimAutoreleasedReturnValue(-[CollectionHandler collectionOperation](self, "collectionOperation"));
    v5 = (void *)objc_claimAutoreleasedReturnValue(-[CollectionHandler collection](self, "collection"));
    objc_msgSend(v4, "saveCollection:completion:", v5, v6);

  }
}

- (void)deleteCollection:(id)a3
{
  id v4;
  void *v5;
  id v6;

  v4 = a3;
  v6 = (id)objc_claimAutoreleasedReturnValue(-[CollectionHandler collectionOperation](self, "collectionOperation"));
  v5 = (void *)objc_claimAutoreleasedReturnValue(-[CollectionHandler collection](self, "collection"));
  objc_msgSend(v6, "deleteCollection:completion:", v5, v4);

}

- (BOOL)updateTitle:(id)a3
{
  return objc_msgSend(a3, "length") != 0;
}

- (BOOL)updateImage:(id)a3
{
  return 1;
}

- (NSString)identifier
{
  return (NSString *)&stru_1011EB268;
}

- (NSString)title
{
  return (NSString *)&stru_1011EB268;
}

- (NSString)subtitle
{
  void *v3;
  void *v4;
  void *v5;
  void *v6;

  v3 = (void *)objc_claimAutoreleasedReturnValue(+[NSBundle mainBundle](NSBundle, "mainBundle"));
  v4 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v3, "localizedStringForKey:value:table:", CFSTR("[Collections] subtitle"), CFSTR("localized string not found"), 0));
  v5 = (void *)objc_claimAutoreleasedReturnValue(-[CollectionHandler content](self, "content"));
  v6 = (void *)objc_claimAutoreleasedReturnValue(+[NSString localizedStringWithFormat:](NSString, "localizedStringWithFormat:", v4, objc_msgSend(v5, "count")));

  return (NSString *)v6;
}

- (UIImage)image
{
  void *v3;
  void *v4;

  v3 = (void *)objc_claimAutoreleasedReturnValue(-[CollectionHandler cachedImage](self, "cachedImage"));

  if (v3)
    v4 = (void *)objc_claimAutoreleasedReturnValue(-[CollectionHandler cachedImage](self, "cachedImage"));
  else
    v4 = 0;
  return (UIImage *)v4;
}

- (UIImage)glyphImage
{
  return 0;
}

- (UIImage)badgeImage
{
  return 0;
}

- (BOOL)isFavoriteCollection
{
  return 0;
}

- (void)addObserver:(id)a3
{
  -[NSHashTable addObject:](self->_observers, "addObject:", a3);
}

- (void)removeObserver:(id)a3
{
  -[NSHashTable removeObject:](self->_observers, "removeObject:", a3);
}

- (id)itemForMapItem:(id)a3
{
  id v4;
  id v5;
  void *v6;
  void *v7;
  void *v8;
  void *v9;
  id v10;
  void *v11;
  NSMapTable *mapping;
  void *v13;
  void *v14;

  v4 = a3;
  v5 = objc_alloc((Class)NSUUID);
  v6 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v4, "_geoMapItem"));
  v7 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v6, "_clientAttributes"));
  v8 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v7, "mapsSyncAttributes"));
  v9 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v8, "mapsSyncIdentifier"));
  v10 = objc_msgSend(v5, "initWithUUIDString:", v9);

  v11 = (void *)objc_claimAutoreleasedReturnValue(-[NSMapTable objectForKey:](self->_mapping, "objectForKey:", v10));
  if (!v11)
  {
    mapping = self->_mapping;
    v13 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v4, "_geoMapItem"));
    v14 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v13, "_identifier"));
    v11 = (void *)objc_claimAutoreleasedReturnValue(-[NSMapTable objectForKey:](mapping, "objectForKey:", v14));

  }
  return v11;
}

- (void)rebuildContent:(id)a3
{
  id v4;
  NSMapTable *v5;
  NSMapTable *mapping;
  id v7;
  id v8;
  uint64_t v9;
  _UNKNOWN **v10;
  void *v11;
  void *v12;
  void *v13;
  uint64_t v14;
  _UNKNOWN **v15;
  id v16;
  void *v17;
  id v18;
  void *v19;
  NSMapTable *v20;
  void *v21;
  NSMapTable *v22;
  void *v23;
  id v24;
  uint64_t v25;
  id v26;
  void *v27;
  id v28;
  NSMapTable *v29;
  id v30;
  void *v31;
  id v32;
  void *v33;
  id obj;
  CollectionHandler *v35;
  void *v36;
  __int128 v37;
  __int128 v38;
  __int128 v39;
  __int128 v40;
  _BYTE v41[128];

  v4 = a3;
  v36 = (void *)objc_claimAutoreleasedReturnValue(+[NSMutableArray array](NSMutableArray, "array"));
  v5 = (NSMapTable *)objc_claimAutoreleasedReturnValue(+[NSMapTable strongToStrongObjectsMapTable](NSMapTable, "strongToStrongObjectsMapTable"));
  mapping = self->_mapping;
  v35 = self;
  self->_mapping = v5;

  v33 = v4;
  v37 = 0u;
  v38 = 0u;
  v39 = 0u;
  v40 = 0u;
  obj = (id)objc_claimAutoreleasedReturnValue(objc_msgSend(v4, "sortedArrayUsingComparator:", &stru_1011DC298));
  v7 = objc_msgSend(obj, "countByEnumeratingWithState:objects:count:", &v37, v41, 16);
  if (v7)
  {
    v8 = v7;
    v9 = *(_QWORD *)v38;
    v10 = MKPlaceCollectionsLogicController_ptr;
    do
    {
      v11 = 0;
      do
      {
        if (*(_QWORD *)v38 != v9)
          objc_enumerationMutation(obj);
        v12 = *(void **)(*((_QWORD *)&v37 + 1) + 8 * (_QWORD)v11);
        v13 = objc_autoreleasePoolPush();
        v14 = objc_opt_class(v10[76]);
        if ((objc_opt_isKindOfClass(v12, v14) & 1) != 0)
        {
          v15 = v10;
          v16 = v12;
          v17 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v16, "mapItemStorage"));
          v18 = (id)objc_claimAutoreleasedReturnValue(+[MKMapItem _itemWithGeoMapItem:](MKMapItem, "_itemWithGeoMapItem:", v17));

          v19 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v16, "customName"));
          objc_msgSend(v18, "setName:", v19);

          objc_msgSend(v36, "addObject:", v18);
          v20 = v35->_mapping;
          v21 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v16, "identifier"));
          -[NSMapTable setObject:forKey:](v20, "setObject:forKey:", v16, v21);

          v22 = v35->_mapping;
          v23 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v18, "_geoMapItem"));
          v24 = (id)objc_claimAutoreleasedReturnValue(objc_msgSend(v23, "_identifier"));
          -[NSMapTable setObject:forKey:](v22, "setObject:forKey:", v16, v24);

          v10 = v15;
        }
        else
        {
          v25 = objc_opt_class(MSCollectionTransitItem);
          if ((objc_opt_isKindOfClass(v12, v25) & 1) == 0)
            goto LABEL_11;
          v24 = v12;
          v26 = objc_alloc((Class)MSPTransitStorageLine);
          v27 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v24, "transitLineStorage"));
          v28 = objc_msgSend(v26, "initWithData:", v27);

          v18 = v28;
          objc_msgSend(v36, "addObject:", v18);
          -[NSMapTable setObject:forKey:](v35->_mapping, "setObject:forKey:", v24, v18);
          v29 = v35->_mapping;
          v23 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v18, "name"));

          -[NSMapTable setObject:forKey:](v29, "setObject:forKey:", v24, v23);
        }

LABEL_11:
        objc_autoreleasePoolPop(v13);
        v11 = (char *)v11 + 1;
      }
      while (v8 != v11);
      v8 = objc_msgSend(obj, "countByEnumeratingWithState:objects:count:", &v37, v41, 16);
    }
    while (v8);
  }

  v30 = objc_msgSend(v36, "copy");
  -[CollectionHandler setContent:](v35, "setContent:", v30);

  v31 = (void *)objc_claimAutoreleasedReturnValue(-[CollectionHandler content](v35, "content"));
  v32 = objc_msgSend(v31, "copy");
  -[CollectionHandler setOriginalContent:](v35, "setOriginalContent:", v32);

  -[CollectionHandler loadImage](v35, "loadImage");
  -[CollectionHandler updateSorting](v35, "updateSorting");

}

- (BOOL)containsItem:(id)a3
{
  return 0;
}

- (id)placeItemMatchingMapItem:(id)a3
{
  id v4;
  void *v5;

  v4 = a3;
  if ((id)-[CollectionHandler contentType](self, "contentType") == (id)1)
    v5 = (void *)objc_claimAutoreleasedReturnValue(-[CollectionHandler itemForMapItem:](self, "itemForMapItem:", v4));
  else
    v5 = 0;

  return v5;
}

- (BOOL)isEmpty
{
  return -[NSArray count](self->_content, "count") == 0;
}

- (BOOL)canShare
{
  BOOL v3;
  void *v4;

  if (!GEOConfigGetBOOL(MapsConfig_CollectionAllowsURLSharing, off_1014B3378)
    || -[CollectionHandler isEmpty](self, "isEmpty"))
  {
    return 0;
  }
  v4 = (void *)objc_claimAutoreleasedReturnValue(-[CollectionHandler sharingURL](self, "sharingURL"));
  v3 = v4 != 0;

  return v3;
}

- (BOOL)canDelete
{
  return 0;
}

- (BOOL)canEditImage
{
  return 0;
}

- (BOOL)canEditTitle
{
  return 0;
}

- (BOOL)canAddContent
{
  return 0;
}

- (BOOL)canDeleteContent
{
  return 0;
}

- (BOOL)loadingData
{
  return 0;
}

- (void)notifyObserversInfoUpdated
{
  _QWORD block[5];

  block[0] = _NSConcreteStackBlock;
  block[1] = 3221225472;
  block[2] = sub_100926A24;
  block[3] = &unk_1011AC860;
  block[4] = self;
  dispatch_async((dispatch_queue_t)&_dispatch_main_q, block);
}

- (void)notifyObserversContentUpdated
{
  _QWORD block[5];

  block[0] = _NSConcreteStackBlock;
  block[1] = 3221225472;
  block[2] = sub_100926B84;
  block[3] = &unk_1011AC860;
  block[4] = self;
  dispatch_async((dispatch_queue_t)&_dispatch_main_q, block);
  -[CollectionHandler notifyObserversInfoUpdated](self, "notifyObserversInfoUpdated");
}

+ (id)existingCollectionItemForMapItem:(id)a3 error:(id)a4
{
  id v5;
  id v6;
  id v7;
  void *v8;
  void *v9;
  void *v10;
  void *v11;
  id v12;
  id v13;
  id v14;
  void *v15;
  id v16;
  void *v17;
  id v19;

  v5 = a4;
  if (a3)
  {
    v6 = a3;
    v7 = objc_alloc((Class)_TtC8MapsSync22MapsSyncQueryPredicate);
    v8 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v6, "_geoMapItem"));
    v9 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v6, "_geoMapItemStorageForPersistence"));

    v10 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v9, "userValues"));
    v11 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v10, "name"));
    v12 = objc_msgSend(v7, "initWithMapItem:customName:", v8, v11);

    v13 = objc_msgSend(objc_alloc((Class)_TtC8MapsSync20MapsSyncQueryOptions), "initWithPredicate:sortDescriptors:range:", v12, 0, 0);
    v14 = objc_alloc_init((Class)MSCollectionPlaceItemRequest);
    v19 = v5;
    v15 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v14, "fetchSyncWithOptions:error:", v13, &v19));
    v16 = v19;

    v17 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v15, "firstObject"));
    v5 = v16;
  }
  else
  {
    v17 = 0;
  }

  return v17;
}

- (id)sharingURLFromContainedMapItems
{
  id v3;
  void *v4;
  void *v5;
  id v6;
  id v7;
  id v8;
  uint64_t v9;
  void *v10;
  void *v11;
  id v12;
  void *v13;
  id v14;
  double v15;
  void *v16;
  void *v17;
  __int128 v19;
  __int128 v20;
  __int128 v21;
  __int128 v22;
  _BYTE v23[128];

  v3 = objc_alloc_init((Class)GEOURLCollectionStorage);
  v4 = (void *)objc_claimAutoreleasedReturnValue(-[CollectionHandler title](self, "title"));
  objc_msgSend(v3, "setName:", v4);

  v21 = 0u;
  v22 = 0u;
  v19 = 0u;
  v20 = 0u;
  v5 = (void *)objc_claimAutoreleasedReturnValue(-[CollectionHandler content](self, "content", 0));
  v6 = objc_msgSend(v5, "copy");

  v7 = objc_msgSend(v6, "countByEnumeratingWithState:objects:count:", &v19, v23, 16);
  if (v7)
  {
    v8 = v7;
    v9 = *(_QWORD *)v20;
    do
    {
      v10 = 0;
      do
      {
        if (*(_QWORD *)v20 != v9)
          objc_enumerationMutation(v6);
        v11 = *(void **)(*((_QWORD *)&v19 + 1) + 8 * (_QWORD)v10);
        v12 = objc_alloc_init((Class)GEOCollectionPlace);
        if (objc_msgSend(v11, "_hasMUID"))
        {
          objc_msgSend(v12, "setMuid:", objc_msgSend(v11, "_muid"));
          if (objc_msgSend(v11, "_hasResultProviderID"))
            objc_msgSend(v12, "setProviderId:", objc_msgSend(v11, "_resultProviderID"));
        }
        else
        {
          v13 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v11, "_addressFormattedAsSinglelineAddress"));
          v14 = objc_alloc_init((Class)GEOLatLng);
          objc_msgSend(v11, "_coordinate");
          objc_msgSend(v14, "setLat:");
          objc_msgSend(v11, "_coordinate");
          objc_msgSend(v14, "setLng:", v15);
          objc_msgSend(v12, "setAddress:", v13);
          objc_msgSend(v12, "setCoordinate:", v14);
          v16 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v11, "name"));
          objc_msgSend(v12, "setName:", v16);

        }
        objc_msgSend(v3, "addPlace:", v12);

        v10 = (char *)v10 + 1;
      }
      while (v8 != v10);
      v8 = objc_msgSend(v6, "countByEnumeratingWithState:objects:count:", &v19, v23, 16);
    }
    while (v8);
  }

  v17 = (void *)objc_claimAutoreleasedReturnValue(+[_MKURLBuilder URLForCollectionStorage:](_MKURLBuilder, "URLForCollectionStorage:", v3));
  return v17;
}

- (NSArray)content
{
  return self->_content;
}

- (void)setContent:(id)a3
{
  objc_storeStrong((id *)&self->_content, a3);
}

- (int64_t)sortType
{
  return self->_sortType;
}

- (NSString)debugString
{
  return self->_debugString;
}

- (void)setDebugString:(id)a3
{
  objc_storeStrong((id *)&self->_debugString, a3);
}

- (CollectionManagerOperation)collectionOperation
{
  return (CollectionManagerOperation *)objc_loadWeakRetained((id *)&self->_collectionOperation);
}

- (void)setCollectionOperation:(id)a3
{
  objc_storeWeak((id *)&self->_collectionOperation, a3);
}

- (MapsSyncCollectionLike)collection
{
  return self->_collection;
}

- (void)setCollection:(id)a3
{
  objc_storeStrong((id *)&self->_collection, a3);
}

- (BOOL)hasBeenModified
{
  return self->_hasBeenModified;
}

- (void)setHasBeenModified:(BOOL)a3
{
  self->_hasBeenModified = a3;
}

- (BOOL)hasDefaultImage
{
  return self->_hasDefaultImage;
}

- (void)setHasDefaultImage:(BOOL)a3
{
  self->_hasDefaultImage = a3;
}

- (UIImage)cachedImage
{
  return self->_cachedImage;
}

- (void)setCachedImage:(id)a3
{
  objc_storeStrong((id *)&self->_cachedImage, a3);
}

- (UIImage)stagedImage
{
  return self->_stagedImage;
}

- (void)setStagedImage:(id)a3
{
  objc_storeStrong((id *)&self->_stagedImage, a3);
}

- (NSArray)originalContent
{
  return self->_originalContent;
}

- (void)setOriginalContent:(id)a3
{
  objc_storeStrong((id *)&self->_originalContent, a3);
}

- (NSMapTable)mapping
{
  return self->_mapping;
}

- (void)setMapping:(id)a3
{
  objc_storeStrong((id *)&self->_mapping, a3);
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_mapping, 0);
  objc_storeStrong((id *)&self->_originalContent, 0);
  objc_storeStrong((id *)&self->_stagedImage, 0);
  objc_storeStrong((id *)&self->_cachedImage, 0);
  objc_storeStrong((id *)&self->_collection, 0);
  objc_destroyWeak((id *)&self->_collectionOperation);
  objc_storeStrong((id *)&self->_debugString, 0);
  objc_storeStrong((id *)&self->_content, 0);
  objc_storeStrong((id *)&self->_observers, 0);
}

@end
