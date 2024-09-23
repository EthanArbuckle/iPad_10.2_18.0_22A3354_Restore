@implementation NSManagedObject

+ (id)_gkFetchRequest
{
  void *v2;

  v2 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(a1, "fetchRequest"));
  objc_msgSend(v2, "setIncludesSubentities:", 1);
  objc_msgSend(v2, "setIncludesPropertyValues:", 1);
  objc_msgSend(v2, "setIncludesPendingChanges:", 1);
  objc_msgSend(v2, "setReturnsObjectsAsFaults:", 0);
  return v2;
}

- (BOOL)_gkIsExpired:(id)a3
{
  id v3;
  void *v4;
  unsigned __int8 v5;
  BOOL v6;
  double v7;

  v3 = a3;
  v4 = (void *)objc_claimAutoreleasedReturnValue(+[GKPreferences shared](GKPreferences, "shared"));
  v5 = objc_msgSend(v4, "networkManagerIgnoreCache");

  v6 = 1;
  if (v3 && (v5 & 1) == 0)
  {
    objc_msgSend(v3, "timeIntervalSinceNow");
    v6 = v7 <= 0.0;
  }

  return v6;
}

+ (id)_gkRetrieveCleanEntry:(id)a3 request:(id)a4
{
  id v5;
  id v6;
  void *v7;
  id v8;
  void *v9;
  id v10;
  void *v11;
  unint64_t v12;
  void *v13;
  void *v14;
  id v16;

  v5 = a3;
  v6 = a4;
  v16 = 0;
  v7 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v5, "executeFetchRequest:error:", v6, &v16));
  v8 = v16;
  v9 = v8;
  if (v8)
  {
    if (!os_log_GKGeneral)
      v10 = (id)GKOSLoggers(v8);
    v11 = (void *)os_log_GKError;
    if (os_log_type_enabled(os_log_GKError, OS_LOG_TYPE_ERROR))
      sub_10003EF84((uint64_t)v9, v11, v6);
    v12 = 0;
  }
  else
  {
    if (objc_msgSend(v7, "count") == (id)1)
      goto LABEL_11;
    v12 = 1;
  }
  while ((unint64_t)objc_msgSend(v7, "count") > v12)
  {
    v13 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v7, "objectAtIndexedSubscript:", v12));
    objc_msgSend(v5, "deleteObject:", v13);

    ++v12;
  }
LABEL_11:
  v14 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v7, "lastObject"));

  return v14;
}

+ (id)_gkObjectsMatchingPredicate:(id)a3 withContext:(id)a4
{
  id v6;
  id v7;
  void *v8;
  void *v9;

  v6 = a4;
  v7 = a3;
  v8 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(a1, "_gkFetchRequest"));
  objc_msgSend(v8, "setPredicate:", v7);

  v9 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(a1, "_gkObjectsFromFetchRequest:withContext:", v8, v6));
  return v9;
}

+ (id)_gkObjectsFromFetchRequest:(id)a3 withContext:(id)a4
{
  void *v4;
  id v5;
  void *v6;
  id v7;
  NSObject *v8;
  _BOOL8 v9;
  NSObject *v10;
  id v11;
  id v13;
  uint8_t buf[4];
  void *v15;

  v13 = 0;
  v4 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(a4, "executeFetchRequest:error:", a3, &v13));
  v5 = v13;
  v6 = v5;
  if (v5)
  {
    if (!os_log_GKGeneral)
      v7 = (id)GKOSLoggers(v5);
    v8 = os_log_GKError;
    v9 = os_log_type_enabled(os_log_GKError, OS_LOG_TYPE_ERROR);
    if (v9)
      sub_10003F040(v8);
    v10 = os_log_GKGeneral;
    if (!os_log_GKGeneral)
    {
      v11 = (id)GKOSLoggers(v9);
      v10 = os_log_GKGeneral;
    }
    if (os_log_type_enabled(v10, OS_LOG_TYPE_INFO))
    {
      *(_DWORD *)buf = 138412290;
      v15 = v6;
      _os_log_impl((void *)&_mh_execute_header, v10, OS_LOG_TYPE_INFO, "Fetch request error: %@", buf, 0xCu);
    }
  }

  return v4;
}

@end
