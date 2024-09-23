@implementation UserProfileReportHistoryManager

+ (id)sharedInstance
{
  if (qword_1014D31C0 != -1)
    dispatch_once(&qword_1014D31C0, &stru_1011C5CA0);
  return (id)qword_1014D31B8;
}

- (UserProfileReportHistoryManager)init
{
  UserProfileReportHistoryManager *v2;
  void *v3;
  uint64_t v4;
  NSString *countryCode;
  void *v6;
  void *v7;
  objc_super v9;

  v9.receiver = self;
  v9.super_class = (Class)UserProfileReportHistoryManager;
  v2 = -[UserProfileReportHistoryManager init](&v9, "init");
  if (v2)
  {
    v3 = (void *)objc_claimAutoreleasedReturnValue(+[GEOCountryConfiguration sharedConfiguration](GEOCountryConfiguration, "sharedConfiguration"));
    v4 = objc_claimAutoreleasedReturnValue(objc_msgSend(v3, "countryCode"));
    countryCode = v2->_countryCode;
    v2->_countryCode = (NSString *)v4;

    v6 = (void *)objc_claimAutoreleasedReturnValue(+[RAPRecordMapsSync sharedInstance](RAPRecordMapsSync, "sharedInstance"));
    objc_msgSend(v6, "registerObserver:", v2);

    v7 = (void *)objc_claimAutoreleasedReturnValue(+[NSNotificationCenter defaultCenter](NSNotificationCenter, "defaultCenter"));
    objc_msgSend(v7, "addObserver:selector:name:object:", v2, "countryConfigurationDidChange:", GEOCountryConfigurationCountryCodeDidChangeNotification, 0);

    -[UserProfileReportHistoryManager _loadReportsAndIncidents](v2, "_loadReportsAndIncidents");
  }
  return v2;
}

- (GEOObserverHashTable)observers
{
  GEOObserverHashTable *observers;
  GEOObserverHashTable *v4;
  GEOObserverHashTable *v5;

  observers = self->_observers;
  if (!observers)
  {
    v4 = (GEOObserverHashTable *)objc_msgSend(objc_alloc((Class)GEOObserverHashTable), "initWithProtocol:queue:", &OBJC_PROTOCOL___UserProfileReportHistoryManagerObserver, 0);
    v5 = self->_observers;
    self->_observers = v4;

    observers = self->_observers;
  }
  return observers;
}

- (BOOL)inChina
{
  return -[UserProfileReportHistoryManager _isChinaCountryCode:](self, "_isChinaCountryCode:", self->_countryCode);
}

- (BOOL)_inKorea
{
  return -[UserProfileReportHistoryManager _isKoreaCountryCode:](self, "_isKoreaCountryCode:", self->_countryCode);
}

- (BOOL)_isChinaCountryCode:(id)a3
{
  return objc_msgSend(a3, "isEqualToString:", CFSTR("CN"));
}

- (BOOL)_isKoreaCountryCode:(id)a3
{
  return objc_msgSend(a3, "isEqualToString:", CFSTR("KR"));
}

- (BOOL)isChinaUserOutsideOfChina
{
  BOOL v3;
  NSArray *v4;
  id v5;
  id v6;
  uint64_t v7;
  void *i;
  void *v9;
  unsigned __int8 v10;
  __int128 v12;
  __int128 v13;
  __int128 v14;
  __int128 v15;
  _BYTE v16[128];

  if (-[UserProfileReportHistoryManager inChina](self, "inChina"))
    return 0;
  v14 = 0u;
  v15 = 0u;
  v12 = 0u;
  v13 = 0u;
  v4 = self->_allRAPReports;
  v5 = -[NSArray countByEnumeratingWithState:objects:count:](v4, "countByEnumeratingWithState:objects:count:", &v12, v16, 16);
  if (v5)
  {
    v6 = v5;
    v7 = *(_QWORD *)v13;
    while (2)
    {
      for (i = 0; i != v6; i = (char *)i + 1)
      {
        if (*(_QWORD *)v13 != v7)
          objc_enumerationMutation(v4);
        v9 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(*(id *)(*((_QWORD *)&v12 + 1) + 8 * (_QWORD)i), "countryCodeUponCreation", (_QWORD)v12));
        v10 = -[UserProfileReportHistoryManager _isChinaCountryCode:](self, "_isChinaCountryCode:", v9);

        if ((v10 & 1) != 0)
        {
          v3 = 1;
          goto LABEL_13;
        }
      }
      v6 = -[NSArray countByEnumeratingWithState:objects:count:](v4, "countByEnumeratingWithState:objects:count:", &v12, v16, 16);
      if (v6)
        continue;
      break;
    }
  }
  v3 = 0;
LABEL_13:

  return v3;
}

- (BOOL)_shouldShowReportOrIncidentCreatedInCountry:(id)a3
{
  id v4;
  BOOL v5;

  v4 = a3;
  v5 = (!-[UserProfileReportHistoryManager inChina](self, "inChina")
     || -[UserProfileReportHistoryManager _isChinaCountryCode:](self, "_isChinaCountryCode:", v4))
    && (!-[UserProfileReportHistoryManager _inKorea](self, "_inKorea")
     || -[UserProfileReportHistoryManager _isKoreaCountryCode:](self, "_isKoreaCountryCode:", v4))
    && (-[UserProfileReportHistoryManager inChina](self, "inChina")
     || !-[UserProfileReportHistoryManager _isChinaCountryCode:](self, "_isChinaCountryCode:", v4))
    && (-[UserProfileReportHistoryManager _inKorea](self, "_inKorea")
     || !-[UserProfileReportHistoryManager _isKoreaCountryCode:](self, "_isKoreaCountryCode:", v4));

  return v5;
}

- (BOOL)hasIncidentReports
{
  unsigned int v3;
  int64_t v4;
  uint64_t v5;

  v3 = -[UserProfileReportHistoryManager inChina](self, "inChina");
  v5 = 96;
  if (v3)
    v5 = 104;
  v4 = self->_hazardsCount + self->_crashesCount;
  return !((*(uint64_t *)((char *)&self->super.isa + v5) + v4 < 0) ^ __OFADD__(v4, *(Class *)((char *)&self->super.isa + v5)) | ((Class)(*(char **)((char *)&self->super.isa + v5) + v4) == 0));
}

- (void)_loadReportsAndIncidents
{
  NSObject *v3;
  NSObject *v4;
  NSObject *v5;
  _QWORD v6[6];
  id v7;
  id location;
  _QWORD v9[4];
  NSObject *v10;
  _QWORD *v11;
  _QWORD v12[5];
  id v13;
  _QWORD v14[4];
  NSObject *v15;
  _QWORD *v16;
  _QWORD v17[5];
  id v18;

  v3 = dispatch_group_create();
  v17[0] = 0;
  v17[1] = v17;
  v17[2] = 0x3032000000;
  v17[3] = sub_100763BB8;
  v17[4] = sub_100763BC8;
  v18 = 0;
  dispatch_group_enter(v3);
  v14[0] = _NSConcreteStackBlock;
  v14[1] = 3221225472;
  v14[2] = sub_100763BD0;
  v14[3] = &unk_1011C5CC8;
  v16 = v17;
  v4 = v3;
  v15 = v4;
  +[RAPRecordManager fetchAllRAPRecordsWithCompletion:](RAPRecordManager, "fetchAllRAPRecordsWithCompletion:", v14);
  v12[0] = 0;
  v12[1] = v12;
  v12[2] = 0x3032000000;
  v12[3] = sub_100763BB8;
  v12[4] = sub_100763BC8;
  v13 = 0;
  dispatch_group_enter(v4);
  v9[0] = _NSConcreteStackBlock;
  v9[1] = 3221225472;
  v9[2] = sub_100763C18;
  v9[3] = &unk_1011C5CC8;
  v11 = v12;
  v5 = v4;
  v10 = v5;
  +[RAPRecordManager fetchAllTrafficIncidentReportsWithCompletion:](RAPRecordManager, "fetchAllTrafficIncidentReportsWithCompletion:", v9);
  objc_initWeak(&location, self);
  v6[0] = _NSConcreteStackBlock;
  v6[1] = 3221225472;
  v6[2] = sub_100763C60;
  v6[3] = &unk_1011C1FF8;
  objc_copyWeak(&v7, &location);
  v6[4] = v17;
  v6[5] = v12;
  dispatch_group_notify(v5, (dispatch_queue_t)&_dispatch_main_q, v6);
  objc_destroyWeak(&v7);
  objc_destroyWeak(&location);

  _Block_object_dispose(v12, 8);
  _Block_object_dispose(v17, 8);

}

- (void)_updateReports:(id)a3 incidents:(id)a4
{
  id v7;
  id v8;
  void *v9;
  uint64_t UInteger;
  id v11;
  id v12;
  NSArray *v13;
  NSArray *filteredRAPReports;
  id v15;
  NSArray *v16;
  NSArray *filteredTrafficIncidentReports;
  NSArray *v18;
  id v19;
  id v20;
  uint64_t v21;
  void *v22;
  unsigned int v23;
  BOOL *p_hasInReviewRAPs;
  NSArray *v25;
  id v26;
  id v27;
  uint64_t v28;
  void *v29;
  int v30;
  int64_t *p_roadWorkCount;
  void *v32;
  void *v33;
  __int128 v34;
  __int128 v35;
  __int128 v36;
  __int128 v37;
  __int128 v38;
  __int128 v39;
  __int128 v40;
  __int128 v41;
  _QWORD v42[5];
  _QWORD v43[5];
  id v44;
  uint64_t v45;
  _BYTE v46[128];
  _BYTE v47[128];

  v7 = a3;
  v8 = a4;
  v9 = (void *)objc_claimAutoreleasedReturnValue(+[NSDate date](NSDate, "date"));
  UInteger = GEOConfigGetUInteger(MapsConfig_RAPMaximumNumberOfDaysToShowPastSubmissionStatuses, off_1014B4138);
  objc_storeStrong((id *)&self->_allRAPReports, a3);
  v43[0] = _NSConcreteStackBlock;
  v43[1] = 3221225472;
  v43[2] = sub_10076400C;
  v43[3] = &unk_1011C5CF0;
  v43[4] = self;
  v11 = v9;
  v44 = v11;
  v45 = UInteger;
  v33 = v7;
  v12 = sub_10039E080(v7, v43);
  v13 = (NSArray *)objc_claimAutoreleasedReturnValue(v12);
  filteredRAPReports = self->_filteredRAPReports;
  self->_filteredRAPReports = v13;

  objc_storeStrong((id *)&self->_allTrafficIncidentReports, a4);
  v42[0] = _NSConcreteStackBlock;
  v42[1] = 3221225472;
  v42[2] = sub_1007640A8;
  v42[3] = &unk_1011C5D18;
  v42[4] = self;
  v32 = v8;
  v15 = sub_10039E080(v8, v42);
  v16 = (NSArray *)objc_claimAutoreleasedReturnValue(v15);
  filteredTrafficIncidentReports = self->_filteredTrafficIncidentReports;
  self->_filteredTrafficIncidentReports = v16;

  *(_WORD *)&self->_hasTellUsMoreRAPs = 0;
  self->_hasReviewedRAPs = 0;
  v38 = 0u;
  v39 = 0u;
  v40 = 0u;
  v41 = 0u;
  v18 = self->_filteredRAPReports;
  v19 = -[NSArray countByEnumeratingWithState:objects:count:](v18, "countByEnumeratingWithState:objects:count:", &v38, v47, 16);
  if (v19)
  {
    v20 = v19;
    v21 = *(_QWORD *)v39;
    do
    {
      v22 = 0;
      do
      {
        if (*(_QWORD *)v39 != v21)
          objc_enumerationMutation(v18);
        v23 = objc_msgSend(*(id *)(*((_QWORD *)&v38 + 1) + 8 * (_QWORD)v22), "reportStatus", v32, v33);
        p_hasInReviewRAPs = &self->_hasInReviewRAPs;
        if (!v23)
          goto LABEL_11;
        if (v23 == 2)
        {
          p_hasInReviewRAPs = &self->_hasTellUsMoreRAPs;
LABEL_11:
          *p_hasInReviewRAPs = 1;
          goto LABEL_12;
        }
        p_hasInReviewRAPs = &self->_hasReviewedRAPs;
        if (v23 == 1)
          goto LABEL_11;
LABEL_12:
        v22 = (char *)v22 + 1;
      }
      while (v20 != v22);
      v20 = -[NSArray countByEnumeratingWithState:objects:count:](v18, "countByEnumeratingWithState:objects:count:", &v38, v47, 16);
    }
    while (v20);
  }

  *(_OWORD *)&self->_crashesCount = 0u;
  *(_OWORD *)&self->_speedChecksCount = 0u;
  v34 = 0u;
  v35 = 0u;
  v36 = 0u;
  v37 = 0u;
  v25 = self->_filteredTrafficIncidentReports;
  v26 = -[NSArray countByEnumeratingWithState:objects:count:](v25, "countByEnumeratingWithState:objects:count:", &v34, v46, 16);
  if (v26)
  {
    v27 = v26;
    v28 = *(_QWORD *)v35;
    do
    {
      v29 = 0;
      do
      {
        if (*(_QWORD *)v35 != v28)
          objc_enumerationMutation(v25);
        v30 = objc_msgSend(*(id *)(*((_QWORD *)&v34 + 1) + 8 * (_QWORD)v29), "incidentType", v32);
        if (v30 > 6)
        {
          if (v30 == 7)
          {
            p_roadWorkCount = &self->_roadWorkCount;
LABEL_27:
            ++*p_roadWorkCount;
            goto LABEL_28;
          }
          p_roadWorkCount = &self->_speedChecksCount;
          if (v30 == 16)
            goto LABEL_27;
        }
        else
        {
          p_roadWorkCount = &self->_crashesCount;
          if (v30 == 5)
            goto LABEL_27;
          p_roadWorkCount = &self->_hazardsCount;
          if (v30 == 6)
            goto LABEL_27;
        }
LABEL_28:
        v29 = (char *)v29 + 1;
      }
      while (v27 != v29);
      v27 = -[NSArray countByEnumeratingWithState:objects:count:](v25, "countByEnumeratingWithState:objects:count:", &v34, v46, 16);
    }
    while (v27);
  }

  -[GEOObserverHashTable reportHistoryManagerDidUpdate:](self->_observers, "reportHistoryManagerDidUpdate:", self);
  -[UserProfileReportHistoryManager _fetchMapItemsForRAPHistoryIfNeeded](self, "_fetchMapItemsForRAPHistoryIfNeeded");

}

- (int64_t)_daysBetweenDates:(id)a3 currentDate:(id)a4
{
  id v5;
  id v6;
  void *v7;
  void *v8;
  id v9;

  v5 = a4;
  v6 = a3;
  v7 = (void *)objc_claimAutoreleasedReturnValue(+[NSCalendar currentCalendar](NSCalendar, "currentCalendar"));
  v8 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v7, "components:fromDate:toDate:options:", 16, v6, v5, 0));

  v9 = objc_msgSend(v8, "day");
  return (int64_t)v9;
}

- (NSArray)rapHistory
{
  if (self->_filteredRAPReports)
    return self->_filteredRAPReports;
  else
    return (NSArray *)&__NSArray0__struct;
}

- (void)refineRAPHistory
{
  if (!self->_wantsRefinedRAPHistory)
  {
    self->_wantsRefinedRAPHistory = 1;
    if (!self->_mapItemTicket)
      -[UserProfileReportHistoryManager _fetchMapItemsForRAPHistoryIfNeeded](self, "_fetchMapItemsForRAPHistoryIfNeeded");
  }
}

- (void)_fetchMapItemsForRAPHistoryIfNeeded
{
  NSArray *v3;
  id v4;
  uint64_t v5;
  void *i;
  void *v7;
  void *v8;
  void *v9;
  void *v10;
  void *v11;
  void *v12;
  id v13;
  void *v14;
  void *v15;
  id v16;
  id v17;
  NSObject *v18;
  _BOOL4 v19;
  unsigned int v20;
  void *v21;
  uint64_t v22;
  MKMapServiceTicket *mapItemTicket;
  MKMapServiceTicket *v24;
  unsigned int v25;
  UserProfileReportHistoryManager *val;
  void *v27;
  _QWORD v28[4];
  id v29;
  id v30;
  id v31;
  __int128 v32;
  __int128 v33;
  __int128 v34;
  __int128 v35;
  uint8_t buf[16];
  _BYTE v37[128];

  -[UserProfileReportHistoryManager _cancelMapItemTicket](self, "_cancelMapItemTicket");
  val = self;
  if (self->_wantsRefinedRAPHistory)
  {
    v27 = (void *)objc_claimAutoreleasedReturnValue(+[NSMutableDictionary dictionary](NSMutableDictionary, "dictionary"));
    v34 = 0u;
    v35 = 0u;
    v32 = 0u;
    v33 = 0u;
    v3 = self->_filteredRAPReports;
    v4 = -[NSArray countByEnumeratingWithState:objects:count:](v3, "countByEnumeratingWithState:objects:count:", &v32, v37, 16);
    if (v4)
    {
      v5 = *(_QWORD *)v33;
      do
      {
        for (i = 0; i != v4; i = (char *)i + 1)
        {
          if (*(_QWORD *)v33 != v5)
            objc_enumerationMutation(v3);
          v7 = *(void **)(*((_QWORD *)&v32 + 1) + 8 * (_QWORD)i);
          v8 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v7, "mapItem"));

          if (!v8)
          {
            v9 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v7, "contentData"));
            v10 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v9, "mapItemStorage"));
            v11 = v10;
            if (v10)
            {
              v12 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v10, "_identifier"));
              if (v12)
              {
                v13 = objc_msgSend(objc_alloc((Class)MKMapItemIdentifier), "initWithGEOMapItemIdentifier:", v12);
                v14 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v27, "objectForKeyedSubscript:", v13));
                if (!v14)
                {
                  v14 = (void *)objc_claimAutoreleasedReturnValue(+[NSMutableArray array](NSMutableArray, "array"));
                  objc_msgSend(v27, "setObject:forKeyedSubscript:", v14, v13);
                }
                objc_msgSend(v14, "addObject:", v7);

              }
            }

          }
        }
        v4 = -[NSArray countByEnumeratingWithState:objects:count:](v3, "countByEnumeratingWithState:objects:count:", &v32, v37, 16);
      }
      while (v4);
    }

    v15 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v27, "allKeys"));
    v16 = objc_msgSend(v15, "count");
    v17 = sub_10043261C();
    v18 = objc_claimAutoreleasedReturnValue(v17);
    v19 = os_log_type_enabled(v18, OS_LOG_TYPE_INFO);
    if (v16)
    {
      if (v19)
      {
        v20 = objc_msgSend(v27, "count");
        *(_DWORD *)buf = 67109120;
        *(_DWORD *)&buf[4] = v20;
        _os_log_impl((void *)&_mh_execute_header, v18, OS_LOG_TYPE_INFO, "Refining map items for %d RAPs", buf, 8u);
      }

      v21 = (void *)objc_claimAutoreleasedReturnValue(+[MKMapService sharedService](MKMapService, "sharedService"));
      v22 = objc_claimAutoreleasedReturnValue(objc_msgSend(v21, "ticketForIdentifiers:traits:", v15, 0));
      mapItemTicket = val->_mapItemTicket;
      val->_mapItemTicket = (MKMapServiceTicket *)v22;

      objc_initWeak((id *)buf, val);
      v24 = val->_mapItemTicket;
      v28[0] = _NSConcreteStackBlock;
      v28[1] = 3221225472;
      v28[2] = sub_100764548;
      v28[3] = &unk_1011B0D68;
      objc_copyWeak(&v31, (id *)buf);
      v29 = v15;
      v30 = v27;
      -[MKMapServiceTicket submitWithHandler:networkActivity:](v24, "submitWithHandler:networkActivity:", v28, 0);

      objc_destroyWeak(&v31);
      objc_destroyWeak((id *)buf);
    }
    else
    {
      if (v19)
      {
        v25 = -[NSArray count](val->_filteredRAPReports, "count");
        *(_DWORD *)buf = 67109120;
        *(_DWORD *)&buf[4] = v25;
        _os_log_impl((void *)&_mh_execute_header, v18, OS_LOG_TYPE_INFO, "No map item refinements needed for %d RAPs. Skipping.", buf, 8u);
      }

    }
  }
}

- (void)_cancelMapItemTicket
{
  MKMapServiceTicket *mapItemTicket;

  -[MKMapServiceTicket cancel](self->_mapItemTicket, "cancel");
  mapItemTicket = self->_mapItemTicket;
  self->_mapItemTicket = 0;

}

- (void)countryConfigurationDidChange:(id)a3
{
  void *v4;
  NSString *v5;
  NSString *countryCode;

  v4 = (void *)objc_claimAutoreleasedReturnValue(+[GEOCountryConfiguration sharedConfiguration](GEOCountryConfiguration, "sharedConfiguration", a3));
  v5 = (NSString *)objc_claimAutoreleasedReturnValue(objc_msgSend(v4, "countryCode"));
  countryCode = self->_countryCode;
  self->_countryCode = v5;

  -[UserProfileReportHistoryManager _loadReportsAndIncidents](self, "_loadReportsAndIncidents");
}

- (BOOL)hasTellUsMoreRAPs
{
  return self->_hasTellUsMoreRAPs;
}

- (BOOL)hasInReviewRAPs
{
  return self->_hasInReviewRAPs;
}

- (BOOL)hasReviewedRAPs
{
  return self->_hasReviewedRAPs;
}

- (int64_t)crashesCount
{
  return self->_crashesCount;
}

- (int64_t)hazardsCount
{
  return self->_hazardsCount;
}

- (int64_t)speedChecksCount
{
  return self->_speedChecksCount;
}

- (int64_t)roadWorkCount
{
  return self->_roadWorkCount;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_mapItemTicket, 0);
  objc_storeStrong((id *)&self->_filteredTrafficIncidentReports, 0);
  objc_storeStrong((id *)&self->_allTrafficIncidentReports, 0);
  objc_storeStrong((id *)&self->_filteredRAPReports, 0);
  objc_storeStrong((id *)&self->_allRAPReports, 0);
  objc_storeStrong((id *)&self->_countryCode, 0);
  objc_storeStrong((id *)&self->_observers, 0);
}

@end
