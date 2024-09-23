@implementation _MapsApplicationDelegateTestingCoordinator

+ (void)doPostLauchTestSetupWithMapView:(id)a3 mapsAppTesting:(id)a4
{
  id v5;
  id v6;
  void *v7;
  void *v8;
  id v9;
  _QWORD *v10;
  uint64_t v11;
  _QWORD v12[4];
  _QWORD *v13;
  _QWORD v14[4];
  id v15;

  v5 = a3;
  v6 = a4;
  v7 = (void *)objc_claimAutoreleasedReturnValue(+[GEOCountryConfiguration sharedConfiguration](GEOCountryConfiguration, "sharedConfiguration"));
  v8 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v7, "countryCode"));

  if (objc_msgSend(v8, "isEqualToString:", CFSTR("US")))
  {
    objc_msgSend(v5, "_mapstest_jumpToCupertino");
  }
  else if (objc_msgSend(v8, "isEqualToString:", CFSTR("JP")))
  {
    objc_msgSend(v5, "_mapstest_jumpToTokyo");
  }
  v14[0] = _NSConcreteStackBlock;
  v14[1] = 3221225472;
  v14[2] = sub_1004AE5E8;
  v14[3] = &unk_1011AC860;
  v9 = v6;
  v15 = v9;
  v10 = objc_retainBlock(v14);
  if (objc_msgSend(v5, "isFullyDrawn"))
  {
    ((void (*)(_QWORD *))v10[2])(v10);
  }
  else
  {
    v11 = VKMapViewDidBecomeFullyDrawnNotification;
    v12[0] = _NSConcreteStackBlock;
    v12[1] = 3221225472;
    v12[2] = sub_1004AE62C;
    v12[3] = &unk_1011B5B38;
    v13 = v10;
    +[PPTNotificationCenter addOnceObserverForName:object:usingBlock:](PPTNotificationCenter, "addOnceObserverForName:object:usingBlock:", v11, 0, v12);

  }
}

+ (void)setCurrentTest:(id)a3
{
  objc_storeStrong((id *)&qword_1014D2630, a3);
}

+ (MapsAppTest)currentTest
{
  return (MapsAppTest *)(id)qword_1014D2630;
}

+ (BOOL)application:(id)a3 testName:(id)a4 options:(id)a5 shouldLoadSampleProactiveData:(BOOL)a6 shouldRaiseExceptionIfNeeded:(BOOL)a7 runTest:(id)a8
{
  _BOOL4 v9;
  id v13;
  id v14;
  id v15;
  uint64_t (**v16)(id, id, id, id);
  void *v17;
  void *v18;
  uint64_t v19;
  void *v20;
  void *v21;
  BOOL v22;

  v9 = a6;
  v13 = a3;
  v14 = a4;
  v15 = a5;
  v16 = (uint64_t (**)(id, id, id, id))a8;
  v17 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v15, "_mapstest_readSubTestsFromTestSerial"));
  if (objc_msgSend(v17, "count"))
  {
    v18 = (void *)objc_claimAutoreleasedReturnValue(+[NSMutableDictionary dictionaryWithDictionary:](NSMutableDictionary, "dictionaryWithDictionary:", v15));
    objc_msgSend(v18, "setObject:forKeyedSubscript:", v17, CFSTR("serialSubTests"));

    v15 = v18;
  }
  if (v9 && !objc_msgSend(a1, "_writeSampleDataToHistoryContainer"))
  {
    v22 = 0;
  }
  else
  {
    v19 = v16[2](v16, v14, v13, v15);
    v20 = (void *)objc_claimAutoreleasedReturnValue(v19);
    objc_msgSend(a1, "setCurrentTest:", v20);

    v21 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(a1, "currentTest"));
    v22 = v21 != 0;

  }
  return v22;
}

+ (BOOL)_writeSampleDataToHistoryContainer
{
  NSBundle *v2;
  void *v3;
  void *v4;
  id v5;
  id v6;
  BOOL v7;
  id v8;
  unsigned __int8 v9;
  void *v10;
  id v12;
  id v13;

  v2 = +[NSBundle bundleForClass:](NSBundle, "bundleForClass:", objc_opt_class(a1));
  v3 = (void *)objc_claimAutoreleasedReturnValue(v2);
  v4 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v3, "pathForResource:ofType:", CFSTR("PPTTestProactiveData"), CFSTR("mapsdata")));

  v13 = 0;
  v5 = objc_msgSend(objc_alloc((Class)NSData), "initWithContentsOfFile:options:error:", v4, 0, &v13);
  v6 = v13;
  if (v5)
    v7 = v6 == 0;
  else
    v7 = 0;
  if (v7)
  {
    v10 = (void *)objc_claimAutoreleasedReturnValue(+[MSPMapsPaths geoHistorySettingsPath](MSPMapsPaths, "geoHistorySettingsPath"));
    v12 = 0;
    v9 = objc_msgSend(v5, "writeToFile:options:error:", v10, 1, &v12);
    v8 = v12;

  }
  else
  {
    v8 = v6;
    v9 = 0;
  }

  return v9;
}

@end
