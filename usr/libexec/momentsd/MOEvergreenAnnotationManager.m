@implementation MOEvergreenAnnotationManager

- (MOEvergreenAnnotationManager)initWithUniverse:(id)a3
{
  id v5;
  MOEvergreenAnnotationManager *v6;
  uint64_t v7;
  MOEvergreenAnnotationManager *v8;
  objc_class *v9;
  NSString *v10;
  id v11;
  const char *v12;
  dispatch_queue_attr_t v13;
  NSObject *v14;
  dispatch_queue_t v15;
  OS_dispatch_queue *queue;
  id v17;
  void *v18;
  uint64_t v19;
  NSDate *referenceDate;
  objc_super v22;

  v5 = a3;
  objc_storeStrong((id *)&self->fUniverse, a3);
  v22.receiver = self;
  v22.super_class = (Class)MOEvergreenAnnotationManager;
  v6 = -[MOEvergreenAnnotationManager init](&v22, "init");
  v8 = v6;
  if (v6)
  {
    v9 = (objc_class *)objc_opt_class(v6, v7);
    v10 = NSStringFromClass(v9);
    v11 = objc_retainAutorelease((id)objc_claimAutoreleasedReturnValue(v10));
    v12 = (const char *)objc_msgSend(v11, "UTF8String");
    v13 = dispatch_queue_attr_make_with_autorelease_frequency(0, DISPATCH_AUTORELEASE_FREQUENCY_WORK_ITEM);
    v14 = objc_claimAutoreleasedReturnValue(v13);
    v15 = dispatch_queue_create(v12, v14);
    queue = v8->_queue;
    v8->_queue = (OS_dispatch_queue *)v15;

    v17 = objc_alloc_init((Class)NSDateComponents);
    objc_msgSend(v17, "setHour:", 3);
    objc_msgSend(v17, "setDay:", 1);
    objc_msgSend(v17, "setMonth:", 1);
    objc_msgSend(v17, "setYear:", 2023);
    v18 = (void *)objc_claimAutoreleasedReturnValue(+[NSCalendar currentCalendar](NSCalendar, "currentCalendar"));
    v19 = objc_claimAutoreleasedReturnValue(objc_msgSend(v18, "dateFromComponents:", v17));
    referenceDate = v8->_referenceDate;
    v8->_referenceDate = (NSDate *)v19;

  }
  return v8;
}

- (void)performAnnotationWithEvents:(id)a3 withPatternEvents:(id)a4 handler:(id)a5
{
  id v8;
  id v9;
  id v10;
  NSObject *v11;
  id v12;
  id v13;
  id v14;
  _QWORD v15[4];
  id v16;
  MOEvergreenAnnotationManager *v17;
  id v18;
  id v19;

  v8 = a3;
  v9 = a4;
  v10 = a5;
  v11 = objc_claimAutoreleasedReturnValue(-[MOEvergreenAnnotationManager queue](self, "queue"));
  v15[0] = _NSConcreteStackBlock;
  v15[1] = 3221225472;
  v15[2] = __86__MOEvergreenAnnotationManager_performAnnotationWithEvents_withPatternEvents_handler___block_invoke;
  v15[3] = &unk_1002ADA68;
  v16 = v8;
  v17 = self;
  v18 = v9;
  v19 = v10;
  v12 = v10;
  v13 = v9;
  v14 = v8;
  dispatch_async(v11, v15);

}

void __86__MOEvergreenAnnotationManager_performAnnotationWithEvents_withPatternEvents_handler___block_invoke(uint64_t a1)
{
  id v2;
  void *v3;
  void *v4;
  void *v5;
  void *v6;
  id v7;

  v2 = objc_alloc((Class)NSDateInterval);
  v3 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(*(id *)(a1 + 32), "firstObject"));
  v4 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v3, "startDate"));
  v5 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(*(id *)(a1 + 32), "lastObject"));
  v6 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v5, "endDate"));
  v7 = objc_msgSend(v2, "initWithStartDate:endDate:", v4, v6);

  objc_msgSend(*(id *)(a1 + 40), "_performAnnotationWithEvents:withPatternEvents:dateInterval:handler:", *(_QWORD *)(a1 + 32), *(_QWORD *)(a1 + 48), v7, *(_QWORD *)(a1 + 56));
}

- (void)performAnnotationWithEvents:(id)a3 withPatternEvents:(id)a4 dateInterval:(id)a5 handler:(id)a6
{
  id v10;
  id v11;
  id v12;
  id v13;
  NSObject *v14;
  id v15;
  id v16;
  id v17;
  id v18;
  _QWORD block[5];
  id v20;
  id v21;
  id v22;
  id v23;

  v10 = a3;
  v11 = a4;
  v12 = a5;
  v13 = a6;
  v14 = objc_claimAutoreleasedReturnValue(-[MOEvergreenAnnotationManager queue](self, "queue"));
  block[0] = _NSConcreteStackBlock;
  block[1] = 3221225472;
  block[2] = __99__MOEvergreenAnnotationManager_performAnnotationWithEvents_withPatternEvents_dateInterval_handler___block_invoke;
  block[3] = &unk_1002AE198;
  block[4] = self;
  v20 = v10;
  v21 = v11;
  v22 = v12;
  v23 = v13;
  v15 = v13;
  v16 = v12;
  v17 = v11;
  v18 = v10;
  dispatch_async(v14, block);

}

id __99__MOEvergreenAnnotationManager_performAnnotationWithEvents_withPatternEvents_dateInterval_handler___block_invoke(uint64_t a1)
{
  return objc_msgSend(*(id *)(a1 + 32), "_performAnnotationWithEvents:withPatternEvents:dateInterval:handler:", *(_QWORD *)(a1 + 40), *(_QWORD *)(a1 + 48), *(_QWORD *)(a1 + 56), *(_QWORD *)(a1 + 64));
}

- (void)_performAnnotationWithEvents:(id)a3 withPatternEvents:(id)a4 dateInterval:(id)a5 handler:(id)a6
{
  id v7;
  void *v8;
  double v9;
  unint64_t v10;
  void *v11;
  void *v12;
  id v13;

  v7 = a6;
  v8 = (void *)objc_claimAutoreleasedReturnValue(+[NSDate date](NSDate, "date"));
  objc_msgSend(v8, "timeIntervalSinceReferenceDate");
  v10 = (unint64_t)(v9 / 86400.0);

  v11 = (void *)objc_claimAutoreleasedReturnValue(+[NSDate date](NSDate, "date"));
  v13 = (id)objc_claimAutoreleasedReturnValue(objc_msgSend(v11, "dateByAddingTimeInterval:", -3600.0));

  v12 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v13, "dateByAddingTimeInterval:", 3600.0));
  -[MOEvergreenAnnotationManager _performAnnotationWithSeed:startDate:endDate:handler:](self, "_performAnnotationWithSeed:startDate:endDate:handler:", v10, v13, v12, v7);

}

- (void)performAnnotationWithSeed:(unint64_t)a3 startDate:(id)a4 endDate:(id)a5 handler:(id)a6
{
  id v10;
  id v11;
  id v12;
  NSObject *v13;
  id v14;
  id v15;
  id v16;
  _QWORD block[5];
  id v18;
  id v19;
  id v20;
  unint64_t v21;

  v10 = a4;
  v11 = a5;
  v12 = a6;
  v13 = objc_claimAutoreleasedReturnValue(-[MOEvergreenAnnotationManager queue](self, "queue"));
  block[0] = _NSConcreteStackBlock;
  block[1] = 3221225472;
  block[2] = __84__MOEvergreenAnnotationManager_performAnnotationWithSeed_startDate_endDate_handler___block_invoke;
  block[3] = &unk_1002AEA58;
  v20 = v12;
  v21 = a3;
  block[4] = self;
  v18 = v10;
  v19 = v11;
  v14 = v12;
  v15 = v11;
  v16 = v10;
  dispatch_async(v13, block);

}

id __84__MOEvergreenAnnotationManager_performAnnotationWithSeed_startDate_endDate_handler___block_invoke(uint64_t a1)
{
  return objc_msgSend(*(id *)(a1 + 32), "_performAnnotationWithSeed:startDate:endDate:handler:", *(_QWORD *)(a1 + 64), *(_QWORD *)(a1 + 40), *(_QWORD *)(a1 + 48), *(_QWORD *)(a1 + 56));
}

- (void)_performAnnotationWithSeed:(unint64_t)a3 startDate:(id)a4 endDate:(id)a5 handler:(id)a6
{
  void *v8;
  unint64_t v9;
  void *i;
  uint64_t v11;
  void *v12;
  unint64_t v13;
  void *v14;
  NSMutableArray *v15;
  uint64_t v16;
  uint64_t v17;
  void *v18;
  id os_log;
  NSObject *v20;
  MOResource *v21;
  id v22;
  MOResource *v23;
  MOEventBundle *v24;
  void *v25;
  void *v26;
  MOEventBundle *v27;
  unint64_t v28;
  void *v29;
  void *v30;
  id v31;
  void (**v32)(id, id, _QWORD);
  uint64_t v34;
  NSMutableArray *v36;
  id v37;
  id v38;
  id v39;
  id obj;
  __int128 v41;
  __int128 v42;
  __int128 v43;
  __int128 v44;
  MOResource *v45;
  uint8_t buf[4];
  const char *v47;
  __int16 v48;
  uint64_t v49;
  __int16 v50;
  unint64_t v51;
  __int16 v52;
  unint64_t v53;
  __int16 v54;
  NSMutableArray *v55;
  __int16 v56;
  unint64_t v57;
  _BYTE v58[128];
  _QWORD v59[6];
  _QWORD v60[6];

  v38 = a4;
  v37 = a5;
  v32 = (void (**)(id, id, _QWORD))a6;
  v59[0] = CFSTR("WISDOM");
  v59[1] = CFSTR("GRATITUDE");
  v60[0] = &off_1002D9A40;
  v60[1] = &off_1002D9A58;
  v59[2] = CFSTR("KINDNESS");
  v59[3] = CFSTR("PURPOSE");
  v60[2] = &off_1002D9A70;
  v60[3] = &off_1002D9A88;
  v59[4] = CFSTR("RESILIENCE");
  v59[5] = CFSTR("CREATIVITY");
  v60[4] = &off_1002D9AA0;
  v60[5] = &off_1002D9AB8;
  v8 = (void *)objc_claimAutoreleasedReturnValue(+[NSDictionary dictionaryWithObjects:forKeys:count:](NSDictionary, "dictionaryWithObjects:forKeys:count:", v60, v59, 6));
  v36 = objc_opt_new(NSMutableArray);
  v41 = 0u;
  v42 = 0u;
  v43 = 0u;
  v44 = 0u;
  obj = v8;
  v39 = objc_msgSend(obj, "countByEnumeratingWithState:objects:count:", &v41, v58, 16);
  if (v39)
  {
    v34 = *(_QWORD *)v42;
    v9 = 5 * a3;
    do
    {
      for (i = 0; i != v39; i = (char *)i + 1)
      {
        if (*(_QWORD *)v42 != v34)
          objc_enumerationMutation(obj);
        v11 = *(_QWORD *)(*((_QWORD *)&v41 + 1) + 8 * (_QWORD)i);
        v12 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(obj, "objectForKey:", v11));
        v13 = objc_msgSend(v12, "unsignedIntValue");

        v14 = (void *)objc_claimAutoreleasedReturnValue(-[MOEvergreenAnnotationManager shuffledIndexesWithSize:](self, "shuffledIndexesWithSize:", v13));
        v15 = objc_opt_new(NSMutableArray);
        v16 = 0;
        v17 = 5;
        do
        {
          v18 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v14, "objectAtIndex:", (v9 % v13 + v16) % v13));
          -[NSMutableArray addObject:](v15, "addObject:", v18);

          ++v16;
          --v17;
        }
        while (v17);
        os_log = _mo_log_facility_get_os_log(&MOLogFacilityEventBundleManager);
        v20 = objc_claimAutoreleasedReturnValue(os_log);
        if (os_log_type_enabled(v20, OS_LOG_TYPE_INFO))
        {
          *(_DWORD *)buf = 136316418;
          v47 = "-[MOEvergreenAnnotationManager _performAnnotationWithSeed:startDate:endDate:handler:]";
          v48 = 2112;
          v49 = v11;
          v50 = 2048;
          v51 = v13;
          v52 = 2048;
          v53 = v9 % v13;
          v54 = 2112;
          v55 = v15;
          v56 = 2048;
          v57 = a3;
          _os_log_impl((void *)&_mh_execute_header, v20, OS_LOG_TYPE_INFO, "%s, Evergreen Context, build a bundle, type, %@, promptCount, %lu, first index, %lu, indexes, %@, seed, %lu", buf, 0x3Eu);
        }

        v21 = [MOResource alloc];
        v22 = -[NSMutableArray copy](v15, "copy");
        v23 = -[MOResource initWithEvergreenTypeName:promptIndexes:](v21, "initWithEvergreenTypeName:promptIndexes:", v11, v22);

        v24 = [MOEventBundle alloc];
        v25 = (void *)objc_claimAutoreleasedReturnValue(+[NSUUID UUID](NSUUID, "UUID"));
        v26 = (void *)objc_claimAutoreleasedReturnValue(+[NSDate date](NSDate, "date"));
        v27 = -[MOEventBundle initWithBundleIdentifier:creationDate:](v24, "initWithBundleIdentifier:creationDate:", v25, v26);

        -[MOEventBundle setInterfaceType:](v27, "setInterfaceType:", 11);
        -[MOEventBundle setBundleSuperType:](v27, "setBundleSuperType:", 7);
        v28 = -[MOResource evergreenType](v23, "evergreenType") - 1;
        if (v28 <= 5)
          -[MOEventBundle setBundleSubType:](v27, "setBundleSubType:", qword_10029F188[v28]);
        v45 = v23;
        v29 = (void *)objc_claimAutoreleasedReturnValue(+[NSArray arrayWithObjects:count:](NSArray, "arrayWithObjects:count:", &v45, 1));
        -[MOEventBundle setResources:](v27, "setResources:", v29);

        -[MOEventBundle setPromptLanguage:](v27, "setPromptLanguage:", v11);
        -[MOEventBundle setStartDate:](v27, "setStartDate:", v38);
        -[MOEventBundle setEndDate:](v27, "setEndDate:", v37);
        v30 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v37, "dateByAddingTimeInterval:", *(double *)&kMOEvergreenExpirationInterval));
        -[MOEventBundle setExpirationDate:](v27, "setExpirationDate:", v30);

        -[NSMutableArray addObject:](v36, "addObject:", v27);
      }
      v39 = objc_msgSend(obj, "countByEnumeratingWithState:objects:count:", &v41, v58, 16);
    }
    while (v39);
  }

  v31 = -[NSMutableArray copy](v36, "copy");
  v32[2](v32, v31, 0);

}

- (id)shuffledIndexesWithSize:(unint64_t)a3
{
  NSMutableArray *v4;
  uint64_t v5;
  void *v6;
  unint64_t v7;
  uint64_t v8;
  uint32_t v9;
  id v10;

  if (a3)
  {
    v4 = objc_opt_new(NSMutableArray);
    v5 = 0;
    do
    {
      v6 = (void *)objc_claimAutoreleasedReturnValue(+[NSNumber numberWithUnsignedInt:](NSNumber, "numberWithUnsignedInt:", v5));
      -[NSMutableArray addObject:](v4, "addObject:", v6);

      ++v5;
    }
    while (a3 != v5);
    v7 = a3 - 1;
    if (a3 != 1)
    {
      v8 = 0;
      v9 = a3 - 1;
      do
      {
        -[NSMutableArray exchangeObjectAtIndex:withObjectAtIndex:](v4, "exchangeObjectAtIndex:withObjectAtIndex:", v8, v8 + 1 + arc4random_uniform(v9--));
        ++v8;
      }
      while (v7 != v8);
    }
    v10 = -[NSMutableArray copy](v4, "copy");

  }
  else
  {
    v10 = &__NSArray0__struct;
  }
  return v10;
}

+ (void)replacePromptIndicesOfEvergreen:(id)a3 isTah:(BOOL)a4
{
  id v4;
  id v5;
  uint64_t v6;
  void *v7;
  void *v8;
  void *v9;
  MOResource *v10;
  id v11;
  void *v12;
  void *v13;
  void *v14;
  void *v15;
  _QWORD *v16;
  void *v17;
  void *v18;
  void *v19;
  void *v20;
  void *v21;
  void *v22;
  _QWORD *v23;
  void *v24;
  void *v25;
  void *v26;
  void *v27;
  void *v28;
  void *v29;
  _QWORD *v30;
  void *v31;
  MOResource *v32;
  void *v33;
  id v34;
  MOResource *v35;
  uint64_t v36;
  MOResource *v37;
  MOResource *v38;
  void *v39;
  void *v40;
  void *v41;
  uint64_t v42;
  id v43;
  id obj;
  _BOOL4 v45;
  __int128 v46;
  __int128 v47;
  __int128 v48;
  __int128 v49;
  MOResource *v50;
  _QWORD v51[5];
  _QWORD v52[5];
  _QWORD v53[5];
  _QWORD v54[5];
  _QWORD v55[5];
  _QWORD v56[5];
  _BYTE v57[128];

  v45 = a4;
  v46 = 0u;
  v47 = 0u;
  v48 = 0u;
  v49 = 0u;
  obj = a3;
  v4 = objc_msgSend(obj, "countByEnumeratingWithState:objects:count:", &v46, v57, 16);
  if (v4)
  {
    v5 = v4;
    v6 = *(_QWORD *)v47;
    v42 = *(_QWORD *)v47;
    do
    {
      v7 = 0;
      v43 = v5;
      do
      {
        if (*(_QWORD *)v47 != v6)
          objc_enumerationMutation(obj);
        v8 = *(void **)(*((_QWORD *)&v46 + 1) + 8 * (_QWORD)v7);
        v9 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v8, "resources"));
        v10 = (MOResource *)objc_claimAutoreleasedReturnValue(objc_msgSend(v9, "objectAtIndexedSubscript:", 0));

        v11 = -[MOResource evergreenType](v10, "evergreenType");
        if (v11 == (id)5)
        {
          if (v45)
          {
            v52[0] = &off_1002D9AA0;
            v52[1] = &off_1002D9B30;
            v24 = (void *)objc_claimAutoreleasedReturnValue(-[MOResource promptIndexes](v10, "promptIndexes"));
            v25 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v24, "objectAtIndexedSubscript:", 2));
            v52[2] = v25;
            v26 = (void *)objc_claimAutoreleasedReturnValue(-[MOResource promptIndexes](v10, "promptIndexes"));
            v27 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v26, "objectAtIndexedSubscript:", 3));
            v52[3] = v27;
            v28 = (void *)objc_claimAutoreleasedReturnValue(-[MOResource promptIndexes](v10, "promptIndexes"));
            v29 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v28, "objectAtIndexedSubscript:", 4));
            v52[4] = v29;
            v30 = v52;
          }
          else
          {
            v51[0] = &off_1002D9B48;
            v51[1] = &off_1002D9A70;
            v24 = (void *)objc_claimAutoreleasedReturnValue(-[MOResource promptIndexes](v10, "promptIndexes"));
            v25 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v24, "objectAtIndexedSubscript:", 2));
            v51[2] = v25;
            v26 = (void *)objc_claimAutoreleasedReturnValue(-[MOResource promptIndexes](v10, "promptIndexes"));
            v27 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v26, "objectAtIndexedSubscript:", 3));
            v51[3] = v27;
            v28 = (void *)objc_claimAutoreleasedReturnValue(-[MOResource promptIndexes](v10, "promptIndexes"));
            v29 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v28, "objectAtIndexedSubscript:", 4));
            v51[4] = v29;
            v30 = v51;
          }
          v31 = (void *)objc_claimAutoreleasedReturnValue(+[NSArray arrayWithObjects:count:](NSArray, "arrayWithObjects:count:", v30, 5));

          v38 = [MOResource alloc];
          v33 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v8, "promptLanguage"));
          v34 = objc_msgSend(v31, "copy");
          v35 = -[MOResource initWithEvergreenTypeName:promptIndexes:](v38, "initWithEvergreenTypeName:promptIndexes:", v33, v34);
          v36 = 708;
          goto LABEL_21;
        }
        if (v11 == (id)4)
        {
          if (v45)
          {
            v54[0] = &off_1002D9A88;
            v41 = (void *)objc_claimAutoreleasedReturnValue(-[MOResource promptIndexes](v10, "promptIndexes"));
            v40 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v41, "objectAtIndexedSubscript:", 1));
            v54[1] = v40;
            v17 = (void *)objc_claimAutoreleasedReturnValue(-[MOResource promptIndexes](v10, "promptIndexes"));
            v18 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v17, "objectAtIndexedSubscript:", 2));
            v54[2] = v18;
            v19 = (void *)objc_claimAutoreleasedReturnValue(-[MOResource promptIndexes](v10, "promptIndexes"));
            v20 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v19, "objectAtIndexedSubscript:", 3));
            v54[3] = v20;
            v21 = (void *)objc_claimAutoreleasedReturnValue(-[MOResource promptIndexes](v10, "promptIndexes"));
            v22 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v21, "objectAtIndexedSubscript:", 4));
            v54[4] = v22;
            v23 = v54;
          }
          else
          {
            v53[0] = &off_1002D9AB8;
            v41 = (void *)objc_claimAutoreleasedReturnValue(-[MOResource promptIndexes](v10, "promptIndexes"));
            v40 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v41, "objectAtIndexedSubscript:", 1));
            v53[1] = v40;
            v17 = (void *)objc_claimAutoreleasedReturnValue(-[MOResource promptIndexes](v10, "promptIndexes"));
            v18 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v17, "objectAtIndexedSubscript:", 2));
            v53[2] = v18;
            v19 = (void *)objc_claimAutoreleasedReturnValue(-[MOResource promptIndexes](v10, "promptIndexes"));
            v20 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v19, "objectAtIndexedSubscript:", 3));
            v53[3] = v20;
            v21 = (void *)objc_claimAutoreleasedReturnValue(-[MOResource promptIndexes](v10, "promptIndexes"));
            v22 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v21, "objectAtIndexedSubscript:", 4));
            v53[4] = v22;
            v23 = v53;
          }
          v31 = (void *)objc_claimAutoreleasedReturnValue(+[NSArray arrayWithObjects:count:](NSArray, "arrayWithObjects:count:", v23, 5));

          v32 = [MOResource alloc];
          v33 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v8, "promptLanguage"));
          v34 = objc_msgSend(v31, "copy");
          v35 = -[MOResource initWithEvergreenTypeName:promptIndexes:](v32, "initWithEvergreenTypeName:promptIndexes:", v33, v34);
          v36 = 709;
LABEL_21:
          v6 = v42;
          v5 = v43;
          goto LABEL_22;
        }
        if (v11 != (id)2)
          goto LABEL_23;
        if (v45)
        {
          v56[0] = &off_1002D9A58;
          v56[1] = &off_1002D9A40;
          v56[2] = &off_1002D9AD0;
          v12 = (void *)objc_claimAutoreleasedReturnValue(-[MOResource promptIndexes](v10, "promptIndexes"));
          v13 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v12, "objectAtIndexedSubscript:", 3));
          v56[3] = v13;
          v14 = (void *)objc_claimAutoreleasedReturnValue(-[MOResource promptIndexes](v10, "promptIndexes"));
          v15 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v14, "objectAtIndexedSubscript:", 4));
          v56[4] = v15;
          v16 = v56;
        }
        else
        {
          v55[0] = &off_1002D9AE8;
          v55[1] = &off_1002D9B00;
          v55[2] = &off_1002D9B18;
          v12 = (void *)objc_claimAutoreleasedReturnValue(-[MOResource promptIndexes](v10, "promptIndexes"));
          v13 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v12, "objectAtIndexedSubscript:", 3));
          v55[3] = v13;
          v14 = (void *)objc_claimAutoreleasedReturnValue(-[MOResource promptIndexes](v10, "promptIndexes"));
          v15 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v14, "objectAtIndexedSubscript:", 4));
          v55[4] = v15;
          v16 = v55;
        }
        v31 = (void *)objc_claimAutoreleasedReturnValue(+[NSArray arrayWithObjects:count:](NSArray, "arrayWithObjects:count:", v16, 5));

        v37 = [MOResource alloc];
        v33 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v8, "promptLanguage"));
        v34 = objc_msgSend(v31, "copy");
        v35 = -[MOResource initWithEvergreenTypeName:promptIndexes:](v37, "initWithEvergreenTypeName:promptIndexes:", v33, v34);
        v36 = 707;
LABEL_22:

        objc_msgSend(v8, "setBundleSubType:", v36);
        v10 = v35;
LABEL_23:
        v50 = v10;
        v39 = (void *)objc_claimAutoreleasedReturnValue(+[NSArray arrayWithObjects:count:](NSArray, "arrayWithObjects:count:", &v50, 1));
        objc_msgSend(v8, "setResources:", v39);

        v7 = (char *)v7 + 1;
      }
      while (v5 != v7);
      v5 = objc_msgSend(obj, "countByEnumeratingWithState:objects:count:", &v46, v57, 16);
    }
    while (v5);
  }

}

+ (id)evergreenTypeStringFromEvergreenType:(unint64_t)a3
{
  if (a3 - 1 > 5)
    return 0;
  else
    return *off_1002B3720[a3 - 1];
}

+ (unint64_t)evergreenTypeFromEvergreenTypeString:(id)a3
{
  id v3;
  unint64_t v4;

  v3 = a3;
  if ((objc_msgSend(CFSTR("WISDOM"), "isEqualToString:", v3) & 1) != 0)
  {
    v4 = 1;
  }
  else if ((objc_msgSend(CFSTR("PURPOSE"), "isEqualToString:", v3) & 1) != 0)
  {
    v4 = 4;
  }
  else if ((objc_msgSend(CFSTR("KINDNESS"), "isEqualToString:", v3) & 1) != 0)
  {
    v4 = 3;
  }
  else if ((objc_msgSend(CFSTR("GRATITUDE"), "isEqualToString:", v3) & 1) != 0)
  {
    v4 = 2;
  }
  else if ((objc_msgSend(CFSTR("CREATIVITY"), "isEqualToString:", v3) & 1) != 0)
  {
    v4 = 6;
  }
  else if (objc_msgSend(CFSTR("RESILIENCE"), "isEqualToString:", v3))
  {
    v4 = 5;
  }
  else
  {
    v4 = 0;
  }

  return v4;
}

- (OS_dispatch_queue)queue
{
  return self->_queue;
}

- (NSDate)referenceDate
{
  return self->_referenceDate;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_referenceDate, 0);
  objc_storeStrong((id *)&self->_queue, 0);
  objc_storeStrong((id *)&self->fUniverse, 0);
}

@end
