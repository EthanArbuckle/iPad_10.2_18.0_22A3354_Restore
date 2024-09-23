@implementation NTHeadlineEngagementEventTracker

- (NTHeadlineEngagementEventTracker)init
{
  id v2;
  void *v3;
  id v4;
  uint8_t buf[4];
  const char *v6;
  __int16 v7;
  char *v8;
  __int16 v9;
  int v10;
  __int16 v11;
  id v12;

  if (os_log_type_enabled((os_log_t)&_os_log_default, OS_LOG_TYPE_ERROR))
  {
    v2 = objc_msgSend(objc_alloc((Class)NSString), "initWithFormat:", CFSTR("Do not call method"));
    *(_DWORD *)buf = 136315906;
    v6 = "-[NTHeadlineEngagementEventTracker init]";
    v7 = 2080;
    v8 = "FTHeadlineEngagementEventTracker.m";
    v9 = 1024;
    v10 = 26;
    v11 = 2114;
    v12 = v2;
    _os_log_error_impl((void *)&_mh_execute_header, (os_log_t)&_os_log_default, OS_LOG_TYPE_ERROR, "*** Assertion failure (Identifier: catch-all) : %s %s:%d %{public}@", buf, 0x26u);

  }
  v3 = (void *)objc_claimAutoreleasedReturnValue(+[NSString stringWithFormat:](NSString, "stringWithFormat:", CFSTR("%@: %s"), CFSTR("Do not call method"), "-[NTHeadlineEngagementEventTracker init]"));
  v4 = (id)objc_claimAutoreleasedReturnValue(+[NSException exceptionWithName:reason:userInfo:](NSException, "exceptionWithName:reason:userInfo:", NSInternalInconsistencyException, v3, 0));

  objc_exception_throw(v4);
}

- (NTHeadlineEngagementEventTracker)initWithMaxRowCount:(unint64_t)a3
{
  NTHeadlineEngagementEventTracker *v4;
  void *v5;
  void *v6;
  id v7;
  void *v8;
  PETScalarEventTracker *v9;
  PETScalarEventTracker *orderHeadlineEngagementEventTracker;
  void *v11;
  void *v12;
  id v13;
  void *v14;
  PETScalarEventTracker *v15;
  PETScalarEventTracker *timeOfDayHeadlineEngagementEventTracker;
  void *v18;
  void *v19;
  void *v20;
  objc_super v21;
  _QWORD v22[5];
  _QWORD v23[4];

  v21.receiver = self;
  v21.super_class = (Class)NTHeadlineEngagementEventTracker;
  v4 = -[NTHeadlineEngagementEventTracker init](&v21, "init");
  if (v4)
  {
    v19 = (void *)objc_claimAutoreleasedReturnValue(+[PETEventProperty ft_headlineSourceProperty](PETEventProperty, "ft_headlineSourceProperty"));
    v5 = (void *)objc_claimAutoreleasedReturnValue(+[PETEventProperty ft_sectionProperty](PETEventProperty, "ft_sectionProperty"));
    v20 = (void *)objc_claimAutoreleasedReturnValue(+[PETEventProperty propertyWithName:range:](PETEventProperty, "propertyWithName:range:", CFSTR("hlOrder"), 0, a3));
    v6 = (void *)objc_claimAutoreleasedReturnValue(+[PETEventProperty ft_userGroupProperty](PETEventProperty, "ft_userGroupProperty"));
    v18 = (void *)objc_claimAutoreleasedReturnValue(+[PETEventProperty ft_widgetDisplayModeProperty](PETEventProperty, "ft_widgetDisplayModeProperty"));
    v7 = objc_alloc((Class)PETScalarEventTracker);
    v23[0] = v5;
    v23[1] = v20;
    v23[2] = v6;
    v23[3] = v18;
    v8 = (void *)objc_claimAutoreleasedReturnValue(+[NSArray arrayWithObjects:count:](NSArray, "arrayWithObjects:count:", v23, 4));
    v9 = (PETScalarEventTracker *)objc_msgSend(v7, "initWithFeatureId:event:registerProperties:", CFSTR("NewsWidget"), CFSTR("hlEngagement_order"), v8);
    orderHeadlineEngagementEventTracker = v4->_orderHeadlineEngagementEventTracker;
    v4->_orderHeadlineEngagementEventTracker = v9;

    v11 = (void *)objc_claimAutoreleasedReturnValue(+[PETEventProperty ft_localTimeHourProperty](PETEventProperty, "ft_localTimeHourProperty"));
    v12 = (void *)objc_claimAutoreleasedReturnValue(+[PETEventProperty ft_timeZoneProperty](PETEventProperty, "ft_timeZoneProperty"));
    v13 = objc_alloc((Class)PETScalarEventTracker);
    v22[0] = v19;
    v22[1] = v5;
    v22[2] = v6;
    v22[3] = v11;
    v22[4] = v12;
    v14 = (void *)objc_claimAutoreleasedReturnValue(+[NSArray arrayWithObjects:count:](NSArray, "arrayWithObjects:count:", v22, 5));
    v15 = (PETScalarEventTracker *)objc_msgSend(v13, "initWithFeatureId:event:registerProperties:", CFSTR("NewsWidget"), CFSTR("hlEngagement_tod2"), v14);
    timeOfDayHeadlineEngagementEventTracker = v4->_timeOfDayHeadlineEngagementEventTracker;
    v4->_timeOfDayHeadlineEngagementEventTracker = v15;

  }
  return v4;
}

- (void)trackEngagementWithTodaySource:(id)a3 appConfigTreatmentID:(id)a4 section:(id)a5 otherVisibleSections:(id)a6 headlineOrder:(unint64_t)a7 widgetDisplayMode:(unint64_t)a8
{
  id v14;
  id v15;
  id v16;
  __CFString *v17;
  void *v18;
  __CFString *v19;
  void *v20;
  void *v21;
  void *v22;
  void *v23;
  void *v24;
  void *v25;
  void *v26;
  __CFString *v27;
  void *v28;
  id v29;
  void *v30;
  id v31;
  void *v32;
  void *v33;
  void *v34;
  id v35;
  _QWORD v36[5];
  _QWORD v37[4];

  v14 = a3;
  v15 = a4;
  v16 = a5;
  v35 = a6;
  if (!v14 && os_log_type_enabled((os_log_t)&_os_log_default, OS_LOG_TYPE_ERROR))
  {
    sub_100092E70();
    if (v16)
      goto LABEL_6;
  }
  else if (v16)
  {
    goto LABEL_6;
  }
  if (os_log_type_enabled((os_log_t)&_os_log_default, OS_LOG_TYPE_ERROR))
    sub_100092DA8();
LABEL_6:
  v17 = FTSectionPropertyValueWithSection(v16);
  v18 = (void *)objc_claimAutoreleasedReturnValue(v17);
  v19 = FTUserGroupPropertyValueWithAppConfigTreatmentID(v15);
  v20 = (void *)objc_claimAutoreleasedReturnValue(v19);
  v21 = (void *)objc_claimAutoreleasedReturnValue(-[NTHeadlineEngagementEventTracker orderHeadlineEngagementEventTracker](self, "orderHeadlineEngagementEventTracker"));
  v37[0] = v18;
  v34 = v15;
  v22 = (void *)objc_claimAutoreleasedReturnValue(+[NSNumber numberWithUnsignedInteger:](NSNumber, "numberWithUnsignedInteger:", a7));
  v37[1] = v22;
  v37[2] = v20;
  v23 = (void *)objc_claimAutoreleasedReturnValue(+[NSNumber numberWithUnsignedInteger:](NSNumber, "numberWithUnsignedInteger:", a8));
  v37[3] = v23;
  v24 = (void *)objc_claimAutoreleasedReturnValue(+[NSArray arrayWithObjects:count:](NSArray, "arrayWithObjects:count:", v37, 4));
  objc_msgSend(v21, "trackEventWithPropertyValues:", v24);

  v25 = (void *)objc_claimAutoreleasedReturnValue(+[NSDate date](NSDate, "date"));
  v26 = (void *)objc_claimAutoreleasedReturnValue(-[NTHeadlineEngagementEventTracker timeOfDayHeadlineEngagementEventTracker](self, "timeOfDayHeadlineEngagementEventTracker"));
  v27 = FTHeadlineSourcePropertyValueWithTodaySource(v14);
  v28 = (void *)objc_claimAutoreleasedReturnValue(v27);
  v36[0] = v28;
  v36[1] = v18;
  v36[2] = v20;
  v29 = FTLocalTimeHourPropertyValue(v25);
  v30 = (void *)objc_claimAutoreleasedReturnValue(v29);
  v36[3] = v30;
  v31 = FTTimeZonePropertyValue();
  v32 = (void *)objc_claimAutoreleasedReturnValue(v31);
  v36[4] = v32;
  v33 = (void *)objc_claimAutoreleasedReturnValue(+[NSArray arrayWithObjects:count:](NSArray, "arrayWithObjects:count:", v36, 5));
  objc_msgSend(v26, "trackEventWithPropertyValues:", v33);

}

- (PETScalarEventTracker)orderHeadlineEngagementEventTracker
{
  return self->_orderHeadlineEngagementEventTracker;
}

- (void)setOrderHeadlineEngagementEventTracker:(id)a3
{
  objc_storeStrong((id *)&self->_orderHeadlineEngagementEventTracker, a3);
}

- (PETScalarEventTracker)timeOfDayHeadlineEngagementEventTracker
{
  return self->_timeOfDayHeadlineEngagementEventTracker;
}

- (void)setTimeOfDayHeadlineEngagementEventTracker:(id)a3
{
  objc_storeStrong((id *)&self->_timeOfDayHeadlineEngagementEventTracker, a3);
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_timeOfDayHeadlineEngagementEventTracker, 0);
  objc_storeStrong((id *)&self->_orderHeadlineEngagementEventTracker, 0);
}

@end
