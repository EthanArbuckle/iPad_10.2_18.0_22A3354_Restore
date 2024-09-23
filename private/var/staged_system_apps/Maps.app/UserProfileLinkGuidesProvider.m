@implementation UserProfileLinkGuidesProvider

+ (id)sharedInstance
{
  if (qword_1014D4408 != -1)
    dispatch_once(&qword_1014D4408, &stru_1011E9030);
  return (id)qword_1014D4400;
}

- (UserProfileLinkGuidesProvider)init
{
  UserProfileLinkGuidesProvider *v2;
  uint64_t v3;
  CollectionManager *collectionManager;
  objc_super v6;

  v6.receiver = self;
  v6.super_class = (Class)UserProfileLinkGuidesProvider;
  v2 = -[UserProfileLinkGuidesProvider init](&v6, "init");
  if (v2)
  {
    v3 = objc_claimAutoreleasedReturnValue(+[CollectionManager sharedManager](CollectionManager, "sharedManager"));
    collectionManager = v2->_collectionManager;
    v2->_collectionManager = (CollectionManager *)v3;

    -[CollectionManager addObserver:](v2->_collectionManager, "addObserver:", v2);
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
  void *v14;
  UserProfileLink *v15;

  v3 = (void *)objc_claimAutoreleasedReturnValue(+[NSBundle mainBundle](NSBundle, "mainBundle"));
  v4 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v3, "localizedStringForKey:value:table:", CFSTR("[User Profile Guides] Guides"), CFSTR("localized string not found"), 0));

  v5 = (void *)objc_claimAutoreleasedReturnValue(+[UIFontDescriptor preferredFontDescriptorWithTextStyle:](UIFontDescriptor, "preferredFontDescriptorWithTextStyle:", UIFontTextStyleSubheadline));
  v6 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v5, "fontDescriptorWithSymbolicTraits:", 2));
  v7 = (void *)objc_claimAutoreleasedReturnValue(+[UIFont fontWithDescriptor:size:](UIFont, "fontWithDescriptor:size:", v6, 15.0));

  v8 = (void *)objc_claimAutoreleasedReturnValue(+[UIImage _systemImageNamed:](UIImage, "_systemImageNamed:", CFSTR("pin.point.of.interest.2.fill")));
  v9 = (void *)objc_claimAutoreleasedReturnValue(+[UIImageSymbolConfiguration configurationWithFont:](UIImageSymbolConfiguration, "configurationWithFont:", v7));
  v10 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v8, "imageWithConfiguration:", v9));

  v11 = -[UserProfileLink initWithTitle:icon:]([UserProfileLink alloc], "initWithTitle:icon:", v4, v10);
  newLink = self->_newLink;
  self->_newLink = v11;

  -[UserProfileLink setUserProfileLinkType:](self->_newLink, "setUserProfileLinkType:", -[UserProfileLinkGuidesProvider userProfileLinkType](self, "userProfileLinkType"));
  v13 = (void *)objc_claimAutoreleasedReturnValue(+[UserInformationManager sharedInstance](UserInformationManager, "sharedInstance"));
  self->_loggedIn = objc_msgSend(v13, "loggedIn");

  v14 = (void *)objc_claimAutoreleasedReturnValue(-[UserProfileLinkGuidesProvider retrieveSubtitleText](self, "retrieveSubtitleText"));
  -[UserProfileLink setSubtitle:](self->_newLink, "setSubtitle:", v14);

  v15 = self->_newLink;
  return v15;
}

- (int64_t)userProfileLinkType
{
  return 2;
}

- (id)retrieveSubtitleText
{
  void *v2;
  id v3;
  void *v4;
  void *v5;
  void *v6;
  void *v7;
  id v8;
  void *v9;
  void *v10;

  v2 = (void *)objc_claimAutoreleasedReturnValue(+[UIDevice currentDevice](UIDevice, "currentDevice"));
  v3 = objc_msgSend(v2, "userInterfaceIdiom");

  v4 = (void *)objc_claimAutoreleasedReturnValue(+[CollectionManager sharedManager](CollectionManager, "sharedManager"));
  v5 = v4;
  if (v3 == (id)5)
    v6 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v4, "currentCollectionsForMacHome"));
  else
    v6 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v4, "currentCollectionsForiOSHome"));
  v7 = v6;
  v8 = objc_msgSend(v6, "count");

  if (v8)
  {
    v9 = (void *)objc_claimAutoreleasedReturnValue(+[NSString localizedStringWithFormat:](NSString, "localizedStringWithFormat:", CFSTR("%ld"), v8));
  }
  else
  {
    v10 = (void *)objc_claimAutoreleasedReturnValue(+[NSBundle mainBundle](NSBundle, "mainBundle"));
    v9 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v10, "localizedStringForKey:value:table:", CFSTR("[User Profile Guides] Add"), CFSTR("localized string not found"), 0));

  }
  return v9;
}

- (void)_updateLinkAndNotifyObservers:(BOOL)a3
{
  _BOOL4 v3;
  void *v5;
  unsigned __int8 v6;
  id v7;

  v3 = a3;
  v7 = (id)objc_claimAutoreleasedReturnValue(-[UserProfileLinkGuidesProvider retrieveSubtitleText](self, "retrieveSubtitleText"));
  v5 = (void *)objc_claimAutoreleasedReturnValue(-[UserProfileLink subtitle](self->_newLink, "subtitle"));
  v6 = objc_msgSend(v5, "isEqualToString:", v7);

  if ((v6 & 1) == 0)
  {
    -[UserProfileLink setSubtitle:](self->_newLink, "setSubtitle:", v7);
    if (v3)
      -[GEOObserverHashTable dataDidUpdateForUserProfileLinkType:](self->_observers, "dataDidUpdateForUserProfileLinkType:", -[UserProfileLinkGuidesProvider userProfileLinkType](self, "userProfileLinkType"));
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

- (void)collectionManager:(id)a3 contentDidChange:(id)a4
{
  -[UserProfileLinkGuidesProvider _updateLinkAndNotifyObservers:](self, "_updateLinkAndNotifyObservers:", 1, a4);
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_observers, 0);
  objc_storeStrong((id *)&self->_collectionManager, 0);
  objc_storeStrong((id *)&self->_newLink, 0);
}

@end
