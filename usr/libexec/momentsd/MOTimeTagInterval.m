@implementation MOTimeTagInterval

- (MOTimeTagInterval)initWithTimeTag:(unint64_t)a3 dateInterval:(id)a4
{
  id v7;
  MOTimeTagInterval *v8;
  MOTimeTagInterval *v9;
  objc_super v11;

  v7 = a4;
  v11.receiver = self;
  v11.super_class = (Class)MOTimeTagInterval;
  v8 = -[MOTimeTagInterval init](&v11, "init");
  v9 = v8;
  if (v8)
  {
    v8->_timetag = a3;
    objc_storeStrong((id *)&v8->_dateInterval, a4);
  }

  return v9;
}

- (double)overlapsScoreForStartDate:(id)a3 endDate:(id)a4
{
  id v6;
  id v7;
  id os_log;
  NSObject *v9;
  id v10;
  NSObject *v11;
  void *v12;
  unsigned int v13;
  double v14;
  id v16;
  double v17;
  void *v18;
  unsigned int v19;
  void *v20;
  void *v21;
  double v22;
  double v23;
  double v24;
  double v25;
  double v26;
  double v27;
  void *v29;
  void *v30;
  void *v31;
  void *v32;
  void *v33;
  void *v34;
  void *v35;
  void *v36;
  int v37;
  id v38;
  __int16 v39;
  id v40;
  __int16 v41;
  void *v42;
  __int16 v43;
  void *v44;

  v6 = a3;
  v7 = a4;
  os_log = _mo_log_facility_get_os_log(&MOLogFacilityEventBundleManager);
  v9 = objc_claimAutoreleasedReturnValue(os_log);
  if (os_log_type_enabled(v9, OS_LOG_TYPE_DEBUG))
  {
    v29 = (void *)objc_claimAutoreleasedReturnValue(-[MOTimeTagInterval dateInterval](self, "dateInterval"));
    v30 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v29, "startDate"));
    v31 = (void *)objc_claimAutoreleasedReturnValue(-[MOTimeTagInterval dateInterval](self, "dateInterval"));
    v32 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v31, "endDate"));
    v37 = 138413058;
    v38 = v6;
    v39 = 2112;
    v40 = v7;
    v41 = 2112;
    v42 = v30;
    v43 = 2112;
    v44 = v32;
    _os_log_debug_impl((void *)&_mh_execute_header, v9, OS_LOG_TYPE_DEBUG, "overlapsScoreForStartDate, startDate, %@, endDate, %@, self.startDate, %@, self.endDate, %@", (uint8_t *)&v37, 0x2Au);

  }
  if (!v7 || objc_msgSend(v6, "isEqualToDate:", v7))
    goto LABEL_9;
  if (objc_msgSend(v6, "isAfterDate:", v7))
  {
    v10 = _mo_log_facility_get_os_log(&MOLogFacilityEventBundleManager);
    v11 = objc_claimAutoreleasedReturnValue(v10);
    if (os_log_type_enabled(v11, OS_LOG_TYPE_ERROR))
    {
      v33 = (void *)objc_claimAutoreleasedReturnValue(-[MOTimeTagInterval dateInterval](self, "dateInterval"));
      v34 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v33, "startDate"));
      v35 = (void *)objc_claimAutoreleasedReturnValue(-[MOTimeTagInterval dateInterval](self, "dateInterval"));
      v36 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v35, "endDate"));
      v37 = 138413058;
      v38 = v6;
      v39 = 2112;
      v40 = v7;
      v41 = 2112;
      v42 = v34;
      v43 = 2112;
      v44 = v36;
      _os_log_error_impl((void *)&_mh_execute_header, v11, OS_LOG_TYPE_ERROR, "overlapsScoreForStartDate, invalid time range, startDate, %@, endDate, %@, self.startDate, %@, self.endDate, %@", (uint8_t *)&v37, 0x2Au);

    }
LABEL_9:
    v12 = (void *)objc_claimAutoreleasedReturnValue(-[MOTimeTagInterval dateInterval](self, "dateInterval"));
    v13 = objc_msgSend(v12, "containsDate:", v6);

    if (v13)
      v14 = 1.0;
    else
      v14 = 0.0;
    goto LABEL_12;
  }
  v16 = objc_msgSend(objc_alloc((Class)NSDateInterval), "initWithStartDate:endDate:", v6, v7);
  objc_msgSend(v16, "duration");
  v14 = 0.0;
  if (v17 > 0.0)
  {
    v18 = (void *)objc_claimAutoreleasedReturnValue(-[MOTimeTagInterval dateInterval](self, "dateInterval"));
    v19 = objc_msgSend(v18, "intersectsDateInterval:", v16);

    if (v19)
    {
      v20 = (void *)objc_claimAutoreleasedReturnValue(-[MOTimeTagInterval dateInterval](self, "dateInterval"));
      v21 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v20, "intersectionWithDateInterval:", v16));
      objc_msgSend(v21, "duration");
      v23 = v22;

      objc_msgSend(v16, "duration");
      v25 = v24 - v23;
      objc_msgSend(v16, "duration");
      v27 = v23 / v26;
      if (v27 > 0.5 && v25 < 1800.0)
        v14 = 1.0;
      else
        v14 = v27;
    }
  }

LABEL_12:
  return v14;
}

- (id)description
{
  void *v3;
  void *v4;
  void *v5;

  v3 = (void *)objc_claimAutoreleasedReturnValue(+[MOTime timeStringFromTimeTag:](MOTime, "timeStringFromTimeTag:", -[MOTimeTagInterval timetag](self, "timetag")));
  v4 = (void *)objc_claimAutoreleasedReturnValue(-[MOTimeTagInterval dateInterval](self, "dateInterval"));
  v5 = (void *)objc_claimAutoreleasedReturnValue(+[NSString stringWithFormat:](NSString, "stringWithFormat:", CFSTR("Interval: timetag, %@, interval, %@"), v3, v4));

  return v5;
}

- (unint64_t)timetag
{
  return self->_timetag;
}

- (void)setTimetag:(unint64_t)a3
{
  self->_timetag = a3;
}

- (NSDateInterval)dateInterval
{
  return self->_dateInterval;
}

- (void)setDateInterval:(id)a3
{
  objc_storeStrong((id *)&self->_dateInterval, a3);
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_dateInterval, 0);
}

@end
