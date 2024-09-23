@implementation TravelPreferencesDataSource

+ (void)registerCellsInCollectionView:(id)a3
{
  id v3;
  uint64_t v4;
  uint64_t v5;
  objc_class *v6;
  NSString *v7;
  void *v8;
  uint64_t v9;
  uint64_t v10;
  objc_class *v11;
  NSString *v12;
  void *v13;
  uint64_t v14;
  objc_class *v15;
  NSString *v16;
  void *v17;
  objc_super v18;

  v18.receiver = a1;
  v18.super_class = (Class)&OBJC_METACLASS___TravelPreferencesDataSource;
  v3 = a3;
  objc_msgSendSuper2(&v18, "registerCellsInCollectionView:", v3);
  v4 = objc_opt_class(UserProfilePreferencesHeaderView);
  v5 = _UICollectionViewListLayoutElementKindSectionHeader;
  v6 = (objc_class *)objc_opt_class(UserProfilePreferencesHeaderView);
  v7 = NSStringFromClass(v6);
  v8 = (void *)objc_claimAutoreleasedReturnValue(v7);
  objc_msgSend(v3, "registerClass:forSupplementaryViewOfKind:withReuseIdentifier:", v4, v5, v8, v18.receiver, v18.super_class);

  v9 = objc_opt_class(UserProfilePreferencesHeaderView);
  v10 = _UICollectionViewListLayoutElementKindSectionFooter;
  v11 = (objc_class *)objc_opt_class(UserProfilePreferencesHeaderView);
  v12 = NSStringFromClass(v11);
  v13 = (void *)objc_claimAutoreleasedReturnValue(v12);
  objc_msgSend(v3, "registerClass:forSupplementaryViewOfKind:withReuseIdentifier:", v9, v10, v13);

  v14 = objc_opt_class(UserProfileSectionFooterView);
  v15 = (objc_class *)objc_opt_class(UserProfileSectionFooterView);
  v16 = NSStringFromClass(v15);
  v17 = (void *)objc_claimAutoreleasedReturnValue(v16);
  objc_msgSend(v3, "registerClass:forSupplementaryViewOfKind:withReuseIdentifier:", v14, UICollectionElementKindSectionFooter, v17);

}

- (TravelPreferencesDataSource)init
{
  TravelPreferencesDataSource *v2;
  uint64_t v3;
  TravelPreferencesDataSource *v4;
  id IsEnabled_SydneyARP;
  int IsEnabled_LagunaBeach;
  objc_super v8;

  v8.receiver = self;
  v8.super_class = (Class)TravelPreferencesDataSource;
  v2 = -[TravelPreferencesDataSource init](&v8, "init");
  v4 = v2;
  if (v2)
  {
    IsEnabled_SydneyARP = (id)MapsFeature_IsEnabled_SydneyARP(v2, v3);
    if ((_DWORD)IsEnabled_SydneyARP)
      IsEnabled_SydneyARP = -[TravelPreferencesDataSource fetchPhotoCreditPreferences](v4, "fetchPhotoCreditPreferences");
    IsEnabled_LagunaBeach = MapsFeature_IsEnabled_LagunaBeach(IsEnabled_SydneyARP);
    if (IsEnabled_LagunaBeach)
      LOBYTE(IsEnabled_LagunaBeach) = GEODoesUserHaveValidAccountForMakingContributions();
    v4->_lagunaBeachSupported = IsEnabled_LagunaBeach;
  }
  return v4;
}

- (void)dealloc
{
  void *v3;
  objc_super v4;

  if (self->_countryObserver)
  {
    v3 = (void *)objc_claimAutoreleasedReturnValue(+[NSNotificationCenter defaultCenter](NSNotificationCenter, "defaultCenter"));
    objc_msgSend(v3, "removeObserver:", self->_countryObserver);

  }
  v4.receiver = self;
  v4.super_class = (Class)TravelPreferencesDataSource;
  -[TravelPreferencesDataSource dealloc](&v4, "dealloc");
}

- (void)fetchPhotoCreditPreferences
{
  void *v2;
  _QWORD v3[4];
  id v4;
  id location;

  objc_initWeak(&location, self);
  v2 = (void *)objc_claimAutoreleasedReturnValue(+[UGCPhotoAttributionPreferencesManager sharedManager](UGCPhotoAttributionPreferencesManager, "sharedManager"));
  v3[0] = _NSConcreteStackBlock;
  v3[1] = 3221225472;
  v3[2] = sub_1003EDFA4;
  v3[3] = &unk_1011AE090;
  objc_copyWeak(&v4, &location);
  objc_msgSend(v2, "photoAttributionPreferencesWithCompletion:", v3);

  objc_destroyWeak(&v4);
  objc_destroyWeak(&location);
}

- (void)updatePhotoCreditPreferencesWithCompletion:(id)a3
{
  id v4;
  void (**v5)(_QWORD, _QWORD);
  uint64_t v6;
  void *v7;
  void *v9;
  _BOOL8 photoCredit;
  NSString *photoCreditName;
  _QWORD v12[4];
  void (**v13)(_QWORD, _QWORD);

  v4 = a3;
  v5 = (void (**)(_QWORD, _QWORD))v4;
  if (self->_didChangeAttributionPreferences)
  {
    v6 = objc_claimAutoreleasedReturnValue(-[TravelPreferencesDataSource _photoCreditNameValidationErrorMessage](self, "_photoCreditNameValidationErrorMessage"));
    v7 = (void *)v6;
    if (!self->_photoCredit || v6 == 0)
    {
      v9 = (void *)objc_claimAutoreleasedReturnValue(+[UGCPhotoAttributionPreferencesManager sharedManager](UGCPhotoAttributionPreferencesManager, "sharedManager"));
      photoCredit = self->_photoCredit;
      photoCreditName = self->_photoCreditName;
      v12[0] = _NSConcreteStackBlock;
      v12[1] = 3221225472;
      v12[2] = sub_1003EE234;
      v12[3] = &unk_1011B4AC8;
      v13 = v5;
      objc_msgSend(v9, "updatePhotoAttributionPreferencesAttributePhotos:attributionName:completion:", photoCredit, photoCreditName, v12);

    }
    else
    {
      v5[2](v5, v6);
    }

  }
  else
  {
    (*((void (**)(id, _QWORD))v4 + 2))(v4, 0);
  }

}

- (id)_photoCreditNameValidationErrorMessage
{
  unint64_t Integer;
  unint64_t v4;
  void *v5;
  void *v6;
  void *v7;
  void *v8;
  void *v9;
  void *v10;
  void *v11;

  if (-[NSString length](self->_photoCreditName, "length"))
  {
    Integer = GEOConfigGetInteger(MapsConfig_UGCPhotoCreditNicknameMinimumLength, off_1014B4998);
    v4 = GEOConfigGetInteger(MapsConfig_UGCPhotoCreditNicknameMaximumLength, off_1014B49A8);
    if (-[NSString length](self->_photoCreditName, "length") >= Integer
      && -[NSString length](self->_photoCreditName, "length") <= v4)
    {
      v11 = 0;
      return v11;
    }
    v5 = (void *)objc_claimAutoreleasedReturnValue(+[NSNumber numberWithInteger:](NSNumber, "numberWithInteger:", Integer));
    v6 = (void *)objc_claimAutoreleasedReturnValue(+[NSNumberFormatter localizedStringFromNumber:numberStyle:](NSNumberFormatter, "localizedStringFromNumber:numberStyle:", v5, 0));

    v7 = (void *)objc_claimAutoreleasedReturnValue(+[NSNumber numberWithInteger:](NSNumber, "numberWithInteger:", v4));
    v8 = (void *)objc_claimAutoreleasedReturnValue(+[NSNumberFormatter localizedStringFromNumber:numberStyle:](NSNumberFormatter, "localizedStringFromNumber:numberStyle:", v7, 0));

    v9 = (void *)objc_claimAutoreleasedReturnValue(+[NSBundle mainBundle](NSBundle, "mainBundle"));
    v10 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v9, "localizedStringForKey:value:table:", CFSTR("[Photo Credit] Photo Credit name too short or long"), CFSTR("localized string not found"), 0));

    v11 = (void *)objc_claimAutoreleasedReturnValue(+[NSString stringWithFormat:](NSString, "stringWithFormat:", v10, v6, v8));
  }
  else
  {
    v6 = (void *)objc_claimAutoreleasedReturnValue(+[NSBundle mainBundle](NSBundle, "mainBundle"));
    v11 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v6, "localizedStringForKey:value:table:", CFSTR("[Photo Credit] Photo Credit no nickname included error"), CFSTR("localized string not found"), 0));
  }

  return v11;
}

- (void)loadPreferences
{
  GEOCyclingUserPreferences *v3;
  GEOCyclingUserPreferences *cyclingPreferences;
  TransitPreferences *v5;
  void *v6;
  TransitPreferences *v7;
  TransitPreferencesViewControllerDataSource *v8;
  TransitPreferencesViewControllerDataSource *transitDataSource;
  void *v10;
  _QWORD v11[5];

  v3 = (GEOCyclingUserPreferences *)objc_alloc_init((Class)GEOCyclingUserPreferences);
  cyclingPreferences = self->_cyclingPreferences;
  self->_cyclingPreferences = v3;

  v5 = [TransitPreferences alloc];
  v6 = (void *)objc_claimAutoreleasedReturnValue(+[NSUserDefaults standardUserDefaults](NSUserDefaults, "standardUserDefaults"));
  v7 = -[WatchSyncedPreferences initWithDefaults:](v5, "initWithDefaults:", v6);

  v8 = -[TransitPreferencesViewControllerDataSource initWithPreferences:displayHints:]([TransitPreferencesViewControllerDataSource alloc], "initWithPreferences:displayHints:", v7, 0);
  transitDataSource = self->_transitDataSource;
  self->_transitDataSource = v8;

  v10 = (void *)objc_claimAutoreleasedReturnValue(+[UNUserNotificationCenter currentNotificationCenter](UNUserNotificationCenter, "currentNotificationCenter"));
  v11[0] = _NSConcreteStackBlock;
  v11[1] = 3221225472;
  v11[2] = sub_1003EE678;
  v11[3] = &unk_1011B4AF0;
  v11[4] = self;
  objc_msgSend(v10, "getNotificationSettingsWithCompletionHandler:", v11);

}

- (TransitPreferences)transitPreferences
{
  return (TransitPreferences *)-[TransitPreferencesViewControllerDataSource preferences](self->_transitDataSource, "preferences");
}

- (void)prepareContent
{
  NSMutableArray *v3;
  void *v4;
  void *v5;
  void *v6;
  void *v7;
  void *v8;
  uint64_t v9;
  NSObject *v10;
  NSObject *countryObserver;
  void *v12;
  void *v13;
  id v14;
  void *v15;
  uint64_t v16;
  uint64_t v17;
  char *v18;
  char *v19;
  id v20;
  void *v21;
  void *v22;
  MapsDebugTableSection *v23;
  void *v24;
  id v25;
  void *v26;
  id v27;
  NSMutableArray *v28;
  _QWORD v29[5];
  _QWORD v30[5];
  id v31;
  _QWORD v32[4];
  id v33;
  id v34[3];
  _QWORD v35[4];
  id v36;
  _QWORD v37[4];
  NSMutableArray *v38;
  id location;
  objc_super v40;

  v40.receiver = self;
  v40.super_class = (Class)TravelPreferencesDataSource;
  -[PreferenceValuesDataSource prepareContent](&v40, "prepareContent");
  objc_initWeak(&location, self);
  v3 = objc_opt_new(NSMutableArray);
  -[NSMutableArray addObject:](v3, "addObject:", &off_10126D120);
  -[NSMutableArray addObject:](v3, "addObject:", &off_10126D138);
  -[NSMutableArray addObject:](v3, "addObject:", &off_10126D150);
  -[NSMutableArray addObject:](v3, "addObject:", &off_10126D168);
  v4 = (void *)objc_claimAutoreleasedReturnValue(-[TravelPreferencesDataSource _directionsSectionTitle](self, "_directionsSectionTitle"));
  v37[0] = _NSConcreteStackBlock;
  v37[1] = 3221225472;
  v37[2] = sub_1003EEBE4;
  v37[3] = &unk_1011B4BC0;
  v28 = v3;
  v38 = v28;
  -[PreferenceValuesDataSource addSectionWithTitle:content:](self, "addSectionWithTitle:content:", v4, v37);

  v5 = (void *)objc_claimAutoreleasedReturnValue(-[TravelPreferencesDataSource _drivingSectionTitle](self, "_drivingSectionTitle"));
  -[PreferenceValuesDataSource addSectionWithTitle:content:](self, "addSectionWithTitle:content:", v5, &stru_1011B4BE0);

  v6 = (void *)objc_claimAutoreleasedReturnValue(-[TravelPreferencesDataSource _walkingSectionTitle](self, "_walkingSectionTitle"));
  -[PreferenceValuesDataSource addSectionWithTitle:content:](self, "addSectionWithTitle:content:", v6, &stru_1011B4C80);

  if (!self->_countryObserver)
  {
    v7 = (void *)objc_claimAutoreleasedReturnValue(+[NSNotificationCenter defaultCenter](NSNotificationCenter, "defaultCenter"));
    v8 = (void *)objc_claimAutoreleasedReturnValue(+[NSOperationQueue mainQueue](NSOperationQueue, "mainQueue"));
    v9 = GEOCountryConfigurationCountryCodeDidChangeNotification;
    v35[0] = _NSConcreteStackBlock;
    v35[1] = 3221225472;
    v35[2] = sub_1003EF4B0;
    v35[3] = &unk_1011AD288;
    objc_copyWeak(&v36, &location);
    v10 = objc_claimAutoreleasedReturnValue(objc_msgSend(v7, "addObserverForName:object:queue:usingBlock:", v9, 0, v8, v35));
    countryObserver = self->_countryObserver;
    self->_countryObserver = v10;

    objc_destroyWeak(&v36);
  }
  if (sub_1003C76E0())
  {
    v12 = (void *)objc_claimAutoreleasedReturnValue(-[TravelPreferencesDataSource _ebikeSectionTitle](self, "_ebikeSectionTitle"));
    -[PreferenceValuesDataSource addSectionWithTitle:content:](self, "addSectionWithTitle:content:", v12, &stru_1011B4D60);

  }
  if (sub_1003C7758())
  {
    v13 = (void *)objc_claimAutoreleasedReturnValue(-[TravelPreferencesDataSource _cyclingSectionTitle](self, "_cyclingSectionTitle"));
    -[PreferenceValuesDataSource addSectionWithTitle:content:](self, "addSectionWithTitle:content:", v13, &stru_1011B4DC0);

  }
  v14 = objc_loadWeakRetained(&location);
  v15 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v14, "transitDataSource"));

  v16 = (uint64_t)objc_msgSend(v15, "numberOfSections");
  v18 = (char *)v16;
  if (v16 >= 1)
  {
    v19 = 0;
    do
    {
      v20 = objc_msgSend(v15, "numberOfRowsInSection:", v19);
      v21 = (void *)objc_claimAutoreleasedReturnValue(-[TravelPreferencesDataSource _transitSectionTitle](self, "_transitSectionTitle"));
      v32[0] = _NSConcreteStackBlock;
      v32[1] = 3221225472;
      v32[2] = sub_1003EF830;
      v32[3] = &unk_1011B4EE0;
      v34[1] = v20;
      v33 = v15;
      v34[2] = v19;
      objc_copyWeak(v34, &location);
      -[PreferenceValuesDataSource addSectionWithTitle:content:](self, "addSectionWithTitle:content:", v21, v32);

      objc_destroyWeak(v34);
      ++v19;
    }
    while (v18 != v19);
  }
  if (MapsFeature_IsEnabled_SydneyARP(v16, v17) && self->_lagunaBeachSupported)
  {
    v22 = (void *)objc_claimAutoreleasedReturnValue(-[TravelPreferencesDataSource _photoCreditSectionTitle](self, "_photoCreditSectionTitle"));
    v30[0] = _NSConcreteStackBlock;
    v30[1] = 3221225472;
    v30[2] = sub_1003EFD74;
    v30[3] = &unk_1011B4F90;
    objc_copyWeak(&v31, &location);
    v30[4] = self;
    -[PreferenceValuesDataSource addSectionWithTitle:content:](self, "addSectionWithTitle:content:", v22, v30);

    objc_destroyWeak(&v31);
  }
  v23 = objc_alloc_init(MapsDebugTableSection);
  v24 = (void *)objc_claimAutoreleasedReturnValue(-[TravelPreferencesDataSource _settingsRowTitle](self, "_settingsRowTitle"));
  v25 = -[MapsDebugTableSection addButtonRowWithTitle:action:](v23, "addButtonRowWithTitle:action:", v24, &stru_1011B4FB0);

  v26 = (void *)objc_claimAutoreleasedReturnValue(-[TravelPreferencesDataSource _notificationsRowTitle](self, "_notificationsRowTitle"));
  v29[0] = _NSConcreteStackBlock;
  v29[1] = 3221225472;
  v29[2] = sub_1003F0348;
  v29[3] = &unk_1011AC860;
  v29[4] = self;
  v27 = -[MapsDebugTableSection addButtonRowWithTitle:action:](v23, "addButtonRowWithTitle:action:", v26, v29);

  -[PreferenceValuesDataSource addSection:](self, "addSection:", v23);
  objc_destroyWeak(&location);
}

- (id)collectionView:(id)a3 viewForSupplementaryElementOfKind:(id)a4 atIndexPath:(id)a5
{
  id v8;
  id v9;
  id v10;
  uint64_t v11;
  id *v12;
  id *v13;
  id v14;
  id v15;
  _QWORD *v16;
  void *v17;
  void *v18;
  uint64_t v19;
  void *v20;
  id v21;
  id v22;
  _QWORD *v23;
  uint64_t v24;
  char *v25;
  void *v26;
  id v27;
  void *v28;
  void *v29;
  id v30;
  void *v31;
  void *v32;
  void *v33;
  id v34;
  id v35;
  uint64_t v36;
  uint64_t v37;
  void *v38;
  id v39;
  uint64_t v40;
  uint64_t v41;
  void *v43;
  id v44;
  _QWORD v45[4];
  id v46;
  _QWORD v47[2];
  _QWORD v48[4];
  id v49;
  id v50;
  id v51;
  _QWORD v52[2];
  _QWORD v53[2];

  v8 = a3;
  v9 = a4;
  v10 = a5;
  v11 = _UICollectionViewListLayoutElementKindSectionHeader;
  if (objc_msgSend(v9, "isEqualToString:", _UICollectionViewListLayoutElementKindSectionHeader))
  {
    v48[0] = _NSConcreteStackBlock;
    v48[1] = 3221225472;
    v48[2] = sub_1003F0930;
    v48[3] = &unk_1011B4FD8;
    v12 = &v49;
    v49 = v8;
    v13 = &v50;
    v14 = v9;
    v50 = v14;
    v15 = v10;
    v51 = v15;
    v16 = objc_retainBlock(v48);
    v17 = (void *)objc_claimAutoreleasedReturnValue(-[PreferenceValuesDataSource sectionAtIndexPath:](self, "sectionAtIndexPath:", v15));
    if (objc_msgSend(v14, "isEqualToString:", v11))
    {
      v18 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v17, "title"));
      v19 = ((uint64_t (*)(_QWORD *, void *, _QWORD))v16[2])(v16, v18, 0);
      v20 = (void *)objc_claimAutoreleasedReturnValue(v19);

    }
    else
    {
      v41 = ((uint64_t (*)(_QWORD *, _QWORD, _QWORD))v16[2])(v16, 0, 0);
      v20 = (void *)objc_claimAutoreleasedReturnValue(v41);
    }

  }
  else
  {
    v45[0] = _NSConcreteStackBlock;
    v45[1] = 3221225472;
    v45[2] = sub_1003F0A18;
    v45[3] = &unk_1011B5000;
    v12 = &v46;
    v21 = v8;
    v46 = v21;
    v22 = v10;
    v47[0] = v22;
    v47[1] = self;
    v23 = objc_retainBlock(v45);
    if (MapsFeature_IsEnabled_SydneyARP(v23, v24)
      && self->_lagunaBeachSupported
      && (v25 = (char *)objc_msgSend(v21, "numberOfSections") - 2, objc_msgSend(v22, "section") == v25))
    {
      v44 = objc_alloc_init((Class)NSMutableParagraphStyle);
      objc_msgSend(v44, "setLineBreakMode:", 0);
      v52[0] = NSParagraphStyleAttributeName;
      v52[1] = NSForegroundColorAttributeName;
      v53[0] = v44;
      v26 = (void *)objc_claimAutoreleasedReturnValue(+[UIColor secondaryLabelColor](UIColor, "secondaryLabelColor"));
      v53[1] = v26;
      v43 = (void *)objc_claimAutoreleasedReturnValue(+[NSDictionary dictionaryWithObjects:forKeys:count:](NSDictionary, "dictionaryWithObjects:forKeys:count:", v53, v52, 2));

      v27 = objc_alloc((Class)NSString);
      v28 = (void *)objc_claimAutoreleasedReturnValue(+[NSBundle mainBundle](NSBundle, "mainBundle"));
      v29 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v28, "localizedStringForKey:value:table:", CFSTR("[Travel Preferences] See how your data is managed…"), CFSTR("localized string not found"), 0));
      v30 = objc_msgSend(v27, "initWithString:", v29);

      v31 = (void *)objc_claimAutoreleasedReturnValue(+[NSBundle mainBundle](NSBundle, "mainBundle"));
      v32 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v31, "localizedStringForKey:value:table:", CFSTR("[Travel Preferences] Get public credit by a nickname you choose for all your photos on Maps. Changes may take a few days to apply. [Link]"), CFSTR("localized string not found"), 0));
      v33 = (void *)objc_claimAutoreleasedReturnValue(+[NSString stringWithFormat:](NSString, "stringWithFormat:", v32, v30));

      v34 = objc_msgSend(objc_alloc((Class)NSMutableAttributedString), "initWithString:attributes:", v33, v43);
      v35 = objc_msgSend(v33, "rangeOfString:", v30);
      v37 = v36;
      v38 = (void *)objc_claimAutoreleasedReturnValue(+[UIColor systemBlueColor](UIColor, "systemBlueColor"));
      v39 = v35;
      v12 = &v46;
      objc_msgSend(v34, "addAttribute:value:range:", NSForegroundColorAttributeName, v38, v39, v37);

    }
    else
    {
      v34 = 0;
    }
    v40 = ((uint64_t (*)(_QWORD *, id, _QWORD))v23[2])(v23, v34, 0);
    v20 = (void *)objc_claimAutoreleasedReturnValue(v40);

    v13 = (id *)v47;
  }

  return v20;
}

- (void)privacyTextTapped
{
  id v2;

  v2 = (id)objc_claimAutoreleasedReturnValue(-[TravelPreferencesDataSource privacyDelegate](self, "privacyDelegate"));
  objc_msgSend(v2, "didTapOnPrivacyText");

}

- (double)heightOfViewAtSection:(int64_t)a3 collectionView:(id)a4
{
  double v6;
  double v7;
  UserProfilePreferencesHeaderView *v8;
  void *v9;
  void *v10;
  void *v11;
  void *v12;
  void *v13;
  double height;
  void *v15;
  void *v16;
  void *v17;
  void *v18;
  void *v19;
  void *v20;
  double v21;
  double v22;
  double v23;
  double v24;

  objc_msgSend(a4, "frame");
  v7 = v6;
  v8 = -[UserProfilePreferencesHeaderView initWithFrame:]([UserProfilePreferencesHeaderView alloc], "initWithFrame:", CGRectZero.origin.x, CGRectZero.origin.y, CGRectZero.size.width, CGRectZero.size.height);
  v9 = (void *)objc_claimAutoreleasedReturnValue(-[TravelPreferencesDataSource _directionsSectionTitle](self, "_directionsSectionTitle"));
  v10 = (void *)objc_claimAutoreleasedReturnValue(-[TravelPreferencesDataSource _drivingSectionTitle](self, "_drivingSectionTitle"));
  v11 = (void *)objc_claimAutoreleasedReturnValue(-[TravelPreferencesDataSource _walkingSectionTitle](self, "_walkingSectionTitle"));
  v12 = (void *)objc_claimAutoreleasedReturnValue(+[NSMutableArray arrayWithObjects:](NSMutableArray, "arrayWithObjects:", v9, v10, v11, 0));

  if (sub_1003C76E0())
  {
    v13 = (void *)objc_claimAutoreleasedReturnValue(-[TravelPreferencesDataSource _ebikeSectionTitle](self, "_ebikeSectionTitle"));
    objc_msgSend(v12, "addObject:", v13);

  }
  height = UILayoutFittingExpandedSize.height;
  if (sub_1003C7758())
  {
    v15 = (void *)objc_claimAutoreleasedReturnValue(-[TravelPreferencesDataSource _cyclingSectionTitle](self, "_cyclingSectionTitle"));
    objc_msgSend(v12, "addObject:", v15);

  }
  v16 = (void *)objc_claimAutoreleasedReturnValue(-[TravelPreferencesDataSource _transitSectionTitle](self, "_transitSectionTitle"));
  objc_msgSend(v12, "addObject:", v16);

  v17 = (void *)objc_claimAutoreleasedReturnValue(-[TravelPreferencesDataSource _distancesSectionTitle](self, "_distancesSectionTitle"));
  objc_msgSend(v12, "addObject:", v17);

  v18 = (void *)objc_claimAutoreleasedReturnValue(-[TravelPreferencesDataSource _settingsRowTitle](self, "_settingsRowTitle"));
  objc_msgSend(v12, "addObject:", v18);

  v19 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v12, "objectAtIndexedSubscript:", a3));
  v20 = (void *)objc_claimAutoreleasedReturnValue(-[UserProfilePreferencesHeaderView textLabel](v8, "textLabel"));
  objc_msgSend(v20, "setText:", v19);

  LODWORD(v21) = 1148846080;
  LODWORD(v22) = 1132068864;
  -[UserProfilePreferencesHeaderView systemLayoutSizeFittingSize:withHorizontalFittingPriority:verticalFittingPriority:](v8, "systemLayoutSizeFittingSize:withHorizontalFittingPriority:verticalFittingPriority:", v7, height, v21, v22);
  v24 = v23;

  return v24;
}

- (id)collectionView:(id)a3 cellForItemAtIndexPath:(id)a4
{
  id v4;
  void *v5;
  void *v6;
  void *v7;
  objc_super v9;

  v9.receiver = self;
  v9.super_class = (Class)TravelPreferencesDataSource;
  v4 = -[PreferenceValuesDataSource collectionView:cellForItemAtIndexPath:](&v9, "collectionView:cellForItemAtIndexPath:", a3, a4);
  v5 = (void *)objc_claimAutoreleasedReturnValue(v4);
  v6 = (void *)objc_claimAutoreleasedReturnValue(+[UIBackgroundConfiguration listGroupedCellConfiguration](UIBackgroundConfiguration, "listGroupedCellConfiguration"));
  v7 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v6, "backgroundColor"));
  objc_msgSend(v5, "setBackgroundColor:", v7);

  return v5;
}

- (id)_directionsSectionTitle
{
  void *v2;
  void *v3;

  v2 = (void *)objc_claimAutoreleasedReturnValue(+[NSBundle mainBundle](NSBundle, "mainBundle"));
  v3 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v2, "localizedStringForKey:value:table:", CFSTR("[User Profile] Directions"), CFSTR("localized string not found"), 0));

  return v3;
}

- (id)_drivingSectionTitle
{
  void *v2;
  void *v3;

  v2 = (void *)objc_claimAutoreleasedReturnValue(+[NSBundle mainBundle](NSBundle, "mainBundle"));
  v3 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v2, "localizedStringForKey:value:table:", CFSTR("[User Profile] Driving"), CFSTR("localized string not found"), 0));

  return v3;
}

- (id)_walkingSectionTitle
{
  void *v2;
  void *v3;

  v2 = (void *)objc_claimAutoreleasedReturnValue(+[NSBundle mainBundle](NSBundle, "mainBundle"));
  v3 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v2, "localizedStringForKey:value:table:", CFSTR("[User Profile] Walking"), CFSTR("localized string not found"), 0));

  return v3;
}

- (id)_ebikeSectionTitle
{
  void *v2;
  void *v3;

  v2 = (void *)objc_claimAutoreleasedReturnValue(+[NSBundle mainBundle](NSBundle, "mainBundle"));
  v3 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v2, "localizedStringForKey:value:table:", CFSTR("[User Profile] My Bike"), CFSTR("localized string not found"), 0));

  return v3;
}

- (id)_cyclingSectionTitle
{
  void *v2;
  void *v3;

  v2 = (void *)objc_claimAutoreleasedReturnValue(+[NSBundle mainBundle](NSBundle, "mainBundle"));
  v3 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v2, "localizedStringForKey:value:table:", CFSTR("[User Profile] Cycling"), CFSTR("localized string not found"), 0));

  return v3;
}

- (id)_transitSectionTitle
{
  void *v2;
  void *v3;

  v2 = (void *)objc_claimAutoreleasedReturnValue(+[NSBundle mainBundle](NSBundle, "mainBundle"));
  v3 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v2, "localizedStringForKey:value:table:", CFSTR("[User Profile] Transit"), CFSTR("localized string not found"), 0));

  return v3;
}

- (id)_distancesSectionTitle
{
  void *v2;
  void *v3;

  v2 = (void *)objc_claimAutoreleasedReturnValue(+[NSBundle mainBundle](NSBundle, "mainBundle"));
  v3 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v2, "localizedStringForKey:value:table:", CFSTR("[User Profile] Distances"), CFSTR("localized string not found"), 0));

  return v3;
}

- (id)_photoCreditSectionTitle
{
  void *v2;
  void *v3;

  v2 = (void *)objc_claimAutoreleasedReturnValue(+[NSBundle mainBundle](NSBundle, "mainBundle"));
  v3 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v2, "localizedStringForKey:value:table:", CFSTR("[User Profile] Photo Credit"), CFSTR("localized string not found"), 0));

  return v3;
}

- (id)_settingsRowTitle
{
  void *v2;
  void *v3;

  v2 = (void *)objc_claimAutoreleasedReturnValue(+[NSBundle mainBundle](NSBundle, "mainBundle"));
  v3 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v2, "localizedStringForKey:value:table:", CFSTR("[User Profile] Maps Settings"), CFSTR("localized string not found"), 0));

  return v3;
}

- (id)_notificationsRowTitle
{
  uint64_t v3;
  void *v4;
  void *v5;
  id v6;
  void *v7;
  void *v8;
  const __CFString *v9;
  void *v10;

  v3 = objc_claimAutoreleasedReturnValue(-[TravelPreferencesDataSource notificationSettings](self, "notificationSettings"));
  if (v3
    && (v4 = (void *)v3,
        v5 = (void *)objc_claimAutoreleasedReturnValue(-[TravelPreferencesDataSource notificationSettings](self, "notificationSettings")),
        v6 = objc_msgSend(v5, "authorizationStatus"),
        v5,
        v4,
        !v6))
  {
    v7 = (void *)objc_claimAutoreleasedReturnValue(+[NSBundle mainBundle](NSBundle, "mainBundle"));
    v8 = v7;
    v9 = CFSTR("[User Profile] Enable Notifications");
  }
  else
  {
    v7 = (void *)objc_claimAutoreleasedReturnValue(+[NSBundle mainBundle](NSBundle, "mainBundle"));
    v8 = v7;
    v9 = CFSTR("[User Profile] Notification Settings");
  }
  v10 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v7, "localizedStringForKey:value:table:", v9, CFSTR("localized string not found"), 0));

  return v10;
}

- (NSArray)sectionTitles
{
  return self->_sectionTitles;
}

- (void)setSectionTitles:(id)a3
{
  objc_storeStrong((id *)&self->_sectionTitles, a3);
}

- (SupplementaryElementsDataSourceDelegate)privacyDelegate
{
  return (SupplementaryElementsDataSourceDelegate *)objc_loadWeakRetained((id *)&self->_privacyDelegate);
}

- (void)setPrivacyDelegate:(id)a3
{
  objc_storeWeak((id *)&self->_privacyDelegate, a3);
}

- (GEOCyclingUserPreferences)cyclingPreferences
{
  return self->_cyclingPreferences;
}

- (TransitPreferencesViewControllerDataSource)transitDataSource
{
  return self->_transitDataSource;
}

- (void)setTransitDataSource:(id)a3
{
  objc_storeStrong((id *)&self->_transitDataSource, a3);
}

- (UNNotificationSettings)notificationSettings
{
  return self->_notificationSettings;
}

- (void)setNotificationSettings:(id)a3
{
  objc_storeStrong((id *)&self->_notificationSettings, a3);
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_notificationSettings, 0);
  objc_storeStrong((id *)&self->_transitDataSource, 0);
  objc_storeStrong((id *)&self->_cyclingPreferences, 0);
  objc_destroyWeak((id *)&self->_privacyDelegate);
  objc_storeStrong((id *)&self->_sectionTitles, 0);
  objc_storeStrong((id *)&self->_photoCreditName, 0);
  objc_storeStrong((id *)&self->_countryObserver, 0);
  objc_storeStrong(&self->_originalPreferences, 0);
}

@end
