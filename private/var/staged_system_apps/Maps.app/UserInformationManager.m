@implementation UserInformationManager

+ (id)sharedInstance
{
  if (qword_1014D31F0 != -1)
    dispatch_once(&qword_1014D31F0, &stru_1011C5F28);
  return (id)qword_1014D31E8;
}

- (UserInformationManager)init
{
  UserInformationManager *v2;
  dispatch_queue_attr_t v3;
  NSObject *v4;
  dispatch_queue_attr_t v5;
  NSObject *v6;
  dispatch_queue_t v7;
  OS_dispatch_queue *profilePictureQueue;
  void *v9;
  objc_super v11;

  v11.receiver = self;
  v11.super_class = (Class)UserInformationManager;
  v2 = -[UserInformationManager init](&v11, "init");
  if (v2)
  {
    v3 = dispatch_queue_attr_make_with_autorelease_frequency(0, DISPATCH_AUTORELEASE_FREQUENCY_WORK_ITEM);
    v4 = objc_claimAutoreleasedReturnValue(v3);
    v5 = dispatch_queue_attr_make_with_qos_class(v4, QOS_CLASS_USER_INITIATED, -1);
    v6 = objc_claimAutoreleasedReturnValue(v5);

    v7 = dispatch_queue_create("com.apple.Maps.UserProfile.ProfilePicture", v6);
    profilePictureQueue = v2->_profilePictureQueue;
    v2->_profilePictureQueue = (OS_dispatch_queue *)v7;

    -[UserInformationManager _retrieveUserProfilePicture](v2, "_retrieveUserProfilePicture");
    v9 = (void *)objc_claimAutoreleasedReturnValue(+[NSNotificationCenter defaultCenter](NSNotificationCenter, "defaultCenter"));
    objc_msgSend(v9, "addObserver:selector:name:object:", v2, "_handleProfilePictureStoreDidChangeNotification:", AAUIProfilePictureStoreDidChangeNotification, 0);

  }
  return v2;
}

- (void)dealloc
{
  void *v3;
  objc_super v4;

  v3 = (void *)objc_claimAutoreleasedReturnValue(+[NSNotificationCenter defaultCenter](NSNotificationCenter, "defaultCenter"));
  objc_msgSend(v3, "removeObserver:name:object:", self, AAUIProfilePictureStoreDidChangeNotification, 0);

  -[NSTimer invalidate](self->_profilePictureReloadThrottleTimer, "invalidate");
  v4.receiver = self;
  v4.super_class = (Class)UserInformationManager;
  -[UserInformationManager dealloc](&v4, "dealloc");
}

- (ACAccount)account
{
  return (ACAccount *)+[GEOUserAccountInfo primaryICloudAccount](GEOUserAccountInfo, "primaryICloudAccount");
}

- (UIImage)loggedOutIcon
{
  UIImage *loggedOutIcon;
  void *v4;
  void *v5;
  void *v6;
  void *v7;
  UIImage *v8;
  UIImage *v9;

  loggedOutIcon = self->_loggedOutIcon;
  if (!loggedOutIcon)
  {
    v4 = (void *)objc_claimAutoreleasedReturnValue(+[UIImage systemImageNamed:](UIImage, "systemImageNamed:", CFSTR("person.crop.circle")));
    v5 = (void *)objc_claimAutoreleasedReturnValue(+[UIImageSymbolConfiguration configurationWithPointSize:weight:](UIImageSymbolConfiguration, "configurationWithPointSize:weight:", (uint64_t)UIFontWeightRegular, 36.0));
    v6 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v4, "imageWithConfiguration:", v5));

    v7 = (void *)objc_claimAutoreleasedReturnValue(+[UIColor systemGrayColor](UIColor, "systemGrayColor"));
    v8 = (UIImage *)objc_claimAutoreleasedReturnValue(objc_msgSend(v6, "imageWithTintColor:", v7));
    v9 = self->_loggedOutIcon;
    self->_loggedOutIcon = v8;

    loggedOutIcon = self->_loggedOutIcon;
  }
  return loggedOutIcon;
}

- (AAUIProfilePictureStore)profilePictureStore
{
  void *v3;
  AAUIProfilePictureStore *profilePictureStore;
  BOOL v5;
  id v6;
  AAUIProfilePictureStore *v7;
  AAUIProfilePictureStore *v8;
  AAUIProfilePictureStore *v9;

  v3 = (void *)objc_claimAutoreleasedReturnValue(-[UserInformationManager account](self, "account"));
  profilePictureStore = self->_profilePictureStore;
  if (profilePictureStore)
    v5 = 1;
  else
    v5 = v3 == 0;
  if (!v5)
  {
    v6 = objc_alloc_init((Class)ACAccountStore);
    v7 = (AAUIProfilePictureStore *)objc_msgSend(objc_alloc((Class)AAUIProfilePictureStore), "initWithAppleAccount:store:", v3, v6);
    v8 = self->_profilePictureStore;
    self->_profilePictureStore = v7;

    profilePictureStore = self->_profilePictureStore;
  }
  v9 = profilePictureStore;

  return v9;
}

- (NSPersonNameComponentsFormatter)nameFormatter
{
  NSPersonNameComponentsFormatter *nameFormatter;
  NSPersonNameComponentsFormatter *v4;
  NSPersonNameComponentsFormatter *v5;

  nameFormatter = self->_nameFormatter;
  if (!nameFormatter)
  {
    v4 = (NSPersonNameComponentsFormatter *)objc_alloc_init((Class)NSPersonNameComponentsFormatter);
    v5 = self->_nameFormatter;
    self->_nameFormatter = v4;

    -[NSPersonNameComponentsFormatter setStyle:](self->_nameFormatter, "setStyle:", 2);
    nameFormatter = self->_nameFormatter;
  }
  return nameFormatter;
}

- (BOOL)loggedIn
{
  void *v2;
  BOOL v3;

  v2 = (void *)objc_claimAutoreleasedReturnValue(-[UserInformationManager account](self, "account"));
  v3 = v2 != 0;

  return v3;
}

- (NSString)userName
{
  void *v3;
  NSString *userName;
  BOOL v5;
  id v6;
  void *v7;
  void *v8;
  void *v9;
  void *v10;
  NSString *v11;
  NSString *v12;
  NSString *v13;

  v3 = (void *)objc_claimAutoreleasedReturnValue(-[UserInformationManager account](self, "account"));
  userName = self->_userName;
  if (userName)
    v5 = 1;
  else
    v5 = v3 == 0;
  if (!v5)
  {
    v6 = objc_alloc_init((Class)NSPersonNameComponents);
    v7 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v3, "aa_firstName"));
    objc_msgSend(v6, "setGivenName:", v7);

    v8 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v3, "aa_middleName"));
    objc_msgSend(v6, "setMiddleName:", v8);

    v9 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v3, "aa_lastName"));
    objc_msgSend(v6, "setFamilyName:", v9);

    v10 = (void *)objc_claimAutoreleasedReturnValue(-[UserInformationManager nameFormatter](self, "nameFormatter"));
    v11 = (NSString *)objc_claimAutoreleasedReturnValue(objc_msgSend(v10, "stringFromPersonNameComponents:", v6));
    v12 = self->_userName;
    self->_userName = v11;

    userName = self->_userName;
  }
  v13 = userName;

  return v13;
}

- (NSString)userGivenName
{
  void *v3;
  NSString *userGivenName;
  BOOL v5;
  id v6;
  void *v7;
  void *v8;
  void *v9;
  NSString *v10;
  NSString *v11;
  NSString *v12;

  v3 = (void *)objc_claimAutoreleasedReturnValue(-[UserInformationManager account](self, "account"));
  userGivenName = self->_userGivenName;
  if (userGivenName)
    v5 = 1;
  else
    v5 = v3 == 0;
  if (!v5)
  {
    v6 = objc_alloc_init((Class)NSPersonNameComponents);
    v7 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v3, "aa_firstName"));
    objc_msgSend(v6, "setGivenName:", v7);

    v8 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v3, "aa_middleName"));
    objc_msgSend(v6, "setMiddleName:", v8);

    v9 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v3, "aa_lastName"));
    objc_msgSend(v6, "setFamilyName:", v9);

    v10 = (NSString *)objc_claimAutoreleasedReturnValue(+[NSPersonNameComponentsFormatter localizedStringFromPersonNameComponents:style:options:](NSPersonNameComponentsFormatter, "localizedStringFromPersonNameComponents:style:options:", v6, 1, 0));
    v11 = self->_userGivenName;
    self->_userGivenName = v10;

    userGivenName = self->_userGivenName;
  }
  v12 = userGivenName;

  return v12;
}

- (NSString)userEmail
{
  void *v3;
  NSString *userEmail;
  BOOL v5;
  void *v6;
  unsigned int v7;
  NSString *v8;
  NSString *v9;
  NSString *v10;

  v3 = (void *)objc_claimAutoreleasedReturnValue(-[UserInformationManager account](self, "account"));
  userEmail = self->_userEmail;
  if (userEmail)
    v5 = 1;
  else
    v5 = v3 == 0;
  if (!v5)
  {
    v6 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v3, "aa_primaryEmail"));
    if (objc_msgSend(v6, "length"))
    {
      v7 = objc_msgSend(v3, "aa_isPrimaryEmailVerified");

      if (!v7)
      {
        v8 = 0;
        goto LABEL_11;
      }
      v6 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v3, "aa_primaryEmail"));
      v8 = (NSString *)objc_msgSend(v6, "copy");
    }
    else
    {
      v8 = 0;
    }

LABEL_11:
    v9 = self->_userEmail;
    self->_userEmail = v8;

    userEmail = self->_userEmail;
  }
  v10 = userEmail;

  return v10;
}

- (UIImage)userIcon
{
  UIImage *userIcon;

  userIcon = self->_userIcon;
  if (userIcon)
    return userIcon;
  else
    return (UIImage *)(id)objc_claimAutoreleasedReturnValue(-[UserInformationManager loggedOutIcon](self, "loggedOutIcon"));
}

- (void)_retrieveUserProfilePicture
{
  NSObject *profilePictureQueue;
  _QWORD v4[4];
  id v5;
  id location;

  objc_initWeak(&location, self);
  profilePictureQueue = self->_profilePictureQueue;
  v4[0] = _NSConcreteStackBlock;
  v4[1] = 3221225472;
  v4[2] = sub_10076F764;
  v4[3] = &unk_1011AD260;
  objc_copyWeak(&v5, &location);
  dispatch_async(profilePictureQueue, v4);
  objc_destroyWeak(&v5);
  objc_destroyWeak(&location);
}

- (void)_retrieveUserProfilePictureWithImageCreationCompletion:(id)a3
{
  id v4;
  void *v5;
  id *v6;
  id v7;
  id v8;
  _QWORD block[5];
  id v10;
  _QWORD v11[4];
  id v12;

  v4 = a3;
  if (-[UserInformationManager loggedIn](self, "loggedIn"))
  {
    v5 = (void *)objc_claimAutoreleasedReturnValue(-[UserInformationManager profilePictureStore](self, "profilePictureStore"));
    v11[0] = _NSConcreteStackBlock;
    v11[1] = 3221225472;
    v11[2] = sub_10076F9B0;
    v11[3] = &unk_1011BFC30;
    v6 = &v12;
    v12 = v4;
    v7 = v4;
    objc_msgSend(v5, "fetchProfilePictureForAccountOwner:", v11);

  }
  else
  {
    block[0] = _NSConcreteStackBlock;
    block[1] = 3221225472;
    block[2] = sub_10076FB74;
    block[3] = &unk_1011ACAD0;
    v6 = &v10;
    block[4] = self;
    v10 = v4;
    v8 = v4;
    dispatch_async((dispatch_queue_t)&_dispatch_main_q, block);
  }

}

- (void)retrieveAddressForLocationWithCompletion:(id)a3
{
  id v3;
  void *v4;
  void *v5;
  void *v6;
  void *v7;
  _QWORD v8[4];
  id v9;

  v3 = a3;
  v4 = (void *)objc_claimAutoreleasedReturnValue(+[MKLocationManager sharedLocationManager](MKLocationManager, "sharedLocationManager"));
  v5 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v4, "lastLocation"));

  if (v5)
  {
    v6 = (void *)objc_claimAutoreleasedReturnValue(+[MKMapService sharedService](MKMapService, "sharedService"));
    v7 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v6, "ticketForReverseGeocodeLocation:", v5));

    v8[0] = _NSConcreteStackBlock;
    v8[1] = 3221225472;
    v8[2] = sub_10076FCDC;
    v8[3] = &unk_1011AE268;
    v9 = v3;
    objc_msgSend(v7, "submitWithHandler:networkActivity:", v8, 0);

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
    v4 = (GEOObserverHashTable *)objc_msgSend(objc_alloc((Class)GEOObserverHashTable), "initWithProtocol:queue:", &OBJC_PROTOCOL___UserDataProvidingObserver, 0);
    v5 = self->_observers;
    self->_observers = v4;

    observers = self->_observers;
  }
  return observers;
}

- (void)_updateAndNotifyObservers:(BOOL)a3
{
  if (a3)
    -[GEOObserverHashTable userDataDidUpdate](self->_observers, "userDataDidUpdate");
}

- (void)_handleProfilePictureStoreDidChangeNotification:(id)a3
{
  id v4;
  id v5;
  NSObject *v6;
  void *v7;
  _QWORD v8[5];
  id v9;
  id buf[2];

  v4 = a3;
  v5 = sub_10043261C();
  v6 = objc_claimAutoreleasedReturnValue(v5);
  if (os_log_type_enabled(v6, OS_LOG_TYPE_INFO))
  {
    LOWORD(buf[0]) = 0;
    _os_log_impl((void *)&_mh_execute_header, v6, OS_LOG_TYPE_INFO, "Received notification that profile picture has changed", (uint8_t *)buf, 2u);
  }

  objc_initWeak(buf, self);
  v7 = (void *)objc_claimAutoreleasedReturnValue(+[MapsSyncService shared](_TtC8MapsSync15MapsSyncService, "shared"));
  v8[0] = _NSConcreteStackBlock;
  v8[1] = 3221225472;
  v8[2] = sub_10076FEEC;
  v8[3] = &unk_1011B6E58;
  objc_copyWeak(&v9, buf);
  v8[4] = self;
  objc_msgSend(v7, "cloudKitSyncAllowedWithCompletionHandler:", v8);

  objc_destroyWeak(&v9);
  objc_destroyWeak(buf);

}

- (void)_throttledProfilePictureTimerUpdate:(id)a3
{
  id v3;
  NSObject *v4;
  uint8_t v5[16];

  self->_hasCalledReloadProfilePictureInLast10Seconds = 0;
  v3 = sub_10043261C();
  v4 = objc_claimAutoreleasedReturnValue(v3);
  if (os_log_type_enabled(v4, OS_LOG_TYPE_INFO))
  {
    *(_WORD *)v5 = 0;
    _os_log_impl((void *)&_mh_execute_header, v4, OS_LOG_TYPE_INFO, "Reset the flag _hasCalledReloadProfilePicture to NO", v5, 2u);
  }

}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_profilePictureStore, 0);
  objc_storeStrong((id *)&self->_loggedOutIcon, 0);
  objc_storeStrong((id *)&self->_nameFormatter, 0);
  objc_storeStrong((id *)&self->_userIcon, 0);
  objc_storeStrong((id *)&self->_userEmail, 0);
  objc_storeStrong((id *)&self->_userGivenName, 0);
  objc_storeStrong((id *)&self->_userName, 0);
  objc_storeStrong((id *)&self->_profilePictureQueue, 0);
  objc_storeStrong((id *)&self->_observers, 0);
  objc_storeStrong((id *)&self->_profilePictureReloadThrottleTimer, 0);
}

@end
