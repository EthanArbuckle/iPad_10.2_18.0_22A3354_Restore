@implementation MOTrendAnnotationManager

- (MOTrendAnnotationManager)initWithUniverse:(id)a3
{
  id v5;
  MOTrendAnnotationManager *v6;
  dispatch_queue_attr_t v7;
  NSObject *v8;
  dispatch_queue_t v9;
  OS_dispatch_queue *queue;
  uint64_t v11;
  objc_class *v12;
  NSString *v13;
  void *v14;
  uint64_t v15;
  MOConfigurationManager *configurationManager;
  id os_log;
  NSObject *v18;
  NSMutableArray *v19;
  MOTrendBundler *v20;
  MOTrendBundlerPredicateWorkoutTypePattern *v21;
  MOTrendBundlerAnnotatorRecentEvent *v22;
  MOTrendBundler *v23;
  MOTrendBundlerPredicateContactTypeTrend *v24;
  double v25;
  void *v26;
  void *v27;
  id v28;
  NSObject *v29;
  unsigned int v30;
  objc_super v32;
  uint8_t buf[4];
  unsigned int v34;
  const __CFString *v35;
  void *v36;

  v5 = a3;
  v32.receiver = self;
  v32.super_class = (Class)MOTrendAnnotationManager;
  v6 = -[MOTrendAnnotationManager init](&v32, "init");
  if (v6)
  {
    v7 = dispatch_queue_attr_make_with_autorelease_frequency((dispatch_queue_attr_t)&_dispatch_queue_attr_concurrent, DISPATCH_AUTORELEASE_FREQUENCY_WORK_ITEM);
    v8 = objc_claimAutoreleasedReturnValue(v7);
    v9 = dispatch_queue_create("MOTrendAnnotationManager", v8);
    queue = v6->_queue;
    v6->_queue = (OS_dispatch_queue *)v9;

    objc_storeStrong((id *)&v6->_universe, a3);
    v12 = (objc_class *)objc_opt_class(MOConfigurationManager, v11);
    v13 = NSStringFromClass(v12);
    v14 = (void *)objc_claimAutoreleasedReturnValue(v13);
    v15 = objc_claimAutoreleasedReturnValue(objc_msgSend(v5, "getService:", v14));
    configurationManager = v6->_configurationManager;
    v6->_configurationManager = (MOConfigurationManager *)v15;

    os_log = _mo_log_facility_get_os_log(&MOLogFacilityEventBundleManager);
    v18 = objc_claimAutoreleasedReturnValue(os_log);
    if (os_log_type_enabled(v18, OS_LOG_TYPE_DEFAULT))
    {
      *(_WORD *)buf = 0;
      _os_log_impl((void *)&_mh_execute_header, v18, OS_LOG_TYPE_DEFAULT, "Constructing trend bundlers", buf, 2u);
    }

    v19 = objc_opt_new(NSMutableArray);
    v20 = objc_opt_new(MOTrendBundler);
    v21 = objc_opt_new(MOTrendBundlerPredicateWorkoutTypePattern);
    v22 = objc_opt_new(MOTrendBundlerAnnotatorRecentEvent);
    -[MOTrendBundler setPredicate:](v20, "setPredicate:", v21);
    -[MOTrendBundler setAnnotator:](v20, "setAnnotator:", v22);
    -[MOTrendBundler setTrendDetectorName:](v20, "setTrendDetectorName:", CFSTR("workoutTypeDurationTrendRoutine"));
    -[NSMutableArray addObject:](v19, "addObject:", v20);
    v23 = objc_opt_new(MOTrendBundler);
    v24 = objc_opt_new(MOTrendBundlerPredicateContactTypeTrend);
    -[MOTrendBundler setPredicate:](v23, "setPredicate:", v24);
    -[MOTrendBundler setAnnotator:](v23, "setAnnotator:", v22);
    v35 = CFSTR("maximumFeatureCountForFrequencyTrend");
    LODWORD(v25) = 8.0;
    -[MOConfigurationManagerBase getFloatSettingForKey:withFallback:](v6->_configurationManager, "getFloatSettingForKey:withFallback:", CFSTR("kMOTrendAnnotationManagerBundlingFilterMaximumFeatureCountForFrequencyTrend"), v25);
    v26 = (void *)objc_claimAutoreleasedReturnValue(+[NSNumber numberWithFloat:](NSNumber, "numberWithFloat:"));
    v36 = v26;
    v27 = (void *)objc_claimAutoreleasedReturnValue(+[NSDictionary dictionaryWithObjects:forKeys:count:](NSDictionary, "dictionaryWithObjects:forKeys:count:", &v36, &v35, 1));
    -[MOTrendBundler configure:](v23, "configure:", v27);

    -[MOTrendBundler setTrendDetectorName:](v23, "setTrendDetectorName:", CFSTR("contactTypeDurationTrend"));
    -[NSMutableArray addObject:](v19, "addObject:", v23);
    objc_storeStrong((id *)&v6->_bundlers, v19);
    v28 = _mo_log_facility_get_os_log(&MOLogFacilityEventBundleManager);
    v29 = objc_claimAutoreleasedReturnValue(v28);
    if (os_log_type_enabled(v29, OS_LOG_TYPE_DEFAULT))
    {
      v30 = -[NSMutableArray count](v19, "count");
      *(_DWORD *)buf = 67109120;
      v34 = v30;
      _os_log_impl((void *)&_mh_execute_header, v29, OS_LOG_TYPE_DEFAULT, "Done constructing trend bundlers [%i constructed]", buf, 8u);
    }

  }
  return v6;
}

- (void)performAnnotationWithEvents:(id)a3 withPatternEvents:(id)a4 handler:(id)a5
{
  id v8;
  id v9;
  void (**v10)(id, NSMutableArray *, _QWORD);
  void *v11;
  unint64_t v12;
  void *v13;
  size_t v14;
  NSObject *v15;
  id v16;
  NSMutableArray *v17;
  id v18;
  id v19;
  id v20;
  uint64_t v21;
  void *v22;
  uint64_t v23;
  __int128 v24;
  __int128 v25;
  __int128 v26;
  __int128 v27;
  _QWORD block[7];
  id v29;
  _BYTE v30[128];

  v8 = a3;
  v9 = a4;
  v10 = (void (**)(id, NSMutableArray *, _QWORD))a5;
  if (-[NSArray count](self->_bundlers, "count"))
  {
    v11 = (void *)objc_claimAutoreleasedReturnValue(+[NSMutableArray arrayWithCapacity:](NSMutableArray, "arrayWithCapacity:", -[NSArray count](self->_bundlers, "count")));
    if (-[NSArray count](self->_bundlers, "count"))
    {
      v12 = 0;
      do
      {
        v13 = (void *)objc_claimAutoreleasedReturnValue(+[NSNull null](NSNull, "null"));
        objc_msgSend(v11, "addObject:", v13);

        ++v12;
      }
      while (v12 < -[NSArray count](self->_bundlers, "count"));
    }
    v14 = -[NSArray count](self->_bundlers, "count");
    v15 = objc_claimAutoreleasedReturnValue(-[MOTrendAnnotationManager queue](self, "queue"));
    block[0] = _NSConcreteStackBlock;
    block[1] = 3221225472;
    block[2] = __82__MOTrendAnnotationManager_performAnnotationWithEvents_withPatternEvents_handler___block_invoke;
    block[3] = &unk_1002AD5E0;
    block[4] = self;
    block[5] = v9;
    block[6] = v8;
    v16 = v11;
    v29 = v16;
    dispatch_apply(v14, v15, block);

    v17 = objc_opt_new(NSMutableArray);
    v24 = 0u;
    v25 = 0u;
    v26 = 0u;
    v27 = 0u;
    v18 = v16;
    v19 = objc_msgSend(v18, "countByEnumeratingWithState:objects:count:", &v24, v30, 16);
    if (v19)
    {
      v20 = v19;
      v21 = *(_QWORD *)v25;
      do
      {
        v22 = 0;
        do
        {
          if (*(_QWORD *)v25 != v21)
            objc_enumerationMutation(v18);
          v23 = *(_QWORD *)(*((_QWORD *)&v24 + 1) + 8 * (_QWORD)v22);
          if (v23 && objc_msgSend(*(id *)(*((_QWORD *)&v24 + 1) + 8 * (_QWORD)v22), "count", (_QWORD)v24))
            -[NSMutableArray addObjectsFromArray:](v17, "addObjectsFromArray:", v23);
          v22 = (char *)v22 + 1;
        }
        while (v20 != v22);
        v20 = objc_msgSend(v18, "countByEnumeratingWithState:objects:count:", &v24, v30, 16);
      }
      while (v20);
    }

    v10[2](v10, v17, 0);
  }

}

void __82__MOTrendAnnotationManager_performAnnotationWithEvents_withPatternEvents_handler___block_invoke(uint64_t a1, uint64_t a2)
{
  void *v4;
  id v5;

  v5 = (id)objc_claimAutoreleasedReturnValue(objc_msgSend(*(id *)(*(_QWORD *)(a1 + 32) + 16), "objectAtIndexedSubscript:", a2));
  v4 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v5, "processPatternEvents:withEvents:", *(_QWORD *)(a1 + 40), *(_QWORD *)(a1 + 48)));
  if (v4)
    objc_msgSend(*(id *)(a1 + 56), "setObject:atIndexedSubscript:", v4, a2);

}

- (OS_dispatch_queue)queue
{
  return self->_queue;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_queue, 0);
  objc_storeStrong((id *)&self->_configurationManager, 0);
  objc_storeStrong((id *)&self->_bundlers, 0);
  objc_storeStrong((id *)&self->_universe, 0);
}

@end
