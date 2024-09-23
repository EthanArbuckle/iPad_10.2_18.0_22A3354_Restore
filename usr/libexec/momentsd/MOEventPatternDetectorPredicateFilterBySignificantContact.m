@implementation MOEventPatternDetectorPredicateFilterBySignificantContact

- (MOEventPatternDetectorPredicateFilterBySignificantContact)init
{
  MOEventPatternDetectorPredicateFilterBySignificantContact *v2;
  MOEventPatternDetectorPredicateFilterBySignificantContact *v3;
  MOEventPatternDetectorPredicateFilterBySignificantContact *v4;
  objc_super v6;

  v6.receiver = self;
  v6.super_class = (Class)MOEventPatternDetectorPredicateFilterBySignificantContact;
  v2 = -[MOEventPatternDetectorPredicateFilterBySignificantContact init](&v6, "init");
  v3 = v2;
  if (v2)
  {
    *(_QWORD *)&v2->_minimumTextCount = -1;
    v2->_maximumNumberOfContacts = -1;
    v2->_excludeTextOnlyConversations = 1;
    v4 = v2;
  }

  return v3;
}

- (id)filterEvents:(id)a3
{
  id v4;
  void *v5;
  void *v6;
  id v7;
  NSObject *v8;
  id i;
  void *v10;
  void *v11;
  id v12;
  id v13;
  int v14;
  int v15;
  uint64_t v16;
  double v17;
  void *j;
  void *v19;
  unint64_t v20;
  void *v21;
  void *v22;
  double v23;
  double v24;
  char *v25;
  void *v26;
  void *v27;
  id v28;
  unint64_t maximumNumberOfContacts;
  double minimumTotalCallDuration;
  id v31;
  NSObject *v32;
  NSMutableArray *v33;
  id v34;
  id v35;
  id v36;
  uint64_t v37;
  void *k;
  void *v39;
  void *v40;
  id v41;
  void *v42;
  void *v43;
  NSMutableArray *v44;
  id os_log;
  void *v47;
  void *v48;
  id v49;
  id obj;
  NSMutableArray *log;
  NSMutableArray *v52;
  uint64_t v53;
  MOEventPatternDetectorPredicateFilterBySignificantContact *v54;
  id v55;
  void *v56;
  char *v57;
  id v58;
  __int128 v59;
  __int128 v60;
  __int128 v61;
  __int128 v62;
  __int128 v63;
  __int128 v64;
  __int128 v65;
  __int128 v66;
  __int128 v67;
  __int128 v68;
  __int128 v69;
  __int128 v70;
  id v71;
  _BYTE v72[128];
  _BYTE v73[128];
  uint8_t v74[128];
  uint8_t buf[4];
  id v76;

  v4 = a3;
  if (self->_minimumTextCount == -1 || self->_minimumTotalCallDuration == -1 || self->_maximumNumberOfContacts == -1)
  {
    os_log = _mo_log_facility_get_os_log(&MOLogFacilityPatternDetection);
    log = (NSMutableArray *)objc_claimAutoreleasedReturnValue(os_log);
    if (os_log_type_enabled(&log->super.super, OS_LOG_TYPE_ERROR))
      -[MOEventPatternDetectorPredicateFilterBySignificantContact filterEvents:].cold.1(&log->super.super);
    v44 = 0;
    goto LABEL_57;
  }
  log = objc_opt_new(NSMutableArray);
  v5 = (void *)objc_claimAutoreleasedReturnValue(+[NSPredicate predicateWithFormat:](NSPredicate, "predicateWithFormat:", CFSTR("%K = %lu AND %K = %lu"), CFSTR("category"), 10, CFSTR("provider"), 3));
  v6 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v4, "filteredArrayUsingPredicate:", v5));
  v7 = _mo_log_facility_get_os_log(&MOLogFacilityPatternDetection);
  v8 = objc_claimAutoreleasedReturnValue(v7);
  if (os_log_type_enabled(v8, OS_LOG_TYPE_INFO))
  {
    *(_DWORD *)buf = 134217984;
    v76 = objc_msgSend(v6, "count");
    _os_log_impl((void *)&_mh_execute_header, v8, OS_LOG_TYPE_INFO, "Found %lu significant contact events", buf, 0xCu);
  }

  if (!objc_msgSend(v6, "count"))
  {
    v44 = 0;
    goto LABEL_56;
  }
  v48 = v5;
  v49 = v4;
  v52 = objc_opt_new(NSMutableArray);
  v67 = 0u;
  v68 = 0u;
  v69 = 0u;
  v70 = 0u;
  v47 = v6;
  obj = v6;
  v55 = objc_msgSend(obj, "countByEnumeratingWithState:objects:count:", &v67, v74, 16);
  if (!v55)
    goto LABEL_39;
  v53 = *(_QWORD *)v68;
  v54 = self;
  do
  {
    for (i = 0; i != v55; i = v25 + 1)
    {
      if (*(_QWORD *)v68 != v53)
        objc_enumerationMutation(obj);
      v10 = *(void **)(*((_QWORD *)&v67 + 1) + 8 * (_QWORD)i);
      v63 = 0u;
      v64 = 0u;
      v65 = 0u;
      v66 = 0u;
      v56 = v10;
      v57 = (char *)i;
      v11 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v10, "interactions"));
      v12 = objc_msgSend(v11, "countByEnumeratingWithState:objects:count:", &v63, v73, 16);
      if (v12)
      {
        v13 = v12;
        v14 = 0;
        v15 = 0;
        v16 = *(_QWORD *)v64;
        v17 = 0.0;
        do
        {
          for (j = 0; j != v13; j = (char *)j + 1)
          {
            if (*(_QWORD *)v64 != v16)
              objc_enumerationMutation(v11);
            v19 = *(void **)(*((_QWORD *)&v63 + 1) + 8 * (_QWORD)j);
            v20 = (unint64_t)objc_msgSend(v19, "mechanism");
            if (v20 <= 0x11)
            {
              if (((1 << v20) & 0x31B01) != 0)
              {
                ++v14;
                v21 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v19, "endDate"));
                v22 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v19, "startDate"));
                objc_msgSend(v21, "timeIntervalSinceDate:", v22);
                v24 = v23;

                v17 = v17 + v24;
              }
              else if (((1 << v20) & 0x201E) != 0)
              {
                ++v15;
              }
            }
          }
          v13 = objc_msgSend(v11, "countByEnumeratingWithState:objects:count:", &v63, v73, 16);
        }
        while (v13);
      }
      else
      {
        v14 = 0;
        v15 = 0;
        v17 = 0.0;
      }

      if (v54->_excludeTextOnlyConversations)
      {
        v25 = v57;
        if (v15 < 1 || v14)
        {
          v26 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v56, "interactionContacts"));
          if ((unint64_t)objc_msgSend(v26, "count") > v54->_maximumNumberOfContacts)
          {

            continue;
          }
          minimumTotalCallDuration = (double)v54->_minimumTotalCallDuration;

          if (v17 >= minimumTotalCallDuration)
          {
LABEL_36:
            -[NSMutableArray addObject:](v52, "addObject:", v56);
            continue;
          }
        }
      }
      else
      {
        v27 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v56, "interactionContacts"));
        v28 = objc_msgSend(v27, "count");
        maximumNumberOfContacts = v54->_maximumNumberOfContacts;

        v25 = v57;
        if ((unint64_t)v28 <= maximumNumberOfContacts
          && (v15 >= v54->_minimumTextCount || v17 >= (double)v54->_minimumTotalCallDuration))
        {
          goto LABEL_36;
        }
      }
    }
    v55 = objc_msgSend(obj, "countByEnumeratingWithState:objects:count:", &v67, v74, 16);
  }
  while (v55);
LABEL_39:

  v31 = _mo_log_facility_get_os_log(&MOLogFacilityPatternDetection);
  v32 = objc_claimAutoreleasedReturnValue(v31);
  v33 = v52;
  if (os_log_type_enabled(v32, OS_LOG_TYPE_INFO))
  {
    v34 = -[NSMutableArray count](v52, "count");
    *(_DWORD *)buf = 134217984;
    v76 = v34;
    _os_log_impl((void *)&_mh_execute_header, v32, OS_LOG_TYPE_INFO, "Found %lu significant contact events that met minimum requirements", buf, 0xCu);
  }

  if (-[NSMutableArray count](v52, "count"))
  {
    v59 = 0u;
    v60 = 0u;
    v61 = 0u;
    v62 = 0u;
    v58 = (id)objc_claimAutoreleasedReturnValue(-[NSMutableArray valueForKeyPath:](v52, "valueForKeyPath:", CFSTR("@distinctUnionOfObjects.interactionScoredContact.contact.identifier")));
    v35 = objc_msgSend(v58, "countByEnumeratingWithState:objects:count:", &v59, v72, 16);
    if (v35)
    {
      v36 = v35;
      v37 = *(_QWORD *)v60;
      do
      {
        for (k = 0; k != v36; k = (char *)k + 1)
        {
          if (*(_QWORD *)v60 != v37)
            objc_enumerationMutation(v58);
          v39 = (void *)objc_claimAutoreleasedReturnValue(+[NSPredicate predicateWithFormat:](NSPredicate, "predicateWithFormat:", CFSTR("interactionScoredContact.contact.identifier = %@"), *(_QWORD *)(*((_QWORD *)&v59 + 1) + 8 * (_QWORD)k)));
          v40 = (void *)objc_claimAutoreleasedReturnValue(-[NSMutableArray filteredArrayUsingPredicate:](v52, "filteredArrayUsingPredicate:", v39));
          v41 = objc_msgSend(objc_alloc((Class)NSSortDescriptor), "initWithKey:ascending:", CFSTR("startDate"), 1);
          v71 = v41;
          v42 = (void *)objc_claimAutoreleasedReturnValue(+[NSArray arrayWithObjects:count:](NSArray, "arrayWithObjects:count:", &v71, 1));
          v43 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v40, "sortedArrayUsingDescriptors:", v42));

          -[NSMutableArray addObject:](log, "addObject:", v43);
        }
        v36 = objc_msgSend(v58, "countByEnumeratingWithState:objects:count:", &v59, v72, 16);
      }
      while (v36);
    }
    v44 = log;

    v33 = v52;
  }
  else
  {
    v44 = 0;
  }

  v5 = v48;
  v4 = v49;
  v6 = v47;
LABEL_56:

LABEL_57:
  return v44;
}

- (BOOL)configure:(id)a3
{
  id v4;
  id v5;
  void *v6;
  void *v7;
  id os_log;
  NSObject *v9;
  void *v10;
  NSObject *v11;
  id v12;
  void *v13;
  NSObject *v14;
  id v15;
  void *v16;
  NSObject *v17;
  id v18;

  v4 = a3;
  v5 = objc_msgSend(v4, "count");
  if (v5)
  {
    v6 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v4, "objectForKey:", CFSTR("MinimumTextCount")));

    if (v6)
    {
      v7 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v4, "objectForKeyedSubscript:", CFSTR("MinimumTextCount")));
      self->_minimumTextCount = objc_msgSend(v7, "intValue");

    }
    else
    {
      os_log = _mo_log_facility_get_os_log(&MOLogFacilityPatternDetection);
      v9 = objc_claimAutoreleasedReturnValue(os_log);
      if (os_log_type_enabled(v9, OS_LOG_TYPE_ERROR))
        -[MOEventPatternDetectorPredicateFilterBySignificantContact configure:].cold.1();

    }
    v10 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v4, "objectForKey:", CFSTR("MinimumTotalCallDuration")));

    if (v10)
    {
      v11 = objc_claimAutoreleasedReturnValue(objc_msgSend(v4, "objectForKeyedSubscript:", CFSTR("MinimumTotalCallDuration")));
      self->_minimumTotalCallDuration = -[NSObject intValue](v11, "intValue");
    }
    else
    {
      v12 = _mo_log_facility_get_os_log(&MOLogFacilityPatternDetection);
      v11 = objc_claimAutoreleasedReturnValue(v12);
      if (os_log_type_enabled(v11, OS_LOG_TYPE_ERROR))
        -[MOEventPatternDetectorPredicateFilterBySignificantContact configure:].cold.1();
    }

    v13 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v4, "objectForKey:", CFSTR("MaximumNumberOfContacts")));
    if (v13)
    {
      v14 = objc_claimAutoreleasedReturnValue(objc_msgSend(v4, "objectForKeyedSubscript:", CFSTR("MaximumNumberOfContacts")));
      self->_maximumNumberOfContacts = -[NSObject intValue](v14, "intValue");
    }
    else
    {
      v15 = _mo_log_facility_get_os_log(&MOLogFacilityPatternDetection);
      v14 = objc_claimAutoreleasedReturnValue(v15);
      if (os_log_type_enabled(v14, OS_LOG_TYPE_ERROR))
        -[MOEventPatternDetectorPredicateFilterBySignificantContact configure:].cold.1();
    }

    v16 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v4, "objectForKey:", CFSTR("ExcludeTextOnlyConversations")));
    if (v16)
    {
      v17 = objc_claimAutoreleasedReturnValue(objc_msgSend(v4, "objectForKeyedSubscript:", CFSTR("ExcludeTextOnlyConversations")));
      self->_excludeTextOnlyConversations = -[NSObject BOOLValue](v17, "BOOLValue");
    }
    else
    {
      v18 = _mo_log_facility_get_os_log(&MOLogFacilityPatternDetection);
      v17 = objc_claimAutoreleasedReturnValue(v18);
      if (os_log_type_enabled(v17, OS_LOG_TYPE_ERROR))
        -[MOEventPatternDetectorPredicateFilterBySignificantContact configure:].cold.1();
    }

  }
  return v5 != 0;
}

- (void)filterEvents:(os_log_t)log .cold.1(os_log_t log)
{
  uint8_t v1[16];

  *(_WORD *)v1 = 0;
  _os_log_error_impl((void *)&_mh_execute_header, log, OS_LOG_TYPE_ERROR, "Significant contact filter configuration not set", v1, 2u);
}

- (void)configure:.cold.1()
{
  NSObject *v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint8_t v6;

  OUTLINED_FUNCTION_2();
  OUTLINED_FUNCTION_0((void *)&_mh_execute_header, v0, v1, "Configuration property not set for significant contact filter: %@", v2, v3, v4, v5, v6);
  OUTLINED_FUNCTION_1();
}

@end
