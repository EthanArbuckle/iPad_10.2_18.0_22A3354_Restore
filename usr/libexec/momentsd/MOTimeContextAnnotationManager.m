@implementation MOTimeContextAnnotationManager

- (MOTimeContextAnnotationManager)initWithUniverse:(id)a3
{
  MOTimeContextAnnotationManager *v3;
  uint64_t v4;
  MOTimeContextAnnotationManager *v5;
  objc_class *v6;
  NSString *v7;
  id v8;
  const char *v9;
  dispatch_queue_attr_t v10;
  NSObject *v11;
  dispatch_queue_t v12;
  OS_dispatch_queue *queue;
  objc_super v15;

  v15.receiver = self;
  v15.super_class = (Class)MOTimeContextAnnotationManager;
  v3 = -[MOAnnotationManager initWithUniverse:](&v15, "initWithUniverse:", a3);
  v5 = v3;
  if (v3)
  {
    v6 = (objc_class *)objc_opt_class(v3, v4);
    v7 = NSStringFromClass(v6);
    v8 = objc_retainAutorelease((id)objc_claimAutoreleasedReturnValue(v7));
    v9 = (const char *)objc_msgSend(v8, "UTF8String");
    v10 = dispatch_queue_attr_make_with_autorelease_frequency(0, DISPATCH_AUTORELEASE_FREQUENCY_WORK_ITEM);
    v11 = objc_claimAutoreleasedReturnValue(v10);
    v12 = dispatch_queue_create(v9, v11);
    queue = v5->_queue;
    v5->_queue = (OS_dispatch_queue *)v12;

  }
  return v5;
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
  _QWORD v15[5];
  id v16;
  id v17;
  id v18;

  v8 = a3;
  v9 = a4;
  v10 = a5;
  v11 = objc_claimAutoreleasedReturnValue(-[MOTimeContextAnnotationManager queue](self, "queue"));
  v15[0] = _NSConcreteStackBlock;
  v15[1] = 3221225472;
  v15[2] = __88__MOTimeContextAnnotationManager_performAnnotationWithEvents_withPatternEvents_handler___block_invoke;
  v15[3] = &unk_1002ADA68;
  v15[4] = self;
  v16 = v8;
  v17 = v9;
  v18 = v10;
  v12 = v10;
  v13 = v9;
  v14 = v8;
  dispatch_async(v11, v15);

}

void __88__MOTimeContextAnnotationManager_performAnnotationWithEvents_withPatternEvents_handler___block_invoke(uint64_t a1)
{
  void *v1;
  uint64_t v2;
  uint64_t v3;
  _QWORD v4[4];
  id v5;

  v1 = *(void **)(a1 + 32);
  v2 = *(_QWORD *)(a1 + 40);
  v4[0] = _NSConcreteStackBlock;
  v4[1] = 3221225472;
  v4[2] = __88__MOTimeContextAnnotationManager_performAnnotationWithEvents_withPatternEvents_handler___block_invoke_2;
  v4[3] = &unk_1002ADFD8;
  v3 = *(_QWORD *)(a1 + 48);
  v5 = *(id *)(a1 + 56);
  objc_msgSend(v1, "_performAnnotationWithEvents:withPatternEvents:handler:", v2, v3, v4);

}

uint64_t __88__MOTimeContextAnnotationManager_performAnnotationWithEvents_withPatternEvents_handler___block_invoke_2(uint64_t a1)
{
  uint64_t result;

  result = *(_QWORD *)(a1 + 32);
  if (result)
    return (*(uint64_t (**)(void))(result + 16))();
  return result;
}

- (void)_performAnnotationWithEvents:(id)a3 withPatternEvents:(id)a4 handler:(id)a5
{
  id v8;
  void (**v9)(id, void *, _QWORD);
  id v10;
  id v11;
  void *v12;
  uint64_t v13;
  void *v14;
  id os_log;
  NSObject *v16;
  uint64_t v17;
  objc_class *v18;
  NSString *v19;
  void *v20;
  id v21;
  void (**v22)(id, void *, _QWORD);
  void *v23;
  void *v24;
  void *v25;
  void *v26;
  void *v27;
  void *v28;
  id v29;
  NSObject *v30;
  uint64_t v31;
  objc_class *v32;
  NSString *v33;
  void *v34;
  id v35;
  id v36;
  void *i;
  void *v38;
  void *v39;
  void *v40;
  id v41;
  NSObject *v42;
  uint64_t v43;
  objc_class *v44;
  NSString *v45;
  void *v46;
  id v47;
  void *v48;
  void *v49;
  id v50;
  void *v51;
  void *v52;
  void *v53;
  id v54;
  NSObject *v55;
  uint64_t v56;
  objc_class *v57;
  NSString *v58;
  void *v59;
  id v60;
  void *v61;
  id v62;
  NSObject *v63;
  uint64_t v64;
  objc_class *v65;
  NSString *v66;
  void *v67;
  void *v68;
  id v69;
  NSObject *v70;
  uint64_t v71;
  objc_class *v72;
  NSString *v73;
  void *v74;
  void *v75;
  void *v76;
  id v77;
  NSObject *v78;
  uint64_t v79;
  objc_class *v80;
  NSString *v81;
  void *v82;
  id v83;
  id v84;
  void *v85;
  void (**v86)(id, void *, _QWORD);
  id v87;
  id obj;
  NSMutableArray *v89;
  uint64_t v90;
  MOTimeContextAnnotationManager *v91;
  void *v92;
  id v93;
  void *v94;
  void *context;
  __int128 v96;
  __int128 v97;
  __int128 v98;
  __int128 v99;
  id v100;
  uint8_t v101[128];
  uint8_t buf[4];
  void *v103;
  __int16 v104;
  id v105;
  __int16 v106;
  id v107;
  __int16 v108;
  void *v109;
  id v110;

  v8 = a4;
  v9 = (void (**)(id, void *, _QWORD))a5;
  v10 = a3;
  v11 = objc_msgSend(objc_alloc((Class)NSSortDescriptor), "initWithKey:ascending:", CFSTR("startDate"), 1);
  v110 = v11;
  v12 = (void *)objc_claimAutoreleasedReturnValue(+[NSArray arrayWithObjects:count:](NSArray, "arrayWithObjects:count:", &v110, 1));
  v13 = objc_claimAutoreleasedReturnValue(objc_msgSend(v10, "sortedArrayUsingDescriptors:", v12));

  v92 = (void *)v13;
  v14 = (void *)objc_claimAutoreleasedReturnValue(-[MOTimeContextAnnotationManager getBaseEvents:](self, "getBaseEvents:", v13));
  os_log = _mo_log_facility_get_os_log(&MOLogFacilityEventBundleManager);
  v16 = objc_claimAutoreleasedReturnValue(os_log);
  v87 = v11;
  v91 = self;
  if (os_log_type_enabled(v16, OS_LOG_TYPE_INFO))
  {
    v18 = (objc_class *)objc_opt_class(self, v17);
    v19 = NSStringFromClass(v18);
    v20 = (void *)objc_claimAutoreleasedReturnValue(v19);
    v21 = objc_msgSend(v14, "count");
    v22 = v9;
    v23 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v14, "firstObject"));
    v24 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v23, "startDate"));
    v25 = v14;
    v26 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v14, "lastObject"));
    v27 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v26, "endDate"));
    *(_DWORD *)buf = 138413058;
    v103 = v20;
    v104 = 2048;
    v105 = v21;
    v106 = 2112;
    v107 = v24;
    v108 = 2112;
    v109 = v27;
    _os_log_impl((void *)&_mh_execute_header, v16, OS_LOG_TYPE_INFO, "TimeContext(%@): Base Events, %lu, startDate, %@, endDate, %@", buf, 0x2Au);

    v14 = v25;
    self = v91;

    v9 = v22;
    v11 = v87;

  }
  if (objc_msgSend(v14, "count"))
  {
    v86 = v9;
    v28 = (void *)objc_claimAutoreleasedReturnValue(-[MOTimeContextAnnotationManager groupBaseEvents:](self, "groupBaseEvents:", v14));
    v29 = _mo_log_facility_get_os_log(&MOLogFacilityEventBundleManager);
    v30 = objc_claimAutoreleasedReturnValue(v29);
    if (os_log_type_enabled(v30, OS_LOG_TYPE_INFO))
    {
      v32 = (objc_class *)objc_opt_class(self, v31);
      v33 = NSStringFromClass(v32);
      v34 = (void *)objc_claimAutoreleasedReturnValue(v33);
      v35 = objc_msgSend(v14, "count");
      v36 = objc_msgSend(v28, "count");
      *(_DWORD *)buf = 138412802;
      v103 = v34;
      v104 = 2048;
      v105 = v35;
      v106 = 2048;
      v107 = v36;
      _os_log_impl((void *)&_mh_execute_header, v30, OS_LOG_TYPE_INFO, "TimeContext(%@): Grouping the base events, events, %lu, groups, %lu", buf, 0x20u);

    }
    v85 = v14;

    v89 = objc_opt_new(NSMutableArray);
    v96 = 0u;
    v97 = 0u;
    v98 = 0u;
    v99 = 0u;
    obj = v28;
    v93 = objc_msgSend(obj, "countByEnumeratingWithState:objects:count:", &v96, v101, 16);
    if (v93)
    {
      v90 = *(_QWORD *)v97;
      do
      {
        for (i = 0; i != v93; i = (char *)i + 1)
        {
          if (*(_QWORD *)v97 != v90)
            objc_enumerationMutation(obj);
          v38 = *(void **)(*((_QWORD *)&v96 + 1) + 8 * (_QWORD)i);
          context = objc_autoreleasePoolPush();
          v100 = v11;
          v39 = (void *)objc_claimAutoreleasedReturnValue(+[NSArray arrayWithObjects:count:](NSArray, "arrayWithObjects:count:", &v100, 1));
          v94 = v38;
          v40 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v38, "sortedArrayUsingDescriptors:", v39));

          v41 = _mo_log_facility_get_os_log(&MOLogFacilityEventBundleManager);
          v42 = objc_claimAutoreleasedReturnValue(v41);
          if (os_log_type_enabled(v42, OS_LOG_TYPE_INFO))
          {
            v44 = (objc_class *)objc_opt_class(self, v43);
            v45 = NSStringFromClass(v44);
            v46 = (void *)objc_claimAutoreleasedReturnValue(v45);
            v47 = objc_msgSend(v40, "count");
            v48 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v40, "firstObject"));
            v49 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v48, "startDate"));
            v50 = v8;
            v51 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v40, "lastObject"));
            v52 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v51, "endDate"));
            *(_DWORD *)buf = 138413058;
            v103 = v46;
            v104 = 2048;
            v105 = v47;
            v106 = 2112;
            v107 = v49;
            v108 = 2112;
            v109 = v52;
            _os_log_impl((void *)&_mh_execute_header, v42, OS_LOG_TYPE_INFO, "TimeContext(%@): Base Events, %lu, first.date, %@, last.date, %@", buf, 0x2Au);

            self = v91;
            v8 = v50;
            v11 = v87;

          }
          v53 = (void *)objc_claimAutoreleasedReturnValue(-[MOTimeContextAnnotationManager getContextEventsForBaseEvents:events:withPatternEvents:](self, "getContextEventsForBaseEvents:events:withPatternEvents:", v40, v92, v8));
          v54 = _mo_log_facility_get_os_log(&MOLogFacilityEventBundleManager);
          v55 = objc_claimAutoreleasedReturnValue(v54);
          if (os_log_type_enabled(v55, OS_LOG_TYPE_INFO))
          {
            v57 = (objc_class *)objc_opt_class(self, v56);
            v58 = NSStringFromClass(v57);
            v59 = (void *)objc_claimAutoreleasedReturnValue(v58);
            v60 = objc_msgSend(v53, "count");
            *(_DWORD *)buf = 138412546;
            v103 = v59;
            v104 = 2048;
            v105 = v60;
            _os_log_impl((void *)&_mh_execute_header, v55, OS_LOG_TYPE_INFO, "TimeContext(%@): Context Events, %lu", buf, 0x16u);

          }
          v61 = (void *)objc_claimAutoreleasedReturnValue(-[MOTimeContextAnnotationManager annotateBaseEvents:contextEvents:](self, "annotateBaseEvents:contextEvents:", v40, v53));
          v62 = _mo_log_facility_get_os_log(&MOLogFacilityEventBundleManager);
          v63 = objc_claimAutoreleasedReturnValue(v62);
          if (os_log_type_enabled(v63, OS_LOG_TYPE_INFO))
          {
            v65 = (objc_class *)objc_opt_class(self, v64);
            v66 = NSStringFromClass(v65);
            v67 = (void *)objc_claimAutoreleasedReturnValue(v66);
            *(_DWORD *)buf = 138412546;
            v103 = v67;
            v104 = 2112;
            v105 = v61;
            _os_log_impl((void *)&_mh_execute_header, v63, OS_LOG_TYPE_INFO, "TimeContext(%@): EventBundle, %@", buf, 0x16u);

          }
          v68 = (void *)objc_claimAutoreleasedReturnValue(-[MOTimeContextAnnotationManager buildPromptDescriptionForEventBundle:](self, "buildPromptDescriptionForEventBundle:", v61));
          objc_msgSend(v61, "setPromptLanguage:", v68);

          v69 = _mo_log_facility_get_os_log(&MOLogFacilityEventBundleManager);
          v70 = objc_claimAutoreleasedReturnValue(v69);
          if (os_log_type_enabled(v70, OS_LOG_TYPE_INFO))
          {
            v72 = (objc_class *)objc_opt_class(self, v71);
            v73 = NSStringFromClass(v72);
            v74 = (void *)objc_claimAutoreleasedReturnValue(v73);
            v75 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v61, "promptLanguage"));
            v76 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v75, "mask"));
            *(_DWORD *)buf = 138412546;
            v103 = v74;
            v104 = 2112;
            v105 = v76;
            _os_log_impl((void *)&_mh_execute_header, v70, OS_LOG_TYPE_INFO, "TimeContext(%@): Prompt Lang., %@", buf, 0x16u);

            self = v91;
          }

          -[MOTimeContextAnnotationManager addTimeOverlapsScoreForEventBundle:baseEvents:contextEvents:](self, "addTimeOverlapsScoreForEventBundle:baseEvents:contextEvents:", v61, v94, v53);
          -[MOTimeContextAnnotationManager addSocialContextForEventBundle:sortedBaseEvents:contextEvents:](self, "addSocialContextForEventBundle:sortedBaseEvents:contextEvents:", v61, v40, v53);
          -[MOTimeContextAnnotationManager addPeopleDensityContextForEventBundle:sortedBaseEvents:contextEvents:](self, "addPeopleDensityContextForEventBundle:sortedBaseEvents:contextEvents:", v61, v40, v53);
          if (v61)
            -[NSMutableArray addObject:](v89, "addObject:", v61);

          objc_autoreleasePoolPop(context);
        }
        v93 = objc_msgSend(obj, "countByEnumeratingWithState:objects:count:", &v96, v101, 16);
      }
      while (v93);
    }

    v77 = _mo_log_facility_get_os_log(&MOLogFacilityEventBundleManager);
    v78 = objc_claimAutoreleasedReturnValue(v77);
    if (os_log_type_enabled(v78, OS_LOG_TYPE_INFO))
    {
      v80 = (objc_class *)objc_opt_class(self, v79);
      v81 = NSStringFromClass(v80);
      v82 = (void *)objc_claimAutoreleasedReturnValue(v81);
      v83 = -[NSMutableArray count](v89, "count");
      *(_DWORD *)buf = 138412546;
      v103 = v82;
      v104 = 2048;
      v105 = v83;
      _os_log_impl((void *)&_mh_execute_header, v78, OS_LOG_TYPE_INFO, "TimeContext(%@): Event Bundles, %lu", buf, 0x16u);

    }
    v84 = -[NSMutableArray copy](v89, "copy");
    v9 = v86;
    v86[2](v86, v84, 0);

    v14 = v85;
  }
  else
  {
    v9[2](v9, &__NSArray0__struct, 0);
  }

}

- (id)groupBaseEvents:(id)a3
{
  id v4;
  NSMutableArray *v5;
  id v6;
  id v7;
  id v8;
  uint64_t v9;
  void *v10;
  void *v11;
  id v12;
  id os_log;
  uint64_t v14;
  objc_class *v15;
  NSString *v16;
  void *v17;
  __int128 v19;
  __int128 v20;
  __int128 v21;
  __int128 v22;
  uint64_t v23;
  uint8_t v24[128];
  uint8_t buf[4];
  void *v26;
  __int16 v27;
  id v28;

  v4 = a3;
  if (objc_msgSend(v4, "count"))
  {
    v5 = objc_opt_new(NSMutableArray);
    v19 = 0u;
    v20 = 0u;
    v21 = 0u;
    v22 = 0u;
    v6 = v4;
    v7 = objc_msgSend(v6, "countByEnumeratingWithState:objects:count:", &v19, v24, 16);
    if (v7)
    {
      v8 = v7;
      v9 = *(_QWORD *)v20;
      do
      {
        v10 = 0;
        do
        {
          if (*(_QWORD *)v20 != v9)
            objc_enumerationMutation(v6);
          v23 = *(_QWORD *)(*((_QWORD *)&v19 + 1) + 8 * (_QWORD)v10);
          v11 = (void *)objc_claimAutoreleasedReturnValue(+[NSArray arrayWithObjects:count:](NSArray, "arrayWithObjects:count:", &v23, 1, (_QWORD)v19));
          -[NSMutableArray addObject:](v5, "addObject:", v11);

          v10 = (char *)v10 + 1;
        }
        while (v8 != v10);
        v8 = objc_msgSend(v6, "countByEnumeratingWithState:objects:count:", &v19, v24, 16);
      }
      while (v8);
    }

    v12 = -[NSMutableArray copy](v5, "copy");
  }
  else
  {
    os_log = _mo_log_facility_get_os_log(&MOLogFacilityEventBundleManager);
    v5 = (NSMutableArray *)objc_claimAutoreleasedReturnValue(os_log);
    if (os_log_type_enabled(&v5->super.super, OS_LOG_TYPE_INFO))
    {
      v15 = (objc_class *)objc_opt_class(self, v14);
      v16 = NSStringFromClass(v15);
      v17 = (void *)objc_claimAutoreleasedReturnValue(v16);
      *(_DWORD *)buf = 138412546;
      v26 = v17;
      v27 = 2048;
      v28 = objc_msgSend(v4, "count");
      _os_log_impl((void *)&_mh_execute_header, &v5->super.super, OS_LOG_TYPE_INFO, "TimeContext(%@): No grouping is applied, %lu", buf, 0x16u);

    }
    v12 = &__NSArray0__struct;
  }

  return v12;
}

- (id)getBaseEvents:(id)a3
{
  id os_log;
  NSObject *v6;
  void *v7;

  os_log = _mo_log_facility_get_os_log(&MOLogFacilityGeneral);
  v6 = objc_claimAutoreleasedReturnValue(os_log);
  if (os_log_type_enabled(v6, OS_LOG_TYPE_ERROR))
    -[MOTimeContextAnnotationManager getBaseEvents:].cold.1();

  v7 = (void *)objc_claimAutoreleasedReturnValue(+[NSAssertionHandler currentHandler](NSAssertionHandler, "currentHandler"));
  objc_msgSend(v7, "handleFailureInMethod:object:file:lineNumber:description:", a2, self, CFSTR("MOTimeContextAnnotationManager.m"), 124, CFSTR("Use the derived class (in %s:%d)"), "-[MOTimeContextAnnotationManager getBaseEvents:]", 124);

  return 0;
}

- (id)getContextEventsForBaseEvents:(id)a3 events:(id)a4 withPatternEvents:(id)a5
{
  id os_log;
  NSObject *v8;
  void *v9;

  os_log = _mo_log_facility_get_os_log(&MOLogFacilityGeneral);
  v8 = objc_claimAutoreleasedReturnValue(os_log);
  if (os_log_type_enabled(v8, OS_LOG_TYPE_ERROR))
    -[MOTimeContextAnnotationManager getContextEventsForBaseEvents:events:withPatternEvents:].cold.1();

  v9 = (void *)objc_claimAutoreleasedReturnValue(+[NSAssertionHandler currentHandler](NSAssertionHandler, "currentHandler"));
  objc_msgSend(v9, "handleFailureInMethod:object:file:lineNumber:description:", a2, self, CFSTR("MOTimeContextAnnotationManager.m"), 130, CFSTR("Use the derived class (in %s:%d)"), "-[MOTimeContextAnnotationManager getContextEventsForBaseEvents:events:withPatternEvents:]", 130);

  return 0;
}

- (id)annotateBaseEvents:(id)a3 contextEvents:(id)a4
{
  id os_log;
  NSObject *v7;
  void *v8;

  os_log = _mo_log_facility_get_os_log(&MOLogFacilityGeneral);
  v7 = objc_claimAutoreleasedReturnValue(os_log);
  if (os_log_type_enabled(v7, OS_LOG_TYPE_ERROR))
    -[MOTimeContextAnnotationManager annotateBaseEvents:contextEvents:].cold.1();

  v8 = (void *)objc_claimAutoreleasedReturnValue(+[NSAssertionHandler currentHandler](NSAssertionHandler, "currentHandler"));
  objc_msgSend(v8, "handleFailureInMethod:object:file:lineNumber:description:", a2, self, CFSTR("MOTimeContextAnnotationManager.m"), 136, CFSTR("Use the derived class (in %s:%d)"), "-[MOTimeContextAnnotationManager annotateBaseEvents:contextEvents:]", 136);

  return 0;
}

- (id)buildPromptDescriptionForEventBundle:(id)a3
{
  id os_log;
  NSObject *v6;
  void *v7;

  os_log = _mo_log_facility_get_os_log(&MOLogFacilityGeneral);
  v6 = objc_claimAutoreleasedReturnValue(os_log);
  if (os_log_type_enabled(v6, OS_LOG_TYPE_ERROR))
    -[MOTimeContextAnnotationManager buildPromptDescriptionForEventBundle:].cold.1();

  v7 = (void *)objc_claimAutoreleasedReturnValue(+[NSAssertionHandler currentHandler](NSAssertionHandler, "currentHandler"));
  objc_msgSend(v7, "handleFailureInMethod:object:file:lineNumber:description:", a2, self, CFSTR("MOTimeContextAnnotationManager.m"), 142, CFSTR("Use the derived class (in %s:%d)"), "-[MOTimeContextAnnotationManager buildPromptDescriptionForEventBundle:]", 142);

  return 0;
}

- (void)addTimeOverlapsScoreForEventBundle:(id)a3 baseEvents:(id)a4 contextEvents:(id)a5
{
  id v8;
  double v9;
  double v10;
  id os_log;
  NSObject *v12;
  uint64_t v13;
  objc_class *v14;
  NSString *v15;
  void *v16;
  void *v17;
  int v18;
  void *v19;
  __int16 v20;
  double v21;
  __int16 v22;
  id v23;

  v8 = a3;
  -[MOTimeContextAnnotationManager overlapsIndexOfBaseEvents:contextEvents:](self, "overlapsIndexOfBaseEvents:contextEvents:", a4, a5);
  v10 = v9;
  os_log = _mo_log_facility_get_os_log(&MOLogFacilityEventBundleManager);
  v12 = objc_claimAutoreleasedReturnValue(os_log);
  if (os_log_type_enabled(v12, OS_LOG_TYPE_INFO))
  {
    v14 = (objc_class *)objc_opt_class(self, v13);
    v15 = NSStringFromClass(v14);
    v16 = (void *)objc_claimAutoreleasedReturnValue(v15);
    v18 = 138412802;
    v19 = v16;
    v20 = 2048;
    v21 = v10;
    v22 = 2112;
    v23 = v8;
    _os_log_impl((void *)&_mh_execute_header, v12, OS_LOG_TYPE_INFO, "TimeContext(%@): overlaps score, %f, bundle, %@", (uint8_t *)&v18, 0x20u);

  }
  v17 = (void *)objc_claimAutoreleasedReturnValue(+[NSNumber numberWithDouble:](NSNumber, "numberWithDouble:", v10));
  objc_msgSend(v8, "addMetaDataForRankForKey:value:", CFSTR("TimeCorrelationScore"), v17);

}

- (double)overlapsIndexOfBaseEvents:(id)a3 contextEvents:(id)a4
{
  id v6;
  id v7;
  id v8;
  void *v9;
  void *v10;
  void *v11;
  void *v12;
  id v13;
  void *v14;
  void *v15;
  uint64_t v16;
  void *v17;
  void *v18;
  void *v19;
  uint64_t v20;
  void *v21;
  double v22;
  double v23;
  void *v24;
  void *v25;
  double v26;
  void *v27;
  void *v28;
  unsigned int v29;
  uint64_t v30;
  void *v31;
  uint64_t v32;
  double v33;
  id v34;
  id v35;
  id v36;
  uint64_t v37;
  void *v38;
  double v39;
  id os_log;
  NSObject *v41;
  uint64_t v42;
  objc_class *v44;
  NSString *v45;
  void *v46;
  void *v47;
  id v48;
  id v49;
  id v50;
  id v51;
  void *v52;
  MOTimeContextAnnotationManager *v53;
  void *v54;
  void *v55;
  void *v56;
  void *v57;
  void *v58;
  void *v59;
  void *v60;
  __int128 v61;
  __int128 v62;
  __int128 v63;
  __int128 v64;
  uint8_t buf[4];
  void *v66;
  __int16 v67;
  id v68;
  __int16 v69;
  void *v70;
  __int16 v71;
  void *v72;
  __int16 v73;
  id v74;
  __int16 v75;
  id v76;
  __int16 v77;
  id v78;
  __int16 v79;
  double v80;
  __int16 v81;
  double v82;
  __int16 v83;
  double v84;
  _BYTE v85[128];

  v6 = a3;
  v7 = a4;
  if (objc_msgSend(v6, "count"))
  {
    if (objc_msgSend(v7, "count"))
    {
      v8 = objc_alloc((Class)NSDateInterval);
      v9 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v6, "firstObject"));
      v10 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v9, "startDate"));
      v11 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v6, "lastObject"));
      v12 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v11, "endDate"));
      v13 = objc_msgSend(v8, "initWithStartDate:endDate:", v10, v12);

      v14 = (void *)objc_claimAutoreleasedReturnValue(-[MOTimeContextAnnotationManager timespanFromEvents:boundaryInterval:](self, "timespanFromEvents:boundaryInterval:", v6, 0));
      v58 = v13;
      v15 = (void *)objc_claimAutoreleasedReturnValue(-[MOTimeContextAnnotationManager timespanFromEvents:boundaryInterval:](self, "timespanFromEvents:boundaryInterval:", v7, v13));
      v16 = objc_claimAutoreleasedReturnValue(objc_msgSend(v6, "arrayByAddingObjectsFromArray:", v7));
      v53 = self;
      v55 = (void *)objc_claimAutoreleasedReturnValue(-[MOTimeContextAnnotationManager timespanFromEvents:boundaryInterval:](self, "timespanFromEvents:boundaryInterval:", v16, 0));
      v60 = v14;
      v17 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v14, "objectEnumerator"));
      v59 = v15;
      v18 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v15, "objectEnumerator"));
      v19 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v17, "nextObject"));
      v20 = objc_claimAutoreleasedReturnValue(objc_msgSend(v18, "nextObject"));
      v21 = (void *)v20;
      v22 = 0.0;
      v57 = (void *)v16;
      if (v19 && v20)
      {
        v23 = 0.0;
        do
        {
          v24 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v19, "intersectionWithDateInterval:", v21));
          v25 = v24;
          if (v24)
          {
            objc_msgSend(v24, "duration");
            v23 = v23 + v26;
          }
          v27 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v19, "endDate"));
          v28 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v21, "endDate"));
          v29 = objc_msgSend(v27, "isBeforeDate:", v28);

          if (v29)
          {
            v30 = objc_claimAutoreleasedReturnValue(objc_msgSend(v17, "nextObject"));
            v31 = v19;
            v19 = (void *)v30;
          }
          else
          {
            v32 = objc_claimAutoreleasedReturnValue(objc_msgSend(v18, "nextObject"));
            v31 = v21;
            v21 = (void *)v32;
          }

        }
        while (v19 && v21);
      }
      else
      {
        v23 = 0.0;
      }
      v63 = 0u;
      v64 = 0u;
      v61 = 0u;
      v62 = 0u;
      v34 = v55;
      v35 = objc_msgSend(v34, "countByEnumeratingWithState:objects:count:", &v61, v85, 16);
      if (v35)
      {
        v36 = v35;
        v37 = *(_QWORD *)v62;
        v22 = 0.0;
        do
        {
          v38 = 0;
          do
          {
            if (*(_QWORD *)v62 != v37)
              objc_enumerationMutation(v34);
            objc_msgSend(*(id *)(*((_QWORD *)&v61 + 1) + 8 * (_QWORD)v38), "duration");
            v22 = v22 + v39;
            v38 = (char *)v38 + 1;
          }
          while (v36 != v38);
          v36 = objc_msgSend(v34, "countByEnumeratingWithState:objects:count:", &v61, v85, 16);
        }
        while (v36);
      }

      if (v22 <= 0.0)
        v33 = 0.0;
      else
        v33 = v23 / v22;
      os_log = _mo_log_facility_get_os_log(&MOLogFacilityEventBundleManager);
      v41 = objc_claimAutoreleasedReturnValue(os_log);
      if (os_log_type_enabled(v41, OS_LOG_TYPE_DEBUG))
      {
        v44 = (objc_class *)objc_opt_class(v53, v42);
        v45 = NSStringFromClass(v44);
        v56 = (void *)objc_claimAutoreleasedReturnValue(v45);
        v51 = objc_msgSend(v6, "count");
        v54 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v6, "firstObject"));
        v46 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v54, "startDate"));
        v52 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v6, "lastObject"));
        v47 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v52, "endDate"));
        v50 = objc_msgSend(v7, "count");
        v49 = objc_msgSend(v60, "count");
        v48 = objc_msgSend(v59, "count");
        *(_DWORD *)buf = 138414594;
        v66 = v56;
        v67 = 2048;
        v68 = v51;
        v69 = 2112;
        v70 = v46;
        v71 = 2112;
        v72 = v47;
        v73 = 2048;
        v74 = v50;
        v75 = 2048;
        v76 = v49;
        v77 = 2048;
        v78 = v48;
        v79 = 2048;
        v80 = v23;
        v81 = 2048;
        v82 = v22;
        v83 = 2048;
        v84 = v33;
        _os_log_debug_impl((void *)&_mh_execute_header, v41, OS_LOG_TYPE_DEBUG, "TimeContext(%@): base events, %lu, startDate, %@, endDate, %@, context events, %lu, base events intervals, %lu, context events intervals, %lu, intersection, %f, total duration, %f, overlaps score, %f", buf, 0x66u);

      }
    }
    else
    {
      v33 = 1.0;
    }
  }
  else
  {
    v33 = -1.0;
  }

  return v33;
}

- (id)timespanFromEvents:(id)a3 boundaryInterval:(id)a4
{
  id v6;
  id v7;
  void *v8;
  void *v9;
  void *v10;
  void *v11;
  void *v12;
  void *v13;
  void *v14;
  void *v15;
  id v16;
  id v17;
  id v18;
  uint64_t v19;
  void *i;
  void *v21;
  void *v22;
  unsigned int v23;
  id v24;
  uint64_t v25;
  void *v26;
  unsigned int v27;
  uint64_t v28;
  void *v29;
  uint64_t v30;
  id v31;
  id v32;
  void *v34;
  void *v35;
  id v36;
  id v37;
  NSMutableArray *v38;
  __int128 v39;
  __int128 v40;
  __int128 v41;
  __int128 v42;
  _BYTE v43[128];
  void *v44;

  v6 = a3;
  v7 = a4;
  if (v6 && objc_msgSend(v6, "count"))
  {
    v36 = v7;
    v37 = v6;
    v8 = (void *)objc_claimAutoreleasedReturnValue(-[MOTimeContextAnnotationManager intervalsFromEvents:boundaryInterval:](self, "intervalsFromEvents:boundaryInterval:", v6, v7));
    v34 = (void *)objc_claimAutoreleasedReturnValue(+[NSSortDescriptor sortDescriptorWithKey:ascending:](NSSortDescriptor, "sortDescriptorWithKey:ascending:", CFSTR("startDate"), 1));
    v44 = v34;
    v9 = (void *)objc_claimAutoreleasedReturnValue(+[NSArray arrayWithObjects:count:](NSArray, "arrayWithObjects:count:", &v44, 1));
    v35 = v8;
    v10 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v8, "sortedArrayUsingDescriptors:", v9));

    v38 = objc_opt_new(NSMutableArray);
    v11 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v10, "firstObject"));
    v12 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v11, "startDate"));

    v13 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v10, "firstObject"));
    v14 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v13, "endDate"));

    v15 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v12, "dateByAddingTimeInterval:", 300.0));
    v39 = 0u;
    v40 = 0u;
    v41 = 0u;
    v42 = 0u;
    v16 = v10;
    v17 = objc_msgSend(v16, "countByEnumeratingWithState:objects:count:", &v39, v43, 16);
    if (v17)
    {
      v18 = v17;
      v19 = *(_QWORD *)v40;
      do
      {
        for (i = 0; i != v18; i = (char *)i + 1)
        {
          if (*(_QWORD *)v40 != v19)
            objc_enumerationMutation(v16);
          v21 = *(void **)(*((_QWORD *)&v39 + 1) + 8 * (_QWORD)i);
          v22 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v21, "startDate"));
          v23 = objc_msgSend(v22, "isAfterDate:", v15);

          if (v23)
          {
            if (objc_msgSend(v12, "isBeforeDate:", v14))
            {
              v24 = objc_msgSend(objc_alloc((Class)NSDateInterval), "initWithStartDate:endDate:", v12, v14);
              -[NSMutableArray addObject:](v38, "addObject:", v24);

            }
            v25 = objc_claimAutoreleasedReturnValue(objc_msgSend(v21, "startDate"));

            v12 = (void *)v25;
          }
          else
          {
            v26 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v21, "endDate"));
            v27 = objc_msgSend(v26, "isAfterDate:", v15);

            if (!v27)
              continue;
          }
          v28 = objc_claimAutoreleasedReturnValue(objc_msgSend(v21, "endDate"));

          v29 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v21, "endDate"));
          v30 = objc_claimAutoreleasedReturnValue(objc_msgSend(v29, "dateByAddingTimeInterval:", 300.0));

          v14 = (void *)v28;
          v15 = (void *)v30;
        }
        v18 = objc_msgSend(v16, "countByEnumeratingWithState:objects:count:", &v39, v43, 16);
      }
      while (v18);
    }

    if (v12 && v14 && objc_msgSend(v12, "isBeforeDate:", v14))
    {
      v31 = objc_msgSend(objc_alloc((Class)NSDateInterval), "initWithStartDate:endDate:", v12, v14);
      -[NSMutableArray addObject:](v38, "addObject:", v31);

    }
    v32 = -[NSMutableArray copy](v38, "copy");

    v7 = v36;
    v6 = v37;
  }
  else
  {
    v32 = &__NSArray0__struct;
  }

  return v32;
}

- (id)intervalsFromEvents:(id)a3 boundaryInterval:(id)a4
{
  id v7;
  id v8;
  id v9;
  id v10;
  uint64_t v11;
  uint64_t v12;
  void *v13;
  void *v14;
  id os_log;
  NSObject *v16;
  void *v17;
  void *v18;
  id v19;
  NSObject *v20;
  void *v21;
  uint64_t v22;
  void *v23;
  void *v24;
  NSObject *v25;
  id v26;
  id v27;
  uint64_t v28;
  void *i;
  void *v30;
  void *v31;
  id v32;
  NSObject *v33;
  void *v34;
  void *v35;
  id v36;
  NSObject *v37;
  void *v38;
  uint64_t v39;
  void *v40;
  void *v41;
  id v42;
  void *v43;
  void *v44;
  id v45;
  void *v46;
  void *v47;
  unsigned int v48;
  id v49;
  void *v50;
  void *v51;
  id v52;
  NSString *v53;
  void *v54;
  id v55;
  uint64_t v57;
  id v58;
  id v59;
  uint64_t v60;
  NSMutableArray *v61;
  id v62;
  __int128 v63;
  __int128 v64;
  __int128 v65;
  __int128 v66;
  __int128 v67;
  __int128 v68;
  __int128 v69;
  __int128 v70;
  uint8_t v71[128];
  uint8_t buf[4];
  void *v73;
  __int16 v74;
  const char *v75;
  __int16 v76;
  int v77;
  _BYTE v78[128];

  v7 = a3;
  v62 = a4;
  v61 = objc_opt_new(NSMutableArray);
  v67 = 0u;
  v68 = 0u;
  v69 = 0u;
  v70 = 0u;
  v8 = v7;
  v9 = objc_msgSend(v8, "countByEnumeratingWithState:objects:count:", &v67, v78, 16);
  if (v9)
  {
    v10 = v9;
    v11 = *(_QWORD *)v68;
    v57 = *(_QWORD *)v68;
    v58 = v8;
    do
    {
      v12 = 0;
      v59 = v10;
      do
      {
        if (*(_QWORD *)v68 != v11)
          objc_enumerationMutation(v8);
        v60 = v12;
        v13 = *(void **)(*((_QWORD *)&v67 + 1) + 8 * v12);
        v14 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v13, "startDate"));

        if (!v14)
        {
          os_log = _mo_log_facility_get_os_log(&MOLogFacilityGeneral);
          v16 = objc_claimAutoreleasedReturnValue(os_log);
          if (os_log_type_enabled(v16, OS_LOG_TYPE_ERROR))
          {
            *(_DWORD *)buf = 138412802;
            v73 = v13;
            v74 = 2080;
            v75 = "-[MOTimeContextAnnotationManager intervalsFromEvents:boundaryInterval:]";
            v76 = 1024;
            v77 = 245;
            _os_log_error_impl((void *)&_mh_execute_header, v16, OS_LOG_TYPE_ERROR, "Event.startDate is nil, event, %@ (in %s:%d)", buf, 0x1Cu);
          }

          v17 = (void *)objc_claimAutoreleasedReturnValue(+[NSAssertionHandler currentHandler](NSAssertionHandler, "currentHandler"));
          objc_msgSend(v17, "handleFailureInMethod:object:file:lineNumber:description:", a2, self, CFSTR("MOTimeContextAnnotationManager.m"), 245, CFSTR("Event.startDate is nil, event, %@ (in %s:%d)"), v13, "-[MOTimeContextAnnotationManager intervalsFromEvents:boundaryInterval:]", 245);

        }
        v18 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v13, "endDate"));

        if (!v18)
        {
          v19 = _mo_log_facility_get_os_log(&MOLogFacilityGeneral);
          v20 = objc_claimAutoreleasedReturnValue(v19);
          if (os_log_type_enabled(v20, OS_LOG_TYPE_ERROR))
          {
            *(_DWORD *)buf = 138412802;
            v73 = v13;
            v74 = 2080;
            v75 = "-[MOTimeContextAnnotationManager intervalsFromEvents:boundaryInterval:]";
            v76 = 1024;
            v77 = 246;
            _os_log_error_impl((void *)&_mh_execute_header, v20, OS_LOG_TYPE_ERROR, "Event.endDate is nil, event, %@ (in %s:%d)", buf, 0x1Cu);
          }

          v21 = (void *)objc_claimAutoreleasedReturnValue(+[NSAssertionHandler currentHandler](NSAssertionHandler, "currentHandler"));
          objc_msgSend(v21, "handleFailureInMethod:object:file:lineNumber:description:", a2, self, CFSTR("MOTimeContextAnnotationManager.m"), 246, CFSTR("Event.endDate is nil, event, %@ (in %s:%d)"), v13, "-[MOTimeContextAnnotationManager intervalsFromEvents:boundaryInterval:]", 246);

        }
        v22 = objc_claimAutoreleasedReturnValue(objc_msgSend(v13, "startDate"));
        if (v22)
        {
          v23 = (void *)v22;
          v24 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v13, "endDate"));

          if (v24)
          {
            if (objc_msgSend(v13, "category") == (id)6)
            {
              v65 = 0u;
              v66 = 0u;
              v63 = 0u;
              v64 = 0u;
              v25 = objc_claimAutoreleasedReturnValue(objc_msgSend(v13, "mediaPlaySessions"));
              v26 = -[NSObject countByEnumeratingWithState:objects:count:](v25, "countByEnumeratingWithState:objects:count:", &v63, v71, 16);
              if (v26)
              {
                v27 = v26;
                v28 = *(_QWORD *)v64;
                do
                {
                  for (i = 0; i != v27; i = (char *)i + 1)
                  {
                    if (*(_QWORD *)v64 != v28)
                      objc_enumerationMutation(v25);
                    v30 = *(void **)(*((_QWORD *)&v63 + 1) + 8 * (_QWORD)i);
                    v31 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v30, "startDate"));

                    if (!v31)
                    {
                      v32 = _mo_log_facility_get_os_log(&MOLogFacilityGeneral);
                      v33 = objc_claimAutoreleasedReturnValue(v32);
                      if (os_log_type_enabled(v33, OS_LOG_TYPE_ERROR))
                      {
                        *(_DWORD *)buf = 138412802;
                        v73 = v30;
                        v74 = 2080;
                        v75 = "-[MOTimeContextAnnotationManager intervalsFromEvents:boundaryInterval:]";
                        v76 = 1024;
                        v77 = 252;
                        _os_log_error_impl((void *)&_mh_execute_header, v33, OS_LOG_TYPE_ERROR, "mediaPlaySession.startDate is nil, mediaPlaySession, %@ (in %s:%d)", buf, 0x1Cu);
                      }

                      v34 = (void *)objc_claimAutoreleasedReturnValue(+[NSAssertionHandler currentHandler](NSAssertionHandler, "currentHandler"));
                      objc_msgSend(v34, "handleFailureInMethod:object:file:lineNumber:description:", a2, self, CFSTR("MOTimeContextAnnotationManager.m"), 252, CFSTR("mediaPlaySession.startDate is nil, mediaPlaySession, %@ (in %s:%d)"), v30, "-[MOTimeContextAnnotationManager intervalsFromEvents:boundaryInterval:]", 252);

                    }
                    v35 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v30, "endDate"));

                    if (!v35)
                    {
                      v36 = _mo_log_facility_get_os_log(&MOLogFacilityGeneral);
                      v37 = objc_claimAutoreleasedReturnValue(v36);
                      if (os_log_type_enabled(v37, OS_LOG_TYPE_ERROR))
                      {
                        *(_DWORD *)buf = 138412802;
                        v73 = v30;
                        v74 = 2080;
                        v75 = "-[MOTimeContextAnnotationManager intervalsFromEvents:boundaryInterval:]";
                        v76 = 1024;
                        v77 = 253;
                        _os_log_error_impl((void *)&_mh_execute_header, v37, OS_LOG_TYPE_ERROR, "mediaPlaySession.endDate is nil, mediaPlaySession, %@ (in %s:%d)", buf, 0x1Cu);
                      }

                      v38 = (void *)objc_claimAutoreleasedReturnValue(+[NSAssertionHandler currentHandler](NSAssertionHandler, "currentHandler"));
                      objc_msgSend(v38, "handleFailureInMethod:object:file:lineNumber:description:", a2, self, CFSTR("MOTimeContextAnnotationManager.m"), 253, CFSTR("mediaPlaySession.endDate is nil, mediaPlaySession, %@ (in %s:%d)"), v30, "-[MOTimeContextAnnotationManager intervalsFromEvents:boundaryInterval:]", 253);

                    }
                    v39 = objc_claimAutoreleasedReturnValue(objc_msgSend(v30, "startDate"));
                    if (v39)
                    {
                      v40 = (void *)v39;
                      v41 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v30, "endDate"));

                      if (v41)
                      {
                        v42 = objc_alloc((Class)NSDateInterval);
                        v43 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v30, "startDate"));
                        v44 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v30, "endDate"));
                        v45 = objc_msgSend(v42, "initWithStartDate:endDate:", v43, v44);

                        if (!v62 || objc_msgSend(v62, "intersectsDateInterval:", v45))
                          -[NSMutableArray addObject:](v61, "addObject:", v45);

                      }
                    }
                  }
                  v27 = -[NSObject countByEnumeratingWithState:objects:count:](v25, "countByEnumeratingWithState:objects:count:", &v63, v71, 16);
                }
                while (v27);
                v8 = v58;
                v10 = v59;
                v11 = v57;
              }
            }
            else
            {
              v46 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v13, "startDate"));
              v47 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v13, "endDate"));
              v48 = objc_msgSend(v46, "isBeforeDate:", v47);

              if (v48)
              {
                v49 = objc_alloc((Class)NSDateInterval);
                v50 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v13, "startDate"));
                v51 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v13, "endDate"));
                v25 = objc_msgSend(v49, "initWithStartDate:endDate:", v50, v51);

                -[NSMutableArray addObject:](v61, "addObject:", v25);
              }
              else
              {
                v52 = _mo_log_facility_get_os_log(&MOLogFacilityEventBundleManager);
                v25 = objc_claimAutoreleasedReturnValue(v52);
                if (os_log_type_enabled(v25, OS_LOG_TYPE_ERROR))
                {
                  v53 = NSStringFromSelector(a2);
                  v54 = (void *)objc_claimAutoreleasedReturnValue(v53);
                  *(_DWORD *)buf = 138412546;
                  v73 = v54;
                  v74 = 2112;
                  v75 = (const char *)v13;
                  _os_log_error_impl((void *)&_mh_execute_header, v25, OS_LOG_TYPE_ERROR, "%@, discard event with wrong start/end date, event, %@ ", buf, 0x16u);

                }
              }
            }

          }
        }
        v12 = v60 + 1;
      }
      while ((id)(v60 + 1) != v10);
      v10 = objc_msgSend(v8, "countByEnumeratingWithState:objects:count:", &v67, v78, 16);
    }
    while (v10);
  }

  v55 = -[NSMutableArray copy](v61, "copy");
  return v55;
}

- (void)addSocialContextForEventBundle:(id)a3 sortedBaseEvents:(id)a4 contextEvents:(id)a5
{
  id v7;
  id v8;
  void *v9;
  void *v10;
  void *v11;
  void *v12;
  id os_log;
  NSObject *v14;
  uint64_t v15;
  objc_class *v16;
  NSString *v17;
  void *v18;
  id v19;
  id v20;
  id v21;
  unint64_t v22;
  uint64_t v23;
  double v24;
  double v25;
  void *v26;
  void *v27;
  void *v28;
  id v29;
  id v30;
  void *v31;
  id v32;
  void *v33;
  double v34;
  double v35;
  id v36;
  NSObject *v37;
  uint64_t v38;
  objc_class *v39;
  NSString *v40;
  void *v41;
  void *v42;
  void *v43;
  void *v44;
  void *v45;
  void *v46;
  void *v47;
  void *v48;
  unsigned int v49;
  double v50;
  id v51;
  NSObject *v52;
  uint64_t v53;
  objc_class *v54;
  NSString *v55;
  void *v56;
  void *v57;
  void *v58;
  void *v59;
  void *v60;
  id v61;
  uint64_t v62;
  id v63;
  void *v64;
  unint64_t v66;
  id v67;
  void *v68;
  __int128 v69;
  __int128 v70;
  __int128 v71;
  __int128 v72;
  uint8_t buf[4];
  void *v74;
  __int16 v75;
  double v76;
  __int16 v77;
  double v78;
  __int16 v79;
  unint64_t v80;
  __int16 v81;
  void *v82;
  __int16 v83;
  void *v84;
  __int16 v85;
  void *v86;
  __int16 v87;
  double v88;
  _BYTE v89[128];

  v61 = a3;
  v7 = a4;
  v8 = a5;
  v9 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v7, "firstObject"));
  v10 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v9, "startDate"));

  v60 = v7;
  v11 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v7, "lastObject"));
  v12 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v11, "endDate"));

  os_log = _mo_log_facility_get_os_log(&MOLogFacilityEventBundleManager);
  v14 = objc_claimAutoreleasedReturnValue(os_log);
  if (os_log_type_enabled(v14, OS_LOG_TYPE_INFO))
  {
    v16 = (objc_class *)objc_opt_class(self, v15);
    v17 = NSStringFromClass(v16);
    v18 = (void *)objc_claimAutoreleasedReturnValue(v17);
    *(_DWORD *)buf = 138412802;
    v74 = v18;
    v75 = 2112;
    v76 = *(double *)&v10;
    v77 = 2112;
    v78 = *(double *)&v12;
    _os_log_impl((void *)&_mh_execute_header, v14, OS_LOG_TYPE_INFO, "TimeContext(%@): bundle startDate, %@, endDate, %@", buf, 0x20u);

  }
  v71 = 0u;
  v72 = 0u;
  v69 = 0u;
  v70 = 0u;
  v19 = v8;
  v20 = objc_msgSend(v19, "countByEnumeratingWithState:objects:count:", &v69, v89, 16);
  if (v20)
  {
    v21 = v20;
    v22 = 0;
    v23 = *(_QWORD *)v70;
    v24 = 0.0;
    v25 = 0.0;
    v63 = v19;
    v64 = v10;
    v62 = *(_QWORD *)v70;
    do
    {
      v26 = 0;
      v67 = v21;
      do
      {
        if (*(_QWORD *)v70 != v23)
          objc_enumerationMutation(v19);
        v27 = *(void **)(*((_QWORD *)&v69 + 1) + 8 * (_QWORD)v26);
        if (objc_msgSend(v27, "category") == (id)15)
        {
          v28 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v27, "startDate"));
          if ((objc_msgSend(v28, "isAfterDate:", v10) & 1) != 0)
            v29 = (id)objc_claimAutoreleasedReturnValue(objc_msgSend(v27, "startDate"));
          else
            v29 = v10;
          v30 = v29;

          v31 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v27, "endDate"));
          if ((objc_msgSend(v31, "isBeforeDate:", v12) & 1) != 0)
            v32 = (id)objc_claimAutoreleasedReturnValue(objc_msgSend(v27, "endDate"));
          else
            v32 = v12;
          v33 = v32;

          objc_msgSend(v33, "timeIntervalSinceDate:", v30);
          v35 = v34;
          v36 = _mo_log_facility_get_os_log(&MOLogFacilityEventBundleManager);
          v37 = objc_claimAutoreleasedReturnValue(v36);
          v68 = v30;
          if (os_log_type_enabled(v37, OS_LOG_TYPE_INFO))
          {
            v39 = (objc_class *)objc_opt_class(self, v38);
            v40 = NSStringFromClass(v39);
            v41 = (void *)objc_claimAutoreleasedReturnValue(v40);
            v42 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v27, "eventIdentifier"));
            v43 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v27, "startDate"));
            v44 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v27, "endDate"));
            v66 = v22;
            v45 = v12;
            v46 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v27, "pCount"));
            *(_DWORD *)buf = 138414082;
            v74 = v41;
            v75 = 2112;
            v76 = *(double *)&v42;
            v77 = 2112;
            v78 = *(double *)&v43;
            v79 = 2112;
            v80 = (unint64_t)v44;
            v81 = 2112;
            v82 = v46;
            v83 = 2112;
            v84 = v68;
            v85 = 2112;
            v86 = v33;
            v87 = 2048;
            v88 = v35;
            _os_log_impl((void *)&_mh_execute_header, v37, OS_LOG_TYPE_INFO, "TimeContext(%@): social context event identifier, %@, startDate, %@, endDate, %@, p count, %@, overlap startDate, %@, endDate %@, overlap interval, %.1f", buf, 0x52u);

            v12 = v45;
            v22 = v66;

            v23 = v62;
            v10 = v64;

            v19 = v63;
          }

          v47 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v27, "pCount"));
          v25 = v25 + (double)objc_msgSend(v47, "unsignedIntValue") * v35;

          v48 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v27, "pCount"));
          v49 = objc_msgSend(v48, "unsignedIntValue");

          if (v22 <= v49)
            v22 = v49;
          v24 = v24 + v35;

          v21 = v67;
        }
        v26 = (char *)v26 + 1;
      }
      while (v21 != v26);
      v21 = objc_msgSend(v19, "countByEnumeratingWithState:objects:count:", &v69, v89, 16);
    }
    while (v21);
  }
  else
  {
    v22 = 0;
    v24 = 0.0;
    v25 = 0.0;
  }

  if (v24 <= 0.0)
    v50 = 0.0;
  else
    v50 = v25 / v24;
  v51 = _mo_log_facility_get_os_log(&MOLogFacilityEventBundleManager);
  v52 = objc_claimAutoreleasedReturnValue(v51);
  if (os_log_type_enabled(v52, OS_LOG_TYPE_INFO))
  {
    v54 = (objc_class *)objc_opt_class(self, v53);
    v55 = NSStringFromClass(v54);
    v56 = (void *)objc_claimAutoreleasedReturnValue(v55);
    *(_DWORD *)buf = 138413058;
    v74 = v56;
    v75 = 2048;
    v76 = v25;
    v77 = 2048;
    v78 = v50;
    v79 = 2048;
    v80 = v22;
    _os_log_impl((void *)&_mh_execute_header, v52, OS_LOG_TYPE_INFO, "TimeContext(%@): pCountWeightedSum, %.1f, pCountWeightedAverage, %.1f, pCountMax, %lu", buf, 0x2Au);

  }
  v57 = (void *)objc_claimAutoreleasedReturnValue(+[NSNumber numberWithDouble:](NSNumber, "numberWithDouble:", v25));
  objc_msgSend(v61, "addMetaDataForRankForKey:value:", CFSTR("PeopleCountWeightedSum"), v57);

  v58 = (void *)objc_claimAutoreleasedReturnValue(+[NSNumber numberWithDouble:](NSNumber, "numberWithDouble:", v50));
  objc_msgSend(v61, "addMetaDataForRankForKey:value:", CFSTR("PeopleCountWeightedAverage"), v58);

  v59 = (void *)objc_claimAutoreleasedReturnValue(+[NSNumber numberWithUnsignedInteger:](NSNumber, "numberWithUnsignedInteger:", v22));
  objc_msgSend(v61, "addMetaDataForRankForKey:value:", CFSTR("PeopleCountMax"), v59);

}

- (void)addPeopleDensityContextForEventBundle:(id)a3 sortedBaseEvents:(id)a4 contextEvents:(id)a5
{
  id v7;
  id v8;
  id v9;
  void *v10;
  void *v11;
  void *v12;
  void *v13;
  id os_log;
  NSObject *v15;
  uint64_t v16;
  objc_class *v17;
  NSString *v18;
  void *v19;
  id v20;
  id v21;
  id v22;
  uint64_t v23;
  double v24;
  double v25;
  double v26;
  double v27;
  void *v28;
  void *v29;
  void *v30;
  id v31;
  void *v32;
  void *v33;
  id v34;
  void *v35;
  double v36;
  double v37;
  id v38;
  NSObject *v39;
  uint64_t v40;
  objc_class *v41;
  NSString *v42;
  void *v43;
  void *v44;
  void *v45;
  void *v46;
  void *v47;
  void *v48;
  double v49;
  void *v50;
  void *v51;
  double v52;
  double v53;
  void *v54;
  double v55;
  double v56;
  void *v57;
  double v58;
  void *v59;
  double v60;
  double v61;
  double v62;
  double v63;
  id v64;
  NSObject *v65;
  uint64_t v66;
  objc_class *v67;
  NSString *v68;
  void *v69;
  void *v70;
  void *v71;
  void *v72;
  void *v73;
  void *v74;
  id v75;
  id v76;
  void *v77;
  void *v79;
  uint64_t v80;
  id v81;
  id v82;
  __int128 v83;
  __int128 v84;
  __int128 v85;
  __int128 v86;
  uint8_t buf[4];
  void *v88;
  __int16 v89;
  double v90;
  __int16 v91;
  double v92;
  __int16 v93;
  double v94;
  __int16 v95;
  double v96;
  __int16 v97;
  double v98;
  __int16 v99;
  void *v100;
  __int16 v101;
  double v102;
  _BYTE v103[128];

  v7 = a3;
  v8 = a4;
  v9 = a5;
  v10 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v8, "firstObject"));
  v11 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v10, "startDate"));

  v12 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v8, "lastObject"));
  v13 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v12, "endDate"));

  os_log = _mo_log_facility_get_os_log(&MOLogFacilityEventBundleManager);
  v15 = objc_claimAutoreleasedReturnValue(os_log);
  v79 = v13;
  if (os_log_type_enabled(v15, OS_LOG_TYPE_INFO))
  {
    v17 = (objc_class *)objc_opt_class(self, v16);
    v18 = NSStringFromClass(v17);
    v19 = (void *)objc_claimAutoreleasedReturnValue(v18);
    *(_DWORD *)buf = 138412802;
    v88 = v19;
    v89 = 2112;
    v90 = *(double *)&v11;
    v91 = 2112;
    v92 = *(double *)&v79;
    _os_log_impl((void *)&_mh_execute_header, v15, OS_LOG_TYPE_INFO, "TimeContext(%@): bundle startDate, %@, endDate, %@", buf, 0x20u);

    v13 = v79;
  }

  v85 = 0u;
  v86 = 0u;
  v83 = 0u;
  v84 = 0u;
  v20 = v9;
  v21 = objc_msgSend(v20, "countByEnumeratingWithState:objects:count:", &v83, v103, 16);
  if (v21)
  {
    v22 = v21;
    v75 = v8;
    v76 = v7;
    v23 = *(_QWORD *)v84;
    v24 = 0.0;
    v25 = 0.0;
    v26 = 0.0;
    v27 = 0.0;
    v80 = *(_QWORD *)v84;
    v81 = v20;
    v77 = v11;
    do
    {
      v28 = 0;
      v82 = v22;
      do
      {
        if (*(_QWORD *)v84 != v23)
          objc_enumerationMutation(v20);
        v29 = *(void **)(*((_QWORD *)&v83 + 1) + 8 * (_QWORD)v28);
        if (objc_msgSend(v29, "category", v75, v76) == (id)23)
        {
          v30 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v29, "startDate"));
          if ((objc_msgSend(v30, "isAfterDate:", v11) & 1) != 0)
            v31 = (id)objc_claimAutoreleasedReturnValue(objc_msgSend(v29, "startDate"));
          else
            v31 = v11;
          v32 = v31;

          v33 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v29, "endDate"));
          if ((objc_msgSend(v33, "isBeforeDate:", v13) & 1) != 0)
            v34 = (id)objc_claimAutoreleasedReturnValue(objc_msgSend(v29, "endDate"));
          else
            v34 = v13;
          v35 = v34;

          objc_msgSend(v35, "timeIntervalSinceDate:", v32);
          v37 = v36;
          v38 = _mo_log_facility_get_os_log(&MOLogFacilityEventBundleManager);
          v39 = objc_claimAutoreleasedReturnValue(v38);
          if (os_log_type_enabled(v39, OS_LOG_TYPE_INFO))
          {
            v41 = (objc_class *)objc_opt_class(self, v40);
            v42 = NSStringFromClass(v41);
            v43 = (void *)objc_claimAutoreleasedReturnValue(v42);
            v44 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v29, "eventIdentifier"));
            v45 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v29, "startDate"));
            v46 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v29, "endDate"));
            v47 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v29, "densityScore"));
            *(_DWORD *)buf = 138414082;
            v88 = v43;
            v89 = 2112;
            v90 = *(double *)&v44;
            v91 = 2112;
            v92 = *(double *)&v45;
            v93 = 2112;
            v94 = *(double *)&v46;
            v95 = 2112;
            v96 = *(double *)&v47;
            v97 = 2112;
            v98 = *(double *)&v32;
            v99 = 2112;
            v100 = v35;
            v101 = 2048;
            v102 = v37;
            _os_log_impl((void *)&_mh_execute_header, v39, OS_LOG_TYPE_INFO, "TimeContext(%@): people density event identifier, %@, startDate, %@, endDate, %@, p count, %@, overlap startDate, %@, endDate %@, overlap interval, %.1f", buf, 0x52u);

            v13 = v79;
            v11 = v77;

          }
          v48 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v29, "densityScore"));
          objc_msgSend(v48, "doubleValue");
          v27 = v27 + v49 * v37;

          v50 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v29, "endDate"));
          v51 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v29, "startDate"));
          objc_msgSend(v50, "timeIntervalSinceDate:", v51);
          v53 = v52;

          v54 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v29, "densityScanDuration"));
          objc_msgSend(v54, "doubleValue");
          v56 = v55 / v53;

          v57 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v29, "densityScore"));
          objc_msgSend(v57, "doubleValue");
          v26 = v26 + v56 * v58 * v37;

          v59 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v29, "densityScore"));
          objc_msgSend(v59, "doubleValue");
          v61 = v60;

          if (v24 < v61)
            v24 = v61;
          v25 = v25 + v37;

          v23 = v80;
          v20 = v81;
          v22 = v82;
        }
        v28 = (char *)v28 + 1;
      }
      while (v22 != v28);
      v22 = objc_msgSend(v20, "countByEnumeratingWithState:objects:count:", &v83, v103, 16);
    }
    while (v22);

    if (v25 > 0.0)
      v62 = v27 / v25;
    else
      v62 = 0.0;
    if (v25 > 0.0)
      v63 = v26 / v25;
    else
      v63 = 0.0;
    v8 = v75;
    v7 = v76;
  }
  else
  {

    v27 = 0.0;
    v26 = 0.0;
    v24 = 0.0;
    v62 = 0.0;
    v63 = 0.0;
  }
  v64 = _mo_log_facility_get_os_log(&MOLogFacilityEventBundleManager);
  v65 = objc_claimAutoreleasedReturnValue(v64);
  if (os_log_type_enabled(v65, OS_LOG_TYPE_INFO))
  {
    v67 = (objc_class *)objc_opt_class(self, v66);
    v68 = NSStringFromClass(v67);
    v69 = (void *)objc_claimAutoreleasedReturnValue(v68);
    *(_DWORD *)buf = 138413570;
    v88 = v69;
    v89 = 2048;
    v90 = v27;
    v91 = 2048;
    v92 = v62;
    v93 = 2048;
    v94 = v24;
    v95 = 2048;
    v96 = v26;
    v97 = 2048;
    v98 = v63;
    _os_log_impl((void *)&_mh_execute_header, v65, OS_LOG_TYPE_INFO, "TimeContext(%@): peopleDensityWeightedSum, %.1f, peopleDensityWeightedAverage, %.1f, peopleDensityMax, %.1f, peopleDensityWeightedConfidenceSum, %.1f, peopleDensityWeightedConfidenceAverage, %.3f", buf, 0x3Eu);

  }
  v70 = (void *)objc_claimAutoreleasedReturnValue(+[NSNumber numberWithDouble:](NSNumber, "numberWithDouble:", v27));
  objc_msgSend(v7, "addMetaDataForRankForKey:value:", CFSTR("PeopleDensityWeightedSum"), v70);

  v71 = (void *)objc_claimAutoreleasedReturnValue(+[NSNumber numberWithDouble:](NSNumber, "numberWithDouble:", v62));
  objc_msgSend(v7, "addMetaDataForRankForKey:value:", CFSTR("PeopleDensityWeightedAverage"), v71);

  v72 = (void *)objc_claimAutoreleasedReturnValue(+[NSNumber numberWithDouble:](NSNumber, "numberWithDouble:", v24));
  objc_msgSend(v7, "addMetaDataForRankForKey:value:", CFSTR("PeopleDensityMax"), v72);

  v73 = (void *)objc_claimAutoreleasedReturnValue(+[NSNumber numberWithDouble:](NSNumber, "numberWithDouble:", v26));
  objc_msgSend(v7, "addMetaDataForRankForKey:value:", CFSTR("PeopleDensityWeightedConfidenceSum"), v73);

  v74 = (void *)objc_claimAutoreleasedReturnValue(+[NSNumber numberWithDouble:](NSNumber, "numberWithDouble:", v63));
  objc_msgSend(v7, "addMetaDataForRankForKey:value:", CFSTR("PeopleDensityWeightedConfidenceAverage"), v74);

}

- (OS_dispatch_queue)queue
{
  return self->_queue;
}

- (MODefaultsManager)defaultsManager
{
  return self->_defaultsManager;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_defaultsManager, 0);
  objc_storeStrong((id *)&self->_queue, 0);
}

- (void)getBaseEvents:.cold.1()
{
  NSObject *v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint8_t v6;

  OUTLINED_FUNCTION_1_3();
  OUTLINED_FUNCTION_0_5((void *)&_mh_execute_header, v0, v1, "Use the derived class (in %s:%d)", v2, v3, v4, v5, v6);
  OUTLINED_FUNCTION_1();
}

- (void)getContextEventsForBaseEvents:events:withPatternEvents:.cold.1()
{
  NSObject *v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint8_t v6;

  OUTLINED_FUNCTION_1_3();
  OUTLINED_FUNCTION_0_5((void *)&_mh_execute_header, v0, v1, "Use the derived class (in %s:%d)", v2, v3, v4, v5, v6);
  OUTLINED_FUNCTION_1();
}

- (void)annotateBaseEvents:contextEvents:.cold.1()
{
  NSObject *v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint8_t v6;

  OUTLINED_FUNCTION_1_3();
  OUTLINED_FUNCTION_0_5((void *)&_mh_execute_header, v0, v1, "Use the derived class (in %s:%d)", v2, v3, v4, v5, v6);
  OUTLINED_FUNCTION_1();
}

- (void)buildPromptDescriptionForEventBundle:.cold.1()
{
  NSObject *v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint8_t v6;

  OUTLINED_FUNCTION_1_3();
  OUTLINED_FUNCTION_0_5((void *)&_mh_execute_header, v0, v1, "Use the derived class (in %s:%d)", v2, v3, v4, v5, v6);
  OUTLINED_FUNCTION_1();
}

@end
