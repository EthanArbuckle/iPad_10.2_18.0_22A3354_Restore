@implementation SharedTripSuggestionsCache

+ (id)sharedInstance
{
  _QWORD block[5];

  block[0] = _NSConcreteStackBlock;
  block[1] = 3221225472;
  block[2] = sub_100C557AC;
  block[3] = &unk_1011ACF48;
  block[4] = a1;
  if (qword_1014D4598 != -1)
    dispatch_once(&qword_1014D4598, block);
  return (id)qword_1014D4590;
}

- (SharedTripSuggestionsCache)init
{
  SharedTripSuggestionsCache *v2;
  SharedTripSuggestionsCache *v3;
  dispatch_queue_attr_t v4;
  NSObject *v5;
  dispatch_queue_t v6;
  OS_dispatch_queue *requestQueue;
  GEOObserverHashTable *v8;
  GEOObserverHashTable *observers;
  objc_super v11;

  v11.receiver = self;
  v11.super_class = (Class)SharedTripSuggestionsCache;
  v2 = -[SharedTripSuggestionsCache init](&v11, "init");
  v3 = v2;
  if (v2)
  {
    v2->_lock._os_unfair_lock_opaque = 0;
    v4 = dispatch_queue_attr_make_with_autorelease_frequency(0, DISPATCH_AUTORELEASE_FREQUENCY_WORK_ITEM);
    v5 = objc_claimAutoreleasedReturnValue(v4);
    v6 = dispatch_queue_create("com.apple.Maps.SharedTrip.SuggestionsCache.Requests", v5);
    requestQueue = v3->_requestQueue;
    v3->_requestQueue = (OS_dispatch_queue *)v6;

    v8 = (GEOObserverHashTable *)objc_msgSend(objc_alloc((Class)GEOObserverHashTable), "initWithProtocol:queue:", &OBJC_PROTOCOL___SharedTripSuggestionsCacheObserver, &_dispatch_main_q);
    observers = v3->_observers;
    v3->_observers = v8;

  }
  return v3;
}

- (void)_prepareForSuggestionsIfNeeded
{
  id v3;
  NSObject *v4;
  _PSMapsSuggester *v5;
  _PSMapsSuggester *suggester;
  _PSMapsPredictionContext *v7;
  _PSMapsPredictionContext *predictionContext;
  uint8_t v9[16];

  dispatch_assert_queue_V2((dispatch_queue_t)self->_requestQueue);
  if (!self->_suggester || !self->_predictionContext)
  {
    v3 = sub_10043237C();
    v4 = objc_claimAutoreleasedReturnValue(v3);
    if (os_log_type_enabled(v4, OS_LOG_TYPE_DEBUG))
    {
      *(_WORD *)v9 = 0;
      _os_log_impl((void *)&_mh_execute_header, v4, OS_LOG_TYPE_DEBUG, "SharedTripSuggestionsCache instantiating suggester and context", v9, 2u);
    }

    v5 = (_PSMapsSuggester *)objc_alloc_init((Class)_PSMapsSuggester);
    suggester = self->_suggester;
    self->_suggester = v5;

    v7 = (_PSMapsPredictionContext *)objc_alloc_init((Class)_PSMapsPredictionContext);
    predictionContext = self->_predictionContext;
    self->_predictionContext = v7;

    -[_PSMapsPredictionContext setBundleID:](self->_predictionContext, "setBundleID:", MapsAppBundleId);
  }
}

- (id)suggestions
{
  os_unfair_lock_s *p_lock;
  NSArray *v4;

  p_lock = &self->_lock;
  os_unfair_lock_lock(&self->_lock);
  v4 = self->_suggestions;
  os_unfair_lock_unlock(p_lock);
  return v4;
}

- (NSArray)suggestedContacts
{
  os_unfair_lock_s *p_lock;
  NSArray *v4;

  p_lock = &self->_lock;
  os_unfair_lock_lock(&self->_lock);
  v4 = self->_suggestedContacts;
  os_unfair_lock_unlock(p_lock);
  return v4;
}

- (NSDictionary)recipientsByHandle
{
  os_unfair_lock_s *p_lock;
  NSDictionary *v4;

  p_lock = &self->_lock;
  os_unfair_lock_lock(&self->_lock);
  v4 = self->_recipientsByHandle;
  os_unfair_lock_unlock(p_lock);
  return v4;
}

- (void)addObserver:(id)a3
{
  id v4;
  id v5;
  NSObject *v6;
  id v7;
  void *v8;
  objc_class *v9;
  NSString *v10;
  void *v11;
  void *v12;
  void *v13;
  __CFString *v14;
  uint8_t buf[4];
  __CFString *v16;

  v4 = a3;
  v5 = sub_10043237C();
  v6 = objc_claimAutoreleasedReturnValue(v5);
  if (os_log_type_enabled(v6, OS_LOG_TYPE_DEBUG))
  {
    v7 = v4;
    v8 = v7;
    if (!v7)
    {
      v14 = CFSTR("<nil>");
      goto LABEL_10;
    }
    v9 = (objc_class *)objc_opt_class(v7);
    v10 = NSStringFromClass(v9);
    v11 = (void *)objc_claimAutoreleasedReturnValue(v10);
    if ((objc_opt_respondsToSelector(v8, "accessibilityIdentifier") & 1) != 0)
    {
      v12 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v8, "performSelector:", "accessibilityIdentifier"));
      v13 = v12;
      if (v12 && !objc_msgSend(v12, "isEqualToString:", v11))
      {
        v14 = (__CFString *)objc_claimAutoreleasedReturnValue(+[NSString stringWithFormat:](NSString, "stringWithFormat:", CFSTR("%@<%p, %@>"), v11, v8, v13));

        goto LABEL_8;
      }

    }
    v14 = (__CFString *)objc_claimAutoreleasedReturnValue(+[NSString stringWithFormat:](NSString, "stringWithFormat:", CFSTR("%@<%p>"), v11, v8));
LABEL_8:

LABEL_10:
    *(_DWORD *)buf = 138412290;
    v16 = v14;
    _os_log_impl((void *)&_mh_execute_header, v6, OS_LOG_TYPE_DEBUG, "SharedTripSuggestionsCache add observer: %@", buf, 0xCu);

  }
  -[GEOObserverHashTable registerObserver:](self->_observers, "registerObserver:", v4);

}

- (void)removeObserver:(id)a3
{
  id v4;
  id v5;
  NSObject *v6;
  id v7;
  void *v8;
  objc_class *v9;
  NSString *v10;
  void *v11;
  void *v12;
  void *v13;
  __CFString *v14;
  uint8_t buf[4];
  __CFString *v16;

  v4 = a3;
  v5 = sub_10043237C();
  v6 = objc_claimAutoreleasedReturnValue(v5);
  if (os_log_type_enabled(v6, OS_LOG_TYPE_DEBUG))
  {
    v7 = v4;
    v8 = v7;
    if (!v7)
    {
      v14 = CFSTR("<nil>");
      goto LABEL_10;
    }
    v9 = (objc_class *)objc_opt_class(v7);
    v10 = NSStringFromClass(v9);
    v11 = (void *)objc_claimAutoreleasedReturnValue(v10);
    if ((objc_opt_respondsToSelector(v8, "accessibilityIdentifier") & 1) != 0)
    {
      v12 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v8, "performSelector:", "accessibilityIdentifier"));
      v13 = v12;
      if (v12 && !objc_msgSend(v12, "isEqualToString:", v11))
      {
        v14 = (__CFString *)objc_claimAutoreleasedReturnValue(+[NSString stringWithFormat:](NSString, "stringWithFormat:", CFSTR("%@<%p, %@>"), v11, v8, v13));

        goto LABEL_8;
      }

    }
    v14 = (__CFString *)objc_claimAutoreleasedReturnValue(+[NSString stringWithFormat:](NSString, "stringWithFormat:", CFSTR("%@<%p>"), v11, v8));
LABEL_8:

LABEL_10:
    *(_DWORD *)buf = 138412290;
    v16 = v14;
    _os_log_impl((void *)&_mh_execute_header, v6, OS_LOG_TYPE_DEBUG, "SharedTripSuggestionsCache remove observer: %@", buf, 0xCu);

  }
  -[GEOObserverHashTable unregisterObserver:](self->_observers, "unregisterObserver:", v4);

}

- (BOOL)isRefreshing
{
  SharedTripSuggestionsCache *v2;
  os_unfair_lock_s *p_lock;

  v2 = self;
  p_lock = &self->_lock;
  os_unfair_lock_lock(&self->_lock);
  LOBYTE(v2) = v2->_requestInProgress;
  os_unfair_lock_unlock(p_lock);
  return (char)v2;
}

- (void)requestFreshSuggestions
{
  -[SharedTripSuggestionsCache requestFreshSuggestionsWithSeedContacts:](self, "requestFreshSuggestionsWithSeedContacts:", 0);
}

- (void)requestFreshSuggestionsWithSeedContacts:(id)a3
{
  id v4;
  _BOOL4 requestInProgress;
  NSDate *v6;
  double v7;
  double v8;
  double Double;
  NSObject *requestQueue;
  double v11;
  id v12;
  NSObject *v13;
  _QWORD v14[4];
  id v15;
  id v16;
  int location;
  double location_4;

  v4 = a3;
  os_unfair_lock_lock(&self->_lock);
  requestInProgress = self->_requestInProgress;
  v6 = self->_lastFreshRequestDate;
  os_unfair_lock_unlock(&self->_lock);
  if (!requestInProgress)
  {
    if (v6
      && (-[NSDate timeIntervalSinceNow](v6, "timeIntervalSinceNow"),
          v8 = fabs(v7),
          Double = GEOConfigGetDouble(MapsConfig_PeopleSuggesterMinimumInterval, off_1014B3778),
          v8 < Double))
    {
      v11 = Double;
      v12 = sub_10043237C();
      v13 = objc_claimAutoreleasedReturnValue(v12);
      if (os_log_type_enabled(v13, OS_LOG_TYPE_DEBUG))
      {
        location = 134217984;
        location_4 = v11 - v8;
        _os_log_impl((void *)&_mh_execute_header, v13, OS_LOG_TYPE_DEBUG, "SharedTripSuggestionsCache ignoring request for fresh suggestions, %fs until permitted", (uint8_t *)&location, 0xCu);
      }

    }
    else
    {
      os_unfair_lock_lock(&self->_lock);
      self->_requestInProgress = 1;
      os_unfair_lock_unlock(&self->_lock);
      objc_initWeak((id *)&location, self);
      requestQueue = self->_requestQueue;
      v14[0] = _NSConcreteStackBlock;
      v14[1] = 3221225472;
      v14[2] = sub_100C55F28;
      v14[3] = &unk_1011AD1E8;
      objc_copyWeak(&v16, (id *)&location);
      v15 = v4;
      dispatch_async(requestQueue, v14);

      objc_destroyWeak(&v16);
      objc_destroyWeak((id *)&location);
    }
  }

}

- (void)_refreshFreshSuggestions:(id)a3
{
  id v4;
  void *v5;
  id v6;
  uint64_t v7;
  uint64_t UInteger;
  id v9;
  NSObject *v10;
  void *v11;
  void *v12;
  id v13;
  NSObject *v14;
  id v15;
  void *v16;
  void *v17;
  void *v18;
  id v19;
  id v20;
  id v21;
  uint64_t v22;
  void *i;
  void *v24;
  void *v25;
  void *v26;
  void *v27;
  void *v28;
  uint64_t v29;
  void *v30;
  id v31;
  void *v32;
  void *v33;
  id v34;
  id v35;
  id v36;
  void *v37;
  void *v38;
  id v39;
  NSObject *v40;
  NSObject *v41;
  const char *v42;
  id v43;
  void *v44;
  id v45;
  NSObject *v46;
  uint64_t v47;
  NSDate *lastFreshRequestDate;
  NSArray *v49;
  NSArray *suggestedContacts;
  NSDictionary *v51;
  NSDictionary *recipientsByHandle;
  id v53;
  unint64_t v54;
  void *v55;
  id v56;
  NSObject *v57;
  id v58;
  id v59;
  void *v60;
  id obj;
  SharedTripSuggestionsCache *v62;
  void *v63;
  void *v64;
  id v65;
  id v66;
  _QWORD v67[4];
  id v68;
  __int128 v69;
  __int128 v70;
  __int128 v71;
  __int128 v72;
  uint8_t v73[128];
  uint8_t buf[4];
  uint64_t v75;
  __int16 v76;
  id v77;

  v4 = a3;
  dispatch_assert_queue_V2((dispatch_queue_t)self->_requestQueue);
  -[GEOObserverHashTable suggestionsWillUpdateInCache:](self->_observers, "suggestionsWillUpdateInCache:", self);
  -[SharedTripSuggestionsCache _prepareForSuggestionsIfNeeded](self, "_prepareForSuggestionsIfNeeded");
  v5 = (void *)objc_claimAutoreleasedReturnValue(+[NSDate date](NSDate, "date"));
  -[_PSMapsPredictionContext setSuggestionDate:](self->_predictionContext, "setSuggestionDate:", v5);

  v6 = sub_10039DCD4(v4, &stru_1011EA258);
  v7 = objc_claimAutoreleasedReturnValue(v6);
  v63 = v4;
  if (v4)
    -[_PSMapsPredictionContext setSeedContactIdentifiers:](self->_predictionContext, "setSeedContactIdentifiers:", v7);
  v64 = (void *)v7;
  v66 = objc_alloc_init((Class)NSMutableDictionary);
  v65 = objc_alloc_init((Class)NSMutableArray);
  UInteger = GEOConfigGetUInteger(MapsConfig_SharedTripMaximumNumberOfSuggestionsFromPeopleSuggester, off_1014B5618);
  v9 = sub_10043237C();
  v10 = objc_claimAutoreleasedReturnValue(v9);
  if (os_log_type_enabled(v10, OS_LOG_TYPE_INFO))
  {
    v11 = (void *)objc_claimAutoreleasedReturnValue(-[_PSMapsPredictionContext seedContactIdentifiers](self->_predictionContext, "seedContactIdentifiers"));
    *(_DWORD *)buf = 134218242;
    v75 = UInteger;
    v76 = 2112;
    v77 = v11;
    _os_log_impl((void *)&_mh_execute_header, v10, OS_LOG_TYPE_INFO, "SharedTripSuggestionsCache starting to fetch max %lu suggestions with seed contacts: %@", buf, 0x16u);

  }
  v62 = self;
  v12 = (void *)objc_claimAutoreleasedReturnValue(-[_PSMapsSuggester suggestionsFromContext:maxSuggestions:](self->_suggester, "suggestionsFromContext:maxSuggestions:", self->_predictionContext, UInteger));
  v13 = sub_10043237C();
  v14 = objc_claimAutoreleasedReturnValue(v13);
  if (os_log_type_enabled(v14, OS_LOG_TYPE_INFO))
  {
    v15 = objc_msgSend(v12, "count");
    *(_DWORD *)buf = 134218242;
    v75 = (uint64_t)v15;
    v76 = 2112;
    v77 = v12;
    _os_log_impl((void *)&_mh_execute_header, v14, OS_LOG_TYPE_INFO, "SharedTripSuggestionsCache %lu fetched suggestions: %@", buf, 0x16u);
  }

  v16 = (void *)objc_claimAutoreleasedReturnValue(+[MSPSharedTripService sharedInstance](MSPSharedTripService, "sharedInstance"));
  v17 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v16, "sharingIdentity"));
  v18 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v17, "aliases"));

  v71 = 0u;
  v72 = 0u;
  v69 = 0u;
  v70 = 0u;
  obj = v12;
  v19 = v12;
  v20 = objc_msgSend(v19, "countByEnumeratingWithState:objects:count:", &v69, v73, 16);
  if (v20)
  {
    v21 = v20;
    v22 = *(_QWORD *)v70;
    do
    {
      for (i = 0; i != v21; i = (char *)i + 1)
      {
        if (*(_QWORD *)v70 != v22)
          objc_enumerationMutation(v19);
        v24 = *(void **)(*((_QWORD *)&v69 + 1) + 8 * (_QWORD)i);
        v25 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v24, "groupName", obj));

        if (!v25)
        {
          v26 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v24, "recipients"));
          v27 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v26, "firstObject"));

          v28 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v27, "handle"));
          v29 = objc_msgSend(v18, "containsObject:", v28);

          if ((v29 & 1) == 0)
          {
            v30 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v27, "handle"));

            if (v30)
            {
              v31 = objc_alloc((Class)MSPSharedTripContact);
              v32 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v27, "contact"));
              v33 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v27, "handle"));
              v34 = objc_msgSend(v31, "initWithContact:handle:", v32, v33);

              goto LABEL_23;
            }
            v67[0] = _NSConcreteStackBlock;
            v67[1] = 3221225472;
            v67[2] = sub_100C5669C;
            v67[3] = &unk_1011EA280;
            v35 = v27;
            v68 = v35;
            v36 = objc_msgSend(v64, "indexOfObjectWithOptions:passingTest:", 2, v67);
            if (v36 == (id)0x7FFFFFFFFFFFFFFFLL)
            {
              v37 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v35, "contact"));
              v38 = (void *)objc_claimAutoreleasedReturnValue(+[MSPSharedTripContact contactsFromCNContact:](MSPSharedTripContact, "contactsFromCNContact:", v37));
              v34 = (id)objc_claimAutoreleasedReturnValue(objc_msgSend(v38, "firstObject"));

              v39 = sub_10043237C();
              v40 = objc_claimAutoreleasedReturnValue(v39);
              if (os_log_type_enabled(v40, OS_LOG_TYPE_INFO))
              {
                *(_DWORD *)buf = 138412290;
                v75 = (uint64_t)v34;
                v41 = v40;
                v42 = "Recipient suggestion did not come with a handle; using first handle in contact page: %@";
                goto LABEL_21;
              }
            }
            else
            {
              v34 = (id)objc_claimAutoreleasedReturnValue(objc_msgSend(v63, "objectAtIndex:", v36));
              v43 = sub_10043237C();
              v40 = objc_claimAutoreleasedReturnValue(v43);
              if (os_log_type_enabled(v40, OS_LOG_TYPE_INFO))
              {
                *(_DWORD *)buf = 138412290;
                v75 = (uint64_t)v34;
                v41 = v40;
                v42 = "Recipient suggestion did not come with a handle; using last seeded contact: %@";
LABEL_21:
                _os_log_impl((void *)&_mh_execute_header, v41, OS_LOG_TYPE_INFO, v42, buf, 0xCu);
              }
            }

            v32 = v68;
LABEL_23:

            if (v34)
            {
              objc_msgSend(v65, "addObject:", v34);
              v44 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v34, "handleForIDS"));
              objc_msgSend(v66, "setObject:forKeyedSubscript:", v27, v44);

            }
          }

          continue;
        }
      }
      v21 = objc_msgSend(v19, "countByEnumeratingWithState:objects:count:", &v69, v73, 16);
    }
    while (v21);
  }

  v45 = sub_10043237C();
  v46 = objc_claimAutoreleasedReturnValue(v45);
  if (os_log_type_enabled(v46, OS_LOG_TYPE_INFO))
  {
    *(_DWORD *)buf = 138412290;
    v75 = (uint64_t)v65;
    _os_log_impl((void *)&_mh_execute_header, v46, OS_LOG_TYPE_INFO, "SharedTripSuggestionsCache resolved suggested contacts: %@", buf, 0xCu);
  }

  os_unfair_lock_lock(&v62->_lock);
  v47 = objc_claimAutoreleasedReturnValue(+[NSDate date](NSDate, "date"));
  lastFreshRequestDate = v62->_lastFreshRequestDate;
  v62->_lastFreshRequestDate = (NSDate *)v47;

  objc_storeStrong((id *)&v62->_suggestions, obj);
  v49 = (NSArray *)objc_msgSend(v65, "copy");
  suggestedContacts = v62->_suggestedContacts;
  v62->_suggestedContacts = v49;

  v51 = (NSDictionary *)objc_msgSend(v66, "copy");
  recipientsByHandle = v62->_recipientsByHandle;
  v62->_recipientsByHandle = v51;

  v62->_requestInProgress = 0;
  os_unfair_lock_unlock(&v62->_lock);
  v53 = v65;
  v54 = GEOConfigGetUInteger(MapsConfig_SharedTripMaximumNumberOfContactsToPrefetch, off_1014B55F8);
  v55 = v53;
  if ((unint64_t)objc_msgSend(v53, "count") > v54)
  {
    v55 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v53, "subarrayWithRange:", 0, v54));

  }
  v56 = sub_10043237C();
  v57 = objc_claimAutoreleasedReturnValue(v56);
  if (os_log_type_enabled(v57, OS_LOG_TYPE_INFO))
  {
    v58 = objc_msgSend(v55, "count");
    v59 = objc_msgSend(v53, "count");
    *(_DWORD *)buf = 134218240;
    v75 = (uint64_t)v58;
    v76 = 2048;
    v77 = v59;
    _os_log_impl((void *)&_mh_execute_header, v57, OS_LOG_TYPE_INFO, "SharedTripSuggestionsCache will request capabilities for %lu/%lu fetched suggestions", buf, 0x16u);
  }

  v60 = (void *)objc_claimAutoreleasedReturnValue(+[MSPSharedTripCapabilityLevelFetcher sharedFetcher](MSPSharedTripCapabilityLevelFetcher, "sharedFetcher"));
  objc_msgSend(v60, "requestCapabilityLevelsForContacts:", v55);

  -[GEOObserverHashTable suggestionsDidUpdateInCache:](v62->_observers, "suggestionsDidUpdateInCache:", v62);
}

- (void)provideFeedbackForContact:(id)a3
{
  id v4;
  NSObject *requestQueue;
  id v6;
  _QWORD block[4];
  id v8;
  id v9;
  id location;

  v4 = a3;
  dispatch_assert_queue_not_V2((dispatch_queue_t)self->_requestQueue);
  objc_initWeak(&location, self);
  requestQueue = self->_requestQueue;
  block[0] = _NSConcreteStackBlock;
  block[1] = 3221225472;
  block[2] = sub_100C567C4;
  block[3] = &unk_1011AD1E8;
  objc_copyWeak(&v9, &location);
  v8 = v4;
  v6 = v4;
  dispatch_async(requestQueue, block);

  objc_destroyWeak(&v9);
  objc_destroyWeak(&location);
}

- (void)_provideFeedbackForContact:(id)a3
{
  id v4;
  NSDictionary *recipientsByHandle;
  void *v6;
  void *v7;
  id v8;
  NSObject *v9;
  _BOOL4 v10;
  void *v11;
  void *v12;
  void *v13;
  uint64_t v14;
  void *v15;
  id v16;
  int v17;
  id v18;

  v4 = a3;
  dispatch_assert_queue_V2((dispatch_queue_t)self->_requestQueue);
  recipientsByHandle = self->_recipientsByHandle;
  v6 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v4, "handleForIDS"));
  v7 = (void *)objc_claimAutoreleasedReturnValue(-[NSDictionary objectForKeyedSubscript:](recipientsByHandle, "objectForKeyedSubscript:", v6));

  v8 = sub_10043237C();
  v9 = objc_claimAutoreleasedReturnValue(v8);
  v10 = os_log_type_enabled(v9, OS_LOG_TYPE_DEBUG);
  if (v7)
  {
    if (v10)
    {
      v17 = 138412290;
      v18 = v7;
      _os_log_impl((void *)&_mh_execute_header, v9, OS_LOG_TYPE_DEBUG, "SharedTripSuggestionsCache providing feedback: engagement with suggestion %@", (uint8_t *)&v17, 0xCu);
    }

    v11 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v7, "contact"));
    v12 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v11, "identifier"));
    v13 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v7, "handle"));
    v14 = objc_claimAutoreleasedReturnValue(+[_PSMapsFeedbackAction engagementWithSuggestionWithContactIdentifier:handle:](_PSMapsFeedbackAction, "engagementWithSuggestionWithContactIdentifier:handle:", v12, v13));
  }
  else
  {
    if (v10)
    {
      v17 = 138412290;
      v18 = v4;
      _os_log_impl((void *)&_mh_execute_header, v9, OS_LOG_TYPE_DEBUG, "SharedTripSuggestionsCache providing feedback: engagement with non suggestion %@", (uint8_t *)&v17, 0xCu);
    }

    v11 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v4, "contact"));
    v12 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v11, "identifier"));
    v13 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v4, "stringValue"));
    v14 = objc_claimAutoreleasedReturnValue(+[_PSMapsFeedbackAction engagementWithNonSuggestionWithContactIdentifier:handle:](_PSMapsFeedbackAction, "engagementWithNonSuggestionWithContactIdentifier:handle:", v12, v13));
  }
  v15 = (void *)v14;

  v16 = objc_msgSend(objc_alloc((Class)_PSMapsFeedback), "initWithFeedbackAction:predictionContext:suggestions:", v15, self->_predictionContext, self->_suggestions);
  -[_PSMapsSuggester provideMapsFeedback:](self->_suggester, "provideMapsFeedback:", v16);

}

- (void)provideAbandonmentFeedback
{
  NSObject *requestQueue;
  _QWORD v4[4];
  id v5;
  id location;

  dispatch_assert_queue_not_V2((dispatch_queue_t)self->_requestQueue);
  objc_initWeak(&location, self);
  requestQueue = self->_requestQueue;
  v4[0] = _NSConcreteStackBlock;
  v4[1] = 3221225472;
  v4[2] = sub_100C56AAC;
  v4[3] = &unk_1011AD260;
  objc_copyWeak(&v5, &location);
  dispatch_async(requestQueue, v4);
  objc_destroyWeak(&v5);
  objc_destroyWeak(&location);
}

- (void)_provideAbandonmentFeedback
{
  id v3;
  NSObject *v4;
  void *v5;
  id v6;
  uint8_t v7[16];

  dispatch_assert_queue_V2((dispatch_queue_t)self->_requestQueue);
  v3 = sub_10043237C();
  v4 = objc_claimAutoreleasedReturnValue(v3);
  if (os_log_type_enabled(v4, OS_LOG_TYPE_DEBUG))
  {
    *(_WORD *)v7 = 0;
    _os_log_impl((void *)&_mh_execute_header, v4, OS_LOG_TYPE_DEBUG, "SharedTripSuggestionsCache providing feedback: abandonment", v7, 2u);
  }

  v5 = (void *)objc_claimAutoreleasedReturnValue(+[_PSMapsFeedbackAction abandonment](_PSMapsFeedbackAction, "abandonment"));
  v6 = objc_msgSend(objc_alloc((Class)_PSMapsFeedback), "initWithFeedbackAction:predictionContext:suggestions:", v5, self->_predictionContext, self->_suggestions);
  -[_PSMapsSuggester provideMapsFeedback:](self->_suggester, "provideMapsFeedback:", v6);

}

- (NSArray)suggestedRecipients
{
  return self->_suggestedRecipients;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_suggestedRecipients, 0);
  objc_storeStrong((id *)&self->_observers, 0);
  objc_storeStrong((id *)&self->_predictionContext, 0);
  objc_storeStrong((id *)&self->_suggester, 0);
  objc_storeStrong((id *)&self->_requestQueue, 0);
  objc_storeStrong((id *)&self->_lastFreshRequestDate, 0);
  objc_storeStrong((id *)&self->_recipientsByHandle, 0);
  objc_storeStrong((id *)&self->_suggestedContacts, 0);
  objc_storeStrong((id *)&self->_suggestions, 0);
}

@end
