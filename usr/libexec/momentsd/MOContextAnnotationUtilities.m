@implementation MOContextAnnotationUtilities

+ (id)majorityPropertyFromEvents:(id)a3 propertyPath:(id)a4 valuePath:(id)a5
{
  id v7;
  void *v8;
  void *v9;
  void *v10;

  v7 = a4;
  v8 = (void *)objc_claimAutoreleasedReturnValue(+[MOContextAnnotationUtilities majorityGroupFromEvents:propertyPath:valuePath:](MOContextAnnotationUtilities, "majorityGroupFromEvents:propertyPath:valuePath:", a3, v7, a5));
  v9 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v8, "firstObject"));
  v10 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v9, "valueForKeyPath:", v7));

  return v10;
}

+ (id)majorityGroupFromEvents:(id)a3 propertyPath:(id)a4 valuePath:(id)a5
{
  id v7;
  id v8;
  id v9;
  void *v10;
  void *v11;
  id v12;
  id v13;
  uint64_t v14;
  double v15;
  void *i;
  void *v17;
  id v18;
  id v19;
  uint64_t v20;
  double v21;
  void *j;
  void *v23;
  double v24;
  id v25;
  void *v27;
  void *v28;
  id obj;
  id v30;
  __int128 v31;
  __int128 v32;
  __int128 v33;
  __int128 v34;
  __int128 v35;
  __int128 v36;
  __int128 v37;
  __int128 v38;
  _BYTE v39[128];
  _BYTE v40[128];

  v7 = a3;
  v8 = a4;
  v9 = a5;
  v27 = v8;
  v28 = v7;
  v10 = (void *)objc_claimAutoreleasedReturnValue(+[MOContextAnnotationUtilities groupedEventsFromEvents:propertyPath:](MOContextAnnotationUtilities, "groupedEventsFromEvents:propertyPath:", v7, v8));
  v11 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v10, "allValues"));
  v30 = (id)objc_claimAutoreleasedReturnValue(objc_msgSend(v11, "firstObject"));

  v37 = 0u;
  v38 = 0u;
  v35 = 0u;
  v36 = 0u;
  obj = (id)objc_claimAutoreleasedReturnValue(objc_msgSend(v10, "allKeys"));
  v12 = objc_msgSend(obj, "countByEnumeratingWithState:objects:count:", &v35, v40, 16);
  if (v12)
  {
    v13 = v12;
    v14 = *(_QWORD *)v36;
    v15 = -1.79769313e308;
    do
    {
      for (i = 0; i != v13; i = (char *)i + 1)
      {
        if (*(_QWORD *)v36 != v14)
          objc_enumerationMutation(obj);
        v17 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v10, "objectForKey:", *(_QWORD *)(*((_QWORD *)&v35 + 1) + 8 * (_QWORD)i)));
        v31 = 0u;
        v32 = 0u;
        v33 = 0u;
        v34 = 0u;
        v18 = objc_msgSend(v17, "countByEnumeratingWithState:objects:count:", &v31, v39, 16);
        if (v18)
        {
          v19 = v18;
          v20 = *(_QWORD *)v32;
          v21 = 0.0;
          do
          {
            for (j = 0; j != v19; j = (char *)j + 1)
            {
              if (*(_QWORD *)v32 != v20)
                objc_enumerationMutation(v17);
              v23 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(*(id *)(*((_QWORD *)&v31 + 1)
                                                                                 + 8 * (_QWORD)j), "valueForKeyPath:", v9));
              objc_msgSend(v23, "doubleValue");
              v21 = v21 + v24;

            }
            v19 = objc_msgSend(v17, "countByEnumeratingWithState:objects:count:", &v31, v39, 16);
          }
          while (v19);
        }
        else
        {
          v21 = 0.0;
        }
        if (v21 > v15)
        {
          v25 = v17;

          v30 = v25;
          v15 = v21;
        }

      }
      v13 = objc_msgSend(obj, "countByEnumeratingWithState:objects:count:", &v35, v40, 16);
    }
    while (v13);
  }

  return v30;
}

+ (void)filterEventsIntersectingDateRange:(id)a3 rangeStart:(id)a4 rangeEnd:(id)a5 handler:(id)a6
{
  id v9;
  id v10;
  id v11;
  void (**v12)(id, void *, _QWORD);
  id v13;
  id v14;
  id v15;
  char v16;
  uint64_t v17;
  void *i;
  void *v19;
  void *v20;
  double v21;
  void *v22;
  double v23;
  double v24;
  void *v25;
  double v26;
  BOOL v27;
  void (**v28)(id, void *, _QWORD);
  id v29;
  NSMutableArray *v30;
  __int128 v31;
  __int128 v32;
  __int128 v33;
  __int128 v34;
  _BYTE v35[128];

  v9 = a3;
  v10 = a4;
  v11 = a5;
  v12 = (void (**)(id, void *, _QWORD))a6;
  if (objc_msgSend(v9, "count"))
  {
    v28 = v12;
    v29 = v9;
    v30 = objc_opt_new(NSMutableArray);
    v31 = 0u;
    v32 = 0u;
    v33 = 0u;
    v34 = 0u;
    v13 = v9;
    v14 = objc_msgSend(v13, "countByEnumeratingWithState:objects:count:", &v31, v35, 16);
    if (v14)
    {
      v15 = v14;
      v16 = 0;
      v17 = *(_QWORD *)v32;
      do
      {
        for (i = 0; i != v15; i = (char *)i + 1)
        {
          if (*(_QWORD *)v32 != v17)
            objc_enumerationMutation(v13);
          v19 = *(void **)(*((_QWORD *)&v31 + 1) + 8 * (_QWORD)i);
          v20 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v19, "endDate"));
          objc_msgSend(v20, "timeIntervalSinceDate:", v10);
          if (v21 >= 0.0)
          {
            v22 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v19, "startDate"));
            objc_msgSend(v11, "timeIntervalSinceDate:", v22);
            v24 = v23;

            if (v24 >= 0.0)
              -[NSMutableArray addObject:](v30, "addObject:", v19);
          }
          else
          {

          }
          v25 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v19, "endDate"));
          objc_msgSend(v25, "timeIntervalSinceDate:", v11);
          v27 = v26 >= 0.0;

          v16 |= v27;
        }
        v15 = objc_msgSend(v13, "countByEnumeratingWithState:objects:count:", &v31, v35, 16);
      }
      while (v15);
    }
    else
    {
      v16 = 0;
    }

    v12 = v28;
    v28[2](v28, v30, v16 & 1);

    v9 = v29;
  }
  else
  {
    v12[2](v12, &__NSArray0__struct, 0);
  }

}

+ (void)filterEventsIntersectingDateRange:(id)a3 rangeStart:(id)a4 rangeEnd:(id)a5 eventInterval:(double)a6 handler:(id)a7
{
  id v11;
  id v12;
  id v13;
  void (**v14)(id, void *, _QWORD, float);
  NSMutableArray *v15;
  id v16;
  id v17;
  char v18;
  uint64_t v19;
  float v20;
  void *i;
  void *v22;
  void *v23;
  double v24;
  void *v25;
  double v26;
  double v27;
  void *v28;
  NSMutableArray *v29;
  void *v30;
  id v31;
  void *v32;
  id v33;
  void *v34;
  double v35;
  void *v36;
  double v37;
  BOOL v38;
  __n128 v39;
  id os_log;
  NSObject *v41;
  __n128 v42;
  void (**v43)(id, void *, _QWORD, float);
  id v44;
  id v45;
  id obj;
  __int128 v47;
  __int128 v48;
  __int128 v49;
  __int128 v50;
  uint8_t buf[4];
  double v52;
  __int16 v53;
  double v54;
  _BYTE v55[128];

  v11 = a3;
  v12 = a4;
  v13 = a5;
  v14 = (void (**)(id, void *, _QWORD, float))a7;
  if (!objc_msgSend(v11, "count"))
  {
    v14[2](v14, &__NSArray0__struct, 0, 0.0);
    goto LABEL_28;
  }
  v43 = v14;
  v15 = objc_opt_new(NSMutableArray);
  v47 = 0u;
  v48 = 0u;
  v49 = 0u;
  v50 = 0u;
  v44 = v11;
  obj = v11;
  v16 = objc_msgSend(obj, "countByEnumeratingWithState:objects:count:", &v47, v55, 16);
  if (!v16)
  {
    v18 = 0;
    v20 = 0.0;
    goto LABEL_22;
  }
  v17 = v16;
  v18 = 0;
  v19 = *(_QWORD *)v48;
  v20 = 0.0;
  v45 = v12;
  do
  {
    for (i = 0; i != v17; i = (char *)i + 1)
    {
      if (*(_QWORD *)v48 != v19)
        objc_enumerationMutation(obj);
      v22 = *(void **)(*((_QWORD *)&v47 + 1) + 8 * (_QWORD)i);
      v23 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v22, "endDate", v43));
      objc_msgSend(v23, "timeIntervalSinceDate:", v12);
      if (v24 >= 0.0)
      {
        v25 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v22, "startDate"));
        objc_msgSend(v13, "timeIntervalSinceDate:", v25);
        v27 = v26;

        if (v27 < 0.0)
          goto LABEL_17;
        v28 = v12;
        v29 = v15;
        v30 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v22, "startDate"));
        if (objc_msgSend(v30, "isBeforeDate:", v28))
          v31 = v28;
        else
          v31 = (id)objc_claimAutoreleasedReturnValue(objc_msgSend(v22, "startDate"));
        v23 = v31;

        v32 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v22, "endDate"));
        if (objc_msgSend(v32, "isAfterDate:", v13))
          v33 = v13;
        else
          v33 = (id)objc_claimAutoreleasedReturnValue(objc_msgSend(v22, "endDate"));
        v34 = v33;

        objc_msgSend(v34, "timeIntervalSinceDate:", v23);
        v20 = v35 + v20;
        v15 = v29;
        -[NSMutableArray addObject:](v29, "addObject:", v22);

        v12 = v45;
      }

LABEL_17:
      v36 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v22, "endDate"));
      objc_msgSend(v36, "timeIntervalSinceDate:", v13);
      v38 = v37 >= 0.0;

      v18 |= v38;
    }
    v17 = objc_msgSend(obj, "countByEnumeratingWithState:objects:count:", &v47, v55, 16);
  }
  while (v17);
LABEL_22:

  if (v20 >= a6)
  {
    v14 = v43;
    v39.n128_f32[0] = v20;
    ((void (*)(void (**)(id, void *, _QWORD, float), NSMutableArray *, _QWORD, __n128))v43[2])(v43, v15, v18 & 1, v39);
  }
  else
  {
    os_log = _mo_log_facility_get_os_log(&MOLogFacilityEventBundleManager);
    v41 = objc_claimAutoreleasedReturnValue(os_log);
    v14 = v43;
    if (os_log_type_enabled(v41, OS_LOG_TYPE_INFO))
    {
      *(_DWORD *)buf = 134218240;
      v52 = v20;
      v53 = 2048;
      v54 = a6;
      _os_log_impl((void *)&_mh_execute_header, v41, OS_LOG_TYPE_INFO, "P@H: Total Home duration is %f s, doesn't meet threshold %f s", buf, 0x16u);
    }

    v42.n128_u32[0] = 0;
    ((void (*)(void (**)(id, void *, _QWORD, float), void *, _QWORD, __n128))v43[2])(v43, &__NSArray0__struct, 0, v42);
  }
  v11 = v44;

LABEL_28:
}

+ (id)groupedEventsFromEvents:(id)a3 propertyPath:(id)a4
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
  NSMutableArray *v15;
  id v16;
  id v18;
  __int128 v19;
  __int128 v20;
  __int128 v21;
  __int128 v22;
  _BYTE v23[128];

  v5 = a3;
  v6 = a4;
  if (objc_msgSend(v5, "count"))
  {
    v7 = objc_opt_new(NSMutableDictionary);
    v19 = 0u;
    v20 = 0u;
    v21 = 0u;
    v22 = 0u;
    v18 = v5;
    v8 = v5;
    v9 = objc_msgSend(v8, "countByEnumeratingWithState:objects:count:", &v19, v23, 16);
    if (v9)
    {
      v10 = v9;
      v11 = *(_QWORD *)v20;
      do
      {
        for (i = 0; i != v10; i = (char *)i + 1)
        {
          if (*(_QWORD *)v20 != v11)
            objc_enumerationMutation(v8);
          v13 = *(void **)(*((_QWORD *)&v19 + 1) + 8 * (_QWORD)i);
          v14 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v13, "valueForKey:", v6));
          if (v14)
          {
            v15 = (NSMutableArray *)objc_claimAutoreleasedReturnValue(-[NSMutableDictionary objectForKey:](v7, "objectForKey:", v14));
            if (!v15)
              v15 = objc_opt_new(NSMutableArray);
            -[NSMutableArray addObject:](v15, "addObject:", v13);
            -[NSMutableDictionary setObject:forKey:](v7, "setObject:forKey:", v15, v14);

          }
        }
        v10 = objc_msgSend(v8, "countByEnumeratingWithState:objects:count:", &v19, v23, 16);
      }
      while (v10);
    }

    v16 = -[NSMutableDictionary copy](v7, "copy");
    v5 = v18;
  }
  else
  {
    v16 = &__NSDictionary0__struct;
  }

  return v16;
}

+ (id)annotateEventBundle:(id)a3 visitEvents:(id)a4 universe:(id)a5
{
  id v7;
  id v8;
  id v9;
  uint64_t v10;
  objc_class *v11;
  NSString *v12;
  void *v13;
  void *v14;
  __CFString *v15;
  double v16;
  float v17;
  double v18;
  double v19;
  float v20;
  double v21;
  void *v22;
  uint64_t v23;
  id v24;
  id v25;
  id v26;
  uint64_t v27;
  dispatch_once_t *v28;
  void *v29;
  void *v30;
  void *v31;
  double v32;
  double v33;
  void *v34;
  BOOL v35;
  int v36;
  void *v37;
  id os_log;
  NSObject *v39;
  uint64_t v40;
  id v41;
  void *v42;
  uint64_t v43;
  void *v44;
  void *v45;
  double v46;
  double v47;
  MOPlace *v48;
  void *v49;
  id v50;
  void *v51;
  double v52;
  double v53;
  void *v54;
  void *v55;
  MOPlace *v56;
  void *v57;
  BOOL v58;
  void *v59;
  id v60;
  NSObject *v61;
  uint64_t v62;
  id v63;
  void *v64;
  id v65;
  NSObject *v66;
  uint64_t v67;
  id v68;
  unsigned int v69;
  double v70;
  double v71;
  double v72;
  double v73;
  uint64_t v74;
  void *v75;
  void *v76;
  double v77;
  double v78;
  id v79;
  uint64_t v80;
  MOPlace *v81;
  void *v82;
  void *v83;
  double v84;
  double v85;
  void *v86;
  uint64_t v87;
  void *v88;
  void *v89;
  uint64_t v90;
  void *v91;
  id v92;
  void *v93;
  id v94;
  void *v95;
  void *v96;
  MOResource *v97;
  uint64_t v98;
  __CFString *v99;
  id v100;
  dispatch_once_t *v101;
  void *v102;
  void *v103;
  void *v104;
  MOResource *v105;
  void *v106;
  objc_class *v107;
  NSString *v108;
  void *v109;
  id v110;
  objc_class *v111;
  NSString *v112;
  void *v113;
  id v114;
  objc_class *v115;
  NSString *v116;
  void *v117;
  id v118;
  NSMutableArray *v120;
  void *v121;
  id v122;
  id v123;
  id v124;
  __CFString *v126;
  uint64_t v127;
  id obj;
  BOOL v129;
  void *v130;
  id v131;
  void *v132;
  __int128 v133;
  __int128 v134;
  __int128 v135;
  __int128 v136;
  uint8_t buf[4];
  void *v138;
  __int16 v139;
  void *v140;
  __int16 v141;
  void *v142;
  __int16 v143;
  __CFString *v144;
  __int16 v145;
  double v146;
  __int16 v147;
  id v148;
  _BYTE v149[128];

  v7 = a3;
  v8 = a4;
  v9 = a5;
  if (objc_msgSend(v8, "count"))
  {
    v11 = (objc_class *)objc_opt_class(MOConfigurationManager, v10);
    v12 = NSStringFromClass(v11);
    v13 = (void *)objc_claimAutoreleasedReturnValue(v12);
    v122 = v9;
    v14 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v9, "getService:", v13));

    v15 = CFSTR("aboveDoorShortAddress");
    v121 = v14;
    if (v14)
    {
      LODWORD(v16) = *(_DWORD *)"fff?";
      objc_msgSend(v14, "getFloatSettingForKey:withFallback:", CFSTR("VA_VisitLabelMediumConfidenceThreshold"), v16);
      v18 = v17;
      LODWORD(v19) = 0.5;
      objc_msgSend(v14, "getFloatSettingForKey:withFallback:", CFSTR("VA_AOIVisitLabelConfidentThreshold"), v19);
      v21 = v20;
      v22 = (void *)objc_claimAutoreleasedReturnValue(+[NSString stringWithFormat:](NSString, "stringWithFormat:", CFSTR("%@_%@"), CFSTR("addressFormatting"), CFSTR("formatOption")));
      v23 = objc_claimAutoreleasedReturnValue(objc_msgSend(v14, "getStringSettingForKey:withFallback:", v22, v15));

      objc_msgSend(v14, "getDoubleSettingForKey:withFallback:", CFSTR("distanceOfSnappingThreshold"), 150.0);
      v15 = (__CFString *)v23;
    }
    else
    {
      v21 = 0.5;
      v18 = 0.9;
    }
    v120 = objc_opt_new(NSMutableArray);
    v133 = 0u;
    v134 = 0u;
    v135 = 0u;
    v136 = 0u;
    v123 = v8;
    obj = v8;
    v25 = objc_msgSend(obj, "countByEnumeratingWithState:objects:count:", &v133, v149, 16);
    if (v25)
    {
      v26 = v25;
      v27 = *(_QWORD *)v134;
      v28 = &MOLogFacilityEventBundleManager;
      v124 = v7;
      v126 = v15;
      v127 = *(_QWORD *)v134;
      do
      {
        v29 = 0;
        v131 = v26;
        do
        {
          if (*(_QWORD *)v134 != v27)
            objc_enumerationMutation(obj);
          v30 = *(void **)(*((_QWORD *)&v133 + 1) + 8 * (_QWORD)v29);
          if (objc_msgSend(v30, "category") == (id)1)
          {
            v31 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v30, "placeName"));
            objc_msgSend(v30, "placeNameConfidence");
            v33 = v32;
            v132 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v30, "formatLocalityWithFormatOption:", v15));
            if (!v132)
            {
              v132 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v30, "formatAdministrativeAreaWithFormatOption:", v15));
              if (!v132)
                v132 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v30, "formatCountryWithFormatOption:", v15));
            }
            v34 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v30, "placeName"));

            if (v34)
            {
              v35 = objc_msgSend(v30, "placeType") == (id)3 && v33 < v18;
              if (v35 && (objc_msgSend(v30, "placeSource") & 0x40000) == 0
                || (v36 = 0, objc_msgSend(v30, "placeType") == (id)2) && v33 < v21)
              {
                v37 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v30, "formatAddressWithFormatOption:", v15));
                os_log = _mo_log_facility_get_os_log(v28);
                v39 = objc_claimAutoreleasedReturnValue(os_log);
                if (os_log_type_enabled(v39, OS_LOG_TYPE_DEBUG))
                {
                  v115 = (objc_class *)objc_opt_class(a1, v40);
                  v116 = NSStringFromClass(v115);
                  v117 = (void *)objc_claimAutoreleasedReturnValue(v116);
                  v118 = objc_msgSend(v30, "placeType");
                  *(_DWORD *)buf = 138413570;
                  v138 = v117;
                  v139 = 2112;
                  v140 = v31;
                  v141 = 2112;
                  v142 = v37;
                  v143 = 2112;
                  v144 = v15;
                  v145 = 2048;
                  v146 = v33;
                  v147 = 2048;
                  v148 = v118;
                  _os_log_debug_impl((void *)&_mh_execute_header, v39, OS_LOG_TYPE_DEBUG, "%@: original place name, %@, new place name, %@, format option, %@, confidence, %f, placeType, %lu", buf, 0x3Eu);

                  v7 = v124;
                }

                if (v37)
                {
                  v41 = v37;

                  v36 = 1;
                  v31 = v41;
                }
                else
                {
                  v36 = 0;
                }

              }
              if (objc_msgSend(v30, "placeType") == (id)4 || objc_msgSend(v30, "placeType") == (id)5)
              {
                v59 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v30, "formatAddressWithFormatOption:", v15));
                v60 = _mo_log_facility_get_os_log(v28);
                v61 = objc_claimAutoreleasedReturnValue(v60);
                if (os_log_type_enabled(v61, OS_LOG_TYPE_DEBUG))
                {
                  v107 = (objc_class *)objc_opt_class(a1, v62);
                  v108 = NSStringFromClass(v107);
                  v109 = (void *)objc_claimAutoreleasedReturnValue(v108);
                  v110 = objc_msgSend(v30, "placeType");
                  *(_DWORD *)buf = 138413570;
                  v138 = v109;
                  v139 = 2112;
                  v140 = v31;
                  v141 = 2112;
                  v142 = v59;
                  v143 = 2112;
                  v144 = v15;
                  v145 = 2048;
                  v146 = v33;
                  v147 = 2048;
                  v148 = v110;
                  _os_log_debug_impl((void *)&_mh_execute_header, v61, OS_LOG_TYPE_DEBUG, "%@: original place name, %@, new place name, %@, format option, %@, confidence, %f, placeType, %lu", buf, 0x3Eu);

                  v7 = v124;
                }

                if (v59)
                {
                  v63 = v59;

                  v36 = 1;
                  v31 = v63;
                }

              }
              if (objc_msgSend(v30, "placeSource") == (id)0x2000 || objc_msgSend(v30, "placeSource") == (id)8193)
              {
                v64 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v30, "formatAddressWithFormatOption:", v15));
                v65 = _mo_log_facility_get_os_log(v28);
                v66 = objc_claimAutoreleasedReturnValue(v65);
                if (os_log_type_enabled(v66, OS_LOG_TYPE_DEBUG))
                {
                  v111 = (objc_class *)objc_opt_class(a1, v67);
                  v112 = NSStringFromClass(v111);
                  v113 = (void *)objc_claimAutoreleasedReturnValue(v112);
                  v114 = objc_msgSend(v30, "placeType");
                  *(_DWORD *)buf = 138413570;
                  v138 = v113;
                  v139 = 2112;
                  v140 = v31;
                  v141 = 2112;
                  v142 = v64;
                  v143 = 2112;
                  v144 = v15;
                  v145 = 2048;
                  v146 = v33;
                  v147 = 2048;
                  v148 = v114;
                  _os_log_debug_impl((void *)&_mh_execute_header, v66, OS_LOG_TYPE_DEBUG, "%@: original place name, %@, new place name, %@, format option, %@, confidence, %f, placeType, %lu", buf, 0x3Eu);

                  v7 = v124;
                }

                if (v64)
                {
                  v68 = v64;

                  v36 = 1;
                  v31 = v68;
                }

              }
              v69 = objc_msgSend(v30, "isHighConfidence");
              objc_msgSend(v30, "placeNameConfidence");
              v71 = 1.0;
              if (!v69)
                v71 = 0.9;
              v72 = v70 * v71;
              if (v72 >= 0.0)
                v73 = v72;
              else
                v73 = 0.0;
              v74 = objc_claimAutoreleasedReturnValue(objc_msgSend(v7, "place"));
              if (v74)
              {
                v75 = (void *)v74;
                v76 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v7, "place"));
                objc_msgSend(v76, "placeNameConfidence");
                v78 = v77;

                if (v36)
                {
                  v73 = 0.0;
                  v58 = 1;
                }
                else
                {
                  v58 = 0;
                }
                if (v73 <= v78)
                {
                  v27 = v127;
                  v26 = v131;
                  goto LABEL_67;
                }
              }
              else
              {
                v58 = v36 != 0;
                if (v36)
                  v73 = 0.0;
              }
              v129 = v58;
              v79 = objc_msgSend(v30, "placeType");
              if (v36)
                v80 = 5;
              else
                v80 = (uint64_t)v79;
              v81 = [MOPlace alloc];
              objc_msgSend(v30, "placeUserType");
              v82 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v30, "location"));
              objc_msgSend(v30, "mode");
              v83 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v30, "poiCategory"));
              objc_msgSend(v30, "familiarityIndexLOI");
              v85 = v84;
              v86 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v30, "startDate"));
              v87 = objc_claimAutoreleasedReturnValue(objc_msgSend(v30, "endDate"));
              v88 = v31;
              v89 = (void *)v87;
              v130 = v88;
              v56 = -[MOPlace initWithPlaceName:enclosingArea:placeType:placeUserType:location:locationMode:poiCategory:distanceToHomeInMiles:placeNameConfidence:familiarityIndexLOI:startDate:endDate:](v81, "initWithPlaceName:enclosingArea:placeType:placeUserType:location:locationMode:poiCategory:distanceToHomeInMiles:placeNameConfidence:familiarityIndexLOI:startDate:endDate:", -1.0, v73, v85, v83, v86, v87);

              v7 = v124;
              v91 = (void *)objc_opt_class(a1, v90);
              v92 = objc_msgSend(v30, "placeUserType");
              v93 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v30, "routineEvent"));
              v94 = objc_msgSend(v93, "mapItemPlaceType");
              v95 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v30, "routineEvent"));
              objc_msgSend(v95, "distanceFromVisitToPlace");
              -[MOPlace setProposition:](v56, "setProposition:", objc_msgSend(v91, "prepositionWithPlaceType:userPlaceType:mapItemPlaceType:distanceFromVisitToPlace:snappingThreshold:", v80, v92, v94));

              v57 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v30, "eventIdentifier"));
              -[MOPlace setSourceEventIdentifier:](v56, "setSourceEventIdentifier:", v57);
            }
            else
            {
              v42 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v30, "location"));

              if (!v42
                || (v43 = objc_claimAutoreleasedReturnValue(objc_msgSend(v7, "place"))) != 0
                && (v44 = (void *)v43,
                    v45 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v7, "place")),
                    objc_msgSend(v45, "placeNameConfidence"),
                    v47 = v46,
                    v45,
                    v44,
                    v33 <= v47))
              {
                v58 = 0;
                goto LABEL_67;
              }
              v130 = v31;
              v48 = [MOPlace alloc];
              v49 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v30, "location"));
              v50 = objc_msgSend(v30, "mode");
              v51 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v30, "poiCategory"));
              objc_msgSend(v30, "familiarityIndexLOI");
              v53 = v52;
              v54 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v30, "startDate"));
              v55 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v30, "endDate"));
              v56 = -[MOPlace initWithPlaceName:enclosingArea:placeType:placeUserType:location:locationMode:poiCategory:distanceToHomeInMiles:placeNameConfidence:familiarityIndexLOI:startDate:endDate:](v48, "initWithPlaceName:enclosingArea:placeType:placeUserType:location:locationMode:poiCategory:distanceToHomeInMiles:placeNameConfidence:familiarityIndexLOI:startDate:endDate:", 0, v132, 0, 0, v49, v50, -1.0, 0.0, v53, v51, v54, v55);

              v57 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v30, "eventIdentifier"));
              -[MOPlace setSourceEventIdentifier:](v56, "setSourceEventIdentifier:", v57);
              v129 = 0;
            }

            objc_msgSend(v7, "setPlace:", v56);
            v15 = v126;
            v27 = v127;
            v31 = v130;
            v26 = v131;
            v28 = &MOLogFacilityEventBundleManager;
            v58 = v129;
LABEL_67:
            v96 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v30, "placeMapItem"));

            if (v96 && !v58)
            {
              v97 = [MOResource alloc];
              v98 = v27;
              v99 = v15;
              v100 = v7;
              v101 = v28;
              v102 = v31;
              v103 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v30, "placeName"));
              v104 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v30, "placeMapItem"));
              v105 = -[MOResource initWithName:mapItemHandle:priorityScore:](v97, "initWithName:mapItemHandle:priorityScore:", v103, v104, -1.0);

              v106 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v30, "eventIdentifier"));
              -[MOResource setSourceEventIdentifier:](v105, "setSourceEventIdentifier:", v106);

              v31 = v102;
              v28 = v101;
              v7 = v100;
              v15 = v99;
              v27 = v98;
              v26 = v131;
              objc_msgSend(v7, "addResource:", v105);

            }
          }
          v29 = (char *)v29 + 1;
        }
        while (v26 != v29);
        v26 = objc_msgSend(obj, "countByEnumeratingWithState:objects:count:", &v133, v149, 16);
      }
      while (v26);
    }

    v24 = -[NSMutableArray copy](v120, "copy");
    v9 = v122;
    v8 = v123;
  }
  else
  {
    v24 = &__NSArray0__struct;
  }

  return v24;
}

+ (id)annotateEventBundle:(id)a3 dateIntervalEvents:(id)a4 emotionEvents:(id)a5 bundleDurationThreshold:(float)a6
{
  id v9;
  id v10;
  id v11;
  id v12;
  id v13;
  id v14;
  uint64_t v15;
  float v16;
  void *i;
  void *v18;
  id v19;
  void *v20;
  void *v21;
  id v22;
  double v23;
  NSMutableArray *v24;
  id v25;
  id v26;
  void *j;
  void *v28;
  void *v29;
  id v30;
  void *v31;
  void *v32;
  void *v33;
  id v34;
  NSMutableArray *v35;
  id v36;
  id v37;
  uint64_t v38;
  void *k;
  void *v40;
  double v41;
  id os_log;
  NSObject *v43;
  _BOOL4 v44;
  double v45;
  id v46;
  NSMutableArray *v47;
  double v48;
  void *v49;
  id v50;
  id v52;
  id v53;
  void *v54;
  id obj;
  NSMutableArray *v56;
  uint64_t v57;
  NSMutableArray *v58;
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
  uint8_t buf[4];
  double v72;
  __int16 v73;
  double v74;
  __int16 v75;
  double v76;
  __int16 v77;
  id v78;
  __int16 v79;
  id v80;
  _BYTE v81[128];
  _BYTE v82[128];
  _BYTE v83[128];

  v9 = a3;
  v10 = a4;
  v11 = a5;
  if (objc_msgSend(v11, "count"))
  {
    v54 = v9;
    v58 = objc_opt_new(NSMutableArray);
    v53 = v10;
    if (v10)
    {
      v69 = 0u;
      v70 = 0u;
      v67 = 0u;
      v68 = 0u;
      v12 = v10;
      v13 = objc_msgSend(v12, "countByEnumeratingWithState:objects:count:", &v67, v83, 16);
      if (v13)
      {
        v14 = v13;
        v15 = *(_QWORD *)v68;
        v16 = 0.0;
        do
        {
          for (i = 0; i != v14; i = (char *)i + 1)
          {
            if (*(_QWORD *)v68 != v15)
              objc_enumerationMutation(v12);
            v18 = *(void **)(*((_QWORD *)&v67 + 1) + 8 * (_QWORD)i);
            v19 = objc_alloc((Class)NSDateInterval);
            v20 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v18, "startDate"));
            v21 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v18, "endDate"));
            v22 = objc_msgSend(v19, "initWithStartDate:endDate:", v20, v21);

            -[NSMutableArray addObject:](v58, "addObject:", v22);
            objc_msgSend(v22, "duration");
            v16 = v23 + v16;

          }
          v14 = objc_msgSend(v12, "countByEnumeratingWithState:objects:count:", &v67, v83, 16);
        }
        while (v14);
      }
      else
      {
        v16 = 0.0;
      }

    }
    else
    {
      v16 = 0.0;
    }
    v56 = objc_opt_new(NSMutableArray);
    v63 = 0u;
    v64 = 0u;
    v65 = 0u;
    v66 = 0u;
    v52 = v11;
    obj = v11;
    v25 = objc_msgSend(obj, "countByEnumeratingWithState:objects:count:", &v63, v82, 16);
    if (v25)
    {
      v26 = v25;
      v57 = *(_QWORD *)v64;
      do
      {
        for (j = 0; j != v26; j = (char *)j + 1)
        {
          if (*(_QWORD *)v64 != v57)
            objc_enumerationMutation(obj);
          v28 = *(void **)(*((_QWORD *)&v63 + 1) + 8 * (_QWORD)j);
          v29 = (void *)objc_claimAutoreleasedReturnValue(+[NSCalendar currentCalendar](NSCalendar, "currentCalendar"));
          v30 = objc_alloc((Class)NSDateInterval);
          v31 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v28, "startDate"));
          v32 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v28, "endDate"));
          v33 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v29, "dateByAddingUnit:value:toDate:options:", 128, 10, v32, 0));
          v34 = objc_msgSend(v30, "initWithStartDate:endDate:", v31, v33);

          v61 = 0u;
          v62 = 0u;
          v59 = 0u;
          v60 = 0u;
          v35 = v58;
          v36 = -[NSMutableArray countByEnumeratingWithState:objects:count:](v35, "countByEnumeratingWithState:objects:count:", &v59, v81, 16);
          if (v36)
          {
            v37 = v36;
            v38 = *(_QWORD *)v60;
            while (2)
            {
              for (k = 0; k != v37; k = (char *)k + 1)
              {
                if (*(_QWORD *)v60 != v38)
                  objc_enumerationMutation(v35);
                v40 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(*(id *)(*((_QWORD *)&v59 + 1) + 8 * (_QWORD)k), "intersectionWithDateInterval:", v34));
                objc_msgSend(v40, "duration");
                if (v41 > 0.0)
                {
                  -[NSMutableArray addObject:](v56, "addObject:", v28);

                  goto LABEL_30;
                }

              }
              v37 = -[NSMutableArray countByEnumeratingWithState:objects:count:](v35, "countByEnumeratingWithState:objects:count:", &v59, v81, 16);
              if (v37)
                continue;
              break;
            }
          }
LABEL_30:

        }
        v26 = objc_msgSend(obj, "countByEnumeratingWithState:objects:count:", &v63, v82, 16);
      }
      while (v26);
    }

    os_log = _mo_log_facility_get_os_log(&MOLogFacilityEventBundleManager);
    v43 = objc_claimAutoreleasedReturnValue(os_log);
    v44 = os_log_type_enabled(v43, OS_LOG_TYPE_INFO);
    if (v16 <= a6)
    {
      v9 = v54;
      v11 = v52;
      v47 = v56;
      if (v44)
      {
        v48 = COERCE_DOUBLE(-[NSMutableArray count](v56, "count"));
        v49 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v54, "suggestionID"));
        v50 = objc_msgSend(v54, "bundleSuperType");
        *(_DWORD *)buf = 134219010;
        v72 = v48;
        v73 = 2048;
        v74 = v16;
        v75 = 2048;
        v76 = a6;
        v77 = 2112;
        v78 = v49;
        v79 = 2048;
        v80 = v50;
        _os_log_impl((void *)&_mh_execute_header, v43, OS_LOG_TYPE_INFO, "N=%lu emotion events attached to bundle since total bundle duration (%.2f) is less or equal to threshold (%.2f), suggestionID %@, bundleSuperType %lu", buf, 0x34u);

      }
      v24 = v56;
      v10 = v53;
    }
    else
    {
      v10 = v53;
      v9 = v54;
      v11 = v52;
      if (v44)
      {
        v45 = COERCE_DOUBLE(objc_claimAutoreleasedReturnValue(objc_msgSend(v54, "suggestionID")));
        v46 = objc_msgSend(v54, "bundleSuperType");
        *(_DWORD *)buf = 134218754;
        v72 = v16;
        v73 = 2048;
        v74 = a6;
        v75 = 2112;
        v76 = v45;
        v77 = 2048;
        v78 = v46;
        _os_log_impl((void *)&_mh_execute_header, v43, OS_LOG_TYPE_INFO, "No emotion events attached to bundle since total bundle duration (%.2f) is higher than threshold (%.2f), suggestionID %@, bundleSuperType %lu", buf, 0x2Au);

      }
      v24 = (NSMutableArray *)&__NSArray0__struct;
      v47 = v56;
    }

  }
  else
  {
    v24 = (NSMutableArray *)&__NSArray0__struct;
  }

  return v24;
}

+ (id)annotateEventBundle:(id)a3 leisureMediaEvents:(id)a4
{
  id v5;
  id v6;
  void *v7;
  void *v8;
  void *v9;
  void *v10;
  void *v11;
  id v12;
  id v13;
  uint64_t v14;
  double v15;
  double v16;
  void *i;
  void *v18;
  id v19;
  id v20;
  id v21;
  uint64_t v22;
  double v23;
  void *j;
  void *v25;
  double v26;
  void *v27;
  void *v28;
  uint64_t v29;
  void *v30;
  void *v31;
  id v32;
  double v33;
  NSObject *v34;
  MOAction *v35;
  void *v36;
  MOResource *v37;
  void *v38;
  MOResource *v39;
  void *v40;
  id os_log;
  NSObject *v42;
  id v43;
  uint64_t v44;
  uint64_t v45;
  uint64_t v46;
  uint64_t v47;
  uint64_t v48;
  uint64_t v49;
  id v51;
  void *v52;
  id obj;
  __int128 v54;
  __int128 v55;
  __int128 v56;
  __int128 v57;
  __int128 v58;
  __int128 v59;
  __int128 v60;
  __int128 v61;
  uint8_t buf[4];
  MOAction *v63;
  _BYTE v64[128];
  _BYTE v65[128];

  v5 = a3;
  v6 = a4;
  if (!objc_msgSend(v6, "count"))
  {
    v32 = &__NSArray0__struct;
    goto LABEL_39;
  }
  v51 = v6;
  v52 = v5;
  v7 = (void *)objc_claimAutoreleasedReturnValue(+[MOContextAnnotationUtilities groupedEventsFromEvents:propertyPath:](MOContextAnnotationUtilities, "groupedEventsFromEvents:propertyPath:", v6, CFSTR("mediaArtist")));
  v8 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v7, "allValues"));

  v9 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v8, "firstObject"));
  v10 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v9, "firstObject"));

  v11 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v10, "mediaTitle"));
  v58 = 0u;
  v59 = 0u;
  v60 = 0u;
  v61 = 0u;
  obj = v8;
  v12 = objc_msgSend(obj, "countByEnumeratingWithState:objects:count:", &v58, v65, 16);
  if (!v12)
  {
    v15 = 0.0;
    v16 = -1.79769313e308;
    goto LABEL_29;
  }
  v13 = v12;
  v14 = *(_QWORD *)v59;
  v15 = 0.0;
  v16 = -1.79769313e308;
  do
  {
    for (i = 0; i != v13; i = (char *)i + 1)
    {
      if (*(_QWORD *)v59 != v14)
        objc_enumerationMutation(obj);
      v18 = *(void **)(*((_QWORD *)&v58 + 1) + 8 * (_QWORD)i);
      v54 = 0u;
      v55 = 0u;
      v56 = 0u;
      v57 = 0u;
      v19 = v18;
      v20 = objc_msgSend(v19, "countByEnumeratingWithState:objects:count:", &v54, v64, 16);
      if (v20)
      {
        v21 = v20;
        v22 = *(_QWORD *)v55;
        v23 = 0.0;
        do
        {
          for (j = 0; j != v21; j = (char *)j + 1)
          {
            if (*(_QWORD *)v55 != v22)
              objc_enumerationMutation(v19);
            v25 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(*(id *)(*((_QWORD *)&v54 + 1) + 8 * (_QWORD)j), "mediaSumTimePlayed"));
            objc_msgSend(v25, "doubleValue");
            v23 = v23 + v26;

          }
          v21 = objc_msgSend(v19, "countByEnumeratingWithState:objects:count:", &v54, v64, 16);
        }
        while (v21);
      }
      else
      {
        v23 = 0.0;
      }

      if (v23 > v16)
      {
        v27 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v19, "firstObject"));

        if (objc_msgSend(v19, "count") == (id)1)
        {
          v28 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v27, "mediaTitle"));

          if (v28)
          {
            v29 = objc_claimAutoreleasedReturnValue(objc_msgSend(v27, "mediaTitle"));
            goto LABEL_22;
          }
        }
        v30 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v27, "mediaArtist"));

        if (v30)
        {
          v29 = objc_claimAutoreleasedReturnValue(objc_msgSend(v27, "mediaArtist"));
LABEL_22:
          v31 = (void *)v29;

          v11 = v31;
        }
        v10 = v27;
        v16 = v23;
      }
      v15 = v15 + v23;
    }
    v13 = objc_msgSend(obj, "countByEnumeratingWithState:objects:count:", &v58, v65, 16);
  }
  while (v13);
LABEL_29:

  if (v11)
  {
    if (v15 <= 0.0)
      v33 = -1.0;
    else
      v33 = v16 / v15;
    v34 = objc_claimAutoreleasedReturnValue(+[NSString stringWithFormat:](NSString, "stringWithFormat:", CFSTR("listening to %@"), v11));
    v35 = -[MOAction initWithActionName:actionType:actionSubtype:actionNameConfidence:]([MOAction alloc], "initWithActionName:actionType:actionSubtype:actionNameConfidence:", v34, 6, 0, v33);
    v36 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v10, "eventIdentifier"));
    -[MOAction setSourceEventIdentifier:](v35, "setSourceEventIdentifier:", v36);

    v5 = v52;
    objc_msgSend(v52, "addBackgroundAction:", v35);
    v37 = [MOResource alloc];
    v38 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v10, "mediaProductId"));
    v39 = -[MOResource initWithName:type:assets:](v37, "initWithName:type:assets:", v11, 3, v38);

    v40 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v10, "eventIdentifier"));
    -[MOResource setSourceEventIdentifier:](v39, "setSourceEventIdentifier:", v40);

    objc_msgSend(v52, "addResource:", v39);
    os_log = _mo_log_facility_get_os_log(&MOLogFacilityEventBundleManager);
    v42 = objc_claimAutoreleasedReturnValue(os_log);
    v6 = v51;
    if (os_log_type_enabled(v42, OS_LOG_TYPE_INFO))
    {
      *(_DWORD *)buf = 138412290;
      v63 = v35;
      _os_log_impl((void *)&_mh_execute_header, v42, OS_LOG_TYPE_INFO, "Action, %@", buf, 0xCu);
    }

  }
  else
  {
    v43 = _mo_log_facility_get_os_log(&MOLogFacilityEventBundleManager);
    v34 = objc_claimAutoreleasedReturnValue(v43);
    v6 = v51;
    v5 = v52;
    if (os_log_type_enabled(v34, OS_LOG_TYPE_ERROR))
      +[MOContextAnnotationUtilities annotateEventBundle:leisureMediaEvents:].cold.1((uint64_t)v10, v34, v44, v45, v46, v47, v48, v49);
  }

  v32 = v6;
LABEL_39:

  return v32;
}

+ (id)annotateEventBundle:(id)a3 playbackMediaEvents:(id)a4
{
  return +[MOContextAnnotationUtilities annotateEventBundle:playbackMediaEvents:lessSignificantPlaySessionMediaTypes:](MOContextAnnotationUtilities, "annotateEventBundle:playbackMediaEvents:lessSignificantPlaySessionMediaTypes:", a3, a4, 0);
}

+ (id)annotateEventBundle:(id)a3 playbackMediaEvents:(id)a4 lessSignificantPlaySessionMediaTypes:(id)a5
{
  return +[MOContextAnnotationUtilities annotateEventBundle:dateIntervalEvents:playbackMediaEvents:lessSignificantPlaySessionMediaTypes:](MOContextAnnotationUtilities, "annotateEventBundle:dateIntervalEvents:playbackMediaEvents:lessSignificantPlaySessionMediaTypes:", a3, 0, a4, a5);
}

+ (id)annotateEventBundle:(id)a3 dateIntervalEvents:(id)a4 playbackMediaEvents:(id)a5
{
  return +[MOContextAnnotationUtilities annotateEventBundle:dateIntervalEvents:playbackMediaEvents:lessSignificantPlaySessionMediaTypes:](MOContextAnnotationUtilities, "annotateEventBundle:dateIntervalEvents:playbackMediaEvents:lessSignificantPlaySessionMediaTypes:", a3, a4, a5, 0);
}

+ (id)annotateEventBundle:(id)a3 dateIntervalEvents:(id)a4 playbackMediaEvents:(id)a5 lessSignificantPlaySessionMediaTypes:(id)a6
{
  double v6;

  LODWORD(v6) = 0;
  return +[MOContextAnnotationUtilities annotateEventBundle:dateIntervalEvents:playbackMediaEvents:mediaDurationThreshold:lessSignificantPlaySessionMediaTypes:](MOContextAnnotationUtilities, "annotateEventBundle:dateIntervalEvents:playbackMediaEvents:mediaDurationThreshold:lessSignificantPlaySessionMediaTypes:", a3, a4, a5, a6, v6);
}

+ (id)annotateEventBundle:(id)a3 dateIntervalEvents:(id)a4 playbackMediaEvents:(id)a5 mediaDurationThreshold:(float)a6
{
  double v6;

  LODWORD(v6) = 0;
  return +[MOContextAnnotationUtilities annotateEventBundle:dateIntervalEvents:playbackMediaEvents:mediaDurationThreshold:lessSignificantPlaySessionMediaTypes:](MOContextAnnotationUtilities, "annotateEventBundle:dateIntervalEvents:playbackMediaEvents:mediaDurationThreshold:lessSignificantPlaySessionMediaTypes:", a3, a4, a5, 0, v6);
}

+ (id)annotateEventBundle:(id)a3 dateIntervalEvents:(id)a4 playbackMediaEvents:(id)a5 mediaDurationThreshold:(float)a6 lessSignificantPlaySessionMediaTypes:(id)a7
{
  id v11;
  id v12;
  id v13;
  void *v14;
  id v15;
  void *v16;
  void *v17;
  id v18;
  double v19;
  NSMutableArray *v20;
  void *v21;
  void *v22;
  id v23;
  id v24;
  id v25;
  uint64_t v26;
  void *i;
  void *v28;
  id v29;
  void *v30;
  void *v31;
  id v32;
  NSMutableDictionary *v33;
  float v34;
  void *v35;
  uint64_t v36;
  void *v37;
  void *v38;
  void *v39;
  id os_log;
  NSObject *v41;
  void *v42;
  id v43;
  id v44;
  id v45;
  NSMutableArray *v46;
  void *j;
  void *v48;
  void *v49;
  void *v50;
  NSMutableArray *v51;
  void *v52;
  void *v53;
  unsigned __int8 v54;
  void *v55;
  void *v56;
  void *v57;
  unsigned __int8 v58;
  id v59;
  void *v60;
  void *v61;
  id v62;
  double v63;
  double v64;
  id v65;
  id v66;
  uint64_t v67;
  void *k;
  void *v69;
  double v70;
  double v71;
  void *v72;
  void *v73;
  id v74;
  id v75;
  uint64_t v76;
  uint64_t v77;
  void *v78;
  void *v79;
  void *v80;
  void *v81;
  void *v82;
  void *v83;
  double v84;
  double v85;
  void *v86;
  void *v87;
  uint64_t v88;
  void *v89;
  void *v90;
  void *v91;
  void *v92;
  id v93;
  NSObject *v94;
  void *v95;
  id v96;
  void *v97;
  id v98;
  NSMutableArray *v99;
  void *v101;
  void *v102;
  id obj;
  uint64_t v104;
  void *v105;
  id v106;
  void *v107;
  uint64_t v108;
  id v109;
  id v110;
  void *v111;
  NSMutableArray *v112;
  char v113;
  id v114;
  NSMutableArray *v115;
  void *v116;
  id v117;
  NSMutableArray *v118;
  uint64_t v119;
  id v120;
  void *v121;
  void *context;
  void *v123;
  void *v124;
  double v125;
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
  __int128 v145;
  _BYTE v146[128];
  _BYTE v147[128];
  uint8_t v148[128];
  uint8_t buf[4];
  id v150;
  __int16 v151;
  id v152;
  _BYTE v153[128];
  _BYTE v154[128];

  v11 = a3;
  v114 = a4;
  v12 = a5;
  v13 = a7;
  v14 = objc_autoreleasePoolPush();
  if (objc_msgSend(v12, "count"))
  {
    v110 = v13;
    v15 = objc_alloc((Class)NSDateInterval);
    v16 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v11, "startDate"));
    v17 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v11, "endDate"));
    v18 = objc_msgSend(v15, "initWithStartDate:endDate:", v16, v17);

    objc_msgSend(v18, "duration");
    v116 = v18;
    if (v19 == 0.0)
    {
      v20 = (NSMutableArray *)&__NSArray0__struct;
      v13 = v110;
    }
    else
    {
      v102 = v12;
      v21 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v18, "startDate"));
      v22 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v18, "endDate"));
      v105 = (void *)objc_claimAutoreleasedReturnValue(+[MOContextAnnotationUtilities predicateOfMediaPlaySessionsWithStartDate:endDate:distanceThreshold:](MOContextAnnotationUtilities, "predicateOfMediaPlaySessionsWithStartDate:endDate:distanceThreshold:", v21, v22, 0.5));

      v115 = objc_opt_new(NSMutableArray);
      if (v114)
      {
        v144 = 0u;
        v145 = 0u;
        v142 = 0u;
        v143 = 0u;
        v23 = v114;
        v24 = objc_msgSend(v23, "countByEnumeratingWithState:objects:count:", &v142, v154, 16);
        if (v24)
        {
          v25 = v24;
          v26 = *(_QWORD *)v143;
          do
          {
            for (i = 0; i != v25; i = (char *)i + 1)
            {
              if (*(_QWORD *)v143 != v26)
                objc_enumerationMutation(v23);
              v28 = *(void **)(*((_QWORD *)&v142 + 1) + 8 * (_QWORD)i);
              v29 = objc_alloc((Class)NSDateInterval);
              v30 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v28, "startDate"));
              v31 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v28, "endDate"));
              v32 = objc_msgSend(v29, "initWithStartDate:endDate:", v30, v31);

              -[NSMutableArray addObject:](v115, "addObject:", v32);
            }
            v25 = objc_msgSend(v23, "countByEnumeratingWithState:objects:count:", &v142, v154, 16);
          }
          while (v25);
        }

      }
      v101 = v14;
      v118 = objc_opt_new(NSMutableArray);
      v33 = objc_opt_new(NSMutableDictionary);
      v112 = objc_opt_new(NSMutableArray);
      v138 = 0u;
      v139 = 0u;
      v140 = 0u;
      v141 = 0u;
      obj = v102;
      v106 = objc_msgSend(obj, "countByEnumeratingWithState:objects:count:", &v138, v153, 16);
      if (v106)
      {
        v104 = *(_QWORD *)v139;
        v34 = 0.0;
        v35 = v110;
        v109 = v11;
        while (1)
        {
          v36 = 0;
          do
          {
            if (*(_QWORD *)v139 != v104)
              objc_enumerationMutation(obj);
            v108 = v36;
            v37 = *(void **)(*((_QWORD *)&v138 + 1) + 8 * v36);
            v107 = objc_autoreleasePoolPush();
            v124 = v37;
            v38 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v37, "mediaPlaySessions"));
            v39 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v38, "filteredArrayUsingPredicate:", v105));

            os_log = _mo_log_facility_get_os_log(&MOLogFacilityEventBundleManager);
            v41 = objc_claimAutoreleasedReturnValue(os_log);
            if (os_log_type_enabled(v41, OS_LOG_TYPE_INFO))
            {
              v42 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v124, "mediaPlaySessions"));
              v43 = objc_msgSend(v42, "count");
              v44 = objc_msgSend(v39, "count");
              *(_DWORD *)buf = 134218240;
              v150 = v43;
              v151 = 2048;
              v152 = v44;
              _os_log_impl((void *)&_mh_execute_header, v41, OS_LOG_TYPE_INFO, "playback, %lu, filtered sessions, %lu", buf, 0x16u);

            }
            v136 = 0u;
            v137 = 0u;
            v134 = 0u;
            v135 = 0u;
            v45 = v39;
            v120 = objc_msgSend(v45, "countByEnumeratingWithState:objects:count:", &v134, v148, 16);
            if (!v120)
            {

              goto LABEL_79;
            }
            v117 = v45;
            v113 = 0;
            v119 = *(_QWORD *)v135;
            v46 = v118;
            do
            {
              for (j = 0; j != v120; j = (char *)j + 1)
              {
                if (*(_QWORD *)v135 != v119)
                  objc_enumerationMutation(v117);
                v48 = *(void **)(*((_QWORD *)&v134 + 1) + 8 * (_QWORD)j);
                v49 = objc_autoreleasePoolPush();
                if (objc_msgSend(v11, "interfaceType") == (id)1 && objc_msgSend(v48, "isRemote"))
                {
                  v123 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v48, "deviceSource"));
                  if ((objc_msgSend(v123, "isEqualToString:", CFSTR("iPad")) & 1) != 0)
                    goto LABEL_72;
                  v50 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v48, "deviceSource"));
                  if ((objc_msgSend(v50, "isEqualToString:", CFSTR("MacDesktop")) & 1) != 0)
                    goto LABEL_71;
                  context = v49;
                  v51 = (NSMutableArray *)objc_claimAutoreleasedReturnValue(objc_msgSend(v48, "deviceSource"));
                  if ((-[NSMutableArray isEqualToString:](v51, "isEqualToString:", CFSTR("MacPortable")) & 1) != 0)
                    goto LABEL_69;
                  v52 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v48, "deviceSource"));
                  if ((objc_msgSend(v52, "isEqualToString:", CFSTR("TV")) & 1) != 0)
                    goto LABEL_66;
                  v53 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v48, "deviceSource"));
                  v54 = objc_msgSend(v53, "isEqualToString:", CFSTR("HomePod"));

                  v46 = v118;
                  v49 = context;
                  if ((v54 & 1) != 0)
                    goto LABEL_73;
                }
                v121 = j;
                context = v49;
                if (v35)
                {
                  v55 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v48, "mediaType"));
                  v56 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v48, "bundleId"));
                  v57 = (void *)objc_claimAutoreleasedReturnValue(+[MOMediaPlaySession getMOPlaySessionMediaType:bundleId:](MOMediaPlaySession, "getMOPlaySessionMediaType:bundleId:", v55, v56));
                  v58 = objc_msgSend(v35, "containsObject:", v57);

                  if ((v58 & 1) != 0)
                  {
                    v46 = v118;
                    j = v121;
                    v49 = context;
                    goto LABEL_73;
                  }
                }
                v59 = objc_alloc((Class)NSDateInterval);
                v60 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v48, "startDate"));
                v61 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v48, "endDate"));
                v62 = objc_msgSend(v59, "initWithStartDate:endDate:", v60, v61);

                v123 = v62;
                v50 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v116, "intersectionWithDateInterval:", v62));
                objc_msgSend(v50, "duration");
                if (v63 == 0.0)
                {
                  v46 = v118;
                  j = v121;
                  goto LABEL_70;
                }
                objc_msgSend(v50, "duration");
                v34 = v64 + v34;
                if (!v114 || !-[NSMutableArray count](v115, "count"))
                {
LABEL_51:
                  -[NSMutableArray addObject:](v112, "addObject:", v48, v101);
                  v72 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v48, "title"));
                  v73 = (void *)objc_claimAutoreleasedReturnValue(-[NSMutableDictionary objectForKeyedSubscript:](v33, "objectForKeyedSubscript:", v72));

                  if (!v73)
                  {
                    v51 = (NSMutableArray *)objc_claimAutoreleasedReturnValue(objc_msgSend(v124, "eventIdentifier"));
                    v52 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v48, "title"));
                    -[NSMutableDictionary setObject:forKeyedSubscript:](v33, "setObject:forKeyedSubscript:", v51, v52);
                    v113 = 1;
                    j = v121;
LABEL_66:

                    v46 = v118;
                    goto LABEL_69;
                  }
                  v128 = 0u;
                  v129 = 0u;
                  v126 = 0u;
                  v127 = 0u;
                  v46 = v118;
                  v51 = v118;
                  v74 = -[NSMutableArray countByEnumeratingWithState:objects:count:](v51, "countByEnumeratingWithState:objects:count:", &v126, v146, 16);
                  if (!v74)
                  {
                    v113 = 1;
                    v11 = v109;
                    goto LABEL_68;
                  }
                  v75 = v74;
                  v111 = v50;
                  v76 = *(_QWORD *)v127;
                  while (2)
                  {
                    v77 = 0;
LABEL_55:
                    if (*(_QWORD *)v127 != v76)
                      objc_enumerationMutation(v51);
                    v78 = *(void **)(*((_QWORD *)&v126 + 1) + 8 * v77);
                    v79 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v78, "eventIdentifier"));
                    v80 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v48, "title"));
                    v81 = (void *)objc_claimAutoreleasedReturnValue(-[NSMutableDictionary objectForKeyedSubscript:](v33, "objectForKeyedSubscript:", v80));
                    if (v79 != v81)
                    {

                      goto LABEL_61;
                    }
                    v82 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v78, "startDate"));
                    v83 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v124, "startDate"));
                    objc_msgSend(v82, "timeIntervalSinceDate:", v83);
                    v85 = v84;

                    if (v85 > 0.0)
                    {
                      v79 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v124, "eventIdentifier"));
                      v80 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v48, "title"));
                      -[NSMutableDictionary setObject:forKeyedSubscript:](v33, "setObject:forKeyedSubscript:", v79, v80);
LABEL_61:

                    }
                    if (v75 == (id)++v77)
                    {
                      v75 = -[NSMutableArray countByEnumeratingWithState:objects:count:](v51, "countByEnumeratingWithState:objects:count:", &v126, v146, 16);
                      if (!v75)
                      {
                        v113 = 1;
                        v11 = v109;
                        v35 = v110;
                        v46 = v118;
                        j = v121;
                        v50 = v111;
                        goto LABEL_69;
                      }
                      continue;
                    }
                    goto LABEL_55;
                  }
                }
                v132 = 0u;
                v133 = 0u;
                v130 = 0u;
                v131 = 0u;
                v51 = v115;
                v65 = -[NSMutableArray countByEnumeratingWithState:objects:count:](v51, "countByEnumeratingWithState:objects:count:", &v130, v147, 16);
                if (!v65)
                  goto LABEL_49;
                v66 = v65;
                v67 = *(_QWORD *)v131;
                do
                {
                  for (k = 0; k != v66; k = (char *)k + 1)
                  {
                    if (*(_QWORD *)v131 != v67)
                      objc_enumerationMutation(v51);
                    v69 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(*(id *)(*((_QWORD *)&v130 + 1) + 8 * (_QWORD)k), "intersectionWithDateInterval:", v123, v101));
                    objc_msgSend(v69, "duration");
                    v71 = v70;

                    if (v71 > 0.0)
                    {

                      v35 = v110;
                      goto LABEL_51;
                    }
                  }
                  v66 = -[NSMutableArray countByEnumeratingWithState:objects:count:](v51, "countByEnumeratingWithState:objects:count:", &v130, v147, 16);
                }
                while (v66);
                v35 = v110;
LABEL_49:
                v46 = v118;
LABEL_68:
                j = v121;
LABEL_69:

LABEL_70:
                v49 = context;
LABEL_71:

LABEL_72:
LABEL_73:
                objc_autoreleasePoolPop(v49);
              }
              v120 = objc_msgSend(v117, "countByEnumeratingWithState:objects:count:", &v134, v148, 16);
            }
            while (v120);

            if ((v113 & 1) != 0)
              -[NSMutableArray addObject:](v46, "addObject:", v124);
            v45 = v117;
LABEL_79:

            objc_autoreleasePoolPop(v107);
            v36 = v108 + 1;
          }
          while ((id)(v108 + 1) != v106);
          v106 = objc_msgSend(obj, "countByEnumeratingWithState:objects:count:", &v138, v153, 16);
          if (!v106)
            goto LABEL_83;
        }
      }
      v34 = 0.0;
LABEL_83:

      v125 = -1.0;
      v86 = (void *)objc_claimAutoreleasedReturnValue(+[MOContextAnnotationUtilities dominantMediaNameFromPlaySessions:intervalOfInterest:dominantFactorThreshold:confidence:](MOContextAnnotationUtilities, "dominantMediaNameFromPlaySessions:intervalOfInterest:dominantFactorThreshold:confidence:", v112, v116, &v125, 0.8));
      v87 = v86;
      if (v86)
      {
        v88 = objc_claimAutoreleasedReturnValue(objc_msgSend(v86, "objectForKeyedSubscript:", CFSTR("DominantMediaNameKey")));
        if (v88)
        {
          v89 = (void *)v88;
          v90 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v87, "objectForKeyedSubscript:", CFSTR("DominantMediaPropertyKey")));

          if (v90)
          {
            v91 = (void *)objc_claimAutoreleasedReturnValue(+[MOContextAnnotationUtilities creatMediaActionWithMediaInfo:mediaNameConfidence:](MOContextAnnotationUtilities, "creatMediaActionWithMediaInfo:mediaNameConfidence:", v87, v125));
            objc_msgSend(v11, "setConcurrentMediaAction:", v91);

            v92 = (void *)objc_claimAutoreleasedReturnValue(+[MOContextAnnotationUtilities createMediaResourceWithMediaInfo:playSessions:eventIdentifiersMapping:isDominant:](MOContextAnnotationUtilities, "createMediaResourceWithMediaInfo:playSessions:eventIdentifiersMapping:isDominant:", v87, v112, v33, v125 > 0.8, v125));
            if (objc_msgSend(v92, "count"))
            {
              objc_msgSend(v11, "addResources:", v92);
              v93 = _mo_log_facility_get_os_log(&MOLogFacilityEventBundleManager);
              v94 = objc_claimAutoreleasedReturnValue(v93);
              if (os_log_type_enabled(v94, OS_LOG_TYPE_INFO))
              {
                v95 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v11, "resources"));
                v96 = objc_msgSend(v95, "count");
                v97 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v11, "resources"));
                v98 = objc_msgSend(v97, "count");
                *(_DWORD *)buf = 134218240;
                v150 = v96;
                v151 = 2048;
                v152 = v98;
                _os_log_impl((void *)&_mh_execute_header, v94, OS_LOG_TYPE_INFO, "Add media resources, %lu, total, %lu", buf, 0x16u);

              }
            }

          }
        }
      }
      if (v34 <= a6)
      {
        v20 = (NSMutableArray *)&__NSArray0__struct;
        v13 = v110;
        v99 = v118;
      }
      else
      {
        v99 = v118;
        v20 = v118;
        v13 = v110;
      }

      v14 = v101;
      v12 = v102;
    }

  }
  else
  {
    v20 = (NSMutableArray *)&__NSArray0__struct;
  }
  objc_autoreleasePoolPop(v14);

  return v20;
}

+ (id)creatMediaActionWithMediaInfo:(id)a3 mediaNameConfidence:(double)a4
{
  id v5;
  NSMutableDictionary *v6;
  void *v7;
  unsigned int v8;
  void *v9;
  MOAction *v10;
  void *v11;
  MOAction *v12;
  id os_log;
  NSObject *v14;
  int v16;
  MOAction *v17;

  v5 = a3;
  v6 = objc_opt_new(NSMutableDictionary);
  -[NSMutableDictionary setObject:forKeyedSubscript:](v6, "setObject:forKeyedSubscript:", &off_1002D8360, CFSTR("MediaActionMetaDataMediaType"));
  v7 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v5, "objectForKeyedSubscript:", CFSTR("DominantMediaBundleIdKey")));
  v8 = objc_msgSend(v7, "isEqualToString:", CFSTR("com.apple.tv"));

  if (v8)
    -[NSMutableDictionary setObject:forKeyedSubscript:](v6, "setObject:forKeyedSubscript:", &off_1002D8378, CFSTR("MediaActionMetaDataMediaType"));
  v9 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v5, "objectForKeyedSubscript:", CFSTR("DominantMediaInfoKey")));
  -[NSMutableDictionary setObject:forKeyedSubscript:](v6, "setObject:forKeyedSubscript:", v9, CFSTR("MediaActionMetaDataMediaInfoType"));

  v10 = [MOAction alloc];
  v11 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v5, "objectForKeyedSubscript:", CFSTR("DominantMediaNameKey")));
  v12 = -[MOAction initWithActionName:actionType:actionSubtype:actionNameConfidence:](v10, "initWithActionName:actionType:actionSubtype:actionNameConfidence:", v11, 6, 0, a4);

  -[MOAction setActionMetaData:](v12, "setActionMetaData:", v6);
  os_log = _mo_log_facility_get_os_log(&MOLogFacilityEventBundleManager);
  v14 = objc_claimAutoreleasedReturnValue(os_log);
  if (os_log_type_enabled(v14, OS_LOG_TYPE_INFO))
  {
    v16 = 138412290;
    v17 = v12;
    _os_log_impl((void *)&_mh_execute_header, v14, OS_LOG_TYPE_INFO, "Action, %@", (uint8_t *)&v16, 0xCu);
  }

  return v12;
}

+ (id)createMediaResourceWithMediaInfo:(id)a3 playSessions:(id)a4 eventIdentifiersMapping:(id)a5 isDominant:(BOOL)a6
{
  _BOOL4 v6;
  id v9;
  void *v10;
  void *v11;
  void *v12;
  void *v13;
  void *v14;
  void *v15;
  uint64_t v16;
  void *v17;
  unsigned int v18;
  id v19;
  void *v20;
  void *v21;
  void *v22;
  void *v23;
  void *v24;
  double v25;
  void *v26;
  void *v27;
  void *v28;
  void *v29;
  void *v30;
  __CFString **v31;
  __CFString *v32;
  void *v33;
  const __CFString *v34;
  id os_log;
  NSObject *v36;
  void *v37;
  __CFString *v38;
  const __CFString *v39;
  void *v40;
  const __CFString *v41;
  void *v42;
  const __CFString *v43;
  void *v44;
  const __CFString *v45;
  void *v46;
  const __CFString *v47;
  void *v48;
  void *v49;
  void *v50;
  void *v51;
  void *v52;
  MOResource *v53;
  void *v54;
  id v55;
  unsigned __int8 v56;
  __CFString **v57;
  unsigned __int8 v58;
  unsigned int v59;
  __CFString *v60;
  MOResource *v61;
  void *v62;
  MOResource *v63;
  void *v64;
  MOResource *v65;
  void *v66;
  MOResource *v67;
  void *v68;
  void *v69;
  void *v70;
  id v71;
  NSMutableDictionary *v72;
  id v73;
  id v74;
  uint64_t v75;
  void *i;
  void *v77;
  id v78;
  void *v80;
  void *v81;
  id v82;
  id v83;
  id v84;
  NSMutableArray *v85;
  id obj;
  void *v87;
  void *v88;
  NSMutableDictionary *v89;
  NSMutableArray *v90;
  __CFString *v91;
  __CFString *v92;
  __CFString *v93;
  __CFString *v94;
  __CFString *v95;
  __CFString *v96;
  uint64_t v97;
  id v98;
  void *v99;
  void *v100;
  NSObject *v101;
  void *v102;
  __int128 v103;
  __int128 v104;
  __int128 v105;
  __int128 v106;
  __int128 v107;
  __int128 v108;
  __int128 v109;
  __int128 v110;
  _BYTE v111[128];
  _QWORD v112[7];
  _QWORD v113[7];
  uint8_t v114[4];
  uint64_t v115;
  _BYTE v116[128];

  v6 = a6;
  v9 = a3;
  v83 = a4;
  v84 = a5;
  v90 = objc_opt_new(NSMutableArray);
  v10 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v9, "objectForKeyedSubscript:", CFSTR("DominantMediaPropertyKey")));
  v11 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v10, "stringByAppendingString:", CFSTR("=%@")));

  v12 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v9, "objectForKeyedSubscript:", CFSTR("DominantMediaNameKey")));
  v13 = (void *)objc_claimAutoreleasedReturnValue(+[NSPredicate predicateWithFormat:](NSPredicate, "predicateWithFormat:", v11, v12));

  v14 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v9, "objectForKeyedSubscript:", CFSTR("DominantMediaPropertyKey")));
  LODWORD(v10) = objc_msgSend(v14, "isEqualToString:", CFSTR("bundleId"));

  if ((_DWORD)v10)
  {
    v15 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v9, "objectForKeyedSubscript:", CFSTR("DominantMediaBundleIdKey")));
    v16 = objc_claimAutoreleasedReturnValue(+[NSPredicate predicateWithFormat:](NSPredicate, "predicateWithFormat:", v11, v15));

    v81 = (void *)v16;
  }
  else
  {
    v81 = v13;
  }
  v82 = v9;
  v17 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v9, "objectForKeyedSubscript:", CFSTR("DominantMediaPropertyKey")));
  v18 = objc_msgSend(v17, "isEqualToString:", CFSTR("bundleId"));

  if (!v18 || v6)
    v19 = (id)objc_claimAutoreleasedReturnValue(objc_msgSend(v83, "filteredArrayUsingPredicate:", v81));
  else
    v19 = v83;
  v20 = v19;
  v21 = v9;
  if (objc_msgSend(v19, "count"))
  {
    v80 = v20;
    v22 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v20, "sortedArrayUsingComparator:", &__block_literal_global_8));
    v23 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v22, "reverseObjectEnumerator"));
    v24 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v23, "allObjects"));

    if (objc_msgSend(v24, "count"))
    {
      v89 = objc_opt_new(NSMutableDictionary);
      v85 = objc_opt_new(NSMutableArray);
      v107 = 0u;
      v108 = 0u;
      v109 = 0u;
      v110 = 0u;
      obj = v24;
      v98 = objc_msgSend(obj, "countByEnumeratingWithState:objects:count:", &v107, v116, 16);
      if (v98)
      {
        v97 = *(_QWORD *)v108;
        v25 = 201.0;
        v87 = v24;
        v88 = v11;
        do
        {
          v26 = 0;
          do
          {
            if (*(_QWORD *)v108 != v97)
              objc_enumerationMutation(obj);
            v27 = *(void **)(*((_QWORD *)&v107 + 1) + 8 * (_QWORD)v26);
            v28 = objc_autoreleasePoolPush();
            v29 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v27, "bundleId"));
            if ((objc_msgSend(v29, "isEqualToString:", CFSTR("com.apple.Music")) & 1) != 0
              || objc_msgSend(v29, "isEqualToString:", CFSTR("com.apple.MediaPlayer.RemotePlayerService")))
            {
              v30 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v27, "album"));
              v31 = MOMediaPlayMetaDataKeyPlayerMediaTypeSong;
            }
            else if (objc_msgSend(v29, "isEqualToString:", CFSTR("com.apple.podcasts")))
            {
              v30 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v27, "artist"));
              v31 = MOMediaPlayMetaDataKeyPlayerMediaTypePodcastEpisode;
            }
            else
            {
              v30 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v27, "title"));
              v31 = MOMediaPlayMetaDataKeyPlayerMediaTypeThirdPartyMedia;
            }
            v32 = *v31;
            if (v30)
            {
              v112[0] = CFSTR("MOMediaPlayMetaDataKeyPlayerTitle");
              v33 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v27, "title"));
              v99 = v29;
              if (v33)
              {
                v96 = (__CFString *)objc_claimAutoreleasedReturnValue(objc_msgSend(v27, "title"));
                v34 = v96;
              }
              else
              {
                v34 = &stru_1002B68D0;
              }
              v102 = v30;
              v113[0] = v34;
              v112[1] = CFSTR("MOMediaPlayMetaDataKeyPlayerArtist");
              v37 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v27, "artist"));
              v38 = v32;
              if (v37)
              {
                v95 = (__CFString *)objc_claimAutoreleasedReturnValue(objc_msgSend(v27, "artist"));
                v39 = v95;
              }
              else
              {
                v39 = &stru_1002B68D0;
              }
              v113[1] = v39;
              v112[2] = CFSTR("MOMediaPlayMetaDataKeyPlayerTrackID");
              v40 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v27, "productId"));
              if (v40)
              {
                v94 = (__CFString *)objc_claimAutoreleasedReturnValue(objc_msgSend(v27, "productId"));
                v41 = v94;
              }
              else
              {
                v41 = &stru_1002B68D0;
              }
              v113[2] = v41;
              v112[3] = CFSTR("MOMediaPlayMetaDataKeyPlayerAlbumName");
              v42 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v27, "album"));
              if (v42)
              {
                v93 = (__CFString *)objc_claimAutoreleasedReturnValue(objc_msgSend(v27, "album"));
                v43 = v93;
              }
              else
              {
                v43 = &stru_1002B68D0;
              }
              v113[3] = v43;
              v112[4] = CFSTR("MOMediaPlayMetaDataKeyPlayerBundleID");
              v44 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v27, "bundleId"));
              v100 = v28;
              if (v44)
              {
                v92 = (__CFString *)objc_claimAutoreleasedReturnValue(objc_msgSend(v27, "bundleId"));
                v45 = v92;
              }
              else
              {
                v45 = &stru_1002B68D0;
              }
              v113[4] = v45;
              v113[5] = v38;
              v112[5] = CFSTR("MOMediaPlayMetaDataKeyPlayerMediaTypeKey");
              v112[6] = CFSTR("MOMediaPlayMetaDataKeyPlayerBgColor");
              v46 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v27, "bgColor"));
              if (v46)
              {
                v91 = (__CFString *)objc_claimAutoreleasedReturnValue(objc_msgSend(v27, "bgColor"));
                v47 = v91;
              }
              else
              {
                v47 = &stru_1002B68D0;
              }
              v113[6] = v47;
              v48 = (void *)objc_claimAutoreleasedReturnValue(+[NSDictionary dictionaryWithObjects:forKeys:count:](NSDictionary, "dictionaryWithObjects:forKeys:count:", v113, v112, 7));
              v101 = objc_msgSend(v48, "mutableCopy");

              if (v46)
              if (v44)

              if (v42)
              v11 = v88;
              v36 = v101;
              if (v40)

              if (v37)
              v32 = v38;
              if (v33)

              v49 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v27, "startDate"));
              v30 = v102;
              if (v49)
              {
                v50 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v27, "startDate"));
                objc_msgSend(v50, "timeIntervalSinceReferenceDate");
                v51 = (void *)objc_claimAutoreleasedReturnValue(+[NSNumber numberWithDouble:](NSNumber, "numberWithDouble:"));
                -[NSObject setObject:forKeyedSubscript:](v101, "setObject:forKeyedSubscript:", v51, CFSTR("MOMediaPlayMetaDataKeyPlayerStartDate"));

              }
              v52 = (void *)objc_claimAutoreleasedReturnValue(-[NSMutableDictionary objectForKey:](v89, "objectForKey:", v102));

              if (v52)
              {
                v53 = (MOResource *)objc_claimAutoreleasedReturnValue(-[NSMutableDictionary objectForKey:](v89, "objectForKey:", v102));
                v54 = (void *)objc_claimAutoreleasedReturnValue(-[MOResource getDictionary](v53, "getDictionary"));
                v55 = objc_msgSend(v54, "mutableCopy");

                v56 = -[__CFString isEqualToString:](v32, "isEqualToString:", MOMediaPlayMetaDataKeyPlayerMediaTypeSong[0]);
                v57 = MOMediaPlayMetaDataKeyPlayerMediaTypeSongAlbum;
                if ((v56 & 1) != 0
                  || (v58 = -[__CFString isEqualToString:](v32, "isEqualToString:", MOMediaPlayMetaDataKeyPlayerMediaTypePodcastEpisode[0]), v57 = MOMediaPlayMetaDataKeyPlayerMediaTypePodcastArtist, (v58 & 1) != 0)|| (v59 = -[__CFString isEqualToString:](v32, "isEqualToString:", MOMediaPlayMetaDataKeyPlayerMediaTypeThirdPartyMedia[0]), v57 = MOMediaPlayMetaDataKeyPlayerMediaTypeThirdPartyMediaAlbum, v59))
                {
                  objc_msgSend(v55, "setObject:forKeyedSubscript:", *v57, CFSTR("MOMediaPlayMetaDataKeyPlayerMediaTypeKey"));
                }
                v60 = v32;
                v61 = -[MOResource initWithName:type:dict:value:]([MOResource alloc], "initWithName:type:dict:value:", v102, 3, v55, 0.0);
                v62 = (void *)objc_claimAutoreleasedReturnValue(-[MOResource sourceEventIdentifier](v53, "sourceEventIdentifier"));
                -[MOResource setSourceEventIdentifier:](v61, "setSourceEventIdentifier:", v62);

                -[MOResource setSourceEventAccessType:](v61, "setSourceEventAccessType:", -[MOResource sourceEventAccessType](v53, "sourceEventAccessType"));
                -[NSMutableDictionary setObject:forKeyedSubscript:](v89, "setObject:forKeyedSubscript:", v61, v102);
                v63 = [MOResource alloc];
                v64 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v27, "title"));
                v36 = v101;
                v65 = -[MOResource initWithName:type:dict:value:](v63, "initWithName:type:dict:value:", v64, 3, v101, 0.0);

                v66 = (void *)objc_claimAutoreleasedReturnValue(-[MOResource sourceEventIdentifier](v53, "sourceEventIdentifier"));
                -[MOResource setSourceEventIdentifier:](v65, "setSourceEventIdentifier:", v66);

                -[MOResource setSourceEventAccessType:](v65, "setSourceEventAccessType:", -[MOResource sourceEventAccessType](v53, "sourceEventAccessType"));
                -[MOResource setPriorityScore:](v65, "setPriorityScore:", (double)((unint64_t)-[NSMutableArray count](v85, "count") + 300));
                -[NSMutableArray addObject:](v85, "addObject:", v65);

                v32 = v60;
                v30 = v102;

              }
              else
              {
                v67 = [MOResource alloc];
                v68 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v27, "title"));
                v53 = -[MOResource initWithName:type:dict:value:](v67, "initWithName:type:dict:value:", v68, 3, v101, 0.0);

                v69 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v27, "title"));
                v70 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v84, "objectForKeyedSubscript:", v69));
                -[MOResource setSourceEventIdentifier:](v53, "setSourceEventIdentifier:", v70);

                -[MOResource setSourceEventAccessType:](v53, "setSourceEventAccessType:", 2);
                -[MOResource setPriorityScore:](v53, "setPriorityScore:", v25);
                -[NSMutableDictionary setObject:forKeyedSubscript:](v89, "setObject:forKeyedSubscript:", v53, v102);
                v25 = v25 + 1.0;
              }
              v24 = v87;

              v29 = v99;
              v28 = v100;
            }
            else
            {
              os_log = _mo_log_facility_get_os_log(&MOLogFacilityEventBundleManager);
              v36 = objc_claimAutoreleasedReturnValue(os_log);
              if (os_log_type_enabled(v36, OS_LOG_TYPE_DEBUG))
                +[MOContextAnnotationUtilities createMediaResourceWithMediaInfo:playSessions:eventIdentifiersMapping:isDominant:].cold.1(v114, v27, &v115, v36);
            }

            objc_autoreleasePoolPop(v28);
            v26 = (char *)v26 + 1;
          }
          while (v98 != v26);
          v71 = objc_msgSend(obj, "countByEnumeratingWithState:objects:count:", &v107, v116, 16);
          v98 = v71;
        }
        while (v71);
      }

      v105 = 0u;
      v106 = 0u;
      v103 = 0u;
      v104 = 0u;
      v72 = v89;
      v73 = -[NSMutableDictionary countByEnumeratingWithState:objects:count:](v72, "countByEnumeratingWithState:objects:count:", &v103, v111, 16);
      if (v73)
      {
        v74 = v73;
        v75 = *(_QWORD *)v104;
        do
        {
          for (i = 0; i != v74; i = (char *)i + 1)
          {
            if (*(_QWORD *)v104 != v75)
              objc_enumerationMutation(v72);
            v77 = (void *)objc_claimAutoreleasedReturnValue(-[NSMutableDictionary objectForKey:](v72, "objectForKey:", *(_QWORD *)(*((_QWORD *)&v103 + 1) + 8 * (_QWORD)i)));
            if (v77)
              -[NSMutableArray addObject:](v90, "addObject:", v77);

          }
          v74 = -[NSMutableDictionary countByEnumeratingWithState:objects:count:](v72, "countByEnumeratingWithState:objects:count:", &v103, v111, 16);
        }
        while (v74);
      }

    }
    v21 = v82;
    v20 = v80;
  }
  v78 = -[NSMutableArray copy](v90, "copy");

  return v78;
}

int64_t __113__MOContextAnnotationUtilities_createMediaResourceWithMediaInfo_playSessions_eventIdentifiersMapping_isDominant___block_invoke(id a1, MOMediaPlaySession *a2, MOMediaPlaySession *a3)
{
  MOMediaPlaySession *v4;
  MOMediaPlaySession *v5;
  void *v6;
  void *v7;
  double v8;
  double v9;
  void *v10;
  void *v11;
  double v12;
  double v13;
  int64_t v14;

  v4 = a3;
  v5 = a2;
  v6 = (void *)objc_claimAutoreleasedReturnValue(-[MOMediaPlaySession endDate](v5, "endDate"));
  v7 = (void *)objc_claimAutoreleasedReturnValue(-[MOMediaPlaySession startDate](v5, "startDate"));

  objc_msgSend(v6, "timeIntervalSinceDate:", v7);
  v9 = v8;

  v10 = (void *)objc_claimAutoreleasedReturnValue(-[MOMediaPlaySession endDate](v4, "endDate"));
  v11 = (void *)objc_claimAutoreleasedReturnValue(-[MOMediaPlaySession startDate](v4, "startDate"));

  objc_msgSend(v10, "timeIntervalSinceDate:", v11);
  v13 = v12;

  if (v9 >= v13)
    v14 = 0;
  else
    v14 = -1;
  if (v9 > v13)
    return 1;
  else
    return v14;
}

+ (id)dominantMediaNameFromEvents:(id)a3
{
  int v3;
  __int128 v4;
  NSMutableDictionary *v5;
  id v6;
  id v7;
  uint64_t v8;
  double v9;
  void *i;
  void *v11;
  void *v12;
  id v13;
  void *v14;
  void *v15;
  id v16;
  double v17;
  double v18;
  void *v19;
  void *v20;
  __CFString *v21;
  double v22;
  double v23;
  MOMediaStats *v24;
  MOMediaStats *v25;
  double v26;
  void *v27;
  void *v28;
  void *v29;
  id os_log;
  NSObject *v31;
  NSMutableDictionary *v32;
  double v33;
  id v34;
  NSObject *v35;
  NSMutableDictionary *v36;
  void *v37;
  id v38;
  id v39;
  __CFString *v40;
  void *v41;
  uint64_t v42;
  double v43;
  void *j;
  void *v45;
  void *v46;
  unsigned __int8 v47;
  double v48;
  double v49;
  uint64_t v50;
  uint64_t v51;
  id v52;
  NSObject *v53;
  __CFString *v54;
  __CFString *v55;
  __CFString *v56;
  id v57;
  NSObject *v58;
  id v59;
  NSMutableDictionary *v60;
  NSMutableDictionary *v61;
  NSMutableDictionary *v62;
  void *v63;
  __int128 v65;
  void *context;
  NSMutableDictionary *v67;
  id v68;
  void *v69;
  int v70;
  void *v71;
  id obj;
  NSMutableDictionary *v73;
  NSMutableDictionary *v74;
  __int128 v75;
  __int128 v76;
  __int128 v77;
  __int128 v78;
  __int128 v79;
  __int128 v80;
  __int128 v81;
  __int128 v82;
  uint8_t v83[128];
  uint8_t buf[4];
  NSMutableDictionary *v85;
  __int16 v86;
  NSMutableDictionary *v87;
  __int16 v88;
  double v89;
  __int16 v90;
  double v91;
  _BYTE v92[128];
  _QWORD v93[5];
  _QWORD v94[5];

  v68 = a3;
  context = objc_autoreleasePoolPush();
  v67 = objc_opt_new(NSMutableDictionary);
  v93[0] = &off_1002D8378;
  v93[1] = &off_1002D8390;
  v94[0] = CFSTR("mediaTitle");
  v94[1] = CFSTR("mediaAlbum");
  v93[2] = &off_1002D83A8;
  v93[3] = &off_1002D83C0;
  v94[2] = CFSTR("mediaArtist");
  v94[3] = CFSTR("mediaGenre");
  v93[4] = &off_1002D83D8;
  v94[4] = CFSTR("mediaPlayerBundleId");
  v69 = (void *)objc_claimAutoreleasedReturnValue(+[NSDictionary dictionaryWithObjects:forKeys:count:](NSDictionary, "dictionaryWithObjects:forKeys:count:", v94, v93, 5));
  v3 = 1;
  *(_QWORD *)&v4 = 138412802;
  v65 = v4;
  while (1)
  {
    v70 = v3;
    v71 = (void *)objc_claimAutoreleasedReturnValue(+[NSNumber numberWithInt:](NSNumber, "numberWithInt:", v65));
    v5 = (NSMutableDictionary *)objc_claimAutoreleasedReturnValue(objc_msgSend(v69, "objectForKey:"));
    v74 = objc_opt_new(NSMutableDictionary);
    v79 = 0u;
    v80 = 0u;
    v81 = 0u;
    v82 = 0u;
    obj = v68;
    v6 = objc_msgSend(obj, "countByEnumeratingWithState:objects:count:", &v79, v92, 16);
    if (v6)
    {
      v7 = v6;
      v8 = *(_QWORD *)v80;
      v9 = 0.0;
      v73 = v5;
      do
      {
        for (i = 0; i != v7; i = (char *)i + 1)
        {
          if (*(_QWORD *)v80 != v8)
            objc_enumerationMutation(obj);
          v11 = *(void **)(*((_QWORD *)&v79 + 1) + 8 * (_QWORD)i);
          v12 = objc_autoreleasePoolPush();
          v13 = objc_alloc((Class)NSDateInterval);
          v14 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v11, "startDate"));
          v15 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v11, "endDate"));
          v16 = objc_msgSend(v13, "initWithStartDate:endDate:", v14, v15);

          objc_msgSend(v16, "duration");
          v18 = v17;
          v19 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v11, "mediaEvent"));

          if (v19)
          {
            v20 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v11, "mediaEvent"));
            v21 = (__CFString *)objc_claimAutoreleasedReturnValue(objc_msgSend(v20, "valueForKeyPath:", v5));

            if (!v21 || !-[__CFString length](v21, "length"))
            {

              v21 = CFSTR("__Unknown__");
            }
            objc_msgSend(v16, "duration");
            v23 = v22;
            v24 = (MOMediaStats *)objc_claimAutoreleasedReturnValue(-[NSMutableDictionary objectForKey:](v74, "objectForKey:", v21));
            if (v24)
            {
              v25 = v24;
              -[MOMediaStats value](v24, "value");
              -[MOMediaStats setValue:](v25, "setValue:", v23 + v26);
            }
            else
            {
              v25 = -[MOMediaStats initWithKeyword:value:]([MOMediaStats alloc], "initWithKeyword:value:", v21, v23);
            }
            v27 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v11, "mediaEvent"));
            v28 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v27, "mediaPlayerBundleId"));
            -[MOMediaStats setBundleId:](v25, "setBundleId:", v28);

            v29 = (void *)objc_claimAutoreleasedReturnValue(-[MOMediaStats members](v25, "members"));
            objc_msgSend(v29, "addObject:", v11);

            -[NSMutableDictionary setObject:forKey:](v74, "setObject:forKey:", v25, v21);
            os_log = _mo_log_facility_get_os_log(&MOLogFacilityEventBundleManager);
            v31 = objc_claimAutoreleasedReturnValue(os_log);
            if (os_log_type_enabled(v31, OS_LOG_TYPE_DEBUG))
            {
              v32 = (NSMutableDictionary *)objc_claimAutoreleasedReturnValue(+[MOMediaPlaySession redactString:](MOMediaPlaySession, "redactString:", v21));
              -[MOMediaStats value](v25, "value");
              *(_DWORD *)buf = 138413058;
              v85 = v73;
              v86 = 2112;
              v87 = v32;
              v88 = 2048;
              v89 = v23;
              v90 = 2048;
              v91 = v33;
              _os_log_debug_impl((void *)&_mh_execute_header, v31, OS_LOG_TYPE_DEBUG, "Third Party media, property.path, %@, property.name, %@, property.value, %f, total.value, %f", buf, 0x2Au);

            }
            v5 = v73;
          }
          v9 = v9 + v18;

          objc_autoreleasePoolPop(v12);
        }
        v7 = objc_msgSend(obj, "countByEnumeratingWithState:objects:count:", &v79, v92, 16);
      }
      while (v7);
    }
    else
    {
      v9 = 0.0;
    }

    v34 = _mo_log_facility_get_os_log(&MOLogFacilityEventBundleManager);
    v35 = objc_claimAutoreleasedReturnValue(v34);
    v36 = v74;
    if (os_log_type_enabled(v35, OS_LOG_TYPE_DEBUG))
    {
      *(_DWORD *)buf = 138412546;
      v85 = v5;
      v86 = 2112;
      v87 = v74;
      _os_log_debug_impl((void *)&_mh_execute_header, v35, OS_LOG_TYPE_DEBUG, "Third Party media, property.path, %@, stats %@", buf, 0x16u);
    }

    if (!-[NSMutableDictionary count](v74, "count"))
      goto LABEL_60;
    v77 = 0u;
    v78 = 0u;
    v75 = 0u;
    v76 = 0u;
    v37 = (void *)objc_claimAutoreleasedReturnValue(-[NSMutableDictionary allValues](v74, "allValues"));
    v38 = objc_msgSend(v37, "countByEnumeratingWithState:objects:count:", &v75, v83, 16);
    if (v38)
    {
      v39 = v38;
      v40 = 0;
      v41 = 0;
      v42 = *(_QWORD *)v76;
      v43 = -1.0;
      do
      {
        for (j = 0; j != v39; j = (char *)j + 1)
        {
          if (*(_QWORD *)v76 != v42)
            objc_enumerationMutation(v37);
          v45 = *(void **)(*((_QWORD *)&v75 + 1) + 8 * (_QWORD)j);
          v46 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v45, "keyword"));
          v47 = objc_msgSend(v46, "isEqualToString:", CFSTR("__Unknown__"));

          if ((v47 & 1) == 0)
          {
            objc_msgSend(v45, "value");
            if (v48 > v43)
            {
              objc_msgSend(v45, "value");
              v43 = v49;
              v50 = objc_claimAutoreleasedReturnValue(objc_msgSend(v45, "keyword"));

              v51 = objc_claimAutoreleasedReturnValue(objc_msgSend(v45, "bundleId"));
              v40 = (__CFString *)v50;
              v41 = (void *)v51;
            }
          }
        }
        v39 = objc_msgSend(v37, "countByEnumeratingWithState:objects:count:", &v75, v83, 16);
      }
      while (v39);
    }
    else
    {
      v40 = 0;
      v41 = 0;
      v43 = -1.0;
    }

    v52 = _mo_log_facility_get_os_log(&MOLogFacilityEventBundleManager);
    v53 = objc_claimAutoreleasedReturnValue(v52);
    if (os_log_type_enabled(v53, OS_LOG_TYPE_DEBUG))
    {
      v60 = (NSMutableDictionary *)objc_claimAutoreleasedReturnValue(+[MOMediaPlaySession redactString:](MOMediaPlaySession, "redactString:", v40));
      *(_DWORD *)buf = 138413058;
      v85 = v5;
      v86 = 2112;
      v87 = v60;
      v88 = 2048;
      v89 = v43;
      v90 = 2048;
      v91 = v9;
      _os_log_debug_impl((void *)&_mh_execute_header, v53, OS_LOG_TYPE_DEBUG, "Third Party media, property.path, %@, topKeyword, %@, topDuration %f, totalDuration, %f", buf, 0x2Au);

    }
    if (v43 >= v9)
    {
      if (-[NSMutableDictionary isEqual:](v5, "isEqual:", CFSTR("mediaPlayerBundleId")))
      {
        v55 = (__CFString *)objc_claimAutoreleasedReturnValue(+[MOContextAnnotationUtilities bundleNameFromBundleId:](MOContextAnnotationUtilities, "bundleNameFromBundleId:", v40));
        v54 = v55;
        if (v55)
          v56 = v55;

      }
      else
      {
        v54 = v40;
      }
      v57 = _mo_log_facility_get_os_log(&MOLogFacilityEventBundleManager);
      v58 = objc_claimAutoreleasedReturnValue(v57);
      v36 = v74;
      if (!os_log_type_enabled(v58, OS_LOG_TYPE_DEBUG))
      {
LABEL_55:

        if (v71 && v54 && v41 && v5)
        {
          -[NSMutableDictionary setObject:forKeyedSubscript:](v67, "setObject:forKeyedSubscript:", v54, CFSTR("DominantMediaNameKey"));
          -[NSMutableDictionary setObject:forKeyedSubscript:](v67, "setObject:forKeyedSubscript:", v41, CFSTR("DominantMediaBundleIdKey"));
          -[NSMutableDictionary setObject:forKeyedSubscript:](v67, "setObject:forKeyedSubscript:", v5, CFSTR("DominantMediaPropertyKey"));
          v63 = v71;
          -[NSMutableDictionary setObject:forKeyedSubscript:](v67, "setObject:forKeyedSubscript:", v71, CFSTR("DominantMediaInfoKey"));
          v62 = v67;
          goto LABEL_65;
        }
        goto LABEL_59;
      }
LABEL_62:
      v61 = (NSMutableDictionary *)objc_claimAutoreleasedReturnValue(+[MOMediaPlaySession redactString:](MOMediaPlaySession, "redactString:", v54));
      *(_DWORD *)buf = v65;
      v85 = v61;
      v86 = 2112;
      v87 = v5;
      v88 = 2048;
      v89 = v43;
      _os_log_debug_impl((void *)&_mh_execute_header, v58, OS_LOG_TYPE_DEBUG, "Third Party media, mediaName, %@, property.path, %@, duration, %f", buf, 0x20u);

      goto LABEL_55;
    }
    if (v70 == 5)
      break;
    v54 = v40;
    v36 = v74;
LABEL_59:

LABEL_60:
    v3 = v70 + 1;
    if (v70 == 5)
    {
      v62 = 0;
      goto LABEL_66;
    }
  }
  if (-[NSMutableDictionary isEqual:](v5, "isEqual:", CFSTR("mediaPlayerBundleId")))
  {

    v54 = CFSTR("Media");
  }
  else
  {
    v54 = v40;
  }
  v36 = v74;
  if (v43 <= 0.0 || v9 <= 0.0 || v43 / v9 >= 1.0)
  {
    v59 = _mo_log_facility_get_os_log(&MOLogFacilityEventBundleManager);
    v58 = objc_claimAutoreleasedReturnValue(v59);
    if (!os_log_type_enabled(v58, OS_LOG_TYPE_DEBUG))
      goto LABEL_55;
    goto LABEL_62;
  }
  v62 = 0;
  v63 = v71;
LABEL_65:

LABEL_66:
  objc_autoreleasePoolPop(context);

  return v62;
}

+ (id)dominantMediaNameFromPlaySessions:(id)a3 intervalOfInterest:(id)a4 dominantFactorThreshold:(double)a5 confidence:(double *)a6
{
  id v10;
  void *v11;
  id os_log;
  NSObject *v13;
  NSMutableDictionary *v14;
  const __CFString *v15;
  SEL v16;
  id v17;
  NSMutableDictionary *v18;
  uint64_t v19;
  double v20;
  id v21;
  NSObject *v22;
  int v23;
  __int128 v24;
  id v25;
  id v26;
  id v27;
  uint64_t v28;
  double v29;
  void *i;
  void *v31;
  id v32;
  void *v33;
  void *v34;
  id v35;
  id v36;
  void *v37;
  double v38;
  double v39;
  double v40;
  __CFString *v41;
  void *v42;
  id v43;
  BOOL v44;
  double v45;
  double v46;
  MOMediaStats *v47;
  MOMediaStats *v48;
  double v49;
  void *v50;
  void *v51;
  id v52;
  NSObject *v53;
  NSMutableDictionary *v54;
  double v55;
  id v56;
  NSObject *v57;
  NSMutableDictionary *v58;
  void *v59;
  id v60;
  id v61;
  __CFString *v62;
  void *v63;
  uint64_t v64;
  double v65;
  void *j;
  void *v67;
  void *v68;
  unsigned __int8 v69;
  double v70;
  double v71;
  uint64_t v72;
  uint64_t v73;
  id v74;
  NSObject *v75;
  __CFString *v76;
  __CFString *v77;
  __CFString *v78;
  id v79;
  NSObject *v80;
  id v81;
  NSMutableDictionary *v82;
  NSMutableDictionary *v83;
  uint64_t v84;
  double v85;
  id v86;
  NSObject *v87;
  NSMutableDictionary *v88;
  __int128 v90;
  NSMutableDictionary *v91;
  void *v93;
  id v94;
  int v95;
  void *v96;
  NSMutableDictionary *v97;
  void *v98;
  NSMutableDictionary *v99;
  __int128 v100;
  __int128 v101;
  __int128 v102;
  __int128 v103;
  __int128 v104;
  __int128 v105;
  __int128 v106;
  __int128 v107;
  uint8_t buf[4];
  NSMutableDictionary *v109;
  __int16 v110;
  NSMutableDictionary *v111;
  __int16 v112;
  double v113;
  __int16 v114;
  double v115;
  __int16 v116;
  uint64_t v117;
  _BYTE v118[128];
  _BYTE v119[128];
  _QWORD v120[5];
  _QWORD v121[5];

  v94 = a3;
  v10 = a4;
  v11 = v10;
  if (a5 < 0.0)
  {
    os_log = _mo_log_facility_get_os_log(&MOLogFacilityGeneral);
    v13 = objc_claimAutoreleasedReturnValue(os_log);
    if (os_log_type_enabled(v13, OS_LOG_TYPE_ERROR))
      +[MOContextAnnotationUtilities dominantMediaNameFromPlaySessions:intervalOfInterest:dominantFactorThreshold:confidence:].cold.1();

    v14 = (NSMutableDictionary *)objc_claimAutoreleasedReturnValue(+[NSAssertionHandler currentHandler](NSAssertionHandler, "currentHandler"));
    v15 = CFSTR("Invalid parameter not satisfying: dominantFactorThreshold >= 0");
    v16 = a2;
    v17 = a1;
    v18 = v14;
    v19 = 858;
LABEL_82:
    -[NSMutableDictionary handleFailureInMethod:object:file:lineNumber:description:](v14, "handleFailureInMethod:object:file:lineNumber:description:", v16, v17, CFSTR("MOContextAnnotationUtilities.m"), v19, v15);
    v88 = 0;
    goto LABEL_85;
  }
  objc_msgSend(v10, "duration");
  if (v20 <= 0.0)
  {
    v86 = _mo_log_facility_get_os_log(&MOLogFacilityGeneral);
    v87 = objc_claimAutoreleasedReturnValue(v86);
    if (os_log_type_enabled(v87, OS_LOG_TYPE_ERROR))
      +[MOContextAnnotationUtilities dominantMediaNameFromPlaySessions:intervalOfInterest:dominantFactorThreshold:confidence:].cold.3();

    v14 = (NSMutableDictionary *)objc_claimAutoreleasedReturnValue(+[NSAssertionHandler currentHandler](NSAssertionHandler, "currentHandler"));
    v15 = CFSTR("Invalid parameter not satisfying: intervalOfInterest.duration > 0");
    v16 = a2;
    v17 = a1;
    v18 = v14;
    v19 = 859;
    goto LABEL_82;
  }
  v91 = objc_opt_new(NSMutableDictionary);
  v120[0] = &off_1002D8378;
  v120[1] = &off_1002D8390;
  v121[0] = CFSTR("title");
  v121[1] = CFSTR("album");
  v120[2] = &off_1002D83A8;
  v120[3] = &off_1002D83C0;
  v121[2] = CFSTR("artist");
  v121[3] = CFSTR("genre");
  v120[4] = &off_1002D83D8;
  v121[4] = CFSTR("bundleId");
  v93 = (void *)objc_claimAutoreleasedReturnValue(+[NSDictionary dictionaryWithObjects:forKeys:count:](NSDictionary, "dictionaryWithObjects:forKeys:count:", v121, v120, 5));
  v21 = _mo_log_facility_get_os_log(&MOLogFacilityEventBundleManager);
  v22 = objc_claimAutoreleasedReturnValue(v21);
  if (os_log_type_enabled(v22, OS_LOG_TYPE_DEBUG))
    +[MOContextAnnotationUtilities dominantMediaNameFromPlaySessions:intervalOfInterest:dominantFactorThreshold:confidence:].cold.2(v94, (uint64_t)v11, v22);

  v23 = 1;
  *(_QWORD *)&v24 = 138413314;
  v90 = v24;
  v98 = v11;
  while (2)
  {
    v95 = v23;
    v96 = (void *)objc_claimAutoreleasedReturnValue(+[NSNumber numberWithInt:](NSNumber, "numberWithInt:", v90));
    v97 = (NSMutableDictionary *)objc_claimAutoreleasedReturnValue(objc_msgSend(v93, "objectForKey:"));
    v99 = objc_opt_new(NSMutableDictionary);
    v104 = 0u;
    v105 = 0u;
    v106 = 0u;
    v107 = 0u;
    v25 = v94;
    v26 = objc_msgSend(v25, "countByEnumeratingWithState:objects:count:", &v104, v119, 16);
    if (!v26)
    {
      v29 = 0.0;
      goto LABEL_34;
    }
    v27 = v26;
    v28 = *(_QWORD *)v105;
    v29 = 0.0;
    do
    {
      for (i = 0; i != v27; i = (char *)i + 1)
      {
        if (*(_QWORD *)v105 != v28)
          objc_enumerationMutation(v25);
        v31 = *(void **)(*((_QWORD *)&v104 + 1) + 8 * (_QWORD)i);
        v32 = objc_alloc((Class)NSDateInterval);
        v33 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v31, "startDate"));
        v34 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v31, "endDate"));
        v35 = objc_msgSend(v32, "initWithStartDate:endDate:", v33, v34);

        v36 = v35;
        v37 = v36;
        if (!v11
          || (v37 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v11, "intersectionWithDateInterval:", v36)),
              v36,
              objc_msgSend(v37, "duration"),
              v38 != 0.0))
        {
          objc_msgSend(v37, "duration");
          v40 = v39;
          v41 = (__CFString *)objc_claimAutoreleasedReturnValue(objc_msgSend(v31, "valueForKeyPath:", v97));
          v42 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v31, "bundleId"));
          if (objc_msgSend(v42, "isEqualToString:", CFSTR("com.apple.podcasts")))
          {
            v43 = objc_msgSend(v96, "unsignedLongValue");

            v44 = v43 == (id)2;
            v11 = v98;
            if (!v44)
            {
              if (!v41)
              {
LABEL_22:

                v41 = CFSTR("__Unknown__");
                goto LABEL_23;
              }
LABEL_21:
              if (!-[__CFString length](v41, "length"))
                goto LABEL_22;
LABEL_23:
              objc_msgSend(v37, "duration");
              v46 = v45;
              v47 = (MOMediaStats *)objc_claimAutoreleasedReturnValue(-[NSMutableDictionary objectForKey:](v99, "objectForKey:", v41));
              if (v47)
              {
                v48 = v47;
                -[MOMediaStats value](v47, "value");
                -[MOMediaStats setValue:](v48, "setValue:", v46 + v49);
              }
              else
              {
                v48 = -[MOMediaStats initWithKeyword:value:]([MOMediaStats alloc], "initWithKeyword:value:", v41, v46);
              }
              v50 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v31, "bundleId"));
              -[MOMediaStats setBundleId:](v48, "setBundleId:", v50);

              v51 = (void *)objc_claimAutoreleasedReturnValue(-[MOMediaStats members](v48, "members"));
              objc_msgSend(v51, "addObject:", v31);

              -[NSMutableDictionary setObject:forKey:](v99, "setObject:forKey:", v48, v41);
              v52 = _mo_log_facility_get_os_log(&MOLogFacilityEventBundleManager);
              v53 = objc_claimAutoreleasedReturnValue(v52);
              if (os_log_type_enabled(v53, OS_LOG_TYPE_DEBUG))
              {
                v54 = (NSMutableDictionary *)objc_claimAutoreleasedReturnValue(+[MOMediaPlaySession redactString:](MOMediaPlaySession, "redactString:", v41));
                -[MOMediaStats value](v48, "value");
                *(_DWORD *)buf = 138413058;
                v109 = v97;
                v110 = 2112;
                v111 = v54;
                v112 = 2048;
                v113 = v46;
                v114 = 2048;
                v115 = v55;
                _os_log_debug_impl((void *)&_mh_execute_header, v53, OS_LOG_TYPE_DEBUG, "MediaName, property.path, %@, property.name, %@, property.value, %f, total.value, %f", buf, 0x2Au);

              }
              v11 = v98;
            }
            v29 = v29 + v40;

            goto LABEL_30;
          }

          if (!v41)
            goto LABEL_22;
          goto LABEL_21;
        }
LABEL_30:

      }
      v27 = objc_msgSend(v25, "countByEnumeratingWithState:objects:count:", &v104, v119, 16);
    }
    while (v27);
LABEL_34:

    v56 = _mo_log_facility_get_os_log(&MOLogFacilityEventBundleManager);
    v57 = objc_claimAutoreleasedReturnValue(v56);
    v58 = v99;
    if (os_log_type_enabled(v57, OS_LOG_TYPE_DEBUG))
    {
      *(_DWORD *)buf = 138412546;
      v109 = v97;
      v110 = 2112;
      v111 = v99;
      _os_log_debug_impl((void *)&_mh_execute_header, v57, OS_LOG_TYPE_DEBUG, "MediaName, property.path, %@, stats %@", buf, 0x16u);
    }

    if (!-[NSMutableDictionary count](v99, "count"))
    {
LABEL_76:

      v23 = v95 + 1;
      if (v95 == 5)
      {
        v88 = 0;
        v18 = v91;
        goto LABEL_84;
      }
      continue;
    }
    break;
  }
  v102 = 0u;
  v103 = 0u;
  v100 = 0u;
  v101 = 0u;
  v59 = (void *)objc_claimAutoreleasedReturnValue(-[NSMutableDictionary allValues](v99, "allValues"));
  v60 = objc_msgSend(v59, "countByEnumeratingWithState:objects:count:", &v100, v118, 16);
  if (v60)
  {
    v61 = v60;
    v62 = 0;
    v63 = 0;
    v64 = *(_QWORD *)v101;
    v65 = -1.0;
    do
    {
      for (j = 0; j != v61; j = (char *)j + 1)
      {
        if (*(_QWORD *)v101 != v64)
          objc_enumerationMutation(v59);
        v67 = *(void **)(*((_QWORD *)&v100 + 1) + 8 * (_QWORD)j);
        v68 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v67, "keyword"));
        v69 = objc_msgSend(v68, "isEqualToString:", CFSTR("__Unknown__"));

        if ((v69 & 1) == 0)
        {
          objc_msgSend(v67, "value");
          if (v70 > v65)
          {
            objc_msgSend(v67, "value");
            v65 = v71;
            v72 = objc_claimAutoreleasedReturnValue(objc_msgSend(v67, "keyword"));

            v73 = objc_claimAutoreleasedReturnValue(objc_msgSend(v67, "bundleId"));
            v62 = (__CFString *)v72;
            v63 = (void *)v73;
          }
        }
      }
      v61 = objc_msgSend(v59, "countByEnumeratingWithState:objects:count:", &v100, v118, 16);
    }
    while (v61);
  }
  else
  {
    v62 = 0;
    v63 = 0;
    v65 = -1.0;
  }

  v74 = _mo_log_facility_get_os_log(&MOLogFacilityEventBundleManager);
  v75 = objc_claimAutoreleasedReturnValue(v74);
  if (os_log_type_enabled(v75, OS_LOG_TYPE_DEBUG))
  {
    v82 = (NSMutableDictionary *)objc_claimAutoreleasedReturnValue(+[MOMediaPlaySession redactString:](MOMediaPlaySession, "redactString:", v62));
    *(_DWORD *)buf = 138413058;
    v109 = v97;
    v110 = 2112;
    v111 = v82;
    v112 = 2048;
    v113 = v65;
    v114 = 2048;
    v115 = v29;
    _os_log_debug_impl((void *)&_mh_execute_header, v75, OS_LOG_TYPE_DEBUG, "MediaName, property.path, %@, topKeyword, %@, topDuration %f, totalDuration, %f", buf, 0x2Au);

  }
  if (v65 > v29 * a5)
  {
    if (-[NSMutableDictionary isEqual:](v97, "isEqual:", CFSTR("bundleId")))
    {
      v76 = (__CFString *)objc_claimAutoreleasedReturnValue(+[MOContextAnnotationUtilities bundleNameFromBundleId:](MOContextAnnotationUtilities, "bundleNameFromBundleId:", v62));
      v77 = v76;
      if (v76)
        v78 = v76;

    }
    else
    {
      v77 = v62;
    }
    v58 = v99;
    if (v65 > 0.0 && v29 > 0.0)
      *a6 = v65 / v29;
    v79 = _mo_log_facility_get_os_log(&MOLogFacilityEventBundleManager);
    v80 = objc_claimAutoreleasedReturnValue(v79);
    if (os_log_type_enabled(v80, OS_LOG_TYPE_DEBUG))
      goto LABEL_78;
    goto LABEL_71;
  }
  if (v95 != 5)
  {
    v77 = v62;
    v58 = v99;
    goto LABEL_75;
  }
  if (-[NSMutableDictionary isEqual:](v97, "isEqual:", CFSTR("bundleId")))
  {

    v77 = CFSTR("Media");
  }
  else
  {
    v77 = v62;
  }
  v58 = v99;
  if (v65 > 0.0 && v29 > 0.0)
    *a6 = v65 / v29;
  v81 = _mo_log_facility_get_os_log(&MOLogFacilityEventBundleManager);
  v80 = objc_claimAutoreleasedReturnValue(v81);
  if (os_log_type_enabled(v80, OS_LOG_TYPE_DEBUG))
  {
LABEL_78:
    v83 = (NSMutableDictionary *)objc_claimAutoreleasedReturnValue(+[MOMediaPlaySession redactString:](MOMediaPlaySession, "redactString:", v77));
    objc_msgSend(v11, "duration");
    v84 = *(_QWORD *)a6;
    *(_DWORD *)buf = v90;
    v109 = v83;
    v110 = 2112;
    v111 = v97;
    v112 = 2048;
    v113 = v65;
    v114 = 2048;
    v115 = v85;
    v116 = 2048;
    v117 = v84;
    _os_log_debug_impl((void *)&_mh_execute_header, v80, OS_LOG_TYPE_DEBUG, "MediaName, mediaName, %@, property.path, %@, duration, %f, intervalOfInterest, %f, confidence, %f", buf, 0x34u);

  }
LABEL_71:

  if (!v96 || !v77 || !v63 || !v97)
  {
LABEL_75:

    goto LABEL_76;
  }
  v18 = v91;
  -[NSMutableDictionary setObject:forKeyedSubscript:](v91, "setObject:forKeyedSubscript:", v77, CFSTR("DominantMediaNameKey"));
  -[NSMutableDictionary setObject:forKeyedSubscript:](v91, "setObject:forKeyedSubscript:", v63, CFSTR("DominantMediaBundleIdKey"));
  -[NSMutableDictionary setObject:forKeyedSubscript:](v91, "setObject:forKeyedSubscript:", v97, CFSTR("DominantMediaPropertyKey"));
  -[NSMutableDictionary setObject:forKeyedSubscript:](v91, "setObject:forKeyedSubscript:", v96, CFSTR("DominantMediaInfoKey"));
  v88 = v91;

LABEL_84:
LABEL_85:

  return v88;
}

+ (id)dominantMediaNameFromPlaySessions:(id)a3 intervalsOfInterest:(id)a4 dominantFactorThreshold:(double)a5 confidence:(double *)a6
{
  id v10;
  void *v11;
  id os_log;
  NSObject *v13;
  NSMutableDictionary *v14;
  NSMutableDictionary *v15;
  const __CFString *v16;
  SEL v17;
  id v18;
  uint64_t v19;
  NSMutableDictionary *v20;
  id v21;
  NSObject *v22;
  int v23;
  __int128 v24;
  _UNKNOWN **v25;
  uint64_t v26;
  double v27;
  void *i;
  void *v29;
  id v30;
  void *v31;
  void *v32;
  id v33;
  id v34;
  id v35;
  void *v36;
  uint64_t v37;
  void *v38;
  void *v39;
  double v40;
  double v41;
  double v42;
  __CFString *v43;
  __CFString *v44;
  double v45;
  double v46;
  MOMediaStats *v47;
  MOMediaStats *v48;
  double v49;
  void *v50;
  void *v51;
  id v52;
  NSObject *v53;
  NSMutableDictionary *v54;
  double v55;
  id v56;
  NSObject *v57;
  NSMutableDictionary *v58;
  void *v59;
  id v60;
  id v61;
  __CFString *v62;
  void *v63;
  uint64_t v64;
  double v65;
  void *j;
  void *v67;
  void *v68;
  unsigned __int8 v69;
  double v70;
  double v71;
  uint64_t v72;
  uint64_t v73;
  id v74;
  NSObject *v75;
  __CFString *v76;
  __CFString *v77;
  __CFString *v78;
  id v79;
  NSObject *v80;
  NSMutableDictionary *v81;
  uint64_t v82;
  id v83;
  NSMutableDictionary *v84;
  void *v85;
  uint64_t v86;
  double v87;
  NSMutableDictionary *v88;
  id v89;
  NSObject *v90;
  __int128 v92;
  void *v94;
  id v95;
  NSMutableDictionary *v96;
  int v97;
  void *v98;
  uint64_t v99;
  void *v100;
  id obj;
  id v102;
  void *v103;
  id v104;
  NSMutableDictionary *v105;
  NSMutableDictionary *v106;
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
  NSMutableDictionary *v120;
  __int16 v121;
  NSMutableDictionary *v122;
  __int16 v123;
  double v124;
  __int16 v125;
  double v126;
  __int16 v127;
  uint64_t v128;
  _BYTE v129[128];
  _BYTE v130[128];
  _BYTE v131[128];
  _QWORD v132[5];
  _QWORD v133[5];

  v95 = a3;
  v10 = a4;
  v11 = v10;
  if (a5 < 0.0)
  {
    os_log = _mo_log_facility_get_os_log(&MOLogFacilityGeneral);
    v13 = objc_claimAutoreleasedReturnValue(os_log);
    if (os_log_type_enabled(v13, OS_LOG_TYPE_ERROR))
      +[MOContextAnnotationUtilities dominantMediaNameFromPlaySessions:intervalOfInterest:dominantFactorThreshold:confidence:].cold.1();

    v14 = (NSMutableDictionary *)objc_claimAutoreleasedReturnValue(+[NSAssertionHandler currentHandler](NSAssertionHandler, "currentHandler"));
    v15 = v14;
    v16 = CFSTR("Invalid parameter not satisfying: dominantFactorThreshold >= 0");
    v17 = a2;
    v18 = a1;
    v19 = 980;
LABEL_87:
    -[NSMutableDictionary handleFailureInMethod:object:file:lineNumber:description:](v14, "handleFailureInMethod:object:file:lineNumber:description:", v17, v18, CFSTR("MOContextAnnotationUtilities.m"), v19, v16);
    v88 = 0;
    goto LABEL_90;
  }
  if (!objc_msgSend(v10, "count"))
  {
    v89 = _mo_log_facility_get_os_log(&MOLogFacilityGeneral);
    v90 = objc_claimAutoreleasedReturnValue(v89);
    if (os_log_type_enabled(v90, OS_LOG_TYPE_ERROR))
      +[MOContextAnnotationUtilities dominantMediaNameFromPlaySessions:intervalsOfInterest:dominantFactorThreshold:confidence:].cold.2();

    v14 = (NSMutableDictionary *)objc_claimAutoreleasedReturnValue(+[NSAssertionHandler currentHandler](NSAssertionHandler, "currentHandler"));
    v15 = v14;
    v16 = CFSTR("Invalid parameter not satisfying: intervalsOfInterest.count > 0");
    v17 = a2;
    v18 = a1;
    v19 = 981;
    goto LABEL_87;
  }
  v20 = objc_opt_new(NSMutableDictionary);
  v132[0] = &off_1002D8378;
  v132[1] = &off_1002D8390;
  v133[0] = CFSTR("title");
  v133[1] = CFSTR("album");
  v132[2] = &off_1002D83A8;
  v132[3] = &off_1002D83C0;
  v133[2] = CFSTR("artist");
  v133[3] = CFSTR("genre");
  v132[4] = &off_1002D83D8;
  v133[4] = CFSTR("bundleId");
  v94 = (void *)objc_claimAutoreleasedReturnValue(+[NSDictionary dictionaryWithObjects:forKeys:count:](NSDictionary, "dictionaryWithObjects:forKeys:count:", v133, v132, 5));
  v21 = _mo_log_facility_get_os_log(&MOLogFacilityEventBundleManager);
  v22 = objc_claimAutoreleasedReturnValue(v21);
  if (os_log_type_enabled(v22, OS_LOG_TYPE_DEBUG))
    +[MOContextAnnotationUtilities dominantMediaNameFromPlaySessions:intervalsOfInterest:dominantFactorThreshold:confidence:].cold.3(v95, (uint64_t)v11, v22);

  v23 = 1;
  *(_QWORD *)&v24 = 138413314;
  v92 = v24;
  v25 = &_s10Foundation11MeasurementV19_bridgeToObjectiveCSo13NSMeasurementCyF_ptr;
  v100 = v11;
  v96 = v20;
  while (1)
  {
    v97 = v23;
    v98 = (void *)objc_claimAutoreleasedReturnValue(+[NSNumber numberWithInt:](NSNumber, "numberWithInt:", v92));
    v105 = (NSMutableDictionary *)objc_claimAutoreleasedReturnValue(objc_msgSend(v94, "objectForKey:"));
    v106 = objc_opt_new(NSMutableDictionary);
    v115 = 0u;
    v116 = 0u;
    v117 = 0u;
    v118 = 0u;
    obj = v95;
    v102 = objc_msgSend(obj, "countByEnumeratingWithState:objects:count:", &v115, v131, 16);
    if (v102)
    {
      v26 = *(_QWORD *)v116;
      v27 = 0.0;
      v99 = *(_QWORD *)v116;
      do
      {
        for (i = 0; i != v102; i = (char *)i + 1)
        {
          if (*(_QWORD *)v116 != v26)
            objc_enumerationMutation(obj);
          v29 = *(void **)(*((_QWORD *)&v115 + 1) + 8 * (_QWORD)i);
          v30 = objc_alloc((Class)v25[297]);
          v31 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v29, "startDate"));
          v32 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v29, "endDate"));
          v33 = objc_msgSend(v30, "initWithStartDate:endDate:", v31, v32);

          if (objc_msgSend(v11, "count"))
          {
            v103 = i;
            v113 = 0u;
            v114 = 0u;
            v111 = 0u;
            v112 = 0u;
            v104 = v11;
            v34 = objc_msgSend(v104, "countByEnumeratingWithState:objects:count:", &v111, v130, 16);
            if (v34)
            {
              v35 = v34;
              v36 = 0;
              v37 = *(_QWORD *)v112;
              do
              {
                v38 = 0;
                v39 = v36;
                do
                {
                  if (*(_QWORD *)v112 != v37)
                    objc_enumerationMutation(v104);
                  v36 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(*(id *)(*((_QWORD *)&v111 + 1) + 8 * (_QWORD)v38), "intersectionWithDateInterval:", v33));

                  objc_msgSend(v36, "duration");
                  if (v40 != 0.0)
                  {
                    objc_msgSend(v36, "duration");
                    v42 = v41;
                    v43 = (__CFString *)objc_claimAutoreleasedReturnValue(objc_msgSend(v29, "valueForKeyPath:", v105));
                    v44 = v43;
                    if (!v43 || !-[__CFString length](v43, "length"))
                    {

                      v44 = CFSTR("__Unknown__");
                    }
                    objc_msgSend(v36, "duration");
                    v46 = v45;
                    v47 = (MOMediaStats *)objc_claimAutoreleasedReturnValue(-[NSMutableDictionary objectForKey:](v106, "objectForKey:", v44));
                    if (v47)
                    {
                      v48 = v47;
                      -[MOMediaStats value](v47, "value");
                      -[MOMediaStats setValue:](v48, "setValue:", v46 + v49);
                    }
                    else
                    {
                      v48 = -[MOMediaStats initWithKeyword:value:]([MOMediaStats alloc], "initWithKeyword:value:", v44, v46);
                    }
                    v50 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v29, "bundleId"));
                    -[MOMediaStats setBundleId:](v48, "setBundleId:", v50);

                    v51 = (void *)objc_claimAutoreleasedReturnValue(-[MOMediaStats members](v48, "members"));
                    objc_msgSend(v51, "addObject:", v29);

                    -[NSMutableDictionary setObject:forKey:](v106, "setObject:forKey:", v48, v44);
                    v52 = _mo_log_facility_get_os_log(&MOLogFacilityEventBundleManager);
                    v53 = objc_claimAutoreleasedReturnValue(v52);
                    if (os_log_type_enabled(v53, OS_LOG_TYPE_DEBUG))
                    {
                      v54 = (NSMutableDictionary *)objc_claimAutoreleasedReturnValue(+[MOMediaPlaySession redactString:](MOMediaPlaySession, "redactString:", v44));
                      -[MOMediaStats value](v48, "value");
                      *(_DWORD *)buf = 138413058;
                      v120 = v105;
                      v121 = 2112;
                      v122 = v54;
                      v123 = 2048;
                      v124 = v46;
                      v125 = 2048;
                      v126 = v55;
                      _os_log_debug_impl((void *)&_mh_execute_header, v53, OS_LOG_TYPE_DEBUG, "MediaName, property.path, %@, property.name, %@, property.value, %f, total.value, %f", buf, 0x2Au);

                    }
                    v27 = v27 + v42;

                  }
                  v38 = (char *)v38 + 1;
                  v39 = v36;
                }
                while (v35 != v38);
                v35 = objc_msgSend(v104, "countByEnumeratingWithState:objects:count:", &v111, v130, 16);
              }
              while (v35);

              v26 = v99;
              v11 = v100;
              v25 = &_s10Foundation11MeasurementV19_bridgeToObjectiveCSo13NSMeasurementCyF_ptr;
            }

            i = v103;
          }

        }
        v102 = objc_msgSend(obj, "countByEnumeratingWithState:objects:count:", &v115, v131, 16);
      }
      while (v102);
    }
    else
    {
      v27 = 0.0;
    }

    v56 = _mo_log_facility_get_os_log(&MOLogFacilityEventBundleManager);
    v57 = objc_claimAutoreleasedReturnValue(v56);
    v58 = v106;
    if (os_log_type_enabled(v57, OS_LOG_TYPE_DEBUG))
    {
      *(_DWORD *)buf = 138412546;
      v120 = v105;
      v121 = 2112;
      v122 = v106;
      _os_log_debug_impl((void *)&_mh_execute_header, v57, OS_LOG_TYPE_DEBUG, "MediaName, property.path, %@, stats %@", buf, 0x16u);
    }

    v15 = v96;
    if (!-[NSMutableDictionary count](v106, "count"))
      goto LABEL_80;
    v109 = 0u;
    v110 = 0u;
    v107 = 0u;
    v108 = 0u;
    v59 = (void *)objc_claimAutoreleasedReturnValue(-[NSMutableDictionary allValues](v106, "allValues"));
    v60 = objc_msgSend(v59, "countByEnumeratingWithState:objects:count:", &v107, v129, 16);
    if (v60)
    {
      v61 = v60;
      v62 = 0;
      v63 = 0;
      v64 = *(_QWORD *)v108;
      v65 = -1.0;
      do
      {
        for (j = 0; j != v61; j = (char *)j + 1)
        {
          if (*(_QWORD *)v108 != v64)
            objc_enumerationMutation(v59);
          v67 = *(void **)(*((_QWORD *)&v107 + 1) + 8 * (_QWORD)j);
          v68 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v67, "keyword"));
          v69 = objc_msgSend(v68, "isEqualToString:", CFSTR("__Unknown__"));

          if ((v69 & 1) == 0)
          {
            objc_msgSend(v67, "value");
            if (v70 > v65)
            {
              objc_msgSend(v67, "value");
              v65 = v71;
              v72 = objc_claimAutoreleasedReturnValue(objc_msgSend(v67, "keyword"));

              v73 = objc_claimAutoreleasedReturnValue(objc_msgSend(v67, "bundleId"));
              v62 = (__CFString *)v72;
              v63 = (void *)v73;
            }
          }
        }
        v61 = objc_msgSend(v59, "countByEnumeratingWithState:objects:count:", &v107, v129, 16);
      }
      while (v61);
    }
    else
    {
      v62 = 0;
      v63 = 0;
      v65 = -1.0;
    }

    v74 = _mo_log_facility_get_os_log(&MOLogFacilityEventBundleManager);
    v75 = objc_claimAutoreleasedReturnValue(v74);
    if (os_log_type_enabled(v75, OS_LOG_TYPE_DEBUG))
    {
      v84 = (NSMutableDictionary *)objc_claimAutoreleasedReturnValue(+[MOMediaPlaySession redactString:](MOMediaPlaySession, "redactString:", v62));
      *(_DWORD *)buf = 138413058;
      v120 = v105;
      v121 = 2112;
      v122 = v84;
      v123 = 2048;
      v124 = v65;
      v125 = 2048;
      v126 = v27;
      _os_log_debug_impl((void *)&_mh_execute_header, v75, OS_LOG_TYPE_DEBUG, "MediaName, property.path, %@, topKeyword, %@, topDuration %f, totalDuration, %f", buf, 0x2Au);

    }
    v11 = v100;
    if (v65 > v27 * a5)
    {
      v25 = &_s10Foundation11MeasurementV19_bridgeToObjectiveCSo13NSMeasurementCyF_ptr;
      if (-[NSMutableDictionary isEqual:](v105, "isEqual:", CFSTR("bundleId")))
      {
        v76 = (__CFString *)objc_claimAutoreleasedReturnValue(+[MOContextAnnotationUtilities bundleNameFromBundleId:](MOContextAnnotationUtilities, "bundleNameFromBundleId:", v62));
        v77 = v76;
        if (v76)
          v78 = v76;

      }
      else
      {
        v77 = v62;
      }
      v15 = v96;
      if (v65 > 0.0 && v27 > 0.0)
        *a6 = v65 / v27;
      v79 = _mo_log_facility_get_os_log(&MOLogFacilityEventBundleManager);
      v80 = objc_claimAutoreleasedReturnValue(v79);
      if (!os_log_type_enabled(v80, OS_LOG_TYPE_DEBUG))
        goto LABEL_75;
      v81 = (NSMutableDictionary *)objc_claimAutoreleasedReturnValue(+[MOMediaPlaySession redactString:](MOMediaPlaySession, "redactString:", v77));
      v82 = *(_QWORD *)a6;
      *(_DWORD *)buf = v92;
      v120 = v81;
      v121 = 2112;
      v122 = v105;
      v123 = 2048;
      v124 = v65;
      v125 = 2048;
      v126 = v27;
      v127 = 2048;
      v128 = v82;
      _os_log_debug_impl((void *)&_mh_execute_header, v80, OS_LOG_TYPE_DEBUG, "MediaName, mediaName, %@, property.path, %@, duration, %f, total play duration, %f, confidence, %f", buf, 0x34u);
LABEL_83:

      goto LABEL_75;
    }
    v25 = &_s10Foundation11MeasurementV19_bridgeToObjectiveCSo13NSMeasurementCyF_ptr;
    if (v97 == 5)
      break;
    v77 = v62;
    v15 = v96;
LABEL_79:

    v58 = v106;
LABEL_80:

    v23 = v97 + 1;
    if (v97 == 5)
    {
      v88 = 0;
      goto LABEL_89;
    }
  }
  if (-[NSMutableDictionary isEqual:](v105, "isEqual:", CFSTR("bundleId")))
  {

    v77 = CFSTR("Media");
  }
  else
  {
    v77 = v62;
  }
  v15 = v96;
  if (v65 > 0.0 && v27 > 0.0)
    *a6 = v65 / v27;
  v83 = _mo_log_facility_get_os_log(&MOLogFacilityEventBundleManager);
  v80 = objc_claimAutoreleasedReturnValue(v83);
  if (os_log_type_enabled(v80, OS_LOG_TYPE_DEBUG))
  {
    v81 = (NSMutableDictionary *)objc_claimAutoreleasedReturnValue(+[MOMediaPlaySession redactString:](MOMediaPlaySession, "redactString:", v77));
    v85 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v100, "firstObject"));
    objc_msgSend(v85, "duration");
    v86 = *(_QWORD *)a6;
    *(_DWORD *)buf = v92;
    v120 = v81;
    v121 = 2112;
    v122 = v105;
    v123 = 2048;
    v124 = v65;
    v125 = 2048;
    v126 = v87;
    v127 = 2048;
    v128 = v86;
    _os_log_debug_impl((void *)&_mh_execute_header, v80, OS_LOG_TYPE_DEBUG, "MediaName, mediaName, %@, property.path, %@, duration, %f, intervalOfInterest, %f, confidence, %f", buf, 0x34u);

    v15 = v96;
    goto LABEL_83;
  }
LABEL_75:

  if (!v98 || !v77 || !v63 || !v105)
    goto LABEL_79;
  -[NSMutableDictionary setObject:forKeyedSubscript:](v15, "setObject:forKeyedSubscript:", v77, CFSTR("DominantMediaNameKey"));
  -[NSMutableDictionary setObject:forKeyedSubscript:](v15, "setObject:forKeyedSubscript:", v63, CFSTR("DominantMediaBundleIdKey"));
  -[NSMutableDictionary setObject:forKeyedSubscript:](v15, "setObject:forKeyedSubscript:", v105, CFSTR("DominantMediaPropertyKey"));
  -[NSMutableDictionary setObject:forKeyedSubscript:](v15, "setObject:forKeyedSubscript:", v98, CFSTR("DominantMediaInfoKey"));
  v88 = v15;

LABEL_89:
LABEL_90:

  return v88;
}

+ (double)labelConfidenceForEventBundle:(id)a3
{
  id v3;
  uint64_t v4;
  double v5;
  void *v6;
  void *v7;
  double v8;
  double v9;
  void *v10;
  double v11;
  void *v12;
  uint64_t v13;
  void *v14;
  void *v15;
  double v16;
  double v17;
  void *v18;
  double v19;
  void *v20;
  uint64_t v21;
  void *v22;
  id v23;
  id v24;
  uint64_t v25;
  void *i;
  void *v27;
  double v28;
  double v29;
  uint64_t v30;
  uint64_t v31;
  void *v32;
  void *v33;
  double v34;
  double v35;
  void *v36;
  double v37;
  id os_log;
  NSObject *v39;
  void *v41;
  uint64_t v42;
  uint64_t v43;
  void *v44;
  uint64_t v45;
  uint64_t v46;
  void *v47;
  uint64_t v48;
  __int128 v49;
  __int128 v50;
  __int128 v51;
  __int128 v52;
  uint8_t buf[4];
  double v54;
  __int16 v55;
  uint64_t v56;
  __int16 v57;
  uint64_t v58;
  __int16 v59;
  void *v60;
  __int16 v61;
  uint64_t v62;
  __int16 v63;
  id v64;
  _BYTE v65[128];

  v3 = a3;
  v4 = objc_claimAutoreleasedReturnValue(objc_msgSend(v3, "action"));
  v5 = 1.0;
  if (v4)
  {
    v6 = (void *)v4;
    v7 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v3, "action"));
    objc_msgSend(v7, "actionNameConfidence");
    v9 = v8;

    if (v9 > 0.0)
    {
      v10 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v3, "action"));
      objc_msgSend(v10, "actionNameConfidence");
      v5 = v11;

    }
  }
  v12 = (void *)objc_claimAutoreleasedReturnValue(+[NSMutableString stringWithString:](NSMutableString, "stringWithString:", CFSTR("[")));
  v13 = objc_claimAutoreleasedReturnValue(objc_msgSend(v3, "concurrentMediaAction"));
  if (v13)
  {
    v14 = (void *)v13;
    v15 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v3, "concurrentMediaAction"));
    objc_msgSend(v15, "actionNameConfidence");
    v17 = v16;

    if (v17 > 0.0)
    {
      v18 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v3, "concurrentMediaAction"));
      objc_msgSend(v18, "actionNameConfidence");
      v5 = v5 * v19;

      v20 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v3, "concurrentMediaAction"));
      objc_msgSend(v20, "actionNameConfidence");
      objc_msgSend(v12, "appendFormat:", CFSTR("(%f)"), v21);

    }
  }
  v51 = 0u;
  v52 = 0u;
  v49 = 0u;
  v50 = 0u;
  v22 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v3, "actions"));
  v23 = objc_msgSend(v22, "countByEnumeratingWithState:objects:count:", &v49, v65, 16);
  if (v23)
  {
    v24 = v23;
    v25 = *(_QWORD *)v50;
    do
    {
      for (i = 0; i != v24; i = (char *)i + 1)
      {
        if (*(_QWORD *)v50 != v25)
          objc_enumerationMutation(v22);
        v27 = *(void **)(*((_QWORD *)&v49 + 1) + 8 * (_QWORD)i);
        objc_msgSend(v27, "actionNameConfidence");
        if (v28 > 0.0)
        {
          objc_msgSend(v27, "actionNameConfidence");
          v5 = v5 * v29;
          objc_msgSend(v27, "actionNameConfidence");
          objc_msgSend(v12, "appendFormat:", CFSTR("(%f)"), v30);
        }
      }
      v24 = objc_msgSend(v22, "countByEnumeratingWithState:objects:count:", &v49, v65, 16);
    }
    while (v24);
  }

  objc_msgSend(v12, "appendString:", CFSTR("]"));
  v31 = objc_claimAutoreleasedReturnValue(objc_msgSend(v3, "place"));
  if (v31)
  {
    v32 = (void *)v31;
    v33 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v3, "place"));
    objc_msgSend(v33, "placeNameConfidence");
    v35 = v34;

    if (v35 > 0.0)
    {
      v36 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v3, "place"));
      objc_msgSend(v36, "placeNameConfidence");
      v5 = v5 * v37;

    }
  }
  os_log = _mo_log_facility_get_os_log(&MOLogFacilityEventBundleManager);
  v39 = objc_claimAutoreleasedReturnValue(os_log);
  if (os_log_type_enabled(v39, OS_LOG_TYPE_DEBUG))
  {
    v41 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v3, "action"));
    objc_msgSend(v41, "actionNameConfidence");
    v43 = v42;
    v44 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v3, "concurrentMediaAction"));
    objc_msgSend(v44, "actionNameConfidence");
    v46 = v45;
    v47 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v3, "place"));
    objc_msgSend(v47, "placeNameConfidence");
    *(_DWORD *)buf = 134219266;
    v54 = v5;
    v55 = 2048;
    v56 = v43;
    v57 = 2048;
    v58 = v46;
    v59 = 2112;
    v60 = v12;
    v61 = 2048;
    v62 = v48;
    v63 = 2112;
    v64 = v3;
    _os_log_debug_impl((void *)&_mh_execute_header, v39, OS_LOG_TYPE_DEBUG, "label confidence, label confidence score, %f, actionNameConfidence, %f, concurrentMediaActionNameConfidence, %f, backgroundActionNameConfidence, %@, placeNameConfidence, %f, bundle, %@", buf, 0x3Eu);

  }
  return v5;
}

+ (id)bundleNameFromBundleId:(id)a3
{
  id v3;
  id v4;
  void *v5;
  void *v6;
  id v7;
  id os_log;
  NSObject *v9;
  uint64_t v10;
  uint64_t v11;
  uint64_t v12;
  uint64_t v13;
  uint64_t v14;
  uint64_t v15;

  v3 = a3;
  if (v3)
  {
    v4 = objc_msgSend(objc_alloc((Class)LSApplicationRecord), "initWithBundleIdentifier:allowPlaceholder:error:", v3, 0, 0);
    v5 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v4, "localizedName"));
    v6 = (void *)objc_claimAutoreleasedReturnValue(+[MOContextAnnotationUtilities extendedBundleNameFromBundleName:bundleId:](MOContextAnnotationUtilities, "extendedBundleNameFromBundleName:bundleId:", v5, v3));

    if (v6)
    {
      v7 = v6;
    }
    else
    {
      os_log = _mo_log_facility_get_os_log(&MOLogFacilityEventBundleManager);
      v9 = objc_claimAutoreleasedReturnValue(os_log);
      if (os_log_type_enabled(v9, OS_LOG_TYPE_ERROR))
        +[MOContextAnnotationUtilities bundleNameFromBundleId:].cold.1((uint64_t)v3, v9, v10, v11, v12, v13, v14, v15);

    }
  }
  else
  {
    v6 = 0;
  }

  return v6;
}

+ (id)extendedBundleNameFromBundleName:(id)a3 bundleId:(id)a4
{
  id v5;
  id v6;
  id v7;
  void *v8;
  id v9;

  v5 = a3;
  v6 = a4;
  v7 = objc_msgSend(objc_alloc((Class)NSSet), "initWithArray:", &off_1002DC620);
  v8 = 0;
  if (v5 && v6)
  {
    if (objc_msgSend(v6, "hasPrefix:", CFSTR("com.apple."))
      && objc_msgSend(v7, "containsObject:", v5))
    {
      v9 = (id)objc_claimAutoreleasedReturnValue(+[NSString stringWithFormat:](NSString, "stringWithFormat:", CFSTR("Apple %@"), v5));
    }
    else
    {
      v9 = v5;
    }
    v8 = v9;
  }

  return v8;
}

+ (id)andStringFromArray:(id)a3 propertyPath:(id)a4 maxCount:(unint64_t)a5
{
  id v7;
  id v8;
  char *v9;
  char *v10;
  void *v11;
  unint64_t v12;
  char *v13;
  void *v14;
  uint64_t v15;
  void *v16;
  id v17;

  v7 = a3;
  v8 = a4;
  v9 = (char *)objc_msgSend(v7, "count");
  if (v9)
  {
    v10 = v9;
    v11 = 0;
    v12 = 0;
    v13 = v9 - 1;
    while (1)
    {
      v14 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v7, "objectAtIndex:", v12));
      v15 = objc_claimAutoreleasedReturnValue(objc_msgSend(v14, "valueForKeyPath:", v8));
      v16 = (void *)v15;
      if (v11)
      {
        if (v13 == (char *)v12)
        {
          objc_msgSend(v11, "appendFormat:", CFSTR(" and %@"), v15);
        }
        else
        {
          if (v12 >= a5 - 1)
          {
            objc_msgSend(v11, "appendFormat:", CFSTR(", %@ and more"), v15);

            goto LABEL_13;
          }
          objc_msgSend(v11, "appendFormat:", CFSTR(", %@"), v15);
        }
      }
      else
      {
        v11 = (void *)objc_claimAutoreleasedReturnValue(+[NSMutableString stringWithString:](NSMutableString, "stringWithString:", v15));
      }

      if (v10 == (char *)++v12)
        goto LABEL_13;
    }
  }
  v11 = 0;
LABEL_13:
  v17 = objc_msgSend(v11, "copy");

  return v17;
}

+ (id)predicateWithStartDate:(id)a3 endDate:(id)a4
{
  return +[NSPredicate predicateWithFormat:](NSPredicate, "predicateWithFormat:", CFSTR("(startDate >= %@ AND startDate <= %@) OR (endDate >= %@ AND endDate <= %@) OR (startDate <= %@ AND endDate >= %@)"), a3, a4, a3, a4, a3, a4);
}

+ (id)predicateWithStartDate:(id)a3 endDate:(id)a4 distanceThreshold:(double)a5
{
  id v7;
  id v8;
  id v9;
  id v10;
  void *v11;
  _QWORD v13[4];
  id v14;
  double v15;

  v7 = a4;
  v8 = a3;
  v9 = objc_msgSend(objc_alloc((Class)NSDateInterval), "initWithStartDate:endDate:", v8, v7);

  v13[0] = _NSConcreteStackBlock;
  v13[1] = 3221225472;
  v13[2] = __81__MOContextAnnotationUtilities_predicateWithStartDate_endDate_distanceThreshold___block_invoke;
  v13[3] = &unk_1002AEE68;
  v14 = v9;
  v15 = a5;
  v10 = v9;
  v11 = (void *)objc_claimAutoreleasedReturnValue(+[NSPredicate predicateWithBlock:](NSPredicate, "predicateWithBlock:", v13));

  return v11;
}

BOOL __81__MOContextAnnotationUtilities_predicateWithStartDate_endDate_distanceThreshold___block_invoke(uint64_t a1, void *a2)
{
  id v3;
  id v4;
  void *v5;
  void *v6;
  id v7;
  void *v8;
  double v9;
  double v10;
  double v11;
  double v12;
  double v13;
  double v14;
  double v15;
  double v16;
  _BOOL8 v17;

  v3 = a2;
  v4 = objc_alloc((Class)NSDateInterval);
  v5 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v3, "startDate"));
  v6 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v3, "endDate"));

  v7 = objc_msgSend(v4, "initWithStartDate:endDate:", v5, v6);
  v8 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(*(id *)(a1 + 32), "intersectionWithDateInterval:", v7));
  objc_msgSend(v8, "duration");
  v10 = v9;
  objc_msgSend(*(id *)(a1 + 32), "duration");
  v12 = v11;
  objc_msgSend(*(id *)(a1 + 32), "duration");
  v14 = v13;
  objc_msgSend(v7, "duration");
  if (v14 > v15)
  {
    objc_msgSend(v7, "duration");
    v12 = v16;
  }
  v17 = v12 <= 0.0 || v10 / v12 >= *(double *)(a1 + 40);

  return v17;
}

+ (id)predicateOfEventsWithPlaySessions
{
  return +[NSPredicate predicateWithFormat:](NSPredicate, "predicateWithFormat:", CFSTR("%K = %lu"), CFSTR("category"), 6);
}

+ (id)predicateOfEventsWithPlaySessionsWithStartDate:(id)a3 endData:(id)a4
{
  return +[MOContextAnnotationUtilities predicateOfEventsWithPlaySessionsWithStartDate:endData:distanceThreshold:](MOContextAnnotationUtilities, "predicateOfEventsWithPlaySessionsWithStartDate:endData:distanceThreshold:", a3, a4, 0.5);
}

+ (id)predicateOfEventsWithPlaySessionsWithStartDate:(id)a3 endData:(id)a4 distanceThreshold:(double)a5
{
  id v7;
  id v8;
  void *v9;
  _QWORD v11[4];
  id v12;
  id v13;
  double v14;

  v11[0] = _NSConcreteStackBlock;
  v11[1] = 3221225472;
  v11[2] = __105__MOContextAnnotationUtilities_predicateOfEventsWithPlaySessionsWithStartDate_endData_distanceThreshold___block_invoke;
  v11[3] = &unk_1002AEE90;
  v12 = a3;
  v13 = a4;
  v14 = a5;
  v7 = v13;
  v8 = v12;
  v9 = (void *)objc_claimAutoreleasedReturnValue(+[NSPredicate predicateWithBlock:](NSPredicate, "predicateWithBlock:", v11));

  return v9;
}

BOOL __105__MOContextAnnotationUtilities_predicateOfEventsWithPlaySessionsWithStartDate_endData_distanceThreshold___block_invoke(uint64_t a1, void *a2)
{
  id v3;
  void *v4;
  void *v5;
  void *v6;
  id v7;
  _BOOL8 v8;

  v3 = a2;
  v8 = 0;
  if (objc_msgSend(v3, "category") == (id)6)
  {
    v4 = (void *)objc_claimAutoreleasedReturnValue(+[MOContextAnnotationUtilities predicateOfMediaPlaySessionsWithStartDate:endDate:distanceThreshold:](MOContextAnnotationUtilities, "predicateOfMediaPlaySessionsWithStartDate:endDate:distanceThreshold:", *(_QWORD *)(a1 + 32), *(_QWORD *)(a1 + 40), *(double *)(a1 + 48)));
    v5 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v3, "mediaPlaySessions"));
    v6 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v5, "filteredArrayUsingPredicate:", v4));

    v7 = objc_msgSend(v6, "count");
    if (v7)
      v8 = 1;
  }

  return v8;
}

+ (id)predicateOfSocialContextEventWithStartDate:(id)a3 endData:(id)a4
{
  id v5;
  id v6;
  void *v7;
  void *v8;
  void *v9;
  void *v10;
  _QWORD v12[2];

  v5 = a4;
  v6 = a3;
  v7 = (void *)objc_claimAutoreleasedReturnValue(+[NSPredicate predicateWithFormat:](NSPredicate, "predicateWithFormat:", CFSTR("%K IN %@"), CFSTR("category"), &off_1002DC638));
  v8 = (void *)objc_claimAutoreleasedReturnValue(+[MOContextAnnotationUtilities predicateWithStartDate:endDate:](MOContextAnnotationUtilities, "predicateWithStartDate:endDate:", v6, v5));

  v12[0] = v7;
  v12[1] = v8;
  v9 = (void *)objc_claimAutoreleasedReturnValue(+[NSArray arrayWithObjects:count:](NSArray, "arrayWithObjects:count:", v12, 2));
  v10 = (void *)objc_claimAutoreleasedReturnValue(+[NSCompoundPredicate andPredicateWithSubpredicates:](NSCompoundPredicate, "andPredicateWithSubpredicates:", v9));

  return v10;
}

+ (id)predicateOfEmotionLogsWithStartDate:(id)a3 endDate:(id)a4
{
  id v5;
  id v6;
  void *v7;
  void *v8;
  void *v9;
  void *v10;
  void *v11;
  _QWORD v13[3];

  v5 = a4;
  v6 = a3;
  v7 = (void *)objc_claimAutoreleasedReturnValue(+[NSPredicate predicateWithFormat:](NSPredicate, "predicateWithFormat:", CFSTR("%K = %lu"), CFSTR("category"), 24));
  v8 = (void *)objc_claimAutoreleasedReturnValue(+[NSPredicate predicateWithFormat:](NSPredicate, "predicateWithFormat:", CFSTR("stateOfMindEvent.reflectiveInterval = %d"), 1));
  v9 = (void *)objc_claimAutoreleasedReturnValue(+[MOContextAnnotationUtilities predicateWithStartDate:endDate:](MOContextAnnotationUtilities, "predicateWithStartDate:endDate:", v6, v5));

  v13[0] = v7;
  v13[1] = v8;
  v13[2] = v9;
  v10 = (void *)objc_claimAutoreleasedReturnValue(+[NSArray arrayWithObjects:count:](NSArray, "arrayWithObjects:count:", v13, 3));
  v11 = (void *)objc_claimAutoreleasedReturnValue(+[NSCompoundPredicate andPredicateWithSubpredicates:](NSCompoundPredicate, "andPredicateWithSubpredicates:", v10));

  return v11;
}

+ (id)predicateOfMediaPlaySessionsWithStartDate:(id)a3 endDate:(id)a4 distanceThreshold:(double)a5
{
  id v7;
  id v8;
  id v9;
  id v10;
  void *v11;
  _QWORD v13[4];
  id v14;
  double v15;

  v7 = a4;
  v8 = a3;
  v9 = objc_msgSend(objc_alloc((Class)NSDateInterval), "initWithStartDate:endDate:", v8, v7);

  v13[0] = _NSConcreteStackBlock;
  v13[1] = 3221225472;
  v13[2] = __100__MOContextAnnotationUtilities_predicateOfMediaPlaySessionsWithStartDate_endDate_distanceThreshold___block_invoke;
  v13[3] = &unk_1002AEEB8;
  v14 = v9;
  v15 = a5;
  v10 = v9;
  v11 = (void *)objc_claimAutoreleasedReturnValue(+[NSPredicate predicateWithBlock:](NSPredicate, "predicateWithBlock:", v13));

  return v11;
}

uint64_t __100__MOContextAnnotationUtilities_predicateOfMediaPlaySessionsWithStartDate_endDate_distanceThreshold___block_invoke(uint64_t a1, void *a2)
{
  id v3;
  id v4;
  void *v5;
  void *v6;
  id v7;
  void *v8;
  double v9;
  double v10;
  double v11;
  double v12;
  double v13;
  double v14;
  double v15;
  double v16;
  double v17;
  id os_log;
  NSObject *v19;
  uint64_t v20;
  uint64_t v22;
  int v23;
  double v24;
  __int16 v25;
  uint64_t v26;
  __int16 v27;
  id v28;
  __int16 v29;
  id v30;

  v3 = a2;
  v4 = objc_alloc((Class)NSDateInterval);
  v5 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v3, "startDate"));
  v6 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v3, "endDate"));
  v7 = objc_msgSend(v4, "initWithStartDate:endDate:", v5, v6);

  v8 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(*(id *)(a1 + 32), "intersectionWithDateInterval:", v7));
  objc_msgSend(v8, "duration");
  v10 = v9;
  objc_msgSend(*(id *)(a1 + 32), "duration");
  v12 = v11;
  objc_msgSend(*(id *)(a1 + 32), "duration");
  v14 = v13;
  objc_msgSend(v7, "duration");
  if (v14 > v15)
  {
    objc_msgSend(v7, "duration");
    v12 = v16;
  }
  if (v12 <= 0.0)
    goto LABEL_7;
  v17 = v10 / v12;
  os_log = _mo_log_facility_get_os_log(&MOLogFacilityEventBundleManager);
  v19 = objc_claimAutoreleasedReturnValue(os_log);
  if (os_log_type_enabled(v19, OS_LOG_TYPE_DEBUG))
  {
    v22 = *(_QWORD *)(a1 + 32);
    v23 = 134218754;
    v24 = v17;
    v25 = 2112;
    v26 = v22;
    v27 = 2112;
    v28 = v7;
    v29 = 2112;
    v30 = v3;
    _os_log_debug_impl((void *)&_mh_execute_header, v19, OS_LOG_TYPE_DEBUG, "Jcard index, %f, baseEventInterval, %@, contextEventInterval, %@, contextEvent, %@", (uint8_t *)&v23, 0x2Au);
  }

  if (v17 > *(double *)(a1 + 40))
    v20 = 1;
  else
LABEL_7:
    v20 = 0;

  return v20;
}

+ (void)addPhotoResources:(id)a3 universe:(id)a4 handler:(id)a5
{
  id v7;
  _QWORD v8[4];
  id v9;

  v8[0] = _NSConcreteStackBlock;
  v8[1] = 3221225472;
  v8[2] = __67__MOContextAnnotationUtilities_addPhotoResources_universe_handler___block_invoke;
  v8[3] = &unk_1002AEEE0;
  v9 = a5;
  v7 = v9;
  +[MOContextAnnotationUtilities addPhotoResourcesWithDateArray:universe:handler:](MOContextAnnotationUtilities, "addPhotoResourcesWithDateArray:universe:handler:", a3, a4, v8);

}

uint64_t __67__MOContextAnnotationUtilities_addPhotoResources_universe_handler___block_invoke(uint64_t a1)
{
  return (*(uint64_t (**)(void))(*(_QWORD *)(a1 + 32) + 16))();
}

+ (void)addPhotoResourcesWithDateArray:(id)a3 universe:(id)a4 handler:(id)a5
{
  id os_log;
  NSObject *v8;
  uint64_t v9;
  objc_class *v10;
  NSString *v11;
  void *v12;
  void *v13;
  id v14;
  uint64_t v15;
  void *i;
  NSMutableArray *v17;
  void *v18;
  void *v19;
  void *v20;
  void *v21;
  id v22;
  id v23;
  uint64_t v24;
  void *j;
  void *v26;
  void *v27;
  void *v28;
  BOOL v29;
  void *v30;
  void *v31;
  void *v32;
  void *v33;
  void *v34;
  void *v35;
  id v36;
  void *k;
  void *v38;
  void *v39;
  void *v40;
  BOOL v41;
  void *v42;
  id v43;
  id v44;
  uint64_t v45;
  void *m;
  void *v47;
  id v48;
  double v49;
  double v50;
  double v51;
  double v52;
  double v53;
  double v54;
  void *v55;
  id v56;
  void *v57;
  void *v58;
  BOOL v59;
  double v60;
  double v61;
  void *v62;
  double v63;
  double v64;
  void *v65;
  void *v66;
  double v67;
  double v68;
  void *v69;
  void *v70;
  void *v71;
  id v72;
  NSObject *v73;
  id v74;
  _BOOL8 v75;
  void *v76;
  void *v77;
  void *v78;
  id v79;
  NSObject *v80;
  id v81;
  NSObject *v82;
  id v83;
  uint64_t v84;
  id v85;
  uint64_t v86;
  uint64_t v87;
  id v88;
  NSObject *v89;
  void (**v90)(id, id, uint64_t, id, uint64_t, uint64_t, id);
  id v91;
  id v92;
  id v93;
  void *v94;
  void *v95;
  void *v96;
  void *v97;
  void *v98;
  id v99;
  id v100;
  id obj;
  void *v102;
  void *v103;
  void *v104;
  uint64_t v105;
  id v106;
  _QWORD v107[4];
  id v108;
  id v109;
  NSObject *v110;
  uint8_t *v111;
  uint64_t *v112;
  uint64_t *v113;
  uint64_t *v114;
  uint64_t *v115;
  uint64_t *v116;
  __int128 v117;
  __int128 v118;
  __int128 v119;
  __int128 v120;
  __int128 v121;
  __int128 v122;
  __int128 v123;
  __int128 v124;
  __int128 v125;
  __int128 v126;
  __int128 v127;
  __int128 v128;
  uint64_t v129;
  uint64_t *v130;
  uint64_t v131;
  uint64_t (*v132)(uint64_t, uint64_t);
  void (*v133)(uint64_t);
  NSMutableArray *v134;
  uint64_t v135;
  uint64_t *v136;
  uint64_t v137;
  uint64_t (*v138)(uint64_t, uint64_t);
  void (*v139)(uint64_t);
  id v140;
  uint64_t v141;
  uint64_t *v142;
  uint64_t v143;
  uint64_t (*v144)(uint64_t, uint64_t);
  void (*v145)(uint64_t);
  id v146;
  __int128 v147;
  __int128 v148;
  __int128 v149;
  __int128 v150;
  uint64_t v151;
  uint64_t *v152;
  uint64_t v153;
  uint64_t (*v154)(uint64_t, uint64_t);
  void (*v155)(uint64_t);
  NSMutableArray *v156;
  uint64_t v157;
  uint64_t *v158;
  uint64_t v159;
  uint64_t v160;
  uint8_t buf[8];
  uint8_t *v162;
  uint64_t v163;
  uint64_t (*v164)(uint64_t, uint64_t);
  void (*v165)(uint64_t);
  NSMutableArray *v166;
  uint8_t v167[4];
  id v168;
  _BYTE v169[128];
  _BYTE v170[128];
  _BYTE v171[128];
  _BYTE v172[128];

  v99 = a3;
  v93 = a4;
  v90 = (void (**)(id, id, uint64_t, id, uint64_t, uint64_t, id))a5;
  os_log = _mo_log_facility_get_os_log(&MOLogFacilityEventBundleManager);
  v8 = objc_claimAutoreleasedReturnValue(os_log);
  if (os_log_type_enabled(v8, OS_LOG_TYPE_INFO))
  {
    *(_WORD *)buf = 0;
    _os_log_impl((void *)&_mh_execute_header, v8, OS_LOG_TYPE_INFO, "addPhotoResources", buf, 2u);
  }

  v10 = (objc_class *)objc_opt_class(MOPhotoManager, v9);
  v11 = NSStringFromClass(v10);
  v12 = (void *)objc_claimAutoreleasedReturnValue(v11);
  v94 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v93, "getService:", v12));

  *(_QWORD *)buf = 0;
  v162 = buf;
  v163 = 0x3032000000;
  v164 = __Block_byref_object_copy__7;
  v165 = __Block_byref_object_dispose__7;
  v166 = objc_opt_new(NSMutableArray);
  v157 = 0;
  v158 = &v157;
  v159 = 0x2020000000;
  v160 = 0;
  v151 = 0;
  v152 = &v151;
  v153 = 0x3032000000;
  v154 = __Block_byref_object_copy__7;
  v155 = __Block_byref_object_dispose__7;
  v156 = objc_opt_new(NSMutableArray);
  v147 = 0u;
  v148 = 0u;
  v149 = 0u;
  v150 = 0u;
  v13 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v99, "resources"));
  v14 = objc_msgSend(v13, "countByEnumeratingWithState:objects:count:", &v147, v172, 16);
  if (v14)
  {
    v15 = *(_QWORD *)v148;
    do
    {
      for (i = 0; i != v14; i = (char *)i + 1)
      {
        if (*(_QWORD *)v148 != v15)
          objc_enumerationMutation(v13);
        objc_msgSend(*((id *)v162 + 5), "addObject:", *(_QWORD *)(*((_QWORD *)&v147 + 1) + 8 * (_QWORD)i));
      }
      v14 = objc_msgSend(v13, "countByEnumeratingWithState:objects:count:", &v147, v172, 16);
    }
    while (v14);
  }

  v141 = 0;
  v142 = &v141;
  v143 = 0x3032000000;
  v144 = __Block_byref_object_copy__7;
  v145 = __Block_byref_object_dispose__7;
  v146 = (id)objc_claimAutoreleasedReturnValue(objc_msgSend(v99, "startDate"));
  v135 = 0;
  v136 = &v135;
  v137 = 0x3032000000;
  v138 = __Block_byref_object_copy__7;
  v139 = __Block_byref_object_dispose__7;
  v140 = (id)objc_claimAutoreleasedReturnValue(objc_msgSend(v99, "endDate"));
  v129 = 0;
  v130 = &v129;
  v131 = 0x3032000000;
  v132 = __Block_byref_object_copy__7;
  v133 = __Block_byref_object_dispose__7;
  v134 = objc_opt_new(NSMutableArray);
  v89 = dispatch_group_create();
  dispatch_group_enter(v89);
  v17 = objc_opt_new(NSMutableArray);
  v98 = (void *)objc_claimAutoreleasedReturnValue(+[NSMutableArray array](NSMutableArray, "array"));
  v92 = objc_msgSend(objc_alloc((Class)NSArray), "initWithObjects:", &off_1002D8378, 0);
  v18 = (void *)objc_claimAutoreleasedReturnValue(+[NSPredicate predicateWithFormat:](NSPredicate, "predicateWithFormat:", CFSTR("category IN %@ "), v92));
  objc_msgSend(v98, "addObject:", v18);

  v19 = (void *)objc_claimAutoreleasedReturnValue(+[NSPredicate predicateWithFormat:](NSPredicate, "predicateWithFormat:", CFSTR("provider != %lu"), 5));
  objc_msgSend(v98, "addObject:", v19);

  v20 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v99, "events"));
  v21 = (void *)objc_claimAutoreleasedReturnValue(+[NSCompoundPredicate andPredicateWithSubpredicates:](NSCompoundPredicate, "andPredicateWithSubpredicates:", v98));
  v96 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v20, "filteredArrayUsingPredicate:", v21));

  if (objc_msgSend(v96, "count"))
  {
    v127 = 0u;
    v128 = 0u;
    v125 = 0u;
    v126 = 0u;
    v22 = v96;
    v23 = objc_msgSend(v22, "countByEnumeratingWithState:objects:count:", &v125, v171, 16);
    if (v23)
    {
      v24 = *(_QWORD *)v126;
      do
      {
        for (j = 0; j != v23; j = (char *)j + 1)
        {
          if (*(_QWORD *)v126 != v24)
            objc_enumerationMutation(v22);
          v26 = *(void **)(*((_QWORD *)&v125 + 1) + 8 * (_QWORD)j);
          v27 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v26, "routineEvent"));
          v28 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v27, "location"));
          v29 = v28 == 0;

          if (!v29)
          {
            v30 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v26, "routineEvent"));
            v31 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v30, "location"));
            -[NSMutableArray addObject:](v17, "addObject:", v31);

          }
        }
        v23 = objc_msgSend(v22, "countByEnumeratingWithState:objects:count:", &v125, v171, 16);
      }
      while (v23);
    }

  }
  v97 = (void *)objc_claimAutoreleasedReturnValue(+[NSMutableArray array](NSMutableArray, "array"));
  v91 = objc_msgSend(objc_alloc((Class)NSArray), "initWithObjects:", &off_1002D8390, &off_1002D8420, 0);
  v32 = (void *)objc_claimAutoreleasedReturnValue(+[NSPredicate predicateWithFormat:](NSPredicate, "predicateWithFormat:", CFSTR("category IN %@ "), v91));
  objc_msgSend(v97, "addObject:", v32);

  v33 = (void *)objc_claimAutoreleasedReturnValue(+[NSPredicate predicateWithFormat:](NSPredicate, "predicateWithFormat:", CFSTR("provider != %lu"), 5));
  objc_msgSend(v97, "addObject:", v33);

  v34 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v99, "events"));
  v35 = (void *)objc_claimAutoreleasedReturnValue(+[NSCompoundPredicate andPredicateWithSubpredicates:](NSCompoundPredicate, "andPredicateWithSubpredicates:", v97));
  v95 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v34, "filteredArrayUsingPredicate:", v35));

  if (objc_msgSend(v95, "count"))
  {
    v123 = 0u;
    v124 = 0u;
    v121 = 0u;
    v122 = 0u;
    obj = v95;
    v36 = objc_msgSend(obj, "countByEnumeratingWithState:objects:count:", &v121, v170, 16);
    if (!v36)
      goto LABEL_41;
    v105 = *(_QWORD *)v122;
    while (1)
    {
      v106 = v36;
      for (k = 0; k != v106; k = (char *)k + 1)
      {
        if (*(_QWORD *)v122 != v105)
          objc_enumerationMutation(obj);
        v38 = *(void **)(*((_QWORD *)&v121 + 1) + 8 * (_QWORD)k);
        v39 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v38, "workoutEvent"));
        v40 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v39, "workoutLocationRoute"));
        v41 = objc_msgSend(v40, "count") == 0;

        if (v41)
        {
          v57 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v38, "workoutEvent"));
          v58 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v57, "workoutLocationStart"));
          v59 = v58 == 0;

          if (v59)
            continue;
          v100 = objc_alloc((Class)RTLocation);
          v104 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v38, "workoutEvent"));
          v103 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v104, "workoutLocationStart"));
          objc_msgSend(v103, "coordinate");
          v61 = v60;
          v102 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v38, "workoutEvent"));
          v62 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v102, "workoutLocationStart"));
          objc_msgSend(v62, "coordinate");
          v64 = v63;
          v65 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v38, "workoutEvent"));
          v66 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v65, "workoutLocationStart"));
          objc_msgSend(v66, "horizontalAccuracy");
          v68 = v67;
          v69 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v38, "workoutEvent"));
          v70 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v69, "workoutLocationStart"));
          v71 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v70, "timestamp"));
          v43 = objc_msgSend(v100, "initWithLatitude:longitude:horizontalUncertainty:date:", v71, v61, v64, v68);

          -[NSMutableArray addObject:](v17, "addObject:", v43);
        }
        else
        {
          v119 = 0u;
          v120 = 0u;
          v117 = 0u;
          v118 = 0u;
          v42 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v38, "workoutEvent"));
          v43 = (id)objc_claimAutoreleasedReturnValue(objc_msgSend(v42, "workoutLocationRoute"));

          v44 = objc_msgSend(v43, "countByEnumeratingWithState:objects:count:", &v117, v169, 16);
          if (v44)
          {
            v45 = *(_QWORD *)v118;
            do
            {
              for (m = 0; m != v44; m = (char *)m + 1)
              {
                if (*(_QWORD *)v118 != v45)
                  objc_enumerationMutation(v43);
                v47 = *(void **)(*((_QWORD *)&v117 + 1) + 8 * (_QWORD)m);
                v48 = objc_alloc((Class)RTLocation);
                objc_msgSend(v47, "coordinate");
                v50 = v49;
                objc_msgSend(v47, "coordinate");
                v52 = v51;
                objc_msgSend(v47, "horizontalAccuracy");
                v54 = v53;
                v55 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v47, "timestamp"));
                v56 = objc_msgSend(v48, "initWithLatitude:longitude:horizontalUncertainty:date:", v55, v50, v52, v54);

                -[NSMutableArray addObject:](v17, "addObject:", v56);
              }
              v44 = objc_msgSend(v43, "countByEnumeratingWithState:objects:count:", &v117, v169, 16);
            }
            while (v44);
          }
        }

      }
      v36 = objc_msgSend(obj, "countByEnumeratingWithState:objects:count:", &v121, v170, 16);
      if (!v36)
      {
LABEL_41:

        break;
      }
    }
  }
  v72 = _mo_log_facility_get_os_log(&MOLogFacilityPhoto);
  v73 = objc_claimAutoreleasedReturnValue(v72);
  if (os_log_type_enabled(v73, OS_LOG_TYPE_INFO))
  {
    v74 = -[NSMutableArray count](v17, "count");
    *(_DWORD *)v167 = 134217984;
    v168 = v74;
    _os_log_impl((void *)&_mh_execute_header, v73, OS_LOG_TYPE_INFO, "final locations count, %lu", v167, 0xCu);
  }

  v75 = objc_msgSend(v99, "bundleSubType") == (id)106 || objc_msgSend(v99, "bundleSuperType") == (id)5;
  if (v94)
  {
    v76 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v99, "startDate"));
    v77 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v99, "endDate"));
    v78 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v99, "bundleIdentifier"));
    v79 = objc_msgSend(v99, "interfaceType");
    v107[0] = _NSConcreteStackBlock;
    v107[1] = 3221225472;
    v107[2] = __80__MOContextAnnotationUtilities_addPhotoResourcesWithDateArray_universe_handler___block_invoke;
    v107[3] = &unk_1002AEF08;
    v108 = v99;
    v109 = v94;
    v111 = buf;
    v112 = &v129;
    v113 = &v157;
    v114 = &v151;
    v115 = &v141;
    v116 = &v135;
    v80 = v89;
    v110 = v80;
    objc_msgSend(v109, "fetchPhotosBetweenStartDate:EndDate:SuggestionID:BundleInterfaceType:Locations:IsLocationCheckMandatory:handler:", v76, v77, v78, v79, v17, v75, v107);

    if ((MODispatchGroupWait(v80, 0xFFFFFFFFFFFFFFFFLL, CFSTR("ContextAnnotation")) & 1) == 0)
    {
      v81 = _mo_log_facility_get_os_log(&MOLogFacilityEventBundleManager);
      v82 = objc_claimAutoreleasedReturnValue(v81);
      if (os_log_type_enabled(v82, OS_LOG_TYPE_FAULT))
        +[MOContextAnnotationUtilities addPhotoResourcesWithDateArray:universe:handler:].cold.1();

    }
  }
  v83 = objc_msgSend(*((id *)v162 + 5), "copy");
  v84 = v158[3];
  v85 = objc_msgSend((id)v152[5], "copy");
  v86 = v142[5];
  v87 = v136[5];
  v88 = objc_msgSend((id)v130[5], "copy");
  v90[2](v90, v83, v84, v85, v86, v87, v88);

  _Block_object_dispose(&v129, 8);
  _Block_object_dispose(&v135, 8);

  _Block_object_dispose(&v141, 8);
  _Block_object_dispose(&v151, 8);

  _Block_object_dispose(&v157, 8);
  _Block_object_dispose(buf, 8);

}

void __80__MOContextAnnotationUtilities_addPhotoResourcesWithDateArray_universe_handler___block_invoke(uint64_t a1, void *a2, void *a3, uint64_t a4, void *a5, void *a6)
{
  id v11;
  id v12;
  id v13;
  id v14;
  uint64_t v15;
  void *v16;
  void *i;
  void *v18;
  void *v19;
  void *v20;
  void *v21;
  void *v22;
  void *v23;
  id os_log;
  NSObject *v25;
  void *v26;
  void *v27;
  id v28;
  NSObject *v29;
  void *v30;
  MOResource *v31;
  void *v32;
  void *v33;
  void *v34;
  void *v35;
  id v36;
  NSObject *v37;
  void *v38;
  unsigned int v39;
  uint64_t v40;
  void *v41;
  unsigned int v42;
  uint64_t v43;
  void *v44;
  void *v45;
  void *v46;
  id v47;
  NSObject *v48;
  void *v49;
  unint64_t v50;
  _QWORD *v51;
  void *v52;
  void *v53;
  void *v54;
  void *v55;
  MOPhotoTrait *v56;
  void *v57;
  MOPhotoTrait *v58;
  id v59;
  NSObject *v60;
  _QWORD *v61;
  id v62;
  void *v63;
  uint64_t v64;
  id v65;
  void *v66;
  void *v67;
  id obj;
  uint64_t v69;
  void *v70;
  id v71;
  id v72;
  void *v73;
  void *v74;
  __int128 v75;
  __int128 v76;
  __int128 v77;
  __int128 v78;
  uint8_t buf[4];
  void *v80;
  _QWORD v81[3];
  _QWORD v82[3];
  _BYTE v83[128];

  v11 = a2;
  v12 = a3;
  v13 = a5;
  v14 = a6;
  v15 = objc_claimAutoreleasedReturnValue(+[NSDate distantFuture](NSDate, "distantFuture"));
  v16 = (void *)objc_claimAutoreleasedReturnValue(+[NSDate distantPast](NSDate, "distantPast"));
  v70 = v11;
  v66 = v14;
  v67 = v12;
  v74 = (void *)v15;
  if (v11 && !v14 && objc_msgSend(v11, "count"))
  {
    v64 = a4;
    v65 = v13;
    v72 = objc_alloc_init((Class)NSMutableSet);
    v75 = 0u;
    v76 = 0u;
    v77 = 0u;
    v78 = 0u;
    obj = v12;
    v71 = objc_msgSend(obj, "countByEnumeratingWithState:objects:count:", &v75, v83, 16);
    if (v71)
    {
      v69 = *(_QWORD *)v76;
      do
      {
        for (i = 0; i != v71; i = (char *)i + 1)
        {
          if (*(_QWORD *)v76 != v69)
            objc_enumerationMutation(obj);
          v18 = *(void **)(*((_QWORD *)&v75 + 1) + 8 * (_QWORD)i);
          v81[0] = CFSTR("MOPhotoResourceTypeKey");
          v19 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v18, "resourceType"));
          v82[0] = v19;
          v81[1] = CFSTR("MOPhotoResourceLocalIdentifier");
          v20 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v18, "localIdentifier"));
          v82[1] = v20;
          v81[2] = CFSTR("MOPhotoResourceLocalTime");
          v21 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v18, "creationDate"));
          objc_msgSend(v21, "timeIntervalSinceReferenceDate");
          v22 = (void *)objc_claimAutoreleasedReturnValue(+[NSNumber numberWithDouble:](NSNumber, "numberWithDouble:"));
          v82[2] = v22;
          v23 = (void *)objc_claimAutoreleasedReturnValue(+[NSDictionary dictionaryWithObjects:forKeys:count:](NSDictionary, "dictionaryWithObjects:forKeys:count:", v82, v81, 3));

          os_log = _mo_log_facility_get_os_log(&MOLogFacilityEventBundleManager);
          v25 = objc_claimAutoreleasedReturnValue(os_log);
          if (os_log_type_enabled(v25, OS_LOG_TYPE_INFO))
          {
            v26 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(*(id *)(a1 + 32), "suggestionID"));
            *(_DWORD *)buf = 138412290;
            v80 = v26;
            _os_log_impl((void *)&_mh_execute_header, v25, OS_LOG_TYPE_INFO, "Fetching persons in the current Asset for the bundle SuggestionId : %@", buf, 0xCu);

          }
          v27 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(*(id *)(a1 + 40), "getPersonsInAsset:", v18));
          objc_msgSend(v72, "unionSet:", v27);
          v28 = _mo_log_facility_get_os_log(&MOLogFacilityEventBundleManager);
          v29 = objc_claimAutoreleasedReturnValue(v28);
          if (os_log_type_enabled(v29, OS_LOG_TYPE_INFO))
          {
            v30 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v72, "allObjects"));
            *(_DWORD *)buf = 138412290;
            v80 = v30;
            _os_log_impl((void *)&_mh_execute_header, v29, OS_LOG_TYPE_INFO, "After Fetching persons in the current Asset for the bundle mopersons : %@", buf, 0xCu);

          }
          v31 = -[MOResource initWithName:type:dict:value:]([MOResource alloc], "initWithName:type:dict:value:", CFSTR("Photo"), 2, v23, 0.0);
          v32 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v70, "objectForKey:", v18));
          -[MOResource setPhotoCurationScore:](v31, "setPhotoCurationScore:", v32);

          v33 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v18, "mediaAnalysisProperties"));
          -[MOResource setPhotoFaceCount:](v31, "setPhotoFaceCount:", objc_msgSend(v33, "faceCount"));

          objc_msgSend(v18, "overallAestheticScore");
          -[MOResource setPhotoOverallAestheticScore:](v31, "setPhotoOverallAestheticScore:");
          -[MOResource setPhotoAssetMediaType:](v31, "setPhotoAssetMediaType:", objc_msgSend(v18, "mediaType"));
          v34 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v18, "creationDate"));
          -[MOResource setPhotoCreationDate:](v31, "setPhotoCreationDate:", v34);

          v35 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v18, "localIdentifier"));
          -[MOResource setAssets:](v31, "setAssets:", v35);

          v36 = _mo_log_facility_get_os_log(&MOLogFacilityEventBundleManager);
          v37 = objc_claimAutoreleasedReturnValue(v36);
          if (os_log_type_enabled(v37, OS_LOG_TYPE_INFO))
          {
            *(_DWORD *)buf = 138412290;
            v80 = v18;
            _os_log_impl((void *)&_mh_execute_header, v37, OS_LOG_TYPE_INFO, "creating new MOResource with identifier,%@", buf, 0xCu);
          }

          objc_msgSend(*(id *)(*(_QWORD *)(*(_QWORD *)(a1 + 56) + 8) + 40), "addObject:", v31);
          v38 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v18, "creationDate"));
          v39 = objc_msgSend(v38, "isBeforeDate:", v74);

          if (v39)
          {
            v40 = objc_claimAutoreleasedReturnValue(objc_msgSend(v18, "creationDate"));

            v74 = (void *)v40;
          }
          v41 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v18, "creationDate"));
          v42 = objc_msgSend(v41, "isAfterDate:", v16);

          if (v42)
          {
            v43 = objc_claimAutoreleasedReturnValue(objc_msgSend(v18, "creationDate"));

            v16 = (void *)v43;
          }
          v44 = *(void **)(*(_QWORD *)(*(_QWORD *)(a1 + 64) + 8) + 40);
          v45 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v18, "creationDate"));
          objc_msgSend(v44, "addObject:", v45);

        }
        v71 = objc_msgSend(obj, "countByEnumeratingWithState:objects:count:", &v75, v83, 16);
      }
      while (v71);
    }

    v46 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v72, "allObjects"));
    objc_msgSend(*(id *)(a1 + 32), "setPersons:", v46);

    *(_QWORD *)(*(_QWORD *)(*(_QWORD *)(a1 + 72) + 8) + 24) = v64;
    v47 = _mo_log_facility_get_os_log(&MOLogFacilityEventBundleManager);
    v48 = objc_claimAutoreleasedReturnValue(v47);
    if (os_log_type_enabled(v48, OS_LOG_TYPE_INFO))
    {
      v49 = *(void **)(*(_QWORD *)(*(_QWORD *)(a1 + 72) + 8) + 24);
      *(_DWORD *)buf = 134217984;
      v80 = v49;
      _os_log_impl((void *)&_mh_execute_header, v48, OS_LOG_TYPE_INFO, "addPhotoResources,photoSource,%lu", buf, 0xCu);
    }

    v13 = v65;
  }
  if (v13 && objc_msgSend(v13, "count"))
  {
    v50 = 0;
    v51 = &kPHGraphPersonalTraitName;
    v73 = v16;
    do
    {
      v52 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v13, "objectAtIndexedSubscript:", v50));
      v53 = v52;
      if (v52)
      {
        v54 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v52, "objectForKey:", *v51));
        v55 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v53, "objectForKey:", kPHGraphPersonalTraitRelevantAssetUUIDs));
        v56 = [MOPhotoTrait alloc];
        v57 = (void *)objc_claimAutoreleasedReturnValue(+[NSUUID UUID](NSUUID, "UUID"));
        v58 = -[MOPhotoTrait initWithIdentifier:name:relevantAssetUUIDs:](v56, "initWithIdentifier:name:relevantAssetUUIDs:", v57, v54, v55);

        v59 = _mo_log_facility_get_os_log(&MOLogFacilityEventBundleManager);
        v60 = objc_claimAutoreleasedReturnValue(v59);
        if (os_log_type_enabled(v60, OS_LOG_TYPE_INFO))
        {
          v61 = v51;
          v62 = v13;
          v63 = (void *)objc_claimAutoreleasedReturnValue(-[MOPhotoTrait description](v58, "description"));
          *(_DWORD *)buf = 138412290;
          v80 = v63;
          _os_log_impl((void *)&_mh_execute_header, v60, OS_LOG_TYPE_INFO, "#traits,creating new MOPhotoTrait,%@", buf, 0xCu);

          v13 = v62;
          v51 = v61;
        }

        objc_msgSend(*(id *)(*(_QWORD *)(*(_QWORD *)(a1 + 80) + 8) + 40), "addObject:", v58);
        v16 = v73;
      }

      ++v50;
    }
    while ((unint64_t)objc_msgSend(v13, "count") > v50);
  }
  if (objc_msgSend(v74, "isOnOrBefore:", v16))
  {
    objc_storeStrong((id *)(*(_QWORD *)(*(_QWORD *)(a1 + 88) + 8) + 40), v74);
    objc_storeStrong((id *)(*(_QWORD *)(*(_QWORD *)(a1 + 96) + 8) + 40), v16);
  }
  dispatch_group_leave(*(dispatch_group_t *)(a1 + 48));

}

+ (id)fetchAssetUsingID:(id)a3 universe:(id)a4
{
  id v5;
  id v6;
  id os_log;
  NSObject *v8;
  uint64_t v9;
  objc_class *v10;
  NSString *v11;
  void *v12;
  NSObject *v13;
  NSObject *v14;
  NSObject *v15;
  id v16;
  id v17;
  void **v19;
  uint64_t v20;
  void (*v21)(uint64_t, void *, uint64_t);
  void *v22;
  NSObject *v23;
  uint8_t *v24;
  uint8_t buf[8];
  uint8_t *v26;
  uint64_t v27;
  uint64_t (*v28)(uint64_t, uint64_t);
  void (*v29)(uint64_t);
  id v30;

  v5 = a3;
  v6 = a4;
  os_log = _mo_log_facility_get_os_log(&MOLogFacilityEventBundleManager);
  v8 = objc_claimAutoreleasedReturnValue(os_log);
  if (os_log_type_enabled(v8, OS_LOG_TYPE_INFO))
  {
    *(_WORD *)buf = 0;
    _os_log_impl((void *)&_mh_execute_header, v8, OS_LOG_TYPE_INFO, "fetchAssetUsingID", buf, 2u);
  }

  if (v5)
  {
    v10 = (objc_class *)objc_opt_class(MOPhotoManager, v9);
    v11 = NSStringFromClass(v10);
    v12 = (void *)objc_claimAutoreleasedReturnValue(v11);
    v13 = objc_claimAutoreleasedReturnValue(objc_msgSend(v6, "getService:", v12));

    *(_QWORD *)buf = 0;
    v26 = buf;
    v27 = 0x3032000000;
    v28 = __Block_byref_object_copy__7;
    v29 = __Block_byref_object_dispose__7;
    v30 = 0;
    v14 = dispatch_group_create();
    dispatch_group_enter(v14);
    v19 = _NSConcreteStackBlock;
    v20 = 3221225472;
    v21 = __59__MOContextAnnotationUtilities_fetchAssetUsingID_universe___block_invoke;
    v22 = &unk_1002AEF30;
    v24 = buf;
    v15 = v14;
    v23 = v15;
    -[NSObject fetchAssetUsingID:handler:](v13, "fetchAssetUsingID:handler:", v5, &v19);
    if ((MODispatchGroupWait(v15, 0xFFFFFFFFFFFFFFFFLL, CFSTR("FetchPhotoAsset")) & 1) != 0)
      v16 = objc_msgSend(*((id *)v26 + 5), "copy", v19, v20, v21, v22);
    else
      v16 = 0;

    _Block_object_dispose(buf, 8);
  }
  else
  {
    v17 = _mo_log_facility_get_os_log(&MOLogFacilityEventBundleManager);
    v13 = objc_claimAutoreleasedReturnValue(v17);
    if (os_log_type_enabled(v13, OS_LOG_TYPE_INFO))
    {
      *(_WORD *)buf = 0;
      _os_log_impl((void *)&_mh_execute_header, v13, OS_LOG_TYPE_INFO, "fetchAssetUsingID, identifier is nil", buf, 2u);
    }
    v16 = 0;
  }

  return v16;
}

void __59__MOContextAnnotationUtilities_fetchAssetUsingID_universe___block_invoke(uint64_t a1, void *a2, uint64_t a3)
{
  id v5;
  uint64_t v6;
  id v7;
  void *v8;
  id v9;

  v5 = a2;
  v6 = *(_QWORD *)(*(_QWORD *)(a1 + 40) + 8);
  v9 = v5;
  if (a3)
    v7 = 0;
  else
    v7 = v5;
  v8 = *(void **)(v6 + 40);
  *(_QWORD *)(v6 + 40) = v7;

  dispatch_group_leave(*(dispatch_group_t *)(a1 + 32));
}

+ (id)baseTimeFromBaseEvents:(id)a3
{
  id v4;
  void *v5;
  void *v6;
  void *v7;
  void *v8;
  double v9;
  void *v10;
  double v11;
  double v12;
  void *v13;
  id os_log;
  NSObject *v15;
  uint64_t v16;
  objc_class *v17;
  NSString *v18;
  void *v19;
  MOTime *v20;
  void *v21;
  void *v22;
  MOTime *v23;
  int v25;
  void *v26;
  __int16 v27;
  void *v28;

  v4 = a3;
  v5 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v4, "firstObject"));
  v6 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v5, "startDate"));

  v7 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v4, "lastObject"));
  v8 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v7, "endDate"));

  objc_msgSend(v8, "timeIntervalSinceDate:", v6);
  v10 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v6, "dateByAddingTimeInterval:", v9 * 0.5));
  objc_msgSend(v10, "timeIntervalSinceReferenceDate");
  v12 = v11;
  v13 = (void *)objc_claimAutoreleasedReturnValue(+[NSCalendar currentCalendar](NSCalendar, "currentCalendar"));
  os_log = _mo_log_facility_get_os_log(&MOLogFacilityEventBundleManager);
  v15 = objc_claimAutoreleasedReturnValue(os_log);
  if (os_log_type_enabled(v15, OS_LOG_TYPE_INFO))
  {
    v17 = (objc_class *)objc_opt_class(a1, v16);
    v18 = NSStringFromClass(v17);
    v19 = (void *)objc_claimAutoreleasedReturnValue(v18);
    v25 = 138412546;
    v26 = v19;
    v27 = 2112;
    v28 = v10;
    _os_log_impl((void *)&_mh_execute_header, v15, OS_LOG_TYPE_INFO, "TimeContext(%@): baseTimeFromBaseEvents, %@", (uint8_t *)&v25, 0x16u);

  }
  if (objc_msgSend(v13, "isDateInWeekend:", v10))
  {
    v20 = [MOTime alloc];
    v21 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v13, "timeZone"));
    v22 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v21, "name"));
    v23 = -[MOTime initWithTimestamp:timeString:timeZone:timeTag:](v20, "initWithTimestamp:timeString:timeZone:timeTag:", CFSTR("Weekend"), v22, 10001, v12);

  }
  else
  {
    v23 = 0;
  }

  return v23;
}

+ (id)timeOfDayPrefixFromBaseEvents:(id)a3
{
  id v3;
  void *v4;
  void *v5;
  void *v6;
  void *v7;
  void *v8;

  v3 = a3;
  v4 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v3, "firstObject"));
  v5 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v4, "startDate"));

  v6 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v3, "lastObject"));
  v7 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v6, "endDate"));

  v8 = (void *)objc_claimAutoreleasedReturnValue(+[MOTime timeOfDayPrefixFromStartDate:endDate:](MOTime, "timeOfDayPrefixFromStartDate:endDate:", v5, v7));
  return v8;
}

+ (id)annotateEventBundle:(id)a3 visitEvents:(id)a4 poiCategoryBlocklist:(id)a5 mediumConfidenceThreshold:(double)a6 highConfidenceThreshold:(double)a7 aoiConfidenceThreshold:(double)a8 universe:(id)a9
{
  id v15;
  id v16;
  id v17;
  id v18;
  NSMutableArray *v19;
  void *v20;
  id os_log;
  NSObject *v22;
  void *v23;
  int v25;
  void *v26;

  v15 = a3;
  v16 = a9;
  v17 = a5;
  v18 = a4;
  v19 = objc_opt_new(NSMutableArray);
  v20 = (void *)objc_claimAutoreleasedReturnValue(+[MOContextAnnotationUtilities placeFromVisitEvents:usedEvents:preferredCategories:poiCategoryBlocklist:mediumConfidenceThreshold:highConfidenceThreshold:aoiConfidenceThreshold:universe:](MOContextAnnotationUtilities, "placeFromVisitEvents:usedEvents:preferredCategories:poiCategoryBlocklist:mediumConfidenceThreshold:highConfidenceThreshold:aoiConfidenceThreshold:universe:", v18, v19, 0, v17, v16, a6, a7, a8));

  if (v20)
  {
    objc_msgSend(v15, "setPlace:", v20);
    os_log = _mo_log_facility_get_os_log(&MOLogFacilityEventBundleManager);
    v22 = objc_claimAutoreleasedReturnValue(os_log);
    if (os_log_type_enabled(v22, OS_LOG_TYPE_INFO))
    {
      v23 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v15, "place"));
      v25 = 138412290;
      v26 = v23;
      _os_log_impl((void *)&_mh_execute_header, v22, OS_LOG_TYPE_INFO, "annotateEventBundle visit, %@", (uint8_t *)&v25, 0xCu);

    }
  }

  return v19;
}

+ (id)placeFromVisitEvents:(id)a3 preferredCategories:(id)a4 poiCategoryBlocklist:(id)a5 mediumConfidenceThreshold:(double)a6 highConfidenceThreshold:(double)a7 aoiConfidenceThreshold:(double)a8 universe:(id)a9
{
  return +[MOContextAnnotationUtilities placeFromVisitEvents:usedEvents:preferredCategories:poiCategoryBlocklist:mediumConfidenceThreshold:highConfidenceThreshold:aoiConfidenceThreshold:universe:](MOContextAnnotationUtilities, "placeFromVisitEvents:usedEvents:preferredCategories:poiCategoryBlocklist:mediumConfidenceThreshold:highConfidenceThreshold:aoiConfidenceThreshold:universe:", a3, 0, 0, a5, a9, a6, a7, a8);
}

+ (id)placeFromVisitEvents:(id)a3 usedEvents:(id)a4 preferredCategories:(id)a5 poiCategoryBlocklist:(id)a6 mediumConfidenceThreshold:(double)a7 highConfidenceThreshold:(double)a8 aoiConfidenceThreshold:(double)a9 universe:(id)a10
{
  id v16;
  id v17;
  id v18;
  id v19;
  void *v20;
  void *v21;
  void *v22;
  void *v23;
  void *v24;
  void *v26;

  v16 = a3;
  v17 = a4;
  v18 = a6;
  v19 = a10;
  if (objc_msgSend(v16, "count"))
  {
    v20 = (void *)objc_claimAutoreleasedReturnValue(+[NSSortDescriptor sortDescriptorWithKey:ascending:](NSSortDescriptor, "sortDescriptorWithKey:ascending:", CFSTR("placeNameConfidence"), 0));
    v26 = v20;
    v21 = (void *)objc_claimAutoreleasedReturnValue(+[NSArray arrayWithObjects:count:](NSArray, "arrayWithObjects:count:", &v26, 1));
    v22 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v16, "sortedArrayUsingDescriptors:", v21));

    v23 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v22, "firstObject"));
    if (objc_msgSend(v23, "category") == (id)1)
    {
      if (v17)
        objc_msgSend(v17, "addObject:", v23);
      v24 = (void *)objc_claimAutoreleasedReturnValue(+[MOContextAnnotationUtilities placeFromVisitEvent:preferredCategories:poiCategoryBlocklist:mediumConfidenceThreshold:highConfidenceThreshold:aoiConfidenceThreshold:universe:](MOContextAnnotationUtilities, "placeFromVisitEvent:preferredCategories:poiCategoryBlocklist:mediumConfidenceThreshold:highConfidenceThreshold:aoiConfidenceThreshold:universe:", v23, 0, v18, v19, a7, a8, a9));
    }
    else
    {
      v24 = 0;
    }

  }
  else
  {
    v24 = 0;
  }

  return v24;
}

+ (unint64_t)prepositionWithPlaceType:(unint64_t)a3 userPlaceType:(unint64_t)a4 mapItemPlaceType:(unint64_t)a5 distanceFromVisitToPlace:(double)a6 snappingThreshold:(double)a7
{
  unint64_t result;
  unint64_t v8;

  if (!(a4 | a3))
    return 0;
  if (a4 - 1 < 0x63)
    return 1;
  result = 3;
  if (a3 - 100 >= 3 && a3 != 2)
  {
    if ((a3 & 0xFFFFFFFFFFFFFFFDLL) == 1)
      return 1;
    if (a3 == 6)
      return 0;
    if (a5 - 1 < 0x14 && ((0xE4FF9u >> (a5 - 1)) & 1) != 0)
    {
      return 3;
    }
    else
    {
      v8 = 4;
      if (a6 <= a7)
        v8 = 1;
      if (a6 >= 0.0)
        return v8;
      else
        return 0;
    }
  }
  return result;
}

+ (id)placeFromVisitEvent:(id)a3 preferredCategories:(id)a4 poiCategoryBlocklist:(id)a5 mediumConfidenceThreshold:(double)a6 highConfidenceThreshold:(double)a7 aoiConfidenceThreshold:(double)a8 universe:(id)a9
{
  id v15;
  id v16;
  id v17;
  id v18;
  uint64_t v19;
  double v20;
  double v21;
  void *v22;
  double v23;
  double v24;
  __CFString *v25;
  uint64_t v26;
  objc_class *v27;
  NSString *v28;
  void *v29;
  void *v30;
  void *v31;
  uint64_t v32;
  id os_log;
  NSObject *v34;
  uint64_t v35;
  void *v36;
  id v37;
  NSObject *v38;
  uint64_t v39;
  void *v40;
  unsigned int v41;
  void *v42;
  void *v43;
  void *v44;
  void *v45;
  MOPlace *v46;
  void *v47;
  id v48;
  id v49;
  void *v50;
  id v51;
  void *v52;
  double v53;
  double v54;
  void *v55;
  void *v56;
  MOPlace *v57;
  void *v58;
  MOPlace *v59;
  void *v60;
  void *v61;
  unsigned int v62;
  void *v63;
  unsigned __int8 v64;
  id v65;
  id v67;
  MOPlace *v68;
  MOPlace *v69;
  void *v70;
  void *v71;
  void *v72;
  MOPlace *v73;
  id v74;
  MOPlace *v75;
  uint64_t v76;
  uint64_t v77;
  void *v78;
  id v79;
  void *v80;
  void *v81;
  void *v82;
  void *v83;
  void *v84;
  id v85;
  NSObject *v86;
  uint64_t v87;
  BOOL v88;
  id v89;
  void *v90;
  void *v91;
  void *v92;
  void *v93;
  void *v94;
  id v95;
  char v96;
  char v97;
  uint64_t v98;
  MOPlace *v99;
  id v100;
  void *v101;
  id v102;
  void *v103;
  double v104;
  double v105;
  void *v106;
  void *v107;
  MOPlace *v108;
  uint64_t v109;
  uint64_t v110;
  id v111;
  void *v112;
  id v113;
  void *v114;
  void *v115;
  objc_class *v116;
  NSString *v117;
  void *v118;
  NSString *v119;
  uint64_t v120;
  void *v121;
  void *v122;
  objc_class *v123;
  NSString *v124;
  NSString *v125;
  void *v126;
  id v127;
  MOPlace *v128;
  id v129;
  id v130;
  void *v131;
  double v132;
  double v133;
  void *v134;
  void *v135;
  uint64_t v136;
  uint64_t v137;
  id v138;
  id v139;
  void *v140;
  id v141;
  void *v142;
  void *v143;
  id v145;
  objc_class *v146;
  NSString *v147;
  NSString *v148;
  void *v149;
  __CFString *v150;
  uint64_t v151;
  id v152;
  void *v153;
  id v154;
  void *v155;
  uint64_t v156;
  SEL aSelectorb;
  char *aSelectora;
  void *v160;
  char *v161;
  void *v162;
  id v163;
  __CFString *v164;
  id v165;
  id v166;
  void *v167;
  __CFString *v168;
  uint8_t buf[4];
  void *v170;
  __int16 v171;
  void *v172;
  __int16 v173;
  __CFString *v174;
  __int16 v175;
  uint64_t v176;
  __int16 v177;
  __CFString *v178;
  __int16 v179;
  char *v180;
  __int16 v181;
  id v182;
  __int16 v183;
  id v184;

  v15 = a3;
  v16 = a4;
  v17 = a5;
  v18 = a9;
  v19 = objc_claimAutoreleasedReturnValue(objc_msgSend(v15, "placeName"));
  objc_msgSend(v15, "placeNameConfidence");
  v21 = v20;
  v22 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v15, "location"));
  +[MOContextAnnotationUtilities distanceFromHomeToLocation:universe:](MOContextAnnotationUtilities, "distanceFromHomeToLocation:universe:", v22, v18);
  v24 = v23;

  v25 = CFSTR("aboveDoorShortAddress");
  v27 = (objc_class *)objc_opt_class(MOConfigurationManager, v26);
  v28 = NSStringFromClass(v27);
  v29 = (void *)objc_claimAutoreleasedReturnValue(v28);
  v30 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v18, "getService:", v29));

  if (v30)
  {
    v31 = (void *)objc_claimAutoreleasedReturnValue(+[NSString stringWithFormat:](NSString, "stringWithFormat:", CFSTR("%@_%@"), CFSTR("addressFormatting"), CFSTR("formatOption")));
    v32 = objc_claimAutoreleasedReturnValue(objc_msgSend(v30, "getStringSettingForKey:withFallback:", v31, v25));

    objc_msgSend(v30, "getDoubleSettingForKey:withFallback:", CFSTR("distanceOfSnappingThreshold"), 150.0);
    v25 = (__CFString *)v32;
  }
  os_log = _mo_log_facility_get_os_log(&MOLogFacilityEventBundleManager);
  v34 = objc_claimAutoreleasedReturnValue(os_log);
  if (os_log_type_enabled(v34, OS_LOG_TYPE_DEBUG))
  {
    v116 = (objc_class *)objc_opt_class(a1, v35);
    v117 = NSStringFromClass(v116);
    v118 = (void *)objc_claimAutoreleasedReturnValue(v117);
    v119 = NSStringFromSelector(a2);
    v120 = v19;
    v121 = v30;
    v122 = (void *)objc_claimAutoreleasedReturnValue(v119);
    *(_DWORD *)buf = 138412802;
    v170 = v118;
    v171 = 2112;
    v172 = v122;
    v173 = 2112;
    v174 = v25;
    _os_log_debug_impl((void *)&_mh_execute_header, v34, OS_LOG_TYPE_DEBUG, "%@, %@: format option, %@", buf, 0x20u);

    v30 = v121;
    v19 = v120;

  }
  v36 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v15, "formatLocalityWithFormatOption:", v25));
  if (v36
    || (v36 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v15, "formatAdministrativeAreaWithFormatOption:", v25))) != 0)
  {
    if (v19)
      goto LABEL_8;
  }
  else
  {
    v36 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v15, "formatCountryWithFormatOption:", v25));
    if (v19)
    {
LABEL_8:
      v162 = v30;
      v37 = _mo_log_facility_get_os_log(&MOLogFacilityEventBundleManager);
      v38 = objc_claimAutoreleasedReturnValue(v37);
      if (os_log_type_enabled(v38, OS_LOG_TYPE_DEBUG))
      {
        v123 = (objc_class *)objc_opt_class(a1, v39);
        v124 = NSStringFromClass(v123);
        v167 = (void *)objc_claimAutoreleasedReturnValue(v124);
        v125 = NSStringFromSelector(a2);
        v126 = (void *)objc_claimAutoreleasedReturnValue(v125);
        v164 = (__CFString *)objc_claimAutoreleasedReturnValue(objc_msgSend(v15, "poiCategory"));
        v161 = (char *)objc_msgSend(v15, "placeType");
        v127 = objc_msgSend(v15, "placeUserType");
        *(_DWORD *)buf = 138413826;
        v170 = v167;
        v171 = 2112;
        v172 = v126;
        v173 = 2112;
        v174 = v25;
        v175 = 2112;
        v176 = v19;
        v177 = 2112;
        v178 = v164;
        v179 = 2048;
        v180 = v161;
        v181 = 2048;
        v182 = v127;
        _os_log_debug_impl((void *)&_mh_execute_header, v38, OS_LOG_TYPE_DEBUG, "%@, %@: format option, %@, place name, %@, category, %@, placeType, %lu, placeUserType, %lu", buf, 0x48u);

      }
      v166 = a1;

      v163 = v17;
      v165 = v16;
      v160 = v36;
      v168 = v25;
      if (v16)
      {
        v40 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v15, "poiCategory"));
        v41 = objc_msgSend(v16, "containsObject:", v40);

        if (v41)
        {
          v42 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v15, "poiCategory"));
          v156 = v19;
          if (v42 != (void *)GEOPOICategoryAirportTerminal)
          {
            v43 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v15, "poiCategory"));
            if (v43 != (void *)GEOPOICategoryAirportGate)
            {
              v44 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v15, "poiCategory"));
              v45 = v44;
              if (v44 != (void *)GEOPOICategoryAirport)
              {

LABEL_16:
                v46 = [MOPlace alloc];
                v47 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v15, "formatLocalityWithFormatOption:", v168));
                v48 = objc_msgSend(v15, "placeType");
                v49 = objc_msgSend(v15, "placeUserType");
                v50 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v15, "location"));
                v51 = objc_msgSend(v15, "mode");
                v52 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v15, "poiCategory"));
                objc_msgSend(v15, "familiarityIndexLOI");
                v54 = v53;
                v55 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v15, "startDate"));
                v56 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v15, "endDate"));
                v57 = v46;
                v58 = (void *)v156;
                v59 = -[MOPlace initWithPlaceName:enclosingArea:placeType:placeUserType:location:locationMode:poiCategory:distanceToHomeInMiles:placeNameConfidence:familiarityIndexLOI:startDate:endDate:](v57, "initWithPlaceName:enclosingArea:placeType:placeUserType:location:locationMode:poiCategory:distanceToHomeInMiles:placeNameConfidence:familiarityIndexLOI:startDate:endDate:", v156, v47, v48, v49, v50, v51, v24, v21, v54, v52, v55, v56);

LABEL_64:
                v137 = objc_opt_class(v166, v136);
                v138 = objc_msgSend(v15, "placeType");
                v139 = objc_msgSend(v15, "placeUserType");
                v140 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v15, "routineEvent"));
                v141 = objc_msgSend(v140, "mapItemPlaceType");
                v142 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v15, "routineEvent"));
                objc_msgSend(v142, "distanceFromVisitToPlace");
                v143 = (void *)v137;
                v68 = v59;
                v83 = v58;
                -[MOPlace setProposition:](v68, "setProposition:", objc_msgSend(v143, "prepositionWithPlaceType:userPlaceType:mapItemPlaceType:distanceFromVisitToPlace:snappingThreshold:", v138, v139, v141));

                v82 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v15, "eventIdentifier"));
                -[MOPlace setSourceEventIdentifier:](v68, "setSourceEventIdentifier:", v82);
                v17 = v163;
                v16 = v165;
                v36 = v160;
                v30 = v162;
                goto LABEL_65;
              }
              if (objc_msgSend(v15, "placeType") != (id)4)
              {
                v145 = objc_msgSend(v15, "placeSource");

                if (v145 != (id)1)
                  goto LABEL_16;
LABEL_63:
                v128 = [MOPlace alloc];
                v47 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v15, "formatLocalityWithFormatOption:", v25));
                v129 = objc_msgSend(v15, "placeUserType");
                v50 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v15, "location"));
                v130 = objc_msgSend(v15, "mode");
                v131 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v15, "poiCategory"));
                objc_msgSend(v15, "familiarityIndexLOI");
                v133 = v132;
                v134 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v15, "startDate"));
                v135 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v15, "endDate"));
                v58 = (void *)v156;
                v59 = -[MOPlace initWithPlaceName:enclosingArea:placeType:placeUserType:location:locationMode:poiCategory:distanceToHomeInMiles:placeNameConfidence:familiarityIndexLOI:startDate:endDate:](v128, "initWithPlaceName:enclosingArea:placeType:placeUserType:location:locationMode:poiCategory:distanceToHomeInMiles:placeNameConfidence:familiarityIndexLOI:startDate:endDate:", v156, v47, 6, v129, v50, v130, v24, v21, v133, v131, v134, v135);

                goto LABEL_64;
              }

            }
          }

          goto LABEL_63;
        }
      }
      v60 = (void *)v19;
      v61 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v15, "poiCategory"));
      v62 = objc_msgSend(v17, "containsObject:", v61);

      if (objc_msgSend(v15, "placeType") == (id)3)
      {
        if (v16)
        {
          v63 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v15, "poiCategory"));
          v64 = objc_msgSend(v16, "containsObject:", v63);

        }
        else
        {
          v64 = 0;
        }
        v67 = v60;
        if ((v64 & 1) == 0 && v21 <= a6 && ((unint64_t)objc_msgSend(v15, "placeSource") & 0x40000) == 0)
          v62 = 1;
      }
      else
      {
        v65 = objc_msgSend(v15, "placeType");
        if (v21 <= a8 && v65 == (id)2)
          v62 = 1;
        v67 = v60;
      }
      if ((-[__CFString isEqualToString:](v25, "isEqualToString:", CFSTR("currentFormat")) & 1) == 0
        && (objc_msgSend(v15, "placeType") == (id)4
         || objc_msgSend(v15, "placeType") == (id)5
         || (objc_msgSend(v15, "placeSource") & 1) != 0))
      {
        v91 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v15, "geoAddressObject"));
        v92 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v91, "address"));
        v93 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v92, "structuredAddress"));
        v94 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v93, "areaOfInterests"));
        v95 = objc_msgSend(v94, "count");

        v67 = v60;
        if (v95)
          v96 = v62;
        else
          v96 = 1;
        if ((v96 & 1) == 0)
          goto LABEL_50;
      }
      else if (!v62)
      {
LABEL_50:
        v88 = 0;
LABEL_51:
        if (objc_msgSend(v15, "placeType") == (id)4
          || (objc_msgSend(v15, "placeSource") == (id)1 ? (v97 = 1) : (v97 = v88), (v97 & 1) != 0))
        {
          v83 = v67;
          v98 = 4;
        }
        else
        {
          v83 = v67;
          v98 = (uint64_t)objc_msgSend(v15, "placeType");
        }
        aSelectorb = (SEL)v98;
        v99 = [MOPlace alloc];
        v100 = objc_msgSend(v15, "placeUserType");
        v101 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v15, "location"));
        v102 = objc_msgSend(v15, "mode");
        v103 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v15, "poiCategory"));
        objc_msgSend(v15, "familiarityIndexLOI");
        v105 = v104;
        v106 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v15, "startDate"));
        v107 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v15, "endDate"));
        v108 = -[MOPlace initWithPlaceName:enclosingArea:placeType:placeUserType:location:locationMode:poiCategory:distanceToHomeInMiles:placeNameConfidence:familiarityIndexLOI:startDate:endDate:](v99, "initWithPlaceName:enclosingArea:placeType:placeUserType:location:locationMode:poiCategory:distanceToHomeInMiles:placeNameConfidence:familiarityIndexLOI:startDate:endDate:", v83, v160, v98, v100, v101, v102, v24, v21, v105, v103, v106, v107);

        v36 = v160;
        v110 = objc_opt_class(v166, v109);
        v111 = objc_msgSend(v15, "placeUserType");
        v112 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v15, "routineEvent"));
        v113 = objc_msgSend(v112, "mapItemPlaceType");
        v114 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v15, "routineEvent"));
        objc_msgSend(v114, "distanceFromVisitToPlace");
        v115 = (void *)v110;
        v68 = v108;
        -[MOPlace setProposition:](v108, "setProposition:", objc_msgSend(v115, "prepositionWithPlaceType:userPlaceType:mapItemPlaceType:distanceFromVisitToPlace:snappingThreshold:", aSelectorb, v111, v113));

        v82 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v15, "eventIdentifier"));
        -[MOPlace setSourceEventIdentifier:](v108, "setSourceEventIdentifier:", v82);
        v17 = v163;
        v16 = v165;
        v30 = v162;
        goto LABEL_65;
      }
      v84 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v15, "formatAddressWithFormatOption:", v25));
      v85 = _mo_log_facility_get_os_log(&MOLogFacilityEventBundleManager);
      v86 = objc_claimAutoreleasedReturnValue(v85);
      if (os_log_type_enabled(v86, OS_LOG_TYPE_DEBUG))
      {
        v146 = (objc_class *)objc_opt_class(v166, v87);
        v147 = NSStringFromClass(v146);
        v155 = (void *)objc_claimAutoreleasedReturnValue(v147);
        v148 = NSStringFromSelector(a2);
        v149 = (void *)objc_claimAutoreleasedReturnValue(v148);
        v150 = (__CFString *)objc_claimAutoreleasedReturnValue(objc_msgSend(v67, "mask"));
        v151 = objc_claimAutoreleasedReturnValue(objc_msgSend(v84, "mask"));
        aSelectora = (char *)objc_claimAutoreleasedReturnValue(objc_msgSend(v15, "poiCategory"));
        v154 = objc_msgSend(v15, "placeType");
        v152 = objc_msgSend(v15, "placeUserType");
        *(_DWORD *)buf = 138414082;
        v170 = v155;
        v171 = 2112;
        v172 = v149;
        v173 = 2112;
        v174 = v150;
        v175 = 2112;
        v176 = v151;
        v153 = (void *)v151;
        v177 = 2112;
        v178 = v25;
        v179 = 2112;
        v180 = aSelectora;
        v181 = 2048;
        v182 = v154;
        v183 = 2048;
        v184 = v152;
        _os_log_debug_impl((void *)&_mh_execute_header, v86, OS_LOG_TYPE_DEBUG, "%@, %@: original place name, %@, new place name, %@, format option, %@, category, %@, placeType, %lu, placeUserType, %lu", buf, 0x52u);

        v67 = v60;
      }

      v88 = v84 != 0;
      if (v84)
      {
        v89 = v84;
        v90 = v67;
        v67 = v89;

      }
      goto LABEL_51;
    }
  }
  v68 = (MOPlace *)objc_claimAutoreleasedReturnValue(objc_msgSend(v15, "location"));

  if (v68)
  {
    v168 = v25;
    v69 = [MOPlace alloc];
    v70 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v15, "location"));
    v71 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v15, "startDate"));
    v72 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v15, "endDate"));
    v73 = -[MOPlace initWithPlaceName:enclosingArea:placeType:placeUserType:location:locationMode:poiCategory:distanceToHomeInMiles:placeNameConfidence:familiarityIndexLOI:startDate:endDate:](v69, "initWithPlaceName:enclosingArea:placeType:placeUserType:location:locationMode:poiCategory:distanceToHomeInMiles:placeNameConfidence:familiarityIndexLOI:startDate:endDate:", 0, v36, 0, 0, v70, 0, v24, -1.0, 0.0, 0, v71, v72);
    v74 = a1;
    v75 = v73;

    v77 = objc_opt_class(v74, v76);
    v78 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v15, "routineEvent"));
    v79 = objc_msgSend(v78, "mapItemPlaceType");
    v80 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v15, "routineEvent"));
    objc_msgSend(v80, "distanceFromVisitToPlace");
    v81 = (void *)v77;
    v68 = v75;
    -[MOPlace setProposition:](v75, "setProposition:", objc_msgSend(v81, "prepositionWithPlaceType:userPlaceType:mapItemPlaceType:distanceFromVisitToPlace:snappingThreshold:", 0, 0, v79));

    v82 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v15, "eventIdentifier"));
    -[MOPlace setSourceEventIdentifier:](v75, "setSourceEventIdentifier:", v82);
    v83 = 0;
LABEL_65:

    v25 = v168;
    goto LABEL_66;
  }
  v83 = 0;
LABEL_66:

  return v68;
}

+ (id)locationsFromMotionEvents:(id)a3
{
  id v3;
  NSMutableArray *v4;
  id v5;
  id v6;
  id v7;
  uint64_t v8;
  void *i;
  void *v10;
  void *v11;
  void *v12;
  void *v13;
  void *v14;
  id v15;
  id v16;
  __int128 v18;
  __int128 v19;
  __int128 v20;
  __int128 v21;
  _BYTE v22[128];

  v3 = a3;
  v4 = objc_opt_new(NSMutableArray);
  v18 = 0u;
  v19 = 0u;
  v20 = 0u;
  v21 = 0u;
  v5 = v3;
  v6 = objc_msgSend(v5, "countByEnumeratingWithState:objects:count:", &v18, v22, 16);
  if (v6)
  {
    v7 = v6;
    v8 = *(_QWORD *)v19;
    do
    {
      for (i = 0; i != v7; i = (char *)i + 1)
      {
        if (*(_QWORD *)v19 != v8)
          objc_enumerationMutation(v5);
        v10 = *(void **)(*((_QWORD *)&v18 + 1) + 8 * (_QWORD)i);
        v11 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v10, "workoutEvent", (_QWORD)v18));
        v12 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v11, "workoutLocationRoute"));

        if (v12)
        {
          v13 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v10, "workoutEvent"));
          v14 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v13, "workoutLocationRoute"));
          v15 = objc_msgSend(v14, "copy");
          -[NSMutableArray addObject:](v4, "addObject:", v15);

        }
      }
      v7 = objc_msgSend(v5, "countByEnumeratingWithState:objects:count:", &v18, v22, 16);
    }
    while (v7);
  }

  v16 = -[NSMutableArray copy](v4, "copy");
  return v16;
}

+ (id)placeFromRoutes:(id)a3
{
  return +[MOContextAnnotationUtilities placeFromRoutes:referencePointRatio:minimumRangeOfLocation:](MOContextAnnotationUtilities, "placeFromRoutes:referencePointRatio:minimumRangeOfLocation:", a3, 1.5, 0.0);
}

+ (id)placeFromRoutes:(id)a3 referencePointRatio:(double)a4 minimumRangeOfLocation:(double)a5
{
  id v5;
  void *v6;
  NSMutableArray *v7;
  id v8;
  id v9;
  id v10;
  uint64_t v11;
  void *i;
  void *v13;
  NSMutableArray *v14;
  NSMutableArray *v15;
  id v16;
  id v17;
  uint64_t v18;
  void *j;
  void *v20;
  void *v21;
  void *v22;
  void *v23;
  void *v24;
  void *v25;
  void *v26;
  void *v27;
  id v28;
  double v29;
  double v30;
  id v31;
  MOPlace *v32;
  __int128 v34;
  __int128 v35;
  __int128 v36;
  __int128 v37;
  __int128 v38;
  __int128 v39;
  __int128 v40;
  __int128 v41;
  _BYTE v42[128];
  _BYTE v43[128];

  v5 = a3;
  v6 = v5;
  if (v5 && objc_msgSend(v5, "count"))
  {
    v7 = objc_opt_new(NSMutableArray);
    v38 = 0u;
    v39 = 0u;
    v40 = 0u;
    v41 = 0u;
    v8 = v6;
    v9 = objc_msgSend(v8, "countByEnumeratingWithState:objects:count:", &v38, v43, 16);
    if (v9)
    {
      v10 = v9;
      v11 = *(_QWORD *)v39;
      do
      {
        for (i = 0; i != v10; i = (char *)i + 1)
        {
          if (*(_QWORD *)v39 != v11)
            objc_enumerationMutation(v8);
          -[NSMutableArray addObjectsFromArray:](v7, "addObjectsFromArray:", *(_QWORD *)(*((_QWORD *)&v38 + 1) + 8 * (_QWORD)i));
        }
        v10 = objc_msgSend(v8, "countByEnumeratingWithState:objects:count:", &v38, v43, 16);
      }
      while (v10);
    }

    v13 = (void *)objc_claimAutoreleasedReturnValue(+[MOContextAnnotationUtilities averageLocationFromLocations:](MOContextAnnotationUtilities, "averageLocationFromLocations:", v7));
    v14 = objc_opt_new(NSMutableArray);
    v34 = 0u;
    v35 = 0u;
    v36 = 0u;
    v37 = 0u;
    v15 = v7;
    v16 = -[NSMutableArray countByEnumeratingWithState:objects:count:](v15, "countByEnumeratingWithState:objects:count:", &v34, v42, 16);
    if (v16)
    {
      v17 = v16;
      v18 = *(_QWORD *)v35;
      do
      {
        for (j = 0; j != v17; j = (char *)j + 1)
        {
          if (*(_QWORD *)v35 != v18)
            objc_enumerationMutation(v15);
          objc_msgSend(v13, "distanceFromLocation:", *(_QWORD *)(*((_QWORD *)&v34 + 1) + 8 * (_QWORD)j));
          v20 = (void *)objc_claimAutoreleasedReturnValue(+[NSNumber numberWithDouble:](NSNumber, "numberWithDouble:"));
          -[NSMutableArray addObject:](v14, "addObject:", v20);

        }
        v17 = -[NSMutableArray countByEnumeratingWithState:objects:count:](v15, "countByEnumeratingWithState:objects:count:", &v34, v42, 16);
      }
      while (v17);
    }

    v21 = (void *)objc_claimAutoreleasedReturnValue(+[NSSortDescriptor sortDescriptorWithKey:ascending:](NSSortDescriptor, "sortDescriptorWithKey:ascending:", CFSTR("self"), 0));
    v22 = (void *)objc_claimAutoreleasedReturnValue(+[NSArray arrayWithObject:](NSArray, "arrayWithObject:", v21));
    -[NSMutableArray sortUsingDescriptors:](v14, "sortUsingDescriptors:", v22);

    v23 = (void *)objc_claimAutoreleasedReturnValue(-[NSMutableArray firstObject](v14, "firstObject"));
    objc_msgSend(v23, "doubleValue");

    v24 = (void *)objc_claimAutoreleasedReturnValue(-[NSMutableArray firstObject](v15, "firstObject"));
    v25 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v24, "timestamp"));

    v26 = (void *)objc_claimAutoreleasedReturnValue(-[NSMutableArray lastObject](v15, "lastObject"));
    v27 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v26, "timestamp"));

    v28 = objc_alloc((Class)RTLocation);
    objc_msgSend(v13, "coordinate");
    v30 = v29;
    objc_msgSend(v13, "coordinate");
    v31 = objc_msgSend(v28, "initWithLatitude:longitude:horizontalUncertainty:date:", v25, v30);
    v32 = -[MOPlace initWithPlaceName:enclosingArea:placeType:placeUserType:location:locationMode:poiCategory:distanceToHomeInMiles:placeNameConfidence:familiarityIndexLOI:startDate:endDate:]([MOPlace alloc], "initWithPlaceName:enclosingArea:placeType:placeUserType:location:locationMode:poiCategory:distanceToHomeInMiles:placeNameConfidence:familiarityIndexLOI:startDate:endDate:", 0, 0, 0, 0, v31, 0, 0.0, 0.0, 0.0, 0, v25, v27);

  }
  else
  {
    v32 = 0;
  }

  return v32;
}

+ (id)averageLocationFromLocations:(id)a3
{
  id v3;
  id v4;
  id v5;
  id v6;
  __int128 v7;
  id v8;
  uint64_t v9;
  double v10;
  double v11;
  double v12;
  void *i;
  void *v14;
  double v15;
  double v16;
  double v17;
  double v18;
  double v19;
  __double2 v20;
  __double2 v21;
  id os_log;
  NSObject *v23;
  double v24;
  id v25;
  NSObject *v26;
  double v27;
  double v28;
  id v29;
  NSObject *v30;
  uint64_t v31;
  uint64_t v32;
  double v33;
  id v34;
  NSObject *v35;
  id v36;
  __int128 v38;
  __int128 v39;
  __int128 v40;
  __int128 v41;
  __int128 v42;
  uint8_t buf[4];
  double v44;
  __int16 v45;
  double v46;
  __int16 v47;
  double v48;
  __int16 v49;
  id v50;
  _BYTE v51[128];

  v3 = a3;
  v4 = objc_msgSend(v3, "count");
  v39 = 0u;
  v40 = 0u;
  v41 = 0u;
  v42 = 0u;
  v5 = v3;
  v6 = objc_msgSend(v5, "countByEnumeratingWithState:objects:count:", &v39, v51, 16);
  if (v6)
  {
    v8 = v6;
    v9 = *(_QWORD *)v40;
    v10 = 0.0;
    *(_QWORD *)&v7 = 134218240;
    v38 = v7;
    v11 = 0.0;
    v12 = 0.0;
    do
    {
      for (i = 0; i != v8; i = (char *)i + 1)
      {
        if (*(_QWORD *)v40 != v9)
          objc_enumerationMutation(v5);
        v14 = *(void **)(*((_QWORD *)&v39 + 1) + 8 * (_QWORD)i);
        objc_msgSend(v14, "coordinate", v38);
        v16 = v15;
        objc_msgSend(v14, "coordinate");
        v18 = v17;
        v19 = v17 * 0.0174532925;
        v20 = __sincos_stret(v16 * 0.0174532925);
        v21 = __sincos_stret(v19);
        os_log = _mo_log_facility_get_os_log(&MOLogFacilityEventBundleManager);
        v23 = objc_claimAutoreleasedReturnValue(os_log);
        if (os_log_type_enabled(v23, OS_LOG_TYPE_DEBUG))
        {
          *(_DWORD *)buf = v38;
          v44 = v16;
          v45 = 2048;
          v46 = v18;
          _os_log_debug_impl((void *)&_mh_execute_header, v23, OS_LOG_TYPE_DEBUG, "Average Location: input loc, (%f, %f)", buf, 0x16u);
        }
        v12 = v12 + v20.__cosval * v21.__cosval;
        v11 = v11 + v20.__cosval * v21.__sinval;
        v10 = v10 + v20.__sinval;

      }
      v8 = objc_msgSend(v5, "countByEnumeratingWithState:objects:count:", &v39, v51, 16);
    }
    while (v8);
  }
  else
  {
    v10 = 0.0;
    v11 = 0.0;
    v12 = 0.0;
  }

  v24 = v12 / (double)(uint64_t)v4;
  v25 = _mo_log_facility_get_os_log(&MOLogFacilityEventBundleManager);
  v26 = objc_claimAutoreleasedReturnValue(v25);
  if (os_log_type_enabled(v26, OS_LOG_TYPE_DEBUG))
  {
    *(_DWORD *)buf = 134218752;
    v44 = v12 / (double)(uint64_t)v4;
    v45 = 2048;
    v46 = v11 / (double)(uint64_t)v4;
    v47 = 2048;
    v48 = v10 / (double)(uint64_t)v4;
    v49 = 2048;
    v50 = v4;
    _os_log_debug_impl((void *)&_mh_execute_header, v26, OS_LOG_TYPE_DEBUG, "Average Location: avg, (%f, %f, %f), cnt, %lu", buf, 0x2Au);
  }

  v27 = atan2(v11 / (double)(uint64_t)v4, v24);
  v28 = atan2(v10 / (double)(uint64_t)v4, sqrt(v11 / (double)(uint64_t)v4 * (v11 / (double)(uint64_t)v4) + v24 * v24));
  v29 = _mo_log_facility_get_os_log(&MOLogFacilityEventBundleManager);
  v30 = objc_claimAutoreleasedReturnValue(v29);
  if (os_log_type_enabled(v30, OS_LOG_TYPE_DEBUG))
    +[MOContextAnnotationUtilities averageLocationFromLocations:].cold.1(v30, v28, v27, v31, v32);

  v33 = v28 * 57.2957795;
  v34 = _mo_log_facility_get_os_log(&MOLogFacilityEventBundleManager);
  v35 = objc_claimAutoreleasedReturnValue(v34);
  if (os_log_type_enabled(v35, OS_LOG_TYPE_INFO))
  {
    *(_DWORD *)buf = 134218240;
    v44 = v33;
    v45 = 2048;
    v46 = v27 * 57.2957795;
    _os_log_impl((void *)&_mh_execute_header, v35, OS_LOG_TYPE_INFO, "Average Location: center, (%f, %f)", buf, 0x16u);
  }

  v36 = objc_msgSend(objc_alloc((Class)CLLocation), "initWithLatitude:longitude:", v33, v27 * 57.2957795);
  return v36;
}

+ (id)locationsFromLocationString:(id)a3
{
  id v3;
  void *v4;
  void *v5;
  NSMutableArray *v6;
  id v7;
  id v8;
  id v9;
  uint64_t v10;
  void *i;
  void *v12;
  id v13;
  uint64_t v14;
  void *v15;
  double v16;
  double v17;
  id v18;
  uint64_t v19;
  void *v20;
  double v21;
  double v22;
  id os_log;
  NSObject *v24;
  id v25;
  id v27;
  void *v28;
  __int128 v29;
  __int128 v30;
  __int128 v31;
  __int128 v32;
  id v33;
  uint8_t buf[4];
  double v35;
  __int16 v36;
  double v37;
  _BYTE v38[128];

  v3 = a3;
  v33 = 0;
  v4 = (void *)objc_claimAutoreleasedReturnValue(+[NSRegularExpression regularExpressionWithPattern:options:error:](NSRegularExpression, "regularExpressionWithPattern:options:error:", CFSTR("\\(([-+]?[0-9]*\\.?[0-9]+),([-+]?[0-9]*\\.?[0-9]+)\\)"), 1, &v33));
  v27 = v33;
  v28 = v4;
  v5 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v4, "matchesInString:options:range:", v3, 0, 0, objc_msgSend(v3, "length")));
  v6 = objc_opt_new(NSMutableArray);
  v29 = 0u;
  v30 = 0u;
  v31 = 0u;
  v32 = 0u;
  v7 = v5;
  v8 = objc_msgSend(v7, "countByEnumeratingWithState:objects:count:", &v29, v38, 16);
  if (v8)
  {
    v9 = v8;
    v10 = *(_QWORD *)v30;
    do
    {
      for (i = 0; i != v9; i = (char *)i + 1)
      {
        if (*(_QWORD *)v30 != v10)
          objc_enumerationMutation(v7);
        v12 = *(void **)(*((_QWORD *)&v29 + 1) + 8 * (_QWORD)i);
        if (objc_msgSend(v12, "numberOfRanges"))
        {
          v13 = objc_msgSend(v12, "rangeAtIndex:", 1);
          v15 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v3, "substringWithRange:", v13, v14));
          objc_msgSend(v15, "doubleValue");
          v17 = v16;
          v18 = objc_msgSend(v12, "rangeAtIndex:", 2);
          v20 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v3, "substringWithRange:", v18, v19));
          objc_msgSend(v20, "doubleValue");
          v22 = v21;
          os_log = _mo_log_facility_get_os_log(&MOLogFacilityEventBundleManager);
          v24 = objc_claimAutoreleasedReturnValue(os_log);
          if (os_log_type_enabled(v24, OS_LOG_TYPE_INFO))
          {
            *(_DWORD *)buf = 134218240;
            v35 = v17;
            v36 = 2048;
            v37 = v22;
            _os_log_impl((void *)&_mh_execute_header, v24, OS_LOG_TYPE_INFO, "Location: %f, %f", buf, 0x16u);
          }

          v25 = objc_msgSend(objc_alloc((Class)CLLocation), "initWithLatitude:longitude:", v17, v22);
          -[NSMutableArray addObject:](v6, "addObject:", v25);

        }
      }
      v9 = objc_msgSend(v7, "countByEnumeratingWithState:objects:count:", &v29, v38, 16);
    }
    while (v9);
  }

  return v6;
}

+ (double)distanceFromHomeToLocation:(id)a3 universe:(id)a4
{
  id v5;
  id v6;
  uint64_t v7;
  objc_class *v8;
  NSString *v9;
  void *v10;
  void *v11;
  void *v12;
  void *v13;
  double v14;
  double v15;

  v5 = a3;
  v6 = a4;
  v8 = (objc_class *)objc_opt_class(MORoutineServiceManager, v7);
  v9 = NSStringFromClass(v8);
  v10 = (void *)objc_claimAutoreleasedReturnValue(v9);
  v11 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v6, "getService:", v10));

  v12 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v11, "homeLOI"));
  v13 = v12;
  if (v12)
  {
    objc_msgSend(v12, "distanceFromLocation:", v5);
    v15 = v14 * 0.00062137;
  }
  else
  {
    v15 = 0.0;
  }

  return v15;
}

+ (double)distanceFromHomeToCLLocation:(id)a3 universe:(id)a4
{
  id v5;
  id v6;
  uint64_t v7;
  objc_class *v8;
  NSString *v9;
  void *v10;
  void *v11;
  void *v12;
  id v13;
  double v14;
  double v15;
  double v16;
  id v17;
  double v18;
  double v19;

  v5 = a3;
  v6 = a4;
  v8 = (objc_class *)objc_opt_class(MORoutineServiceManager, v7);
  v9 = NSStringFromClass(v8);
  v10 = (void *)objc_claimAutoreleasedReturnValue(v9);
  v11 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v6, "getService:", v10));

  v12 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v11, "homeLOI"));
  if (v12)
  {
    v13 = objc_alloc((Class)CLLocation);
    objc_msgSend(v12, "latitude");
    v15 = v14;
    objc_msgSend(v12, "longitude");
    v17 = objc_msgSend(v13, "initWithLatitude:longitude:", v15, v16);
    objc_msgSend(v17, "distanceFromLocation:", v5);
    v19 = v18 * 0.00062137;

  }
  else
  {
    v19 = 0.0;
  }

  return v19;
}

+ (double)weightedAverageForObjects:(id)a3 weightPath:(id)a4 valuePath:(id)a5
{
  id v7;
  id v8;
  id v9;
  id v10;
  double v11;
  double v12;
  id v13;
  uint64_t v14;
  void *i;
  void *v16;
  void *v17;
  double v18;
  double v19;
  void *v20;
  double v21;
  double v22;
  double v23;
  __int128 v25;
  __int128 v26;
  __int128 v27;
  __int128 v28;
  _BYTE v29[128];

  v7 = a3;
  v8 = a4;
  v9 = a5;
  v25 = 0u;
  v26 = 0u;
  v27 = 0u;
  v28 = 0u;
  v10 = objc_msgSend(v7, "countByEnumeratingWithState:objects:count:", &v25, v29, 16);
  v11 = 0.0;
  v12 = 0.0;
  if (v10)
  {
    v13 = v10;
    v14 = *(_QWORD *)v26;
    do
    {
      for (i = 0; i != v13; i = (char *)i + 1)
      {
        if (*(_QWORD *)v26 != v14)
          objc_enumerationMutation(v7);
        v16 = *(void **)(*((_QWORD *)&v25 + 1) + 8 * (_QWORD)i);
        v17 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v16, "valueForKeyPath:", v8));
        objc_msgSend(v17, "doubleValue");
        v19 = v18;

        v20 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v16, "valueForKeyPath:", v9));
        objc_msgSend(v20, "doubleValue");
        v22 = v21;

        v12 = v12 + v19 * v22;
        v11 = v11 + v19;
      }
      v13 = objc_msgSend(v7, "countByEnumeratingWithState:objects:count:", &v25, v29, 16);
    }
    while (v13);
  }
  if (v11 == 0.0)
    v23 = 0.0;
  else
    v23 = v12 / v11;

  return v23;
}

+ (BOOL)isEvergreenBundle:(id)a3
{
  id v3;
  void *v4;
  id v5;
  void *v6;
  id v7;
  id v8;
  uint64_t v9;
  void *i;
  void *v11;
  BOOL v12;
  __int128 v14;
  __int128 v15;
  __int128 v16;
  __int128 v17;
  _BYTE v18[128];

  v3 = a3;
  v4 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v3, "resources"));
  v5 = objc_msgSend(v4, "count");

  if (v5)
  {
    v16 = 0u;
    v17 = 0u;
    v14 = 0u;
    v15 = 0u;
    v6 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v3, "resources", 0));
    v7 = objc_msgSend(v6, "countByEnumeratingWithState:objects:count:", &v14, v18, 16);
    if (v7)
    {
      v8 = v7;
      v9 = *(_QWORD *)v15;
      while (2)
      {
        for (i = 0; i != v8; i = (char *)i + 1)
        {
          if (*(_QWORD *)v15 != v9)
            objc_enumerationMutation(v6);
          v11 = *(void **)(*((_QWORD *)&v14 + 1) + 8 * (_QWORD)i);
          if (objc_msgSend(v11, "type") == (id)3 || objc_msgSend(v11, "type") == (id)2)
          {
            v12 = 0;
            goto LABEL_15;
          }
        }
        v8 = objc_msgSend(v6, "countByEnumeratingWithState:objects:count:", &v14, v18, 16);
        v12 = 1;
        if (v8)
          continue;
        break;
      }
    }
    else
    {
      v12 = 1;
    }
LABEL_15:

  }
  else
  {
    v12 = 1;
  }

  return v12;
}

+ (void)assetPriorityScoringForTimeAtHomeBundlesWithBundle:(id)a3 withMediaResources:(id)a4 withPhotoResources:(id)a5 withEmotionResources:(id)a6
{
  id v9;
  id v10;
  id v11;
  id v12;
  void *v13;
  void *v14;
  id v15;
  id v16;
  id v17;
  uint64_t v18;
  uint64_t v19;
  void *i;
  void *v21;
  double v22;
  id v23;
  NSMutableArray *v24;
  id v25;
  id v26;
  id v27;
  uint64_t v28;
  double v29;
  void *j;
  void *v31;
  double v32;
  NSMutableArray *v33;
  id v34;
  id v35;
  id v36;
  uint64_t v37;
  double v38;
  void *k;
  uint64_t v40;
  double v41;
  id v42;
  void *v43;
  void *v44;
  void *v45;
  __int128 v46;
  __int128 v47;
  __int128 v48;
  __int128 v49;
  __int128 v50;
  __int128 v51;
  __int128 v52;
  __int128 v53;
  __int128 v54;
  __int128 v55;
  __int128 v56;
  __int128 v57;
  _BYTE v58[128];
  _BYTE v59[128];
  _BYTE v60[128];
  id v61;

  v9 = a3;
  v10 = a4;
  v11 = a5;
  v12 = a6;
  v42 = objc_msgSend(objc_alloc((Class)NSSortDescriptor), "initWithKey:ascending:", CFSTR("photoCurationScore"), 0);
  v61 = v42;
  v13 = (void *)objc_claimAutoreleasedReturnValue(+[NSArray arrayWithObjects:count:](NSArray, "arrayWithObjects:count:", &v61, 1));
  v14 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v11, "sortedArrayUsingDescriptors:", v13));

  v44 = (void *)objc_claimAutoreleasedReturnValue(+[NSMutableArray arrayWithArray:](NSMutableArray, "arrayWithArray:", v10));
  v54 = 0u;
  v55 = 0u;
  v56 = 0u;
  v57 = 0u;
  v15 = v10;
  v16 = objc_msgSend(v15, "countByEnumeratingWithState:objects:count:", &v54, v60, 16);
  v43 = v11;
  if (v16)
  {
    v17 = v16;
    v18 = *(_QWORD *)v55;
    v19 = 0x4069200000000000;
    while (2)
    {
      for (i = 0; i != v17; i = (char *)i + 1)
      {
        if (*(_QWORD *)v55 != v18)
          objc_enumerationMutation(v15);
        v21 = *(void **)(*((_QWORD *)&v54 + 1) + 8 * (_QWORD)i);
        objc_msgSend(v21, "priorityScore");
        if (v22 == 201.0)
        {
          v23 = objc_msgSend(v15, "indexOfObject:", v21);
          objc_msgSend(v21, "setPriorityScore:", 200.0);
          objc_msgSend(v44, "replaceObjectAtIndex:withObject:", v23, v21);
          goto LABEL_11;
        }
      }
      v17 = objc_msgSend(v15, "countByEnumeratingWithState:objects:count:", &v54, v60, 16);
      if (v17)
        continue;
      break;
    }
  }
  v19 = 0x4069000000000000;
LABEL_11:

  v24 = objc_opt_new(NSMutableArray);
  v45 = v12;
  if (objc_msgSend(v12, "count"))
  {
    v52 = 0u;
    v53 = 0u;
    v50 = 0u;
    v51 = 0u;
    v25 = v12;
    v26 = objc_msgSend(v25, "countByEnumeratingWithState:objects:count:", &v50, v59, 16);
    if (v26)
    {
      v27 = v26;
      v28 = *(_QWORD *)v51;
      v29 = 501.0;
      do
      {
        for (j = 0; j != v27; j = (char *)j + 1)
        {
          if (*(_QWORD *)v51 != v28)
            objc_enumerationMutation(v25);
          v31 = *(void **)(*((_QWORD *)&v50 + 1) + 8 * (_QWORD)j);
          objc_msgSend(v31, "priorityScore");
          if (v32 != 202.0)
          {
            objc_msgSend(v31, "setPriorityScore:", v29);
            v29 = v29 + 1.0;
          }
          -[NSMutableArray addObject:](v24, "addObject:", v31);
        }
        v27 = objc_msgSend(v25, "countByEnumeratingWithState:objects:count:", &v50, v59, 16);
      }
      while (v27);
    }

  }
  v33 = objc_opt_new(NSMutableArray);
  v46 = 0u;
  v47 = 0u;
  v48 = 0u;
  v49 = 0u;
  v34 = v14;
  v35 = objc_msgSend(v34, "countByEnumeratingWithState:objects:count:", &v46, v58, 16);
  if (v35)
  {
    v36 = v35;
    v37 = *(_QWORD *)v47;
    v38 = 0.0;
    do
    {
      for (k = 0; k != v36; k = (char *)k + 1)
      {
        if (*(_QWORD *)v47 != v37)
          objc_enumerationMutation(v34);
        v40 = *(_QWORD *)(*((_QWORD *)&v46 + 1) + 8 * (_QWORD)k);
        if (v38 == 0.0)
        {
          v41 = 100.0;
        }
        else
        {
          v41 = *(double *)&v19;
          if (v38 != 100.0)
          {
            if (v38 < 200.0)
              goto LABEL_33;
            v41 = v38 + 1.0;
          }
        }
        objc_msgSend(*(id *)(*((_QWORD *)&v46 + 1) + 8 * (_QWORD)k), "setPriorityScore:", v41);
        v38 = v41;
LABEL_33:
        -[NSMutableArray addObject:](v33, "addObject:", v40);
      }
      v36 = objc_msgSend(v34, "countByEnumeratingWithState:objects:count:", &v46, v58, 16);
    }
    while (v36);
  }

  objc_msgSend(v9, "setResources:", v33);
  objc_msgSend(v9, "addResources:", v44);
  objc_msgSend(v9, "addResources:", v24);

}

+ (id)setActionForActivityBundle:(id)a3
{
  id v3;
  void *v4;
  void *v5;
  void *v6;
  __CFString *v7;
  MOAction *v8;
  void *v9;
  id v10;
  __CFString **v11;
  uint64_t v12;
  id v13;
  id v14;
  id v15;
  uint64_t v16;
  uint64_t v17;
  double v18;
  double v19;
  void *i;
  void *v21;
  void *v22;
  void *v23;
  double v24;
  void *v25;
  void *v26;
  double v27;
  void *v28;
  void *v29;
  void *v30;
  void *v31;
  uint64_t v32;
  __CFString *v33;
  NSMutableDictionary *v34;
  void *v35;
  __CFString **v36;
  id v37;
  id v38;
  void *v39;
  id v40;
  uint64_t v41;
  void *j;
  void *v43;
  void *v44;
  void *v45;
  void *v46;
  unsigned int v47;
  void *v48;
  void *v49;
  void *v50;
  void *v51;
  unsigned int v52;
  void *v53;
  void *v54;
  uint64_t v56;
  __CFString *v57;
  id v58;
  NSMutableDictionary *v59;
  __int128 v60;
  __int128 v61;
  __int128 v62;
  __int128 v63;
  __int128 v64;
  __int128 v65;
  __int128 v66;
  __int128 v67;
  _BYTE v68[128];
  _BYTE v69[128];

  v3 = a3;
  v4 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v3, "firstObject"));
  v5 = v4;
  if (v4)
  {
    if (objc_msgSend(v4, "category") == (id)2)
    {
      v6 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v5, "workoutEvent"));
      v7 = (__CFString *)objc_claimAutoreleasedReturnValue(objc_msgSend(v6, "workoutType"));

LABEL_11:
      v12 = 1;
      goto LABEL_17;
    }
    if (objc_msgSend(v5, "category") != (id)16)
    {
      v7 = 0;
      goto LABEL_11;
    }
    v9 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v5, "motionActivityEvent"));
    v10 = objc_msgSend(v9, "motionType");

    if (v10 == (id)6)
    {
      v11 = &MOWorkoutMotionActivityActionRunAndWalk;
    }
    else if (v10 == (id)3)
    {
      v11 = &MOWorkoutMotionActivityActionRun;
    }
    else
    {
      if (v10 != (id)2)
      {
        v7 = 0;
        goto LABEL_16;
      }
      v11 = &MOWorkoutMotionActivityActionWalk;
    }
    v7 = *v11;
LABEL_16:
    v12 = 2;
LABEL_17:
    v56 = v12;
    v57 = v7;
    v58 = v3;
    v59 = objc_opt_new(NSMutableDictionary);
    v64 = 0u;
    v65 = 0u;
    v66 = 0u;
    v67 = 0u;
    v13 = v3;
    v14 = objc_msgSend(v13, "countByEnumeratingWithState:objects:count:", &v64, v69, 16);
    if (v14)
    {
      v15 = v14;
      LODWORD(v16) = 0;
      v17 = *(_QWORD *)v65;
      v18 = 0.0;
      v19 = 0.0;
      do
      {
        for (i = 0; i != v15; i = (char *)i + 1)
        {
          if (*(_QWORD *)v65 != v17)
            objc_enumerationMutation(v13);
          v21 = *(void **)(*((_QWORD *)&v64 + 1) + 8 * (_QWORD)i);
          v22 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v21, "workoutEvent"));
          v23 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v22, "workoutTotalDistance"));
          objc_msgSend(v23, "doubleValue");
          v18 = v18 + v24;

          v25 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v21, "workoutEvent"));
          v26 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v25, "workoutDuration"));
          objc_msgSend(v26, "doubleValue");
          v19 = v19 + v27 / 60.0;

          v28 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v21, "motionActivityEvent"));
          v29 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v28, "motionStepCount"));
          v16 = objc_msgSend(v29, "intValue") + v16;

          v30 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v21, "motionActivityEvent"));
          v31 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v30, "motionDistance"));
          objc_msgSend(v31, "doubleValue");

        }
        v15 = objc_msgSend(v13, "countByEnumeratingWithState:objects:count:", &v64, v69, 16);
      }
      while (v15);
    }
    else
    {
      v16 = 0;
      v18 = 0.0;
      v19 = 0.0;
    }

    if (objc_msgSend(v5, "category") == (id)16)
    {
      v33 = v57;
      v34 = v59;
      if ((int)v16 < 1)
        goto LABEL_34;
      v35 = (void *)objc_claimAutoreleasedReturnValue(+[NSString stringWithFormat:](NSString, "stringWithFormat:", CFSTR("%d"), v16));
      v36 = &MOWorkoutActionUnitMotionWalkingSteps;
    }
    else
    {
      v33 = v57;
      v34 = v59;
      if (v18 <= 0.0)
      {
        if (v19 <= 0.0)
          goto LABEL_34;
        LODWORD(v32) = llround(v19);
        v35 = (void *)objc_claimAutoreleasedReturnValue(+[NSString stringWithFormat:](NSString, "stringWithFormat:", CFSTR("%d"), v32));
        v36 = &MOWorkoutActionUnitWorkoutDuration;
      }
      else
      {
        v35 = (void *)objc_claimAutoreleasedReturnValue(+[NSString stringWithFormat:](NSString, "stringWithFormat:", CFSTR("%.2f"), trunc(v18 * 0.62137119 * 100.0) / 100.0));
        v36 = &MOWorkoutActionUnitWorkoutDistance;
      }
    }
    -[NSMutableDictionary setObject:forKeyedSubscript:](v34, "setObject:forKeyedSubscript:", v35, CFSTR("ActivityActionMetaDataValue"));

    -[NSMutableDictionary setObject:forKeyedSubscript:](v34, "setObject:forKeyedSubscript:", *v36, CFSTR("ActivityActionMetaDataUnit"));
LABEL_34:
    v62 = 0u;
    v63 = 0u;
    v60 = 0u;
    v61 = 0u;
    v37 = v13;
    v38 = objc_msgSend(v37, "countByEnumeratingWithState:objects:count:", &v60, v68, 16);
    v39 = v37;
    if (v38)
    {
      v40 = v38;
      v41 = *(_QWORD *)v61;
      while (2)
      {
        for (j = 0; j != v40; j = (char *)j + 1)
        {
          if (*(_QWORD *)v61 != v41)
            objc_enumerationMutation(v37);
          v43 = *(void **)(*((_QWORD *)&v60 + 1) + 8 * (_QWORD)j);
          if ((objc_msgSend(v43, "fromFirstParty") & 1) == 0)
          {
            v44 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v43, "appBundle"));
            v45 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v37, "firstObject"));
            v46 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v45, "appBundle"));
            v47 = objc_msgSend(v44, "isEqualToString:", v46);

            if (v47)
              continue;
          }
          v39 = v37;
          v34 = v59;
          goto LABEL_45;
        }
        v40 = objc_msgSend(v37, "countByEnumeratingWithState:objects:count:", &v60, v68, 16);
        if (v40)
          continue;
        break;
      }

      v39 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v37, "firstObject"));
      v48 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v39, "appBundle"));
      v49 = (void *)objc_claimAutoreleasedReturnValue(+[MOContextAnnotationUtilities bundleNameFromBundleId:](MOContextAnnotationUtilities, "bundleNameFromBundleId:", v48));
      v34 = v59;
      -[NSMutableDictionary setObject:forKeyedSubscript:](v59, "setObject:forKeyedSubscript:", v49, CFSTR("MediaActionMetaDataAppName"));

    }
LABEL_45:

    v50 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v37, "firstObject"));
    if ((objc_msgSend(v50, "fromFirstParty") & 1) != 0)
    {
      v51 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v37, "firstObject"));
      v52 = objc_msgSend(v51, "isFitnessPlusSession");

      v3 = v58;
      if (v52)
        -[NSMutableDictionary setObject:forKeyedSubscript:](v34, "setObject:forKeyedSubscript:", CFSTR("Fitness+"), CFSTR("MediaActionMetaDataAppName"));
      if (v33)
        goto LABEL_49;
    }
    else
    {

      v3 = v58;
      if (v33)
      {
LABEL_49:
        v8 = -[MOAction initWithActionName:actionType:actionSubtype:actionMetaData:]([MOAction alloc], "initWithActionName:actionType:actionSubtype:actionMetaData:", v33, 4, v56, v34);
        v53 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v37, "firstObject"));
        v54 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v53, "eventIdentifier"));
        -[MOAction setSourceEventIdentifier:](v8, "setSourceEventIdentifier:", v54);

LABEL_52:
        goto LABEL_53;
      }
    }
    v8 = 0;
    goto LABEL_52;
  }
  v8 = 0;
LABEL_53:

  return v8;
}

+ (void)addStateOfMindResourceForBundle:(id)a3 withEmotionEvents:(id)a4
{
  id v5;
  void *v6;
  void *v7;
  NSMutableDictionary *v8;
  id v9;
  id v10;
  id v11;
  void *i;
  void *v13;
  void *v14;
  void *v15;
  void *v16;
  void *v17;
  void *v18;
  void *v19;
  void *v20;
  void *v21;
  void *v22;
  void *v23;
  void *v24;
  void *v25;
  void *v26;
  void *v27;
  void *v28;
  MOResource *v29;
  void *v30;
  void *v31;
  void *v32;
  id v33;
  void *v34;
  uint64_t v35;
  id v36;
  __int128 v37;
  __int128 v38;
  __int128 v39;
  __int128 v40;
  _BYTE v41[128];
  id v42;

  v36 = a3;
  v5 = a4;
  v33 = objc_msgSend(objc_alloc((Class)NSSortDescriptor), "initWithKey:ascending:", CFSTR("startDate"), 0);
  v42 = v33;
  v6 = (void *)objc_claimAutoreleasedReturnValue(+[NSArray arrayWithObjects:count:](NSArray, "arrayWithObjects:count:", &v42, 1));
  v34 = v5;
  v7 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v5, "sortedArrayUsingDescriptors:", v6));

  v8 = objc_opt_new(NSMutableDictionary);
  v37 = 0u;
  v38 = 0u;
  v39 = 0u;
  v40 = 0u;
  v9 = v7;
  v10 = objc_msgSend(v9, "countByEnumeratingWithState:objects:count:", &v37, v41, 16);
  if (v10)
  {
    v11 = v10;
    v35 = *(_QWORD *)v38;
    do
    {
      for (i = 0; i != v11; i = (char *)i + 1)
      {
        if (*(_QWORD *)v38 != v35)
          objc_enumerationMutation(v9);
        v13 = *(void **)(*((_QWORD *)&v37 + 1) + 8 * (_QWORD)i);
        v14 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v13, "startDate"));
        objc_msgSend(v14, "timeIntervalSince1970");
        v15 = (void *)objc_claimAutoreleasedReturnValue(+[NSNumber numberWithDouble:](NSNumber, "numberWithDouble:"));
        -[NSMutableDictionary setObject:forKey:](v8, "setObject:forKey:", v15, CFSTR("MOStateOfMindMetaDataKeyStartDate"));

        v16 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v13, "endDate"));
        objc_msgSend(v16, "timeIntervalSince1970");
        v17 = (void *)objc_claimAutoreleasedReturnValue(+[NSNumber numberWithDouble:](NSNumber, "numberWithDouble:"));
        -[NSMutableDictionary setObject:forKey:](v8, "setObject:forKey:", v17, CFSTR("MOStateOfMindMetaDataKeyEndDate"));

        v18 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v13, "stateOfMindEvent"));
        v19 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v18, "labels"));
        -[NSMutableDictionary setObject:forKey:](v8, "setObject:forKey:", v19, CFSTR("MOStateOfMindMetaDataKeyLabel"));

        v20 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v13, "stateOfMindEvent"));
        v21 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v20, "domains"));
        -[NSMutableDictionary setObject:forKey:](v8, "setObject:forKey:", v21, CFSTR("MOStateOfMindMetaDataKeyDomain"));

        v22 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v13, "stateOfMindEvent"));
        objc_msgSend(v22, "reflectiveInterval");
        v23 = (void *)objc_claimAutoreleasedReturnValue(+[NSNumber numberWithDouble:](NSNumber, "numberWithDouble:"));
        -[NSMutableDictionary setObject:forKey:](v8, "setObject:forKey:", v23, CFSTR("MOStateOfMindMetaDataKeyReflectiveInterval"));

        v24 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v13, "stateOfMindEvent"));
        objc_msgSend(v24, "valence");
        v25 = (void *)objc_claimAutoreleasedReturnValue(+[NSNumber numberWithDouble:](NSNumber, "numberWithDouble:"));
        -[NSMutableDictionary setObject:forKey:](v8, "setObject:forKey:", v25, CFSTR("MOStateOfMindMetaDataKeyValence"));

        v26 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v13, "stateOfMindEvent"));
        objc_msgSend(v26, "valenceClassification");
        v27 = (void *)objc_claimAutoreleasedReturnValue(+[NSNumber numberWithDouble:](NSNumber, "numberWithDouble:"));
        -[NSMutableDictionary setObject:forKey:](v8, "setObject:forKey:", v27, CFSTR("MOStateOfMindMetaDataKeyValenceClassification"));

        v28 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v13, "identifierFromProvider"));
        -[NSMutableDictionary setObject:forKey:](v8, "setObject:forKey:", v28, CFSTR("MOStateOfMindMetaDataKeyStateOfMindID"));

        v29 = -[MOResource initWithName:type:dict:value:]([MOResource alloc], "initWithName:type:dict:value:", CFSTR("StateOfMind"), 16, v8, 0.0);
        v30 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v13, "identifierFromProvider"));
        -[MOResource setAssets:](v29, "setAssets:", v30);

        v31 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v13, "eventIdentifier"));
        -[MOResource setSourceEventIdentifier:](v29, "setSourceEventIdentifier:", v31);

        -[MOResource setSourceEventAccessType:](v29, "setSourceEventAccessType:", 8);
        v32 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v9, "firstObject"));

        if (v32 == v13)
          -[MOResource setPriorityScore:](v29, "setPriorityScore:", 202.0);
        objc_msgSend(v36, "addResource:", v29);

      }
      v11 = objc_msgSend(v9, "countByEnumeratingWithState:objects:count:", &v37, v41, 16);
    }
    while (v11);
  }

}

+ (void)addStateOfMindMetaDataForRankForBundle:(id)a3 withEmotionEvents:(id)a4
{
  id v5;
  NSMutableArray *v6;
  NSMutableArray *v7;
  NSMutableArray *v8;
  id v9;
  id v10;
  uint64_t v11;
  void *i;
  NSMutableArray *v13;
  void *v14;
  void *v15;
  void *v16;
  void *v17;
  void *v18;
  void *v19;
  void *v20;
  void *v21;
  void *v22;
  void *v23;
  void *v24;
  void *v25;
  void *v26;
  void *v27;
  void *v28;
  void *v29;
  void *v30;
  void *v31;
  void *v32;
  void *v33;
  void *v34;
  void *v35;
  id v36;
  id obj;
  NSMutableArray *v38;
  NSMutableArray *v39;
  __int128 v40;
  __int128 v41;
  __int128 v42;
  __int128 v43;
  _BYTE v44[128];

  v36 = a3;
  v5 = a4;
  v6 = objc_opt_new(NSMutableArray);
  v39 = objc_opt_new(NSMutableArray);
  v38 = objc_opt_new(NSMutableArray);
  v7 = objc_opt_new(NSMutableArray);
  v8 = objc_opt_new(NSMutableArray);
  v40 = 0u;
  v41 = 0u;
  v42 = 0u;
  v43 = 0u;
  obj = v5;
  v9 = objc_msgSend(obj, "countByEnumeratingWithState:objects:count:", &v40, v44, 16);
  if (v9)
  {
    v10 = v9;
    v11 = *(_QWORD *)v41;
    do
    {
      for (i = 0; i != v10; i = (char *)i + 1)
      {
        v13 = v8;
        if (*(_QWORD *)v41 != v11)
          objc_enumerationMutation(obj);
        v14 = *(void **)(*((_QWORD *)&v40 + 1) + 8 * (_QWORD)i);
        v15 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v14, "stateOfMindEvent", v36));
        v16 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v15, "labels"));
        -[NSMutableArray addObjectsFromArray:](v6, "addObjectsFromArray:", v16);

        v17 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v14, "stateOfMindEvent"));
        v18 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v17, "domains"));
        -[NSMutableArray addObjectsFromArray:](v39, "addObjectsFromArray:", v18);

        v19 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v14, "stateOfMindEvent"));
        objc_msgSend(v19, "valence");
        v20 = (void *)objc_claimAutoreleasedReturnValue(+[NSNumber numberWithDouble:](NSNumber, "numberWithDouble:"));
        -[NSMutableArray addObject:](v38, "addObject:", v20);

        v21 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v14, "stateOfMindEvent"));
        objc_msgSend(v21, "valenceClassification");
        v22 = (void *)objc_claimAutoreleasedReturnValue(+[NSNumber numberWithDouble:](NSNumber, "numberWithDouble:"));
        -[NSMutableArray addObject:](v7, "addObject:", v22);

        v23 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v14, "stateOfMindEvent"));
        objc_msgSend(v23, "reflectiveInterval");
        v24 = (void *)objc_claimAutoreleasedReturnValue(+[NSNumber numberWithDouble:](NSNumber, "numberWithDouble:"));
        v8 = v13;
        -[NSMutableArray addObject:](v13, "addObject:", v24);

      }
      v10 = objc_msgSend(obj, "countByEnumeratingWithState:objects:count:", &v40, v44, 16);
    }
    while (v10);
  }

  v25 = v36;
  if (-[NSMutableArray count](v6, "count"))
  {
    v26 = (void *)objc_claimAutoreleasedReturnValue(+[NSSet setWithArray:](NSSet, "setWithArray:", v6));
    v27 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v26, "allObjects"));
    objc_msgSend(v36, "addMetaDataForRankForKey:value:", CFSTR("StateOfMindLabels"), v27);

  }
  if (-[NSMutableArray count](v39, "count", v36))
  {
    v28 = (void *)objc_claimAutoreleasedReturnValue(+[NSSet setWithArray:](NSSet, "setWithArray:", v39));
    v29 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v28, "allObjects"));
    objc_msgSend(v25, "addMetaDataForRankForKey:value:", CFSTR("StateOfMindDomains"), v29);

  }
  if (-[NSMutableArray count](v38, "count"))
  {
    v30 = (void *)objc_claimAutoreleasedReturnValue(+[NSSet setWithArray:](NSSet, "setWithArray:", v38));
    v31 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v30, "allObjects"));
    objc_msgSend(v25, "addMetaDataForRankForKey:value:", CFSTR("StateOfMindValence"), v31);

  }
  if (-[NSMutableArray count](v7, "count"))
  {
    v32 = (void *)objc_claimAutoreleasedReturnValue(+[NSSet setWithArray:](NSSet, "setWithArray:", v7));
    v33 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v32, "allObjects"));
    objc_msgSend(v25, "addMetaDataForRankForKey:value:", CFSTR("StateOfMindValenceClassification"), v33);

  }
  if (-[NSMutableArray count](v8, "count"))
  {
    v34 = (void *)objc_claimAutoreleasedReturnValue(+[NSSet setWithArray:](NSSet, "setWithArray:", v8));
    v35 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v34, "allObjects"));
    objc_msgSend(v25, "addMetaDataForRankForKey:value:", CFSTR("StateOfMindReflectiveInterval"), v35);

  }
}

+ (void)annotateEventBundle:(uint64_t)a3 leisureMediaEvents:(uint64_t)a4 .cold.1(uint64_t a1, NSObject *a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8)
{
  OUTLINED_FUNCTION_0((void *)&_mh_execute_header, a2, a3, "media name is not resolved, top event, %@", a5, a6, a7, a8, 2u);
  OUTLINED_FUNCTION_1();
}

+ (void)createMediaResourceWithMediaInfo:(uint8_t *)a1 playSessions:(void *)a2 eventIdentifiersMapping:(_QWORD *)a3 isDominant:(NSObject *)a4 .cold.1(uint8_t *a1, void *a2, _QWORD *a3, NSObject *a4)
{
  void *v7;

  v7 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(a2, "productId"));
  *(_DWORD *)a1 = 138412290;
  *a3 = v7;
  _os_log_debug_impl((void *)&_mh_execute_header, a4, OS_LOG_TYPE_DEBUG, "Media containerName=nil, id=%@", a1, 0xCu);

}

+ (void)dominantMediaNameFromPlaySessions:intervalOfInterest:dominantFactorThreshold:confidence:.cold.1()
{
  NSObject *v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint8_t v6;

  OUTLINED_FUNCTION_5_0();
  OUTLINED_FUNCTION_0_3((void *)&_mh_execute_header, v0, v1, "Invalid parameter not satisfying: dominantFactorThreshold >= 0", v2, v3, v4, v5, v6);
  OUTLINED_FUNCTION_2_2();
}

+ (void)dominantMediaNameFromPlaySessions:(NSObject *)a3 intervalOfInterest:dominantFactorThreshold:confidence:.cold.2(void *a1, uint64_t a2, NSObject *a3)
{
  uint64_t v4;
  uint8_t v5[24];

  objc_msgSend(a1, "count");
  OUTLINED_FUNCTION_2_1();
  OUTLINED_FUNCTION_1_7((void *)&_mh_execute_header, a3, v4, "MediaName, playSessions.count, %lu, intervalOfInterest, %@", v5);
  OUTLINED_FUNCTION_5();
}

+ (void)dominantMediaNameFromPlaySessions:intervalOfInterest:dominantFactorThreshold:confidence:.cold.3()
{
  NSObject *v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint8_t v6;

  OUTLINED_FUNCTION_5_0();
  OUTLINED_FUNCTION_0_3((void *)&_mh_execute_header, v0, v1, "Invalid parameter not satisfying: intervalOfInterest.duration > 0", v2, v3, v4, v5, v6);
  OUTLINED_FUNCTION_2_2();
}

+ (void)dominantMediaNameFromPlaySessions:intervalsOfInterest:dominantFactorThreshold:confidence:.cold.2()
{
  NSObject *v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint8_t v6;

  OUTLINED_FUNCTION_5_0();
  OUTLINED_FUNCTION_0_3((void *)&_mh_execute_header, v0, v1, "Invalid parameter not satisfying: intervalsOfInterest.count > 0", v2, v3, v4, v5, v6);
  OUTLINED_FUNCTION_2_2();
}

+ (void)dominantMediaNameFromPlaySessions:(NSObject *)a3 intervalsOfInterest:dominantFactorThreshold:confidence:.cold.3(void *a1, uint64_t a2, NSObject *a3)
{
  uint64_t v4;
  uint8_t v5[24];

  objc_msgSend(a1, "count");
  OUTLINED_FUNCTION_2_1();
  OUTLINED_FUNCTION_1_7((void *)&_mh_execute_header, a3, v4, "MediaName, playSessions.count, %lu, intervalsOfInterest, %@", v5);
  OUTLINED_FUNCTION_5();
}

+ (void)bundleNameFromBundleId:(uint64_t)a3 .cold.1(uint64_t a1, NSObject *a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8)
{
  OUTLINED_FUNCTION_0((void *)&_mh_execute_header, a2, a3, "Cannot retrieve app name from bundleId, %@", a5, a6, a7, a8, 2u);
  OUTLINED_FUNCTION_1();
}

+ (void)addPhotoResourcesWithDateArray:universe:handler:.cold.1()
{
  os_log_t v0;
  uint8_t v1[16];

  OUTLINED_FUNCTION_5_0();
  _os_log_fault_impl((void *)&_mh_execute_header, v0, OS_LOG_TYPE_FAULT, "addPhotoResources timed out", v1, 2u);
  OUTLINED_FUNCTION_2_2();
}

+ (void)averageLocationFromLocations:(double)a3 .cold.1(NSObject *a1, double a2, double a3, uint64_t a4, uint64_t a5)
{
  int v5;
  double v6;
  __int16 v7;
  double v8;

  v5 = 134218240;
  v6 = a2;
  v7 = 2048;
  v8 = a3;
  OUTLINED_FUNCTION_1_7((void *)&_mh_execute_header, a1, a5, "Average Location: loc in radian, (%f, %f)", (uint8_t *)&v5);
  OUTLINED_FUNCTION_1();
}

@end
