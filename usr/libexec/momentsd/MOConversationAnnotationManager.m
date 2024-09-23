@implementation MOConversationAnnotationManager

- (MOConversationAnnotationManager)initWithUniverse:(id)a3
{
  id v4;
  MOConversationAnnotationManager *v5;
  dispatch_queue_attr_t v6;
  NSObject *v7;
  dispatch_queue_t v8;
  OS_dispatch_queue *queue;
  uint64_t v10;
  objc_class *v11;
  NSString *v12;
  void *v13;
  uint64_t v14;
  MOConfigurationManager *configurationManager;
  NSSet *v16;
  NSSet *callLikeInteractionMechanisms;
  NSSet *v18;
  NSSet *messageInteractionMechanisms;
  NSMutableDictionary *v20;
  NSMutableDictionary *stats;
  NSMutableDictionary *v22;
  NSMutableDictionary *eventToPatternEventMap;
  NSMutableDictionary *v24;
  NSMutableDictionary *eventToContextEventMap;
  MOConversationAnnotationManager *v26;
  objc_super v28;

  v4 = a3;
  v28.receiver = self;
  v28.super_class = (Class)MOConversationAnnotationManager;
  v5 = -[MOAnnotationManager initWithUniverse:](&v28, "initWithUniverse:", v4);
  if (v5)
  {
    v6 = dispatch_queue_attr_make_with_autorelease_frequency(0, DISPATCH_AUTORELEASE_FREQUENCY_WORK_ITEM);
    v7 = objc_claimAutoreleasedReturnValue(v6);
    v8 = dispatch_queue_create("MOConversationAnnotationManager", v7);
    queue = v5->_queue;
    v5->_queue = (OS_dispatch_queue *)v8;

    v11 = (objc_class *)objc_opt_class(MOConfigurationManager, v10);
    v12 = NSStringFromClass(v11);
    v13 = (void *)objc_claimAutoreleasedReturnValue(v12);
    v14 = objc_claimAutoreleasedReturnValue(objc_msgSend(v4, "getService:", v13));
    configurationManager = v5->_configurationManager;
    v5->_configurationManager = (MOConfigurationManager *)v14;

    v16 = (NSSet *)objc_msgSend(objc_alloc((Class)NSSet), "initWithObjects:", &off_1002DAC70, &off_1002DAC88, &off_1002DACA0, &off_1002DACB8, &off_1002DACD0, &off_1002DACE8, &off_1002DAD00, &off_1002DAD18, 0);
    callLikeInteractionMechanisms = v5->_callLikeInteractionMechanisms;
    v5->_callLikeInteractionMechanisms = v16;

    v18 = (NSSet *)objc_msgSend(objc_alloc((Class)NSSet), "initWithObjects:", &off_1002DAD30, &off_1002DAD48, &off_1002DAD60, 0);
    messageInteractionMechanisms = v5->_messageInteractionMechanisms;
    v5->_messageInteractionMechanisms = v18;

    v20 = objc_opt_new(NSMutableDictionary);
    stats = v5->_stats;
    v5->_stats = v20;

    v22 = objc_opt_new(NSMutableDictionary);
    eventToPatternEventMap = v5->_eventToPatternEventMap;
    v5->_eventToPatternEventMap = v22;

    v24 = objc_opt_new(NSMutableDictionary);
    eventToContextEventMap = v5->_eventToContextEventMap;
    v5->_eventToContextEventMap = v24;

    v26 = v5;
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
  v11 = objc_claimAutoreleasedReturnValue(-[MOConversationAnnotationManager queue](self, "queue"));
  v15[0] = _NSConcreteStackBlock;
  v15[1] = 3221225472;
  v15[2] = __89__MOConversationAnnotationManager_performAnnotationWithEvents_withPatternEvents_handler___block_invoke;
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

id __89__MOConversationAnnotationManager_performAnnotationWithEvents_withPatternEvents_handler___block_invoke(uint64_t a1)
{
  return objc_msgSend(*(id *)(a1 + 32), "_performAnnotationWithEvents:withPatternEvents:handler:", *(_QWORD *)(a1 + 40), *(_QWORD *)(a1 + 48), *(_QWORD *)(a1 + 56));
}

- (void)_performAnnotationWithEvents:(id)a3 withPatternEvents:(id)a4 handler:(id)a5
{
  id v8;
  id v9;
  id v10;
  void *v11;
  void *v12;
  void *v13;
  NSMutableSet *v14;
  id v15;
  id v16;
  void *v17;
  uint64_t v18;
  void *i;
  void *v20;
  void *v21;
  void *v22;
  uint64_t v23;
  id v24;
  id v25;
  id v26;
  uint64_t v27;
  void *j;
  void *v29;
  void *v30;
  void *v31;
  uint64_t v32;
  id v33;
  id v34;
  id v35;
  uint64_t v36;
  void *k;
  void *v38;
  void *v39;
  void *v40;
  uint64_t v41;
  id v42;
  id v43;
  id v44;
  uint64_t v45;
  void *m;
  void *v47;
  void *v48;
  void *v49;
  uint64_t v50;
  id os_log;
  NSObject *v52;
  id v53;
  void *v54;
  void *v55;
  void *v56;
  void *v57;
  void *v58;
  void *v59;
  id v60;
  id v61;
  id v62;
  id obj;
  NSMutableArray *v64;
  __int128 v65;
  __int128 v66;
  __int128 v67;
  __int128 v68;
  __int128 v69;
  __int128 v70;
  __int128 v71;
  __int128 v72;
  __int128 v73;
  __int128 v74;
  __int128 v75;
  __int128 v76;
  __int128 v77;
  __int128 v78;
  __int128 v79;
  __int128 v80;
  uint8_t buf[4];
  const char *v82;
  __int16 v83;
  id v84;
  void *v85;
  _BYTE v86[128];
  void *v87;
  _BYTE v88[128];
  void *v89;
  _BYTE v90[128];
  void *v91;
  _BYTE v92[128];

  v8 = a3;
  v9 = a4;
  v10 = a5;
  v11 = (void *)objc_claimAutoreleasedReturnValue(-[MOConversationAnnotationManager _getBaseEvents:](self, "_getBaseEvents:", v8));
  if (objc_msgSend(v11, "count"))
  {
    v60 = v10;
    if (!objc_msgSend(v9, "count"))
    {

      v9 = 0;
    }
    -[MOConversationAnnotationManager _calculateEventStats:](self, "_calculateEventStats:", v11);
    v61 = v9;
    -[MOConversationAnnotationManager _buildMappingFromBaseEvents:toPatternEvents:](self, "_buildMappingFromBaseEvents:toPatternEvents:", v11, v9);
    v62 = v8;
    v58 = (void *)objc_claimAutoreleasedReturnValue(-[MOConversationAnnotationManager _getContextEvents:](self, "_getContextEvents:", v8));
    -[MOConversationAnnotationManager _buildMappingFromBaseEvents:toContextEvents:](self, "_buildMappingFromBaseEvents:toContextEvents:", v11);
    v12 = (void *)objc_claimAutoreleasedReturnValue(-[MOConversationAnnotationManager _findEventsWithPatternEvents:](self, "_findEventsWithPatternEvents:", v11));
    v13 = (void *)objc_claimAutoreleasedReturnValue(-[MOConversationAnnotationManager _findEventsWithBurstyInteractionsFromEvents:](self, "_findEventsWithBurstyInteractionsFromEvents:", v11));
    v54 = (void *)objc_claimAutoreleasedReturnValue(-[MOConversationAnnotationManager _findEventsWithLongDailyCall:](self, "_findEventsWithLongDailyCall:", v11));
    v59 = v11;
    v56 = (void *)objc_claimAutoreleasedReturnValue(-[MOConversationAnnotationManager _findEventsWithOutgoingMessageBurstFromEvents:](self, "_findEventsWithOutgoingMessageBurstFromEvents:", v11));
    v64 = objc_opt_new(NSMutableArray);
    v14 = objc_opt_new(NSMutableSet);
    v77 = 0u;
    v78 = 0u;
    v79 = 0u;
    v80 = 0u;
    obj = v12;
    v15 = objc_msgSend(obj, "countByEnumeratingWithState:objects:count:", &v77, v92, 16);
    if (v15)
    {
      v16 = v15;
      v17 = 0;
      v18 = *(_QWORD *)v78;
      do
      {
        for (i = 0; i != v16; i = (char *)i + 1)
        {
          if (*(_QWORD *)v78 != v18)
            objc_enumerationMutation(obj);
          v20 = *(void **)(*((_QWORD *)&v77 + 1) + 8 * (_QWORD)i);
          if ((-[NSMutableSet containsObject:](v14, "containsObject:", v20) & 1) == 0)
          {
            -[NSMutableSet addObject:](v14, "addObject:", v20);
            v91 = v20;
            v21 = (void *)objc_claimAutoreleasedReturnValue(+[NSArray arrayWithObjects:count:](NSArray, "arrayWithObjects:count:", &v91, 1));
            v22 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v20, "interactionScoredContact"));
            v23 = objc_claimAutoreleasedReturnValue(-[MOConversationAnnotationManager _annotateEvents:significantContact:type:](self, "_annotateEvents:significantContact:type:", v21, v22, 6));

            if (v23)
            {
              -[NSMutableArray addObject:](v64, "addObject:", v23);
              v17 = (void *)v23;
            }
            else
            {
              v17 = 0;
            }
          }
        }
        v16 = objc_msgSend(obj, "countByEnumeratingWithState:objects:count:", &v77, v92, 16);
      }
      while (v16);
    }
    else
    {
      v17 = 0;
    }

    v75 = 0u;
    v76 = 0u;
    v73 = 0u;
    v74 = 0u;
    v24 = v13;
    v25 = objc_msgSend(v24, "countByEnumeratingWithState:objects:count:", &v73, v90, 16);
    if (v25)
    {
      v26 = v25;
      v27 = *(_QWORD *)v74;
      do
      {
        for (j = 0; j != v26; j = (char *)j + 1)
        {
          if (*(_QWORD *)v74 != v27)
            objc_enumerationMutation(v24);
          v29 = *(void **)(*((_QWORD *)&v73 + 1) + 8 * (_QWORD)j);
          if ((-[NSMutableSet containsObject:](v14, "containsObject:", v29) & 1) == 0)
          {
            -[NSMutableSet addObject:](v14, "addObject:", v29);
            v89 = v29;
            v30 = (void *)objc_claimAutoreleasedReturnValue(+[NSArray arrayWithObjects:count:](NSArray, "arrayWithObjects:count:", &v89, 1));
            v31 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v29, "interactionScoredContact"));
            v32 = objc_claimAutoreleasedReturnValue(-[MOConversationAnnotationManager _annotateEvents:significantContact:type:](self, "_annotateEvents:significantContact:type:", v30, v31, 5));

            if (v32)
            {
              -[NSMutableArray addObject:](v64, "addObject:", v32);
              v17 = (void *)v32;
            }
            else
            {
              v17 = 0;
            }
          }
        }
        v26 = objc_msgSend(v24, "countByEnumeratingWithState:objects:count:", &v73, v90, 16);
      }
      while (v26);
    }
    v57 = v24;

    v71 = 0u;
    v72 = 0u;
    v69 = 0u;
    v70 = 0u;
    v33 = v54;
    v34 = objc_msgSend(v33, "countByEnumeratingWithState:objects:count:", &v69, v88, 16);
    if (v34)
    {
      v35 = v34;
      v36 = *(_QWORD *)v70;
      do
      {
        for (k = 0; k != v35; k = (char *)k + 1)
        {
          if (*(_QWORD *)v70 != v36)
            objc_enumerationMutation(v33);
          v38 = *(void **)(*((_QWORD *)&v69 + 1) + 8 * (_QWORD)k);
          if ((-[NSMutableSet containsObject:](v14, "containsObject:", v38) & 1) == 0)
          {
            -[NSMutableSet addObject:](v14, "addObject:", v38);
            v87 = v38;
            v39 = (void *)objc_claimAutoreleasedReturnValue(+[NSArray arrayWithObjects:count:](NSArray, "arrayWithObjects:count:", &v87, 1));
            v40 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v38, "interactionScoredContact"));
            v41 = objc_claimAutoreleasedReturnValue(-[MOConversationAnnotationManager _annotateEvents:significantContact:type:](self, "_annotateEvents:significantContact:type:", v39, v40, 4));

            if (v41)
            {
              -[NSMutableArray addObject:](v64, "addObject:", v41);
              v17 = (void *)v41;
            }
            else
            {
              v17 = 0;
            }
          }
        }
        v35 = objc_msgSend(v33, "countByEnumeratingWithState:objects:count:", &v69, v88, 16);
      }
      while (v35);
    }
    v55 = v33;

    v67 = 0u;
    v68 = 0u;
    v65 = 0u;
    v66 = 0u;
    v42 = v56;
    v43 = objc_msgSend(v42, "countByEnumeratingWithState:objects:count:", &v65, v86, 16);
    if (v43)
    {
      v44 = v43;
      v45 = *(_QWORD *)v66;
      do
      {
        for (m = 0; m != v44; m = (char *)m + 1)
        {
          if (*(_QWORD *)v66 != v45)
            objc_enumerationMutation(v42);
          v47 = *(void **)(*((_QWORD *)&v65 + 1) + 8 * (_QWORD)m);
          if ((-[NSMutableSet containsObject:](v14, "containsObject:", v47, v55) & 1) == 0)
          {
            -[NSMutableSet addObject:](v14, "addObject:", v47);
            v85 = v47;
            v48 = (void *)objc_claimAutoreleasedReturnValue(+[NSArray arrayWithObjects:count:](NSArray, "arrayWithObjects:count:", &v85, 1));
            v49 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v47, "interactionScoredContact"));
            v50 = objc_claimAutoreleasedReturnValue(-[MOConversationAnnotationManager _annotateEvents:significantContact:type:](self, "_annotateEvents:significantContact:type:", v48, v49, 7));

            if (v50)
            {
              -[NSMutableArray addObject:](v64, "addObject:", v50);
              v17 = (void *)v50;
            }
            else
            {
              v17 = 0;
            }
          }
        }
        v44 = objc_msgSend(v42, "countByEnumeratingWithState:objects:count:", &v65, v86, 16);
      }
      while (v44);
    }

    os_log = _mo_log_facility_get_os_log(&MOLogFacilityEventBundleManager);
    v52 = objc_claimAutoreleasedReturnValue(os_log);
    if (os_log_type_enabled(v52, OS_LOG_TYPE_INFO))
    {
      v53 = -[NSMutableArray count](v64, "count");
      *(_DWORD *)buf = 136315394;
      v82 = "-[MOConversationAnnotationManager _performAnnotationWithEvents:withPatternEvents:handler:]";
      v83 = 2048;
      v84 = v53;
      _os_log_impl((void *)&_mh_execute_header, v52, OS_LOG_TYPE_INFO, "%s, annotated bundle count, %lu", buf, 0x16u);
    }

    v10 = v60;
    (*((void (**)(id, NSMutableArray *, _QWORD))v60 + 2))(v60, v64, 0);

    v9 = v61;
    v8 = v62;
    v11 = v59;
  }
  else
  {
    (*((void (**)(id, _QWORD, _QWORD))v10 + 2))(v10, 0, 0);
  }

}

- (id)_getBaseEvents:(id)a3
{
  id v3;
  void *v4;
  id v5;
  id v6;
  uint64_t v7;
  void *i;
  void *v9;
  id os_log;
  NSObject *v11;
  void *v12;
  id v13;
  NSObject *v14;
  id v15;
  id v16;
  void *v18;
  void *v19;
  __int128 v20;
  __int128 v21;
  __int128 v22;
  __int128 v23;
  uint8_t buf[4];
  const char *v25;
  __int16 v26;
  id v27;
  __int16 v28;
  id v29;
  _BYTE v30[128];

  v3 = a3;
  v18 = (void *)objc_claimAutoreleasedReturnValue(+[NSPredicate predicateWithFormat:](NSPredicate, "predicateWithFormat:", CFSTR("%K = %lu"), CFSTR("category"), 10));
  v19 = v3;
  v4 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v3, "filteredArrayUsingPredicate:"));
  v20 = 0u;
  v21 = 0u;
  v22 = 0u;
  v23 = 0u;
  v5 = objc_msgSend(v4, "countByEnumeratingWithState:objects:count:", &v20, v30, 16);
  if (v5)
  {
    v6 = v5;
    v7 = *(_QWORD *)v21;
    do
    {
      for (i = 0; i != v6; i = (char *)i + 1)
      {
        if (*(_QWORD *)v21 != v7)
          objc_enumerationMutation(v4);
        v9 = *(void **)(*((_QWORD *)&v20 + 1) + 8 * (_QWORD)i);
        os_log = _mo_log_facility_get_os_log(&MOLogFacilityEventBundleManager);
        v11 = objc_claimAutoreleasedReturnValue(os_log);
        if (os_log_type_enabled(v11, OS_LOG_TYPE_INFO))
        {
          *(_DWORD *)buf = 136315394;
          v25 = "-[MOConversationAnnotationManager _getBaseEvents:]";
          v26 = 2112;
          v27 = v9;
          _os_log_impl((void *)&_mh_execute_header, v11, OS_LOG_TYPE_INFO, "%s, filtered event, %@", buf, 0x16u);
        }

        v12 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v9, "interactions"));
        objc_msgSend(v12, "enumerateObjectsUsingBlock:", &__block_literal_global_39);

      }
      v6 = objc_msgSend(v4, "countByEnumeratingWithState:objects:count:", &v20, v30, 16);
    }
    while (v6);
  }
  v13 = _mo_log_facility_get_os_log(&MOLogFacilityEventBundleManager);
  v14 = objc_claimAutoreleasedReturnValue(v13);
  if (os_log_type_enabled(v14, OS_LOG_TYPE_INFO))
  {
    v15 = objc_msgSend(v19, "count");
    v16 = objc_msgSend(v4, "count");
    *(_DWORD *)buf = 136315650;
    v25 = "-[MOConversationAnnotationManager _getBaseEvents:]";
    v26 = 2048;
    v27 = v15;
    v28 = 2048;
    v29 = v16;
    _os_log_impl((void *)&_mh_execute_header, v14, OS_LOG_TYPE_INFO, "%s, event count, %lu, filtered events count, %lu", buf, 0x20u);
  }

  return v4;
}

void __50__MOConversationAnnotationManager__getBaseEvents___block_invoke(id a1, MOInteraction *a2, unint64_t a3, BOOL *a4)
{
  MOInteraction *v5;
  id os_log;
  NSObject *v7;

  v5 = a2;
  os_log = _mo_log_facility_get_os_log(&MOLogFacilityEventBundleManager);
  v7 = objc_claimAutoreleasedReturnValue(os_log);
  if (os_log_type_enabled(v7, OS_LOG_TYPE_DEBUG))
    __50__MOConversationAnnotationManager__getBaseEvents___block_invoke_cold_1((uint64_t)v5, a3, v7);

}

- (id)_getContextEvents:(id)a3
{
  id v3;
  void *v4;
  void *v5;

  v3 = a3;
  v4 = (void *)objc_claimAutoreleasedReturnValue(+[NSPredicate predicateWithFormat:](NSPredicate, "predicateWithFormat:", CFSTR("%K IN %@"), CFSTR("category"), &off_1002DCB18));
  v5 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v3, "filteredArrayUsingPredicate:", v4));

  return v5;
}

- (id)_getWorkVisitEventsDuringCall:(id)a3 withCall:(id)a4
{
  id v5;
  id v6;
  void *v7;
  void *v8;
  void *v9;
  void *v10;
  void *v11;
  void *v12;
  void *v13;
  void *v14;
  void *v15;
  id v16;
  _QWORD v18[2];

  v5 = a4;
  v6 = a3;
  v7 = (void *)objc_claimAutoreleasedReturnValue(+[NSPredicate predicateWithFormat:](NSPredicate, "predicateWithFormat:", CFSTR("%K = %lu"), CFSTR("placeUserType"), 2));
  v8 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v6, "filteredArrayUsingPredicate:", v7));

  v9 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v5, "endDate"));
  v10 = (void *)objc_claimAutoreleasedReturnValue(+[NSPredicate predicateWithFormat:](NSPredicate, "predicateWithFormat:", CFSTR("%K <= %@"), CFSTR("startDate"), v9));
  v18[0] = v10;
  v11 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v5, "startDate"));

  v12 = (void *)objc_claimAutoreleasedReturnValue(+[NSPredicate predicateWithFormat:](NSPredicate, "predicateWithFormat:", CFSTR("%K => %@"), CFSTR("endDate"), v11));
  v18[1] = v12;
  v13 = (void *)objc_claimAutoreleasedReturnValue(+[NSArray arrayWithObjects:count:](NSArray, "arrayWithObjects:count:", v18, 2));
  v14 = (void *)objc_claimAutoreleasedReturnValue(+[NSCompoundPredicate andPredicateWithSubpredicates:](NSCompoundPredicate, "andPredicateWithSubpredicates:", v13));

  v15 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v8, "filteredArrayUsingPredicate:", v14));
  v16 = objc_msgSend(v15, "mutableCopy");

  return v16;
}

- (BOOL)_callLikeInteraction:(id)a3
{
  NSSet *callLikeInteractionMechanisms;
  void *v4;

  callLikeInteractionMechanisms = self->_callLikeInteractionMechanisms;
  v4 = (void *)objc_claimAutoreleasedReturnValue(+[NSNumber numberWithInteger:](NSNumber, "numberWithInteger:", objc_msgSend(a3, "mechanism")));
  LOBYTE(callLikeInteractionMechanisms) = -[NSSet containsObject:](callLikeInteractionMechanisms, "containsObject:", v4);

  return (char)callLikeInteractionMechanisms;
}

- (BOOL)_messageInteraction:(id)a3
{
  NSSet *messageInteractionMechanisms;
  void *v4;

  messageInteractionMechanisms = self->_messageInteractionMechanisms;
  v4 = (void *)objc_claimAutoreleasedReturnValue(+[NSNumber numberWithInteger:](NSNumber, "numberWithInteger:", objc_msgSend(a3, "mechanism")));
  LOBYTE(messageInteractionMechanisms) = -[NSSet containsObject:](messageInteractionMechanisms, "containsObject:", v4);

  return (char)messageInteractionMechanisms;
}

- (id)_findEventsWithBurstyInteractionsFromEvents:(id)a3
{
  id v4;
  void *v5;
  signed int v6;
  id v7;
  __int128 v8;
  id v9;
  unint64_t v10;
  uint64_t v11;
  void *i;
  void *v13;
  NSMutableDictionary *stats;
  void *v15;
  void *v16;
  void *v17;
  unint64_t v18;
  id os_log;
  NSObject *v20;
  __int128 v22;
  NSMutableArray *v23;
  id obj;
  __int128 v25;
  __int128 v26;
  __int128 v27;
  __int128 v28;
  uint8_t buf[4];
  const char *v30;
  __int16 v31;
  void *v32;
  __int16 v33;
  unint64_t v34;
  _BYTE v35[128];

  v4 = a3;
  v5 = (void *)objc_claimAutoreleasedReturnValue(-[MOConversationAnnotationManager configurationManager](self, "configurationManager"));
  v6 = objc_msgSend(v5, "getIntegerSettingForKey:withFallback:", CFSTR("kMOConversationAnnotationManagerMinimumInteractionCount"), 10);

  v23 = objc_opt_new(NSMutableArray);
  v25 = 0u;
  v26 = 0u;
  v27 = 0u;
  v28 = 0u;
  obj = v4;
  v7 = objc_msgSend(obj, "countByEnumeratingWithState:objects:count:", &v25, v35, 16);
  if (v7)
  {
    v9 = v7;
    v10 = v6;
    v11 = *(_QWORD *)v26;
    *(_QWORD *)&v8 = 136315650;
    v22 = v8;
    do
    {
      for (i = 0; i != v9; i = (char *)i + 1)
      {
        if (*(_QWORD *)v26 != v11)
          objc_enumerationMutation(obj);
        v13 = *(void **)(*((_QWORD *)&v25 + 1) + 8 * (_QWORD)i);
        stats = self->_stats;
        v15 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v13, "eventIdentifier", v22));
        v16 = (void *)objc_claimAutoreleasedReturnValue(-[NSMutableDictionary objectForKeyedSubscript:](stats, "objectForKeyedSubscript:", v15));
        v17 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v16, "objectForKey:", CFSTR("maxBurstLength")));
        v18 = objc_msgSend(v17, "unsignedIntValue");

        if (v18 >= v10)
        {
          os_log = _mo_log_facility_get_os_log(&MOLogFacilityEventBundleManager);
          v20 = objc_claimAutoreleasedReturnValue(os_log);
          if (os_log_type_enabled(v20, OS_LOG_TYPE_INFO))
          {
            *(_DWORD *)buf = v22;
            v30 = "-[MOConversationAnnotationManager _findEventsWithBurstyInteractionsFromEvents:]";
            v31 = 2112;
            v32 = v13;
            v33 = 2048;
            v34 = v18;
            _os_log_impl((void *)&_mh_execute_header, v20, OS_LOG_TYPE_INFO, "%s, found event, %@, maxBurstLength, %lu", buf, 0x20u);
          }

          -[NSMutableArray addObject:](v23, "addObject:", v13);
        }
      }
      v9 = objc_msgSend(obj, "countByEnumeratingWithState:objects:count:", &v25, v35, 16);
    }
    while (v9);
  }

  return v23;
}

- (id)_findEventsWithOutgoingMessageBurstFromEvents:(id)a3
{
  id v4;
  id v5;
  __int128 v6;
  id v7;
  uint64_t v8;
  void *i;
  void *v10;
  NSMutableDictionary *stats;
  void *v12;
  void *v13;
  void *v14;
  unsigned int v15;
  id os_log;
  NSObject *v17;
  __int128 v19;
  id obj;
  NSMutableArray *v21;
  __int128 v22;
  __int128 v23;
  __int128 v24;
  __int128 v25;
  uint8_t buf[4];
  const char *v27;
  __int16 v28;
  void *v29;
  __int16 v30;
  uint64_t v31;
  _BYTE v32[128];

  v4 = a3;
  v21 = objc_opt_new(NSMutableArray);
  v22 = 0u;
  v23 = 0u;
  v24 = 0u;
  v25 = 0u;
  obj = v4;
  v5 = objc_msgSend(obj, "countByEnumeratingWithState:objects:count:", &v22, v32, 16);
  if (v5)
  {
    v7 = v5;
    v8 = *(_QWORD *)v23;
    *(_QWORD *)&v6 = 136315650;
    v19 = v6;
    do
    {
      for (i = 0; i != v7; i = (char *)i + 1)
      {
        if (*(_QWORD *)v23 != v8)
          objc_enumerationMutation(obj);
        v10 = *(void **)(*((_QWORD *)&v22 + 1) + 8 * (_QWORD)i);
        stats = self->_stats;
        v12 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v10, "eventIdentifier", v19));
        v13 = (void *)objc_claimAutoreleasedReturnValue(-[NSMutableDictionary objectForKeyedSubscript:](stats, "objectForKeyedSubscript:", v12));
        v14 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v13, "objectForKey:", CFSTR("outgoingMessageBurstCount")));
        v15 = objc_msgSend(v14, "unsignedIntValue");

        if (v15)
        {
          os_log = _mo_log_facility_get_os_log(&MOLogFacilityEventBundleManager);
          v17 = objc_claimAutoreleasedReturnValue(os_log);
          if (os_log_type_enabled(v17, OS_LOG_TYPE_INFO))
          {
            *(_DWORD *)buf = v19;
            v27 = "-[MOConversationAnnotationManager _findEventsWithOutgoingMessageBurstFromEvents:]";
            v28 = 2112;
            v29 = v10;
            v30 = 2048;
            v31 = v15;
            _os_log_impl((void *)&_mh_execute_header, v17, OS_LOG_TYPE_INFO, "%s, found event, %@, outgoingMessageBurstCount, %lu", buf, 0x20u);
          }

          -[NSMutableArray addObject:](v21, "addObject:", v10);
        }
      }
      v7 = objc_msgSend(obj, "countByEnumeratingWithState:objects:count:", &v22, v32, 16);
    }
    while (v7);
  }

  return v21;
}

- (id)_findEventsWithLongDailyCall:(id)a3
{
  id v4;
  void *v5;
  double v6;
  double v7;
  id v8;
  __int128 v9;
  id v10;
  uint64_t v11;
  void *i;
  void *v13;
  NSMutableDictionary *stats;
  void *v15;
  void *v16;
  void *v17;
  double v18;
  double v19;
  id os_log;
  NSObject *v21;
  void *v22;
  void *v23;
  void *v24;
  __int128 v26;
  NSMutableArray *v27;
  id obj;
  __int128 v29;
  __int128 v30;
  __int128 v31;
  __int128 v32;
  void *v33;
  uint8_t buf[4];
  const char *v35;
  __int16 v36;
  void *v37;
  __int16 v38;
  double v39;
  _BYTE v40[128];

  v4 = a3;
  v5 = (void *)objc_claimAutoreleasedReturnValue(-[MOConversationAnnotationManager configurationManager](self, "configurationManager"));
  objc_msgSend(v5, "getDoubleSettingForKey:withFallback:", CFSTR("kMOConversationAnnotationManagerMinimumDurationDailyCall"), 300.0);
  v7 = v6;

  v27 = objc_opt_new(NSMutableArray);
  v29 = 0u;
  v30 = 0u;
  v31 = 0u;
  v32 = 0u;
  obj = v4;
  v8 = objc_msgSend(obj, "countByEnumeratingWithState:objects:count:", &v29, v40, 16);
  if (v8)
  {
    v10 = v8;
    v11 = *(_QWORD *)v30;
    *(_QWORD *)&v9 = 136315650;
    v26 = v9;
    do
    {
      for (i = 0; i != v10; i = (char *)i + 1)
      {
        if (*(_QWORD *)v30 != v11)
          objc_enumerationMutation(obj);
        v13 = *(void **)(*((_QWORD *)&v29 + 1) + 8 * (_QWORD)i);
        stats = self->_stats;
        v15 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v13, "eventIdentifier", v26));
        v16 = (void *)objc_claimAutoreleasedReturnValue(-[NSMutableDictionary objectForKey:](stats, "objectForKey:", v15));
        v17 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v16, "objectForKey:", CFSTR("aggregatedCallDuration")));
        objc_msgSend(v17, "doubleValue");
        v19 = v18;

        if (v19 > v7)
        {
          os_log = _mo_log_facility_get_os_log(&MOLogFacilityEventBundleManager);
          v21 = objc_claimAutoreleasedReturnValue(os_log);
          if (os_log_type_enabled(v21, OS_LOG_TYPE_INFO))
          {
            *(_DWORD *)buf = v26;
            v35 = "-[MOConversationAnnotationManager _findEventsWithLongDailyCall:]";
            v36 = 2112;
            v37 = v13;
            v38 = 2048;
            v39 = v19;
            _os_log_impl((void *)&_mh_execute_header, v21, OS_LOG_TYPE_INFO, "%s, found event, %@, daily call duration, %.1f", buf, 0x20u);
          }

          -[NSMutableArray addObject:](v27, "addObject:", v13);
        }
      }
      v10 = objc_msgSend(obj, "countByEnumeratingWithState:objects:count:", &v29, v40, 16);
    }
    while (v10);
  }

  v22 = (void *)objc_claimAutoreleasedReturnValue(+[NSSortDescriptor sortDescriptorWithKey:ascending:](NSSortDescriptor, "sortDescriptorWithKey:ascending:", CFSTR("endDate"), 0));
  v33 = v22;
  v23 = (void *)objc_claimAutoreleasedReturnValue(+[NSArray arrayWithObjects:count:](NSArray, "arrayWithObjects:count:", &v33, 1));
  v24 = (void *)objc_claimAutoreleasedReturnValue(-[NSMutableArray sortedArrayUsingDescriptors:](v27, "sortedArrayUsingDescriptors:", v23));

  return v24;
}

- (id)_findEventsWithPatternEvents:(id)a3
{
  id v4;
  void *v5;
  signed int v6;
  id v7;
  id v8;
  __int128 v9;
  id v10;
  uint64_t v11;
  void *i;
  void *v13;
  NSMutableDictionary *eventToPatternEventMap;
  void *v15;
  void *v16;
  NSMutableSet *v17;
  NSMutableSet *v18;
  id os_log;
  NSObject *v20;
  id v21;
  __int128 v23;
  NSMutableArray *v24;
  _QWORD v25[4];
  NSMutableSet *v26;
  __int128 v27;
  __int128 v28;
  __int128 v29;
  __int128 v30;
  uint8_t buf[4];
  const char *v32;
  __int16 v33;
  void *v34;
  __int16 v35;
  id v36;
  _BYTE v37[128];

  v4 = a3;
  v5 = (void *)objc_claimAutoreleasedReturnValue(-[MOConversationAnnotationManager configurationManager](self, "configurationManager"));
  v6 = objc_msgSend(v5, "getIntegerSettingForKey:withFallback:", CFSTR("kMOConversationAnnotationManagerMinimumPatternEventCount"), 2);

  v24 = objc_opt_new(NSMutableArray);
  v27 = 0u;
  v28 = 0u;
  v29 = 0u;
  v30 = 0u;
  v7 = v4;
  v8 = objc_msgSend(v7, "countByEnumeratingWithState:objects:count:", &v27, v37, 16);
  if (v8)
  {
    v10 = v8;
    v11 = *(_QWORD *)v28;
    *(_QWORD *)&v9 = 136315650;
    v23 = v9;
    do
    {
      for (i = 0; i != v10; i = (char *)i + 1)
      {
        if (*(_QWORD *)v28 != v11)
          objc_enumerationMutation(v7);
        v13 = *(void **)(*((_QWORD *)&v27 + 1) + 8 * (_QWORD)i);
        eventToPatternEventMap = self->_eventToPatternEventMap;
        v15 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v13, "eventIdentifier", v23));
        v16 = (void *)objc_claimAutoreleasedReturnValue(-[NSMutableDictionary objectForKey:](eventToPatternEventMap, "objectForKey:", v15));

        if ((unint64_t)objc_msgSend(v16, "count") >= v6)
        {
          v17 = objc_opt_new(NSMutableSet);
          v25[0] = _NSConcreteStackBlock;
          v25[1] = 3221225472;
          v25[2] = __64__MOConversationAnnotationManager__findEventsWithPatternEvents___block_invoke;
          v25[3] = &unk_1002B4AF0;
          v18 = v17;
          v26 = v18;
          objc_msgSend(v16, "enumerateObjectsUsingBlock:", v25);
          if (v6 == 1)
            goto LABEL_14;
          if (-[NSMutableSet containsObject:](v18, "containsObject:", &off_1002DAD90)
            && ((-[NSMutableSet containsObject:](v18, "containsObject:", &off_1002DADA8) & 1) != 0
             || -[NSMutableSet containsObject:](v18, "containsObject:", &off_1002DADC0)))
          {
            os_log = _mo_log_facility_get_os_log(&MOLogFacilityEventBundleManager);
            v20 = objc_claimAutoreleasedReturnValue(os_log);
            if (os_log_type_enabled(v20, OS_LOG_TYPE_INFO))
            {
              v21 = objc_msgSend(v16, "count");
              *(_DWORD *)buf = v23;
              v32 = "-[MOConversationAnnotationManager _findEventsWithPatternEvents:]";
              v33 = 2112;
              v34 = v13;
              v35 = 2048;
              v36 = v21;
              _os_log_impl((void *)&_mh_execute_header, v20, OS_LOG_TYPE_INFO, "%s, found event, %@, pattern event count, %lu", buf, 0x20u);
            }

LABEL_14:
            -[NSMutableArray addObject:](v24, "addObject:", v13);
          }

        }
      }
      v10 = objc_msgSend(v7, "countByEnumeratingWithState:objects:count:", &v27, v37, 16);
    }
    while (v10);
  }

  return v24;
}

void __64__MOConversationAnnotationManager__findEventsWithPatternEvents___block_invoke(uint64_t a1, void *a2)
{
  void *v2;
  void *v3;
  id v4;

  v2 = *(void **)(a1 + 32);
  v4 = (id)objc_claimAutoreleasedReturnValue(objc_msgSend(a2, "patterns"));
  v3 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v4, "objectForKeyedSubscript:", CFSTR("kEventPatternAnomalyFeatureType")));
  objc_msgSend(v2, "addObject:", v3);

}

- (id)_annotateEvents:(id)a3 significantContact:(id)a4 type:(unint64_t)a5
{
  id v7;
  id v8;
  void *v9;
  void *v10;
  MOEventBundle *v11;
  void *v12;
  void *v13;
  MOEventBundle *v14;
  id v15;
  id v16;
  uint64_t v17;
  void *i;
  void *v19;
  NSMutableDictionary *eventToPatternEventMap;
  void *v21;
  void *v22;
  id os_log;
  NSObject *v24;
  void *v25;
  NSMutableDictionary *eventToContextEventMap;
  void *v27;
  void *v28;
  id v29;
  NSObject *v30;
  void *v31;
  void *v32;
  id v33;
  void *v34;
  id v35;
  void *v36;
  void *v37;
  void *v38;
  void *v39;
  void *v40;
  void *v41;
  void *v42;
  void *v43;
  void *v44;
  unint64_t v45;
  unint64_t v46;
  void *v47;
  double v48;
  double v49;
  void *v50;
  void *v51;
  void *v52;
  void *v53;
  void *v54;
  void *v55;
  void *v56;
  MOPerson *v57;
  void *v58;
  void *v59;
  id v60;
  NSObject *v61;
  id v62;
  void *v63;
  NSMutableDictionary *v64;
  void *v65;
  id v66;
  void *v67;
  NSMutableDictionary *stats;
  void *v69;
  void *v70;
  void *v71;
  void *v72;
  double v73;
  unint64_t v74;
  NSMutableDictionary *v75;
  void *v76;
  void *v77;
  void *v78;
  void *v79;
  double v80;
  unint64_t v81;
  BOOL v82;
  void *v83;
  int v84;
  int v85;
  id j;
  void *v87;
  id v88;
  NSObject *v89;
  void *v90;
  void *v91;
  id v92;
  id v93;
  uint64_t v94;
  void *k;
  void *v96;
  id v97;
  NSObject *v98;
  void *v99;
  void *v100;
  id v101;
  void *v102;
  void *v103;
  void *v104;
  id v105;
  id v106;
  uint64_t v107;
  char *v108;
  void *m;
  void *v110;
  void *v111;
  void *v112;
  void *v113;
  id v114;
  id v115;
  NSObject *v116;
  const __CFString *v117;
  const __CFString *v118;
  MOEventBundle *v119;
  NSMutableDictionary *v120;
  const __CFString *v121;
  NSMutableDictionary *v122;
  void *v123;
  void *v124;
  void *v125;
  void *v126;
  double v127;
  double v128;
  void *v129;
  NSMutableDictionary *v130;
  void *v131;
  void *v132;
  void *v133;
  void *v134;
  double v135;
  double v136;
  void *v137;
  NSMutableDictionary *v138;
  void *v139;
  void *v140;
  void *v141;
  void *v142;
  double v143;
  unint64_t v144;
  NSMutableDictionary *v145;
  void *v146;
  void *v147;
  void *v148;
  void *v149;
  double v150;
  double v151;
  void *v152;
  id v153;
  NSObject *v154;
  NSObject *v155;
  NSMutableDictionary *v156;
  void *v157;
  void *v158;
  void *v159;
  void *v160;
  double v161;
  unint64_t v162;
  void *v163;
  __CFString **v164;
  NSMutableDictionary *v165;
  void *v166;
  void *v167;
  void *v168;
  void *v169;
  double v170;
  unint64_t v171;
  void *v172;
  void *v173;
  void *v174;
  id v175;
  NSObject *v176;
  void *v177;
  id v178;
  void *v179;
  id v180;
  id v181;
  uint64_t v182;
  void *n;
  void *v184;
  id v185;
  NSObject *v186;
  void *v187;
  void *v188;
  void *v189;
  id v190;
  void *v191;
  signed int v192;
  void *v193;
  double v194;
  float v195;
  float v196;
  void *v197;
  double v198;
  float v199;
  float v200;
  void *v201;
  double v202;
  float v203;
  float v204;
  void *v205;
  double v206;
  float v207;
  float v208;
  void *v209;
  double v210;
  float v211;
  float v212;
  void *v213;
  double v214;
  float v215;
  float v216;
  NSMutableDictionary *v217;
  void *v218;
  void *v219;
  void *v220;
  void *v221;
  double v222;
  double v223;
  NSMutableDictionary *v224;
  void *v225;
  void *v226;
  void *v227;
  void *v228;
  double v229;
  unint64_t v230;
  void *v231;
  void *v232;
  double v233;
  double v234;
  void *v235;
  id v236;
  id v237;
  id v238;
  double v239;
  double v240;
  uint64_t v241;
  void *ii;
  void *v243;
  void *v244;
  void *v245;
  unsigned int v246;
  double v247;
  void *v248;
  void *v249;
  double v250;
  double v251;
  id v252;
  NSObject *v253;
  unint64_t v254;
  id v255;
  id v257;
  id v258;
  unint64_t v259;
  NSMutableDictionary *v260;
  id v261;
  void *v262;
  MOEventBundle *v263;
  id v264;
  id obj;
  uint64_t v266;
  id v267;
  void *v268;
  char *v269;
  int v270;
  void *v272;
  void *v273;
  void *v274;
  void *v275;
  void *v276;
  void *v277;
  void *v278;
  int v279[2];
  void *v280;
  void *v281;
  void *v282;
  __int128 v283;
  __int128 v284;
  __int128 v285;
  __int128 v286;
  __int128 v287;
  __int128 v288;
  __int128 v289;
  __int128 v290;
  __int128 v291;
  __int128 v292;
  __int128 v293;
  __int128 v294;
  __int128 v295;
  __int128 v296;
  __int128 v297;
  __int128 v298;
  __int128 v299;
  __int128 v300;
  __int128 v301;
  __int128 v302;
  uint8_t v303;
  char v304[15];
  __int128 v305;
  __int128 v306;
  __int128 v307;
  __int128 v308;
  uint8_t buf[4];
  const char *v310;
  __int16 v311;
  unint64_t v312;
  __int16 v313;
  unint64_t v314;
  __int16 v315;
  id v316;
  __int16 v317;
  unint64_t v318;
  __int16 v319;
  unint64_t v320;
  _BYTE v321[128];
  _BYTE v322[128];
  _BYTE v323[128];
  _BYTE v324[128];
  _BYTE v325[128];
  void *v326;
  _BYTE v327[128];

  v7 = a3;
  v8 = a4;
  v9 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v8, "contact"));
  v10 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v9, "localizedFullName"));

  if (v10)
  {
    v257 = v8;
    v11 = [MOEventBundle alloc];
    v12 = (void *)objc_claimAutoreleasedReturnValue(+[NSUUID UUID](NSUUID, "UUID"));
    v13 = (void *)objc_claimAutoreleasedReturnValue(+[NSDate date](NSDate, "date"));
    v14 = -[MOEventBundle initWithBundleIdentifier:creationDate:](v11, "initWithBundleIdentifier:creationDate:", v12, v13);

    -[MOEventBundle setEvents:](v14, "setEvents:", v7);
    -[MOEventBundle setPropertiesBasedOnEvents](v14, "setPropertiesBasedOnEvents");
    v263 = v14;
    -[MOEventBundle setInterfaceType:](v14, "setInterfaceType:", 4);
    v259 = a5;
    if (a5 == 7)
      -[MOEventBundle setIncludedInSummaryBundleOnly:](v14, "setIncludedInSummaryBundleOnly:", 1);
    v268 = (void *)objc_claimAutoreleasedReturnValue(+[NSMutableArray arrayWithArray:](NSMutableArray, "arrayWithArray:", v7));
    v305 = 0u;
    v306 = 0u;
    v307 = 0u;
    v308 = 0u;
    v258 = v7;
    obj = v7;
    v15 = objc_msgSend(obj, "countByEnumeratingWithState:objects:count:", &v305, v327, 16);
    if (v15)
    {
      v16 = v15;
      v17 = *(_QWORD *)v306;
      do
      {
        for (i = 0; i != v16; i = (char *)i + 1)
        {
          if (*(_QWORD *)v306 != v17)
            objc_enumerationMutation(obj);
          v19 = *(void **)(*((_QWORD *)&v305 + 1) + 8 * (_QWORD)i);
          eventToPatternEventMap = self->_eventToPatternEventMap;
          v21 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v19, "eventIdentifier"));
          v22 = (void *)objc_claimAutoreleasedReturnValue(-[NSMutableDictionary objectForKey:](eventToPatternEventMap, "objectForKey:", v21));

          os_log = _mo_log_facility_get_os_log(&MOLogFacilityEventBundleManager);
          v24 = objc_claimAutoreleasedReturnValue(os_log);
          if (os_log_type_enabled(v24, OS_LOG_TYPE_DEBUG))
          {
            v32 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v19, "eventIdentifier"));
            v33 = objc_msgSend(v22, "count");
            *(_DWORD *)buf = 136315650;
            v310 = "-[MOConversationAnnotationManager _annotateEvents:significantContact:type:]";
            v311 = 2112;
            v312 = (unint64_t)v32;
            v313 = 2048;
            v314 = (unint64_t)v33;
            _os_log_debug_impl((void *)&_mh_execute_header, v24, OS_LOG_TYPE_DEBUG, "%s, event identifier, %@, pattern event count, %lu", buf, 0x20u);

          }
          if (objc_msgSend(v22, "count"))
          {
            v25 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v22, "allObjects"));
            objc_msgSend(v268, "addObjectsFromArray:", v25);

          }
          eventToContextEventMap = self->_eventToContextEventMap;
          v27 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v19, "eventIdentifier"));
          v28 = (void *)objc_claimAutoreleasedReturnValue(-[NSMutableDictionary objectForKey:](eventToContextEventMap, "objectForKey:", v27));

          v29 = _mo_log_facility_get_os_log(&MOLogFacilityEventBundleManager);
          v30 = objc_claimAutoreleasedReturnValue(v29);
          if (os_log_type_enabled(v30, OS_LOG_TYPE_DEBUG))
          {
            v34 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v19, "eventIdentifier"));
            v35 = objc_msgSend(v28, "count");
            *(_DWORD *)buf = 136315650;
            v310 = "-[MOConversationAnnotationManager _annotateEvents:significantContact:type:]";
            v311 = 2112;
            v312 = (unint64_t)v34;
            v313 = 2048;
            v314 = (unint64_t)v35;
            _os_log_debug_impl((void *)&_mh_execute_header, v30, OS_LOG_TYPE_DEBUG, "%s, event identifier, %@, context event count, %lu", buf, 0x20u);

          }
          if (objc_msgSend(v28, "count"))
          {
            v31 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v28, "allObjects"));
            objc_msgSend(v268, "addObjectsFromArray:", v31);

          }
        }
        v16 = objc_msgSend(obj, "countByEnumeratingWithState:objects:count:", &v305, v327, 16);
      }
      while (v16);
    }

    -[MOEventBundle setEvents:](v263, "setEvents:", v268);
    v36 = (void *)objc_claimAutoreleasedReturnValue(-[MOConversationAnnotationManager _actionForBundle:type:](self, "_actionForBundle:type:", v263, v259));
    -[MOEventBundle setAction:](v263, "setAction:", v36);

    v37 = (void *)objc_claimAutoreleasedReturnValue(-[MOEventBundle startDate](v263, "startDate"));
    v38 = (void *)objc_claimAutoreleasedReturnValue(-[MOAnnotationManager timeZoneManager](self, "timeZoneManager"));
    v39 = (void *)objc_claimAutoreleasedReturnValue(+[MOTime timeForDate:timeZoneManager:](MOTime, "timeForDate:timeZoneManager:", v37, v38));
    -[MOEventBundle setTime:](v263, "setTime:", v39);

    v40 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(obj, "firstObject"));
    v41 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v40, "interactionContacts"));
    v42 = (void *)objc_claimAutoreleasedReturnValue(+[NSSortDescriptor sortDescriptorWithKey:ascending:](NSSortDescriptor, "sortDescriptorWithKey:ascending:", CFSTR("score"), 0));
    v326 = v42;
    v43 = (void *)objc_claimAutoreleasedReturnValue(+[NSArray arrayWithObjects:count:](NSArray, "arrayWithObjects:count:", &v326, 1));
    v44 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v41, "sortedArrayUsingDescriptors:", v43));

    v261 = objc_msgSend(objc_alloc((Class)NSMutableArray), "initWithCapacity:", objc_msgSend(v44, "count"));
    v262 = v44;
    if (objc_msgSend(v44, "count"))
    {
      v45 = 0;
      do
      {
        if (v45)
        {
          if (v45 >= 4)
            v46 = v45 + 296;
          else
            v46 = v45 + 199;
        }
        else
        {
          v46 = 100;
        }
        v47 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v44, "objectAtIndexedSubscript:", v45));
        objc_msgSend(v47, "score");
        v49 = v48;

        v50 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v44, "objectAtIndexedSubscript:", v45));
        v51 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v50, "contact"));
        v52 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v51, "localizedFullName"));

        v53 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v44, "objectAtIndexedSubscript:", v45));
        v54 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v53, "contact"));
        v55 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v54, "identifier"));
        v56 = (void *)objc_claimAutoreleasedReturnValue(+[MOContactUtilities cNContactIdentifierFromPPContactIdentifier:](MOContactUtilities, "cNContactIdentifierFromPPContactIdentifier:", v55));

        if (v56)
        {
          v57 = -[MOPerson initWithLocalIdentifier:name:contactIdentifier:family:priorityScore:significanceScore:]([MOPerson alloc], "initWithLocalIdentifier:name:contactIdentifier:family:priorityScore:significanceScore:", 0, v52, v56, 0, (double)v46, v49);
          if (v57)
          {
            v58 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(obj, "firstObject"));
            v59 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v58, "eventIdentifier"));
            -[MOPerson setSourceEventIdentifier:](v57, "setSourceEventIdentifier:", v59);

            -[MOPerson setSourceEventAccessType:](v57, "setSourceEventAccessType:", 3);
            v60 = _mo_log_facility_get_os_log(&MOLogFacilityEventBundleManager);
            v61 = objc_claimAutoreleasedReturnValue(v60);
            if (os_log_type_enabled(v61, OS_LOG_TYPE_DEBUG))
            {
              v63 = (void *)objc_claimAutoreleasedReturnValue(-[MOEventBundle bundleIdentifier](v263, "bundleIdentifier"));
              *(_DWORD *)buf = 136315650;
              v310 = "-[MOConversationAnnotationManager _annotateEvents:significantContact:type:]";
              v311 = 2112;
              v312 = (unint64_t)v57;
              v313 = 2112;
              v314 = (unint64_t)v63;
              _os_log_debug_impl((void *)&_mh_execute_header, v61, OS_LOG_TYPE_DEBUG, "%s, person, %@, bundle identifier, %@", buf, 0x20u);

            }
            objc_msgSend(v261, "addObject:", v57);
          }
        }
        else
        {
          v62 = _mo_log_facility_get_os_log(&MOLogFacilityEventBundleManager);
          v57 = (MOPerson *)objc_claimAutoreleasedReturnValue(v62);
          if (os_log_type_enabled(&v57->super, OS_LOG_TYPE_ERROR))
            -[MOConversationAnnotationManager _annotateEvents:significantContact:type:].cold.2(&v303, v304, &v57->super);
        }
        v44 = v262;

        ++v45;
      }
      while (v45 < (unint64_t)objc_msgSend(v262, "count"));
    }
    -[MOEventBundle setPersons:](v263, "setPersons:", v261);
    -[MOEventBundle setBundleSuperType:](v263, "setBundleSuperType:", 3);
    -[MOEventBundle setBundleSubType:](v263, "setBundleSubType:", 301);
    v64 = objc_opt_new(NSMutableDictionary);
    v65 = (void *)objc_claimAutoreleasedReturnValue(-[MOEventBundle persons](v263, "persons"));
    v66 = objc_msgSend(v65, "count");

    if (v66 == (id)1)
      v67 = &__kCFBooleanFalse;
    else
      v67 = &__kCFBooleanTrue;
    -[NSMutableDictionary setObject:forKey:](v64, "setObject:forKey:", v67, CFSTR("isGroupConversation"));
    stats = self->_stats;
    v69 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(obj, "firstObject"));
    v70 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v69, "eventIdentifier"));
    v71 = (void *)objc_claimAutoreleasedReturnValue(-[NSMutableDictionary objectForKeyedSubscript:](stats, "objectForKeyedSubscript:", v70));
    v72 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v71, "objectForKey:", CFSTR("callCount")));
    objc_msgSend(v72, "doubleValue");
    v74 = (unint64_t)v73;

    v75 = self->_stats;
    v76 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(obj, "firstObject"));
    v77 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v76, "eventIdentifier"));
    v78 = (void *)objc_claimAutoreleasedReturnValue(-[NSMutableDictionary objectForKeyedSubscript:](v75, "objectForKeyedSubscript:", v77));
    v79 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v78, "objectForKey:", CFSTR("messageCount")));
    objc_msgSend(v79, "doubleValue");
    v81 = (unint64_t)v80;

    if (v81)
      v82 = v74 == 0;
    else
      v82 = 1;
    if (v82)
      v83 = &__kCFBooleanFalse;
    else
      v83 = &__kCFBooleanTrue;
    -[NSMutableDictionary setObject:forKey:](v64, "setObject:forKey:", v83, CFSTR("multipleInteractionTypes"));
    -[NSMutableDictionary setObject:forKey:](v64, "setObject:forKey:", &off_1002DCEC8);
    v260 = v64;
    -[NSMutableDictionary setObject:forKey:](v64, "setObject:forKey:", &off_1002DCEC8);
    v301 = 0u;
    v302 = 0u;
    v299 = 0u;
    v300 = 0u;
    v264 = (id)objc_claimAutoreleasedReturnValue(-[MOEventBundle events](v263, "events"));
    v267 = objc_msgSend(v264, "countByEnumeratingWithState:objects:count:", &v299, v325, 16);
    v84 = 0;
    v85 = 0;
    if (v267)
    {
      v266 = *(_QWORD *)v300;
      do
      {
        for (j = 0; j != v267; j = v108 + 1)
        {
          if (*(_QWORD *)v300 != v266)
            objc_enumerationMutation(v264);
          v270 = v85;
          v269 = (char *)j;
          v87 = *(void **)(*((_QWORD *)&v299 + 1) + 8 * (_QWORD)j);
          v88 = _mo_log_facility_get_os_log(&MOLogFacilityEventBundleManager);
          v89 = objc_claimAutoreleasedReturnValue(v88);
          if (os_log_type_enabled(v89, OS_LOG_TYPE_DEBUG))
          {
            v111 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v87, "eventIdentifier"));
            v112 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v87, "significantContactEvent"));
            v113 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v112, "contactClassificationMap"));
            v114 = objc_msgSend(v113, "count");
            *(_DWORD *)buf = 136315650;
            v310 = "-[MOConversationAnnotationManager _annotateEvents:significantContact:type:]";
            v311 = 2112;
            v312 = (unint64_t)v111;
            v313 = 2048;
            v314 = (unint64_t)v114;
            _os_log_debug_impl((void *)&_mh_execute_header, v89, OS_LOG_TYPE_DEBUG, "%s, event identifier, %@, contactClassificationMap size, %lu", buf, 0x20u);

          }
          v297 = 0u;
          v298 = 0u;
          v295 = 0u;
          v296 = 0u;
          v90 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v87, "significantContactEvent"));
          v91 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v90, "contactClassificationMap"));

          v92 = objc_msgSend(v91, "countByEnumeratingWithState:objects:count:", &v295, v324, 16);
          if (v92)
          {
            v93 = v92;
            v94 = *(_QWORD *)v296;
            v272 = v87;
            do
            {
              for (k = 0; k != v93; k = (char *)k + 1)
              {
                if (*(_QWORD *)v296 != v94)
                  objc_enumerationMutation(v91);
                v96 = *(void **)(*((_QWORD *)&v295 + 1) + 8 * (_QWORD)k);
                v97 = _mo_log_facility_get_os_log(&MOLogFacilityEventBundleManager);
                v98 = objc_claimAutoreleasedReturnValue(v97);
                if (os_log_type_enabled(v98, OS_LOG_TYPE_DEBUG))
                {
                  v280 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v96, "contact"));
                  v273 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v280, "identifier"));
                  v277 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v96, "contact"));
                  v276 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v277, "localizedFullName"));
                  v99 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v276, "mask"));
                  v274 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v87, "significantContactEvent"));
                  v100 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v274, "contactClassificationMap"));
                  v101 = (id)objc_claimAutoreleasedReturnValue(objc_msgSend(v100, "objectForKey:", v96));
                  *(_DWORD *)buf = 136315906;
                  v310 = "-[MOConversationAnnotationManager _annotateEvents:significantContact:type:]";
                  v311 = 2112;
                  v312 = (unint64_t)v273;
                  v313 = 2112;
                  v314 = (unint64_t)v99;
                  v315 = 2112;
                  v316 = v101;
                  _os_log_debug_impl((void *)&_mh_execute_header, v98, OS_LOG_TYPE_DEBUG, "%s, contactID, %@, name, %@, classification, %@", buf, 0x2Au);

                  v87 = v272;
                }

              }
              v93 = objc_msgSend(v91, "countByEnumeratingWithState:objects:count:", &v295, v324, 16);
            }
            while (v93);
          }

          v293 = 0u;
          v294 = 0u;
          v291 = 0u;
          v292 = 0u;
          v102 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v87, "significantContactEvent"));
          v103 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v102, "contactClassificationMap"));
          v104 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v103, "allValues"));

          v105 = objc_msgSend(v104, "countByEnumeratingWithState:objects:count:", &v291, v323, 16);
          if (v105)
          {
            v106 = v105;
            v107 = *(_QWORD *)v292;
            v85 = v270;
            v108 = v269;
            do
            {
              for (m = 0; m != v106; m = (char *)m + 1)
              {
                if (*(_QWORD *)v292 != v107)
                  objc_enumerationMutation(v104);
                v110 = *(void **)(*((_QWORD *)&v291 + 1) + 8 * (_QWORD)m);
                if ((objc_msgSend(v110, "unsignedIntValue") & 8) != 0
                  || (objc_msgSend(v110, "unsignedIntValue") & 0x100000) != 0)
                {
                  v85 = 1;
                }
                v84 |= (objc_msgSend(v110, "unsignedIntValue") & 0x200000) >> 21;
              }
              v106 = objc_msgSend(v104, "countByEnumeratingWithState:objects:count:", &v291, v323, 16);
            }
            while (v106);
          }
          else
          {
            v85 = v270;
            v108 = v269;
          }

        }
        v267 = objc_msgSend(v264, "countByEnumeratingWithState:objects:count:", &v299, v325, 16);
      }
      while (v267);
    }

    v115 = _mo_log_facility_get_os_log(&MOLogFacilityEventBundleManager);
    v116 = objc_claimAutoreleasedReturnValue(v115);
    if (os_log_type_enabled(v116, OS_LOG_TYPE_INFO))
    {
      v117 = CFSTR("NO");
      if ((v85 & 1) != 0)
        v118 = CFSTR("YES");
      else
        v118 = CFSTR("NO");
      *(_DWORD *)buf = 136315650;
      v310 = "-[MOConversationAnnotationManager _annotateEvents:significantContact:type:]";
      v311 = 2112;
      if ((v84 & 1) != 0)
        v117 = CFSTR("YES");
      v312 = (unint64_t)v118;
      v313 = 2112;
      v314 = (unint64_t)v117;
      _os_log_impl((void *)&_mh_execute_header, v116, OS_LOG_TYPE_INFO, "%s, bundleHasFamilyOrFriendContact, %@, bundleHasCoworkerContact, %@", buf, 0x20u);
    }

    v119 = v263;
    v120 = v260;
    if (((v84 | v85) & 1) != 0)
    {
      if ((v84 & 1) != 0)
        v121 = CFSTR("isCoworkerContact");
      else
        v121 = CFSTR("isFamilyContact");
      -[NSMutableDictionary setObject:forKey:](v260, "setObject:forKey:", &off_1002DD138, v121);
    }
    if ((v259 & 0xFFFFFFFFFFFFFFFDLL) == 4)
    {
      v122 = self->_stats;
      v123 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(obj, "firstObject"));
      v124 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v123, "eventIdentifier"));
      v125 = (void *)objc_claimAutoreleasedReturnValue(-[NSMutableDictionary objectForKeyedSubscript:](v122, "objectForKeyedSubscript:", v124));
      v126 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v125, "objectForKey:", CFSTR("longestCallDuration")));
      objc_msgSend(v126, "doubleValue");
      v128 = v127;

      v129 = (void *)objc_claimAutoreleasedReturnValue(+[NSNumber numberWithDouble:](NSNumber, "numberWithDouble:", v128));
      -[NSMutableDictionary setObject:forKey:](v260, "setObject:forKey:", v129, CFSTR("callDuration"));

      v130 = self->_stats;
      v131 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(obj, "firstObject"));
      v132 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v131, "eventIdentifier"));
      v133 = (void *)objc_claimAutoreleasedReturnValue(-[NSMutableDictionary objectForKeyedSubscript:](v130, "objectForKeyedSubscript:", v132));
      v134 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v133, "objectForKey:", CFSTR("aggregatedCallDuration")));
      objc_msgSend(v134, "doubleValue");
      v136 = v135;

      v137 = (void *)objc_claimAutoreleasedReturnValue(+[NSNumber numberWithDouble:](NSNumber, "numberWithDouble:", v136));
      -[NSMutableDictionary setObject:forKey:](v260, "setObject:forKey:", v137, CFSTR("dailyAggregateCallDuration"));

      v138 = self->_stats;
      v139 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(obj, "firstObject"));
      v140 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v139, "eventIdentifier"));
      v141 = (void *)objc_claimAutoreleasedReturnValue(-[NSMutableDictionary objectForKeyedSubscript:](v138, "objectForKeyedSubscript:", v140));
      v142 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v141, "objectForKey:", CFSTR("callAtWork")));
      objc_msgSend(v142, "doubleValue");
      v144 = (unint64_t)v143;

      v145 = self->_stats;
      v146 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(obj, "firstObject"));
      v147 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v146, "eventIdentifier"));
      v148 = (void *)objc_claimAutoreleasedReturnValue(-[NSMutableDictionary objectForKeyedSubscript:](v145, "objectForKeyedSubscript:", v147));
      v149 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v148, "objectForKey:", CFSTR("callCountForDailyAggregate")));
      objc_msgSend(v149, "doubleValue");
      v151 = v150;

      if (v144 && v144 == (unint64_t)v151)
        v152 = &__kCFBooleanTrue;
      else
        v152 = &__kCFBooleanFalse;
      v120 = v260;
      -[NSMutableDictionary setObject:forKey:](v260, "setObject:forKey:", v152, CFSTR("contactLocationWork"));
      v119 = v263;
      goto LABEL_99;
    }
    if (v259 == 5)
    {
      v156 = self->_stats;
      v157 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(obj, "firstObject"));
      v158 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v157, "eventIdentifier"));
      v159 = (void *)objc_claimAutoreleasedReturnValue(-[NSMutableDictionary objectForKeyedSubscript:](v156, "objectForKeyedSubscript:", v158));
      v160 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v159, "objectForKey:", CFSTR("maxBurstLength")));
      objc_msgSend(v160, "doubleValue");
      v162 = (unint64_t)v161;

      v119 = v263;
      v120 = v260;

      v163 = (void *)objc_claimAutoreleasedReturnValue(+[NSNumber numberWithUnsignedInteger:](NSNumber, "numberWithUnsignedInteger:", v162));
      v164 = kMOEventBundleMetaDataForRankKeywordBurstyInteractionCount;
    }
    else
    {
      if (v259 != 7)
      {
LABEL_99:
        v172 = (void *)objc_claimAutoreleasedReturnValue(-[MOEventBundle metaDataForRank](v119, "metaDataForRank"));

        if (v172)
        {
          v173 = (void *)objc_claimAutoreleasedReturnValue(-[MOEventBundle metaDataForRank](v119, "metaDataForRank"));
          -[NSMutableDictionary addEntriesFromDictionary:](v120, "addEntriesFromDictionary:", v173);

        }
        v174 = (void *)objc_claimAutoreleasedReturnValue(+[NSNumber numberWithUnsignedInteger:](NSNumber, "numberWithUnsignedInteger:", v259));
        -[NSMutableDictionary setObject:forKey:](v120, "setObject:forKey:", v174, CFSTR("SigConType"));

        -[MOEventBundle setMetaDataForRank:](v119, "setMetaDataForRank:", v120);
        v175 = _mo_log_facility_get_os_log(&MOLogFacilityEventBundleManager);
        v176 = objc_claimAutoreleasedReturnValue(v175);
        if (os_log_type_enabled(v176, OS_LOG_TYPE_INFO))
        {
          v177 = (void *)objc_claimAutoreleasedReturnValue(-[MOEventBundle events](v119, "events"));
          v178 = objc_msgSend(v177, "count");
          *(_DWORD *)buf = 136315906;
          v310 = "-[MOConversationAnnotationManager _annotateEvents:significantContact:type:]";
          v311 = 2112;
          v312 = (unint64_t)v119;
          v313 = 2048;
          v314 = v259;
          v315 = 2048;
          v316 = v178;
          _os_log_impl((void *)&_mh_execute_header, v176, OS_LOG_TYPE_INFO, "%s, bundle, %@, type, %lu, event count, %lu", buf, 0x2Au);

        }
        v289 = 0u;
        v290 = 0u;
        v287 = 0u;
        v288 = 0u;
        v179 = (void *)objc_claimAutoreleasedReturnValue(-[MOEventBundle metaDataForRank](v119, "metaDataForRank"));
        v180 = objc_msgSend(v179, "countByEnumeratingWithState:objects:count:", &v287, v322, 16);
        if (v180)
        {
          v181 = v180;
          v182 = *(_QWORD *)v288;
          v275 = v179;
          do
          {
            for (n = 0; n != v181; n = (char *)n + 1)
            {
              if (*(_QWORD *)v288 != v182)
                objc_enumerationMutation(v179);
              v184 = *(void **)(*((_QWORD *)&v287 + 1) + 8 * (_QWORD)n);
              v185 = _mo_log_facility_get_os_log(&MOLogFacilityEventBundleManager);
              v186 = objc_claimAutoreleasedReturnValue(v185);
              if (os_log_type_enabled(v186, OS_LOG_TYPE_DEBUG))
              {
                v187 = (void *)objc_claimAutoreleasedReturnValue(-[MOEventBundle bundleIdentifier](v263, "bundleIdentifier"));
                v281 = (void *)objc_claimAutoreleasedReturnValue(-[MOEventBundle events](v263, "events"));
                v278 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v281, "firstObject"));
                v188 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v278, "eventIdentifier"));
                v189 = (void *)objc_claimAutoreleasedReturnValue(-[MOEventBundle metaDataForRank](v263, "metaDataForRank"));
                v190 = (id)objc_claimAutoreleasedReturnValue(objc_msgSend(v189, "objectForKey:", v184));
                *(_DWORD *)buf = 136316162;
                v310 = "-[MOConversationAnnotationManager _annotateEvents:significantContact:type:]";
                v311 = 2112;
                v312 = (unint64_t)v187;
                v313 = 2112;
                v314 = (unint64_t)v188;
                v315 = 2112;
                v316 = v184;
                v317 = 2112;
                v318 = (unint64_t)v190;
                _os_log_debug_impl((void *)&_mh_execute_header, v186, OS_LOG_TYPE_DEBUG, "%s, bundleID, %@, eventID, %@, metaDataForRank key, %@, metaDataForRank value, %@", buf, 0x34u);

                v179 = v275;
              }

            }
            v181 = objc_msgSend(v179, "countByEnumeratingWithState:objects:count:", &v287, v322, 16);
          }
          while (v181);
        }

        -[MOEventBundle setIsAggregatedAndSuppressed:](v263, "setIsAggregatedAndSuppressed:", 1);
        v191 = (void *)objc_claimAutoreleasedReturnValue(-[MOConversationAnnotationManager configurationManager](self, "configurationManager"));
        v192 = objc_msgSend(v191, "getIntegerSettingForKey:withFallback:", CFSTR("kMOConversationAnnotationManagerBundlingFilterNumPatternEvents"), 0);

        v193 = (void *)objc_claimAutoreleasedReturnValue(-[MOConversationAnnotationManager configurationManager](self, "configurationManager"));
        LODWORD(v194) = 0;
        objc_msgSend(v193, "getFloatSettingForKey:withFallback:", CFSTR("kMOConversationAnnotationManagerBundlingFilterMinContactScoreForCalls"), v194);
        v196 = v195;

        v197 = (void *)objc_claimAutoreleasedReturnValue(-[MOConversationAnnotationManager configurationManager](self, "configurationManager"));
        LODWORD(v198) = 1157840896;
        objc_msgSend(v197, "getFloatSettingForKey:withFallback:", CFSTR("kMOConversationAnnotationManagerBundlingFilterMinimumDurationForCalls"), v198);
        v200 = v199;

        v201 = (void *)objc_claimAutoreleasedReturnValue(-[MOConversationAnnotationManager configurationManager](self, "configurationManager"));
        LODWORD(v202) = 1058642330;
        objc_msgSend(v201, "getFloatSettingForKey:withFallback:", CFSTR("kMOConversationAnnotationManagerBundlingFilterMaximumContactScoreForBurstyTexts"), v202);
        v204 = v203;

        v205 = (void *)objc_claimAutoreleasedReturnValue(-[MOConversationAnnotationManager configurationManager](self, "configurationManager"));
        LODWORD(v206) = 10.0;
        objc_msgSend(v205, "getFloatSettingForKey:withFallback:", CFSTR("kMOConversationAnnotationManagerMinimumInteractionCount"), v206);
        v208 = v207;

        v209 = (void *)objc_claimAutoreleasedReturnValue(-[MOConversationAnnotationManager configurationManager](self, "configurationManager"));
        LODWORD(v210) = 6.0;
        objc_msgSend(v209, "getFloatSettingForKey:withFallback:", CFSTR("kMOConversationAnnotationManagerBundlingFilterMaximumBaselineValueForFrequencyAnomaly"), v210);
        v212 = v211;

        v213 = (void *)objc_claimAutoreleasedReturnValue(-[MOConversationAnnotationManager configurationManager](self, "configurationManager"));
        LODWORD(v214) = *(_DWORD *)"U0B@";
        objc_msgSend(v213, "getFloatSettingForKey:withFallback:", CFSTR("PD_SCF_TukeyFactorForExponentialDistributionOutlier"), v214);
        v216 = v215;

        v217 = self->_stats;
        v218 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(obj, "firstObject"));
        v219 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v218, "eventIdentifier"));
        v220 = (void *)objc_claimAutoreleasedReturnValue(-[NSMutableDictionary objectForKeyedSubscript:](v217, "objectForKeyedSubscript:", v219));
        v221 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v220, "objectForKey:", CFSTR("longestCallDuration")));
        objc_msgSend(v221, "doubleValue");
        v223 = v222;

        v224 = self->_stats;
        v225 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(obj, "firstObject"));
        v226 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v225, "eventIdentifier"));
        v227 = (void *)objc_claimAutoreleasedReturnValue(-[NSMutableDictionary objectForKeyedSubscript:](v224, "objectForKeyedSubscript:", v226));
        v228 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v227, "objectForKey:", CFSTR("maxBurstLength")));
        objc_msgSend(v228, "doubleValue");
        v230 = (unint64_t)v229;

        v231 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(obj, "firstObject"));
        v232 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v231, "interactionContactScore"));
        objc_msgSend(v232, "doubleValue");
        v234 = v233;

        v282 = (void *)objc_claimAutoreleasedReturnValue(+[NSPredicate predicateWithFormat:](NSPredicate, "predicateWithFormat:", CFSTR("%K = %lu AND %K = %lu"), CFSTR("category"), 10, CFSTR("provider"), 5));
        v235 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v268, "filteredArrayUsingPredicate:"));
        if ((unint64_t)objc_msgSend(v235, "count") > v192
          || v223 > v200 && v234 > v196
          || (double)v230 > v208 && v234 < v204)
        {
          -[MOEventBundle setIsAggregatedAndSuppressed:](v263, "setIsAggregatedAndSuppressed:", 0);
        }
        *(_QWORD *)v279 = v230;
        v285 = 0u;
        v286 = 0u;
        v283 = 0u;
        v284 = 0u;
        v236 = v235;
        v237 = objc_msgSend(v236, "countByEnumeratingWithState:objects:count:", &v283, v321, 16);
        if (v237)
        {
          v238 = v237;
          v239 = v212;
          v240 = v216;
          v241 = *(_QWORD *)v284;
          do
          {
            for (ii = 0; ii != v238; ii = (char *)ii + 1)
            {
              if (*(_QWORD *)v284 != v241)
                objc_enumerationMutation(v236);
              v243 = *(void **)(*((_QWORD *)&v283 + 1) + 8 * (_QWORD)ii);
              v244 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v243, "patterns"));
              v245 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v244, "objectForKeyedSubscript:", CFSTR("kEventPatternAnomalyFeatureType")));
              v246 = objc_msgSend(v245, "intValue");

              if (v246 == 2)
              {
                v248 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v243, "patterns"));
                v249 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v248, "objectForKeyedSubscript:", CFSTR("kEventPatternThresholdValue")));
                objc_msgSend(v249, "doubleValue");
                v251 = v250;

                v247 = v251 / v240;
                if (v251 / v240 > v239)
                  -[MOEventBundle setIsAggregatedAndSuppressed:](v263, "setIsAggregatedAndSuppressed:", 1, v247);
              }
            }
            v238 = objc_msgSend(v236, "countByEnumeratingWithState:objects:count:", &v283, v321, 16, v247);
          }
          while (v238);
        }

        v252 = _mo_log_facility_get_os_log(&MOLogFacilityEventBundleManager);
        v253 = objc_claimAutoreleasedReturnValue(v252);
        if (os_log_type_enabled(v253, OS_LOG_TYPE_INFO))
        {
          v254 = -[MOEventBundle isAggregatedAndSuppressed](v263, "isAggregatedAndSuppressed");
          v255 = objc_msgSend(v236, "count");
          *(_DWORD *)buf = 136316418;
          v310 = "-[MOConversationAnnotationManager _annotateEvents:significantContact:type:]";
          v311 = 2048;
          v312 = v254;
          v313 = 2048;
          v314 = (unint64_t)v255;
          v315 = 2048;
          v316 = *(id *)v279;
          v317 = 2048;
          v318 = (unint64_t)v234;
          v319 = 2048;
          v320 = (unint64_t)v223;
          _os_log_impl((void *)&_mh_execute_header, v253, OS_LOG_TYPE_INFO, "%s, isAggregatedAndSuppressed, %lu, num. patterns, %lu, burstyInteractionCount, %lu, contactScore, %lu, call duration, %lu", buf, 0x3Eu);
        }

        v154 = v263;
        v155 = v154;
        v8 = v257;
        v7 = v258;
        goto LABEL_131;
      }
      v165 = self->_stats;
      v166 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(obj, "firstObject"));
      v167 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v166, "eventIdentifier"));
      v168 = (void *)objc_claimAutoreleasedReturnValue(-[NSMutableDictionary objectForKeyedSubscript:](v165, "objectForKeyedSubscript:", v167));
      v169 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v168, "objectForKey:", CFSTR("outgoingMessageBurstCount")));
      objc_msgSend(v169, "doubleValue");
      v171 = (unint64_t)v170;

      v119 = v263;
      v120 = v260;

      v163 = (void *)objc_claimAutoreleasedReturnValue(+[NSNumber numberWithUnsignedInteger:](NSNumber, "numberWithUnsignedInteger:", v171));
      v164 = kMOEventBundleMetaDataForRankKeywordBurstyOutgoingInteractionCount;
    }
    -[NSMutableDictionary setObject:forKey:](v120, "setObject:forKey:", v163, *v164);

    goto LABEL_99;
  }
  v153 = _mo_log_facility_get_os_log(&MOLogFacilityEventBundleManager);
  v154 = objc_claimAutoreleasedReturnValue(v153);
  if (os_log_type_enabled(v154, OS_LOG_TYPE_ERROR))
    -[MOConversationAnnotationManager _annotateEvents:significantContact:type:].cold.1(v7, (uint64_t)v8, v154);
  v155 = 0;
LABEL_131:

  return v155;
}

- (unint64_t)_outgoingMessageBurstCount:(id)a3 bundleIdPrefix:(id)a4
{
  id v6;
  void *v7;
  double v8;
  double v9;
  void *v10;
  id v11;
  id v12;
  id v13;
  void *v14;
  uint64_t v15;
  unint64_t v16;
  void *i;
  void *v18;
  void *v19;
  unsigned int v20;
  void *v21;
  double v22;
  double v23;
  uint64_t v24;
  uint64_t v25;
  uint64_t v26;
  unint64_t v27;
  unint64_t v29;
  unint64_t v30;
  id v31;
  __int128 v32;
  __int128 v33;
  __int128 v34;
  __int128 v35;
  _BYTE v36[128];

  v6 = a3;
  v31 = a4;
  v7 = (void *)objc_claimAutoreleasedReturnValue(-[MOConversationAnnotationManager configurationManager](self, "configurationManager"));
  objc_msgSend(v7, "getDoubleSettingForKey:withFallback:", CFSTR("kMOConversationAnnotationManagerMaximumOutgoingInteractionInterval"), 600.0);
  v9 = v8;

  v10 = (void *)objc_claimAutoreleasedReturnValue(-[MOConversationAnnotationManager configurationManager](self, "configurationManager"));
  v29 = (int)objc_msgSend(v10, "getIntegerSettingForKey:withFallback:", CFSTR("kMOConversationAnnotationManagerMinimumOutgoingInteractionCount"), 5);

  v34 = 0u;
  v35 = 0u;
  v32 = 0u;
  v33 = 0u;
  v11 = v6;
  v12 = objc_msgSend(v11, "countByEnumeratingWithState:objects:count:", &v32, v36, 16);
  if (v12)
  {
    v13 = v12;
    v14 = 0;
    v30 = 0;
    v15 = *(_QWORD *)v33;
    v16 = 1;
    do
    {
      for (i = 0; i != v13; i = (char *)i + 1)
      {
        if (*(_QWORD *)v33 != v15)
          objc_enumerationMutation(v11);
        v18 = *(void **)(*((_QWORD *)&v32 + 1) + 8 * (_QWORD)i);
        if (-[MOConversationAnnotationManager _messageInteraction:](self, "_messageInteraction:", v18))
        {
          v19 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v18, "bundleId"));
          v20 = objc_msgSend(v19, "hasPrefix:", v31);

          if (v20)
          {
            if (v14)
            {
              v21 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v18, "startDate"));
              objc_msgSend(v21, "timeIntervalSinceDate:", v14);
              v23 = v22;

              v24 = 1;
              if (v23 < v9)
                v24 = v16 + 1;
              v25 = v16 >= v29 && v23 >= v9;
              v30 += v25;
              v16 = v24;
            }
            v26 = objc_claimAutoreleasedReturnValue(objc_msgSend(v18, "endDate"));

            v14 = (void *)v26;
          }
        }
      }
      v13 = objc_msgSend(v11, "countByEnumeratingWithState:objects:count:", &v32, v36, 16);
    }
    while (v13);
  }
  else
  {
    v14 = 0;
    v30 = 0;
    v16 = 1;
  }

  if (v16 < v29)
    v27 = v30;
  else
    v27 = v30 + 1;

  return v27;
}

- (void)_calculateEventStats:(id)a3
{
  id v4;
  void *v5;
  double v6;
  double v7;
  void *v8;
  signed int v9;
  __int128 v10;
  double v11;
  uint64_t v12;
  void *v13;
  void *v14;
  void *v15;
  void *v16;
  id v17;
  id v18;
  double v19;
  id v20;
  unint64_t v21;
  uint64_t v22;
  char *v23;
  uint64_t v24;
  double v25;
  double v26;
  void *v27;
  void *v28;
  uint64_t v29;
  void *v30;
  char *v31;
  double v32;
  void *v33;
  void *v34;
  void *v35;
  void *v36;
  double v37;
  double v38;
  id v39;
  void *v40;
  void *v41;
  double v42;
  id os_log;
  NSObject *v44;
  unint64_t v45;
  void *v46;
  uint64_t v47;
  void *v48;
  void *v49;
  void *v50;
  void *v51;
  double v52;
  double v53;
  id v54;
  void *v55;
  id v56;
  uint64_t v57;
  char *v58;
  unint64_t v59;
  id v60;
  char *v61;
  id v62;
  unint64_t v63;
  _BOOL8 v64;
  NSMutableDictionary *v65;
  void *v66;
  void *v67;
  void *v68;
  void *v69;
  void *v70;
  void *v71;
  void *v72;
  void *v73;
  void *v74;
  unint64_t v75;
  void *v76;
  id v77;
  NSObject *v78;
  void *v79;
  void *v80;
  uint64_t v81;
  double v82;
  void *v83;
  NSMutableDictionary *stats;
  void *v85;
  __int128 v86;
  void *v87;
  void *v88;
  uint64_t v89;
  id v90;
  void *v91;
  uint64_t v92;
  id obj;
  void *v94;
  char *v95;
  uint64_t v96;
  id v97;
  _BOOL8 v98;
  id v99;
  unint64_t v100;
  id v101;
  char *v102;
  void *v103;
  uint64_t v104;
  void *v105;
  MOConversationAnnotationManager *v106;
  __int128 v107;
  __int128 v108;
  __int128 v109;
  __int128 v110;
  __int128 v111;
  __int128 v112;
  __int128 v113;
  __int128 v114;
  uint8_t buf[4];
  const char *v116;
  __int16 v117;
  void *v118;
  __int16 v119;
  char *v120;
  __int16 v121;
  char *v122;
  __int16 v123;
  double v124;
  __int16 v125;
  unint64_t v126;
  __int16 v127;
  double v128;
  __int16 v129;
  double v130;
  __int16 v131;
  uint64_t v132;
  __int16 v133;
  uint64_t v134;
  __int16 v135;
  unint64_t v136;
  __int16 v137;
  unint64_t v138;
  __int16 v139;
  uint64_t v140;
  _BYTE v141[128];
  void *v142;
  _BYTE v143[128];

  v4 = a3;
  v5 = (void *)objc_claimAutoreleasedReturnValue(-[MOConversationAnnotationManager configurationManager](self, "configurationManager"));
  objc_msgSend(v5, "getDoubleSettingForKey:withFallback:", CFSTR("kMOConversationAnnotationManagerMaximumInteractionInterval"), 300.0);
  v7 = v6;

  v8 = (void *)objc_claimAutoreleasedReturnValue(-[MOConversationAnnotationManager configurationManager](self, "configurationManager"));
  v9 = objc_msgSend(v8, "getIntegerSettingForKey:withFallback:", CFSTR("kMOConversationAnnotationManagerMinimumDurationSingleCall"), 300);

  v113 = 0u;
  v114 = 0u;
  v111 = 0u;
  v112 = 0u;
  obj = v4;
  v90 = objc_msgSend(obj, "countByEnumeratingWithState:objects:count:", &v111, v143, 16);
  if (v90)
  {
    v89 = *(_QWORD *)v112;
    v11 = (double)(unint64_t)v9;
    *(_QWORD *)&v10 = 136318210;
    v86 = v10;
    v106 = self;
    do
    {
      v12 = 0;
      do
      {
        if (*(_QWORD *)v112 != v89)
          objc_enumerationMutation(obj);
        v91 = *(void **)(*((_QWORD *)&v111 + 1) + 8 * v12);
        v92 = v12;
        v13 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v91, "interactions", v86));
        v14 = (void *)objc_claimAutoreleasedReturnValue(+[NSSortDescriptor sortDescriptorWithKey:ascending:](NSSortDescriptor, "sortDescriptorWithKey:ascending:", CFSTR("startDate"), 1));
        v142 = v14;
        v15 = (void *)objc_claimAutoreleasedReturnValue(+[NSArray arrayWithObjects:count:](NSArray, "arrayWithObjects:count:", &v142, 1));
        v16 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v13, "sortedArrayUsingDescriptors:", v15));

        v109 = 0u;
        v110 = 0u;
        v107 = 0u;
        v108 = 0u;
        v99 = v16;
        v17 = objc_msgSend(v99, "countByEnumeratingWithState:objects:count:", &v107, v141, 16);
        if (!v17)
        {
          v19 = 0.0;
          v94 = 0;
          v95 = 0;
          v20 = 0;
          v101 = 0;
          v21 = 0;
          v96 = 0;
          v22 = 0;
          v23 = 0;
          v25 = 0.0;
          v26 = 0.0;
          goto LABEL_70;
        }
        v18 = v17;
        v19 = 0.0;
        v94 = 0;
        v95 = 0;
        v20 = 0;
        v101 = 0;
        v102 = 0;
        v21 = 0;
        v100 = 0;
        v96 = 0;
        v22 = 0;
        v23 = 0;
        v24 = *(_QWORD *)v108;
        v25 = 0.0;
        v26 = 0.0;
        do
        {
          v27 = 0;
          v97 = v18;
          do
          {
            if (*(_QWORD *)v108 != v24)
              objc_enumerationMutation(v99);
            v28 = *(void **)(*((_QWORD *)&v107 + 1) + 8 * (_QWORD)v27);
            if (-[MOConversationAnnotationManager _callLikeInteraction:](self, "_callLikeInteraction:", v28)
              || -[MOConversationAnnotationManager _messageInteraction:](self, "_messageInteraction:", v28))
            {
              v29 = objc_claimAutoreleasedReturnValue(objc_msgSend(v28, "startDate"));
              if (!v29)
              {
                self = v106;
                goto LABEL_64;
              }
              v30 = (void *)v29;
              v31 = v23;
              v32 = v19;
              v33 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v28, "endDate"));

              if (!v33)
              {
                v19 = v32;
                v23 = v31;
                self = v106;
                v18 = v97;
                goto LABEL_64;
              }
              v104 = v22;
              v34 = v101;
              if (v101)
              {
                v35 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v28, "startDate"));
                v36 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v101, "endDate"));
                objc_msgSend(v35, "timeIntervalSinceDate:", v36);
                v38 = v37;

                if ((-[MOConversationAnnotationManager _callLikeInteraction:](v106, "_callLikeInteraction:", v101)
                   || objc_msgSend(v101, "direction") == (id)1 && !objc_msgSend(v28, "direction")
                   || !objc_msgSend(v101, "direction") && objc_msgSend(v28, "direction") == (id)1)
                  && v38 < v7)
                {
                  ++v100;
                  v39 = v28;

                  v34 = v39;
                }
                v19 = v32;
                if (v38 <= v7)
                {
                  v101 = v34;
                }
                else
                {

                  v100 = 0;
                  v101 = 0;
                }
                goto LABEL_41;
              }
              if (v20)
              {
                v40 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v28, "startDate"));
                v41 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v20, "endDate"));
                objc_msgSend(v40, "timeIntervalSinceDate:", v41);
                v38 = v42;

                if (-[MOConversationAnnotationManager _callLikeInteraction:](v106, "_callLikeInteraction:", v20)
                  || objc_msgSend(v20, "direction") == (id)1 && !objc_msgSend(v28, "direction"))
                {
                  v19 = v32;
                  if (v38 >= v7)
                    goto LABEL_35;
                }
                else
                {
                  v19 = v32;
                  if (objc_msgSend(v20, "direction"))
                  {
LABEL_35:
                    v101 = 0;
                    goto LABEL_41;
                  }
                  if (objc_msgSend(v28, "direction") != (id)1 || v38 >= v7)
                  {
                    v101 = 0;
                    goto LABEL_41;
                  }
                }
                v100 = 2;
                v101 = v28;
                goto LABEL_41;
              }
              v101 = 0;
              v38 = 0.0;
              v19 = v32;
LABEL_41:
              os_log = _mo_log_facility_get_os_log(&MOLogFacilityEventBundleManager);
              v44 = objc_claimAutoreleasedReturnValue(os_log);
              if (os_log_type_enabled(v44, OS_LOG_TYPE_DEBUG))
              {
                v58 = (char *)objc_claimAutoreleasedReturnValue(objc_msgSend(v28, "startDate"));
                v59 = v21;
                v60 = v20;
                v61 = (char *)objc_claimAutoreleasedReturnValue(objc_msgSend(v28, "endDate"));
                *(_DWORD *)buf = 136316418;
                v116 = "-[MOConversationAnnotationManager _calculateEventStats:]";
                v117 = 2048;
                v118 = v102;
                v119 = 2112;
                v120 = v58;
                v121 = 2112;
                v122 = v61;
                v123 = 2048;
                v124 = v38;
                v125 = 2048;
                v126 = v100;
                _os_log_debug_impl((void *)&_mh_execute_header, v44, OS_LOG_TYPE_DEBUG, "%s, idx, %lu, startDate, %@, endDate, %@, interaction interval, %.1f, burstLength, %lu", buf, 0x3Eu);

                v20 = v60;
                v21 = v59;

                v19 = v32;
              }

              if (v21 <= v100)
                v45 = v100;
              else
                v45 = v21;
              self = v106;
              v46 = v20;
              if (-[MOConversationAnnotationManager _callLikeInteraction:](v106, "_callLikeInteraction:", v28))
              {
                v47 = objc_claimAutoreleasedReturnValue(objc_msgSend(v28, "startDate"));
                if (v47
                  && (v48 = (void *)v47,
                      v49 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v28, "endDate")),
                      v49,
                      v48,
                      v49))
                {
                  v50 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v28, "endDate"));
                  v51 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v28, "startDate"));
                  objc_msgSend(v50, "timeIntervalSinceDate:", v51);
                  v53 = v52;

                  self = v106;
                  if (v53 > v25)
                  {
                    v54 = v28;

                    v94 = v54;
                    v25 = v53;
                  }
                  v26 = v26 + v53;
                  ++v95;
                  v55 = (void *)objc_claimAutoreleasedReturnValue(-[MOConversationAnnotationManager _getWorkVisitEventsDuringCall:withCall:](v106, "_getWorkVisitEventsDuringCall:withCall:", obj, v28));
                  if (objc_msgSend(v55, "count"))
                    *(_QWORD *)&v19 = *(_QWORD *)&v32 + 1;
                  else
                    v19 = v32;
                  if (v53 <= v11)
                    v23 = v31;
                  else
                    v23 = v31 + 1;

                }
                else
                {
                  v23 = v31;
                  self = v106;
                }
              }
              else
              {
                v23 = v31;
                if (-[MOConversationAnnotationManager _messageInteraction:](v106, "_messageInteraction:", v28))
                {
                  ++v104;
                  v56 = objc_msgSend(v28, "direction");
                  v57 = v96;
                  if (v56 == (id)1)
                    v57 = v96 + 1;
                  v96 = v57;
                }
              }
              v18 = v97;
              v20 = v28;

              ++v102;
              v21 = v45;
              v22 = v104;
            }
LABEL_64:
            v27 = (char *)v27 + 1;
          }
          while (v18 != v27);
          v62 = objc_msgSend(v99, "countByEnumeratingWithState:objects:count:", &v107, v141, 16);
          v18 = v62;
        }
        while (v62);
LABEL_70:
        v105 = v20;

        v63 = -[MOConversationAnnotationManager _outgoingMessageBurstCount:bundleIdPrefix:](self, "_outgoingMessageBurstCount:bundleIdPrefix:", v99, CFSTR("net.whatsapp.WhatsApp"));
        v103 = (void *)objc_claimAutoreleasedReturnValue(-[MOConversationAnnotationManager _getWorkVisitEventsDuringCall:withCall:](self, "_getWorkVisitEventsDuringCall:withCall:", obj, v94));
        v64 = objc_msgSend(v103, "count") != 0;
        v65 = objc_opt_new(NSMutableDictionary);
        v66 = (void *)objc_claimAutoreleasedReturnValue(+[NSNumber numberWithUnsignedInteger:](NSNumber, "numberWithUnsignedInteger:", v23));
        -[NSMutableDictionary setObject:forKey:](v65, "setObject:forKey:", v66, CFSTR("callCount"));

        v67 = (void *)objc_claimAutoreleasedReturnValue(+[NSNumber numberWithDouble:](NSNumber, "numberWithDouble:", v26));
        -[NSMutableDictionary setObject:forKey:](v65, "setObject:forKey:", v67, CFSTR("aggregatedCallDuration"));

        v68 = (void *)objc_claimAutoreleasedReturnValue(+[NSNumber numberWithDouble:](NSNumber, "numberWithDouble:", v25));
        -[NSMutableDictionary setObject:forKey:](v65, "setObject:forKey:", v68, CFSTR("longestCallDuration"));

        v69 = (void *)objc_claimAutoreleasedReturnValue(+[NSNumber numberWithUnsignedInteger:](NSNumber, "numberWithUnsignedInteger:", v22));
        -[NSMutableDictionary setObject:forKey:](v65, "setObject:forKey:", v69, CFSTR("messageCount"));

        v70 = (void *)objc_claimAutoreleasedReturnValue(+[NSNumber numberWithUnsignedInteger:](NSNumber, "numberWithUnsignedInteger:", v96));
        -[NSMutableDictionary setObject:forKey:](v65, "setObject:forKey:", v70, CFSTR("outgoingMessageCount"));

        v71 = (void *)objc_claimAutoreleasedReturnValue(+[NSNumber numberWithUnsignedInteger:](NSNumber, "numberWithUnsignedInteger:", v21));
        -[NSMutableDictionary setObject:forKey:](v65, "setObject:forKey:", v71, CFSTR("maxBurstLength"));

        v72 = (void *)objc_claimAutoreleasedReturnValue(+[NSNumber numberWithUnsignedInteger:](NSNumber, "numberWithUnsignedInteger:", *(_QWORD *)&v19));
        -[NSMutableDictionary setObject:forKey:](v65, "setObject:forKey:", v72, CFSTR("callAtWork"));

        v73 = (void *)objc_claimAutoreleasedReturnValue(+[NSNumber numberWithUnsignedInteger:](NSNumber, "numberWithUnsignedInteger:", v95));
        -[NSMutableDictionary setObject:forKey:](v65, "setObject:forKey:", v73, CFSTR("callCountForDailyAggregate"));

        v98 = v64;
        v74 = (void *)objc_claimAutoreleasedReturnValue(+[NSNumber numberWithUnsignedInteger:](NSNumber, "numberWithUnsignedInteger:", v64));
        -[NSMutableDictionary setObject:forKey:](v65, "setObject:forKey:", v74, CFSTR("longCallAtWork"));

        v75 = v63;
        v76 = (void *)objc_claimAutoreleasedReturnValue(+[NSNumber numberWithUnsignedInteger:](NSNumber, "numberWithUnsignedInteger:", v63));
        -[NSMutableDictionary setObject:forKey:](v65, "setObject:forKey:", v76, CFSTR("outgoingMessageBurstCount"));

        v77 = _mo_log_facility_get_os_log(&MOLogFacilityEventBundleManager);
        v78 = objc_claimAutoreleasedReturnValue(v77);
        if (os_log_type_enabled(v78, OS_LOG_TYPE_INFO))
        {
          v79 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v91, "eventIdentifier"));
          v88 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v91, "interactionScoredContact"));
          v87 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v88, "contact"));
          v80 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v87, "localizedFullName"));
          v81 = objc_claimAutoreleasedReturnValue(objc_msgSend(v80, "mask"));
          v82 = v19;
          v83 = (void *)v81;
          *(_DWORD *)buf = v86;
          v116 = "-[MOConversationAnnotationManager _calculateEventStats:]";
          v117 = 2112;
          v118 = v79;
          v119 = 2048;
          v120 = v23;
          v121 = 2048;
          v122 = v95;
          v123 = 2048;
          v124 = v82;
          v125 = 2048;
          v126 = v98;
          v127 = 2048;
          v128 = v26;
          v129 = 2048;
          v130 = v25;
          v131 = 2048;
          v132 = v22;
          v133 = 2048;
          v134 = v96;
          v135 = 2048;
          v136 = v75;
          v137 = 2048;
          v138 = v21;
          v139 = 2112;
          v140 = v81;
          _os_log_impl((void *)&_mh_execute_header, v78, OS_LOG_TYPE_INFO, "%s, event ID, %@, call count, %lu, call count for daily agg., %lu, call at work, %lu, long call at work, %lu, aggregated call duration, %.1f, longest call duration, %.1f, message count, %lu, outgoing message count, %lu, outgoing message burst count, %lu, max burst length, %lu, contact, %@", buf, 0x84u);

        }
        self = v106;
        stats = v106->_stats;
        v85 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v91, "eventIdentifier"));
        -[NSMutableDictionary setObject:forKey:](stats, "setObject:forKey:", v65, v85);

        v12 = v92 + 1;
      }
      while ((id)(v92 + 1) != v90);
      v90 = objc_msgSend(obj, "countByEnumeratingWithState:objects:count:", &v111, v143, 16);
    }
    while (v90);
  }

}

- (void)_buildMappingFromBaseEvents:(id)a3 toPatternEvents:(id)a4
{
  id v5;
  id v6;
  NSMutableDictionary *v7;
  id v8;
  id v9;
  id v10;
  uint64_t v11;
  void *i;
  void *v13;
  void *v14;
  void *v15;
  void *v16;
  id v17;
  id v18;
  uint64_t v19;
  void *v20;
  void *v21;
  void *v22;
  void *v23;
  void *v24;
  void *v25;
  void *v26;
  void *v27;
  unsigned int v28;
  void *v30;
  void *v31;
  NSMutableDictionary *eventToPatternEventMap;
  NSMutableSet *v33;
  id os_log;
  NSObject *v35;
  void *v36;
  void *v37;
  id v38;
  id obj;
  _QWORD v41[5];
  __int128 v42;
  __int128 v43;
  __int128 v44;
  __int128 v45;
  __int128 v46;
  __int128 v47;
  __int128 v48;
  __int128 v49;
  uint8_t buf[4];
  const char *v51;
  __int16 v52;
  void *v53;
  __int16 v54;
  void *v55;
  _BYTE v56[128];
  _BYTE v57[128];

  v5 = a3;
  v6 = a4;
  v7 = objc_opt_new(NSMutableDictionary);
  v46 = 0u;
  v47 = 0u;
  v48 = 0u;
  v49 = 0u;
  v8 = v5;
  v9 = objc_msgSend(v8, "countByEnumeratingWithState:objects:count:", &v46, v57, 16);
  if (v9)
  {
    v10 = v9;
    v11 = *(_QWORD *)v47;
    do
    {
      for (i = 0; i != v10; i = (char *)i + 1)
      {
        if (*(_QWORD *)v47 != v11)
          objc_enumerationMutation(v8);
        v13 = *(void **)(*((_QWORD *)&v46 + 1) + 8 * (_QWORD)i);
        v14 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v13, "eventIdentifier"));
        v15 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v13, "eventIdentifier"));
        v16 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v15, "UUIDString"));
        -[NSMutableDictionary setObject:forKey:](v7, "setObject:forKey:", v14, v16);

      }
      v10 = objc_msgSend(v8, "countByEnumeratingWithState:objects:count:", &v46, v57, 16);
    }
    while (v10);
  }
  v37 = v8;

  v44 = 0u;
  v45 = 0u;
  v42 = 0u;
  v43 = 0u;
  obj = v6;
  v17 = objc_msgSend(obj, "countByEnumeratingWithState:objects:count:", &v42, v56, 16);
  if (v17)
  {
    v18 = v17;
    v19 = *(_QWORD *)v43;
    do
    {
      v20 = 0;
      v38 = v18;
      do
      {
        if (*(_QWORD *)v43 != v19)
          objc_enumerationMutation(obj);
        v21 = *(void **)(*((_QWORD *)&v42 + 1) + 8 * (_QWORD)v20);
        v22 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v21, "patterns"));
        v23 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v22, "objectForKeyedSubscript:", CFSTR("kEventPatternAnomalousEventIdentifier")));

        v24 = (void *)objc_claimAutoreleasedReturnValue(-[NSMutableDictionary objectForKey:](v7, "objectForKey:", v23));
        if (v24)
        {
          v25 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v21, "patterns"));
          v41[0] = _NSConcreteStackBlock;
          v41[1] = 3221225472;
          v41[2] = __79__MOConversationAnnotationManager__buildMappingFromBaseEvents_toPatternEvents___block_invoke;
          v41[3] = &unk_1002B4B18;
          v41[4] = v21;
          objc_msgSend(v25, "enumerateKeysAndObjectsUsingBlock:", v41);

          v26 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v21, "patterns"));
          v27 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v26, "objectForKeyedSubscript:", CFSTR("kEventPatternType")));
          v28 = objc_msgSend(v27, "intValue");

          if (!v28 && v23 != 0)
          {
            v30 = (void *)objc_claimAutoreleasedReturnValue(-[NSMutableDictionary objectForKey:](v7, "objectForKey:", v23));
            v31 = (void *)objc_claimAutoreleasedReturnValue(-[NSMutableDictionary objectForKey:](self->_eventToPatternEventMap, "objectForKey:", v30));

            if (!v31)
            {
              eventToPatternEventMap = self->_eventToPatternEventMap;
              v33 = objc_opt_new(NSMutableSet);
              -[NSMutableDictionary setObject:forKey:](eventToPatternEventMap, "setObject:forKey:", v33, v30);

            }
            os_log = _mo_log_facility_get_os_log(&MOLogFacilityEventBundleManager);
            v35 = objc_claimAutoreleasedReturnValue(os_log);
            if (os_log_type_enabled(v35, OS_LOG_TYPE_DEBUG))
            {
              *(_DWORD *)buf = 136315650;
              v51 = "-[MOConversationAnnotationManager _buildMappingFromBaseEvents:toPatternEvents:]";
              v52 = 2112;
              v53 = v21;
              v54 = 2112;
              v55 = v23;
              _os_log_debug_impl((void *)&_mh_execute_header, v35, OS_LOG_TYPE_DEBUG, "%s, pattern event, %@, base event identifier, %@", buf, 0x20u);
            }

            v36 = (void *)objc_claimAutoreleasedReturnValue(-[NSMutableDictionary objectForKey:](self->_eventToPatternEventMap, "objectForKey:", v30));
            objc_msgSend(v36, "addObject:", v21);

            v18 = v38;
          }
        }

        v20 = (char *)v20 + 1;
      }
      while (v18 != v20);
      v18 = objc_msgSend(obj, "countByEnumeratingWithState:objects:count:", &v42, v56, 16);
    }
    while (v18);
  }

  -[NSMutableDictionary enumerateKeysAndObjectsUsingBlock:](self->_eventToPatternEventMap, "enumerateKeysAndObjectsUsingBlock:", &__block_literal_global_191);
}

void __79__MOConversationAnnotationManager__buildMappingFromBaseEvents_toPatternEvents___block_invoke(uint64_t a1, void *a2, void *a3)
{
  id v5;
  id v6;
  id os_log;
  NSObject *v8;
  void *v9;
  int v10;
  const char *v11;
  __int16 v12;
  void *v13;
  __int16 v14;
  id v15;
  __int16 v16;
  id v17;

  v5 = a2;
  v6 = a3;
  os_log = _mo_log_facility_get_os_log(&MOLogFacilityEventBundleManager);
  v8 = objc_claimAutoreleasedReturnValue(os_log);
  if (os_log_type_enabled(v8, OS_LOG_TYPE_DEBUG))
  {
    v9 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(*(id *)(a1 + 32), "eventIdentifier"));
    v10 = 136315906;
    v11 = "-[MOConversationAnnotationManager _buildMappingFromBaseEvents:toPatternEvents:]_block_invoke";
    v12 = 2112;
    v13 = v9;
    v14 = 2112;
    v15 = v5;
    v16 = 2112;
    v17 = v6;
    _os_log_debug_impl((void *)&_mh_execute_header, v8, OS_LOG_TYPE_DEBUG, "%s, pattern event identifier, %@, key, %@, value, %@", (uint8_t *)&v10, 0x2Au);

  }
}

void __79__MOConversationAnnotationManager__buildMappingFromBaseEvents_toPatternEvents___block_invoke_189(id a1, NSUUID *a2, NSSet *a3, BOOL *a4)
{
  NSUUID *v5;
  NSSet *v6;
  id os_log;
  NSObject *v8;
  int v9;
  const char *v10;
  __int16 v11;
  NSUUID *v12;
  __int16 v13;
  NSUInteger v14;

  v5 = a2;
  v6 = a3;
  os_log = _mo_log_facility_get_os_log(&MOLogFacilityEventBundleManager);
  v8 = objc_claimAutoreleasedReturnValue(os_log);
  if (os_log_type_enabled(v8, OS_LOG_TYPE_INFO))
  {
    v9 = 136315650;
    v10 = "-[MOConversationAnnotationManager _buildMappingFromBaseEvents:toPatternEvents:]_block_invoke";
    v11 = 2112;
    v12 = v5;
    v13 = 2048;
    v14 = -[NSSet count](v6, "count");
    _os_log_impl((void *)&_mh_execute_header, v8, OS_LOG_TYPE_INFO, "%s, event identifier, %@, pattern event count, %lu", (uint8_t *)&v9, 0x20u);
  }

}

- (void)_buildMappingFromBaseEvents:(id)a3 toContextEvents:(id)a4
{
  id v5;
  id v6;
  id v7;
  void *i;
  void *v9;
  NSMutableArray *v10;
  void *v11;
  void *v12;
  void *v13;
  void *v14;
  void *v15;
  void *v16;
  void *v17;
  void *v18;
  void *v19;
  void *v20;
  void *v21;
  id v22;
  void *v23;
  void *v24;
  void *v25;
  id v26;
  id v27;
  uint64_t v28;
  void *j;
  void *v30;
  void *v31;
  void *v32;
  NSMutableArray *v33;
  id v34;
  id v35;
  uint64_t v36;
  void *k;
  uint64_t v38;
  void *v39;
  NSMutableArray *v40;
  void *v41;
  MOConversationAnnotationManager *v42;
  uint64_t v43;
  void *v44;
  NSMutableArray *v45;
  void *v46;
  id v47;
  void *v48;
  id os_log;
  NSObject *v50;
  id v51;
  uint64_t v52;
  void *v53;
  id v54;
  NSObject *v55;
  id v56;
  id v57;
  uint64_t v58;
  void *m;
  void *v60;
  void *v61;
  void *v62;
  void *v63;
  void *v64;
  unsigned int v65;
  id v66;
  NSObject *v67;
  MOConversationAnnotationManager *v68;
  NSMutableDictionary *eventToContextEventMap;
  void *v70;
  void *v71;
  NSMutableDictionary *v72;
  NSMutableSet *v73;
  void *v74;
  NSMutableDictionary *v75;
  void *v76;
  void *v77;
  void *v78;
  id v79;
  id v80;
  id obj;
  uint64_t v82;
  id v83;
  uint64_t v84;
  NSMutableArray *v85;
  uint64_t v86;
  id v87;
  NSMutableDictionary *v88;
  uint64_t v89;
  id v90;
  void *v91;
  id v92;
  id v93;
  __int128 v95;
  __int128 v96;
  __int128 v97;
  __int128 v98;
  __int128 v99;
  __int128 v100;
  __int128 v101;
  __int128 v102;
  __int128 v103;
  __int128 v104;
  __int128 v105;
  __int128 v106;
  __int128 v107;
  __int128 v108;
  __int128 v109;
  __int128 v110;
  __int128 v111;
  __int128 v112;
  __int128 v113;
  __int128 v114;
  __int128 v115;
  __int128 v116;
  __int128 v117;
  __int128 v118;
  uint8_t buf[4];
  const char *v120;
  __int16 v121;
  void *v122;
  __int16 v123;
  id v124;
  __int16 v125;
  void *v126;
  _BYTE v127[128];
  _BYTE v128[128];
  _BYTE v129[128];
  _BYTE v130[128];
  _BYTE v131[128];
  _BYTE v132[128];

  v5 = a3;
  v90 = a4;
  v88 = objc_opt_new(NSMutableDictionary);
  v115 = 0u;
  v116 = 0u;
  v117 = 0u;
  v118 = 0u;
  obj = v5;
  v6 = objc_msgSend(obj, "countByEnumeratingWithState:objects:count:", &v115, v132, 16);
  if (v6)
  {
    v7 = v6;
    v92 = *(id *)v116;
    do
    {
      for (i = 0; i != v7; i = (char *)i + 1)
      {
        if (*(id *)v116 != v92)
          objc_enumerationMutation(obj);
        v9 = *(void **)(*((_QWORD *)&v115 + 1) + 8 * (_QWORD)i);
        v10 = objc_opt_new(NSMutableArray);
        v11 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v9, "interactions"));
        v12 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v11, "firstObject"));
        v13 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v12, "sender"));
        v14 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v13, "personId"));

        if (v14)
        {
          v15 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v9, "interactions"));
          v16 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v15, "firstObject"));
          v17 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v16, "sender"));
          v18 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v17, "personId"));
          -[NSMutableArray addObject:](v10, "addObject:", v18);

        }
        v19 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v9, "interactions"));
        v20 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v19, "firstObject"));
        v21 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v20, "recipients"));
        v22 = objc_msgSend(v21, "count");

        if (v22)
        {
          v113 = 0u;
          v114 = 0u;
          v111 = 0u;
          v112 = 0u;
          v23 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v9, "interactions"));
          v24 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v23, "firstObject"));
          v25 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v24, "recipients"));

          v26 = objc_msgSend(v25, "countByEnumeratingWithState:objects:count:", &v111, v131, 16);
          if (v26)
          {
            v27 = v26;
            v28 = *(_QWORD *)v112;
            do
            {
              for (j = 0; j != v27; j = (char *)j + 1)
              {
                if (*(_QWORD *)v112 != v28)
                  objc_enumerationMutation(v25);
                v30 = *(void **)(*((_QWORD *)&v111 + 1) + 8 * (_QWORD)j);
                v31 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v30, "personId"));

                if (v31)
                {
                  v32 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v30, "personId"));
                  -[NSMutableArray addObject:](v10, "addObject:", v32);

                }
              }
              v27 = objc_msgSend(v25, "countByEnumeratingWithState:objects:count:", &v111, v131, 16);
            }
            while (v27);
          }

        }
        v109 = 0u;
        v110 = 0u;
        v107 = 0u;
        v108 = 0u;
        v33 = v10;
        v34 = -[NSMutableArray countByEnumeratingWithState:objects:count:](v33, "countByEnumeratingWithState:objects:count:", &v107, v130, 16);
        if (v34)
        {
          v35 = v34;
          v36 = *(_QWORD *)v108;
          do
          {
            for (k = 0; k != v35; k = (char *)k + 1)
            {
              if (*(_QWORD *)v108 != v36)
                objc_enumerationMutation(v33);
              if (v33)
              {
                v38 = *(_QWORD *)(*((_QWORD *)&v107 + 1) + 8 * (_QWORD)k);
                v39 = (void *)objc_claimAutoreleasedReturnValue(-[NSMutableDictionary objectForKey:](v88, "objectForKey:", v38));

                if (!v39)
                {
                  v40 = objc_opt_new(NSMutableArray);
                  -[NSMutableDictionary setObject:forKey:](v88, "setObject:forKey:", v40, v38);

                }
                v41 = (void *)objc_claimAutoreleasedReturnValue(-[NSMutableDictionary objectForKey:](v88, "objectForKey:", v38));
                objc_msgSend(v41, "addObject:", v9);

              }
            }
            v35 = -[NSMutableArray countByEnumeratingWithState:objects:count:](v33, "countByEnumeratingWithState:objects:count:", &v107, v130, 16);
          }
          while (v35);
        }

      }
      v7 = objc_msgSend(obj, "countByEnumeratingWithState:objects:count:", &v115, v132, 16);
    }
    while (v7);
  }

  v105 = 0u;
  v106 = 0u;
  v103 = 0u;
  v104 = 0u;
  v80 = v90;
  v42 = self;
  v83 = objc_msgSend(v80, "countByEnumeratingWithState:objects:count:", &v103, v129, 16);
  if (v83)
  {
    v82 = *(_QWORD *)v104;
    do
    {
      v43 = 0;
      do
      {
        if (*(_QWORD *)v104 != v82)
          objc_enumerationMutation(v80);
        v84 = v43;
        v44 = *(void **)(*((_QWORD *)&v103 + 1) + 8 * v43);
        v45 = objc_opt_new(NSMutableArray);
        if (objc_msgSend(v44, "category") == (id)9)
        {
          v46 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v44, "itemSenders"));
          v47 = objc_msgSend(v46, "count");

          if (v47)
          {
            v48 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v44, "itemSenders"));
            -[NSMutableArray addObjectsFromArray:](v45, "addObjectsFromArray:", v48);

          }
        }
        os_log = _mo_log_facility_get_os_log(&MOLogFacilityEventBundleManager);
        v50 = objc_claimAutoreleasedReturnValue(os_log);
        if (os_log_type_enabled(v50, OS_LOG_TYPE_INFO))
        {
          v51 = -[NSMutableArray count](v45, "count");
          *(_DWORD *)buf = 136315650;
          v120 = "-[MOConversationAnnotationManager _buildMappingFromBaseEvents:toContextEvents:]";
          v121 = 2112;
          v122 = v44;
          v123 = 2048;
          v124 = v51;
          _os_log_impl((void *)&_mh_execute_header, v50, OS_LOG_TYPE_INFO, "%s, contextEvent, %@, contactIdentifier count, %lu", buf, 0x20u);
        }

        v101 = 0u;
        v102 = 0u;
        v99 = 0u;
        v100 = 0u;
        v85 = v45;
        v87 = -[NSMutableArray countByEnumeratingWithState:objects:count:](v85, "countByEnumeratingWithState:objects:count:", &v99, v128, 16);
        if (v87)
        {
          v86 = *(_QWORD *)v100;
          do
          {
            v52 = 0;
            do
            {
              if (*(_QWORD *)v100 != v86)
                objc_enumerationMutation(v85);
              v89 = v52;
              v53 = *(void **)(*((_QWORD *)&v99 + 1) + 8 * v52);
              v54 = _mo_log_facility_get_os_log(&MOLogFacilityEventBundleManager);
              v55 = objc_claimAutoreleasedReturnValue(v54);
              if (os_log_type_enabled(v55, OS_LOG_TYPE_DEBUG))
              {
                v78 = (void *)objc_claimAutoreleasedReturnValue(-[NSMutableDictionary objectForKey:](v88, "objectForKey:", v53));
                v79 = objc_msgSend(v78, "count");
                *(_DWORD *)buf = 136315650;
                v120 = "-[MOConversationAnnotationManager _buildMappingFromBaseEvents:toContextEvents:]";
                v121 = 2112;
                v122 = v53;
                v123 = 2048;
                v124 = v79;
                _os_log_debug_impl((void *)&_mh_execute_header, v55, OS_LOG_TYPE_DEBUG, "%s, contactIdentifier, %@, base event count, %lu", buf, 0x20u);

              }
              v97 = 0u;
              v98 = 0u;
              v95 = 0u;
              v96 = 0u;
              v91 = v53;
              v93 = (id)objc_claimAutoreleasedReturnValue(-[NSMutableDictionary objectForKey:](v88, "objectForKey:", v53));
              v56 = objc_msgSend(v93, "countByEnumeratingWithState:objects:count:", &v95, v127, 16);
              if (v56)
              {
                v57 = v56;
                v58 = *(_QWORD *)v96;
                do
                {
                  for (m = 0; m != v57; m = (char *)m + 1)
                  {
                    if (*(_QWORD *)v96 != v58)
                      objc_enumerationMutation(v93);
                    v60 = *(void **)(*((_QWORD *)&v95 + 1) + 8 * (_QWORD)m);
                    v61 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v60, "startDate"));
                    v62 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v61, "startOfDay"));
                    v63 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v44, "startDate"));
                    v64 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v63, "startOfDay"));
                    v65 = objc_msgSend(v62, "isEqualToDate:", v64);

                    if (v65)
                    {
                      v66 = _mo_log_facility_get_os_log(&MOLogFacilityEventBundleManager);
                      v67 = objc_claimAutoreleasedReturnValue(v66);
                      if (os_log_type_enabled(v67, OS_LOG_TYPE_INFO))
                      {
                        *(_DWORD *)buf = 136315906;
                        v120 = "-[MOConversationAnnotationManager _buildMappingFromBaseEvents:toContextEvents:]";
                        v121 = 2112;
                        v122 = v91;
                        v123 = 2112;
                        v124 = v60;
                        v125 = 2112;
                        v126 = v44;
                        _os_log_impl((void *)&_mh_execute_header, v67, OS_LOG_TYPE_INFO, "%s, contactIdentifier, %@, matching base event, %@, context event, %@", buf, 0x2Au);
                      }

                      v68 = self;
                      eventToContextEventMap = self->_eventToContextEventMap;
                      v70 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v60, "eventIdentifier"));
                      v71 = (void *)objc_claimAutoreleasedReturnValue(-[NSMutableDictionary objectForKey:](eventToContextEventMap, "objectForKey:", v70));

                      if (!v71)
                      {
                        v72 = self->_eventToContextEventMap;
                        v73 = objc_opt_new(NSMutableSet);
                        v74 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v60, "eventIdentifier"));
                        -[NSMutableDictionary setObject:forKey:](v72, "setObject:forKey:", v73, v74);

                        v68 = self;
                      }
                      v75 = v68->_eventToContextEventMap;
                      v76 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v60, "eventIdentifier"));
                      v77 = (void *)objc_claimAutoreleasedReturnValue(-[NSMutableDictionary objectForKey:](v75, "objectForKey:", v76));
                      objc_msgSend(v77, "addObject:", v44);

                    }
                  }
                  v57 = objc_msgSend(v93, "countByEnumeratingWithState:objects:count:", &v95, v127, 16);
                }
                while (v57);
              }

              v52 = v89 + 1;
              v42 = self;
            }
            while ((id)(v89 + 1) != v87);
            v87 = -[NSMutableArray countByEnumeratingWithState:objects:count:](v85, "countByEnumeratingWithState:objects:count:", &v99, v128, 16);
          }
          while (v87);
        }

        v43 = v84 + 1;
      }
      while ((id)(v84 + 1) != v83);
      v83 = objc_msgSend(v80, "countByEnumeratingWithState:objects:count:", &v103, v129, 16);
    }
    while (v83);
  }

  -[NSMutableDictionary enumerateKeysAndObjectsUsingBlock:](v42->_eventToContextEventMap, "enumerateKeysAndObjectsUsingBlock:", &__block_literal_global_192);
}

void __79__MOConversationAnnotationManager__buildMappingFromBaseEvents_toContextEvents___block_invoke(id a1, NSUUID *a2, NSSet *a3, BOOL *a4)
{
  NSUUID *v5;
  NSSet *v6;
  id os_log;
  NSObject *v8;
  int v9;
  const char *v10;
  __int16 v11;
  NSUUID *v12;
  __int16 v13;
  NSUInteger v14;

  v5 = a2;
  v6 = a3;
  os_log = _mo_log_facility_get_os_log(&MOLogFacilityEventBundleManager);
  v8 = objc_claimAutoreleasedReturnValue(os_log);
  if (os_log_type_enabled(v8, OS_LOG_TYPE_INFO))
  {
    v9 = 136315650;
    v10 = "-[MOConversationAnnotationManager _buildMappingFromBaseEvents:toContextEvents:]_block_invoke";
    v11 = 2112;
    v12 = v5;
    v13 = 2048;
    v14 = -[NSSet count](v6, "count");
    _os_log_impl((void *)&_mh_execute_header, v8, OS_LOG_TYPE_INFO, "%s, event identifier, %@, context event count, %lu", (uint8_t *)&v9, 0x20u);
  }

}

- (id)_actionForBundle:(id)a3 type:(unint64_t)a4
{
  id v5;
  id os_log;
  NSObject *v7;
  const __CFString *v8;
  id v9;
  id v10;
  uint64_t v11;
  void *i;
  void *v13;
  void *v14;
  void *v15;
  void *v16;
  void *v17;
  unsigned int v18;
  NSMutableSet *v19;
  _UNKNOWN **v20;
  void *v21;
  void *v22;
  void *v23;
  void *v24;
  unsigned int v25;
  id v26;
  NSObject *v27;
  MOAction *v28;
  void *v29;
  void *v30;
  void *v31;
  NSMutableSet *v33;
  id obj;
  __int128 v35;
  __int128 v36;
  __int128 v37;
  __int128 v38;
  uint8_t buf[4];
  const char *v40;
  __int16 v41;
  id v42;
  __int16 v43;
  const __CFString *v44;
  _BYTE v45[128];

  v5 = a3;
  switch(a4)
  {
    case 1uLL:
    case 2uLL:
    case 3uLL:
      os_log = _mo_log_facility_get_os_log(&MOLogFacilityEventBundleManager);
      v7 = objc_claimAutoreleasedReturnValue(os_log);
      if (os_log_type_enabled(v7, OS_LOG_TYPE_ERROR))
        -[MOConversationAnnotationManager _actionForBundle:type:].cold.1(a4, v7);

      goto LABEL_5;
    case 4uLL:
      v8 = CFSTR("call");
      goto LABEL_28;
    case 5uLL:
    case 7uLL:
      v8 = CFSTR("chat");
      goto LABEL_28;
    case 6uLL:
      v33 = objc_opt_new(NSMutableSet);
      v35 = 0u;
      v36 = 0u;
      v37 = 0u;
      v38 = 0u;
      obj = (id)objc_claimAutoreleasedReturnValue(objc_msgSend(v5, "events"));
      v9 = objc_msgSend(obj, "countByEnumeratingWithState:objects:count:", &v35, v45, 16);
      if (!v9)
        goto LABEL_24;
      v10 = v9;
      v11 = *(_QWORD *)v36;
      break;
    default:
LABEL_5:
      v8 = 0;
      goto LABEL_28;
  }
  do
  {
    for (i = 0; i != v10; i = (char *)i + 1)
    {
      if (*(_QWORD *)v36 != v11)
        objc_enumerationMutation(obj);
      v13 = *(void **)(*((_QWORD *)&v35 + 1) + 8 * (_QWORD)i);
      v14 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v13, "patterns"));
      v15 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v14, "objectForKeyedSubscript:", CFSTR("kEventPatternType")));
      if (objc_msgSend(v15, "intValue"))
      {

      }
      else
      {
        v16 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v13, "patterns"));
        v17 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v16, "objectForKeyedSubscript:", CFSTR("kEventPatternAnomalyFeatureType")));
        v18 = objc_msgSend(v17, "intValue");

        if (v18 == 2)
        {
          v19 = v33;
          v20 = &off_1002DADC0;
LABEL_21:
          -[NSMutableSet addObject:](v19, "addObject:", v20);
          continue;
        }
      }
      v21 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v13, "patterns"));
      v22 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v21, "objectForKeyedSubscript:", CFSTR("kEventPatternType")));
      if (objc_msgSend(v22, "intValue"))
      {

        continue;
      }
      v23 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v13, "patterns"));
      v24 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v23, "objectForKeyedSubscript:", CFSTR("kEventPatternAnomalyFeatureType")));
      v25 = objc_msgSend(v24, "intValue");

      if (v25 == 1)
      {
        v19 = v33;
        v20 = &off_1002DADA8;
        goto LABEL_21;
      }
    }
    v10 = objc_msgSend(obj, "countByEnumeratingWithState:objects:count:", &v35, v45, 16);
  }
  while (v10);
LABEL_24:

  if (-[NSMutableSet containsObject:](v33, "containsObject:", &off_1002DADA8))
    v8 = CFSTR("call");
  else
    v8 = CFSTR("chat");

LABEL_28:
  v26 = _mo_log_facility_get_os_log(&MOLogFacilityEventBundleManager);
  v27 = objc_claimAutoreleasedReturnValue(v26);
  if (os_log_type_enabled(v27, OS_LOG_TYPE_INFO))
  {
    *(_DWORD *)buf = 136315650;
    v40 = "-[MOConversationAnnotationManager _actionForBundle:type:]";
    v41 = 2112;
    v42 = v5;
    v43 = 2112;
    v44 = v8;
    _os_log_impl((void *)&_mh_execute_header, v27, OS_LOG_TYPE_INFO, "%s, bundle, %@, action name, %@", buf, 0x20u);
  }

  if (v8)
  {
    v28 = -[MOAction initWithActionName:actionType:actionSubtype:]([MOAction alloc], "initWithActionName:actionType:actionSubtype:", v8, 1, 4);
    v29 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v5, "events"));
    v30 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v29, "firstObject"));
    v31 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v30, "eventIdentifier"));
    -[MOAction setSourceEventIdentifier:](v28, "setSourceEventIdentifier:", v31);

  }
  else
  {
    v28 = 0;
  }

  return v28;
}

- (MOConfigurationManager)configurationManager
{
  return self->_configurationManager;
}

- (OS_dispatch_queue)queue
{
  return self->_queue;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_queue, 0);
  objc_storeStrong((id *)&self->_configurationManager, 0);
  objc_storeStrong((id *)&self->_eventToContextEventMap, 0);
  objc_storeStrong((id *)&self->_eventToPatternEventMap, 0);
  objc_storeStrong((id *)&self->_stats, 0);
  objc_storeStrong((id *)&self->_messageInteractionMechanisms, 0);
  objc_storeStrong((id *)&self->_callLikeInteractionMechanisms, 0);
}

void __50__MOConversationAnnotationManager__getBaseEvents___block_invoke_cold_1(uint64_t a1, uint64_t a2, os_log_t log)
{
  int v3;
  const char *v4;
  __int16 v5;
  uint64_t v6;
  __int16 v7;
  uint64_t v8;

  v3 = 136315650;
  v4 = "-[MOConversationAnnotationManager _getBaseEvents:]_block_invoke";
  v5 = 2048;
  v6 = a2;
  v7 = 2112;
  v8 = a1;
  _os_log_debug_impl((void *)&_mh_execute_header, log, OS_LOG_TYPE_DEBUG, "%s, idx, %lu, interaction, %@", (uint8_t *)&v3, 0x20u);
}

- (void)_annotateEvents:(void *)a1 significantContact:(uint64_t)a2 type:(NSObject *)a3 .cold.1(void *a1, uint64_t a2, NSObject *a3)
{
  void *v5;
  int v6;
  const char *v7;
  __int16 v8;
  void *v9;
  __int16 v10;
  uint64_t v11;

  v5 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(a1, "firstObject"));
  v6 = 136315650;
  v7 = "-[MOConversationAnnotationManager _annotateEvents:significantContact:type:]";
  v8 = 2112;
  v9 = v5;
  v10 = 2112;
  v11 = a2;
  _os_log_error_impl((void *)&_mh_execute_header, a3, OS_LOG_TYPE_ERROR, "%s, no contact name, event, %@, contact, %@", (uint8_t *)&v6, 0x20u);

}

- (void)_annotateEvents:(uint8_t *)buf significantContact:(_BYTE *)a2 type:(os_log_t)log .cold.2(uint8_t *buf, _BYTE *a2, os_log_t log)
{
  *buf = 0;
  *a2 = 0;
  _os_log_error_impl((void *)&_mh_execute_header, log, OS_LOG_TYPE_ERROR, "contact identifier is nil, not creating the MOPerson!", buf, 2u);
}

- (void)_actionForBundle:(uint64_t)a1 type:(NSObject *)a2 .cold.1(uint64_t a1, NSObject *a2)
{
  int v2;
  const char *v3;
  __int16 v4;
  uint64_t v5;

  v2 = 136315394;
  v3 = "-[MOConversationAnnotationManager _actionForBundle:type:]";
  v4 = 2048;
  v5 = a1;
  _os_log_error_impl((void *)&_mh_execute_header, a2, OS_LOG_TYPE_ERROR, "%s, deprecated annotation type, %lu", (uint8_t *)&v2, 0x16u);
}

@end
