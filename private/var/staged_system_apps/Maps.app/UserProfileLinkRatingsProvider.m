@implementation UserProfileLinkRatingsProvider

+ (id)sharedInstance
{
  if (qword_1014D36D0 != -1)
    dispatch_once(&qword_1014D36D0, &stru_1011D9AD0);
  return (id)qword_1014D36C8;
}

- (UserProfileLinkRatingsProvider)init
{
  UserProfileLinkRatingsProvider *v2;
  void *v3;
  objc_super v5;

  v5.receiver = self;
  v5.super_class = (Class)UserProfileLinkRatingsProvider;
  v2 = -[UserProfileLinkRatingsProvider init](&v5, "init");
  if (v2)
  {
    v3 = (void *)objc_claimAutoreleasedReturnValue(+[UGCReviewedPlaceMapsSync sharedInstance](UGCReviewedPlaceMapsSync, "sharedInstance"));
    objc_msgSend(v3, "registerObserver:", v2);

    -[UserProfileLinkRatingsProvider _fetchCount](v2, "_fetchCount");
  }
  return v2;
}

- (id)createUserProfileLink
{
  void *v3;
  void *v4;
  void *v5;
  void *v6;
  void *v7;
  void *v8;
  void *v9;
  void *v10;
  UserProfileLink *v11;
  UserProfileLink *newLink;
  void *v13;
  UserProfileLink *v14;

  v3 = (void *)objc_claimAutoreleasedReturnValue(+[NSBundle mainBundle](NSBundle, "mainBundle"));
  v4 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v3, "localizedStringForKey:value:table:", CFSTR("[User Profile Ratings & Photos] Ratings & Photos"), CFSTR("localized string not found"), 0));

  v5 = (void *)objc_claimAutoreleasedReturnValue(+[UIFontDescriptor preferredFontDescriptorWithTextStyle:](UIFontDescriptor, "preferredFontDescriptorWithTextStyle:", UIFontTextStyleSubheadline));
  v6 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v5, "fontDescriptorWithSymbolicTraits:", 2));
  v7 = (void *)objc_claimAutoreleasedReturnValue(+[UIFont fontWithDescriptor:size:](UIFont, "fontWithDescriptor:size:", v6, 15.0));

  v8 = (void *)objc_claimAutoreleasedReturnValue(+[UIImage systemImageNamed:](UIImage, "systemImageNamed:", CFSTR("hand.thumbsup.fill")));
  v9 = (void *)objc_claimAutoreleasedReturnValue(+[UIImageSymbolConfiguration configurationWithFont:](UIImageSymbolConfiguration, "configurationWithFont:", v7));
  v10 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v8, "imageWithConfiguration:", v9));

  v11 = -[UserProfileLink initWithTitle:icon:]([UserProfileLink alloc], "initWithTitle:icon:", v4, v10);
  newLink = self->_newLink;
  self->_newLink = v11;

  -[UserProfileLink setUserProfileLinkType:](self->_newLink, "setUserProfileLinkType:", -[UserProfileLinkRatingsProvider userProfileLinkType](self, "userProfileLinkType"));
  v13 = (void *)objc_claimAutoreleasedReturnValue(-[UserProfileLinkRatingsProvider retrieveSubtitleText](self, "retrieveSubtitleText"));
  -[UserProfileLink setSubtitle:](self->_newLink, "setSubtitle:", v13);

  v14 = self->_newLink;
  return v14;
}

- (int64_t)userProfileLinkType
{
  return 4;
}

- (id)retrieveSubtitleText
{
  int64_t count;
  void *v3;
  void *v4;

  count = self->_count;
  if (count)
  {
    v3 = (void *)objc_claimAutoreleasedReturnValue(+[NSString localizedStringWithFormat:](NSString, "localizedStringWithFormat:", CFSTR("%ld"), count));
  }
  else
  {
    v4 = (void *)objc_claimAutoreleasedReturnValue(+[NSBundle mainBundle](NSBundle, "mainBundle"));
    v3 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v4, "localizedStringForKey:value:table:", CFSTR("[User Profile Ratings] Add"), CFSTR("localized string not found"), 0));

  }
  return v3;
}

- (BOOL)hasRatings
{
  return self->_count > 0;
}

- (void)_fetchCount
{
  _QWORD v2[4];
  id v3;
  id location;

  objc_initWeak(&location, self);
  v2[0] = _NSConcreteStackBlock;
  v2[1] = 3221225472;
  v2[2] = sub_100875BA0;
  v2[3] = &unk_1011B07A0;
  objc_copyWeak(&v3, &location);
  +[UGCReviewedPlaceManager fetchAllHistoryObjectsFromStorageWithCompletion:](UGCReviewedPlaceManager, "fetchAllHistoryObjectsFromStorageWithCompletion:", v2);
  objc_destroyWeak(&v3);
  objc_destroyWeak(&location);
}

- (void)_updateLinkWithCount:(int64_t)a3 notifyObservers:(BOOL)a4
{
  _BOOL4 v4;
  id v8;
  NSObject *v9;
  objc_class *v10;
  NSString *v11;
  void *v12;
  NSString *v13;
  void *v14;
  void *v15;
  void *v16;
  int v17;
  void *v18;
  __int16 v19;
  void *v20;
  __int16 v21;
  int v22;

  v4 = a4;
  v8 = sub_10043261C();
  v9 = objc_claimAutoreleasedReturnValue(v8);
  if (os_log_type_enabled(v9, OS_LOG_TYPE_INFO))
  {
    v10 = (objc_class *)objc_opt_class(self);
    v11 = NSStringFromClass(v10);
    v12 = (void *)objc_claimAutoreleasedReturnValue(v11);
    v13 = NSStringFromSelector(a2);
    v14 = (void *)objc_claimAutoreleasedReturnValue(v13);
    v17 = 138412802;
    v18 = v12;
    v19 = 2112;
    v20 = v14;
    v21 = 1024;
    v22 = a3;
    _os_log_impl((void *)&_mh_execute_header, v9, OS_LOG_TYPE_INFO, "%@ %@, count = %d", (uint8_t *)&v17, 0x1Cu);

  }
  if (self->_count != a3)
  {
    self->_count = a3;
    v15 = (void *)objc_claimAutoreleasedReturnValue(-[UserProfileLinkRatingsProvider retrieveSubtitleText](self, "retrieveSubtitleText"));
    -[UserProfileLink setSubtitle:](self->_newLink, "setSubtitle:", v15);

    if (v4)
    {
      v16 = (void *)objc_claimAutoreleasedReturnValue(-[UserProfileLinkRatingsProvider observers](self, "observers"));
      objc_msgSend(v16, "dataDidUpdateForUserProfileLinkType:", -[UserProfileLinkRatingsProvider userProfileLinkType](self, "userProfileLinkType"));

    }
  }
}

- (GEOObserverHashTable)observers
{
  GEOObserverHashTable *observers;
  GEOObserverHashTable *v4;
  GEOObserverHashTable *v5;

  observers = self->_observers;
  if (!observers)
  {
    v4 = (GEOObserverHashTable *)objc_msgSend(objc_alloc((Class)GEOObserverHashTable), "initWithProtocol:queue:", &OBJC_PROTOCOL___UserProfileLinkDataProvidingObserver, 0);
    v5 = self->_observers;
    self->_observers = v4;

    observers = self->_observers;
  }
  return observers;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_observers, 0);
  objc_storeStrong((id *)&self->_newLink, 0);
}

@end
