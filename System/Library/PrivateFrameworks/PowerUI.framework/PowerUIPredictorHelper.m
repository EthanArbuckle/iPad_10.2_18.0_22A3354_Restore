@implementation PowerUIPredictorHelper

+ (double)getHourBinID:(id)a3 forHourBin:(unint64_t)a4
{
  void *v5;
  id v6;
  void *v7;
  void *v8;
  double v9;

  v5 = (void *)MEMORY[0x24BDBCE48];
  v6 = a3;
  objc_msgSend(v5, "currentCalendar");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v7, "components:fromDate:", 32, v6);
  v8 = (void *)objc_claimAutoreleasedReturnValue();

  v9 = (double)objc_msgSend(v8, "hour") / (double)a4;
  return v9;
}

+ (id)events:(id)a3 forHourBin:(unint64_t)a4 date:(id)a5 withMaxDuration:(double)a6
{
  id v10;
  void *v11;
  id v12;
  void *v13;
  void *v14;
  uint64_t v15;
  uint64_t v16;
  void *v17;
  id v18;
  uint64_t v19;
  uint64_t v20;
  unint64_t v21;
  uint64_t v22;
  uint64_t i;
  void *v24;
  void *v25;
  double v26;
  void *v27;
  double v28;
  double v29;
  double v30;
  void *v31;
  void *v33;
  void *v34;
  void *v35;
  __int128 v36;
  __int128 v37;
  __int128 v38;
  __int128 v39;
  _BYTE v40[128];
  uint64_t v41;

  v41 = *MEMORY[0x24BDAC8D0];
  v10 = a3;
  v11 = (void *)MEMORY[0x24BDBCE48];
  v12 = a5;
  objc_msgSend(v11, "currentCalendar");
  v13 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v13, "timeZone");
  v14 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v12, "dateByAddingTimeInterval:", (double)objc_msgSend(v14, "secondsFromGMT"));
  v15 = objc_claimAutoreleasedReturnValue();

  v34 = (void *)v15;
  v35 = v13;
  objc_msgSend(v13, "components:fromDate:", 32, v15);
  v33 = (void *)objc_claimAutoreleasedReturnValue();
  v16 = objc_msgSend(v33, "hour");
  objc_msgSend(MEMORY[0x24BDBCEB8], "array");
  v17 = (void *)objc_claimAutoreleasedReturnValue();
  v36 = 0u;
  v37 = 0u;
  v38 = 0u;
  v39 = 0u;
  v18 = v10;
  v19 = objc_msgSend(v18, "countByEnumeratingWithState:objects:count:", &v36, v40, 16);
  if (v19)
  {
    v20 = v19;
    v21 = (unint64_t)(double)v16 / a4;
    v22 = *(_QWORD *)v37;
    do
    {
      for (i = 0; i != v20; ++i)
      {
        if (*(_QWORD *)v37 != v22)
          objc_enumerationMutation(v18);
        v24 = *(void **)(*((_QWORD *)&v36 + 1) + 8 * i);
        objc_msgSend(v24, "startDate");
        v25 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(a1, "getHourBinID:forHourBin:", v25, a4);
        if (v21 == (unint64_t)v26)
        {
          objc_msgSend(v24, "endDate");
          v27 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v27, "timeIntervalSinceDate:", v25);
          v29 = v28 / 3600.0;

          if (v29 >= a6)
            v30 = a6;
          else
            v30 = v29;
          if (a6 <= 0.0)
            v30 = v29;
          objc_msgSend(MEMORY[0x24BDD16E0], "numberWithDouble:", v30);
          v31 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v17, "addObject:", v31);

        }
      }
      v20 = objc_msgSend(v18, "countByEnumeratingWithState:objects:count:", &v36, v40, 16);
    }
    while (v20);
  }

  return v17;
}

+ (id)filterEvents:(id)a3 startOnSameWeekdayAs:(id)a4
{
  id v5;
  id v6;
  void *v7;
  void *v8;
  uint64_t v9;
  id v10;
  uint64_t v11;
  uint64_t v12;
  uint64_t v13;
  uint64_t i;
  void *v15;
  void *v16;
  void *v17;
  void *context;
  void *v20;
  void *v21;
  __int128 v22;
  __int128 v23;
  __int128 v24;
  __int128 v25;
  _BYTE v26[128];
  uint64_t v27;

  v27 = *MEMORY[0x24BDAC8D0];
  v5 = a3;
  v6 = a4;
  objc_msgSend(MEMORY[0x24BDBCEB8], "array");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(MEMORY[0x24BDBCE48], "currentCalendar");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  v21 = v6;
  objc_msgSend(v8, "components:fromDate:", 512, v6);
  v20 = (void *)objc_claimAutoreleasedReturnValue();
  v9 = objc_msgSend(v20, "weekday");
  context = (void *)MEMORY[0x2199EC15C]();
  v22 = 0u;
  v23 = 0u;
  v24 = 0u;
  v25 = 0u;
  v10 = v5;
  v11 = objc_msgSend(v10, "countByEnumeratingWithState:objects:count:", &v22, v26, 16);
  if (v11)
  {
    v12 = v11;
    v13 = *(_QWORD *)v23;
    do
    {
      for (i = 0; i != v12; ++i)
      {
        if (*(_QWORD *)v23 != v13)
          objc_enumerationMutation(v10);
        v15 = *(void **)(*((_QWORD *)&v22 + 1) + 8 * i);
        objc_msgSend(v15, "startDate");
        v16 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v8, "components:fromDate:", 512, v16);
        v17 = (void *)objc_claimAutoreleasedReturnValue();

        if (objc_msgSend(v17, "weekday") == v9)
          objc_msgSend(v7, "addObject:", v15);

      }
      v12 = objc_msgSend(v10, "countByEnumeratingWithState:objects:count:", &v22, v26, 16);
    }
    while (v12);
  }

  objc_autoreleasePoolPop(context);
  return v7;
}

+ (id)getDurationsFromEvents:(id)a3 withUnit:(double)a4 cappedAt:(double)a5
{
  id v7;
  void *v8;
  id v9;
  uint64_t v10;
  uint64_t v11;
  uint64_t v12;
  uint64_t v13;
  double v14;
  double v15;
  double v16;
  void *v17;
  __int128 v19;
  __int128 v20;
  __int128 v21;
  __int128 v22;
  _BYTE v23[128];
  uint64_t v24;

  v24 = *MEMORY[0x24BDAC8D0];
  v7 = a3;
  objc_msgSend(MEMORY[0x24BDBCEB8], "array");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  v19 = 0u;
  v20 = 0u;
  v21 = 0u;
  v22 = 0u;
  v9 = v7;
  v10 = objc_msgSend(v9, "countByEnumeratingWithState:objects:count:", &v19, v23, 16);
  if (v10)
  {
    v11 = v10;
    v12 = *(_QWORD *)v20;
    do
    {
      v13 = 0;
      do
      {
        if (*(_QWORD *)v20 != v12)
          objc_enumerationMutation(v9);
        objc_msgSend(*(id *)(*((_QWORD *)&v19 + 1) + 8 * v13), "duration", (_QWORD)v19);
        v15 = v14 / a4;
        if (v15 >= a5)
          v16 = a5;
        else
          v16 = v15;
        if (a5 > 0.0)
          v15 = v16;
        objc_msgSend(MEMORY[0x24BDD16E0], "numberWithDouble:", v15);
        v17 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v8, "addObject:", v17);

        ++v13;
      }
      while (v11 != v13);
      v11 = objc_msgSend(v9, "countByEnumeratingWithState:objects:count:", &v19, v23, 16);
    }
    while (v11);
  }

  return v8;
}

+ (double)meanOf:(id)a3
{
  id v3;
  id v4;
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;
  double v8;
  uint64_t i;
  double v10;
  double v11;
  __int128 v13;
  __int128 v14;
  __int128 v15;
  __int128 v16;
  _BYTE v17[128];
  uint64_t v18;

  v18 = *MEMORY[0x24BDAC8D0];
  v3 = a3;
  if (objc_msgSend(v3, "count"))
  {
    v15 = 0u;
    v16 = 0u;
    v13 = 0u;
    v14 = 0u;
    v4 = v3;
    v5 = objc_msgSend(v4, "countByEnumeratingWithState:objects:count:", &v13, v17, 16);
    if (v5)
    {
      v6 = v5;
      v7 = *(_QWORD *)v14;
      v8 = 0.0;
      do
      {
        for (i = 0; i != v6; ++i)
        {
          if (*(_QWORD *)v14 != v7)
            objc_enumerationMutation(v4);
          objc_msgSend(*(id *)(*((_QWORD *)&v13 + 1) + 8 * i), "doubleValue", (_QWORD)v13);
          v8 = v8 + v10;
        }
        v6 = objc_msgSend(v4, "countByEnumeratingWithState:objects:count:", &v13, v17, 16);
      }
      while (v6);
    }
    else
    {
      v8 = 0.0;
    }

    v11 = v8 / (double)(unint64_t)objc_msgSend(v4, "count");
  }
  else
  {
    v11 = 0.0;
  }

  return v11;
}

+ (double)standardDeviationOf:(id)a3
{
  id v3;
  double v4;
  double v5;
  double v6;
  id v7;
  uint64_t v8;
  uint64_t v9;
  uint64_t v10;
  double v11;
  uint64_t i;
  double v13;
  __int128 v15;
  __int128 v16;
  __int128 v17;
  __int128 v18;
  _BYTE v19[128];
  uint64_t v20;

  v20 = *MEMORY[0x24BDAC8D0];
  v3 = a3;
  v4 = 0.0;
  if ((unint64_t)objc_msgSend(v3, "count") >= 2)
  {
    +[PowerUIPredictorHelper meanOf:](PowerUIPredictorHelper, "meanOf:", v3);
    v6 = v5;
    v15 = 0u;
    v16 = 0u;
    v17 = 0u;
    v18 = 0u;
    v7 = v3;
    v8 = objc_msgSend(v7, "countByEnumeratingWithState:objects:count:", &v15, v19, 16);
    if (v8)
    {
      v9 = v8;
      v10 = *(_QWORD *)v16;
      v11 = 0.0;
      do
      {
        for (i = 0; i != v9; ++i)
        {
          if (*(_QWORD *)v16 != v10)
            objc_enumerationMutation(v7);
          objc_msgSend(*(id *)(*((_QWORD *)&v15 + 1) + 8 * i), "doubleValue", (_QWORD)v15);
          v11 = v11 + (v13 - v6) * (v13 - v6);
        }
        v9 = objc_msgSend(v7, "countByEnumeratingWithState:objects:count:", &v15, v19, 16);
      }
      while (v9);
    }
    else
    {
      v11 = 0.0;
    }

    v4 = sqrt(v11 / (double)(unint64_t)(objc_msgSend(v7, "count") - 1));
  }

  return v4;
}

+ (double)medianOf:(id)a3
{
  id v3;
  void *v4;
  char v5;
  unint64_t v6;
  void *v7;
  double v8;
  double v9;
  void *v10;
  double v11;
  double v12;
  double v13;

  v3 = a3;
  if (objc_msgSend(v3, "count"))
  {
    objc_msgSend(v3, "sortedArrayUsingSelector:", sel_compare_);
    v4 = (void *)objc_claimAutoreleasedReturnValue();
    v5 = objc_msgSend(v4, "count");
    v6 = (unint64_t)objc_msgSend(v4, "count") >> 1;
    if ((v5 & 1) != 0)
    {
      objc_msgSend(v4, "objectAtIndexedSubscript:", v6);
      v7 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v7, "doubleValue");
      v12 = v13;
    }
    else
    {
      objc_msgSend(v4, "objectAtIndexedSubscript:", v6 - 1);
      v7 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v7, "doubleValue");
      v9 = v8;
      objc_msgSend(v4, "objectAtIndexedSubscript:", v6);
      v10 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v10, "doubleValue");
      v12 = (v9 + v11) * 0.5;

    }
  }
  else
  {
    v12 = 0.0;
  }

  return v12;
}

+ (id)filterEventsSortedByStartDateAscending:(id)a3 startsBefore:(id)a4 dynamicallyAroundDate:(id)a5 withHourBinWidth:(unint64_t)a6
{
  return +[PowerUISmartChargeUtilities filterChargeSessions:startsBefore:dynamicallyAroundDate:withinSeconds:](PowerUISmartChargeUtilities, "filterChargeSessions:startsBefore:dynamicallyAroundDate:withinSeconds:", a3, a4, a5, (unint64_t)((double)a6 * 1800.0));
}

+ (id)timeBetweenUsesForSortedDescendingByAgeEvents:(id)a3 forHourBin:(unint64_t)a4 atDate:(id)a5 addAtDate:(BOOL)a6
{
  id v9;
  id v10;
  void *v11;
  void *v12;
  uint64_t v13;
  unint64_t v14;
  int v15;
  uint64_t v16;
  int v17;
  void *v18;
  void *v19;
  void *v20;
  void *v21;
  void *v22;
  void *v23;
  void *v24;
  double v25;
  unint64_t v26;
  void *v27;
  double v28;
  void *v29;
  void *v30;
  void *v31;
  double v32;
  unint64_t v33;
  void *v34;
  void *v35;
  void *v36;
  double v37;
  void *v38;
  BOOL v40;
  void *v41;
  void *v42;
  void *v43;
  id v44;

  v9 = a3;
  v10 = a5;
  objc_msgSend(MEMORY[0x24BDBCEB8], "array");
  v44 = (id)objc_claimAutoreleasedReturnValue();
  if ((unint64_t)objc_msgSend(v9, "count") >= 2)
  {
    v40 = a6;
    objc_msgSend(MEMORY[0x24BDBCE48], "currentCalendar");
    v11 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v11, "timeZone");
    v12 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v10, "dateByAddingTimeInterval:", (double)objc_msgSend(v12, "secondsFromGMT"));
    v13 = objc_claimAutoreleasedReturnValue();

    v42 = (void *)v13;
    v43 = v11;
    objc_msgSend(v11, "components:fromDate:", 32, v13);
    v41 = (void *)objc_claimAutoreleasedReturnValue();
    v14 = (unint64_t)(double)objc_msgSend(v41, "hour") / a4;
    v15 = objc_msgSend(v9, "count");
    if (v15 >= 2)
    {
      v16 = v15;
      do
      {
        v17 = v16--;
        objc_msgSend(v9, "objectAtIndexedSubscript:", v16);
        v18 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v18, "endDate");
        v19 = (void *)objc_claimAutoreleasedReturnValue();

        objc_msgSend(v9, "objectAtIndexedSubscript:", (v17 - 2));
        v20 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v20, "startDate");
        v21 = (void *)objc_claimAutoreleasedReturnValue();

        objc_msgSend(v19, "earlierDate:", v21);
        v22 = (void *)objc_claimAutoreleasedReturnValue();

        if (v22 != v21)
        {
          objc_msgSend(v9, "objectAtIndexedSubscript:", v16);
          v23 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v23, "startDate");
          v24 = (void *)objc_claimAutoreleasedReturnValue();
          +[PowerUIPredictorHelper getHourBinID:forHourBin:](PowerUIPredictorHelper, "getHourBinID:forHourBin:", v24, a4);
          v26 = (unint64_t)v25;

          if (v14 == v26)
          {
            v27 = (void *)MEMORY[0x24BDD16E0];
            objc_msgSend(v21, "timeIntervalSinceDate:", v19);
            objc_msgSend(v27, "numberWithDouble:", v28 / 60.0);
            v29 = (void *)objc_claimAutoreleasedReturnValue();
            objc_msgSend(v44, "addObject:", v29);

          }
        }

      }
      while ((unint64_t)(v16 + 1) > 2);
    }
    v10 = v42;
    if (v40)
    {
      objc_msgSend(v9, "firstObject");
      v30 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v30, "startDate");
      v31 = (void *)objc_claimAutoreleasedReturnValue();
      +[PowerUIPredictorHelper getHourBinID:forHourBin:](PowerUIPredictorHelper, "getHourBinID:forHourBin:", v31, a4);
      v33 = (unint64_t)v32;

      if (v14 == v33)
      {
        v34 = (void *)MEMORY[0x24BDD16E0];
        objc_msgSend(v9, "firstObject");
        v35 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v35, "endDate");
        v36 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v42, "timeIntervalSinceDate:", v36);
        objc_msgSend(v34, "numberWithDouble:", v37 / 60.0);
        v38 = (void *)objc_claimAutoreleasedReturnValue();

        objc_msgSend(v44, "addObject:", v38);
      }
    }

  }
  return v44;
}

+ (id)getUsageBucketsForEvents:(id)a3 forDate:(id)a4 withLog:(id)a5
{
  id v7;
  id v8;
  uint64_t v9;
  uint64_t v10;
  void *v11;
  void *v12;
  void *v13;
  void *v14;
  void *v15;
  void *v16;
  void *v17;
  uint64_t v18;
  uint64_t v19;
  void *v20;
  void *v21;
  void *v22;
  uint64_t v23;
  id v24;
  id v25;
  BOOL v26;
  uint64_t v27;
  double *v28;
  uint64_t v29;
  double *v30;
  uint64_t v31;
  uint64_t v32;
  uint64_t v33;
  double v34;
  NSObject *v35;
  void *v36;
  void *v37;
  id v38;
  void *v39;
  uint64_t i;
  void *v41;
  id v43;
  id obj;
  uint64_t v45;
  uint64_t v46;
  uint64_t v47;
  uint64_t v48;
  __int128 v49;
  __int128 v50;
  __int128 v51;
  __int128 v52;
  uint8_t buf[4];
  void *v54;
  _BYTE v55[128];
  _OWORD v56[12];
  uint64_t v57;

  v57 = *MEMORY[0x24BDAC8D0];
  v7 = a3;
  v8 = a4;
  v43 = a5;
  memset(v56, 0, sizeof(v56));
  v49 = 0u;
  v50 = 0u;
  v51 = 0u;
  v52 = 0u;
  obj = v7;
  v46 = objc_msgSend(v7, "countByEnumeratingWithState:objects:count:", &v49, v55, 16);
  if (!v46)
    goto LABEL_27;
  v9 = *(_QWORD *)v50;
  do
  {
    v10 = 0;
    do
    {
      if (*(_QWORD *)v50 != v9)
        objc_enumerationMutation(obj);
      v11 = *(void **)(*((_QWORD *)&v49 + 1) + 8 * v10);
      objc_msgSend(MEMORY[0x24BDBCE48], "currentCalendar");
      v12 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v11, "startDate");
      v13 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v12, "components:fromDate:", 112, v13);
      v14 = (void *)objc_claimAutoreleasedReturnValue();

      objc_msgSend(MEMORY[0x24BDBCE48], "currentCalendar");
      v15 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v11, "endDate");
      v16 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v15, "components:fromDate:", 96, v16);
      v17 = (void *)objc_claimAutoreleasedReturnValue();

      v18 = objc_msgSend(v14, "hour");
      v19 = objc_msgSend(v17, "hour");
      v47 = objc_msgSend(v14, "minute");
      v48 = objc_msgSend(v17, "minute");
      objc_msgSend(MEMORY[0x24BDBCE48], "currentCalendar");
      v20 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v11, "startDate");
      v21 = (void *)objc_claimAutoreleasedReturnValue();
      if (objc_msgSend(v20, "isDate:inSameDayAsDate:", v21, v8))
      {

        goto LABEL_22;
      }
      v45 = v19;
      objc_msgSend(v11, "startDate");
      v22 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v8, "earlierDate:", v22);
      v23 = v9;
      v24 = v8;
      v25 = (id)objc_claimAutoreleasedReturnValue();

      v26 = v25 == v24;
      v8 = v24;
      v9 = v23;
      if (!v26)
      {
        if (v18 < v45)
        {
          *((double *)v56 + v18) = sqrt((double)(60 - v47)) + *((double *)v56 + v18);
          if (v18 + 1 < v45)
          {
            v27 = ~v18 + v45;
            v28 = (double *)v56 + v18 + 1;
            do
            {
              *v28 = *v28 + 7.74596669;
              ++v28;
              --v27;
            }
            while (v27);
          }
LABEL_21:
          *((double *)v56 + v45) = sqrt((double)v48) + *((double *)v56 + v45);
          goto LABEL_22;
        }
        if (v18 > v45)
        {
          *((double *)v56 + v18) = sqrt((double)(60 - v47)) + *((double *)v56 + v18);
          if (v18 <= 22)
          {
            v29 = v18 + 1;
            do
            {
              *((double *)v56 + v29) = *((double *)v56 + v29) + 7.74596669;
              ++v29;
            }
            while (v29 != 24);
          }
          if (v45 >= 1)
          {
            v30 = (double *)v56;
            v31 = v45;
            do
            {
              *v30 = *v30 + 7.74596669;
              ++v30;
              --v31;
            }
            while (v31);
          }
          goto LABEL_21;
        }
        if (v48 - v47 >= 0)
          *((double *)v56 + v18) = sqrt((double)(v48 - v47)) + *((double *)v56 + v18);
      }
LABEL_22:

      ++v10;
    }
    while (v10 != v46);
    v32 = objc_msgSend(obj, "countByEnumeratingWithState:objects:count:", &v49, v55, 16);
    v46 = v32;
  }
  while (v32);
LABEL_27:
  v33 = 0;
  v34 = 0.0;
  do
  {
    if (*(double *)((char *)v56 + v33) > v34)
      v34 = *(double *)((char *)v56 + v33);
    v33 += 8;
  }
  while (v33 != 192);
  v35 = v43;
  if (os_log_type_enabled(v35, OS_LOG_TYPE_DEFAULT))
  {
    objc_msgSend(MEMORY[0x24BDD16E0], "numberWithDouble:", v34);
    v36 = (void *)objc_claimAutoreleasedReturnValue();
    *(_DWORD *)buf = 138412290;
    v54 = v36;
    _os_log_impl(&dword_215A71000, v35, OS_LOG_TYPE_DEFAULT, "maxValue in buckets = %@", buf, 0xCu);

  }
  if (v34 == 0.0)
  {
    if (os_log_type_enabled(v35, OS_LOG_TYPE_DEFAULT))
    {
      *(_WORD *)buf = 0;
      _os_log_impl(&dword_215A71000, v35, OS_LOG_TYPE_DEFAULT, "Something went wront, maxValue is 0", buf, 2u);
    }
    v37 = &unk_24D44AC50;
  }
  else
  {
    v38 = v8;
    objc_msgSend(MEMORY[0x24BDBCEB8], "array");
    v39 = (void *)objc_claimAutoreleasedReturnValue();
    for (i = 0; i != 192; i += 8)
    {
      objc_msgSend(MEMORY[0x24BDD16E0], "numberWithDouble:", *(double *)((char *)v56 + i) / v34);
      v41 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v39, "addObject:", v41);

    }
    objc_msgSend(MEMORY[0x24BDBCE30], "arrayWithArray:", v39);
    v37 = (void *)objc_claimAutoreleasedReturnValue();

    v8 = v38;
  }

  return v37;
}

+ (double)hoursUntilUseFromBucketedUsage:(id)a3 withCurrentHour:(int)a4 withComponentsMinutes:(int64_t)a5
{
  double v8;
  int v9;
  int v10;
  void *v11;
  double v12;
  double v13;

  v8 = 0.0;
  v9 = 1;
  while (1)
  {
    v10 = a4 + v9;
    if (a4 + v9 > 23)
      v10 = a4 + v9 - 24;
    objc_msgSend(a3, "objectAtIndexedSubscript:", v10);
    v11 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v11, "doubleValue");
    v13 = v12;

    if (v13 > 0.2)
      break;
    if (v9 == 11)
      v8 = 12.0;
    if (++v9 == 12)
      return v8;
  }
  return (double)v9 + (double)a5 / -60.0;
}

+ (double)medianTimeBetweenDescendingEvents:(id)a3
{
  id v3;
  void *v4;
  uint64_t v5;
  void *v6;
  void *v7;
  void *v8;
  void *v9;
  double v10;
  double v11;
  void *v12;
  double v13;
  double v14;

  v3 = a3;
  objc_msgSend(MEMORY[0x24BDBCEB8], "array");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  if ((int)objc_msgSend(v3, "count") >= 2)
  {
    v5 = 0;
    do
    {
      objc_msgSend(v3, "objectAtIndexedSubscript:", v5);
      v6 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v6, "startDate");
      v7 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v3, "objectAtIndexedSubscript:", ++v5);
      v8 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v8, "endDate");
      v9 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v7, "timeIntervalSinceDate:", v9);
      v11 = v10;

      if (v11 >= 0.0)
      {
        objc_msgSend(MEMORY[0x24BDD16E0], "numberWithDouble:", v11);
        v12 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v4, "addObject:", v12);

      }
    }
    while (v5 < (int)(objc_msgSend(v3, "count") - 1));
  }
  +[PowerUIPredictorHelper medianOf:](PowerUIPredictorHelper, "medianOf:", v4);
  v14 = v13;

  return v14;
}

+ (double)meanEventDuration:(id)a3
{
  id v3;
  id v4;
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;
  double v8;
  uint64_t i;
  void *v10;
  void *v11;
  void *v12;
  double v13;
  double v14;
  __int128 v16;
  __int128 v17;
  __int128 v18;
  __int128 v19;
  _BYTE v20[128];
  uint64_t v21;

  v21 = *MEMORY[0x24BDAC8D0];
  v3 = a3;
  if (objc_msgSend(v3, "count"))
  {
    v18 = 0u;
    v19 = 0u;
    v16 = 0u;
    v17 = 0u;
    v4 = v3;
    v5 = objc_msgSend(v4, "countByEnumeratingWithState:objects:count:", &v16, v20, 16);
    if (v5)
    {
      v6 = v5;
      v7 = *(_QWORD *)v17;
      v8 = 0.0;
      do
      {
        for (i = 0; i != v6; ++i)
        {
          if (*(_QWORD *)v17 != v7)
            objc_enumerationMutation(v4);
          v10 = *(void **)(*((_QWORD *)&v16 + 1) + 8 * i);
          objc_msgSend(v10, "endDate", (_QWORD)v16);
          v11 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v10, "startDate");
          v12 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v11, "timeIntervalSinceDate:", v12);
          v8 = v8 + v13;

        }
        v6 = objc_msgSend(v4, "countByEnumeratingWithState:objects:count:", &v16, v20, 16);
      }
      while (v6);
    }
    else
    {
      v8 = 0.0;
    }

    v14 = v8 / (double)(unint64_t)objc_msgSend(v4, "count");
  }
  else
  {
    v14 = 0.0;
  }

  return v14;
}

+ (void)quantizeValuesInDataFrame:(id)a3 forColumn:(id)a4 withBinWidth:(id)a5
{
  id v7;
  id v8;
  id v9;
  uint64_t v10;
  uint64_t v11;
  uint64_t v12;
  uint64_t i;
  void *v14;
  void *v15;
  void *v16;
  double v17;
  double v18;
  double v19;
  uint64_t v20;
  void *v21;
  __int128 v22;
  __int128 v23;
  __int128 v24;
  __int128 v25;
  _BYTE v26[128];
  uint64_t v27;

  v27 = *MEMORY[0x24BDAC8D0];
  v7 = a3;
  v8 = a4;
  v9 = a5;
  v22 = 0u;
  v23 = 0u;
  v24 = 0u;
  v25 = 0u;
  v10 = objc_msgSend(v7, "countByEnumeratingWithState:objects:count:", &v22, v26, 16);
  if (v10)
  {
    v11 = v10;
    v12 = *(_QWORD *)v23;
    do
    {
      for (i = 0; i != v11; ++i)
      {
        if (*(_QWORD *)v23 != v12)
          objc_enumerationMutation(v7);
        v14 = *(void **)(*((_QWORD *)&v22 + 1) + 8 * i);
        v15 = (void *)MEMORY[0x24BDD16E0];
        objc_msgSend(v14, "objectForKeyedSubscript:", v8);
        v16 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v16, "doubleValue");
        v18 = v17;
        objc_msgSend(v9, "doubleValue");
        LODWORD(v20) = vcvtmd_s64_f64(v18 / v19);
        objc_msgSend(v15, "numberWithInt:", v20);
        v21 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v14, "setObject:forKeyedSubscript:", v21, v8);

      }
      v11 = objc_msgSend(v7, "countByEnumeratingWithState:objects:count:", &v22, v26, 16);
    }
    while (v11);
  }

}

+ (id)convertDateToSeconds:(id)a3
{
  void *v3;
  id v4;
  void *v5;
  void *v6;
  void *v7;

  v3 = (void *)MEMORY[0x24BDBCE48];
  v4 = a3;
  objc_msgSend(v3, "currentCalendar");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "components:fromDate:", 224, v4);
  v6 = (void *)objc_claimAutoreleasedReturnValue();

  objc_msgSend(MEMORY[0x24BDD16E0], "numberWithDouble:", (double)objc_msgSend(v6, "minute") * 60.0+ (double)objc_msgSend(v6, "hour") * 3600.0+ (double)objc_msgSend(v6, "second"));
  v7 = (void *)objc_claimAutoreleasedReturnValue();

  return v7;
}

+ (id)convertDateTimeColumnToSeconds:(id)a3 inDataFrame:(id)a4
{
  id v6;
  id v7;
  void *v8;
  id v9;
  uint64_t v10;
  uint64_t v11;
  uint64_t v12;
  uint64_t v13;
  void *v14;
  void *v15;
  __int128 v17;
  __int128 v18;
  __int128 v19;
  __int128 v20;
  _BYTE v21[128];
  uint64_t v22;

  v22 = *MEMORY[0x24BDAC8D0];
  v6 = a3;
  v7 = a4;
  v8 = (void *)objc_opt_new();
  v17 = 0u;
  v18 = 0u;
  v19 = 0u;
  v20 = 0u;
  v9 = v7;
  v10 = objc_msgSend(v9, "countByEnumeratingWithState:objects:count:", &v17, v21, 16);
  if (v10)
  {
    v11 = v10;
    v12 = *(_QWORD *)v18;
    do
    {
      v13 = 0;
      do
      {
        if (*(_QWORD *)v18 != v12)
          objc_enumerationMutation(v9);
        objc_msgSend(*(id *)(*((_QWORD *)&v17 + 1) + 8 * v13), "objectForKey:", v6, (_QWORD)v17);
        v14 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(a1, "convertDateToSeconds:", v14);
        v15 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v8, "addObject:", v15);

        ++v13;
      }
      while (v11 != v13);
      v11 = objc_msgSend(v9, "countByEnumeratingWithState:objects:count:", &v17, v21, 16);
    }
    while (v11);
  }

  return v8;
}

+ (id)filterDataFrame:(id)a3 withValue:(double)a4 forColumn:(id)a5
{
  id v7;
  id v8;
  void *v9;
  id v10;
  uint64_t v11;
  uint64_t v12;
  uint64_t v13;
  uint64_t i;
  void *v15;
  void *v16;
  double v17;
  double v18;
  __int128 v20;
  __int128 v21;
  __int128 v22;
  __int128 v23;
  _BYTE v24[128];
  uint64_t v25;

  v25 = *MEMORY[0x24BDAC8D0];
  v7 = a3;
  v8 = a5;
  v9 = (void *)objc_opt_new();
  v20 = 0u;
  v21 = 0u;
  v22 = 0u;
  v23 = 0u;
  v10 = v7;
  v11 = objc_msgSend(v10, "countByEnumeratingWithState:objects:count:", &v20, v24, 16);
  if (v11)
  {
    v12 = v11;
    v13 = *(_QWORD *)v21;
    do
    {
      for (i = 0; i != v12; ++i)
      {
        if (*(_QWORD *)v21 != v13)
          objc_enumerationMutation(v10);
        v15 = *(void **)(*((_QWORD *)&v20 + 1) + 8 * i);
        objc_msgSend(v15, "objectForKeyedSubscript:", v8, (_QWORD)v20);
        v16 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v16, "doubleValue");
        v18 = vabdd_f64(v17, a4);

        if (v18 <= 0.01)
          objc_msgSend(v9, "addObject:", v15);
      }
      v12 = objc_msgSend(v10, "countByEnumeratingWithState:objects:count:", &v20, v24, 16);
    }
    while (v12);
  }

  return v9;
}

+ (id)filterDataFrame:(id)a3 withValueGreaterThan:(double)a4 andLessThan:(double)a5 forColumn:(id)a6
{
  id v9;
  id v10;
  void *v11;
  id v12;
  uint64_t v13;
  uint64_t v14;
  uint64_t v15;
  uint64_t i;
  void *v17;
  void *v18;
  double v19;
  void *v20;
  double v21;
  double v22;
  __int128 v24;
  __int128 v25;
  __int128 v26;
  __int128 v27;
  _BYTE v28[128];
  uint64_t v29;

  v29 = *MEMORY[0x24BDAC8D0];
  v9 = a3;
  v10 = a6;
  v11 = (void *)objc_opt_new();
  v24 = 0u;
  v25 = 0u;
  v26 = 0u;
  v27 = 0u;
  v12 = v9;
  v13 = objc_msgSend(v12, "countByEnumeratingWithState:objects:count:", &v24, v28, 16);
  if (v13)
  {
    v14 = v13;
    v15 = *(_QWORD *)v25;
    do
    {
      for (i = 0; i != v14; ++i)
      {
        if (*(_QWORD *)v25 != v15)
          objc_enumerationMutation(v12);
        v17 = *(void **)(*((_QWORD *)&v24 + 1) + 8 * i);
        objc_msgSend(v17, "objectForKeyedSubscript:", v10, (_QWORD)v24);
        v18 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v18, "doubleValue");
        if (v19 >= a4)
        {
          objc_msgSend(v17, "objectForKeyedSubscript:", v10);
          v20 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v20, "doubleValue");
          v22 = v21;

          if (v22 < a5)
            objc_msgSend(v11, "addObject:", v17);
        }
        else
        {

        }
      }
      v14 = objc_msgSend(v12, "countByEnumeratingWithState:objects:count:", &v24, v28, 16);
    }
    while (v14);
  }

  return v11;
}

+ (id)filterDataFrame:(id)a3 forColumn:(id)a4 withFilterHandler:(id)a5
{
  id v7;
  id v8;
  uint64_t (**v9)(id, void *);
  void *v10;
  id v11;
  uint64_t v12;
  uint64_t v13;
  uint64_t v14;
  uint64_t i;
  void *v16;
  void *v17;
  void *v18;
  int v19;
  __int128 v21;
  __int128 v22;
  __int128 v23;
  __int128 v24;
  _BYTE v25[128];
  uint64_t v26;

  v26 = *MEMORY[0x24BDAC8D0];
  v7 = a3;
  v8 = a4;
  v9 = (uint64_t (**)(id, void *))a5;
  v10 = (void *)objc_opt_new();
  v21 = 0u;
  v22 = 0u;
  v23 = 0u;
  v24 = 0u;
  v11 = v7;
  v12 = objc_msgSend(v11, "countByEnumeratingWithState:objects:count:", &v21, v25, 16);
  if (v12)
  {
    v13 = v12;
    v14 = *(_QWORD *)v22;
    do
    {
      for (i = 0; i != v13; ++i)
      {
        if (*(_QWORD *)v22 != v14)
          objc_enumerationMutation(v11);
        v16 = *(void **)(*((_QWORD *)&v21 + 1) + 8 * i);
        objc_msgSend(v16, "objectForKey:", v8, (_QWORD)v21);
        v17 = (void *)objc_claimAutoreleasedReturnValue();

        if (v17)
        {
          objc_msgSend(v16, "objectForKeyedSubscript:", v8);
          v18 = (void *)objc_claimAutoreleasedReturnValue();
          v19 = v9[2](v9, v18);

          if (v19)
            objc_msgSend(v10, "addObject:", v16);
        }
      }
      v13 = objc_msgSend(v11, "countByEnumeratingWithState:objects:count:", &v21, v25, 16);
    }
    while (v13);
  }

  return v10;
}

+ (id)column:(id)a3 inDataFrame:(id)a4
{
  id v5;
  id v6;
  void *v7;
  id v8;
  uint64_t v9;
  uint64_t v10;
  uint64_t v11;
  uint64_t v12;
  void *v13;
  void *v14;
  __int128 v16;
  __int128 v17;
  __int128 v18;
  __int128 v19;
  _BYTE v20[128];
  uint64_t v21;

  v21 = *MEMORY[0x24BDAC8D0];
  v5 = a3;
  v6 = a4;
  v7 = (void *)objc_opt_new();
  v16 = 0u;
  v17 = 0u;
  v18 = 0u;
  v19 = 0u;
  v8 = v6;
  v9 = objc_msgSend(v8, "countByEnumeratingWithState:objects:count:", &v16, v20, 16);
  if (v9)
  {
    v10 = v9;
    v11 = *(_QWORD *)v17;
    do
    {
      v12 = 0;
      do
      {
        if (*(_QWORD *)v17 != v11)
          objc_enumerationMutation(v8);
        objc_msgSend(*(id *)(*((_QWORD *)&v16 + 1) + 8 * v12), "objectForKey:", v5, (_QWORD)v16);
        v13 = (void *)objc_claimAutoreleasedReturnValue();
        v14 = (void *)objc_msgSend(v13, "copy");
        objc_msgSend(v7, "addObject:", v14);

        ++v12;
      }
      while (v10 != v12);
      v10 = objc_msgSend(v8, "countByEnumeratingWithState:objects:count:", &v16, v20, 16);
    }
    while (v10);
  }

  return v7;
}

+ (id)meanForColumn:(id)a3 inDataFrame:(id)a4
{
  void *v4;
  void *v5;
  void *v6;

  objc_msgSend(a1, "column:inDataFrame:", a3, a4);
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  v5 = (void *)MEMORY[0x24BDD16E0];
  objc_msgSend(v4, "mean");
  objc_msgSend(v5, "numberWithDouble:");
  v6 = (void *)objc_claimAutoreleasedReturnValue();

  return v6;
}

+ (id)percentile:(double)a3 forColumn:(id)a4 inDataFrame:(id)a5
{
  void *v6;
  void *v7;
  void *v8;

  objc_msgSend(a1, "column:inDataFrame:", a4, a5);
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  v7 = (void *)MEMORY[0x24BDD16E0];
  objc_msgSend(v6, "percentile:", a3);
  objc_msgSend(v7, "numberWithDouble:");
  v8 = (void *)objc_claimAutoreleasedReturnValue();

  return v8;
}

+ (id)percentiles:(id)a3 forColumn:(id)a4 inDataFrame:(id)a5
{
  void *v5;
  void *v6;

  objc_msgSend(a1, "column:inDataFrame:", a4, a5);
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "percentiles:", v5);
  v6 = (void *)objc_claimAutoreleasedReturnValue();

  return v6;
}

+ (id)standardDeviationForColumn:(id)a3 inDataFrame:(id)a4
{
  void *v4;
  void *v5;
  void *v6;

  objc_msgSend(a1, "column:inDataFrame:", a3, a4);
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  v5 = (void *)MEMORY[0x24BDD16E0];
  objc_msgSend(v4, "standardDeviation");
  objc_msgSend(v5, "numberWithDouble:");
  v6 = (void *)objc_claimAutoreleasedReturnValue();

  return v6;
}

+ (id)varianceForColumn:(id)a3 inDataFrame:(id)a4
{
  void *v4;
  double v5;
  double v6;

  objc_msgSend(a1, "standardDeviationForColumn:inDataFrame:", a3, a4);
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "doubleValue");
  v6 = v5;

  return (id)objc_msgSend(MEMORY[0x24BDD16E0], "numberWithDouble:", v6 * v6);
}

+ (id)countForColumn:(id)a3 inDataFrame:(id)a4
{
  void *v4;
  void *v5;

  objc_msgSend(a1, "column:inDataFrame:", a3, a4);
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(MEMORY[0x24BDD16E0], "numberWithUnsignedInteger:", objc_msgSend(v4, "count"));
  v5 = (void *)objc_claimAutoreleasedReturnValue();

  return v5;
}

@end
