@implementation HTDisplayParser

+ (id)displayEventTimestampsFromDisplayInfo:(id)a3
{
  id v3;
  id v4;
  __int128 v5;
  unint64_t v6;
  id v7;
  NSObject *v8;
  void *v9;
  void *v10;
  id v11;
  id v12;
  __int128 v14;
  uint8_t buf[4];
  id v16;

  v3 = a3;
  v4 = objc_alloc_init((Class)NSMutableArray);
  if (objc_msgSend(v3, "count"))
  {
    v6 = 0;
    *(_QWORD *)&v5 = 134217984;
    v14 = v5;
    do
    {
      v7 = sub_10001D38C();
      v8 = objc_claimAutoreleasedReturnValue(v7);
      if (os_log_type_enabled(v8, OS_LOG_TYPE_DEBUG))
      {
        v10 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v3, "objectAtIndexedSubscript:", v6));
        v11 = objc_msgSend(v10, "unsignedLongLongValue");
        *(_DWORD *)buf = v14;
        v16 = v11;
        _os_log_debug_impl((void *)&_mh_execute_header, v8, OS_LOG_TYPE_DEBUG, "display event timestamp: %llu", buf, 0xCu);

      }
      v9 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v3, "objectAtIndexedSubscript:", v6));
      objc_msgSend(v4, "addObject:", v9);

      v6 += 2;
    }
    while ((unint64_t)objc_msgSend(v3, "count") > v6);
  }
  v12 = objc_msgSend(v4, "copy", v14);

  return v12;
}

+ (id)displayEventStatesFromDisplayInfo:(id)a3
{
  id v3;
  id v4;
  __int128 v5;
  unint64_t v6;
  id v7;
  NSObject *v8;
  void *v9;
  void *v10;
  id v11;
  id v12;
  __int128 v14;
  uint8_t buf[4];
  id v16;

  v3 = a3;
  v4 = objc_alloc_init((Class)NSMutableArray);
  if (objc_msgSend(v3, "count"))
  {
    v6 = 1;
    *(_QWORD *)&v5 = 134217984;
    v14 = v5;
    do
    {
      v7 = sub_10001D38C();
      v8 = objc_claimAutoreleasedReturnValue(v7);
      if (os_log_type_enabled(v8, OS_LOG_TYPE_DEBUG))
      {
        v10 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v3, "objectAtIndexedSubscript:", v6));
        v11 = objc_msgSend(v10, "unsignedLongLongValue");
        *(_DWORD *)buf = v14;
        v16 = v11;
        _os_log_debug_impl((void *)&_mh_execute_header, v8, OS_LOG_TYPE_DEBUG, "display event state: %llu", buf, 0xCu);

      }
      v9 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v3, "objectAtIndexedSubscript:", v6));
      objc_msgSend(v4, "addObject:", v9);

      v6 += 2;
    }
    while ((unint64_t)objc_msgSend(v3, "count") >= v6);
  }
  v12 = objc_msgSend(v4, "copy", v14);

  return v12;
}

+ ($2825F4736939C4A6D3AD43837233062D)displayStateBeforeOrAtTime:(unint64_t)a3 timestamps:(id)a4 states:(id)a5
{
  id v7;
  id v8;
  unint64_t v9;
  uint64_t v10;
  uint64_t v11;
  void *v12;
  id v13;
  void *v14;
  unsigned int v15;
  unint64_t v16;

  v7 = a4;
  v8 = a5;
  if (objc_msgSend(v7, "count"))
  {
    v9 = 0;
    LODWORD(v10) = -1;
    LODWORD(v11) = -1;
    do
    {
      v12 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v7, "objectAtIndexedSubscript:", v9));
      v13 = objc_msgSend(v12, "unsignedLongLongValue");

      v14 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v8, "objectAtIndexedSubscript:", v9));
      v15 = objc_msgSend(v14, "intValue");

      if ((unint64_t)v13 <= a3)
        v11 = v9;
      else
        v11 = v11;
      if ((unint64_t)v13 <= a3)
        v10 = v15;
      else
        v10 = v10;
      ++v9;
    }
    while ((unint64_t)objc_msgSend(v7, "count") > v9);
    v16 = v10 << 32;
  }
  else
  {
    v16 = 0xFFFFFFFF00000000;
    v11 = 0xFFFFFFFFLL;
  }

  return ($2825F4736939C4A6D3AD43837233062D)(v16 | v11);
}

+ (DisplayStateChangeEvent)displayStateBeforeHangStartTimestamp:(unint64_t)a3 displayTimestamps:(id)a4 displayStates:(id)a5
{
  id v7;
  id v8;
  unint64_t v9;
  uint64_t v10;
  unint64_t v11;
  uint64_t v12;
  _QWORD v13[6];
  uint64_t v14;
  uint64_t *v15;
  uint64_t v16;
  void *v17;
  __int128 v18;
  DisplayStateChangeEvent result;

  v7 = a4;
  v8 = a5;
  v14 = 0;
  v15 = &v14;
  v16 = 0x3010000000;
  v17 = &unk_100073287;
  v18 = xmmword_10003CF20;
  v13[0] = _NSConcreteStackBlock;
  v13[1] = 3221225472;
  v13[2] = sub_100012250;
  v13[3] = &unk_100075418;
  v13[4] = &v14;
  v13[5] = a3;
  objc_msgSend(v7, "enumerateObjectsWithOptions:usingBlock:", 2, v13);
  v9 = v15[4];
  v10 = v15[5];
  _Block_object_dispose(&v14, 8);

  v11 = v9;
  v12 = v10;
  result.var1 = v12;
  result.var0 = v11;
  return result;
}

+ (id)displayOnIntervalsForDisplayTimestamps:(id)a3 displayStates:(id)a4 startTimestamp:(unint64_t)a5 endTimestamp:(unint64_t)a6 startState:(id *)a7 endState:(id *)a8
{
  id v13;
  id v14;
  id v15;
  NSObject *v16;
  id v17;
  NSObject *v18;
  id v19;
  NSObject *v20;
  id v21;
  id v22;
  void *v23;
  void *v24;
  _UNKNOWN **v25;
  int var1;
  _UNKNOWN **v27;
  void *v28;
  uint64_t var0;
  void *v30;
  uint64_t v31;
  void *v32;
  unsigned int v33;
  void *v34;
  void *v35;
  BOOL v36;
  void *v38;

  v13 = a3;
  v14 = a4;
  *a7 = +[HTDisplayParser displayStateBeforeOrAtTime:timestamps:states:](HTDisplayParser, "displayStateBeforeOrAtTime:timestamps:states:", a5, v13, v14);
  *a8 = +[HTDisplayParser displayStateBeforeOrAtTime:timestamps:states:](HTDisplayParser, "displayStateBeforeOrAtTime:timestamps:states:", a6, v13, v14);
  v15 = sub_10001D38C();
  v16 = objc_claimAutoreleasedReturnValue(v15);
  if (os_log_type_enabled(v16, OS_LOG_TYPE_DEBUG))
    sub_100038388();

  v17 = sub_10001D38C();
  v18 = objc_claimAutoreleasedReturnValue(v17);
  if (os_log_type_enabled(v18, OS_LOG_TYPE_DEBUG))
    sub_100038320();

  if (a7->var0 == -1)
  {
    v19 = sub_10001D38C();
    v20 = objc_claimAutoreleasedReturnValue(v19);
    if (os_log_type_enabled(v20, OS_LOG_TYPE_DEBUG))
      sub_1000382E0(v20);

    a7->var0 = 0;
  }
  v38 = v13;
  v21 = objc_msgSend(v13, "mutableCopy");
  v22 = objc_msgSend(v14, "mutableCopy");
  v23 = (void *)objc_claimAutoreleasedReturnValue(+[NSNumber numberWithUnsignedLongLong:](NSNumber, "numberWithUnsignedLongLong:", a5));
  objc_msgSend(v21, "setObject:atIndexedSubscript:", v23, a7->var0);

  v24 = (void *)objc_claimAutoreleasedReturnValue(+[NSNumber numberWithUnsignedLongLong:](NSNumber, "numberWithUnsignedLongLong:", a6));
  objc_msgSend(v21, "insertObject:atIndex:", v24, a8->var0 + 1);

  v25 = &off_10007A668;
  var1 = a8->var1;
  if (!var1)
    v25 = &off_10007A650;
  if (var1 == 1)
    v27 = &off_10007A638;
  else
    v27 = v25;
  objc_msgSend(v22, "insertObject:atIndex:", v27, a8->var0 + 1);
  v28 = (void *)objc_claimAutoreleasedReturnValue(+[NSMutableArray array](NSMutableArray, "array"));
  var0 = a7->var0;
  if ((int)var0 <= a8->var0)
  {
    do
    {
      v30 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v22, "objectAtIndexedSubscript:", var0));
      if (objc_msgSend(v30, "intValue") == 1)
      {
        v31 = var0 + 1;
        v32 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v22, "objectAtIndexedSubscript:", var0 + 1));
        v33 = objc_msgSend(v32, "intValue");

        if (!v33)
        {
          v34 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v21, "objectAtIndexedSubscript:", var0));
          objc_msgSend(v28, "addObject:", v34);

          v35 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v21, "objectAtIndexedSubscript:", var0 + 1));
          objc_msgSend(v28, "addObject:", v35);

        }
      }
      else
      {

        v31 = var0 + 1;
      }
      v36 = var0 < a8->var0;
      var0 = v31;
    }
    while (v36);
  }

  return v28;
}

+ (id)displayInfoForSpindump:(id)a3 startAbsoluteTime:(unint64_t)a4 endAbsoluteTime:(unint64_t)a5
{
  void *v8;
  void *v9;
  void *v10;
  void *v11;
  id v12;
  double v13;
  double v14;
  unint64_t v15;
  id v16;
  double v17;
  char *v18;
  unint64_t v19;
  double v20;
  void *v21;
  unint64_t v22;
  void *v23;
  unint64_t v24;
  void *v25;
  void *v26;
  float v27;
  id v28;
  NSObject *v29;
  void *v30;
  id v31;
  void *v32;
  void *v33;
  NSNumber *v34;
  void *v35;
  double v36;
  void *v37;
  unint64_t v39;
  void *v40;
  void *v41;
  void *v42;
  id v43;
  uint64_t v44;
  uint8_t buf[8];
  const __CFString *v46;
  id v47;

  v8 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(a3, "objectForKeyedSubscript:", CFSTR("DisplayData")));
  if (objc_msgSend(v8, "count"))
  {
    v44 = -1;
    *(_QWORD *)buf = -1;
    v9 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(a1, "displayEventTimestampsFromDisplayInfo:", v8));
    v10 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(a1, "displayEventStatesFromDisplayInfo:", v8));
    v43 = +[HTDisplayParser displayStateBeforeHangStartTimestamp:displayTimestamps:displayStates:](HTDisplayParser, "displayStateBeforeHangStartTimestamp:displayTimestamps:displayStates:", a4, v9, v10);
    v11 = (void *)objc_claimAutoreleasedReturnValue(+[HTDisplayParser displayOnIntervalsForDisplayTimestamps:displayStates:startTimestamp:endTimestamp:startState:endState:](HTDisplayParser, "displayOnIntervalsForDisplayTimestamps:displayStates:startTimestamp:endTimestamp:startState:endState:", v9, v10, a4, a5, buf, &v44));
    v12 = objc_msgSend(v11, "mutableCopy");
    v13 = sub_1000064D8(a4);
    v14 = sub_1000064D8(a5);
    if (objc_msgSend(v11, "count"))
    {
      v15 = (unint64_t)v14 - (unint64_t)v13;
      v16 = objc_msgSend(v11, "count");
      LODWORD(v17) = 0;
      if (v16 != (id)1)
      {
        v39 = (unint64_t)v14 - (unint64_t)v13;
        v40 = v10;
        v41 = v9;
        v42 = v8;
        v18 = 0;
        v19 = 0;
        v20 = (double)(unint64_t)v13;
        do
        {
          v21 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v12, "objectAtIndexedSubscript:", v18, v17, v39, v40, v41, v42));
          v22 = (unint64_t)(sub_1000064D8((unint64_t)objc_msgSend(v21, "unsignedLongLongValue")) - v20);

          v23 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v12, "objectAtIndexedSubscript:", v18 + 1));
          v24 = (unint64_t)(sub_1000064D8((unint64_t)objc_msgSend(v23, "unsignedLongLongValue")) - v20);

          v25 = (void *)objc_claimAutoreleasedReturnValue(+[NSNumber numberWithUnsignedLongLong:](NSNumber, "numberWithUnsignedLongLong:", v22));
          objc_msgSend(v12, "setObject:atIndexedSubscript:", v25, v18);

          v26 = (void *)objc_claimAutoreleasedReturnValue(+[NSNumber numberWithUnsignedLongLong:](NSNumber, "numberWithUnsignedLongLong:", v24));
          objc_msgSend(v12, "setObject:atIndexedSubscript:", v26, v18 + 1);

          v19 = v19 - v22 + v24;
          v18 += 2;
        }
        while ((char *)objc_msgSend(v11, "count") - 1 > v18);
        *(float *)&v17 = (float)v19;
        v9 = v41;
        v8 = v42;
        v15 = v39;
        v10 = v40;
      }
      v27 = *(float *)&v17 / (float)v15;
    }
    else
    {
      v27 = 0.0;
    }
    v31 = objc_alloc_init((Class)NSMutableDictionary);
    v32 = (void *)objc_claimAutoreleasedReturnValue(+[NSNumber numberWithInt:](NSNumber, "numberWithInt:", *(unsigned int *)&buf[4]));
    objc_msgSend(v31, "setObject:forKeyedSubscript:", v32, CFSTR("startState"));

    v33 = (void *)objc_claimAutoreleasedReturnValue(+[NSNumber numberWithInt:](NSNumber, "numberWithInt:", HIDWORD(v44)));
    objc_msgSend(v31, "setObject:forKeyedSubscript:", v33, CFSTR("endState"));

    objc_msgSend(v31, "setObject:forKeyedSubscript:", v12, CFSTR("displayOnIntervals"));
    if (v43)
    {
      v34 = +[NSNumber numberWithDouble:](NSNumber, "numberWithDouble:", sub_10000652C(a4 - (_QWORD)v43));
      v35 = (void *)objc_claimAutoreleasedReturnValue(v34);
      objc_msgSend(v31, "setObject:forKeyedSubscript:", v35, CFSTR("secondsSinceDisplayStateBeforeHangStart"));

    }
    else
    {
      objc_msgSend(v31, "setObject:forKeyedSubscript:", &off_10007A6C8, CFSTR("secondsSinceDisplayStateBeforeHangStart"));
    }
    *(float *)&v36 = v27;
    v37 = (void *)objc_claimAutoreleasedReturnValue(+[NSNumber numberWithFloat:](NSNumber, "numberWithFloat:", v36));
    objc_msgSend(v31, "setObject:forKeyedSubscript:", v37, CFSTR("displayOnPercent"));

    v46 = CFSTR("displayData");
    v47 = v31;
    v30 = (void *)objc_claimAutoreleasedReturnValue(+[NSDictionary dictionaryWithObjects:forKeys:count:](NSDictionary, "dictionaryWithObjects:forKeys:count:", &v47, &v46, 1));

  }
  else
  {
    v28 = sub_10001D38C();
    v29 = objc_claimAutoreleasedReturnValue(v28);
    if (os_log_type_enabled(v29, OS_LOG_TYPE_INFO))
    {
      *(_WORD *)buf = 0;
      _os_log_impl((void *)&_mh_execute_header, v29, OS_LOG_TYPE_INFO, "No display information has been logged. Are you sure you restarted after writing to defaults?", buf, 2u);
    }

    v30 = &__NSDictionary0__struct;
  }

  return v30;
}

@end
