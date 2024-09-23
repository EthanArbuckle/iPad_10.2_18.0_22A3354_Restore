@implementation _DASSwapModelAverageAggregator

- (id)scoresForAllApplicationsAtDate:(id)a3
{
  void *v4;
  void *v5;
  id v6;
  void *v7;
  void *v8;
  void *v9;
  void *v10;
  void *v11;
  void *v12;
  id v13;
  id v14;
  uint64_t v15;
  void *v16;
  void *v17;
  void *v18;
  void *v19;
  void *v20;
  void *v21;
  id v22;
  id v23;
  uint64_t v24;
  void *v25;
  uint64_t v26;
  void *v27;
  void *v28;
  double v29;
  double v30;
  uint64_t i;
  void *v32;
  void *v33;
  double v34;
  void *v35;
  void *context;
  id obj;
  id v39;
  __int128 v40;
  __int128 v41;
  __int128 v42;
  __int128 v43;
  __int128 v44;
  __int128 v45;
  __int128 v46;
  __int128 v47;
  _BYTE v48[128];
  _BYTE v49[128];

  v39 = a3;
  v4 = objc_autoreleasePoolPush();
  v5 = (void *)objc_claimAutoreleasedReturnValue(-[_DASSwapModelAbstractAggregator algorithms](self, "algorithms"));
  v6 = objc_msgSend(v5, "count");

  if (!v6)
    goto LABEL_4;
  if (v6 == (id)1)
  {
    v7 = (void *)objc_claimAutoreleasedReturnValue(-[_DASSwapModelAbstractAggregator algorithms](self, "algorithms"));
    v8 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v7, "firstObject"));
    v6 = (id)objc_claimAutoreleasedReturnValue(objc_msgSend(v8, "scoresForAllApplicationsAtDate:", v39));

LABEL_4:
    v9 = v4;
    goto LABEL_23;
  }
  context = v4;
  v10 = (void *)objc_claimAutoreleasedReturnValue(+[NSMutableSet set](NSMutableSet, "set"));
  v11 = (void *)objc_claimAutoreleasedReturnValue(+[NSMutableArray array](NSMutableArray, "array"));
  v44 = 0u;
  v45 = 0u;
  v46 = 0u;
  v47 = 0u;
  v12 = (void *)objc_claimAutoreleasedReturnValue(-[_DASSwapModelAbstractAggregator algorithms](self, "algorithms"));
  v13 = objc_msgSend(v12, "countByEnumeratingWithState:objects:count:", &v44, v49, 16);
  if (v13)
  {
    v14 = v13;
    v15 = *(_QWORD *)v45;
    do
    {
      v16 = 0;
      do
      {
        if (*(_QWORD *)v45 != v15)
          objc_enumerationMutation(v12);
        v17 = *(void **)(*((_QWORD *)&v44 + 1) + 8 * (_QWORD)v16);
        v18 = objc_autoreleasePoolPush();
        v19 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v17, "scoresForAllApplicationsAtDate:", v39));
        objc_msgSend(v11, "addObject:", v19);
        v20 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v19, "allKeys"));
        objc_msgSend(v10, "addObjectsFromArray:", v20);

        objc_autoreleasePoolPop(v18);
        v16 = (char *)v16 + 1;
      }
      while (v14 != v16);
      v14 = objc_msgSend(v12, "countByEnumeratingWithState:objects:count:", &v44, v49, 16);
    }
    while (v14);
  }

  v21 = (void *)objc_claimAutoreleasedReturnValue(+[NSMutableDictionary dictionary](NSMutableDictionary, "dictionary"));
  v40 = 0u;
  v41 = 0u;
  v42 = 0u;
  v43 = 0u;
  obj = v10;
  v22 = objc_msgSend(obj, "countByEnumeratingWithState:objects:count:", &v40, v48, 16);
  if (v22)
  {
    v23 = v22;
    v24 = *(_QWORD *)v41;
    do
    {
      v25 = 0;
      do
      {
        if (*(_QWORD *)v41 != v24)
          objc_enumerationMutation(obj);
        v26 = *(_QWORD *)(*((_QWORD *)&v40 + 1) + 8 * (_QWORD)v25);
        v27 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v11, "objectAtIndexedSubscript:", 0));
        v28 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v27, "objectForKeyedSubscript:", v26));
        objc_msgSend(v28, "doubleValue");
        v30 = v29;

        for (i = 1; (id)i != v6; ++i)
        {
          v32 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v11, "objectAtIndexedSubscript:", i));
          v33 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v32, "objectForKeyedSubscript:", v26));
          objc_msgSend(v33, "doubleValue");
          v30 = v30 + v34;

        }
        v35 = (void *)objc_claimAutoreleasedReturnValue(+[NSNumber numberWithDouble:](NSNumber, "numberWithDouble:", v30 / (double)(unint64_t)v6));
        objc_msgSend(v21, "setObject:forKeyedSubscript:", v35, v26);

        v25 = (char *)v25 + 1;
      }
      while (v25 != v23);
      v23 = objc_msgSend(obj, "countByEnumeratingWithState:objects:count:", &v40, v48, 16);
    }
    while (v23);
  }

  v6 = objc_msgSend(v21, "copy");
  v9 = context;
LABEL_23:
  objc_autoreleasePoolPop(v9);

  return v6;
}

- (double)scoreForApplication:(id)a3 atDate:(id)a4
{
  id v6;
  id v7;
  void *v8;
  id v9;
  void *v10;
  void *v11;
  double v12;
  double v13;
  void *v14;
  void *v15;
  double v16;
  double v17;
  uint64_t i;
  void *v19;
  void *v20;
  double v21;

  v6 = a3;
  v7 = a4;
  v8 = (void *)objc_claimAutoreleasedReturnValue(-[_DASSwapModelAbstractAggregator algorithms](self, "algorithms"));
  v9 = objc_msgSend(v8, "count");

  if (v9)
  {
    if (v9 == (id)1)
    {
      v10 = (void *)objc_claimAutoreleasedReturnValue(-[_DASSwapModelAbstractAggregator algorithms](self, "algorithms"));
      v11 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v10, "firstObject"));
      objc_msgSend(v11, "scoreForApplication:atDate:", v6, v7);
      v13 = v12;

    }
    else
    {
      v14 = (void *)objc_claimAutoreleasedReturnValue(-[_DASSwapModelAbstractAggregator algorithms](self, "algorithms"));
      v15 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v14, "objectAtIndexedSubscript:", 0));
      objc_msgSend(v15, "scoreForApplication:atDate:", v6, v7);
      v17 = v16;

      for (i = 1; (id)i != v9; ++i)
      {
        v19 = (void *)objc_claimAutoreleasedReturnValue(-[_DASSwapModelAbstractAggregator algorithms](self, "algorithms"));
        v20 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v19, "objectAtIndexedSubscript:", i));
        objc_msgSend(v20, "scoreForApplication:atDate:", v6, v7);
        v17 = v17 + v21;

      }
      v13 = v17 / (double)(unint64_t)v9;
    }
  }
  else
  {
    v13 = 0.0;
  }

  return v13;
}

@end
