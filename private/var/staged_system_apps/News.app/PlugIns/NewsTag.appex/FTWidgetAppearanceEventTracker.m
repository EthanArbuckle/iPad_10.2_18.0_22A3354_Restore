@implementation FTWidgetAppearanceEventTracker

- (FTWidgetAppearanceEventTracker)init
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
    v6 = "-[FTWidgetAppearanceEventTracker init]";
    v7 = 2080;
    v8 = "FTWidgetAppearanceEventTracker.m";
    v9 = 1024;
    v10 = 29;
    v11 = 2114;
    v12 = v2;
    _os_log_error_impl((void *)&_mh_execute_header, (os_log_t)&_os_log_default, OS_LOG_TYPE_ERROR, "*** Assertion failure (Identifier: catch-all) : %s %s:%d %{public}@", buf, 0x26u);

  }
  v3 = (void *)objc_claimAutoreleasedReturnValue(+[NSString stringWithFormat:](NSString, "stringWithFormat:", CFSTR("%@: %s"), CFSTR("Do not call method"), "-[FTWidgetAppearanceEventTracker init]"));
  v4 = (id)objc_claimAutoreleasedReturnValue(+[NSException exceptionWithName:reason:userInfo:](NSException, "exceptionWithName:reason:userInfo:", NSInternalInconsistencyException, v3, 0));

  objc_exception_throw(v4);
}

- (FTWidgetAppearanceEventTracker)initWithMaxRowCount:(unint64_t)a3
{
  FTWidgetAppearanceEventTracker *v4;
  void *v5;
  void *v6;
  void *v7;
  void *v8;
  id v9;
  void *v10;
  PETScalarEventTracker *v11;
  PETScalarEventTracker *widgetAppearanceEventTracker;
  PETScalarEventTracker *v13;
  PETScalarEventTracker *widgetDisappearanceEventTracker;
  void *v15;
  void *v16;
  id v17;
  void *v18;
  PETScalarEventTracker *v19;
  PETScalarEventTracker *timeOfDayWidgetAppearanceEventTracker;
  objc_super v22;
  _QWORD v23[4];
  _QWORD v24[4];

  v22.receiver = self;
  v22.super_class = (Class)FTWidgetAppearanceEventTracker;
  v4 = -[FTWidgetAppearanceEventTracker init](&v22, "init");
  if (v4)
  {
    v5 = (void *)objc_claimAutoreleasedReturnValue(+[PETEventProperty ft_userGroupProperty](PETEventProperty, "ft_userGroupProperty"));
    v6 = (void *)objc_claimAutoreleasedReturnValue(+[PETEventProperty ft_headlineSourceProperty](PETEventProperty, "ft_headlineSourceProperty"));
    v7 = (void *)objc_claimAutoreleasedReturnValue(+[PETEventProperty ft_appearanceTypeProperty](PETEventProperty, "ft_appearanceTypeProperty"));
    v8 = (void *)objc_claimAutoreleasedReturnValue(+[PETEventProperty propertyWithName:range:](PETEventProperty, "propertyWithName:range:", CFSTR("headlines"), 0, a3 + 1));
    v9 = objc_alloc((Class)PETScalarEventTracker);
    v24[0] = v6;
    v24[1] = v5;
    v24[2] = v7;
    v24[3] = v8;
    v10 = (void *)objc_claimAutoreleasedReturnValue(+[NSArray arrayWithObjects:count:](NSArray, "arrayWithObjects:count:", v24, 4));
    v11 = (PETScalarEventTracker *)objc_msgSend(v9, "initWithFeatureId:event:registerProperties:", CFSTR("NewsWidget"), CFSTR("wdgtDidAppear"), v10);
    widgetAppearanceEventTracker = v4->_widgetAppearanceEventTracker;
    v4->_widgetAppearanceEventTracker = v11;

    v13 = (PETScalarEventTracker *)objc_msgSend(objc_alloc((Class)PETScalarEventTracker), "initWithFeatureId:event:registerProperties:", CFSTR("NewsWidget"), CFSTR("wdgtDidDisappear"), &__NSArray0__struct);
    widgetDisappearanceEventTracker = v4->_widgetDisappearanceEventTracker;
    v4->_widgetDisappearanceEventTracker = v13;

    v15 = (void *)objc_claimAutoreleasedReturnValue(+[PETEventProperty ft_localTimeHourProperty](PETEventProperty, "ft_localTimeHourProperty"));
    v16 = (void *)objc_claimAutoreleasedReturnValue(+[PETEventProperty ft_timeZoneProperty](PETEventProperty, "ft_timeZoneProperty"));
    v17 = objc_alloc((Class)PETScalarEventTracker);
    v23[0] = v6;
    v23[1] = v5;
    v23[2] = v15;
    v23[3] = v16;
    v18 = (void *)objc_claimAutoreleasedReturnValue(+[NSArray arrayWithObjects:count:](NSArray, "arrayWithObjects:count:", v23, 4));
    v19 = (PETScalarEventTracker *)objc_msgSend(v17, "initWithFeatureId:event:registerProperties:", CFSTR("NewsWidget"), CFSTR("wdgtDidAppear_tod"), v18);
    timeOfDayWidgetAppearanceEventTracker = v4->_timeOfDayWidgetAppearanceEventTracker;
    v4->_timeOfDayWidgetAppearanceEventTracker = v19;

  }
  return v4;
}

- (void)trackAppearanceAtDate:(id)a3 withHeadlineSource:(id)a4 appConfigTreatmentID:(id)a5 appearanceType:(unint64_t)a6 allItemsCount:(unint64_t)a7
{
  id v12;
  id v13;
  id v14;
  __CFString *v15;
  void *v16;
  __CFString *v17;
  void *v18;
  void *v19;
  void *v20;
  void *v21;
  void *v22;
  void *v23;
  id v24;
  void *v25;
  id v26;
  void *v27;
  void *v28;
  _QWORD v29[4];
  _QWORD v30[4];

  v12 = a3;
  v13 = a4;
  v14 = a5;
  if (!v12 && os_log_type_enabled((os_log_t)&_os_log_default, OS_LOG_TYPE_ERROR))
  {
    sub_1000813FC();
    if (v13)
      goto LABEL_6;
  }
  else if (v13)
  {
    goto LABEL_6;
  }
  if (os_log_type_enabled((os_log_t)&_os_log_default, OS_LOG_TYPE_ERROR))
    sub_100081334();
LABEL_6:
  v15 = FTHeadlineSourcePropertyValueWithTodaySource(v13);
  v16 = (void *)objc_claimAutoreleasedReturnValue(v15);
  v17 = FTUserGroupPropertyValueWithAppConfigTreatmentID(v14);
  v18 = (void *)objc_claimAutoreleasedReturnValue(v17);
  v19 = (void *)objc_claimAutoreleasedReturnValue(-[FTWidgetAppearanceEventTracker widgetAppearanceEventTracker](self, "widgetAppearanceEventTracker"));
  v30[0] = v16;
  v30[1] = v18;
  v20 = (void *)objc_claimAutoreleasedReturnValue(+[NSNumber numberWithUnsignedInteger:](NSNumber, "numberWithUnsignedInteger:", a6));
  v30[2] = v20;
  v21 = (void *)objc_claimAutoreleasedReturnValue(+[NSNumber numberWithUnsignedInteger:](NSNumber, "numberWithUnsignedInteger:", a7));
  v30[3] = v21;
  v22 = (void *)objc_claimAutoreleasedReturnValue(+[NSArray arrayWithObjects:count:](NSArray, "arrayWithObjects:count:", v30, 4));
  objc_msgSend(v19, "trackEventWithPropertyValues:", v22);

  v23 = (void *)objc_claimAutoreleasedReturnValue(-[FTWidgetAppearanceEventTracker timeOfDayWidgetAppearanceEventTracker](self, "timeOfDayWidgetAppearanceEventTracker"));
  v29[0] = v16;
  v29[1] = v18;
  v24 = FTLocalTimeHourPropertyValue(v12);
  v25 = (void *)objc_claimAutoreleasedReturnValue(v24);
  v29[2] = v25;
  v26 = FTTimeZonePropertyValue();
  v27 = (void *)objc_claimAutoreleasedReturnValue(v26);
  v29[3] = v27;
  v28 = (void *)objc_claimAutoreleasedReturnValue(+[NSArray arrayWithObjects:count:](NSArray, "arrayWithObjects:count:", v29, 4));
  objc_msgSend(v23, "trackEventWithPropertyValues:", v28);

}

- (void)trackDisappearance
{
  id v2;

  v2 = (id)objc_claimAutoreleasedReturnValue(-[FTWidgetAppearanceEventTracker widgetDisappearanceEventTracker](self, "widgetDisappearanceEventTracker"));
  objc_msgSend(v2, "trackEventWithPropertyValues:", &__NSArray0__struct);

}

- (PETScalarEventTracker)widgetAppearanceEventTracker
{
  return self->_widgetAppearanceEventTracker;
}

- (void)setWidgetAppearanceEventTracker:(id)a3
{
  objc_storeStrong((id *)&self->_widgetAppearanceEventTracker, a3);
}

- (PETScalarEventTracker)widgetDisappearanceEventTracker
{
  return self->_widgetDisappearanceEventTracker;
}

- (void)setWidgetDisappearanceEventTracker:(id)a3
{
  objc_storeStrong((id *)&self->_widgetDisappearanceEventTracker, a3);
}

- (PETScalarEventTracker)timeOfDayWidgetAppearanceEventTracker
{
  return self->_timeOfDayWidgetAppearanceEventTracker;
}

- (void)setTimeOfDayWidgetAppearanceEventTracker:(id)a3
{
  objc_storeStrong((id *)&self->_timeOfDayWidgetAppearanceEventTracker, a3);
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_timeOfDayWidgetAppearanceEventTracker, 0);
  objc_storeStrong((id *)&self->_widgetDisappearanceEventTracker, 0);
  objc_storeStrong((id *)&self->_widgetAppearanceEventTracker, 0);
}

@end
