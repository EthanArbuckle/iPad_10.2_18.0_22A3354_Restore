@implementation _DASPredictionManager

+ (void)setPrediction:(id)a3 forKey:(id)a4
{
  id v5;
  void *v6;
  id v7;
  id v8;
  id v9;

  v9 = a3;
  v5 = a4;
  v6 = objc_autoreleasePoolPush();
  v7 = (id)qword_1001ABAB8;
  objc_sync_enter(v7);
  objc_msgSend((id)qword_1001ABAB8, "setObject:forKeyedSubscript:", v9, v5);
  objc_sync_exit(v7);

  v8 = (id)qword_1001ABAC0;
  objc_sync_enter(v8);
  objc_msgSend((id)qword_1001ABAC0, "removeObjectForKey:", v5);
  objc_sync_exit(v8);

  objc_autoreleasePoolPop(v6);
}

+ (BOOL)predictionNeedsUpdating:(id)a3 atDate:(id)a4 lastUpdatedAt:(id)a5
{
  id v7;
  id v8;
  id v9;
  double v10;
  unsigned __int8 v11;
  double v12;

  v7 = a3;
  v8 = a4;
  v9 = a5;
  if (v9)
  {
    objc_msgSend(v8, "timeIntervalSinceDate:", v9);
    if (v10 >= 900.0)
    {
      objc_msgSend(v8, "timeIntervalSinceDate:", v9);
      v11 = 1;
      if (v7 && v12 <= 10800.0)
        v11 = objc_msgSend(v7, "isUnavailable");
    }
    else
    {
      v11 = 0;
    }
  }
  else
  {
    v11 = 1;
  }

  return v11;
}

+ (void)asyncDo:(id)a3
{
  id v4;
  void *v5;
  void *v6;
  id v7;
  NSObject *v8;
  id v9;
  id v10;
  _QWORD v11[4];
  id v12;
  id v13;

  v4 = a3;
  v5 = (void *)os_transaction_create("com.apple.dasd.predictionManager.asyncDo");
  v6 = objc_autoreleasePoolPush();
  v7 = objc_msgSend((id)objc_opt_class(a1), "predictionGenerationQueue");
  v8 = objc_claimAutoreleasedReturnValue(v7);
  v11[0] = _NSConcreteStackBlock;
  v11[1] = 3221225472;
  v11[2] = sub_10001100C;
  v11[3] = &unk_10015EBE8;
  v9 = v5;
  v12 = v9;
  v10 = v4;
  v13 = v10;
  dispatch_async(v8, v11);

  objc_autoreleasePoolPop(v6);
}

+ (id)predictionGenerationQueue
{
  if (qword_1001ABAE8 != -1)
    dispatch_once(&qword_1001ABAE8, &stru_10015EBC0);
  return (id)qword_1001ABAF0;
}

+ (id)predictionForKey:(id)a3
{
  id v3;
  void *v4;
  id v5;
  void *v6;

  v3 = a3;
  v4 = objc_autoreleasePoolPush();
  v5 = (id)qword_1001ABAB8;
  objc_sync_enter(v5);
  v6 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend((id)qword_1001ABAB8, "objectForKeyedSubscript:", v3));
  objc_sync_exit(v5);

  objc_autoreleasePoolPop(v4);
  return v6;
}

+ (id)sharedKnowledgeStore
{
  if (qword_1001ABAD0 != -1)
    dispatch_once(&qword_1001ABAD0, &stru_10015EBA0);
  return (id)qword_1001ABAD8;
}

+ (id)sharedPredictor
{
  _QWORD block[5];

  block[0] = _NSConcreteStackBlock;
  block[1] = 3221225472;
  block[2] = sub_100075B08;
  block[3] = &unk_10015D3A8;
  block[4] = a1;
  if (qword_1001ABAE0 != -1)
    dispatch_once(&qword_1001ABAE0, block);
  return (id)qword_1001ABAC8;
}

+ (void)initialize
{
  if (qword_1001ABAF8 != -1)
    dispatch_once(&qword_1001ABAF8, &stru_10015EC08);
}

+ (id)currentPredictions
{
  id v2;
  id v3;

  v2 = (id)qword_1001ABAB8;
  objc_sync_enter(v2);
  v3 = objc_msgSend((id)qword_1001ABAB8, "copy");
  objc_sync_exit(v2);

  return v3;
}

+ (id)cacheDetailsForPredictionWithKey:(id)a3
{
  void *v3;
  void *v4;
  double v5;
  void *v6;
  double v7;
  double v8;
  void *v9;
  void *v11;
  void *v12;
  void *v13;
  void *v14;
  char *v15;
  double v16;
  double v17;
  void *v18;
  void *v19;
  void *v20;
  double v21;
  double v22;
  void *v23;
  void *v24;
  id v25;
  id v26;
  BOOL v27;
  double v28;
  double v29;
  id v30;
  void *v31;
  id v32;
  id v33;
  void *v34;
  void *v35;
  _QWORD v36[2];
  _QWORD v37[2];

  v33 = a3;
  v3 = (void *)objc_claimAutoreleasedReturnValue(+[_DASPredictionManager predictionForKey:](_DASPredictionManager, "predictionForKey:"));
  v34 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v3, "startDate"));
  if (!v3)
    goto LABEL_5;
  v4 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v3, "startDate"));
  objc_msgSend(v4, "timeIntervalSinceNow");
  if (v5 > 604800.0)
  {

LABEL_5:
    v9 = 0;
    goto LABEL_6;
  }
  v6 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v3, "endDate"));
  objc_msgSend(v6, "timeIntervalSinceNow");
  v8 = v7;

  if (v8 > 604800.0)
    goto LABEL_5;
  v11 = (void *)objc_claimAutoreleasedReturnValue(+[NSMutableArray arrayWithObject:](NSMutableArray, "arrayWithObject:", v34));
  v12 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v3, "transitionDates"));
  objc_msgSend(v11, "addObjectsFromArray:", v12);

  if (objc_msgSend(v11, "count") == (id)1)
  {
    v13 = 0;
    v14 = 0;
    v35 = 0;
    v9 = &__NSDictionary0__struct;
    goto LABEL_30;
  }
  v15 = 0;
  v35 = 0;
  v14 = 0;
  v13 = 0;
  v16 = 0.0;
  v17 = 0.0;
  do
  {
    v18 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v11, "objectAtIndexedSubscript:", v15++));
    v19 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v11, "objectAtIndexedSubscript:", v15));
    v20 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v3, "valueAtDate:", v18));
    objc_msgSend(v20, "doubleValue");
    if (v21 < 0.05)
    {
      objc_msgSend(v19, "timeIntervalSinceDate:", v18);
      v16 = v16 + v22;
      v23 = v18;
      v24 = v35;
      if (v14)
        goto LABEL_19;
LABEL_18:
      v26 = v18;
      v14 = v23;
      v35 = v24;
      goto LABEL_19;
    }
    if (v14)
    {
      if (v16 > v17)
      {
        v25 = v14;

        v13 = v25;
        v17 = v16;
      }

      v16 = 0.0;
    }
    v23 = 0;
    v14 = 0;
    v24 = v18;
    if (!v35)
      goto LABEL_18;
LABEL_19:

  }
  while (v15 < (char *)objc_msgSend(v11, "count") - 1);
  v27 = v16 <= 0.0 || v35 == 0;
  if (v27 || (objc_msgSend(v35, "timeIntervalSinceDate:", v34), v29 = v16 + v28, v29 <= v17))
  {
    v29 = v17;
  }
  else
  {
    v30 = v14;

    v13 = v30;
  }
  v9 = &__NSDictionary0__struct;
  if (v29 >= 7200.0 && v13)
  {
    v36[0] = CFSTR("periodStart");
    v36[1] = CFSTR("periodEnd");
    v37[0] = v13;
    v31 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v13, "dateByAddingTimeInterval:", v29));
    v37[1] = v31;
    v9 = (void *)objc_claimAutoreleasedReturnValue(+[NSDictionary dictionaryWithObjects:forKeys:count:](NSDictionary, "dictionaryWithObjects:forKeys:count:", v37, v36, 2));

  }
LABEL_30:
  v32 = (id)qword_1001ABAC0;
  objc_sync_enter(v32);
  objc_msgSend((id)qword_1001ABAC0, "setObject:forKeyedSubscript:", v9, v33);
  objc_sync_exit(v32);

LABEL_6:
  return v9;
}

+ (id)lowLikelihoodPeriodStartForPredictionWithKey:(id)a3
{
  id v4;
  id v5;
  void *v6;
  void *v7;
  void *v8;
  id v9;
  id v10;
  void *v11;

  v4 = a3;
  v5 = (id)qword_1001ABAC0;
  objc_sync_enter(v5);
  v6 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend((id)qword_1001ABAC0, "objectForKeyedSubscript:", v4));
  v7 = v6;
  if (v6)
    v8 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v6, "objectForKeyedSubscript:", CFSTR("periodStart")));
  else
    v8 = 0;

  objc_sync_exit(v5);
  if (v8)
  {
    v9 = v8;
  }
  else
  {
    v10 = objc_msgSend((id)objc_opt_class(a1), "cacheDetailsForPredictionWithKey:", v4);
    v11 = (void *)objc_claimAutoreleasedReturnValue(v10);
    v9 = (id)objc_claimAutoreleasedReturnValue(objc_msgSend(v11, "objectForKeyedSubscript:", CFSTR("periodStart")));

  }
  return v9;
}

+ (id)lowLikelihoodPeriodEndForPredictionWithKey:(id)a3
{
  id v4;
  id v5;
  void *v6;
  void *v7;
  void *v8;
  id v9;
  id v10;
  void *v11;

  v4 = a3;
  v5 = (id)qword_1001ABAC0;
  objc_sync_enter(v5);
  v6 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend((id)qword_1001ABAC0, "objectForKeyedSubscript:", v4));
  v7 = v6;
  if (v6)
    v8 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v6, "objectForKeyedSubscript:", CFSTR("periodEnd")));
  else
    v8 = 0;

  objc_sync_exit(v5);
  if (v8)
  {
    v9 = v8;
  }
  else
  {
    v10 = objc_msgSend((id)objc_opt_class(a1), "cacheDetailsForPredictionWithKey:", v4);
    v11 = (void *)objc_claimAutoreleasedReturnValue(v10);
    v9 = (id)objc_claimAutoreleasedReturnValue(objc_msgSend(v11, "objectForKeyedSubscript:", CFSTR("periodEnd")));

  }
  return v9;
}

+ (id)getValuesForPrediction:(id)a3 tillEndDate:(id)a4 withIntervals:(double)a5
{
  id v7;
  id v8;
  void *v9;
  double v10;
  double v11;
  void *v12;
  id v14;
  double v15;
  void *v16;
  double v17;
  double v18;
  id v19;
  id v20;
  void *v21;
  double v22;
  double v23;
  unint64_t v24;
  uint64_t i;
  uint64_t v26;
  void *v27;
  double v28;
  double v29;
  void *v30;
  double v31;
  double v32;
  unint64_t v33;
  void *v34;
  void *v35;
  void *v36;
  void *v37;
  double v38;
  double v39;
  void *v40;
  double v41;
  double v42;
  unint64_t v43;
  void *v44;

  v7 = a3;
  v8 = a4;
  v9 = (void *)objc_claimAutoreleasedReturnValue(+[NSDate date](NSDate, "date"));
  objc_msgSend(v9, "timeIntervalSinceDate:", v8);
  if (v10 >= 0.0)
    goto LABEL_3;
  objc_msgSend(v8, "timeIntervalSinceDate:", v9);
  if (v11 > 86400.0)
    goto LABEL_3;
  v14 = (id)objc_claimAutoreleasedReturnValue(objc_msgSend(v7, "startDate"));
  objc_msgSend(v8, "timeIntervalSinceDate:", v14);
  if (v15 <= 0.0)
  {
    v12 = 0;
LABEL_23:

    goto LABEL_4;
  }
  v16 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v7, "endDate"));
  objc_msgSend(v16, "timeIntervalSinceDate:", v9);
  v18 = v17;

  if (v18 > 0.0)
  {
    v12 = (void *)objc_claimAutoreleasedReturnValue(+[NSMutableArray array](NSMutableArray, "array"));
    v19 = v9;
    v20 = v8;
    v21 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v7, "startDate"));
    objc_msgSend(v21, "timeIntervalSinceDate:", v19);
    v23 = v22;

    if (v23 <= 0.0)
    {
      v24 = 0;
    }
    else
    {
      v24 = (unint64_t)(v23 / a5);
      if (v24)
      {
        for (i = 0; i != v24; ++i)
          objc_msgSend(v12, "setObject:atIndexedSubscript:", &off_10016E9F0, i);
      }
      v26 = objc_claimAutoreleasedReturnValue(objc_msgSend(v7, "startDate"));

      v19 = (id)v26;
    }
    v27 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v7, "endDate"));
    objc_msgSend(v20, "timeIntervalSinceDate:", v27);
    v29 = v28;

    v30 = v20;
    if (v29 > 0.0)
    {
      v30 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v7, "endDate"));

    }
    objc_msgSend(v30, "timeIntervalSinceDate:", v19);
    v32 = v31;
    v14 = v19;
    v33 = (unint64_t)(v32 / a5);
    v44 = v30;
    v34 = v14;
    if (v24 < v33)
    {
      do
      {
        v35 = v34;
        v36 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v7, "valueAtDate:", v34));
        objc_msgSend(v12, "setObject:atIndexedSubscript:", v36, v24);

        v34 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v35, "dateByAddingTimeInterval:", a5));
        ++v24;
      }
      while (v33 != v24);
      v24 = (unint64_t)(v32 / a5);
    }
    v37 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v7, "endDate"));
    objc_msgSend(v20, "timeIntervalSinceDate:", v37);
    v39 = v38;

    if (v39 > 0.0)
    {
      v40 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v7, "endDate"));
      objc_msgSend(v20, "timeIntervalSinceDate:", v40);
      v42 = v41;

      v43 = (unint64_t)(v42 / a5);
      if (v24 < v43)
      {
        do
          objc_msgSend(v12, "setObject:atIndexedSubscript:", &off_10016E9F0, v24++);
        while (v43 != v24);
      }
    }

    goto LABEL_23;
  }
LABEL_3:
  v12 = 0;
LABEL_4:

  return v12;
}

@end
