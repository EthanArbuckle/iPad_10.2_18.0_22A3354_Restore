@implementation _CoreSpotlightActivityHandlingTask

- (void)performTask
{
  void *v3;
  void *v4;
  void *v5;
  SearchFieldItem *v6;
  SearchAction *v7;
  void *v8;
  id v9;
  uint64_t v10;
  SearchAction *v11;
  RichMapsActivity *v12;
  id v13;
  NSObject *v14;
  void *v15;
  void *v16;
  ErrorActionOption *v17;
  void *v18;
  void *v19;
  ErrorActionOption *v20;
  ErrorAction *v21;
  RichMapsActivity *v22;
  uint8_t v23[16];
  ErrorActionOption *v24;

  -[RichMapsActivityCreatingTaskImpl taskStarted](self, "taskStarted");
  v3 = (void *)objc_claimAutoreleasedReturnValue(-[UserActivityHandlingTask userActivity](self, "userActivity"));
  v4 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v3, "userInfo"));
  v5 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v4, "objectForKey:", CSSearchQueryString));

  if (objc_msgSend(v5, "length"))
  {
    v6 = objc_alloc_init(SearchFieldItem);
    -[SearchFieldItem setSearchString:](v6, "setSearchString:", v5);
    v7 = [SearchAction alloc];
    v8 = (void *)objc_claimAutoreleasedReturnValue(+[MNNavigationService sharedService](MNNavigationService, "sharedService"));
    v9 = objc_msgSend(v8, "state");
    v11 = -[SearchAction initWithSearchItem:alongRoute:](v7, "initWithSearchItem:alongRoute:", v6, MNNavigationServiceStateIsNavigating(v9, v10));

    v12 = -[RichMapsActivity initWithMapsAction:]([RichMapsActivity alloc], "initWithMapsAction:", v11);
    -[UserActivityHandlingTask taskFinished:](self, "taskFinished:", v12);
  }
  else
  {
    v13 = sub_100431A4C();
    v14 = objc_claimAutoreleasedReturnValue(v13);
    if (os_log_type_enabled(v14, OS_LOG_TYPE_ERROR))
    {
      *(_WORD *)v23 = 0;
      _os_log_impl((void *)&_mh_execute_header, v14, OS_LOG_TYPE_ERROR, "_CoreSpotlightActivityHandlingTask no query", v23, 2u);
    }

    v15 = (void *)objc_claimAutoreleasedReturnValue(+[NSBundle mainBundle](NSBundle, "mainBundle"));
    v6 = (SearchFieldItem *)objc_claimAutoreleasedReturnValue(objc_msgSend(v15, "localizedStringForKey:value:table:", CFSTR("Failed to continue activity [Spotlight opening error alert]"), CFSTR("localized string not found"), 0));

    v16 = (void *)objc_claimAutoreleasedReturnValue(+[NSBundle mainBundle](NSBundle, "mainBundle"));
    v11 = (SearchAction *)objc_claimAutoreleasedReturnValue(objc_msgSend(v16, "localizedStringForKey:value:table:", CFSTR("The Spotlight selection could not be opened. [Spotlight opening error alert]"), CFSTR("localized string not found"), 0));

    v17 = [ErrorActionOption alloc];
    v18 = (void *)objc_claimAutoreleasedReturnValue(+[NSBundle mainBundle](NSBundle, "mainBundle"));
    v19 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v18, "localizedStringForKey:value:table:", CFSTR("OK [Continuation error alert]"), CFSTR("localized string not found"), 0));
    v20 = -[ErrorActionOption initWithTitle:cancels:handler:](v17, "initWithTitle:cancels:handler:", v19, 1, 0);
    v24 = v20;
    v12 = (RichMapsActivity *)objc_claimAutoreleasedReturnValue(+[NSArray arrayWithObjects:count:](NSArray, "arrayWithObjects:count:", &v24, 1));

    v21 = -[ErrorAction initWithTitle:message:options:]([ErrorAction alloc], "initWithTitle:message:options:", v6, v11, v12);
    v22 = -[RichMapsActivity initWithMapsAction:]([RichMapsActivity alloc], "initWithMapsAction:", v21);
    -[UserActivityHandlingTask taskFinished:](self, "taskFinished:", v22);

  }
}

@end
