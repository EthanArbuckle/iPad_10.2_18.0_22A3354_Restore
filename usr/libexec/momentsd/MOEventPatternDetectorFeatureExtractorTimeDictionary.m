@implementation MOEventPatternDetectorFeatureExtractorTimeDictionary

- (MOEventPatternDetectorFeatureExtractorTimeDictionary)init
{
  MOEventPatternDetectorFeatureExtractorTimeDictionary *v2;
  MOEventPatternDetectorFeatureExtractorTimeDictionary *v3;
  MOEventPatternDetectorFeatureExtractorTimeDictionary *v4;
  objc_super v6;

  v6.receiver = self;
  v6.super_class = (Class)MOEventPatternDetectorFeatureExtractorTimeDictionary;
  v2 = -[MOEventPatternDetectorFeatureExtractorTimeDictionary init](&v6, "init");
  v3 = v2;
  if (v2)
  {
    v2->_lastWindowEnd = -1.0;
    v4 = v2;
  }

  return v3;
}

- (id)extractFeaturesFromEvents:(id)a3
{
  id v3;
  _UNKNOWN **v4;
  const __CFString *v5;
  uint64_t v6;
  void *v7;
  void *v8;
  void *i;
  void *v10;
  void *v11;
  void *v12;
  void *v13;
  float v14;
  double v15;
  void *v16;
  void *v17;
  void *v18;
  double v19;
  void *v20;
  void *v21;
  void *v22;
  void *v23;
  double v24;
  void *v25;
  void *v26;
  void *v27;
  void *v28;
  void *v29;
  void *v30;
  void *v31;
  id v32;
  void *v33;
  id v34;
  void *v35;
  void *v36;
  const __CFString *v37;
  const __CFString *v38;
  const __CFString *v39;
  unint64_t v40;
  void *v41;
  void *v42;
  void *v43;
  float v44;
  double v45;
  void *v46;
  void *v47;
  void *v48;
  void *v49;
  const __CFString *v50;
  void *v51;
  const __CFString *v52;
  void *v53;
  id obj;
  uint64_t v56;
  NSMutableArray *v58;
  id v59;
  uint64_t v60;
  void *v61;
  void *v62;
  void *v63;
  id v64;
  id v65;
  id v66;
  uint64_t v67;
  void *v68;
  id v69;
  void *v70;
  void *v71;
  void *v72;
  void *v73;
  void *v74;
  __int128 v75;
  __int128 v76;
  __int128 v77;
  __int128 v78;
  __int128 v79;
  __int128 v80;
  __int128 v81;
  __int128 v82;
  _QWORD v83[7];
  _QWORD v84[7];
  _QWORD v85[6];
  _QWORD v86[6];
  _BYTE v87[128];
  _BYTE v88[128];

  v3 = a3;
  v58 = objc_opt_new(NSMutableArray);
  v66 = objc_msgSend(objc_alloc((Class)NSCalendar), "initWithCalendarIdentifier:", NSCalendarIdentifierGregorian);
  v79 = 0u;
  v80 = 0u;
  v81 = 0u;
  v82 = 0u;
  obj = v3;
  v59 = objc_msgSend(obj, "countByEnumeratingWithState:objects:count:", &v79, v88, 16);
  if (v59)
  {
    v56 = *(_QWORD *)v80;
    v4 = &_s10Foundation11MeasurementV19_bridgeToObjectiveCSo13NSMeasurementCyF_ptr;
    v5 = CFSTR("eventIdentifier");
    do
    {
      v6 = 0;
      do
      {
        if (*(_QWORD *)v80 != v56)
          objc_enumerationMutation(obj);
        v60 = v6;
        v7 = *(void **)(*((_QWORD *)&v79 + 1) + 8 * v6);
        v8 = (void *)objc_claimAutoreleasedReturnValue(+[NSMutableArray array](NSMutableArray, "array"));
        v75 = 0u;
        v76 = 0u;
        v77 = 0u;
        v78 = 0u;
        v64 = v7;
        v69 = objc_msgSend(v64, "countByEnumeratingWithState:objects:count:", &v75, v87, 16);
        v71 = v8;
        if (v69)
        {
          v67 = *(_QWORD *)v76;
          do
          {
            for (i = 0; i != v69; i = (char *)i + 1)
            {
              if (*(_QWORD *)v76 != v67)
                objc_enumerationMutation(v64);
              v10 = *(void **)(*((_QWORD *)&v75 + 1) + 8 * (_QWORD)i);
              v11 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v10, "startDate"));
              v12 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v66, "components:fromDate:", 96, v11));

              v13 = v4[317];
              v14 = (float)(uint64_t)objc_msgSend(v12, "hour");
              v72 = v12;
              *(float *)&v15 = (float)((float)(uint64_t)objc_msgSend(v12, "minute") / 60.0) + v14;
              v16 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v13, "numberWithFloat:", v15));
              v17 = v4[317];
              v18 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v10, "startDate"));
              *(float *)&v19 = (float)(uint64_t)objc_msgSend(v66, "component:fromDate:", 0x2000, v18);
              v20 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v17, "numberWithFloat:", v19));

              v21 = v4[317];
              v22 = (void *)objc_claimAutoreleasedReturnValue(+[NSCalendar currentCalendar](NSCalendar, "currentCalendar"));
              v23 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v10, "startDate"));
              *(float *)&v24 = (float)(uint64_t)objc_msgSend(v22, "component:fromDate:", 512, v23);
              v25 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v21, "numberWithFloat:", v24));

              v85[0] = v5;
              v26 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v10, "eventIdentifier"));
              v27 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v26, "UUIDString"));
              v86[0] = v27;
              v85[1] = CFSTR("startDate");
              v28 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v10, "startDate"));
              v86[1] = v28;
              v85[2] = CFSTR("endDate");
              v29 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v10, "endDate"));
              v86[2] = v29;
              v86[3] = v16;
              v85[3] = CFSTR("hrFromMidnight");
              v85[4] = CFSTR("weekOfYear");
              v85[5] = CFSTR("weekday");
              v86[4] = v20;
              v86[5] = v25;
              v30 = (void *)objc_claimAutoreleasedReturnValue(+[NSDictionary dictionaryWithObjects:forKeys:count:](NSDictionary, "dictionaryWithObjects:forKeys:count:", v86, v85, 6));

              if (objc_msgSend(v10, "category") == (id)2)
              {
                v31 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v10, "workoutType"));

                v8 = v71;
                if (v31)
                {
                  v32 = objc_msgSend(objc_alloc((Class)NSMutableDictionary), "initWithDictionary:", v30);
                  v33 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v10, "workoutType"));
                  objc_msgSend(v32, "setObject:forKeyedSubscript:", v33, CFSTR("workoutType"));

                  v34 = objc_msgSend(v32, "copy");
                  v30 = v34;
                }
                v4 = &_s10Foundation11MeasurementV19_bridgeToObjectiveCSo13NSMeasurementCyF_ptr;
                v5 = CFSTR("eventIdentifier");
              }
              else
              {
                v4 = &_s10Foundation11MeasurementV19_bridgeToObjectiveCSo13NSMeasurementCyF_ptr;
                v5 = CFSTR("eventIdentifier");
                v8 = v71;
              }
              objc_msgSend(v8, "addObject:", v30);

            }
            v69 = objc_msgSend(v64, "countByEnumeratingWithState:objects:count:", &v75, v87, 16);
          }
          while (v69);
        }

        v35 = (void *)objc_claimAutoreleasedReturnValue(+[NSPredicate predicateWithFormat:](NSPredicate, "predicateWithFormat:", CFSTR("(hrFromMidnight >= %f) AND (hrFromMidnight < %f)"), 0, self->_lastWindowEnd + -24.0));
        v36 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v8, "filteredArrayUsingPredicate:", v35));

        v37 = CFSTR("hrFromMidnight");
        v38 = v5;
        v39 = CFSTR("weekOfYear");
        if (objc_msgSend(v36, "count"))
        {
          v40 = 0;
          do
          {
            v41 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v36, "objectAtIndex:", v40));
            v42 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v41, "valueForKey:", v37));

            v43 = v4[317];
            objc_msgSend(v42, "floatValue");
            *(float *)&v45 = v44 + 24.0;
            v63 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v43, "numberWithFloat:", v45));

            v83[0] = v38;
            v74 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v36, "objectAtIndex:", v40));
            v73 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v74, "valueForKey:", v38));
            v84[0] = v73;
            v83[1] = CFSTR("startDate");
            v70 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v36, "objectAtIndex:", v40));
            v68 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v70, "valueForKey:", CFSTR("startDate")));
            v84[1] = v68;
            v83[2] = CFSTR("endDate");
            v65 = (id)objc_claimAutoreleasedReturnValue(objc_msgSend(v36, "objectAtIndex:", v40));
            v62 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v65, "valueForKey:", CFSTR("endDate")));
            v84[2] = v62;
            v83[3] = CFSTR("workoutType");
            v61 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v36, "objectAtIndex:", v40));
            v46 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v61, "valueForKey:", CFSTR("workoutType")));
            v84[3] = v46;
            v84[4] = v63;
            v83[4] = v37;
            v83[5] = v39;
            v47 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v36, "objectAtIndex:", v40));
            v48 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v47, "valueForKey:", v39));
            v84[5] = v48;
            v83[6] = CFSTR("weekday");
            v49 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v36, "objectAtIndex:", v40));
            v50 = v39;
            v51 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v49, "valueForKey:", CFSTR("weekday")));
            v84[6] = v51;
            v52 = v37;
            v53 = (void *)objc_claimAutoreleasedReturnValue(+[NSDictionary dictionaryWithObjects:forKeys:count:](NSDictionary, "dictionaryWithObjects:forKeys:count:", v84, v83, 7));
            objc_msgSend(v71, "addObject:", v53);

            v37 = v52;
            v39 = v50;

            v4 = &_s10Foundation11MeasurementV19_bridgeToObjectiveCSo13NSMeasurementCyF_ptr;
            v38 = CFSTR("eventIdentifier");

            ++v40;
          }
          while ((unint64_t)objc_msgSend(v36, "count") > v40);
        }
        -[NSMutableArray addObject:](v58, "addObject:", v71);

        v6 = v60 + 1;
        v5 = v38;
      }
      while ((id)(v60 + 1) != v59);
      v59 = objc_msgSend(obj, "countByEnumeratingWithState:objects:count:", &v79, v88, 16);
    }
    while (v59);
  }

  return v58;
}

- (BOOL)configure:(id)a3
{
  id v4;
  void *v5;
  void *v6;
  double v7;
  id os_log;
  NSObject *v9;

  v4 = a3;
  v5 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v4, "objectForKey:", CFSTR("LastWindowEnd")));

  if (v5)
  {
    v6 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v4, "objectForKeyedSubscript:", CFSTR("LastWindowEnd")));
    objc_msgSend(v6, "doubleValue");
    self->_lastWindowEnd = v7;

  }
  else
  {
    os_log = _mo_log_facility_get_os_log(&MOLogFacilityPatternDetection);
    v9 = objc_claimAutoreleasedReturnValue(os_log);
    if (os_log_type_enabled(v9, OS_LOG_TYPE_ERROR))
      -[MOEventPatternDetectorFeatureExtractorTimeDictionary configure:].cold.1((uint64_t)CFSTR("LastWindowEnd"), v9);

  }
  return 1;
}

- (void)configure:(uint64_t)a1 .cold.1(uint64_t a1, NSObject *a2)
{
  int v2;
  uint64_t v3;

  v2 = 138412290;
  v3 = a1;
  _os_log_error_impl((void *)&_mh_execute_header, a2, OS_LOG_TYPE_ERROR, "Configuration property not set for routine detection: %@", (uint8_t *)&v2, 0xCu);
}

@end
