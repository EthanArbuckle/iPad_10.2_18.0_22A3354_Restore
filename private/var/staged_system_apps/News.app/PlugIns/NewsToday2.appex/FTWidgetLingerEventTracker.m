@implementation FTWidgetLingerEventTracker

- (FTWidgetLingerEventTracker)init
{
  FTWidgetLingerEventTracker *v2;
  void *v3;
  id v4;
  void *v5;
  void *v6;
  void *v7;
  void *v8;
  void *v9;
  PETDistributionEventTracker *v10;
  PETDistributionEventTracker *widgetLingerEventTracker;
  objc_super v13;
  _QWORD v14[5];

  v13.receiver = self;
  v13.super_class = (Class)FTWidgetLingerEventTracker;
  v2 = -[FTWidgetLingerEventTracker init](&v13, "init");
  if (v2)
  {
    v3 = (void *)objc_claimAutoreleasedReturnValue(+[PETEventProperty ft_BOOLeanPropertyWithName:](PETEventProperty, "ft_BOOLeanPropertyWithName:", CFSTR("propChanged")));
    v4 = objc_alloc((Class)PETDistributionEventTracker);
    v5 = (void *)objc_claimAutoreleasedReturnValue(+[PETEventProperty ft_headlineSourceProperty](PETEventProperty, "ft_headlineSourceProperty"));
    v14[0] = v5;
    v6 = (void *)objc_claimAutoreleasedReturnValue(+[PETEventProperty ft_userGroupProperty](PETEventProperty, "ft_userGroupProperty"));
    v14[1] = v6;
    v7 = (void *)objc_claimAutoreleasedReturnValue(+[PETEventProperty ft_widgetDisplayModeProperty](PETEventProperty, "ft_widgetDisplayModeProperty"));
    v14[2] = v7;
    v8 = (void *)objc_claimAutoreleasedReturnValue(+[PETEventProperty ft_appearanceTypeProperty](PETEventProperty, "ft_appearanceTypeProperty"));
    v14[3] = v8;
    v14[4] = v3;
    v9 = (void *)objc_claimAutoreleasedReturnValue(+[NSArray arrayWithObjects:count:](NSArray, "arrayWithObjects:count:", v14, 5));
    v10 = (PETDistributionEventTracker *)objc_msgSend(v4, "initWithFeatureId:event:registerProperties:", CFSTR("NewsWidget"), CFSTR("wdgtLinger"), v9);
    widgetLingerEventTracker = v2->_widgetLingerEventTracker;
    v2->_widgetLingerEventTracker = v10;

  }
  return v2;
}

- (void)trackWidgetLingerEventExtremity:(unint64_t)a3 atDate:(id)a4 withTodaySource:(id)a5 appConfigTreatmentID:(id)a6 widgetDisplayMode:(unint64_t)a7 appearanceType:(unint64_t)a8
{
  id v14;
  id v15;
  id v16;
  FTWidgetLingerState *v17;
  void *v18;
  void *v19;
  void *v20;
  void *v21;
  void *v22;
  void *v23;
  id v24;
  id v25;
  _BOOL8 v26;

  v14 = a4;
  v15 = a6;
  v16 = a5;
  +[NSThread isMainThread](NSThread, "isMainThread");
  if (!v14 && os_log_type_enabled((os_log_t)&_os_log_default, OS_LOG_TYPE_ERROR))
  {
    sub_100092508();
    if (v16)
      goto LABEL_6;
  }
  else if (v16)
  {
    goto LABEL_6;
  }
  if (os_log_type_enabled((os_log_t)&_os_log_default, OS_LOG_TYPE_ERROR))
    sub_100092450();
LABEL_6:
  v17 = -[FTWidgetLingerState initWithTodaySource:appConfigTreatmentID:widgetDisplayMode:appearanceType:]([FTWidgetLingerState alloc], "initWithTodaySource:appConfigTreatmentID:widgetDisplayMode:appearanceType:", v16, v15, a7, a8);

  if (a3 != 1)
  {
    if (!a3)
    {
      if (-[FTWidgetLingerEventTracker isLingerInProgress](self, "isLingerInProgress")
        && os_log_type_enabled((os_log_t)&_os_log_default, OS_LOG_TYPE_ERROR))
      {
        sub_100092160();
      }
      v18 = (void *)objc_claimAutoreleasedReturnValue(-[FTWidgetLingerEventTracker startState](self, "startState"));

      if (v18 && os_log_type_enabled((os_log_t)&_os_log_default, OS_LOG_TYPE_ERROR))
        sub_1000920A8();
      v19 = (void *)objc_claimAutoreleasedReturnValue(-[FTWidgetLingerEventTracker startDate](self, "startDate"));

      if (v19 && os_log_type_enabled((os_log_t)&_os_log_default, OS_LOG_TYPE_ERROR))
        sub_100091FF0();
      -[FTWidgetLingerEventTracker setStartState:](self, "setStartState:", v17);
      -[FTWidgetLingerEventTracker setStartDate:](self, "setStartDate:", v14);
      -[FTWidgetLingerEventTracker setLingerInProgress:](self, "setLingerInProgress:", 1);
    }
    goto LABEL_28;
  }
  if (!-[FTWidgetLingerEventTracker isLingerInProgress](self, "isLingerInProgress")
    && os_log_type_enabled((os_log_t)&_os_log_default, OS_LOG_TYPE_ERROR))
  {
    sub_100092390();
  }
  if (-[FTWidgetLingerEventTracker isLingerInProgress](self, "isLingerInProgress"))
  {
    v20 = (void *)objc_claimAutoreleasedReturnValue(-[FTWidgetLingerEventTracker startState](self, "startState"));
    v21 = (void *)objc_claimAutoreleasedReturnValue(-[FTWidgetLingerEventTracker startDate](self, "startDate"));
    if (!v20 && os_log_type_enabled((os_log_t)&_os_log_default, OS_LOG_TYPE_ERROR))
    {
      sub_1000922D8();
      if (!v21)
      {
LABEL_25:
        if (os_log_type_enabled((os_log_t)&_os_log_default, OS_LOG_TYPE_ERROR))
          sub_100092220();
      }
    }
    else if (!v21)
    {
      goto LABEL_25;
    }
    v22 = (void *)objc_claimAutoreleasedReturnValue(-[FTWidgetLingerState todaySourceIdentifier](v17, "todaySourceIdentifier"));
    v23 = (void *)objc_claimAutoreleasedReturnValue(-[FTWidgetLingerState appConfigTreatmentID](v17, "appConfigTreatmentID"));
    v24 = -[FTWidgetLingerState widgetDisplayMode](v17, "widgetDisplayMode");
    v25 = -[FTWidgetLingerState appearanceType](v17, "appearanceType");
    v26 = FTWidgetLingerStatePropertiesAreDifferent(v20, v17);
    objc_msgSend(v14, "timeIntervalSinceDate:", v21);
    -[FTWidgetLingerEventTracker _trackWidgetLingerEventWithEndTodaySource:endAppConfigTreatmentID:endWidgetDisplayMode:endAppearanceType:endPropertiesChanged:lingerInterval:](self, "_trackWidgetLingerEventWithEndTodaySource:endAppConfigTreatmentID:endWidgetDisplayMode:endAppearanceType:endPropertiesChanged:lingerInterval:", v22, v23, v24, v25, v26);

    -[FTWidgetLingerEventTracker setLingerInProgress:](self, "setLingerInProgress:", 0);
    -[FTWidgetLingerEventTracker setStartState:](self, "setStartState:", 0);
    -[FTWidgetLingerEventTracker setStartDate:](self, "setStartDate:", 0);

  }
LABEL_28:

}

- (void)_trackWidgetLingerEventWithEndTodaySource:(id)a3 endAppConfigTreatmentID:(id)a4 endWidgetDisplayMode:(unint64_t)a5 endAppearanceType:(unint64_t)a6 endPropertiesChanged:(BOOL)a7 lingerInterval:(double)a8
{
  _BOOL4 v9;
  id v14;
  id v15;
  void *v16;
  __CFString *v17;
  void *v18;
  __CFString *v19;
  void *v20;
  void *v21;
  void *v22;
  __CFString *v23;
  void *v24;
  void *v25;
  _QWORD v26[5];

  v9 = a7;
  v14 = a3;
  v15 = a4;
  if (!v14 && os_log_type_enabled((os_log_t)&_os_log_default, OS_LOG_TYPE_ERROR))
    sub_1000925C0();
  v16 = (void *)objc_claimAutoreleasedReturnValue(-[FTWidgetLingerEventTracker widgetLingerEventTracker](self, "widgetLingerEventTracker"));
  v17 = FTHeadlineSourcePropertyValueWithTodaySource(v14);
  v18 = (void *)objc_claimAutoreleasedReturnValue(v17);
  v19 = FTUserGroupPropertyValueWithAppConfigTreatmentID(v15);
  v20 = (void *)objc_claimAutoreleasedReturnValue(v19);
  v21 = (void *)objc_claimAutoreleasedReturnValue(+[NSNumber numberWithUnsignedInteger:](NSNumber, "numberWithUnsignedInteger:", a5, v18, v20));
  v26[2] = v21;
  v22 = (void *)objc_claimAutoreleasedReturnValue(+[NSNumber numberWithUnsignedInteger:](NSNumber, "numberWithUnsignedInteger:", a6));
  v26[3] = v22;
  v23 = FTBooleanPropertyValue(v9);
  v24 = (void *)objc_claimAutoreleasedReturnValue(v23);
  v26[4] = v24;
  v25 = (void *)objc_claimAutoreleasedReturnValue(+[NSArray arrayWithObjects:count:](NSArray, "arrayWithObjects:count:", v26, 5));
  objc_msgSend(v16, "trackEventWithPropertyValues:value:", v25, a8);

}

- (PETDistributionEventTracker)widgetLingerEventTracker
{
  return self->_widgetLingerEventTracker;
}

- (void)setWidgetLingerEventTracker:(id)a3
{
  objc_storeStrong((id *)&self->_widgetLingerEventTracker, a3);
}

- (BOOL)isLingerInProgress
{
  return self->_lingerInProgress;
}

- (void)setLingerInProgress:(BOOL)a3
{
  self->_lingerInProgress = a3;
}

- (FTWidgetLingerState)startState
{
  return self->_startState;
}

- (void)setStartState:(id)a3
{
  objc_setProperty_nonatomic_copy(self, a2, a3, 24);
}

- (NSDate)startDate
{
  return self->_startDate;
}

- (void)setStartDate:(id)a3
{
  objc_setProperty_nonatomic_copy(self, a2, a3, 32);
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_startDate, 0);
  objc_storeStrong((id *)&self->_startState, 0);
  objc_storeStrong((id *)&self->_widgetLingerEventTracker, 0);
}

@end
