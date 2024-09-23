@implementation CLHLocationClassifier

- (int64_t)loiTypeForLocation:(id)a3
{
  unint64_t v5;
  NSObject *v6;
  NSUInteger v7;
  NSUInteger v8;
  NSUInteger v9;
  NSUInteger v10;
  NSArray *homeLocations;
  id v12;
  id v13;
  uint64_t v14;
  void *i;
  NSArray *workLocations;
  id v17;
  id v18;
  uint64_t v19;
  int64_t v20;
  uint64_t v21;
  NSArray *schoolLocations;
  id v23;
  id v24;
  uint64_t v25;
  uint64_t v26;
  NSArray *gymLocations;
  id v28;
  id v29;
  uint64_t v30;
  void *j;
  __int128 v33;
  __int128 v34;
  __int128 v35;
  __int128 v36;
  __int128 v37;
  __int128 v38;
  __int128 v39;
  __int128 v40;
  __int128 v41;
  __int128 v42;
  __int128 v43;
  __int128 v44;
  __int128 v45;
  __int128 v46;
  __int128 v47;
  __int128 v48;
  _BYTE v49[128];
  _BYTE v50[128];
  _BYTE v51[128];
  _BYTE v52[128];
  uint64_t buf;
  __int16 v54;
  const char *v55;
  __int16 v56;
  NSUInteger v57;
  __int16 v58;
  NSUInteger v59;
  __int16 v60;
  NSUInteger v61;
  __int16 v62;
  NSUInteger v63;

  -[CLHLocationClassifier fetchLocationsOfInterestIfPossibleWithCompletionHandler:](self, "fetchLocationsOfInterestIfPossibleWithCompletionHandler:", &stru_1021B0B18);
  HIDWORD(v5) = -286331153 * rand() + 143165576;
  LODWORD(v5) = HIDWORD(v5);
  if ((v5 >> 1) <= 0x8888888)
  {
    if (qword_1022A0200 != -1)
      dispatch_once(&qword_1022A0200, &stru_1021B0B38);
    v6 = qword_1022A0208;
    if (os_log_type_enabled((os_log_t)qword_1022A0208, OS_LOG_TYPE_DEFAULT))
    {
      v7 = -[NSArray count](self->_homeLocations, "count");
      v8 = -[NSArray count](self->_workLocations, "count");
      v9 = -[NSArray count](self->_schoolLocations, "count");
      v10 = -[NSArray count](self->_gymLocations, "count");
      buf = 68290050;
      v54 = 2082;
      v55 = "";
      v56 = 2050;
      v57 = v7;
      v58 = 2050;
      v59 = v8;
      v60 = 2050;
      v61 = v9;
      v62 = 2050;
      v63 = v10;
      _os_log_impl((void *)&_mh_execute_header, v6, OS_LOG_TYPE_DEFAULT, "{\"msg%{public}.0s\":\"fetched locations of interest\", \"Home\":%{public}ld, \"Work\":%{public}ld, \"School\":%{public}ld, \"Gym\":%{public}ld}", (uint8_t *)&buf, 0x3Au);
    }
  }
  v47 = 0u;
  v48 = 0u;
  v45 = 0u;
  v46 = 0u;
  homeLocations = self->_homeLocations;
  v12 = -[NSArray countByEnumeratingWithState:objects:count:](homeLocations, "countByEnumeratingWithState:objects:count:", &v45, v52, 16);
  if (v12)
  {
    v13 = v12;
    v14 = *(_QWORD *)v46;
    while (2)
    {
      for (i = 0; i != v13; i = (char *)i + 1)
      {
        if (*(_QWORD *)v46 != v14)
          objc_enumerationMutation(homeLocations);
        if (sub_10135F000(*(void **)(*((_QWORD *)&v45 + 1) + 8 * (_QWORD)i), a3))
          return 0;
      }
      v13 = -[NSArray countByEnumeratingWithState:objects:count:](homeLocations, "countByEnumeratingWithState:objects:count:", &v45, v52, 16);
      if (v13)
        continue;
      break;
    }
  }
  v43 = 0u;
  v44 = 0u;
  v41 = 0u;
  v42 = 0u;
  workLocations = self->_workLocations;
  v17 = -[NSArray countByEnumeratingWithState:objects:count:](workLocations, "countByEnumeratingWithState:objects:count:", &v41, v51, 16);
  if (v17)
  {
    v18 = v17;
    v19 = *(_QWORD *)v42;
    v20 = 1;
LABEL_16:
    v21 = 0;
    while (1)
    {
      if (*(_QWORD *)v42 != v19)
        objc_enumerationMutation(workLocations);
      if (sub_10135F000(*(void **)(*((_QWORD *)&v41 + 1) + 8 * v21), a3))
        break;
      if (v18 == (id)++v21)
      {
        v18 = -[NSArray countByEnumeratingWithState:objects:count:](workLocations, "countByEnumeratingWithState:objects:count:", &v41, v51, 16);
        if (v18)
          goto LABEL_16;
        goto LABEL_22;
      }
    }
  }
  else
  {
LABEL_22:
    v39 = 0u;
    v40 = 0u;
    v37 = 0u;
    v38 = 0u;
    schoolLocations = self->_schoolLocations;
    v23 = -[NSArray countByEnumeratingWithState:objects:count:](schoolLocations, "countByEnumeratingWithState:objects:count:", &v37, v50, 16);
    if (v23)
    {
      v24 = v23;
      v25 = *(_QWORD *)v38;
      v20 = 2;
LABEL_24:
      v26 = 0;
      while (1)
      {
        if (*(_QWORD *)v38 != v25)
          objc_enumerationMutation(schoolLocations);
        if (sub_10135F000(*(void **)(*((_QWORD *)&v37 + 1) + 8 * v26), a3))
          break;
        if (v24 == (id)++v26)
        {
          v24 = -[NSArray countByEnumeratingWithState:objects:count:](schoolLocations, "countByEnumeratingWithState:objects:count:", &v37, v50, 16);
          if (v24)
            goto LABEL_24;
          goto LABEL_30;
        }
      }
    }
    else
    {
LABEL_30:
      v35 = 0u;
      v36 = 0u;
      v33 = 0u;
      v34 = 0u;
      gymLocations = self->_gymLocations;
      v28 = -[NSArray countByEnumeratingWithState:objects:count:](gymLocations, "countByEnumeratingWithState:objects:count:", &v33, v49, 16);
      if (v28)
      {
        v29 = v28;
        v30 = *(_QWORD *)v34;
        while (2)
        {
          for (j = 0; j != v29; j = (char *)j + 1)
          {
            if (*(_QWORD *)v34 != v30)
              objc_enumerationMutation(gymLocations);
            if (sub_10135F000(*(void **)(*((_QWORD *)&v33 + 1) + 8 * (_QWORD)j), a3))
              return 3;
          }
          v29 = -[NSArray countByEnumeratingWithState:objects:count:](gymLocations, "countByEnumeratingWithState:objects:count:", &v33, v49, 16);
          v20 = -1;
          if (v29)
            continue;
          break;
        }
      }
      else
      {
        return -1;
      }
    }
  }
  return v20;
}

- (void)fetchLocationsOfInterestIfPossibleWithCompletionHandler:(id)a3
{
  NSObject *v5;
  uint64_t numFetchesOfLocationsOfInterest;
  CLRoutineMonitorServiceProtocol *routineMonitor;
  CLRoutineMonitorServiceProtocol *v8;
  CLRoutineMonitorServiceProtocol *v9;
  CLRoutineMonitorServiceProtocol *v10;
  NSObject *v11;
  NSObject *v12;
  _QWORD block[7];
  _QWORD v14[6];
  _QWORD v15[6];
  _QWORD v16[6];
  _QWORD v17[6];
  uint8_t buf[8];
  _BYTE v19[24];
  void (*v20)(uint64_t);
  dispatch_group_t v21;

  if (!a3)
    sub_10194EBAC();
  if (-[CLHLocationClassifier shouldFetchLocationsOfInterest](self, "shouldFetchLocationsOfInterest"))
  {
    ++self->_numFetchesOfLocationsOfInterest;
    if (qword_1022A0200 != -1)
      dispatch_once(&qword_1022A0200, &stru_1021B0B38);
    v5 = qword_1022A0208;
    if (os_log_type_enabled((os_log_t)qword_1022A0208, OS_LOG_TYPE_DEFAULT))
    {
      numFetchesOfLocationsOfInterest = self->_numFetchesOfLocationsOfInterest;
      *(_QWORD *)buf = 68289282;
      *(_WORD *)v19 = 2082;
      *(_QWORD *)&v19[2] = "";
      *(_WORD *)&v19[10] = 2050;
      *(_QWORD *)&v19[12] = numFetchesOfLocationsOfInterest;
      _os_log_impl((void *)&_mh_execute_header, v5, OS_LOG_TYPE_DEFAULT, "{\"msg%{public}.0s\":\"Fetching locations of interest\", \"NumFetches\":%{public}ld}", buf, 0x1Cu);
    }
    -[CLHLocationClassifier updateLocationsOfInterestFetchTimestamp](self, "updateLocationsOfInterestFetchTimestamp");
    self->_locationsOfInterestFetchError = 0;
    *(_QWORD *)buf = 0;
    *(_QWORD *)v19 = buf;
    *(_QWORD *)&v19[8] = 0x3052000000;
    *(_QWORD *)&v19[16] = sub_100207348;
    v20 = sub_100207E4C;
    v21 = 0;
    v21 = dispatch_group_create();
    dispatch_group_enter(*(dispatch_group_t *)(*(_QWORD *)v19 + 40));
    routineMonitor = self->_routineMonitor;
    v17[0] = _NSConcreteStackBlock;
    v17[1] = 3221225472;
    v17[2] = sub_10135F1BC;
    v17[3] = &unk_1021B0AF8;
    v17[4] = self;
    v17[5] = buf;
    -[CLRoutineMonitorServiceProtocol fetchLocationsOfInterestOfType:withReply:](routineMonitor, "fetchLocationsOfInterestOfType:withReply:", 0, v17);
    dispatch_group_enter(*(dispatch_group_t *)(*(_QWORD *)v19 + 40));
    v8 = self->_routineMonitor;
    v16[0] = _NSConcreteStackBlock;
    v16[1] = 3221225472;
    v16[2] = sub_10135F398;
    v16[3] = &unk_1021B0AF8;
    v16[4] = self;
    v16[5] = buf;
    -[CLRoutineMonitorServiceProtocol fetchLocationsOfInterestOfType:withReply:](v8, "fetchLocationsOfInterestOfType:withReply:", 1, v16);
    dispatch_group_enter(*(dispatch_group_t *)(*(_QWORD *)v19 + 40));
    v9 = self->_routineMonitor;
    v15[0] = _NSConcreteStackBlock;
    v15[1] = 3221225472;
    v15[2] = sub_10135F574;
    v15[3] = &unk_1021B0AF8;
    v15[4] = self;
    v15[5] = buf;
    -[CLRoutineMonitorServiceProtocol fetchLocationsOfInterestOfType:withReply:](v9, "fetchLocationsOfInterestOfType:withReply:", 2, v15);
    dispatch_group_enter(*(dispatch_group_t *)(*(_QWORD *)v19 + 40));
    v10 = self->_routineMonitor;
    v14[0] = _NSConcreteStackBlock;
    v14[1] = 3221225472;
    v14[2] = sub_10135F750;
    v14[3] = &unk_1021B0AF8;
    v14[4] = self;
    v14[5] = buf;
    -[CLRoutineMonitorServiceProtocol fetchLocationsOfInterestOfType:withReply:](v10, "fetchLocationsOfInterestOfType:withReply:", 3, v14);
    v11 = *(NSObject **)(*(_QWORD *)v19 + 40);
    v12 = objc_msgSend(-[CLIntersiloUniverse silo](self->_universe, "silo"), "queue");
    block[0] = _NSConcreteStackBlock;
    block[1] = 3221225472;
    block[2] = sub_10135F92C;
    block[3] = &unk_102199B28;
    block[4] = self;
    block[5] = a3;
    block[6] = buf;
    dispatch_group_notify(v11, v12, block);
    _Block_object_dispose(buf, 8);
  }
}

- (BOOL)shouldFetchLocationsOfInterest
{
  double v3;
  id v4;
  BOOL v5;

  if (!self->_lastLocationsOfInterestFetchDate)
    return 1;
  -[CLHLocationClassifier getLocationsOfInterestFetchTimeInterval](self, "getLocationsOfInterestFetchTimeInterval");
  v4 = objc_msgSend(objc_alloc((Class)NSDate), "initWithTimeInterval:sinceDate:", self->_lastLocationsOfInterestFetchDate, v3);
  v5 = objc_msgSend(v4, "compare:", +[NSDate date](NSDate, "date")) == (id)-1;

  return v5;
}

- (double)getLocationsOfInterestFetchTimeInterval
{
  double result;

  result = 86400.0;
  if (self->_locationsOfInterestFetchError)
    return 10.0;
  return result;
}

- (CLHLocationClassifier)init
{
  -[CLHLocationClassifier doesNotRecognizeSelector:](self, "doesNotRecognizeSelector:", a2);
  self->_lastLocationsOfInterestFetchDate = 0;
  self->_locationsOfInterestFetchError = 0;
  self->_numConsecutiveFetchErrors = 0;
  self->_numFetchesOfLocationsOfInterest = 0;
  return 0;
}

- (id)initInUniverse:(id)a3
{
  CLHLocationClassifier *v4;
  CLRoutineMonitorServiceProtocol *v5;
  objc_super v7;

  v7.receiver = self;
  v7.super_class = (Class)CLHLocationClassifier;
  v4 = -[CLHLocationClassifier init](&v7, "init");
  if (v4)
  {
    v4->_universe = (CLIntersiloUniverse *)a3;
    -[CLHLocationClassifier setValid:](v4, "setValid:", 1);
    v5 = (CLRoutineMonitorServiceProtocol *)objc_msgSend(objc_msgSend(a3, "vendor"), "proxyForService:", CFSTR("CLRoutineMonitor"));
    v4->_routineMonitor = v5;
    -[CLRoutineMonitorServiceProtocol registerDelegate:inSilo:](v5, "registerDelegate:inSilo:", v4, objc_msgSend(a3, "silo"));
    -[CLRoutineMonitorServiceProtocol setDelegateEntityName:](v4->_routineMonitor, "setDelegateEntityName:", "CLHLocationClassifier");
  }
  return v4;
}

- (void)updateLocationsOfInterestFetchTimestamp
{
  NSDate *lastLocationsOfInterestFetchDate;

  lastLocationsOfInterestFetchDate = self->_lastLocationsOfInterestFetchDate;
  if (lastLocationsOfInterestFetchDate)
  {

    self->_lastLocationsOfInterestFetchDate = 0;
  }
  self->_lastLocationsOfInterestFetchDate = (NSDate *)objc_alloc_init((Class)NSDate);
}

- (void)dealloc
{
  NSDate *lastLocationsOfInterestFetchDate;
  objc_super v4;

  lastLocationsOfInterestFetchDate = self->_lastLocationsOfInterestFetchDate;
  if (lastLocationsOfInterestFetchDate)
  {

    self->_lastLocationsOfInterestFetchDate = 0;
  }
  v4.receiver = self;
  v4.super_class = (Class)CLHLocationClassifier;
  -[CLHLocationClassifier dealloc](&v4, "dealloc");
}

- (id)jsonObject
{
  id v3;
  NSArray *homeLocations;
  id v5;
  id v6;
  uint64_t v7;
  void *i;
  id v9;
  NSArray *workLocations;
  id v11;
  id v12;
  uint64_t v13;
  void *j;
  id v15;
  NSArray *schoolLocations;
  id v17;
  id v18;
  uint64_t v19;
  void *k;
  id v21;
  NSArray *gymLocations;
  id v23;
  id v24;
  uint64_t v25;
  void *m;
  NSDictionary *v27;
  __int128 v29;
  __int128 v30;
  __int128 v31;
  __int128 v32;
  __int128 v33;
  __int128 v34;
  __int128 v35;
  __int128 v36;
  __int128 v37;
  __int128 v38;
  __int128 v39;
  __int128 v40;
  __int128 v41;
  __int128 v42;
  __int128 v43;
  __int128 v44;
  _QWORD v45[4];
  _QWORD v46[4];
  _BYTE v47[128];
  _BYTE v48[128];
  _BYTE v49[128];
  _BYTE v50[128];

  v3 = objc_alloc_init((Class)NSMutableArray);
  v41 = 0u;
  v42 = 0u;
  v43 = 0u;
  v44 = 0u;
  homeLocations = self->_homeLocations;
  v5 = -[NSArray countByEnumeratingWithState:objects:count:](homeLocations, "countByEnumeratingWithState:objects:count:", &v41, v50, 16);
  if (v5)
  {
    v6 = v5;
    v7 = *(_QWORD *)v42;
    do
    {
      for (i = 0; i != v6; i = (char *)i + 1)
      {
        if (*(_QWORD *)v42 != v7)
          objc_enumerationMutation(homeLocations);
        objc_msgSend(v3, "addObject:", sub_10135FF60(*(void **)(*((_QWORD *)&v41 + 1) + 8 * (_QWORD)i)));
      }
      v6 = -[NSArray countByEnumeratingWithState:objects:count:](homeLocations, "countByEnumeratingWithState:objects:count:", &v41, v50, 16);
    }
    while (v6);
  }
  v9 = objc_alloc_init((Class)NSMutableArray);
  v37 = 0u;
  v38 = 0u;
  v39 = 0u;
  v40 = 0u;
  workLocations = self->_workLocations;
  v11 = -[NSArray countByEnumeratingWithState:objects:count:](workLocations, "countByEnumeratingWithState:objects:count:", &v37, v49, 16);
  if (v11)
  {
    v12 = v11;
    v13 = *(_QWORD *)v38;
    do
    {
      for (j = 0; j != v12; j = (char *)j + 1)
      {
        if (*(_QWORD *)v38 != v13)
          objc_enumerationMutation(workLocations);
        objc_msgSend(v9, "addObject:", sub_10135FF60(*(void **)(*((_QWORD *)&v37 + 1) + 8 * (_QWORD)j)));
      }
      v12 = -[NSArray countByEnumeratingWithState:objects:count:](workLocations, "countByEnumeratingWithState:objects:count:", &v37, v49, 16);
    }
    while (v12);
  }
  v15 = objc_alloc_init((Class)NSMutableArray);
  v33 = 0u;
  v34 = 0u;
  v35 = 0u;
  v36 = 0u;
  schoolLocations = self->_schoolLocations;
  v17 = -[NSArray countByEnumeratingWithState:objects:count:](schoolLocations, "countByEnumeratingWithState:objects:count:", &v33, v48, 16);
  if (v17)
  {
    v18 = v17;
    v19 = *(_QWORD *)v34;
    do
    {
      for (k = 0; k != v18; k = (char *)k + 1)
      {
        if (*(_QWORD *)v34 != v19)
          objc_enumerationMutation(schoolLocations);
        objc_msgSend(v15, "addObject:", sub_10135FF60(*(void **)(*((_QWORD *)&v33 + 1) + 8 * (_QWORD)k)));
      }
      v18 = -[NSArray countByEnumeratingWithState:objects:count:](schoolLocations, "countByEnumeratingWithState:objects:count:", &v33, v48, 16);
    }
    while (v18);
  }
  v21 = objc_alloc_init((Class)NSMutableArray);
  v29 = 0u;
  v30 = 0u;
  v31 = 0u;
  v32 = 0u;
  gymLocations = self->_gymLocations;
  v23 = -[NSArray countByEnumeratingWithState:objects:count:](gymLocations, "countByEnumeratingWithState:objects:count:", &v29, v47, 16);
  if (v23)
  {
    v24 = v23;
    v25 = *(_QWORD *)v30;
    do
    {
      for (m = 0; m != v24; m = (char *)m + 1)
      {
        if (*(_QWORD *)v30 != v25)
          objc_enumerationMutation(gymLocations);
        objc_msgSend(v21, "addObject:", sub_10135FF60(*(void **)(*((_QWORD *)&v29 + 1) + 8 * (_QWORD)m)));
      }
      v24 = -[NSArray countByEnumeratingWithState:objects:count:](gymLocations, "countByEnumeratingWithState:objects:count:", &v29, v47, 16);
    }
    while (v24);
  }
  v45[0] = CFSTR("home");
  v45[1] = CFSTR("work");
  v46[0] = v3;
  v46[1] = v9;
  v45[2] = CFSTR("school");
  v45[3] = CFSTR("gym");
  v46[2] = v15;
  v46[3] = v21;
  v27 = +[NSDictionary dictionaryWithObjects:forKeys:count:](NSDictionary, "dictionaryWithObjects:forKeys:count:", v46, v45, 4);

  return v27;
}

- (BOOL)valid
{
  return self->valid;
}

- (void)setValid:(BOOL)a3
{
  self->valid = a3;
}

- (NSArray)homeLocations
{
  return self->_homeLocations;
}

- (void)setHomeLocations:(id)a3
{
  objc_setProperty_nonatomic(self, a2, a3, 48);
}

- (NSArray)workLocations
{
  return self->_workLocations;
}

- (void)setWorkLocations:(id)a3
{
  objc_setProperty_nonatomic(self, a2, a3, 56);
}

- (NSArray)schoolLocations
{
  return self->_schoolLocations;
}

- (void)setSchoolLocations:(id)a3
{
  objc_setProperty_nonatomic(self, a2, a3, 64);
}

- (NSArray)gymLocations
{
  return self->_gymLocations;
}

- (void)setGymLocations:(id)a3
{
  objc_setProperty_nonatomic(self, a2, a3, 72);
}

@end
