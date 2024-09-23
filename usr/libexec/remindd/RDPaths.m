@implementation RDPaths

+ (NSURL)locationBundleURL
{
  if (qword_100852640 != -1)
    dispatch_once(&qword_100852640, &stru_1007D79D8);
  return (NSURL *)(id)qword_100852638;
}

+ (NSURL)defaultApplicationDocumentsURL
{
  void *v2;
  id v3;

  if ((objc_msgSend(a1, "isDataSeparationEnabled") & 1) != 0)
  {
    if (qword_100852648 != -1)
      dispatch_once(&qword_100852648, &stru_1007D79F8);
    v2 = (void *)qword_100852650;
    if (!qword_100852650)
    {
      dispatch_sync((dispatch_queue_t)qword_100852630, &stru_1007D7A18);
      v2 = (void *)qword_100852650;
    }
    v3 = v2;
  }
  else
  {
    v3 = (id)objc_claimAutoreleasedReturnValue(+[REMPaths legacy_applicationDocumentsURL](REMPaths, "legacy_applicationDocumentsURL"));
  }
  return (NSURL *)v3;
}

+ (id)defaultReminderDataContainerURL
{
  void *v2;
  void *v3;

  v2 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(a1, "defaultApplicationDocumentsURL"));
  v3 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v2, "rem_URLByAppendingReminderDataContainerPathComponent"));

  return v3;
}

+ (id)reminderDataContainerURLWithAppDocumentsURL:(id)a3
{
  return objc_msgSend(a3, "rem_URLByAppendingReminderDataContainerPathComponent");
}

+ (id)pptSentinelURLInContainerURL:(id)a3
{
  return objc_msgSend(a3, "URLByAppendingPathComponent:", CFSTR("ppt.sentinel"));
}

+ (BOOL)isDataSeparationEnabled
{
  void *v2;
  unsigned __int8 v3;

  v2 = (void *)objc_claimAutoreleasedReturnValue(+[RDFeatureFlagsObjCWrapper wrappedFeatureFlagsWithRawValue:](RDFeatureFlagsObjCWrapper, "wrappedFeatureFlagsWithRawValue:", CFSTR("dataSeparation")));
  v3 = objc_msgSend(v2, "isEnabled");

  return v3;
}

+ (id)urlForIsolatedContainerWithIdentifier:(id)a3
{
  id v4;
  void *v5;
  void *v6;
  void *v7;

  v4 = a3;
  v5 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(a1, "defaultApplicationDocumentsURL"));
  v6 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v5, "URLByAppendingPathComponent:isDirectory:", CFSTR("IsolatedContainers/"), 1));
  v7 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v6, "URLByAppendingPathComponent:isDirectory:", v4, 1));

  return v7;
}

+ (void)unitTest_setDefaultApplicationDocumentsURL:(id)a3
{
  id v4;
  NSObject *v5;
  id v6;
  _QWORD block[4];
  id v8;

  v4 = a3;
  if (qword_100852648 != -1)
    dispatch_once(&qword_100852648, &stru_1007D7A38);
  v5 = qword_100852630;
  block[0] = _NSConcreteStackBlock;
  block[1] = 3221225472;
  block[2] = sub_10001D960;
  block[3] = &unk_1007D7A60;
  v6 = v4;
  v8 = v6;
  dispatch_sync(v5, block);
  if ((objc_msgSend(a1, "isDataSeparationEnabled") & 1) == 0)
    +[REMPaths unitTest_setLegacyApplicationDocumentsURL:](REMPaths, "unitTest_setLegacyApplicationDocumentsURL:", v6);

}

@end
