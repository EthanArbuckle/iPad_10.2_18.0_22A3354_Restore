@implementation BKLibraryBookshelfSupplementaryDataSource

- (BKLibraryBookshelfSupplementaryDataSource)init
{
  BKLibraryBookshelfSupplementaryDataSource *v2;
  void *v3;
  void *v4;
  void *v5;
  uint64_t v6;
  NSNumber *currentStoreAccountID;
  objc_super v9;

  v9.receiver = self;
  v9.super_class = (Class)BKLibraryBookshelfSupplementaryDataSource;
  v2 = -[BKLibraryBookshelfSupplementaryDataSource init](&v9, "init");
  if (v2)
  {
    v3 = (void *)objc_claimAutoreleasedReturnValue(+[BUAccountsProvider sharedProvider](BUAccountsProvider, "sharedProvider"));
    objc_msgSend(v3, "addObserver:accountTypes:", v2, 1);

    v4 = (void *)objc_claimAutoreleasedReturnValue(+[BUAccountsProvider sharedProvider](BUAccountsProvider, "sharedProvider"));
    v5 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v4, "activeStoreAccount"));
    v6 = objc_claimAutoreleasedReturnValue(objc_msgSend(v5, "ams_DSID"));
    currentStoreAccountID = v2->_currentStoreAccountID;
    v2->_currentStoreAccountID = (NSNumber *)v6;

    -[BKLibraryBookshelfSupplementaryDataSource _updateStoreStatus](v2, "_updateStoreStatus");
  }
  return v2;
}

- (void)dealloc
{
  void *v3;
  objc_super v4;

  v3 = (void *)objc_claimAutoreleasedReturnValue(+[BUAccountsProvider sharedProvider](BUAccountsProvider, "sharedProvider"));
  objc_msgSend(v3, "removeObserver:accountTypes:", self, 1);

  v4.receiver = self;
  v4.super_class = (Class)BKLibraryBookshelfSupplementaryDataSource;
  -[BKLibraryBookshelfSupplementaryDataSource dealloc](&v4, "dealloc");
}

- (void)_updateStoreStatus
{
  void *v3;
  uint64_t v4;
  id v5;

  v5 = (id)objc_claimAutoreleasedReturnValue(+[BUAccountsProvider sharedProvider](BUAccountsProvider, "sharedProvider"));
  if (objc_msgSend(v5, "isStoreAccountManagedAppleID"))
  {
    -[BKLibraryBookshelfSupplementaryDataSource setStoreStatus:](self, "setStoreStatus:", 2);
  }
  else
  {
    v3 = (void *)objc_claimAutoreleasedReturnValue(+[BURestrictionsProvider sharedInstance](BURestrictionsProvider, "sharedInstance"));
    if (objc_msgSend(v3, "isBookStoreAllowed"))
      v4 = 1;
    else
      v4 = 2;
    -[BKLibraryBookshelfSupplementaryDataSource setStoreStatus:](self, "setStoreStatus:", v4);

  }
}

- (BOOL)storeReachable
{
  if (!-[BKLibraryBookshelfSupplementaryDataSource storeStatus](self, "storeStatus"))
    -[BKLibraryBookshelfSupplementaryDataSource _updateStoreStatus](self, "_updateStoreStatus");
  if ((id)-[BKLibraryBookshelfSupplementaryDataSource storeStatus](self, "storeStatus") == (id)1)
    return +[BKReachability isOffline](BKReachability, "isOffline") ^ 1;
  else
    return 0;
}

- (BOOL)collectionIsSeries
{
  void *v2;
  BOOL v3;

  v2 = (void *)objc_claimAutoreleasedReturnValue(-[BKLibraryBookshelfSupplementaryDataSource collection](self, "collection"));
  v3 = v2 == 0;

  return v3;
}

- (id)templateCloudImageForCloudState:(int64_t)a3
{
  void *v5;
  void *v6;
  void *v7;
  uint64_t v8;
  void *v9;
  void *v10;
  void *v11;
  void *v12;
  double v13;
  void *v14;
  id v15;
  void *v16;
  uint64_t v17;
  void *v18;
  void *v19;
  void *v20;
  uint64_t v22;

  if (a3)
  {
    v5 = (void *)objc_claimAutoreleasedReturnValue(-[BKLibraryBookshelfSupplementaryDataSource templateCloudImages](self, "templateCloudImages"));
    if (!v5)
    {
      v5 = (void *)objc_claimAutoreleasedReturnValue(+[NSMutableDictionary dictionary](NSMutableDictionary, "dictionary"));
      -[BKLibraryBookshelfSupplementaryDataSource setTemplateCloudImages:](self, "setTemplateCloudImages:", v5);
    }
    v6 = (void *)objc_claimAutoreleasedReturnValue(+[NSNumber numberWithInteger:](NSNumber, "numberWithInteger:", a3));
    v7 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v5, "objectForKeyedSubscript:", v6));
    if (v7)
      goto LABEL_19;
    switch(a3)
    {
      case 3:
        v8 = objc_claimAutoreleasedReturnValue(-[BKLibraryBookshelfSupplementaryDataSource cloudErrorImageName](self, "cloudErrorImageName"));
        break;
      case 2:
        v8 = objc_claimAutoreleasedReturnValue(-[BKLibraryBookshelfSupplementaryDataSource cloudUploadingImageName](self, "cloudUploadingImageName"));
        break;
      case 1:
        v8 = objc_claimAutoreleasedReturnValue(-[BKLibraryBookshelfSupplementaryDataSource cloudDownloadImageName](self, "cloudDownloadImageName"));
        break;
      default:
        v7 = 0;
        v9 = 0;
LABEL_18:

LABEL_19:
        return v7;
    }
    v9 = (void *)v8;
    if (v8)
    {
      v10 = (void *)objc_claimAutoreleasedReturnValue(+[BSUITemplate manager](BSUITemplate, "manager"));
      v11 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v10, "imageResourceCache"));
      v12 = (void *)objc_claimAutoreleasedReturnValue(+[UIScreen mainScreen](UIScreen, "mainScreen"));
      objc_msgSend(v12, "scale");
      LOBYTE(v22) = 1;
      v14 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v11, "symbolImageWithName:compatibleWithFontSize:weight:scale:renderingMode:colors:style:contentsScale:layoutDirection:insets:baseline:", v9, 5, 2, 0, 0, 0, 13.0, v13, UIEdgeInsetsZero.top, UIEdgeInsetsZero.left, UIEdgeInsetsZero.bottom, UIEdgeInsetsZero.right, 0, v22));
      v15 = objc_msgSend(v14, "newImageWithoutContentInsets");
      v7 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v15, "imageWithRenderingMode:", 2));

      if (v7)
        goto LABEL_15;
      v16 = (void *)objc_claimAutoreleasedReturnValue(+[UIImageSymbolConfiguration configurationWithPointSize:weight:scale:](UIImageSymbolConfiguration, "configurationWithPointSize:weight:scale:", 5, 2, 13.0));
      v17 = BSUIBundle();
      v18 = (void *)objc_claimAutoreleasedReturnValue(v17);
      v19 = (void *)objc_claimAutoreleasedReturnValue(+[UIImage imageNamed:inBundle:withConfiguration:](UIImage, "imageNamed:inBundle:withConfiguration:", v9, v18, v16));
      v7 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v19, "imageWithRenderingMode:", 2));

      if (v7)
      {
LABEL_15:
        v20 = (void *)objc_claimAutoreleasedReturnValue(-[BKLibraryBookshelfSupplementaryDataSource templateCloudImages](self, "templateCloudImages"));
        objc_msgSend(v20, "setObject:forKeyedSubscript:", v7, v6);

      }
    }
    else
    {
      v7 = 0;
    }
    goto LABEL_18;
  }
  v7 = 0;
  return v7;
}

- (id)actionMenuImageWithTintColor:(id)a3
{
  id v4;
  void *v5;
  unsigned __int8 v6;
  void *v7;
  void *v8;
  void *v9;
  void *v10;
  double v11;
  void *v12;
  id v13;
  void *v14;
  void *v15;
  uint64_t v17;

  v4 = a3;
  v5 = (void *)objc_claimAutoreleasedReturnValue(-[BKLibraryBookshelfSupplementaryDataSource actionMenuImageTintColor](self, "actionMenuImageTintColor"));
  v6 = objc_msgSend(v4, "isEqual:", v5);

  if ((v6 & 1) == 0)
  {
    v7 = (void *)objc_claimAutoreleasedReturnValue(+[BSUITemplate manager](BSUITemplate, "manager"));
    v8 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v7, "imageResourceCache"));
    v9 = (void *)objc_claimAutoreleasedReturnValue(-[BKLibraryBookshelfSupplementaryDataSource actionMenuImageName](self, "actionMenuImageName"));
    v10 = (void *)objc_claimAutoreleasedReturnValue(+[UIScreen mainScreen](UIScreen, "mainScreen"));
    objc_msgSend(v10, "scale");
    LOBYTE(v17) = 1;
    v12 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v8, "symbolImageWithName:compatibleWithFontSize:weight:scale:renderingMode:colors:style:contentsScale:layoutDirection:insets:baseline:", v9, 7, 3, 0, 0, 0, 13.0, v11, UIEdgeInsetsZero.top, UIEdgeInsetsZero.left, UIEdgeInsetsZero.bottom, UIEdgeInsetsZero.right, 0, v17));
    v13 = objc_msgSend(v12, "newImageWithoutContentInsets");
    v14 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v13, "imageMaskWithColor:", v4));
    -[BKLibraryBookshelfSupplementaryDataSource setActionMenuImageWithTintColor:](self, "setActionMenuImageWithTintColor:", v14);

    -[BKLibraryBookshelfSupplementaryDataSource setActionMenuImageTintColor:](self, "setActionMenuImageTintColor:", v4);
  }
  v15 = (void *)objc_claimAutoreleasedReturnValue(-[BKLibraryBookshelfSupplementaryDataSource actionMenuImageWithTintColor](self, "actionMenuImageWithTintColor"));

  return v15;
}

- (id)infoBarAudiobookImageWithTintColor:(id)a3
{
  id v4;
  void *v5;
  unsigned __int8 v6;
  void *v7;
  void *v8;
  void *v9;
  uint64_t v10;
  void *v11;
  double v12;
  void *v13;
  id v14;
  void *v15;
  void *v16;
  uint64_t v18;

  v4 = a3;
  v5 = (void *)objc_claimAutoreleasedReturnValue(-[BKLibraryBookshelfSupplementaryDataSource infoBarAudiobookImageTintColor](self, "infoBarAudiobookImageTintColor"));
  v6 = objc_msgSend(v4, "isEqual:", v5);

  if ((v6 & 1) == 0)
  {
    v7 = (void *)objc_claimAutoreleasedReturnValue(+[BSUITemplate manager](BSUITemplate, "manager"));
    v8 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v7, "imageResourceCache"));
    v9 = (void *)objc_claimAutoreleasedReturnValue(-[BKLibraryBookshelfSupplementaryDataSource infoBarAudiobookImageName](self, "infoBarAudiobookImageName"));
    v10 = UIImageSymbolSizeMedium;
    v11 = (void *)objc_claimAutoreleasedReturnValue(+[UIScreen mainScreen](UIScreen, "mainScreen"));
    objc_msgSend(v11, "scale");
    LOBYTE(v18) = 1;
    v13 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v8, "symbolImageWithName:compatibleWithFontSize:weight:scale:renderingMode:colors:style:contentsScale:layoutDirection:insets:baseline:", v9, 5, v10, 0, 0, 0, 13.0, v12, UIEdgeInsetsZero.top, UIEdgeInsetsZero.left, UIEdgeInsetsZero.bottom, UIEdgeInsetsZero.right, 1, v18));
    v14 = objc_msgSend(v13, "newImageWithoutContentInsets");
    v15 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v14, "imageMaskWithColor:", v4));
    -[BKLibraryBookshelfSupplementaryDataSource setInfoBarAudiobookImageWithTintColor:](self, "setInfoBarAudiobookImageWithTintColor:", v15);

    -[BKLibraryBookshelfSupplementaryDataSource setInfoBarAudiobookImageTintColor:](self, "setInfoBarAudiobookImageTintColor:", v4);
  }
  v16 = (void *)objc_claimAutoreleasedReturnValue(-[BKLibraryBookshelfSupplementaryDataSource infoBarAudiobookImageWithTintColor](self, "infoBarAudiobookImageWithTintColor"));

  return v16;
}

- (id)dragBarImageWithTintColor:(id)a3
{
  id v4;
  void *v5;
  unsigned __int8 v6;
  void *v7;
  void *v8;
  void *v9;
  void *v10;
  void *v11;
  void *v12;

  v4 = a3;
  v5 = (void *)objc_claimAutoreleasedReturnValue(-[BKLibraryBookshelfSupplementaryDataSource dragBarTintColor](self, "dragBarTintColor"));
  v6 = objc_msgSend(v4, "isEqual:", v5);

  if ((v6 & 1) == 0)
  {
    v7 = (void *)objc_claimAutoreleasedReturnValue(+[UIImageSymbolConfiguration configurationWithPointSize:weight:scale:](UIImageSymbolConfiguration, "configurationWithPointSize:weight:scale:", 6, 2, 20.0));
    v8 = (void *)objc_claimAutoreleasedReturnValue(-[BKLibraryBookshelfSupplementaryDataSource dragBarName](self, "dragBarName"));
    v9 = (void *)objc_claimAutoreleasedReturnValue(+[UIImage systemImageNamed:](UIImage, "systemImageNamed:", v8));
    v10 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v9, "imageWithConfiguration:", v7));
    v11 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v10, "imageMaskWithColor:", v4));
    -[BKLibraryBookshelfSupplementaryDataSource setDragBarImage:](self, "setDragBarImage:", v11);

    -[BKLibraryBookshelfSupplementaryDataSource setDragBarTintColor:](self, "setDragBarTintColor:", v4);
  }
  v12 = (void *)objc_claimAutoreleasedReturnValue(-[BKLibraryBookshelfSupplementaryDataSource dragBarImage](self, "dragBarImage"));

  return v12;
}

- (id)selectedCheckmarkImageForSelectedState:(BOOL)a3
{
  void *v5;
  void *v6;
  void *v7;
  void *v8;
  void *v9;
  void *v10;
  void *v11;
  void *v12;
  void *v13;
  uint64_t v14;
  void *v15;

  v5 = (void *)objc_claimAutoreleasedReturnValue(+[UIImageSymbolConfiguration configurationWithPointSize:weight:](UIImageSymbolConfiguration, "configurationWithPointSize:weight:", 4, 22.0));
  v6 = (void *)objc_claimAutoreleasedReturnValue(-[BKLibraryBookshelfSupplementaryDataSource selectedCheckmarkImage](self, "selectedCheckmarkImage"));

  if (!v6)
  {
    v7 = (void *)objc_claimAutoreleasedReturnValue(-[BKLibraryBookshelfSupplementaryDataSource selectedCheckmarkName](self, "selectedCheckmarkName"));
    v8 = (void *)objc_claimAutoreleasedReturnValue(+[UIImage systemImageNamed:](UIImage, "systemImageNamed:", v7));
    v9 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v8, "imageWithConfiguration:", v5));
    -[BKLibraryBookshelfSupplementaryDataSource setSelectedCheckmarkImage:](self, "setSelectedCheckmarkImage:", v9);

  }
  v10 = (void *)objc_claimAutoreleasedReturnValue(-[BKLibraryBookshelfSupplementaryDataSource unselectedCheckmarkImage](self, "unselectedCheckmarkImage"));

  if (!v10)
  {
    v11 = (void *)objc_claimAutoreleasedReturnValue(-[BKLibraryBookshelfSupplementaryDataSource unselectedCheckmarkName](self, "unselectedCheckmarkName"));
    v12 = (void *)objc_claimAutoreleasedReturnValue(+[UIImage systemImageNamed:](UIImage, "systemImageNamed:", v11));
    v13 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v12, "imageWithConfiguration:", v5));
    -[BKLibraryBookshelfSupplementaryDataSource setUnselectedCheckmarkImage:](self, "setUnselectedCheckmarkImage:", v13);

  }
  if (a3)
    v14 = objc_claimAutoreleasedReturnValue(-[BKLibraryBookshelfSupplementaryDataSource selectedCheckmarkImage](self, "selectedCheckmarkImage"));
  else
    v14 = objc_claimAutoreleasedReturnValue(-[BKLibraryBookshelfSupplementaryDataSource unselectedCheckmarkImage](self, "unselectedCheckmarkImage"));
  v15 = (void *)v14;

  return v15;
}

- (void)setCollectionTitle:(id)a3
{
  NSString *v4;
  NSString *collectionTitle;
  void *v6;
  void *v7;
  void *v8;
  void *v9;
  void *v10;
  void *v11;
  id v12;

  v12 = a3;
  if (!-[NSString isEqualToString:](self->_collectionTitle, "isEqualToString:"))
  {
    v4 = (NSString *)objc_msgSend(v12, "copy");
    collectionTitle = self->_collectionTitle;
    self->_collectionTitle = v4;

    v6 = (void *)objc_claimAutoreleasedReturnValue(-[BKLibraryBookshelfSupplementaryDataSource collection](self, "collection"));
    v7 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v6, "title"));
    if ((objc_msgSend(v7, "isEqualToString:", v12) & 1) != 0)
    {
LABEL_7:

      goto LABEL_8;
    }
    if (v12)
    {

LABEL_6:
      v10 = (void *)objc_claimAutoreleasedReturnValue(-[BKLibraryBookshelfSupplementaryDataSource collection](self, "collection"));
      objc_msgSend(v10, "setTitle:", v12);

      v6 = (void *)objc_claimAutoreleasedReturnValue(+[BKLibraryManager defaultManager](BKLibraryManager, "defaultManager"));
      v7 = (void *)objc_claimAutoreleasedReturnValue(-[BKLibraryBookshelfSupplementaryDataSource collection](self, "collection"));
      v11 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v7, "managedObjectContext"));
      objc_msgSend(v6, "saveManagedObjectContext:", v11);

      goto LABEL_7;
    }
    v8 = (void *)objc_claimAutoreleasedReturnValue(-[BKLibraryBookshelfSupplementaryDataSource collection](self, "collection"));
    v9 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v8, "title"));

    if (v9)
      goto LABEL_6;
  }
LABEL_8:

}

- (void)setCollectionDescription:(id)a3
{
  NSString *v4;
  NSString *collectionDescription;
  void *v6;
  void *v7;
  void *v8;
  void *v9;
  void *v10;
  void *v11;
  void *v12;
  void *v13;
  id v14;

  v14 = a3;
  if (!-[NSString isEqualToString:](self->_collectionDescription, "isEqualToString:"))
  {
    v4 = (NSString *)objc_msgSend(v14, "copy");
    collectionDescription = self->_collectionDescription;
    self->_collectionDescription = v4;

    v6 = (void *)objc_claimAutoreleasedReturnValue(-[BKLibraryBookshelfSupplementaryDataSource collection](self, "collection"));
    v7 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v6, "details"));
    if (v7 || objc_msgSend(v14, "length"))
    {
      v8 = (void *)objc_claimAutoreleasedReturnValue(-[BKLibraryBookshelfSupplementaryDataSource collection](self, "collection"));
      v9 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v8, "details"));
      if ((objc_msgSend(v9, "isEqualToString:", v14) & 1) != 0)
      {

      }
      else
      {
        if (v14)
        {

        }
        else
        {
          v10 = (void *)objc_claimAutoreleasedReturnValue(-[BKLibraryBookshelfSupplementaryDataSource collection](self, "collection"));
          v11 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v10, "details"));

          if (!v11)
          {
            v13 = 0;
            goto LABEL_15;
          }
        }
        if (!objc_msgSend(v14, "length"))
        {

          v14 = 0;
        }
        v12 = (void *)objc_claimAutoreleasedReturnValue(-[BKLibraryBookshelfSupplementaryDataSource collection](self, "collection"));
        objc_msgSend(v12, "setDetails:", v14);

        v6 = (void *)objc_claimAutoreleasedReturnValue(+[BKLibraryManager defaultManager](BKLibraryManager, "defaultManager"));
        v7 = (void *)objc_claimAutoreleasedReturnValue(-[BKLibraryBookshelfSupplementaryDataSource collection](self, "collection"));
        v8 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v7, "managedObjectContext"));
        objc_msgSend(v6, "saveManagedObjectContext:", v8);
      }

    }
  }
  v13 = v14;
LABEL_15:

}

- (NSString)sortButtonTitle
{
  void *v3;
  void *v4;
  void *v5;

  v3 = (void *)objc_claimAutoreleasedReturnValue(-[BKLibraryBookshelfSupplementaryDataSource sortControlConfig](self, "sortControlConfig"));
  v4 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v3, "objectAtIndexedSubscript:", -[BKLibraryBookshelfSupplementaryDataSource selectedSortIndex](self, "selectedSortIndex")));
  v5 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v4, "title"));

  return (NSString *)v5;
}

- (NSString)sortByLabelText
{
  void *v3;
  void *v4;
  void *v5;

  v3 = (void *)objc_claimAutoreleasedReturnValue(-[BKLibraryBookshelfSupplementaryDataSource sortControlConfig](self, "sortControlConfig"));
  v4 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v3, "objectAtIndexedSubscript:", -[BKLibraryBookshelfSupplementaryDataSource selectedSortIndex](self, "selectedSortIndex")));
  v5 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v4, "label"));

  return (NSString *)v5;
}

- (BKLibrarySortByMode)currentSortMode
{
  void *v3;
  void *v4;

  v3 = (void *)objc_claimAutoreleasedReturnValue(-[BKLibraryBookshelfSupplementaryDataSource sortControlConfig](self, "sortControlConfig"));
  v4 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v3, "objectAtIndexedSubscript:", -[BKLibraryBookshelfSupplementaryDataSource selectedSortIndex](self, "selectedSortIndex")));

  return (BKLibrarySortByMode *)v4;
}

- (int64_t)selectedSortIndex
{
  unint64_t v3;
  void *v4;
  id v5;
  _QWORD v7[5];

  v3 = -[BKLibraryBookshelfSupplementaryDataSource sortMode](self, "sortMode");
  v4 = (void *)objc_claimAutoreleasedReturnValue(-[BKLibraryBookshelfSupplementaryDataSource sortControlConfig](self, "sortControlConfig"));
  v7[0] = _NSConcreteStackBlock;
  v7[1] = 3221225472;
  v7[2] = sub_100174C08;
  v7[3] = &unk_1008ED0A0;
  v7[4] = v3;
  v5 = objc_msgSend(v4, "indexOfObjectPassingTest:", v7);

  if (v5 == (id)0x7FFFFFFFFFFFFFFFLL)
    return 0;
  else
    return (int64_t)v5;
}

- (id)stringFromSectionData:(id)a3
{
  id v3;
  uint64_t v4;
  id v5;
  void *v6;

  v3 = a3;
  v4 = objc_opt_class(NSString);
  if ((objc_opt_isKindOfClass(v3, v4) & 1) != 0)
  {
    v5 = v3;
  }
  else
  {
    v6 = (void *)objc_claimAutoreleasedReturnValue(+[NSBundle mainBundle](NSBundle, "mainBundle"));
    v5 = (id)objc_claimAutoreleasedReturnValue(objc_msgSend(v6, "localizedStringForKey:value:table:", CFSTR("Unknown"), &stru_10091C438, 0));

  }
  return v5;
}

- (NSString)moreButtonAccessibilityLabel
{
  NSString *moreButtonAccessibilityLabel;
  void *v4;
  NSString *v5;
  NSString *v6;

  moreButtonAccessibilityLabel = self->_moreButtonAccessibilityLabel;
  if (!moreButtonAccessibilityLabel)
  {
    v4 = (void *)objc_claimAutoreleasedReturnValue(+[NSBundle mainBundle](NSBundle, "mainBundle"));
    v5 = (NSString *)objc_claimAutoreleasedReturnValue(objc_msgSend(v4, "localizedStringForKey:value:table:", CFSTR("More Actions"), &stru_10091C438, 0));
    v6 = self->_moreButtonAccessibilityLabel;
    self->_moreButtonAccessibilityLabel = v5;

    moreButtonAccessibilityLabel = self->_moreButtonAccessibilityLabel;
  }
  return moreButtonAccessibilityLabel;
}

- (NSString)starRatingCountLabel
{
  NSString *starRatingCountLabel;
  void *v4;
  NSString *v5;
  NSString *v6;

  starRatingCountLabel = self->_starRatingCountLabel;
  if (!starRatingCountLabel)
  {
    v4 = (void *)objc_claimAutoreleasedReturnValue(+[NSBundle mainBundle](NSBundle, "mainBundle"));
    v5 = (NSString *)objc_claimAutoreleasedReturnValue(objc_msgSend(v4, "localizedStringForKey:value:table:", CFSTR("(%lu)"), &stru_10091C438, 0));
    v6 = self->_starRatingCountLabel;
    self->_starRatingCountLabel = v5;

    starRatingCountLabel = self->_starRatingCountLabel;
  }
  return starRatingCountLabel;
}

- (NSString)starRatingCountAccessibilityLabel
{
  NSString *starRatingCountAccessibilityLabel;
  void *v4;
  NSString *v5;
  NSString *v6;

  starRatingCountAccessibilityLabel = self->_starRatingCountAccessibilityLabel;
  if (!starRatingCountAccessibilityLabel)
  {
    v4 = (void *)objc_claimAutoreleasedReturnValue(+[NSBundle mainBundle](NSBundle, "mainBundle"));
    v5 = (NSString *)objc_claimAutoreleasedReturnValue(objc_msgSend(v4, "localizedStringForKey:value:table:", CFSTR("%lu rating(s)"), &stru_10091C438, 0));
    v6 = self->_starRatingCountAccessibilityLabel;
    self->_starRatingCountAccessibilityLabel = v5;

    starRatingCountAccessibilityLabel = self->_starRatingCountAccessibilityLabel;
  }
  return starRatingCountAccessibilityLabel;
}

- (void)account:(unint64_t)a3 didChangeWithReason:(unint64_t)a4
{
  _QWORD v4[4];
  id v5;
  id location;

  objc_initWeak(&location, self);
  v4[0] = _NSConcreteStackBlock;
  v4[1] = 3221225472;
  v4[2] = sub_100174E8C;
  v4[3] = &unk_1008E74C8;
  objc_copyWeak(&v5, &location);
  dispatch_async((dispatch_queue_t)&_dispatch_main_q, v4);
  objc_destroyWeak(&v5);
  objc_destroyWeak(&location);
}

- (NSString)collectionDescription
{
  return self->_collectionDescription;
}

- (NSString)collectionTitle
{
  return self->_collectionTitle;
}

- (NSString)collectionDescriptionPlaceHolder
{
  return self->_collectionDescriptionPlaceHolder;
}

- (void)setCollectionDescriptionPlaceHolder:(id)a3
{
  objc_setProperty_nonatomic_copy(self, a2, a3, 32);
}

- (NSString)seriesID
{
  return self->_seriesID;
}

- (void)setSeriesID:(id)a3
{
  objc_setProperty_nonatomic_copy(self, a2, a3, 40);
}

- (BOOL)hasSeriesSequenceLabel
{
  return self->_hasSeriesSequenceLabel;
}

- (void)setHasSeriesSequenceLabel:(BOOL)a3
{
  self->_hasSeriesSequenceLabel = a3;
}

- (NSString)readingListButtonText
{
  return self->_readingListButtonText;
}

- (void)setReadingListButtonText:(id)a3
{
  objc_setProperty_nonatomic_copy(self, a2, a3, 48);
}

- (NSString)noBooksDescriptionHeader
{
  return self->_noBooksDescriptionHeader;
}

- (void)setNoBooksDescriptionHeader:(id)a3
{
  objc_setProperty_nonatomic_copy(self, a2, a3, 56);
}

- (NSString)noBooksDescription
{
  return self->_noBooksDescription;
}

- (void)setNoBooksDescription:(id)a3
{
  objc_setProperty_nonatomic_copy(self, a2, a3, 64);
}

- (NSString)cloudDownloadImageName
{
  return self->_cloudDownloadImageName;
}

- (void)setCloudDownloadImageName:(id)a3
{
  objc_setProperty_nonatomic_copy(self, a2, a3, 72);
}

- (NSString)cloudUploadingImageName
{
  return self->_cloudUploadingImageName;
}

- (void)setCloudUploadingImageName:(id)a3
{
  objc_setProperty_nonatomic_copy(self, a2, a3, 80);
}

- (NSString)cloudErrorImageName
{
  return self->_cloudErrorImageName;
}

- (void)setCloudErrorImageName:(id)a3
{
  objc_setProperty_nonatomic_copy(self, a2, a3, 88);
}

- (NSString)actionMenuImageName
{
  return self->_actionMenuImageName;
}

- (void)setActionMenuImageName:(id)a3
{
  objc_setProperty_nonatomic_copy(self, a2, a3, 96);
}

- (NSString)dragBarName
{
  return self->_dragBarName;
}

- (void)setDragBarName:(id)a3
{
  objc_setProperty_nonatomic_copy(self, a2, a3, 104);
}

- (NSString)reviewBackgroundName
{
  return self->_reviewBackgroundName;
}

- (void)setReviewBackgroundName:(id)a3
{
  objc_setProperty_nonatomic_copy(self, a2, a3, 112);
}

- (NSString)selectedCheckmarkName
{
  return self->_selectedCheckmarkName;
}

- (void)setSelectedCheckmarkName:(id)a3
{
  objc_setProperty_nonatomic_copy(self, a2, a3, 120);
}

- (NSString)unselectedCheckmarkName
{
  return self->_unselectedCheckmarkName;
}

- (void)setUnselectedCheckmarkName:(id)a3
{
  objc_setProperty_nonatomic_copy(self, a2, a3, 128);
}

- (NSString)infoBarDownloading
{
  return self->_infoBarDownloading;
}

- (void)setInfoBarDownloading:(id)a3
{
  objc_setProperty_nonatomic_copy(self, a2, a3, 136);
}

- (NSString)infoBarDownloadWaiting
{
  return self->_infoBarDownloadWaiting;
}

- (void)setInfoBarDownloadWaiting:(id)a3
{
  objc_setProperty_nonatomic_copy(self, a2, a3, 144);
}

- (NSString)infoBarDownloadPaused
{
  return self->_infoBarDownloadPaused;
}

- (void)setInfoBarDownloadPaused:(id)a3
{
  objc_setProperty_nonatomic_copy(self, a2, a3, 152);
}

- (NSString)infoBarNew
{
  return self->_infoBarNew;
}

- (void)setInfoBarNew:(id)a3
{
  objc_setProperty_nonatomic_copy(self, a2, a3, 160);
}

- (NSString)infoBarNext
{
  return self->_infoBarNext;
}

- (void)setInfoBarNext:(id)a3
{
  objc_setProperty_nonatomic_copy(self, a2, a3, 168);
}

- (NSString)infoBarProof
{
  return self->_infoBarProof;
}

- (void)setInfoBarProof:(id)a3
{
  objc_setProperty_nonatomic_copy(self, a2, a3, 176);
}

- (NSString)infoBarPreOrderable
{
  return self->_infoBarPreOrderable;
}

- (void)setInfoBarPreOrderable:(id)a3
{
  objc_setProperty_nonatomic_copy(self, a2, a3, 184);
}

- (NSString)infoBarPreOrdered
{
  return self->_infoBarPreOrdered;
}

- (void)setInfoBarPreOrdered:(id)a3
{
  objc_setProperty_nonatomic_copy(self, a2, a3, 192);
}

- (NSString)infoBarSample
{
  return self->_infoBarSample;
}

- (void)setInfoBarSample:(id)a3
{
  objc_setProperty_nonatomic_copy(self, a2, a3, 200);
}

- (NSString)infoBarBuy
{
  return self->_infoBarBuy;
}

- (void)setInfoBarBuy:(id)a3
{
  objc_setProperty_nonatomic_copy(self, a2, a3, 208);
}

- (NSString)infoExpectedDateString
{
  return self->_infoExpectedDateString;
}

- (void)setInfoExpectedDateString:(id)a3
{
  objc_setProperty_nonatomic_copy(self, a2, a3, 216);
}

- (NSString)moreText
{
  return self->_moreText;
}

- (void)setMoreText:(id)a3
{
  objc_setProperty_nonatomic_copy(self, a2, a3, 224);
}

- (void)setMoreButtonAccessibilityLabel:(id)a3
{
  objc_setProperty_nonatomic_copy(self, a2, a3, 232);
}

- (void)setStarRatingCountLabel:(id)a3
{
  objc_setProperty_nonatomic_copy(self, a2, a3, 240);
}

- (void)setStarRatingCountAccessibilityLabel:(id)a3
{
  objc_setProperty_nonatomic_copy(self, a2, a3, 248);
}

- (NSNumber)currentStoreAccountID
{
  return self->_currentStoreAccountID;
}

- (void)setCurrentStoreAccountID:(id)a3
{
  objc_storeStrong((id *)&self->_currentStoreAccountID, a3);
}

- (BKCollection)collection
{
  return self->_collection;
}

- (void)setCollection:(id)a3
{
  objc_storeStrong((id *)&self->_collection, a3);
}

- (NSString)infoBarAudiobookImageName
{
  return self->_infoBarAudiobookImageName;
}

- (void)setInfoBarAudiobookImageName:(id)a3
{
  objc_setProperty_nonatomic_copy(self, a2, a3, 272);
}

- (BOOL)hideTopSeparatorLine
{
  return self->_hideTopSeparatorLine;
}

- (void)setHideTopSeparatorLine:(BOOL)a3
{
  self->_hideTopSeparatorLine = a3;
}

- (BOOL)supplementalContentPDFPicker
{
  return self->_supplementalContentPDFPicker;
}

- (void)setSupplementalContentPDFPicker:(BOOL)a3
{
  self->_supplementalContentPDFPicker = a3;
}

- (BOOL)showCancelNavigationBarItem
{
  return self->_showCancelNavigationBarItem;
}

- (void)setShowCancelNavigationBarItem:(BOOL)a3
{
  self->_showCancelNavigationBarItem = a3;
}

- (NSString)supplementalContentPDFPickerTitle
{
  return self->_supplementalContentPDFPickerTitle;
}

- (void)setSupplementalContentPDFPickerTitle:(id)a3
{
  objc_setProperty_nonatomic_copy(self, a2, a3, 280);
}

- (NSString)supplementalContentStorePlaylistID
{
  return self->_supplementalContentStorePlaylistID;
}

- (void)setSupplementalContentStorePlaylistID:(id)a3
{
  objc_setProperty_nonatomic_copy(self, a2, a3, 288);
}

- (BOOL)fromActionMenu
{
  return self->_fromActionMenu;
}

- (void)setFromActionMenu:(BOOL)a3
{
  self->_fromActionMenu = a3;
}

- (NSArray)sortControlConfig
{
  return self->_sortControlConfig;
}

- (void)setSortControlConfig:(id)a3
{
  objc_setProperty_nonatomic_copy(self, a2, a3, 296);
}

- (unint64_t)sortMode
{
  return self->_sortMode;
}

- (void)setSortMode:(unint64_t)a3
{
  self->_sortMode = a3;
}

- (unint64_t)viewMode
{
  return self->_viewMode;
}

- (void)setViewMode:(unint64_t)a3
{
  self->_viewMode = a3;
}

- (BOOL)canChangeViewMode
{
  return self->_canChangeViewMode;
}

- (void)setCanChangeViewMode:(BOOL)a3
{
  self->_canChangeViewMode = a3;
}

- (BOOL)isInDragSession
{
  return self->_isInDragSession;
}

- (void)setIsInDragSession:(BOOL)a3
{
  self->_isInDragSession = a3;
}

- (NSMutableDictionary)templateCloudImages
{
  return self->_templateCloudImages;
}

- (void)setTemplateCloudImages:(id)a3
{
  objc_storeStrong((id *)&self->_templateCloudImages, a3);
}

- (UIColor)actionMenuImageTintColor
{
  return self->_actionMenuImageTintColor;
}

- (void)setActionMenuImageTintColor:(id)a3
{
  objc_storeStrong((id *)&self->_actionMenuImageTintColor, a3);
}

- (UIImage)actionMenuImageWithTintColor
{
  return self->_actionMenuImageWithTintColor;
}

- (void)setActionMenuImageWithTintColor:(id)a3
{
  objc_storeStrong((id *)&self->_actionMenuImageWithTintColor, a3);
}

- (UIColor)infoBarAudiobookImageTintColor
{
  return self->_infoBarAudiobookImageTintColor;
}

- (void)setInfoBarAudiobookImageTintColor:(id)a3
{
  objc_storeStrong((id *)&self->_infoBarAudiobookImageTintColor, a3);
}

- (UIImage)infoBarAudiobookImageWithTintColor
{
  return self->_infoBarAudiobookImageWithTintColor;
}

- (void)setInfoBarAudiobookImageWithTintColor:(id)a3
{
  objc_storeStrong((id *)&self->_infoBarAudiobookImageWithTintColor, a3);
}

- (UIColor)dragBarTintColor
{
  return self->_dragBarTintColor;
}

- (void)setDragBarTintColor:(id)a3
{
  objc_storeStrong((id *)&self->_dragBarTintColor, a3);
}

- (UIImage)dragBarImage
{
  return self->_dragBarImage;
}

- (void)setDragBarImage:(id)a3
{
  objc_storeStrong((id *)&self->_dragBarImage, a3);
}

- (UIImage)selectedCheckmarkImage
{
  return self->_selectedCheckmarkImage;
}

- (void)setSelectedCheckmarkImage:(id)a3
{
  objc_storeStrong((id *)&self->_selectedCheckmarkImage, a3);
}

- (UIImage)unselectedCheckmarkImage
{
  return self->_unselectedCheckmarkImage;
}

- (void)setUnselectedCheckmarkImage:(id)a3
{
  objc_storeStrong((id *)&self->_unselectedCheckmarkImage, a3);
}

- (int64_t)storeStatus
{
  return self->_storeStatus;
}

- (void)setStoreStatus:(int64_t)a3
{
  self->_storeStatus = a3;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_unselectedCheckmarkImage, 0);
  objc_storeStrong((id *)&self->_selectedCheckmarkImage, 0);
  objc_storeStrong((id *)&self->_dragBarImage, 0);
  objc_storeStrong((id *)&self->_dragBarTintColor, 0);
  objc_storeStrong((id *)&self->_infoBarAudiobookImageWithTintColor, 0);
  objc_storeStrong((id *)&self->_infoBarAudiobookImageTintColor, 0);
  objc_storeStrong((id *)&self->_actionMenuImageWithTintColor, 0);
  objc_storeStrong((id *)&self->_actionMenuImageTintColor, 0);
  objc_storeStrong((id *)&self->_templateCloudImages, 0);
  objc_storeStrong((id *)&self->_sortControlConfig, 0);
  objc_storeStrong((id *)&self->_supplementalContentStorePlaylistID, 0);
  objc_storeStrong((id *)&self->_supplementalContentPDFPickerTitle, 0);
  objc_storeStrong((id *)&self->_infoBarAudiobookImageName, 0);
  objc_storeStrong((id *)&self->_collection, 0);
  objc_storeStrong((id *)&self->_currentStoreAccountID, 0);
  objc_storeStrong((id *)&self->_starRatingCountAccessibilityLabel, 0);
  objc_storeStrong((id *)&self->_starRatingCountLabel, 0);
  objc_storeStrong((id *)&self->_moreButtonAccessibilityLabel, 0);
  objc_storeStrong((id *)&self->_moreText, 0);
  objc_storeStrong((id *)&self->_infoExpectedDateString, 0);
  objc_storeStrong((id *)&self->_infoBarBuy, 0);
  objc_storeStrong((id *)&self->_infoBarSample, 0);
  objc_storeStrong((id *)&self->_infoBarPreOrdered, 0);
  objc_storeStrong((id *)&self->_infoBarPreOrderable, 0);
  objc_storeStrong((id *)&self->_infoBarProof, 0);
  objc_storeStrong((id *)&self->_infoBarNext, 0);
  objc_storeStrong((id *)&self->_infoBarNew, 0);
  objc_storeStrong((id *)&self->_infoBarDownloadPaused, 0);
  objc_storeStrong((id *)&self->_infoBarDownloadWaiting, 0);
  objc_storeStrong((id *)&self->_infoBarDownloading, 0);
  objc_storeStrong((id *)&self->_unselectedCheckmarkName, 0);
  objc_storeStrong((id *)&self->_selectedCheckmarkName, 0);
  objc_storeStrong((id *)&self->_reviewBackgroundName, 0);
  objc_storeStrong((id *)&self->_dragBarName, 0);
  objc_storeStrong((id *)&self->_actionMenuImageName, 0);
  objc_storeStrong((id *)&self->_cloudErrorImageName, 0);
  objc_storeStrong((id *)&self->_cloudUploadingImageName, 0);
  objc_storeStrong((id *)&self->_cloudDownloadImageName, 0);
  objc_storeStrong((id *)&self->_noBooksDescription, 0);
  objc_storeStrong((id *)&self->_noBooksDescriptionHeader, 0);
  objc_storeStrong((id *)&self->_readingListButtonText, 0);
  objc_storeStrong((id *)&self->_seriesID, 0);
  objc_storeStrong((id *)&self->_collectionDescriptionPlaceHolder, 0);
  objc_storeStrong((id *)&self->_collectionTitle, 0);
  objc_storeStrong((id *)&self->_collectionDescription, 0);
}

@end
