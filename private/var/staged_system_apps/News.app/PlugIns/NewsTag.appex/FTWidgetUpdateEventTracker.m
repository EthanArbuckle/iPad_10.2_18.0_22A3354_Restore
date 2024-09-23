@implementation FTWidgetUpdateEventTracker

- (FTWidgetUpdateEventTracker)init
{
  FTWidgetUpdateEventTracker *v2;
  void *v3;
  void *v4;
  void *v5;
  void *v6;
  void *v7;
  id v8;
  void *v9;
  PETDistributionEventTracker *v10;
  PETDistributionEventTracker *widgetUpdateEventTracker;
  id v12;
  void *v13;
  PETScalarEventTracker *v14;
  PETScalarEventTracker *widgetUpdateFailureEventTracker;
  void *v17;
  void *v18;
  void *v19;
  void *v20;
  void *v21;
  void *v22;
  void *v23;
  objc_super v24;
  _QWORD v25[5];
  _QWORD v26[6];
  _QWORD v27[12];
  _QWORD v28[12];
  _QWORD v29[3];
  _QWORD v30[3];

  v24.receiver = self;
  v24.super_class = (Class)FTWidgetUpdateEventTracker;
  v2 = -[FTWidgetUpdateEventTracker init](&v24, "init");
  if (v2)
  {
    v3 = (void *)objc_claimAutoreleasedReturnValue(+[PETEventProperty ft_headlineSourceProperty](PETEventProperty, "ft_headlineSourceProperty"));
    v29[0] = &off_1000AED30;
    v29[1] = &off_1000AED48;
    v30[0] = CFSTR("new");
    v30[1] = CFSTR("no");
    v29[2] = &off_1000AED60;
    v30[2] = CFSTR("failed");
    v4 = (void *)objc_claimAutoreleasedReturnValue(+[NSDictionary dictionaryWithObjects:forKeys:count:](NSDictionary, "dictionaryWithObjects:forKeys:count:", v30, v29, 3));
    v20 = (void *)objc_claimAutoreleasedReturnValue(+[PETEventProperty propertyWithName:enumMapping:autoSanitizeValues:](PETEventProperty, "propertyWithName:enumMapping:autoSanitizeValues:", CFSTR("updateResult"), v4, 0));

    v22 = (void *)objc_claimAutoreleasedReturnValue(+[PETEventProperty ft_BOOLeanPropertyWithName:](PETEventProperty, "ft_BOOLeanPropertyWithName:", CFSTR("widgetVisible")));
    v23 = (void *)objc_claimAutoreleasedReturnValue(+[PETEventProperty ft_BOOLeanPropertyWithName:](PETEventProperty, "ft_BOOLeanPropertyWithName:", CFSTR("wifiReachable")));
    v27[0] = &off_1000AED78;
    v27[1] = &off_1000AED90;
    v28[0] = CFSTR("unknown");
    v28[1] = CFSTR("GPRS");
    v27[2] = &off_1000AEDA8;
    v27[3] = &off_1000AEDC0;
    v28[2] = CFSTR("Edge");
    v28[3] = CFSTR("WCDMA");
    v27[4] = &off_1000AEDD8;
    v27[5] = &off_1000AEDF0;
    v28[4] = CFSTR("HSDPA");
    v28[5] = CFSTR("HSUPA");
    v27[6] = &off_1000AEE08;
    v27[7] = &off_1000AEE20;
    v28[6] = CFSTR("CDMA1x");
    v28[7] = CFSTR("CDMAEVDORev0");
    v27[8] = &off_1000AEE38;
    v27[9] = &off_1000AEE50;
    v28[8] = CFSTR("CDMAEVDORevA");
    v28[9] = CFSTR("CDMAEVDORevB");
    v27[10] = &off_1000AEE68;
    v27[11] = &off_1000AEE80;
    v28[10] = CFSTR("HRPD");
    v28[11] = CFSTR("LTE");
    v5 = (void *)objc_claimAutoreleasedReturnValue(+[NSDictionary dictionaryWithObjects:forKeys:count:](NSDictionary, "dictionaryWithObjects:forKeys:count:", v28, v27, 12));
    v19 = (void *)objc_claimAutoreleasedReturnValue(+[PETEventProperty propertyWithName:enumMapping:](PETEventProperty, "propertyWithName:enumMapping:", CFSTR("cellTechName"), v5));

    v6 = (void *)objc_claimAutoreleasedReturnValue(+[PETEventProperty ft_userGroupProperty](PETEventProperty, "ft_userGroupProperty"));
    v21 = (void *)objc_claimAutoreleasedReturnValue(+[NSArray fc_array:](NSArray, "fc_array:", &stru_1000AAD30));
    v18 = (void *)objc_claimAutoreleasedReturnValue(+[PETEventProperty propertyWithName:possibleValues:](PETEventProperty, "propertyWithName:possibleValues:", CFSTR("errorDomain"), v21));
    v17 = (void *)objc_claimAutoreleasedReturnValue(+[PETEventProperty ft_BOOLeanPropertyWithName:](PETEventProperty, "ft_BOOLeanPropertyWithName:", CFSTR("errorCodeValid")));
    v7 = (void *)objc_claimAutoreleasedReturnValue(+[PETEventProperty propertyWithName:range:clampValues:](PETEventProperty, "propertyWithName:range:clampValues:", CFSTR("errorCode"), 0, 50, 1));
    v8 = objc_alloc((Class)PETDistributionEventTracker);
    v26[0] = v3;
    v26[1] = v20;
    v26[2] = v22;
    v26[3] = v23;
    v26[4] = v19;
    v26[5] = v6;
    v9 = (void *)objc_claimAutoreleasedReturnValue(+[NSArray arrayWithObjects:count:](NSArray, "arrayWithObjects:count:", v26, 6));
    v10 = (PETDistributionEventTracker *)objc_msgSend(v8, "initWithFeatureId:event:registerProperties:", CFSTR("NewsWidget"), CFSTR("wdgtUpdate"), v9);
    widgetUpdateEventTracker = v2->_widgetUpdateEventTracker;
    v2->_widgetUpdateEventTracker = v10;

    v12 = objc_alloc((Class)PETScalarEventTracker);
    v25[0] = v3;
    v25[1] = v6;
    v25[2] = v18;
    v25[3] = v17;
    v25[4] = v7;
    v13 = (void *)objc_claimAutoreleasedReturnValue(+[NSArray arrayWithObjects:count:](NSArray, "arrayWithObjects:count:", v25, 5));
    v14 = (PETScalarEventTracker *)objc_msgSend(v12, "initWithFeatureId:event:registerProperties:", CFSTR("NewsWidget"), CFSTR("wdgtUpdateFailure"), v13);
    widgetUpdateFailureEventTracker = v2->_widgetUpdateFailureEventTracker;
    v2->_widgetUpdateFailureEventTracker = v14;

  }
  return v2;
}

- (void)trackUpdateWithTodaySource:(id)a3 appConfigTreatmentID:(id)a4 error:(id)a5 updateFetchDuration:(double)a6 wifiReachable:(BOOL)a7 cellularRadioAccessTechnology:(int64_t)a8
{
  _BOOL4 v9;
  id v14;
  id v15;
  id v16;
  __CFString *v17;
  void *v18;
  __CFString *v19;
  void *v20;
  void *v21;
  void *v22;
  __CFString *v23;
  void *v24;
  __CFString *v25;
  void *v26;
  void *v27;
  FTWidgetUpdateEventTracker *v28;
  void *v29;
  __CFString *v30;
  id v31;
  void *v32;
  unsigned int v33;
  __CFString *v34;
  __CFString *v35;
  id v36;
  void *v37;
  __CFString *v38;
  void *v39;
  void *v40;
  void *v41;
  void *v42;
  void *v43;
  _QWORD v44[5];
  _QWORD v45[6];

  v9 = a7;
  v14 = a3;
  v15 = a4;
  v16 = a5;
  if (!v14 && os_log_type_enabled((os_log_t)&_os_log_default, OS_LOG_TYPE_ERROR))
    sub_100082318();
  if (a6 < 0.0 && os_log_type_enabled((os_log_t)&_os_log_default, OS_LOG_TYPE_ERROR))
    sub_100082250();
  v42 = v14;
  v17 = FTHeadlineSourcePropertyValueWithTodaySource(v14);
  v18 = (void *)objc_claimAutoreleasedReturnValue(v17);
  v43 = v15;
  v19 = FTUserGroupPropertyValueWithAppConfigTreatmentID(v15);
  v20 = (void *)objc_claimAutoreleasedReturnValue(v19);
  v21 = (void *)objc_claimAutoreleasedReturnValue(-[FTWidgetUpdateEventTracker widgetUpdateEventTracker](self, "widgetUpdateEventTracker"));
  v45[0] = v18;
  v22 = (void *)objc_claimAutoreleasedReturnValue(+[NSNumber numberWithUnsignedInteger:](NSNumber, "numberWithUnsignedInteger:", 2 * (v16 != 0)));
  v45[1] = v22;
  v23 = FTBooleanPropertyValue(0);
  v24 = (void *)objc_claimAutoreleasedReturnValue(v23);
  v45[2] = v24;
  v25 = FTBooleanPropertyValue(v9);
  v26 = (void *)objc_claimAutoreleasedReturnValue(v25);
  v45[3] = v26;
  v27 = (void *)objc_claimAutoreleasedReturnValue(+[NSNumber numberWithInteger:](NSNumber, "numberWithInteger:", a8));
  v45[4] = v27;
  v45[5] = v20;
  v28 = self;
  v29 = (void *)objc_claimAutoreleasedReturnValue(+[NSArray arrayWithObjects:count:](NSArray, "arrayWithObjects:count:", v45, 6));
  objc_msgSend(v21, "trackEventWithPropertyValues:value:", v29, a6);

  if (v16)
  {
    v30 = (__CFString *)objc_claimAutoreleasedReturnValue(objc_msgSend(v16, "domain", v42, v43));
    v31 = sub_100016E6C();
    v32 = (void *)objc_claimAutoreleasedReturnValue(v31);
    v33 = objc_msgSend(v32, "containsObject:", v30);
    v34 = CFSTR("other");
    if (v33)
      v34 = v30;
    v35 = v34;

    v36 = objc_msgSend(v16, "code");
    v37 = (void *)objc_claimAutoreleasedReturnValue(-[FTWidgetUpdateEventTracker widgetUpdateFailureEventTracker](v28, "widgetUpdateFailureEventTracker"));
    v44[0] = v18;
    v44[1] = v20;
    v44[2] = v35;
    v38 = FTBooleanPropertyValue((unint64_t)v36 < 0x32);
    v39 = (void *)objc_claimAutoreleasedReturnValue(v38);
    v44[3] = v39;
    v40 = (void *)objc_claimAutoreleasedReturnValue(+[NSNumber numberWithInteger:](NSNumber, "numberWithInteger:", v36));
    v44[4] = v40;
    v41 = (void *)objc_claimAutoreleasedReturnValue(+[NSArray arrayWithObjects:count:](NSArray, "arrayWithObjects:count:", v44, 5));

    objc_msgSend(v37, "trackEventWithPropertyValues:", v41);
  }

}

- (PETDistributionEventTracker)widgetUpdateEventTracker
{
  return self->_widgetUpdateEventTracker;
}

- (void)setWidgetUpdateEventTracker:(id)a3
{
  objc_storeStrong((id *)&self->_widgetUpdateEventTracker, a3);
}

- (PETScalarEventTracker)widgetUpdateFailureEventTracker
{
  return self->_widgetUpdateFailureEventTracker;
}

- (void)setWidgetUpdateFailureEventTracker:(id)a3
{
  objc_storeStrong((id *)&self->_widgetUpdateFailureEventTracker, a3);
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_widgetUpdateFailureEventTracker, 0);
  objc_storeStrong((id *)&self->_widgetUpdateEventTracker, 0);
}

@end
