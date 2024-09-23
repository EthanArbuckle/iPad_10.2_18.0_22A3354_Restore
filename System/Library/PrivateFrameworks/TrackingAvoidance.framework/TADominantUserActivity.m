@implementation TADominantUserActivity

+ (id)getCumulativeUserActivityTimeInDateInterval:(id)a3 store:(id)a4
{
  id v5;
  id v6;
  id v7;
  void *v8;
  void *v9;
  void *v10;
  TAUserActivity *v11;
  void *v12;
  TAUserActivity *v13;
  void *v14;
  TAUserActivity *v15;
  uint64_t v16;
  void *v17;
  TAUserActivity *v18;
  unint64_t i;
  void *v20;
  void *v21;
  void *v22;
  void *v23;
  void *v24;
  void *v25;
  void *v26;
  uint64_t v27;
  void *v28;
  void *v29;
  int v30;
  double v31;
  double v32;
  void *v33;
  double v34;
  void *v35;
  void *v36;
  void *v37;
  double v38;
  void *v39;
  void *v40;
  void *v42;
  void *v43;

  v5 = a3;
  v6 = a4;
  v7 = objc_alloc_init(MEMORY[0x24BDBCED8]);
  v43 = v6;
  objc_msgSend(v6, "eventBuffer");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v8, "getAllTAEventsOf:", objc_opt_class());
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  v10 = (void *)objc_msgSend(v9, "mutableCopy");

  v11 = [TAUserActivity alloc];
  objc_msgSend(MEMORY[0x24BDBCE60], "distantPast");
  v12 = (void *)objc_claimAutoreleasedReturnValue();
  v13 = -[TAUserActivity initWithActivityType:date:](v11, "initWithActivityType:date:", 0, v12);
  objc_msgSend(v10, "insertObject:atIndex:", v13, 0);

  objc_msgSend(v10, "lastObject");
  v14 = (void *)objc_claimAutoreleasedReturnValue();
  v15 = [TAUserActivity alloc];
  v42 = v14;
  v16 = objc_msgSend(v14, "activityType");
  objc_msgSend(MEMORY[0x24BDBCE60], "distantFuture");
  v17 = (void *)objc_claimAutoreleasedReturnValue();
  v18 = -[TAUserActivity initWithActivityType:date:](v15, "initWithActivityType:date:", v16, v17);
  objc_msgSend(v10, "addObject:", v18);

  if ((unint64_t)objc_msgSend(v10, "count") >= 2)
  {
    for (i = 1; objc_msgSend(v10, "count") > i; ++i)
    {
      v20 = (void *)MEMORY[0x24BDD1508];
      objc_msgSend(v10, "objectAtIndexedSubscript:", i - 1);
      v21 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v21, "date");
      v22 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v10, "objectAtIndexedSubscript:", i);
      v23 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v23, "date");
      v24 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v20, "createIntervalSafelyWithStartDate:endDate:", v22, v24);
      v25 = (void *)objc_claimAutoreleasedReturnValue();

      objc_msgSend(v10, "objectAtIndexedSubscript:", i - 1);
      v26 = (void *)objc_claimAutoreleasedReturnValue();
      v27 = objc_msgSend(v26, "activityType");

      objc_msgSend(v25, "startDate");
      v28 = (void *)objc_claimAutoreleasedReturnValue();
      if ((objc_msgSend(v5, "containsDate:", v28) & 1) != 0)
      {
        objc_msgSend(v25, "endDate");
        v29 = (void *)objc_claimAutoreleasedReturnValue();
        v30 = objc_msgSend(v5, "containsDate:", v29);

        if (v30)
        {
          objc_msgSend(v25, "duration");
          v32 = v31;
LABEL_9:
          v35 = (void *)MEMORY[0x24BDD16E0];
          objc_msgSend(MEMORY[0x24BDD16E0], "numberWithUnsignedInteger:", v27);
          v36 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v7, "objectForKeyedSubscript:", v36);
          v37 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v37, "doubleValue");
          objc_msgSend(v35, "numberWithDouble:", v32 + v38);
          v39 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(MEMORY[0x24BDD16E0], "numberWithUnsignedInteger:", v27);
          v40 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v7, "setObject:forKeyedSubscript:", v39, v40);

          goto LABEL_10;
        }
      }
      else
      {

      }
      if (objc_msgSend(v5, "intersectsDateInterval:", v25))
      {
        objc_msgSend(v5, "intersectionWithDateInterval:", v25);
        v33 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v33, "duration");
        v32 = v34;

        goto LABEL_9;
      }
LABEL_10:

    }
  }

  return v7;
}

+ ($82EDB067EE6F192B39F18594CC8676AD)getDominantUserActivityInfoInDateInterval:(id)a3 store:(id)a4
{
  void *v4;
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  double v9;
  uint64_t i;
  void *v11;
  void *v12;
  double v13;
  double v14;
  void *v15;
  double v16;
  double v17;
  unint64_t v18;
  __int128 v19;
  __int128 v20;
  __int128 v21;
  __int128 v22;
  _BYTE v23[128];
  uint64_t v24;
  $82EDB067EE6F192B39F18594CC8676AD result;

  v24 = *MEMORY[0x24BDAC8D0];
  +[TADominantUserActivity getCumulativeUserActivityTimeInDateInterval:store:](TADominantUserActivity, "getCumulativeUserActivityTimeInDateInterval:store:", a3, a4);
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  v19 = 0u;
  v20 = 0u;
  v21 = 0u;
  v22 = 0u;
  v5 = objc_msgSend(v4, "countByEnumeratingWithState:objects:count:", &v19, v23, 16);
  if (v5)
  {
    v6 = v5;
    v7 = 0;
    v8 = *(_QWORD *)v20;
    v9 = 0.0;
    do
    {
      for (i = 0; i != v6; ++i)
      {
        if (*(_QWORD *)v20 != v8)
          objc_enumerationMutation(v4);
        v11 = *(void **)(*((_QWORD *)&v19 + 1) + 8 * i);
        objc_msgSend(v4, "objectForKeyedSubscript:", v11);
        v12 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v12, "doubleValue");
        v14 = v13;

        if (v14 > v9)
        {
          v7 = objc_msgSend(v11, "integerValue");
          objc_msgSend(v4, "objectForKeyedSubscript:", v11);
          v15 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v15, "doubleValue");
          v9 = v16;

        }
      }
      v6 = objc_msgSend(v4, "countByEnumeratingWithState:objects:count:", &v19, v23, 16);
    }
    while (v6);
  }
  else
  {
    v7 = 0;
    v9 = 0.0;
  }

  v17 = v9;
  v18 = v7;
  result.var1 = v17;
  result.var0 = v18;
  return result;
}

@end
