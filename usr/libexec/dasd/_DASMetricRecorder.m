@implementation _DASMetricRecorder

+ (void)incrementOccurrencesForKey:(id)a3 byCount:(int64_t)a4
{
  id v6;
  void *v7;
  void *v8;
  void *v9;
  _QWORD v10[2];
  _QWORD v11[2];

  v6 = a3;
  v7 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(a1, "batchingQueue"));
  v10[0] = CFSTR("key");
  v10[1] = CFSTR("value");
  v11[0] = v6;
  v8 = (void *)objc_claimAutoreleasedReturnValue(+[NSNumber numberWithLongLong:](NSNumber, "numberWithLongLong:", a4));
  v11[1] = v8;
  v9 = (void *)objc_claimAutoreleasedReturnValue(+[NSDictionary dictionaryWithObjects:forKeys:count:](NSDictionary, "dictionaryWithObjects:forKeys:count:", v11, v10, 2));

  objc_msgSend(v7, "addWorkItem:", v9);
}

+ (id)batchingQueue
{
  _QWORD block[5];

  block[0] = _NSConcreteStackBlock;
  block[1] = 3221225472;
  block[2] = sub_1000891D8;
  block[3] = &unk_10015D3A8;
  block[4] = a1;
  if (qword_1001ABBD8 != -1)
    dispatch_once(&qword_1001ABBD8, block);
  return (id)qword_1001ABBE0;
}

+ (id)metricQueue
{
  if (qword_1001ABBC8 != -1)
    dispatch_once(&qword_1001ABBC8, &stru_10015F338);
  return (id)qword_1001ABBD0;
}

+ (void)recordOccurrenceForKey:(id)a3
{
  id v4;
  void *v5;
  void *v6;
  _QWORD v7[2];
  _QWORD v8[2];

  v4 = a3;
  v5 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(a1, "batchingQueue"));
  v7[0] = CFSTR("key");
  v7[1] = CFSTR("value");
  v8[0] = v4;
  v8[1] = &off_10016EBE8;
  v6 = (void *)objc_claimAutoreleasedReturnValue(+[NSDictionary dictionaryWithObjects:forKeys:count:](NSDictionary, "dictionaryWithObjects:forKeys:count:", v8, v7, 2));

  objc_msgSend(v5, "addWorkItem:", v6);
}

+ (void)incrementOccurrencesForKeys:(id)a3 byCounts:(id)a4
{
  id v6;
  id v7;
  id v8;
  char *v9;
  char *v10;
  char *i;
  void *v12;
  void *v13;
  void *v14;
  void *v15;
  _QWORD v16[2];
  _QWORD v17[2];

  v6 = a3;
  v7 = a4;
  v8 = objc_msgSend(v6, "count");
  if (v8 == objc_msgSend(v7, "count"))
  {
    v9 = (char *)objc_msgSend(v6, "count");
    if (v9)
    {
      v10 = v9;
      for (i = 0; i != v10; ++i)
      {
        v12 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(a1, "batchingQueue"));
        v16[0] = CFSTR("key");
        v13 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v6, "objectAtIndexedSubscript:", i));
        v16[1] = CFSTR("value");
        v17[0] = v13;
        v14 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v7, "objectAtIndexedSubscript:", i));
        v17[1] = v14;
        v15 = (void *)objc_claimAutoreleasedReturnValue(+[NSDictionary dictionaryWithObjects:forKeys:count:](NSDictionary, "dictionaryWithObjects:forKeys:count:", v17, v16, 2));
        objc_msgSend(v12, "addWorkItem:", v15);

      }
    }
  }

}

+ (void)aggregateAndPostCAEvents:(id)a3
{
  id v3;
  id v4;
  id v5;
  id v6;
  uint64_t v7;
  void *i;
  void *v9;
  void *v10;
  void *v11;
  unsigned int v12;
  void *v13;
  uint64_t v14;
  void *v15;
  id v16;
  id v17;
  id v18;
  uint64_t v19;
  void *j;
  uint64_t v21;
  void *v22;
  unsigned int v23;
  id obj;
  _QWORD v25[5];
  unsigned int v26;
  __int128 v27;
  __int128 v28;
  __int128 v29;
  __int128 v30;
  __int128 v31;
  __int128 v32;
  __int128 v33;
  __int128 v34;
  _BYTE v35[128];
  _BYTE v36[128];

  v3 = a3;
  v4 = objc_alloc_init((Class)NSMutableDictionary);
  v31 = 0u;
  v32 = 0u;
  v33 = 0u;
  v34 = 0u;
  obj = v3;
  v5 = objc_msgSend(obj, "countByEnumeratingWithState:objects:count:", &v31, v36, 16);
  if (v5)
  {
    v6 = v5;
    v7 = *(_QWORD *)v32;
    do
    {
      for (i = 0; i != v6; i = (char *)i + 1)
      {
        if (*(_QWORD *)v32 != v7)
          objc_enumerationMutation(obj);
        v9 = *(void **)(*((_QWORD *)&v31 + 1) + 8 * (_QWORD)i);
        v10 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v9, "objectForKeyedSubscript:", CFSTR("key")));
        v11 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v4, "objectForKeyedSubscript:", v10));
        v12 = objc_msgSend(v11, "intValue");

        v13 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v9, "objectForKeyedSubscript:", v10));
        v14 = objc_msgSend(v13, "intValue") + v12;

        v15 = (void *)objc_claimAutoreleasedReturnValue(+[NSNumber numberWithInt:](NSNumber, "numberWithInt:", v14));
        objc_msgSend(v4, "setObject:forKeyedSubscript:", v15, v10);

      }
      v6 = objc_msgSend(obj, "countByEnumeratingWithState:objects:count:", &v31, v36, 16);
    }
    while (v6);
  }

  v29 = 0u;
  v30 = 0u;
  v27 = 0u;
  v28 = 0u;
  v16 = v4;
  v17 = objc_msgSend(v16, "countByEnumeratingWithState:objects:count:", &v27, v35, 16);
  if (v17)
  {
    v18 = v17;
    v19 = *(_QWORD *)v28;
    do
    {
      for (j = 0; j != v18; j = (char *)j + 1)
      {
        if (*(_QWORD *)v28 != v19)
          objc_enumerationMutation(v16);
        v21 = *(_QWORD *)(*((_QWORD *)&v27 + 1) + 8 * (_QWORD)j);
        v22 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v16, "objectForKeyedSubscript:", v21));
        v23 = objc_msgSend(v22, "intValue");

        v25[0] = _NSConcreteStackBlock;
        v25[1] = 3221225472;
        v25[2] = sub_100089754;
        v25[3] = &unk_10015F380;
        v25[4] = v21;
        v26 = v23;
        AnalyticsSendEventLazy(CFSTR("come.apple.dasd.metrics"), v25);
      }
      v18 = objc_msgSend(v16, "countByEnumeratingWithState:objects:count:", &v27, v35, 16);
    }
    while (v18);
  }

}

+ (void)savePredictionData:(id)a3
{
  id v3;
  void *v4;
  id v5;

  v3 = a3;
  v5 = (id)objc_claimAutoreleasedReturnValue(+[_CDClientContext userContext](_CDClientContext, "userContext"));
  v4 = (void *)objc_claimAutoreleasedReturnValue(+[_CDContextualKeyPath keyPathWithKey:](_CDContextualKeyPath, "keyPathWithKey:", CFSTR("/system/activityPrediction")));
  objc_msgSend(v5, "setObject:forKeyedSubscript:", v3, v4);

}

+ (id)readPredictionData
{
  void *v2;
  void *v3;
  void *v4;

  v2 = (void *)objc_claimAutoreleasedReturnValue(+[_CDClientContext userContext](_CDClientContext, "userContext"));
  v3 = (void *)objc_claimAutoreleasedReturnValue(+[_CDContextualKeyPath keyPathWithKey:](_CDContextualKeyPath, "keyPathWithKey:", CFSTR("/system/activityPrediction")));
  v4 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v2, "objectForKeyedSubscript:", v3));

  return v4;
}

@end
