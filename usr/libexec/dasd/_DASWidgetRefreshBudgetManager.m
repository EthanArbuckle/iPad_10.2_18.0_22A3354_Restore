@implementation _DASWidgetRefreshBudgetManager

- (_DASWidgetRefreshBudgetManager)init
{
  id v2;
  os_log_t v3;
  void *v4;
  dispatch_queue_attr_t v5;
  NSObject *v6;
  dispatch_queue_attr_t v7;
  NSObject *v8;
  dispatch_queue_t v9;
  void *v10;
  uint64_t v11;
  void *v12;
  uint64_t v13;
  void *v14;
  uint64_t v15;
  void *v16;
  id v17;
  void *v18;
  uint64_t v19;
  uint64_t v20;
  void *v21;
  uint64_t v22;
  void *v23;
  NSObject *v24;
  dispatch_time_t v25;
  id *v26;
  dispatch_block_t v27;
  _DASDataProtectionStateMonitor *v28;
  id v29;
  NSObject *v30;
  _QWORD v32[4];
  id *v33;
  _QWORD v34[4];
  id v35;
  id location;
  _QWORD block[4];
  id *v38;
  objc_super v39;

  v39.receiver = self;
  v39.super_class = (Class)_DASWidgetRefreshBudgetManager;
  v2 = -[_DASWidgetRefreshBudgetManager init](&v39, "init");
  if (v2)
  {
    v3 = os_log_create("com.apple.duetactivityscheduler", "widgetBudgetManager");
    v4 = (void *)*((_QWORD *)v2 + 1);
    *((_QWORD *)v2 + 1) = v3;

    v5 = dispatch_queue_attr_make_with_autorelease_frequency(0, DISPATCH_AUTORELEASE_FREQUENCY_WORK_ITEM);
    v6 = objc_claimAutoreleasedReturnValue(v5);
    v7 = dispatch_queue_attr_make_with_qos_class(v6, QOS_CLASS_UTILITY, 0);
    v8 = objc_claimAutoreleasedReturnValue(v7);
    v9 = dispatch_queue_create("com.apple.dasd.widgetBudgetManagement", v8);
    v10 = (void *)*((_QWORD *)v2 + 8);
    *((_QWORD *)v2 + 8) = v9;

    v11 = objc_claimAutoreleasedReturnValue(+[_CDClientContext userContext](_CDClientContext, "userContext"));
    v12 = (void *)*((_QWORD *)v2 + 2);
    *((_QWORD *)v2 + 2) = v11;

    v13 = objc_claimAutoreleasedReturnValue(+[_DASDefaultsBudgetPersistence persistence](_DASDefaultsBudgetPersistence, "persistence"));
    v14 = (void *)*((_QWORD *)v2 + 5);
    *((_QWORD *)v2 + 5) = v13;

    v15 = objc_claimAutoreleasedReturnValue(+[_DASWidgetRefreshUsageTracker sharedInstance](_DASWidgetRefreshUsageTracker, "sharedInstance"));
    v16 = (void *)*((_QWORD *)v2 + 6);
    *((_QWORD *)v2 + 6) = v15;

    v17 = objc_alloc_init((Class)NSMutableDictionary);
    v18 = (void *)*((_QWORD *)v2 + 3);
    *((_QWORD *)v2 + 3) = v17;

    v19 = *((_QWORD *)v2 + 5);
    v20 = *((_QWORD *)v2 + 8);
    v21 = (void *)objc_claimAutoreleasedReturnValue(+[_DKKnowledgeStore knowledgeStore](_DKKnowledgeStore, "knowledgeStore"));
    v22 = objc_claimAutoreleasedReturnValue(+[_DASBudgetModulator modulatorForBudgetTypes:withBudgets:persistence:withQueue:withStore:](_DASBudgetModulator, "modulatorForBudgetTypes:withBudgets:persistence:withQueue:withStore:", CFSTR("Widgets"), 0, v19, v20, v21));
    v23 = (void *)*((_QWORD *)v2 + 4);
    *((_QWORD *)v2 + 4) = v22;

    v24 = dispatch_source_create((dispatch_source_type_t)&_dispatch_source_type_timer, 0, 0, *((dispatch_queue_t *)v2 + 8));
    v25 = dispatch_walltime(0, 0);
    dispatch_source_set_timer(v24, v25, 0x4E94914F0000uLL, 0x8BB2C97000uLL);
    block[0] = _NSConcreteStackBlock;
    block[1] = 3221225472;
    block[2] = sub_1000360A8;
    block[3] = &unk_10015D4E0;
    v26 = (id *)v2;
    v38 = v26;
    v27 = dispatch_block_create_with_qos_class(DISPATCH_BLOCK_INHERIT_QOS_CLASS, QOS_CLASS_UTILITY, 0, block);
    dispatch_source_set_event_handler(v24, v27);

    dispatch_activate(v24);
    v28 = objc_opt_new(_DASDataProtectionStateMonitor);
    v29 = v26[7];
    v26[7] = v28;

    if ((objc_msgSend(v26[7], "unnotifiedIsDataAvailableForClassC") & 1) == 0)
    {
      objc_initWeak(&location, v26);
      v34[0] = _NSConcreteStackBlock;
      v34[1] = 3221225472;
      v34[2] = sub_1000360B0;
      v34[3] = &unk_10015D438;
      objc_copyWeak(&v35, &location);
      objc_msgSend(v26[7], "setChangeHandler:", v34);
      objc_destroyWeak(&v35);
      objc_destroyWeak(&location);
    }
    v30 = *((_QWORD *)v2 + 8);
    v32[0] = _NSConcreteStackBlock;
    v32[1] = 3221225472;
    v32[2] = sub_10003625C;
    v32[3] = &unk_10015D4E0;
    v33 = v26;
    dispatch_async(v30, v32);

  }
  return (_DASWidgetRefreshBudgetManager *)v2;
}

+ (id)sharedInstance
{
  _QWORD block[5];

  block[0] = _NSConcreteStackBlock;
  block[1] = 3221225472;
  block[2] = sub_100036320;
  block[3] = &unk_10015D3A8;
  block[4] = a1;
  if (qword_1001AB508 != -1)
    dispatch_once(&qword_1001AB508, block);
  return (id)qword_1001AB510;
}

+ (id)budgetNameFromWidgetBudgetID:(id)a3
{
  return +[NSString stringWithFormat:](NSString, "stringWithFormat:", CFSTR("%@_%@"), CFSTR("com.apple.dasd.widget"), a3);
}

+ (id)widgetBudgetIDFromBudgetName:(id)a3
{
  id v3;
  void *v4;

  v3 = a3;
  v4 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v3, "substringFromIndex:", (char *)objc_msgSend(CFSTR("com.apple.dasd.widget"), "length") + 1));

  return v4;
}

- (BOOL)managesBudgetWithName:(id)a3
{
  return objc_msgSend(a3, "hasPrefix:", CFSTR("com.apple.dasd.widget"));
}

- (id)allBudgets
{
  void *v3;
  OS_dispatch_queue *queue;
  id v5;
  id v6;
  void **v8;
  uint64_t v9;
  void (*v10)(uint64_t);
  void *v11;
  _DASWidgetRefreshBudgetManager *v12;
  id v13;

  v3 = (void *)objc_claimAutoreleasedReturnValue(+[NSMutableArray array](NSMutableArray, "array"));
  queue = self->_queue;
  v8 = _NSConcreteStackBlock;
  v9 = 3221225472;
  v10 = sub_100036470;
  v11 = &unk_10015D558;
  v12 = self;
  v13 = v3;
  v5 = v3;
  dispatch_sync((dispatch_queue_t)queue, &v8);
  v6 = objc_msgSend(v5, "copy", v8, v9, v10, v11, v12);

  return v6;
}

- (void)reinstantiateConfiguredBudgets
{
  OS_dispatch_queue *queue;
  _QWORD block[5];

  queue = self->_queue;
  block[0] = _NSConcreteStackBlock;
  block[1] = 3221225472;
  block[2] = sub_10003667C;
  block[3] = &unk_10015D4E0;
  block[4] = self;
  dispatch_async((dispatch_queue_t)queue, block);
}

- (void)locked_reinstantiateConfiguredBudgets
{
  void *v3;
  void *v4;
  id v5;

  dispatch_assert_queue_V2((dispatch_queue_t)self->_queue);
  v5 = (id)objc_claimAutoreleasedReturnValue(+[NSMutableArray array](NSMutableArray, "array"));
  v3 = (void *)objc_claimAutoreleasedReturnValue(-[_DASWidgetRefreshBudgetManager managedBudgets](self, "managedBudgets"));
  v4 = (void *)objc_claimAutoreleasedReturnValue(-[_DASWidgetRefreshBudgetManager locked_instantiateBudgetsInto:withRemovals:](self, "locked_instantiateBudgetsInto:withRemovals:", v3, v5));

  if (objc_msgSend(v4, "count") || objc_msgSend(v5, "count"))
    -[_DASBudgetModulator locked_updateBudgetsToBeModulatedAdditions:removals:](self->_widgetBudgetModulator, "locked_updateBudgetsToBeModulatedAdditions:removals:", v4, v5);

}

- (id)locked_instantiateBudgetsInto:(id)a3 withRemovals:(id)a4
{
  id v6;
  void *v7;
  NSObject *log;
  uint64_t v9;
  uint64_t v10;
  uint64_t v11;
  uint64_t v12;
  uint64_t v13;
  uint64_t v14;
  uint64_t v15;
  void *v16;
  NSObject *v17;
  _DASDefaultsBudgetPersistence *defaultsPersistence;
  void *v19;
  void *v20;
  void *v21;
  NSObject *v22;
  id v23;
  id v24;
  id v25;
  id v26;
  uint64_t v27;
  void *i;
  void *v29;
  void *v30;
  void *v31;
  _CDContext *context;
  void *v33;
  void *v34;
  NSObject *v35;
  id v36;
  id v37;
  id v38;
  id v39;
  uint64_t v40;
  void *j;
  void *v42;
  NSObject *v43;
  uint64_t v44;
  uint64_t v45;
  uint64_t v46;
  uint64_t v47;
  uint64_t v48;
  uint64_t v49;
  uint64_t v50;
  id v51;
  id v52;
  uint64_t v53;
  void *k;
  void *v55;
  NSObject *v56;
  NSObject *v57;
  NSObject *v58;
  uint64_t v59;
  uint64_t v60;
  uint64_t v61;
  uint64_t v62;
  uint64_t v63;
  uint64_t v64;
  uint64_t v65;
  id v66;
  id v67;
  uint64_t v68;
  void *m;
  void *v70;
  NSObject *v71;
  uint64_t v72;
  void *v73;
  NSObject *v74;
  id v75;
  id v76;
  uint64_t v77;
  void *n;
  void *v79;
  void *v80;
  double v81;
  double v82;
  void *v83;
  void *v84;
  double v85;
  NSObject *v86;
  void *v87;
  double v88;
  NSObject *v89;
  NSObject *v90;
  const char *v91;
  uint32_t v92;
  NSObject *v93;
  void *v94;
  NSObject *v95;
  NSObject *v96;
  id v97;
  id v98;
  uint64_t v99;
  void *ii;
  void *v101;
  NSObject *v102;
  void *v103;
  double v104;
  double v105;
  void *v106;
  void *v107;
  double v108;
  double v109;
  NSObject *v110;
  NSObject *v111;
  NSObject *v112;
  void *v114;
  void *v115;
  void *v116;
  id v117;
  id v118;
  id v119;
  id v120;
  id obj;
  void *v122;
  id v123;
  void *v124;
  __int128 v125;
  __int128 v126;
  __int128 v127;
  __int128 v128;
  __int128 v129;
  __int128 v130;
  __int128 v131;
  __int128 v132;
  __int128 v133;
  __int128 v134;
  __int128 v135;
  __int128 v136;
  __int128 v137;
  __int128 v138;
  __int128 v139;
  __int128 v140;
  __int128 v141;
  __int128 v142;
  __int128 v143;
  __int128 v144;
  _QWORD v145[5];
  __int128 v146;
  __int128 v147;
  __int128 v148;
  __int128 v149;
  _QWORD v150[5];
  uint8_t v151[128];
  uint8_t buf[4];
  void *v153;
  __int16 v154;
  double v155;
  _BYTE v156[128];
  _BYTE v157[128];
  _BYTE v158[128];
  _BYTE v159[128];
  _BYTE v160[128];

  v6 = a3;
  v117 = a4;
  dispatch_assert_queue_V2((dispatch_queue_t)self->_queue);
  v7 = (void *)objc_claimAutoreleasedReturnValue(-[_DASWidgetRefreshBudgetManager widgetRefreshUsageTracker](self, "widgetRefreshUsageTracker"));
  objc_msgSend(v7, "invalidateComputedBudgetCache");

  log = self->_log;
  if (os_log_type_enabled(log, OS_LOG_TYPE_DEBUG))
    sub_1000E11C4(log, v9, v10, v11, v12, v13, v14, v15);
  v16 = (void *)objc_claimAutoreleasedReturnValue(-[_DASWidgetRefreshBudgetManager requiredBudgetsInfo](self, "requiredBudgetsInfo"));
  v17 = self->_log;
  if (os_log_type_enabled(v17, OS_LOG_TYPE_DEBUG))
  {
    *(_WORD *)buf = 0;
    _os_log_debug_impl((void *)&_mh_execute_header, v17, OS_LOG_TYPE_DEBUG, "requiredInfo", buf, 2u);
    v150[0] = _NSConcreteStackBlock;
    v150[1] = 3221225472;
    v150[2] = sub_10003752C;
    v150[3] = &unk_10015D480;
    v150[4] = self;
    objc_msgSend(v16, "enumerateKeysAndObjectsUsingBlock:", v150);
  }
  v124 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v16, "allKeys"));
  defaultsPersistence = self->_defaultsPersistence;
  v116 = v16;
  v19 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v16, "allKeys"));
  v20 = (void *)objc_claimAutoreleasedReturnValue(+[NSSet setWithArray:](NSSet, "setWithArray:", v19));
  v21 = (void *)objc_claimAutoreleasedReturnValue(-[_DASDefaultsBudgetPersistence loadBudgetsWithExpectedNames:](defaultsPersistence, "loadBudgetsWithExpectedNames:", v20));

  v22 = self->_log;
  if (os_log_type_enabled(v22, OS_LOG_TYPE_DEFAULT))
  {
    *(_DWORD *)buf = 138412290;
    v153 = v21;
    _os_log_impl((void *)&_mh_execute_header, v22, OS_LOG_TYPE_DEFAULT, "Stored: %@", buf, 0xCu);
  }
  v23 = objc_alloc_init((Class)NSMutableDictionary);
  v146 = 0u;
  v147 = 0u;
  v148 = 0u;
  v149 = 0u;
  v24 = v21;
  v25 = objc_msgSend(v24, "countByEnumeratingWithState:objects:count:", &v146, v160, 16);
  if (v25)
  {
    v26 = v25;
    v27 = *(_QWORD *)v147;
    do
    {
      for (i = 0; i != v26; i = (char *)i + 1)
      {
        if (*(_QWORD *)v147 != v27)
          objc_enumerationMutation(v24);
        v29 = *(void **)(*((_QWORD *)&v146 + 1) + 8 * (_QWORD)i);
        v30 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v29, "name"));
        objc_msgSend(v23, "setObject:forKeyedSubscript:", v29, v30);

      }
      v26 = objc_msgSend(v24, "countByEnumeratingWithState:objects:count:", &v146, v160, 16);
    }
    while (v26);
  }

  v122 = v23;
  v31 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v23, "allKeys"));
  context = self->_context;
  v33 = (void *)objc_claimAutoreleasedReturnValue(+[_CDContextualKeyPath keyPathWithKey:](_CDContextualKeyPath, "keyPathWithKey:", kDASWidgetOverrideKeyPath));
  v34 = (void *)objc_claimAutoreleasedReturnValue(-[_CDContext objectForKeyedSubscript:](context, "objectForKeyedSubscript:", v33));

  v35 = self->_log;
  if (os_log_type_enabled(v35, OS_LOG_TYPE_DEBUG))
  {
    *(_WORD *)buf = 0;
    _os_log_debug_impl((void *)&_mh_execute_header, v35, OS_LOG_TYPE_DEBUG, "override list:", buf, 2u);
    v145[0] = _NSConcreteStackBlock;
    v145[1] = 3221225472;
    v145[2] = sub_100037598;
    v145[3] = &unk_10015DB18;
    v145[4] = self;
    objc_msgSend(v34, "enumerateObjectsUsingBlock:", v145);
  }
  v36 = objc_alloc_init((Class)NSMutableArray);
  v141 = 0u;
  v142 = 0u;
  v143 = 0u;
  v144 = 0u;
  v37 = v34;
  v38 = objc_msgSend(v37, "countByEnumeratingWithState:objects:count:", &v141, v159, 16);
  if (v38)
  {
    v39 = v38;
    v40 = *(_QWORD *)v142;
    do
    {
      for (j = 0; j != v39; j = (char *)j + 1)
      {
        if (*(_QWORD *)v142 != v40)
          objc_enumerationMutation(v37);
        v42 = (void *)objc_claimAutoreleasedReturnValue(+[_DASWidgetRefreshBudgetManager budgetNameFromWidgetBudgetID:](_DASWidgetRefreshBudgetManager, "budgetNameFromWidgetBudgetID:", *(_QWORD *)(*((_QWORD *)&v141 + 1) + 8 * (_QWORD)j)));
        objc_msgSend(v36, "addObject:", v42);

      }
      v39 = objc_msgSend(v37, "countByEnumeratingWithState:objects:count:", &v141, v159, 16);
    }
    while (v39);
  }
  v114 = v37;
  v115 = v24;

  v43 = self->_log;
  if (os_log_type_enabled(v43, OS_LOG_TYPE_DEBUG))
    sub_1000E1194(v43, v44, v45, v46, v47, v48, v49, v50);
  v139 = 0u;
  v140 = 0u;
  v137 = 0u;
  v138 = 0u;
  obj = v31;
  v51 = objc_msgSend(obj, "countByEnumeratingWithState:objects:count:", &v137, v158, 16);
  if (v51)
  {
    v52 = v51;
    v53 = *(_QWORD *)v138;
    do
    {
      for (k = 0; k != v52; k = (char *)k + 1)
      {
        if (*(_QWORD *)v138 != v53)
          objc_enumerationMutation(obj);
        v55 = *(void **)(*((_QWORD *)&v137 + 1) + 8 * (_QWORD)k);
        v56 = self->_log;
        if (os_log_type_enabled(v56, OS_LOG_TYPE_DEBUG))
        {
          *(_DWORD *)buf = 138412290;
          v153 = v55;
          _os_log_debug_impl((void *)&_mh_execute_header, v56, OS_LOG_TYPE_DEBUG, "%@", buf, 0xCu);
        }
        if ((objc_msgSend(v36, "containsObject:", v55) & 1) == 0
          && (objc_msgSend(v124, "containsObject:", v55) & 1) == 0)
        {
          objc_msgSend(v122, "removeObjectForKey:", v55);
          v57 = self->_log;
          if (os_log_type_enabled(v57, OS_LOG_TYPE_DEBUG))
          {
            *(_DWORD *)buf = 138412290;
            v153 = v55;
            _os_log_debug_impl((void *)&_mh_execute_header, v57, OS_LOG_TYPE_DEBUG, "Purged inactive widget budget %@ from stored budgets", buf, 0xCu);
          }
        }
      }
      v52 = objc_msgSend(obj, "countByEnumeratingWithState:objects:count:", &v137, v158, 16);
    }
    while (v52);
  }

  v58 = self->_log;
  if (os_log_type_enabled(v58, OS_LOG_TYPE_DEBUG))
    sub_1000E1164(v58, v59, v60, v61, v62, v63, v64, v65);
  v133 = 0u;
  v134 = 0u;
  v135 = 0u;
  v136 = 0u;
  v118 = (id)objc_claimAutoreleasedReturnValue(objc_msgSend(v6, "allKeys"));
  v66 = objc_msgSend(v118, "countByEnumeratingWithState:objects:count:", &v133, v157, 16);
  if (v66)
  {
    v67 = v66;
    v68 = *(_QWORD *)v134;
    do
    {
      for (m = 0; m != v67; m = (char *)m + 1)
      {
        if (*(_QWORD *)v134 != v68)
          objc_enumerationMutation(v118);
        v70 = *(void **)(*((_QWORD *)&v133 + 1) + 8 * (_QWORD)m);
        v71 = self->_log;
        if (os_log_type_enabled(v71, OS_LOG_TYPE_DEBUG))
        {
          *(_DWORD *)buf = 138412290;
          v153 = v70;
          _os_log_debug_impl((void *)&_mh_execute_header, v71, OS_LOG_TYPE_DEBUG, "%@", buf, 0xCu);
        }
        if ((objc_msgSend(v36, "containsObject:", v70) & 1) == 0
          && (objc_msgSend(v124, "containsObject:", v70) & 1) == 0)
        {
          v72 = objc_claimAutoreleasedReturnValue(objc_msgSend(v6, "objectForKeyedSubscript:", v70));
          v73 = (void *)v72;
          if (v117 && v72)
            objc_msgSend(v117, "addObject:", v72);
          objc_msgSend(v6, "removeObjectForKey:", v70);
          v74 = self->_log;
          if (os_log_type_enabled(v74, OS_LOG_TYPE_DEBUG))
          {
            *(_DWORD *)buf = 138412290;
            v153 = v70;
            _os_log_debug_impl((void *)&_mh_execute_header, v74, OS_LOG_TYPE_DEBUG, "Purged inactive widget budget %@ from managed budgets", buf, 0xCu);
          }

        }
      }
      v67 = objc_msgSend(v118, "countByEnumeratingWithState:objects:count:", &v133, v157, 16);
    }
    while (v67);
  }
  v123 = objc_alloc_init((Class)NSMutableArray);
  v129 = 0u;
  v130 = 0u;
  v131 = 0u;
  v132 = 0u;
  v119 = (id)objc_claimAutoreleasedReturnValue(objc_msgSend(v116, "allKeys"));
  v75 = objc_msgSend(v119, "countByEnumeratingWithState:objects:count:", &v129, v156, 16);
  if (v75)
  {
    v76 = v75;
    v77 = *(_QWORD *)v130;
    do
    {
      for (n = 0; n != v76; n = (char *)n + 1)
      {
        if (*(_QWORD *)v130 != v77)
          objc_enumerationMutation(v119);
        v79 = *(void **)(*((_QWORD *)&v129 + 1) + 8 * (_QWORD)n);
        v80 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v116, "objectForKeyedSubscript:", v79));
        objc_msgSend(v80, "doubleValue");
        v82 = v81;

        v83 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v6, "objectForKeyedSubscript:", v79));
        if (v83)
        {
          v84 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v6, "objectForKeyedSubscript:", v79));
          objc_msgSend(v84, "capacity");
          if (v85 != v82)
          {
            v86 = self->_log;
            if (os_log_type_enabled(v86, OS_LOG_TYPE_INFO))
            {
              *(_DWORD *)buf = 138543618;
              v153 = v84;
              v154 = 2048;
              v155 = v82;
              _os_log_impl((void *)&_mh_execute_header, v86, OS_LOG_TYPE_INFO, "budget %{public}@ updating capacity to %f", buf, 0x16u);
            }
            objc_msgSend(v84, "setCapacity:", v82);
            objc_msgSend(v84, "setAllocationType:", 4);
          }
        }
        else
        {
          v87 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v122, "objectForKeyedSubscript:", v79));

          if (v87)
          {
            v84 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v122, "objectForKeyedSubscript:", v79));
            objc_msgSend(v84, "capacity");
            if (v88 == v82)
            {
              v96 = self->_log;
              if (os_log_type_enabled(v96, OS_LOG_TYPE_INFO))
              {
                *(_DWORD *)buf = 138543362;
                v153 = v84;
                v90 = v96;
                v91 = "Loaded: %{public}@";
                v92 = 12;
LABEL_79:
                _os_log_impl((void *)&_mh_execute_header, v90, OS_LOG_TYPE_INFO, v91, buf, v92);
              }
            }
            else
            {
              objc_msgSend(v84, "setCapacity:", v82);
              v89 = self->_log;
              if (os_log_type_enabled(v89, OS_LOG_TYPE_INFO))
              {
                *(_DWORD *)buf = 138543618;
                v153 = v84;
                v154 = 2048;
                v155 = v82;
                v90 = v89;
                v91 = "Updated: %{public}@, Capacity=%f";
                v92 = 22;
                goto LABEL_79;
              }
            }
            objc_msgSend(v84, "setAllocationType:", 4);
            objc_msgSend(v6, "setObject:forKeyedSubscript:", v84, v79);
            objc_msgSend(v123, "addObject:", v84);
            goto LABEL_81;
          }
          v84 = (void *)objc_claimAutoreleasedReturnValue(+[_DASWidgetRefreshBudgetManager widgetBudgetIDFromBudgetName:](_DASWidgetRefreshBudgetManager, "widgetBudgetIDFromBudgetName:", v79));
          if (!v84)
          {
            v93 = self->_log;
            if (os_log_type_enabled(v93, OS_LOG_TYPE_DEFAULT))
            {
              *(_DWORD *)buf = 138412290;
              v153 = v79;
              _os_log_impl((void *)&_mh_execute_header, v93, OS_LOG_TYPE_DEFAULT, "Somehow couldn't find widget for budget: %@", buf, 0xCu);
            }
          }
          v94 = (void *)objc_claimAutoreleasedReturnValue(+[_DASWidgetRefreshBudget budgetWithName:widgetBudgetID:capacity:balance:allocationType:](_DASWidgetRefreshBudget, "budgetWithName:widgetBudgetID:capacity:balance:allocationType:", v79, v84, 4, v82, 0.0));
          objc_msgSend(v6, "setObject:forKeyedSubscript:", v94, v79);
          objc_msgSend(v123, "addObject:", v94);
          v95 = self->_log;
          if (os_log_type_enabled(v95, OS_LOG_TYPE_INFO))
          {
            *(_DWORD *)buf = 138543362;
            v153 = v94;
            _os_log_impl((void *)&_mh_execute_header, v95, OS_LOG_TYPE_INFO, "budget %{public}@ init - newly created", buf, 0xCu);
          }

        }
LABEL_81:

      }
      v76 = objc_msgSend(v119, "countByEnumeratingWithState:objects:count:", &v129, v156, 16);
    }
    while (v76);
  }

  v127 = 0u;
  v128 = 0u;
  v125 = 0u;
  v126 = 0u;
  v120 = v114;
  v97 = objc_msgSend(v120, "countByEnumeratingWithState:objects:count:", &v125, v151, 16);
  if (v97)
  {
    v98 = v97;
    v99 = *(_QWORD *)v126;
    do
    {
      for (ii = 0; ii != v98; ii = (char *)ii + 1)
      {
        if (*(_QWORD *)v126 != v99)
          objc_enumerationMutation(v120);
        v101 = *(void **)(*((_QWORD *)&v125 + 1) + 8 * (_QWORD)ii);
        v102 = self->_log;
        if (os_log_type_enabled(v102, OS_LOG_TYPE_INFO))
        {
          *(_DWORD *)buf = 138412290;
          v153 = v101;
          _os_log_impl((void *)&_mh_execute_header, v102, OS_LOG_TYPE_INFO, "managing override list widget %@", buf, 0xCu);
        }
        v103 = (void *)objc_claimAutoreleasedReturnValue(+[_DASWidgetRefreshBudgetManager budgetNameFromWidgetBudgetID:](_DASWidgetRefreshBudgetManager, "budgetNameFromWidgetBudgetID:", v101));
        v104 = (double)-[_DASWidgetRefreshUsageTracker maxWidgetRefreshBudgetForIndividualDaily](self->_widgetRefreshUsageTracker, "maxWidgetRefreshBudgetForIndividualDaily");
        v105 = v104 * 0.125;
        v106 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v6, "objectForKeyedSubscript:", v103));

        if (v106)
        {
          v107 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v6, "objectForKeyedSubscript:", v103));
          objc_msgSend(v107, "setCapacity:", v104);
          objc_msgSend(v107, "balance");
          if (v108 > v105)
          {
            objc_msgSend(v107, "balance");
            v105 = v109;
          }
          objc_msgSend(v107, "setBalance:", v105);
          objc_msgSend(v107, "setAllocationType:", 1);
          v110 = self->_log;
          if (os_log_type_enabled(v110, OS_LOG_TYPE_INFO))
          {
            *(_DWORD *)buf = 138543362;
            v153 = v107;
            _os_log_impl((void *)&_mh_execute_header, v110, OS_LOG_TYPE_INFO, "Modified capacity and allocation type of override list widget budget %{public}@", buf, 0xCu);
          }
        }
        else
        {
          v107 = (void *)objc_claimAutoreleasedReturnValue(+[_DASWidgetRefreshBudget budgetWithName:widgetBudgetID:capacity:balance:allocationType:](_DASWidgetRefreshBudget, "budgetWithName:widgetBudgetID:capacity:balance:allocationType:", v103, v101, 1, v104, v105));
          v111 = self->_log;
          if (os_log_type_enabled(v111, OS_LOG_TYPE_INFO))
          {
            *(_DWORD *)buf = 138543362;
            v153 = v107;
            _os_log_impl((void *)&_mh_execute_header, v111, OS_LOG_TYPE_INFO, "budget %{public}@ init - newly created override list widget budget", buf, 0xCu);
          }
          objc_msgSend(v6, "setObject:forKeyedSubscript:", v107, v103);
          objc_msgSend(v123, "addObject:", v107);
        }

      }
      v98 = objc_msgSend(v120, "countByEnumeratingWithState:objects:count:", &v125, v151, 16);
    }
    while (v98);
  }

  v112 = self->_log;
  if (os_log_type_enabled(v112, OS_LOG_TYPE_INFO))
  {
    *(_WORD *)buf = 0;
    _os_log_impl((void *)&_mh_execute_header, v112, OS_LOG_TYPE_INFO, "Instantiation complete", buf, 2u);
  }

  return v123;
}

- (void)resetBudgets
{
  OS_dispatch_queue *queue;
  _QWORD block[5];

  queue = self->_queue;
  block[0] = _NSConcreteStackBlock;
  block[1] = 3221225472;
  block[2] = sub_100037640;
  block[3] = &unk_10015D4E0;
  block[4] = self;
  dispatch_sync((dispatch_queue_t)queue, block);
}

- (id)requiredBudgetsInfo
{
  id v3;
  void *v4;
  void *v5;
  id v6;
  id v7;
  uint64_t v8;
  void *i;
  uint64_t v10;
  void *v11;
  void *v12;
  __int128 v14;
  __int128 v15;
  __int128 v16;
  __int128 v17;
  _BYTE v18[128];

  v3 = objc_alloc_init((Class)NSMutableDictionary);
  v4 = (void *)objc_claimAutoreleasedReturnValue(-[_DASWidgetRefreshUsageTracker dailyBudgetsForAllWidgets](self->_widgetRefreshUsageTracker, "dailyBudgetsForAllWidgets"));
  v14 = 0u;
  v15 = 0u;
  v16 = 0u;
  v17 = 0u;
  v5 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v4, "allKeys", 0));
  v6 = objc_msgSend(v5, "countByEnumeratingWithState:objects:count:", &v14, v18, 16);
  if (v6)
  {
    v7 = v6;
    v8 = *(_QWORD *)v15;
    do
    {
      for (i = 0; i != v7; i = (char *)i + 1)
      {
        if (*(_QWORD *)v15 != v8)
          objc_enumerationMutation(v5);
        v10 = *(_QWORD *)(*((_QWORD *)&v14 + 1) + 8 * (_QWORD)i);
        v11 = (void *)objc_claimAutoreleasedReturnValue(+[_DASWidgetRefreshBudgetManager budgetNameFromWidgetBudgetID:](_DASWidgetRefreshBudgetManager, "budgetNameFromWidgetBudgetID:", v10));
        v12 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v4, "objectForKeyedSubscript:", v10));
        objc_msgSend(v3, "setObject:forKeyedSubscript:", v12, v11);

      }
      v7 = objc_msgSend(v5, "countByEnumeratingWithState:objects:count:", &v14, v18, 16);
    }
    while (v7);
  }

  return v3;
}

- (double)balanceForBudgetWithName:(id)a3
{
  id v4;
  OS_dispatch_queue *queue;
  id v6;
  double v7;
  _QWORD block[5];
  id v10;
  uint64_t *v11;
  uint64_t v12;
  double *v13;
  uint64_t v14;
  uint64_t v15;

  v4 = a3;
  v12 = 0;
  v13 = (double *)&v12;
  v14 = 0x2020000000;
  v15 = 0;
  queue = self->_queue;
  block[0] = _NSConcreteStackBlock;
  block[1] = 3221225472;
  block[2] = sub_100037908;
  block[3] = &unk_10015DB40;
  v10 = v4;
  v11 = &v12;
  block[4] = self;
  v6 = v4;
  dispatch_sync((dispatch_queue_t)queue, block);
  v7 = v13[3];

  _Block_object_dispose(&v12, 8);
  return v7;
}

- (double)capacityForBudgetWithName:(id)a3
{
  id v4;
  OS_dispatch_queue *queue;
  id v6;
  double v7;
  _QWORD block[5];
  id v10;
  uint64_t *v11;
  uint64_t v12;
  double *v13;
  uint64_t v14;
  uint64_t v15;

  v4 = a3;
  v12 = 0;
  v13 = (double *)&v12;
  v14 = 0x2020000000;
  v15 = 0;
  queue = self->_queue;
  block[0] = _NSConcreteStackBlock;
  block[1] = 3221225472;
  block[2] = sub_100037A1C;
  block[3] = &unk_10015DB40;
  v10 = v4;
  v11 = &v12;
  block[4] = self;
  v6 = v4;
  dispatch_sync((dispatch_queue_t)queue, block);
  v7 = v13[3];

  _Block_object_dispose(&v12, 8);
  return v7;
}

- (double)balanceForWidgetBudgetID:(id)a3
{
  id v4;
  OS_dispatch_queue *queue;
  id v6;
  double v7;
  _QWORD block[5];
  id v10;
  uint64_t *v11;
  uint64_t v12;
  double *v13;
  uint64_t v14;
  uint64_t v15;

  v4 = a3;
  v12 = 0;
  v13 = (double *)&v12;
  v14 = 0x2020000000;
  v15 = 0;
  queue = self->_queue;
  block[0] = _NSConcreteStackBlock;
  block[1] = 3221225472;
  block[2] = sub_100037B30;
  block[3] = &unk_10015D930;
  block[4] = self;
  v10 = v4;
  v11 = &v12;
  v6 = v4;
  dispatch_sync((dispatch_queue_t)queue, block);
  v7 = v13[3];

  _Block_object_dispose(&v12, 8);
  return v7;
}

- (void)setBalance:(double)a3 forBudgetWithName:(id)a4
{
  id v6;
  OS_dispatch_queue *queue;
  id v8;
  _QWORD block[5];
  id v10;
  double v11;

  v6 = a4;
  queue = self->_queue;
  block[0] = _NSConcreteStackBlock;
  block[1] = 3221225472;
  block[2] = sub_100037C58;
  block[3] = &unk_10015DB68;
  block[4] = self;
  v10 = v6;
  v11 = a3;
  v8 = v6;
  dispatch_sync((dispatch_queue_t)queue, block);

}

- (void)decrementBy:(double)a3 forBudgetWithName:(id)a4
{
  id v6;
  OS_dispatch_queue *queue;
  id v8;
  _QWORD block[5];
  id v10;
  double v11;

  v6 = a4;
  queue = self->_queue;
  block[0] = _NSConcreteStackBlock;
  block[1] = 3221225472;
  block[2] = sub_100037E50;
  block[3] = &unk_10015DB68;
  block[4] = self;
  v10 = v6;
  v11 = a3;
  v8 = v6;
  dispatch_sync((dispatch_queue_t)queue, block);

}

- (void)setCapacity:(double)a3 forBudgetWithName:(id)a4
{
  id v6;
  OS_dispatch_queue *queue;
  id v8;
  _QWORD block[5];
  id v10;
  double v11;

  v6 = a4;
  queue = self->_queue;
  block[0] = _NSConcreteStackBlock;
  block[1] = 3221225472;
  block[2] = sub_10003805C;
  block[3] = &unk_10015DB68;
  block[4] = self;
  v10 = v6;
  v11 = a3;
  v8 = v6;
  dispatch_sync((dispatch_queue_t)queue, block);

}

- (void)updateBudget:(id)a3
{
  -[_DASDefaultsBudgetPersistence updateBudget:](self->_defaultsPersistence, "updateBudget:", a3);
}

- (void)reportActivityNoLongerRunning:(id)a3
{
  id v4;
  double v5;
  double v6;
  NSObject *log;
  NSObject *v8;
  void *v9;
  void *v10;
  void *v11;
  int v12;
  void *v13;
  __int16 v14;
  double v15;

  v4 = a3;
  -[_DASWidgetRefreshUsageTracker stopTrackingActivity:](self->_widgetRefreshUsageTracker, "stopTrackingActivity:", v4);
  if (v5 > 0.0)
  {
    v6 = v5;
    log = self->_log;
    if (os_log_type_enabled(log, OS_LOG_TYPE_DEFAULT))
    {
      v8 = log;
      v9 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v4, "widgetBudgetID"));
      v12 = 138543618;
      v13 = v9;
      v14 = 2048;
      v15 = v6;
      _os_log_impl((void *)&_mh_execute_header, v8, OS_LOG_TYPE_DEFAULT, "Attempting to decrement widget refresh budget for  %{public}@ by %lf", (uint8_t *)&v12, 0x16u);

    }
    v10 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v4, "widgetBudgetID"));
    v11 = (void *)objc_claimAutoreleasedReturnValue(+[_DASWidgetRefreshBudgetManager budgetNameFromWidgetBudgetID:](_DASWidgetRefreshBudgetManager, "budgetNameFromWidgetBudgetID:", v10));
    -[_DASWidgetRefreshBudgetManager decrementBy:forBudgetWithName:](self, "decrementBy:forBudgetWithName:", v11, v6);

  }
}

- (void)reportActivityRunning:(id)a3
{
  id v4;
  OS_dispatch_queue *queue;
  id v6;
  _QWORD block[5];
  id v8;

  v4 = a3;
  queue = self->_queue;
  block[0] = _NSConcreteStackBlock;
  block[1] = 3221225472;
  block[2] = sub_100038388;
  block[3] = &unk_10015D558;
  block[4] = self;
  v8 = v4;
  v6 = v4;
  dispatch_sync((dispatch_queue_t)queue, block);

}

- (OS_os_log)log
{
  return self->_log;
}

- (void)setLog:(id)a3
{
  objc_storeStrong((id *)&self->_log, a3);
}

- (_CDContext)context
{
  return self->_context;
}

- (void)setContext:(id)a3
{
  objc_storeStrong((id *)&self->_context, a3);
}

- (NSMutableDictionary)managedBudgets
{
  return self->_managedBudgets;
}

- (void)setManagedBudgets:(id)a3
{
  objc_storeStrong((id *)&self->_managedBudgets, a3);
}

- (_DASBudgetModulator)widgetBudgetModulator
{
  return self->_widgetBudgetModulator;
}

- (void)setWidgetBudgetModulator:(id)a3
{
  objc_storeStrong((id *)&self->_widgetBudgetModulator, a3);
}

- (_DASDefaultsBudgetPersistence)defaultsPersistence
{
  return self->_defaultsPersistence;
}

- (void)setDefaultsPersistence:(id)a3
{
  objc_storeStrong((id *)&self->_defaultsPersistence, a3);
}

- (_DASWidgetRefreshUsageTracker)widgetRefreshUsageTracker
{
  return self->_widgetRefreshUsageTracker;
}

- (void)setWidgetRefreshUsageTracker:(id)a3
{
  objc_storeStrong((id *)&self->_widgetRefreshUsageTracker, a3);
}

- (_DASDataProtectionStateMonitor)lockStateMonitor
{
  return self->_lockStateMonitor;
}

- (void)setLockStateMonitor:(id)a3
{
  objc_storeStrong((id *)&self->_lockStateMonitor, a3);
}

- (OS_dispatch_queue)queue
{
  return self->_queue;
}

- (void)setQueue:(id)a3
{
  objc_storeStrong((id *)&self->_queue, a3);
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_queue, 0);
  objc_storeStrong((id *)&self->_lockStateMonitor, 0);
  objc_storeStrong((id *)&self->_widgetRefreshUsageTracker, 0);
  objc_storeStrong((id *)&self->_defaultsPersistence, 0);
  objc_storeStrong((id *)&self->_widgetBudgetModulator, 0);
  objc_storeStrong((id *)&self->_managedBudgets, 0);
  objc_storeStrong((id *)&self->_context, 0);
  objc_storeStrong((id *)&self->_log, 0);
}

@end
