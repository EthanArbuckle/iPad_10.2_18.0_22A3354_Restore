@implementation UserProfileLinkGarageProvider

+ (id)sharedInstance
{
  if (qword_1014D2058 != -1)
    dispatch_once(&qword_1014D2058, &stru_1011B0108);
  return (id)qword_1014D2050;
}

- (UserProfileLinkGarageProvider)init
{
  UserProfileLinkGarageProvider *v2;
  UserProfileLinkGarageProvider *v3;
  uint64_t v4;
  VGVirtualGarageService *garageService;
  objc_super v7;

  v7.receiver = self;
  v7.super_class = (Class)UserProfileLinkGarageProvider;
  v2 = -[UserProfileLinkGarageProvider init](&v7, "init");
  v3 = v2;
  if (v2)
  {
    -[UserProfileLinkGarageProvider _loadGarage](v2, "_loadGarage");
    v4 = objc_claimAutoreleasedReturnValue(+[VGVirtualGarageService sharedService](VGVirtualGarageService, "sharedService"));
    garageService = v3->_garageService;
    v3->_garageService = (VGVirtualGarageService *)v4;

    -[VGVirtualGarageService registerObserver:](v3->_garageService, "registerObserver:", v3);
  }
  return v3;
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
  v4 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v3, "localizedStringForKey:value:table:", CFSTR("[User Profile My Vehicles] Vehicles"), CFSTR("localized string not found"), 0));

  v5 = (void *)objc_claimAutoreleasedReturnValue(+[UIFontDescriptor preferredFontDescriptorWithTextStyle:](UIFontDescriptor, "preferredFontDescriptorWithTextStyle:", UIFontTextStyleSubheadline));
  v6 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v5, "fontDescriptorWithSymbolicTraits:", 2));
  v7 = (void *)objc_claimAutoreleasedReturnValue(+[UIFont fontWithDescriptor:size:](UIFont, "fontWithDescriptor:size:", v6, 15.0));

  v8 = (void *)objc_claimAutoreleasedReturnValue(+[UIImage systemImageNamed:](UIImage, "systemImageNamed:", CFSTR("car.fill")));
  v9 = (void *)objc_claimAutoreleasedReturnValue(+[UIImageSymbolConfiguration configurationWithFont:](UIImageSymbolConfiguration, "configurationWithFont:", v7));
  v10 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v8, "imageWithConfiguration:", v9));

  v11 = -[UserProfileLink initWithTitle:icon:]([UserProfileLink alloc], "initWithTitle:icon:", v4, v10);
  newLink = self->_newLink;
  self->_newLink = v11;

  -[UserProfileLink setUserProfileLinkType:](self->_newLink, "setUserProfileLinkType:", -[UserProfileLinkGarageProvider userProfileLinkType](self, "userProfileLinkType"));
  v13 = (void *)objc_claimAutoreleasedReturnValue(-[UserProfileLinkGarageProvider retrieveSubtitleText](self, "retrieveSubtitleText"));
  -[UserProfileLink setSubtitle:](self->_newLink, "setSubtitle:", v13);

  v14 = self->_newLink;
  return v14;
}

- (int64_t)userProfileLinkType
{
  return 5;
}

- (id)retrieveSubtitleText
{
  uint64_t IsEnabled_EVRouting;
  uint64_t IsEnabled_Alberta;
  void *v5;
  BOOL v6;
  int v7;
  void *v8;
  void *v9;
  void *v10;
  void *v11;

  IsEnabled_EVRouting = MapsFeature_IsEnabled_EVRouting(self, a2);
  if ((IsEnabled_EVRouting & 1) != 0
    || (IsEnabled_Alberta = MapsFeature_IsEnabled_Alberta(IsEnabled_EVRouting), (_DWORD)IsEnabled_Alberta))
  {
    v5 = (void *)objc_claimAutoreleasedReturnValue(-[VGVirtualGarage vehicles](self->_virtualGarage, "vehicles"));
    v6 = objc_msgSend(v5, "count") != 0;

  }
  else
  {
    v6 = 0;
  }
  v7 = MapsFeature_IsEnabled_Alberta(IsEnabled_Alberta);
  v8 = (void *)objc_claimAutoreleasedReturnValue(-[VGVirtualGarage selectedVehicle](self->_virtualGarage, "selectedVehicle"));
  v9 = v8;
  if (!v7 || v6)
  {
    v11 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v8, "displayName"));
  }
  else
  {
    v10 = (void *)objc_claimAutoreleasedReturnValue(+[NSBundle mainBundle](NSBundle, "mainBundle"));
    v11 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v10, "localizedStringForKey:value:table:", CFSTR("[User Profile Vehicles] Add"), CFSTR("localized string not found"), 0));

  }
  return v11;
}

- (void)_loadGarage
{
  void *v3;
  _QWORD v4[5];
  id v5;
  id location;

  objc_initWeak(&location, self);
  v3 = (void *)objc_claimAutoreleasedReturnValue(+[VGVirtualGarageService sharedService](VGVirtualGarageService, "sharedService"));
  v4[0] = _NSConcreteStackBlock;
  v4[1] = 3221225472;
  v4[2] = sub_1002CA530;
  v4[3] = &unk_1011B0130;
  objc_copyWeak(&v5, &location);
  v4[4] = self;
  objc_msgSend(v3, "virtualGarageGetGarageWithReply:", v4);

  objc_destroyWeak(&v5);
  objc_destroyWeak(&location);
}

- (void)_loadUnpairedVehicles
{
  void *v3;
  _QWORD v4[5];
  id v5;
  id location;

  objc_initWeak(&location, self);
  v3 = (void *)objc_claimAutoreleasedReturnValue(+[VGVirtualGarageService sharedService](VGVirtualGarageService, "sharedService"));
  v4[0] = _NSConcreteStackBlock;
  v4[1] = 3221225472;
  v4[2] = sub_1002CA774;
  v4[3] = &unk_1011ADF70;
  objc_copyWeak(&v5, &location);
  v4[4] = self;
  objc_msgSend(v3, "virtualGarageGetListOfUnpairedVehiclesWithReply:", v4);

  objc_destroyWeak(&v5);
  objc_destroyWeak(&location);
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
  v7 = (id)objc_claimAutoreleasedReturnValue(-[UserProfileLinkGarageProvider retrieveSubtitleText](self, "retrieveSubtitleText"));
  v5 = (void *)objc_claimAutoreleasedReturnValue(-[UserProfileLink subtitle](self->_newLink, "subtitle"));
  v6 = objc_msgSend(v5, "isEqualToString:", v7);

  if ((v6 & 1) == 0)
  {
    -[UserProfileLink setSubtitle:](self->_newLink, "setSubtitle:", v7);
    if (v3)
      -[GEOObserverHashTable dataDidUpdateForUserProfileLinkType:](self->_observers, "dataDidUpdateForUserProfileLinkType:", -[UserProfileLinkGarageProvider userProfileLinkType](self, "userProfileLinkType"));
  }

}

- (void)virtualGarageDidUpdate:(id)a3
{
  id v4;
  _QWORD v5[5];
  id v6;
  id v7;
  id location;

  v4 = a3;
  if ((-[VGVirtualGarage isEqual:](self->_virtualGarage, "isEqual:", v4) & 1) == 0)
  {
    objc_initWeak(&location, self);
    v5[0] = _NSConcreteStackBlock;
    v5[1] = 3221225472;
    v5[2] = sub_1002CAA94;
    v5[3] = &unk_1011AFF10;
    objc_copyWeak(&v7, &location);
    v5[4] = self;
    v6 = v4;
    dispatch_async((dispatch_queue_t)&_dispatch_main_q, v5);

    objc_destroyWeak(&v7);
    objc_destroyWeak(&location);
  }

}

- (void)virtualGarage:(id)a3 didUpdateUnpairedVehicles:(id)a4
{
  id v5;
  unsigned int v6;
  id v7;
  _QWORD block[5];

  v5 = a4;
  v6 = -[UserProfileLinkGarageProvider hasUnpairedVehicles](self, "hasUnpairedVehicles");
  v7 = objc_msgSend(v5, "count");

  -[UserProfileLinkGarageProvider setHasUnpairedVehicles:](self, "setHasUnpairedVehicles:", v7 != 0);
  if (v6 != -[UserProfileLinkGarageProvider hasUnpairedVehicles](self, "hasUnpairedVehicles"))
  {
    block[0] = _NSConcreteStackBlock;
    block[1] = 3221225472;
    block[2] = sub_1002CAB94;
    block[3] = &unk_1011AC860;
    block[4] = self;
    dispatch_async((dispatch_queue_t)&_dispatch_main_q, block);
  }
}

- (VGVirtualGarage)virtualGarage
{
  return self->_virtualGarage;
}

- (void)setVirtualGarage:(id)a3
{
  objc_storeStrong((id *)&self->_virtualGarage, a3);
}

- (BOOL)hasUnpairedVehicles
{
  return self->_hasUnpairedVehicles;
}

- (void)setHasUnpairedVehicles:(BOOL)a3
{
  self->_hasUnpairedVehicles = a3;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_virtualGarage, 0);
  objc_storeStrong((id *)&self->_observers, 0);
  objc_storeStrong((id *)&self->_garageService, 0);
  objc_storeStrong((id *)&self->_newLink, 0);
}

@end
