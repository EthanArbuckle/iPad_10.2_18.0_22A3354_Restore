@implementation OSICalendarMonitor

- (OSICalendarMonitor)init
{
  EKEventStore *v3;
  EKEventStore *calendar;
  OS_os_log *v5;
  OS_os_log *log;
  void *v7;

  v3 = (EKEventStore *)objc_msgSend(objc_alloc((Class)EKEventStore), "initWithEKOptions:", 128);
  calendar = self->_calendar;
  self->_calendar = v3;

  v5 = (OS_os_log *)os_log_create("com.apple.osintelligence", "calendarmonitor");
  log = self->_log;
  self->_log = v5;

  v7 = (void *)objc_claimAutoreleasedReturnValue(+[NSNotificationCenter defaultCenter](NSNotificationCenter, "defaultCenter"));
  objc_msgSend(v7, "addObserver:selector:name:object:", self, "relevantEventDeadline", EKEventStoreChangedNotification, 0);

  return self;
}

- (id)upcomingEventIDs
{
  void *v3;
  void *v4;
  void *v5;
  void *v6;
  void *v7;
  void *v8;

  v3 = (void *)objc_claimAutoreleasedReturnValue(+[NSDate date](NSDate, "date"));
  v4 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v3, "dateByAddingTimeInterval:", -86400.0));
  v5 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v3, "dateByAddingTimeInterval:", 86400.0));
  v6 = (void *)objc_claimAutoreleasedReturnValue(-[EKEventStore predicateForEventsWithStartDate:endDate:calendars:loadDefaultProperties:](self->_calendar, "predicateForEventsWithStartDate:endDate:calendars:loadDefaultProperties:", v4, v5, 0, 1));
  v7 = (void *)objc_claimAutoreleasedReturnValue(-[OSICalendarMonitor calendar](self, "calendar"));
  v8 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v7, "eventObjectIDsMatchingPredicate:", v6));

  return v8;
}

- (id)nextFlightEventWithEventIDs:(id)a3
{
  id v4;
  void *v5;
  id v6;
  id v7;
  __int128 v8;
  id v9;
  uint64_t v10;
  _UNKNOWN **v11;
  void *i;
  void *v13;
  uint64_t v14;
  id v15;
  void *v16;
  void *v17;
  void *v18;
  unsigned int v19;
  void *v20;
  double v21;
  double v22;
  os_log_t v23;
  uint64_t v24;
  NSObject *v25;
  __int128 v27;
  void *v28;
  void *v29;
  id v30;
  os_log_t log;
  NSObject *loga;
  __int128 v33;
  __int128 v34;
  __int128 v35;
  __int128 v36;
  uint8_t buf[4];
  void *v38;
  __int16 v39;
  void *v40;
  _BYTE v41[128];

  v4 = a3;
  v5 = (void *)objc_claimAutoreleasedReturnValue(+[NSDate distantFuture](NSDate, "distantFuture"));
  v33 = 0u;
  v34 = 0u;
  v35 = 0u;
  v36 = 0u;
  v6 = v4;
  v7 = objc_msgSend(v6, "countByEnumeratingWithState:objects:count:", &v33, v41, 16);
  if (v7)
  {
    v9 = v7;
    log = 0;
    v10 = *(_QWORD *)v34;
    v11 = &AnalyticsSendEventLazy_ptr;
    *(_QWORD *)&v8 = 138412546;
    v27 = v8;
    v30 = v6;
    do
    {
      for (i = 0; i != v9; i = (char *)i + 1)
      {
        if (*(_QWORD *)v34 != v10)
          objc_enumerationMutation(v6);
        v13 = (void *)objc_claimAutoreleasedReturnValue(-[EKEventStore publicObjectWithObjectID:](self->_calendar, "publicObjectWithObjectID:", *(_QWORD *)(*((_QWORD *)&v33 + 1) + 8 * (_QWORD)i), v27));
        v14 = objc_opt_class(v11[29]);
        if ((objc_opt_isKindOfClass(v13, v14) & 1) != 0)
        {
          v15 = v13;
          if ((objc_msgSend(v15, "isAllDay") & 1) == 0)
          {
            v16 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v15, "suggestionInfo"));

            if (v16)
            {
              v17 = (void *)objc_claimAutoreleasedReturnValue(+[SGEventMetadata eventMetadataFromEKEvent:](SGEventMetadata, "eventMetadataFromEKEvent:", v15));
              v18 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v17, "categoryDescription"));
              v19 = objc_msgSend(v18, "localizedCaseInsensitiveContainsString:", CFSTR("flight"));

              if (v19
                && (v20 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v15, "startDate")),
                    objc_msgSend(v20, "timeIntervalSinceDate:", v5),
                    v22 = v21,
                    v20,
                    v22 < 0.0))
              {
                v23 = (os_log_t)v15;

                v24 = objc_claimAutoreleasedReturnValue(-[NSObject startDate](v23, "startDate"));
                v25 = self->_log;
                if (os_log_type_enabled(v25, OS_LOG_TYPE_DEFAULT))
                {
                  loga = v25;
                  v29 = (void *)objc_claimAutoreleasedReturnValue(-[NSObject startDate](v23, "startDate"));
                  v28 = (void *)objc_claimAutoreleasedReturnValue(-[NSObject endDate](v23, "endDate"));
                  *(_DWORD *)buf = v27;
                  v38 = v29;
                  v39 = 2112;
                  v40 = v28;
                  _os_log_impl((void *)&_mh_execute_header, loga, OS_LOG_TYPE_DEFAULT, "Found flight from %@-%@", buf, 0x16u);

                }
              }
              else
              {
                v24 = (uint64_t)v5;
                v23 = log;
              }

              v5 = (void *)v24;
              log = v23;
              v6 = v30;
              v11 = &AnalyticsSendEventLazy_ptr;
            }
          }

        }
      }
      v9 = objc_msgSend(v6, "countByEnumeratingWithState:objects:count:", &v33, v41, 16);
    }
    while (v9);
  }
  else
  {
    log = 0;
  }

  return log;
}

- (id)relevantEventDeadline
{
  void *v3;
  void *v4;
  OS_os_log *log;
  uint64_t v6;
  void *v7;
  uint8_t v9[16];

  v3 = (void *)objc_claimAutoreleasedReturnValue(-[OSICalendarMonitor upcomingEventIDs](self, "upcomingEventIDs"));
  v4 = (void *)objc_claimAutoreleasedReturnValue(-[OSICalendarMonitor nextFlightEventWithEventIDs:](self, "nextFlightEventWithEventIDs:", v3));
  if (v4)
  {
    log = self->_log;
    if (os_log_type_enabled((os_log_t)log, OS_LOG_TYPE_DEFAULT))
    {
      *(_WORD *)v9 = 0;
      _os_log_impl((void *)&_mh_execute_header, (os_log_t)log, OS_LOG_TYPE_DEFAULT, "Upcoming or recent flight; forcing immediate charge",
        v9,
        2u);
    }
    v6 = objc_claimAutoreleasedReturnValue(objc_msgSend(v4, "startDate"));
  }
  else
  {
    v6 = objc_claimAutoreleasedReturnValue(+[NSDate distantFuture](NSDate, "distantFuture"));
  }
  v7 = (void *)v6;

  return v7;
}

- (EKEventStore)calendar
{
  return self->_calendar;
}

- (void)setCalendar:(id)a3
{
  objc_storeStrong((id *)&self->_calendar, a3);
}

- (OS_os_log)log
{
  return self->_log;
}

- (void)setLog:(id)a3
{
  objc_storeStrong((id *)&self->_log, a3);
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_log, 0);
  objc_storeStrong((id *)&self->_calendar, 0);
}

@end
