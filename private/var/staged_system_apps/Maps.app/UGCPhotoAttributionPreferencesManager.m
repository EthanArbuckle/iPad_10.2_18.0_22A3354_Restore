@implementation UGCPhotoAttributionPreferencesManager

+ (id)sharedManager
{
  if (qword_1014D2BD0 != -1)
    dispatch_once(&qword_1014D2BD0, &stru_1011BE498);
  return (id)qword_1014D2BC8;
}

- (UGCPhotoAttributionPreferencesManager)init
{
  UGCPhotoAttributionPreferencesManager *v2;
  dispatch_queue_attr_t v3;
  NSObject *v4;
  dispatch_queue_t v5;
  OS_dispatch_queue *workQueue;
  uint64_t v7;
  geo_isolater *observersIsolator;
  objc_super v10;

  v10.receiver = self;
  v10.super_class = (Class)UGCPhotoAttributionPreferencesManager;
  v2 = -[UGCPhotoAttributionPreferencesManager init](&v10, "init");
  if (v2)
  {
    v3 = dispatch_queue_attr_make_with_autorelease_frequency(0, DISPATCH_AUTORELEASE_FREQUENCY_WORK_ITEM);
    v4 = objc_claimAutoreleasedReturnValue(v3);
    v5 = dispatch_queue_create("com.apple.Maps.UGCPhotoAttributionPreferencesManagerQueue", v4);
    workQueue = v2->_workQueue;
    v2->_workQueue = (OS_dispatch_queue *)v5;

    v7 = geo_isolater_create("com.apple.Maps.UGCPhotoAttributionPreferencesManager.ObserversIsolator");
    observersIsolator = v2->_observersIsolator;
    v2->_observersIsolator = (geo_isolater *)v7;

  }
  return v2;
}

- (void)photoAttributionPreferencesWithCompletion:(id)a3
{
  id v4;
  NSObject *workQueue;
  id v6;
  _QWORD v7[5];
  id v8;

  v4 = a3;
  workQueue = self->_workQueue;
  v7[0] = _NSConcreteStackBlock;
  v7[1] = 3221225472;
  v7[2] = sub_100624E5C;
  v7[3] = &unk_1011AE240;
  v7[4] = self;
  v8 = v4;
  v6 = v4;
  dispatch_async(workQueue, v7);

}

- (void)_storeFetchedPreferences:(id)a3
{
  NSObject *workQueue;
  id v5;
  void *v6;
  void *v7;
  id v8;

  workQueue = self->_workQueue;
  v5 = a3;
  dispatch_assert_queue_V2(workQueue);
  -[UGCPhotoAttributionPreferencesManager setFetchedPreferences:](self, "setFetchedPreferences:", v5);

  v6 = (void *)objc_claimAutoreleasedReturnValue(+[NSDate now](NSDate, "now"));
  -[UGCPhotoAttributionPreferencesManager setDateOfFetchedPreferences:](self, "setDateOfFetchedPreferences:", v6);

  v8 = (id)objc_claimAutoreleasedReturnValue(-[UGCPhotoAttributionPreferencesManager observers](self, "observers"));
  v7 = (void *)objc_claimAutoreleasedReturnValue(-[UGCPhotoAttributionPreferencesManager fetchedPreferences](self, "fetchedPreferences"));
  objc_msgSend(v8, "photoAttributionPreferencesDidChange:", v7);

}

- (void)_fetchPhotoAttributionPreferencesWithCompletion:(id)a3
{
  id v4;
  id v5;
  id v6;
  void *v7;
  id v8;
  void *v9;
  void *v10;
  id v11;
  void *v12;
  id v13;
  id v14;
  NSObject *v15;
  id v16;
  NSObject *v17;
  void *v18;
  void *v19;
  uint64_t v20;
  MSPFeedbackSubmissionTicket **p_ticket;
  MSPFeedbackSubmissionTicket *ticket;
  MSPFeedbackSubmissionTicket *v23;
  _QWORD v24[4];
  id v25;
  id v26;
  _QWORD block[4];
  id v28;
  id v29;
  id v30;
  uint8_t buf[4];
  id v32;

  v4 = a3;
  dispatch_assert_queue_V2((dispatch_queue_t)self->_workQueue);
  v5 = objc_alloc_init((Class)GEORPFeedbackRequestParameters);
  v6 = objc_alloc_init((Class)GEORPFeedbackQueryParameters);
  objc_msgSend(v5, "setQueryParameters:", v6);

  v7 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v5, "queryParameters"));
  objc_msgSend(v7, "addFeedbackComponentType:", 7);

  v8 = objc_alloc((Class)GEORPFeedbackRequest);
  v9 = (void *)objc_claimAutoreleasedReturnValue(+[GEOMapService sharedService](GEOMapService, "sharedService"));
  v10 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v9, "defaultTraits"));
  v11 = objc_msgSend(v8, "initWithFeedbackRequestParameters:traits:", v5, v10);

  v30 = 0;
  v12 = (void *)objc_claimAutoreleasedReturnValue(+[UGCCredentialsBuilder buildICloudUserCredentialsWithError:](UGCCredentialsBuilder, "buildICloudUserCredentialsWithError:", &v30));
  v13 = v30;
  if (v13)
  {
    v14 = sub_100624FEC();
    v15 = objc_claimAutoreleasedReturnValue(v14);
    if (os_log_type_enabled(v15, OS_LOG_TYPE_ERROR))
    {
      *(_DWORD *)buf = 138412290;
      v32 = v13;
      _os_log_impl((void *)&_mh_execute_header, v15, OS_LOG_TYPE_ERROR, "Failed to create iCloud user info with error %@.  Will not perform submission lookup.", buf, 0xCu);
    }

    block[0] = _NSConcreteStackBlock;
    block[1] = 3221225472;
    block[2] = sub_100625458;
    block[3] = &unk_1011ACAD0;
    v29 = v4;
    v28 = v13;
    dispatch_async((dispatch_queue_t)&_dispatch_main_q, block);

  }
  else
  {
    objc_msgSend(v11, "setUserInfo:", v12);
    v16 = sub_100624FEC();
    v17 = objc_claimAutoreleasedReturnValue(v16);
    if (os_log_type_enabled(v17, OS_LOG_TYPE_INFO))
    {
      *(_DWORD *)buf = 138412290;
      v32 = v11;
      _os_log_impl((void *)&_mh_execute_header, v17, OS_LOG_TYPE_INFO, "Created request %@", buf, 0xCu);
    }

    objc_initWeak((id *)buf, self);
    -[MSPFeedbackSubmissionTicket cancel](self->_ticket, "cancel");
    v18 = (void *)objc_claimAutoreleasedReturnValue(+[GEOMapService sharedService](GEOMapService, "sharedService"));
    v19 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v18, "defaultTraits"));
    v20 = objc_claimAutoreleasedReturnValue(+[MSPFeedbackSubmissionTicket ticketForFeedbackRequest:traits:](MSPFeedbackSubmissionTicket, "ticketForFeedbackRequest:traits:", v11, v19));
    ticket = self->_ticket;
    p_ticket = &self->_ticket;
    *p_ticket = (MSPFeedbackSubmissionTicket *)v20;

    v23 = *p_ticket;
    v24[0] = _NSConcreteStackBlock;
    v24[1] = 3221225472;
    v24[2] = sub_100625470;
    v24[3] = &unk_1011BDC20;
    objc_copyWeak(&v26, (id *)buf);
    v25 = v4;
    -[MSPFeedbackSubmissionTicket submitWithHandler:networkActivity:](v23, "submitWithHandler:networkActivity:", v24, 0);

    objc_destroyWeak(&v26);
    objc_destroyWeak((id *)buf);
  }

}

- (void)updatePhotoAttributionPreferencesAttributePhotos:(BOOL)a3 attributionName:(id)a4 completion:(id)a5
{
  id v8;
  id v9;
  NSObject *workQueue;
  id v11;
  id v12;
  _QWORD v13[4];
  id v14;
  UGCPhotoAttributionPreferencesManager *v15;
  id v16;
  BOOL v17;

  v8 = a4;
  v9 = a5;
  workQueue = self->_workQueue;
  v13[0] = _NSConcreteStackBlock;
  v13[1] = 3221225472;
  v13[2] = sub_10062575C;
  v13[3] = &unk_1011BE4E8;
  v17 = a3;
  v14 = v8;
  v15 = self;
  v16 = v9;
  v11 = v9;
  v12 = v8;
  dispatch_async(workQueue, v13);

}

- (void)_finishWithPreferences:(id)a3 serverError:(id)a4 errorAsString:(id)a5 callback:(id)a6
{
  id v9;
  id v10;
  id v11;
  id v12;
  _QWORD v13[4];
  id v14;
  id v15;
  id v16;
  id v17;

  v13[0] = _NSConcreteStackBlock;
  v13[1] = 3221225472;
  v13[2] = sub_100625F58;
  v13[3] = &unk_1011BE510;
  v14 = a3;
  v15 = a4;
  v16 = a5;
  v17 = a6;
  v9 = v16;
  v10 = v15;
  v11 = v14;
  v12 = v17;
  dispatch_async((dispatch_queue_t)&_dispatch_main_q, v13);

}

- (id)_errorsInResponse:(id)a3
{
  NSObject *workQueue;
  id v5;
  void *v6;
  void *v7;
  void *v8;
  unsigned int *v9;
  id v10;
  NSObject *v11;
  unsigned int v12;
  void *v13;
  void *v14;
  id v15;
  NSObject *v16;
  int v18;
  void *v19;
  __int16 v20;
  unsigned int v21;

  workQueue = self->_workQueue;
  v5 = a3;
  dispatch_assert_queue_V2(workQueue);
  v6 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v5, "feedbackResult"));

  v7 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v6, "submissionResult"));
  v8 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v7, "photoAttributionPreferencesUpdateResult"));
  if (objc_msgSend(v8, "errors"))
  {
    v9 = (unsigned int *)objc_msgSend(v8, "errors");
    v10 = sub_100624FEC();
    v11 = objc_claimAutoreleasedReturnValue(v10);
    if (os_log_type_enabled(v11, OS_LOG_TYPE_INFO))
    {
      v12 = *v9;
      v18 = 138412546;
      v19 = v8;
      v20 = 1024;
      v21 = v12;
      _os_log_impl((void *)&_mh_execute_header, v11, OS_LOG_TYPE_INFO, "Photo Preference update complete: %@ with update error %d", (uint8_t *)&v18, 0x12u);
    }

    v13 = (void *)objc_claimAutoreleasedReturnValue(-[UGCPhotoAttributionPreferencesManager _errorMessageForError:](self, "_errorMessageForError:", *v9));
    -[UGCPhotoAttributionPreferencesManager setUpdateError:](self, "setUpdateError:", v13);

    v14 = (void *)objc_claimAutoreleasedReturnValue(-[UGCPhotoAttributionPreferencesManager updateError](self, "updateError"));
  }
  else
  {
    -[UGCPhotoAttributionPreferencesManager setUpdateError:](self, "setUpdateError:", 0);
    v15 = sub_100624FEC();
    v16 = objc_claimAutoreleasedReturnValue(v15);
    if (os_log_type_enabled(v16, OS_LOG_TYPE_INFO))
    {
      v18 = 138412290;
      v19 = v8;
      _os_log_impl((void *)&_mh_execute_header, v16, OS_LOG_TYPE_INFO, "Photo Preference update complete %@ with no update error", (uint8_t *)&v18, 0xCu);
    }

    v14 = 0;
  }

  return v14;
}

- (id)_errorMessageForError:(int)a3
{
  void *v3;
  void *v4;
  void *v5;
  const __CFString *v6;

  if (a3 < 2)
  {
    v4 = (void *)objc_claimAutoreleasedReturnValue(+[NSBundle mainBundle](NSBundle, "mainBundle"));
    v5 = v4;
    v6 = CFSTR("[Photo Credit] Photo Credit update error");
LABEL_5:
    v3 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v4, "localizedStringForKey:value:table:", v6, CFSTR("localized string not found"), 0));

    return v3;
  }
  if (a3 == 2)
  {
    v4 = (void *)objc_claimAutoreleasedReturnValue(+[NSBundle mainBundle](NSBundle, "mainBundle"));
    v5 = v4;
    v6 = CFSTR("[Photo Credit] Photo Credit name unavailable update error");
    goto LABEL_5;
  }
  return v3;
}

- (id)observers
{
  geo_isolater *observersIsolator;
  id v3;
  _QWORD v5[6];
  uint64_t v6;
  uint64_t *v7;
  uint64_t v8;
  uint64_t (*v9)(uint64_t, uint64_t);
  void (*v10)(uint64_t);
  id v11;

  v6 = 0;
  v7 = &v6;
  v8 = 0x3032000000;
  v9 = sub_10062627C;
  v10 = sub_10062628C;
  v11 = 0;
  observersIsolator = self->_observersIsolator;
  v5[0] = _NSConcreteStackBlock;
  v5[1] = 3221225472;
  v5[2] = sub_100626294;
  v5[3] = &unk_1011AD318;
  v5[4] = self;
  v5[5] = &v6;
  geo_isolate_sync(observersIsolator, v5);
  v3 = (id)v7[5];
  _Block_object_dispose(&v6, 8);

  return v3;
}

- (void)addObserver:(id)a3
{
  id v4;
  id v5;

  v4 = a3;
  v5 = (id)objc_claimAutoreleasedReturnValue(-[UGCPhotoAttributionPreferencesManager observers](self, "observers"));
  objc_msgSend(v5, "registerObserver:", v4);

}

- (void)removeObserver:(id)a3
{
  id v4;
  id v5;

  v4 = a3;
  v5 = (id)objc_claimAutoreleasedReturnValue(-[UGCPhotoAttributionPreferencesManager observers](self, "observers"));
  objc_msgSend(v5, "unregisterObserver:", v4);

}

- (GEORPPhotoAttributionPreferences)fetchedPreferences
{
  return self->_fetchedPreferences;
}

- (void)setFetchedPreferences:(id)a3
{
  objc_storeStrong((id *)&self->_fetchedPreferences, a3);
}

- (NSDate)dateOfFetchedPreferences
{
  return self->_dateOfFetchedPreferences;
}

- (void)setDateOfFetchedPreferences:(id)a3
{
  objc_storeStrong((id *)&self->_dateOfFetchedPreferences, a3);
}

- (NSString)updateError
{
  return self->_updateError;
}

- (void)setUpdateError:(id)a3
{
  objc_setProperty_nonatomic_copy(self, a2, a3, 56);
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_updateError, 0);
  objc_storeStrong((id *)&self->_dateOfFetchedPreferences, 0);
  objc_storeStrong((id *)&self->_fetchedPreferences, 0);
  objc_storeStrong((id *)&self->_observersIsolator, 0);
  objc_storeStrong((id *)&self->_workQueue, 0);
  objc_storeStrong((id *)&self->_observers, 0);
  objc_storeStrong((id *)&self->_ticket, 0);
}

@end
