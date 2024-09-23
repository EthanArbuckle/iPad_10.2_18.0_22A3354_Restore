@implementation UserProfileLinkPreferencesProvider

+ (id)sharedInstance
{
  if (qword_1014D4248 != -1)
    dispatch_once(&qword_1014D4248, &stru_1011E72A0);
  return (id)qword_1014D4240;
}

- (UserProfileLinkPreferencesProvider)init
{
  UserProfileLinkPreferencesProvider *v2;
  UserProfileLinkPreferencesProvider *v3;
  UserProfileLinkPreferencesProvider *v4;
  uint64_t v5;
  uint64_t v6;
  id transportTypeChangedListener;
  _QWORD v9[4];
  UserProfileLinkPreferencesProvider *v10;
  objc_super v11;

  v11.receiver = self;
  v11.super_class = (Class)UserProfileLinkPreferencesProvider;
  v2 = -[UserProfileLinkPreferencesProvider init](&v11, "init");
  v3 = v2;
  if (v2)
  {
    v9[0] = _NSConcreteStackBlock;
    v9[1] = 3221225472;
    v9[2] = sub_100B7B894;
    v9[3] = &unk_1011E72C8;
    v4 = v2;
    v10 = v4;
    v5 = _GEOConfigAddBlockListenerForKey(GeoServicesConfig_TransportTypePreference[0], GeoServicesConfig_TransportTypePreference[1], &_dispatch_main_q, v9);
    v6 = objc_claimAutoreleasedReturnValue(v5);
    transportTypeChangedListener = v4->_transportTypeChangedListener;
    v4->_transportTypeChangedListener = (id)v6;

  }
  return v3;
}

- (void)dealloc
{
  objc_super v3;

  GEOConfigRemoveBlockListener(self->_transportTypeChangedListener, a2);
  v3.receiver = self;
  v3.super_class = (Class)UserProfileLinkPreferencesProvider;
  -[UserProfileLinkPreferencesProvider dealloc](&v3, "dealloc");
}

- (id)createUserProfileLink
{
  void *v3;
  uint64_t v4;
  void *v5;
  void *v6;
  const __CFString *v7;
  void *v8;
  void *v9;
  void *v10;
  void *v11;
  void *v12;
  void *v13;
  void *v14;
  UserProfileLink *v15;
  UserProfileLink *newLink;
  void *v17;
  id v18;
  void *v19;
  UserProfileLink *v20;

  v3 = (void *)objc_claimAutoreleasedReturnValue(+[UIScreen mainScreen](UIScreen, "mainScreen"));
  v4 = sub_1002A8AA0(v3);
  v5 = (void *)objc_claimAutoreleasedReturnValue(+[NSBundle mainBundle](NSBundle, "mainBundle"));
  v6 = v5;
  if (v4 == 5)
    v7 = CFSTR("[User Profile Preferences] Preferences (macOS)");
  else
    v7 = CFSTR("[User Profile Preferences] Preferences (iOS)");
  v8 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v5, "localizedStringForKey:value:table:", v7, CFSTR("localized string not found"), 0));

  v9 = (void *)objc_claimAutoreleasedReturnValue(+[UIFontDescriptor preferredFontDescriptorWithTextStyle:](UIFontDescriptor, "preferredFontDescriptorWithTextStyle:", UIFontTextStyleSubheadline));
  v10 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v9, "fontDescriptorWithSymbolicTraits:", 2));
  v11 = (void *)objc_claimAutoreleasedReturnValue(+[UIFont fontWithDescriptor:size:](UIFont, "fontWithDescriptor:size:", v10, 15.0));

  v12 = (void *)objc_claimAutoreleasedReturnValue(+[UIImage systemImageNamed:](UIImage, "systemImageNamed:", CFSTR("switch.2")));
  v13 = (void *)objc_claimAutoreleasedReturnValue(+[UIImageSymbolConfiguration configurationWithFont:](UIImageSymbolConfiguration, "configurationWithFont:", v11));
  v14 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v12, "imageWithConfiguration:", v13));

  v15 = -[UserProfileLink initWithTitle:icon:]([UserProfileLink alloc], "initWithTitle:icon:", v8, v14);
  newLink = self->_newLink;
  self->_newLink = v15;

  -[UserProfileLink setUserProfileLinkType:](self->_newLink, "setUserProfileLinkType:", -[UserProfileLinkPreferencesProvider userProfileLinkType](self, "userProfileLinkType"));
  v17 = (void *)objc_claimAutoreleasedReturnValue(+[UIDevice currentDevice](UIDevice, "currentDevice"));
  v18 = objc_msgSend(v17, "userInterfaceIdiom");

  if (v18 != (id)5)
  {
    v19 = (void *)objc_claimAutoreleasedReturnValue(-[UserProfileLinkPreferencesProvider retrieveTravelPreference](self, "retrieveTravelPreference"));
    -[UserProfileLink setSubtitle:](self->_newLink, "setSubtitle:", v19);

  }
  v20 = self->_newLink;

  return v20;
}

- (int64_t)userProfileLinkType
{
  return 6;
}

- (id)retrieveTravelPreference
{
  void *v2;
  void *v3;
  const __CFString *v4;
  void *v5;

  switch(GEOGetUserTransportTypePreference(self))
  {
    case 1:
      v2 = (void *)objc_claimAutoreleasedReturnValue(+[NSBundle mainBundle](NSBundle, "mainBundle"));
      v3 = v2;
      v4 = CFSTR("[User Profile Preferences] Preferred Transport Type - Walking");
      break;
    case 2:
      v2 = (void *)objc_claimAutoreleasedReturnValue(+[NSBundle mainBundle](NSBundle, "mainBundle"));
      v3 = v2;
      v4 = CFSTR("[User Profile Preferences] Preferred Transport Type - Transit");
      break;
    case 3:
      v2 = (void *)objc_claimAutoreleasedReturnValue(+[NSBundle mainBundle](NSBundle, "mainBundle"));
      v3 = v2;
      v4 = CFSTR("[User Profile Preferences] Preferred Transport Type - Ridesharing");
      break;
    case 4:
      v2 = (void *)objc_claimAutoreleasedReturnValue(+[NSBundle mainBundle](NSBundle, "mainBundle"));
      v3 = v2;
      v4 = CFSTR("[User Profile Preferences] Preferred Transport Type - Cycling");
      break;
    default:
      v2 = (void *)objc_claimAutoreleasedReturnValue(+[NSBundle mainBundle](NSBundle, "mainBundle"));
      v3 = v2;
      v4 = CFSTR("[User Profile Preferences] Preferred Transport Type - Driving");
      break;
  }
  v5 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v2, "localizedStringForKey:value:table:", v4, CFSTR("localized string not found"), 0));

  return v5;
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

- (void)_updateLinkAndNotifyObservers:(BOOL)a3
{
  _BOOL4 v3;
  void *v5;
  unsigned __int8 v6;
  id v7;

  v3 = a3;
  v7 = (id)objc_claimAutoreleasedReturnValue(-[UserProfileLinkPreferencesProvider retrieveTravelPreference](self, "retrieveTravelPreference"));
  v5 = (void *)objc_claimAutoreleasedReturnValue(-[UserProfileLink subtitle](self->_newLink, "subtitle"));
  v6 = objc_msgSend(v5, "isEqualToString:", v7);

  if ((v6 & 1) == 0)
  {
    -[UserProfileLink setSubtitle:](self->_newLink, "setSubtitle:", v7);
    if (v3)
      -[GEOObserverHashTable dataDidUpdateForUserProfileLinkType:](self->_observers, "dataDidUpdateForUserProfileLinkType:", -[UserProfileLinkPreferencesProvider userProfileLinkType](self, "userProfileLinkType"));
  }

}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_observers, 0);
  objc_storeStrong(&self->_transportTypeChangedListener, 0);
  objc_storeStrong((id *)&self->_newLink, 0);
}

@end
