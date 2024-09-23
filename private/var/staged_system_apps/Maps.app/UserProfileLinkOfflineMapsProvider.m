@implementation UserProfileLinkOfflineMapsProvider

+ (id)sharedInstance
{
  if (qword_1014D2908 != -1)
    dispatch_once(&qword_1014D2908, &stru_1011BAB88);
  return (id)qword_1014D2900;
}

- (UserProfileLinkOfflineMapsProvider)init
{
  UserProfileLinkOfflineMapsProvider *v2;
  void *v3;
  objc_super v5;

  v5.receiver = self;
  v5.super_class = (Class)UserProfileLinkOfflineMapsProvider;
  v2 = -[UserProfileLinkOfflineMapsProvider init](&v5, "init");
  if (v2)
  {
    v3 = (void *)objc_claimAutoreleasedReturnValue(+[NSNotificationCenter defaultCenter](NSNotificationCenter, "defaultCenter"));
    objc_msgSend(v3, "addObserver:selector:name:object:", v2, "_updateLinkAndNotifyObservers", CFSTR("OfflineMapsSubscriptionsDidChangeNotification"), 0);

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
  v4 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v3, "localizedStringForKey:value:table:", CFSTR("[User Profile] Offline Maps"), CFSTR("localized string not found"), CFSTR("Offline")));

  v5 = (void *)objc_claimAutoreleasedReturnValue(+[UIFontDescriptor preferredFontDescriptorWithTextStyle:](UIFontDescriptor, "preferredFontDescriptorWithTextStyle:", UIFontTextStyleSubheadline));
  v6 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v5, "fontDescriptorWithSymbolicTraits:", 2));
  v7 = (void *)objc_claimAutoreleasedReturnValue(+[UIFont fontWithDescriptor:size:](UIFont, "fontWithDescriptor:size:", v6, 15.0));

  v8 = (void *)objc_claimAutoreleasedReturnValue(+[UIImage systemImageNamed:](UIImage, "systemImageNamed:", CFSTR("icloud.slash.fill")));
  v9 = (void *)objc_claimAutoreleasedReturnValue(+[UIImageSymbolConfiguration configurationWithFont:](UIImageSymbolConfiguration, "configurationWithFont:", v7));
  v10 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v8, "imageWithConfiguration:", v9));

  v11 = -[UserProfileLink initWithTitle:icon:]([UserProfileLink alloc], "initWithTitle:icon:", v4, v10);
  newLink = self->_newLink;
  self->_newLink = v11;

  -[UserProfileLink setUserProfileLinkType:](self->_newLink, "setUserProfileLinkType:", -[UserProfileLinkOfflineMapsProvider userProfileLinkType](self, "userProfileLinkType"));
  v13 = (void *)objc_claimAutoreleasedReturnValue(-[UserProfileLinkOfflineMapsProvider retrieveSubtitleText](self, "retrieveSubtitleText"));
  -[UserProfileLink setSubtitle:](self->_newLink, "setSubtitle:", v13);

  v14 = self->_newLink;
  return v14;
}

- (int64_t)userProfileLinkType
{
  return 7;
}

- (id)retrieveSubtitleText
{
  void *v2;
  void *v3;
  id v4;
  void *v5;
  void *v6;
  void *v7;
  const __CFString *v8;

  if ((GEOSupportsOfflineMaps(self, a2) & 1) == 0)
  {
    v6 = (void *)objc_claimAutoreleasedReturnValue(+[NSBundle mainBundle](NSBundle, "mainBundle"));
    v7 = v6;
    v8 = CFSTR("[User Profile] Not available");
LABEL_6:
    v5 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v6, "localizedStringForKey:value:table:", v8, CFSTR("localized string not found"), CFSTR("Offline")));

    return v5;
  }
  v2 = (void *)objc_claimAutoreleasedReturnValue(+[MapsOfflineUIHelper sharedHelper](MapsOfflineUIHelper, "sharedHelper"));
  v3 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v2, "subscriptions"));
  v4 = objc_msgSend(v3, "count");

  if (!v4)
  {
    v6 = (void *)objc_claimAutoreleasedReturnValue(+[NSBundle mainBundle](NSBundle, "mainBundle"));
    v7 = v6;
    v8 = CFSTR("[User Profile] Download");
    goto LABEL_6;
  }
  v5 = (void *)objc_claimAutoreleasedReturnValue(+[NSString localizedStringWithFormat:](NSString, "localizedStringWithFormat:", CFSTR("%ld"), v4));
  return v5;
}

- (void)_updateLinkAndNotifyObservers
{
  void *v3;
  unsigned __int8 v4;
  id v5;

  v5 = (id)objc_claimAutoreleasedReturnValue(-[UserProfileLinkOfflineMapsProvider retrieveSubtitleText](self, "retrieveSubtitleText"));
  v3 = (void *)objc_claimAutoreleasedReturnValue(-[UserProfileLink subtitle](self->_newLink, "subtitle"));
  v4 = objc_msgSend(v3, "isEqualToString:", v5);

  if ((v4 & 1) == 0)
  {
    -[UserProfileLink setSubtitle:](self->_newLink, "setSubtitle:", v5);
    -[GEOObserverHashTable dataDidUpdateForUserProfileLinkType:](self->_observers, "dataDidUpdateForUserProfileLinkType:", -[UserProfileLinkOfflineMapsProvider userProfileLinkType](self, "userProfileLinkType"));
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
