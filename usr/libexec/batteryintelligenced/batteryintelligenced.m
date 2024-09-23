void sub_100003AA0(id a1)
{
  BatteryAlgorithmsInit *v1;
  void *v2;

  v1 = objc_alloc_init(BatteryAlgorithmsInit);
  v2 = (void *)qword_1000351A8;
  qword_1000351A8 = (uint64_t)v1;

}

void sub_100004230(uint64_t a1)
{
  void *v2;
  id v3;
  void *v4;
  id v5;
  uint64_t Data;
  void *v7;
  NSObject *v8;
  id v9;
  NSObject *v10;
  id v11;
  id v12;
  void *i;
  void *v14;
  void *v15;
  void *v16;
  void *v17;
  void *v18;
  void *v19;
  void *v20;
  void *v21;
  uint64_t v22;
  uint64_t v23;
  void *v24;
  uint64_t v25;
  id v26;
  void *v27;
  void *v28;
  void *v29;
  id v30;
  void *v31;
  id v32;
  uint64_t v33;
  void *v34;
  id v35;
  id v36;
  NSObject *v37;
  id v38;
  _UNKNOWN **v39;
  NSObject *v40;
  id v41;
  id v42;
  id v43;
  unsigned int v44;
  uint64_t v45;
  void *v46;
  unsigned int v47;
  void *v48;
  void *v49;
  void *v50;
  void *v51;
  void *v52;
  void *v53;
  uint64_t v54;
  void *v55;
  void *v56;
  NSObject *v57;
  id v58;
  id v59;
  void *v60;
  void *v61;
  void *v62;
  void *v63;
  id v64;
  void *v65;
  id v66;
  uint64_t v67;
  void *v68;
  id v69;
  NSObject *v70;
  NSObject *v71;
  id v72;
  id v73;
  uint64_t v74;
  void *j;
  void *v76;
  void *v77;
  void *v78;
  void *v79;
  void *v80;
  void *v81;
  uint64_t v82;
  void *v83;
  void *v84;
  void *v85;
  void *v86;
  void *v87;
  uint64_t v88;
  uint64_t v89;
  void *v90;
  id v91;
  uint64_t v92;
  void *v93;
  void *v94;
  void *v95;
  id v96;
  id v97;
  id v98;
  id obj;
  id obja;
  id objb;
  id v102;
  id v103;
  id v104;
  void *v105;
  void *v106;
  void *v107;
  __int128 v108;
  __int128 v109;
  __int128 v110;
  __int128 v111;
  id v112;
  _QWORD v113[4];
  _QWORD v114[4];
  uint8_t buf[4];
  id v116;

  v2 = (void *)objc_claimAutoreleasedReturnValue(+[NSSet setWithArray:](NSSet, "setWithArray:", &off_10002EF48));
  v3 = objc_alloc((Class)PPSTimeSeriesRequest);
  v4 = (void *)objc_claimAutoreleasedReturnValue(+[NSPredicate predicateWithFormat:](NSPredicate, "predicateWithFormat:", CFSTR("(subsystem == 'BatteryDataCollection' AND category == 'BDC_SBC')")));
  v5 = objc_msgSend(v3, "initWithMetrics:predicate:timeFilter:limitCount:offsetCount:", v2, v4, 0, 105120, 0);

  v105 = (void *)objc_claimAutoreleasedReturnValue(+[NSMutableArray array](NSMutableArray, "array"));
  if (v5)
  {
    v112 = 0;
    Data = PerfPowerServicesGetData(v5, &v112);
    v7 = (void *)objc_claimAutoreleasedReturnValue(Data);
    v93 = v7;
    v96 = v112;
    if (v96)
    {
      v8 = qword_1000351B8;
      if (os_log_type_enabled((os_log_t)qword_1000351B8, OS_LOG_TYPE_DEFAULT))
      {
        *(_DWORD *)buf = 138412290;
        v116 = v96;
        _os_log_impl((void *)&_mh_execute_header, v8, OS_LOG_TYPE_DEFAULT, "Error from PPSGetData %@", buf, 0xCu);
      }
      v9 = (id)objc_claimAutoreleasedReturnValue(+[NSNull null](NSNull, "null"));
    }
    else
    {
      v91 = v5;
      v110 = 0u;
      v111 = 0u;
      v108 = 0u;
      v109 = 0u;
      obj = v7;
      v11 = objc_msgSend(obj, "countByEnumeratingWithState:objects:count:", &v108, buf, 16);
      if (v11)
      {
        v12 = v11;
        v102 = *(id *)v109;
        do
        {
          for (i = 0; i != v12; i = (char *)i + 1)
          {
            if (*(id *)v109 != v102)
              objc_enumerationMutation(obj);
            v14 = *(void **)(*((_QWORD *)&v108 + 1) + 8 * (_QWORD)i);
            v15 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v14, "metricKeysAndValues", v91));
            v16 = (void *)objc_claimAutoreleasedReturnValue(+[NSMutableDictionary dictionary](NSMutableDictionary, "dictionary"));
            v17 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v15, "objectForKeyedSubscript:", CFSTR("Voltage")));
            objc_msgSend(v16, "setObject:forKeyedSubscript:", v17, CFSTR("Voltage"));

            v18 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v15, "objectForKeyedSubscript:", CFSTR("Amperage")));
            objc_msgSend(v16, "setObject:forKeyedSubscript:", v18, CFSTR("Amperage"));

            v19 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v15, "objectForKeyedSubscript:", CFSTR("PresentDOD0")));
            objc_msgSend(v16, "setObject:forKeyedSubscript:", v19, CFSTR("PresentDOD0"));

            v20 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v15, "objectForKeyedSubscript:", CFSTR("VirtualTemperature")));
            objc_msgSend(v16, "setObject:forKeyedSubscript:", v20, CFSTR("VirtualTemperature"));

            objc_msgSend(v14, "epochTimestamp");
            v21 = (void *)objc_claimAutoreleasedReturnValue(+[NSNumber numberWithDouble:](NSNumber, "numberWithDouble:"));
            objc_msgSend(v16, "setObject:forKeyedSubscript:", v21, CFSTR("Timestamp"));

            v22 = qword_1000351C8;
            if (*(double *)&qword_1000351C8 == 0.0)
            {
              objc_msgSend(v14, "epochTimestamp", *(double *)&qword_1000351C8);
              qword_1000351C8 = v22;
            }
            objc_msgSend(v105, "addObject:", v16, *(double *)&v22);

          }
          v12 = objc_msgSend(obj, "countByEnumeratingWithState:objects:count:", &v108, buf, 16);
        }
        while (v12);
      }

      v9 = v105;
      v5 = v91;
    }

  }
  else
  {
    v10 = qword_1000351B8;
    if (os_log_type_enabled((os_log_t)qword_1000351B8, OS_LOG_TYPE_DEFAULT))
    {
      *(_WORD *)buf = 0;
      _os_log_impl((void *)&_mh_execute_header, v10, OS_LOG_TYPE_DEFAULT, "Failed to allocated PPS request object", buf, 2u);
    }
    v9 = (id)objc_claimAutoreleasedReturnValue(+[NSNull null](NSNull, "null"));
  }

  v23 = *(_QWORD *)(a1 + 32);
  v24 = *(void **)(v23 + 24);
  *(_QWORD *)(v23 + 24) = v9;

  v25 = objc_claimAutoreleasedReturnValue(+[NSSet setWithArray:](NSSet, "setWithArray:", &off_10002EF60));
  v26 = objc_alloc((Class)PPSTimeSeriesRequest);
  v27 = (void *)objc_claimAutoreleasedReturnValue(+[NSPredicate predicateWithFormat:](NSPredicate, "predicateWithFormat:", CFSTR("(subsystem == 'BatteryDataCollection' AND category == 'BDC_OBC')")));
  v28 = (void *)objc_claimAutoreleasedReturnValue(+[NSDate now](NSDate, "now"));
  v29 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v28, "dateByAddingTimeInterval:", -31536000.0));
  v30 = objc_msgSend(objc_alloc((Class)NSDateInterval), "initWithStartDate:endDate:", v29, v28);

  v31 = (void *)v25;
  v32 = objc_msgSend(v26, "initWithMetrics:predicate:timeFilter:limitCount:offsetCount:", v25, v27, v30, 3000, 0);

  v106 = (void *)objc_claimAutoreleasedReturnValue(+[NSMutableArray array](NSMutableArray, "array"));
  if (v32)
  {
    v112 = 0;
    v33 = PerfPowerServicesGetData(v32, &v112);
    v34 = (void *)objc_claimAutoreleasedReturnValue(v33);
    v35 = v112;
    v103 = v35;
    if (v35)
    {
      v36 = v35;
      v37 = qword_1000351B8;
      if (os_log_type_enabled((os_log_t)qword_1000351B8, OS_LOG_TYPE_DEFAULT))
      {
        *(_DWORD *)buf = 138412290;
        v116 = v36;
        _os_log_impl((void *)&_mh_execute_header, v37, OS_LOG_TYPE_DEFAULT, "Error from PPSGetData %@", buf, 0xCu);
      }
      v38 = (id)objc_claimAutoreleasedReturnValue(+[NSNull null](NSNull, "null", v91));
      v39 = &AnalyticsSendEventLazy_ptr;
    }
    else
    {
      v97 = v32;
      obja = (id)v25;
      v94 = v34;
      v110 = 0u;
      v111 = 0u;
      v108 = 0u;
      v109 = 0u;
      v41 = v34;
      v42 = objc_msgSend(v41, "countByEnumeratingWithState:objects:count:", &v108, buf, 16);
      if (v42)
      {
        v43 = v42;
        v44 = 0;
        v45 = *(_QWORD *)v109;
        do
        {
          v46 = 0;
          v47 = v44;
          do
          {
            if (*(_QWORD *)v109 != v45)
              objc_enumerationMutation(v41);
            v48 = *(void **)(*((_QWORD *)&v108 + 1) + 8 * (_QWORD)v46);
            v49 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v48, "metricKeysAndValues", v91));
            v50 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v49, "objectForKeyedSubscript:", CFSTR("VacVoltageLimit")));
            v44 = objc_msgSend(v50, "intValue");

            if (v47 != v44)
            {
              v51 = (void *)objc_claimAutoreleasedReturnValue(+[NSMutableDictionary dictionary](NSMutableDictionary, "dictionary"));
              v52 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v49, "objectForKeyedSubscript:", CFSTR("VacVoltageLimit")));
              objc_msgSend(v51, "setObject:forKeyedSubscript:", v52, CFSTR("VacVoltageLimit"));

              objc_msgSend(v48, "epochTimestamp");
              v53 = (void *)objc_claimAutoreleasedReturnValue(+[NSNumber numberWithDouble:](NSNumber, "numberWithDouble:"));
              objc_msgSend(v51, "setObject:forKeyedSubscript:", v53, CFSTR("Timestamp"));

              objc_msgSend(v106, "addObject:", v51);
            }

            v46 = (char *)v46 + 1;
            v47 = v44;
          }
          while (v43 != v46);
          v43 = objc_msgSend(v41, "countByEnumeratingWithState:objects:count:", &v108, buf, 16);
        }
        while (v43);
      }

      v38 = v106;
      v34 = v94;
      v39 = &AnalyticsSendEventLazy_ptr;
      v32 = v97;
      v31 = obja;
    }

  }
  else
  {
    v40 = qword_1000351B8;
    if (os_log_type_enabled((os_log_t)qword_1000351B8, OS_LOG_TYPE_DEFAULT))
    {
      *(_WORD *)buf = 0;
      _os_log_impl((void *)&_mh_execute_header, v40, OS_LOG_TYPE_DEFAULT, "Failed to allocated PPS request object", buf, 2u);
    }
    v38 = (id)objc_claimAutoreleasedReturnValue(+[NSNull null](NSNull, "null", v91));
    v39 = &AnalyticsSendEventLazy_ptr;
  }

  v54 = *(_QWORD *)(a1 + 32);
  v55 = *(void **)(v54 + 32);
  *(_QWORD *)(v54 + 32) = v38;

  v56 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v39[50], "setWithArray:", &off_10002EF78));
  if (*(double *)&qword_1000351C8 == 0.0)
  {
    v57 = qword_1000351B8;
    if (os_log_type_enabled((os_log_t)qword_1000351B8, OS_LOG_TYPE_DEFAULT))
    {
      *(_WORD *)buf = 0;
      _os_log_impl((void *)&_mh_execute_header, v57, OS_LOG_TYPE_DEFAULT, "We need a valid SBC data timestamp to proceed", buf, 2u);
    }
    v58 = (id)objc_claimAutoreleasedReturnValue(+[NSNull null](NSNull, "null", v91));
  }
  else
  {
    objb = v56;
    v59 = objc_alloc((Class)PPSTimeSeriesRequest);
    v60 = (void *)objc_claimAutoreleasedReturnValue(+[NSPredicate predicateWithFormat:](NSPredicate, "predicateWithFormat:", CFSTR("(subsystem == 'BatteryDataCollection' AND category == 'BDC_Daily')")));
    v61 = (void *)objc_claimAutoreleasedReturnValue(+[NSDate dateWithTimeIntervalSince1970:](NSDate, "dateWithTimeIntervalSince1970:", *(double *)&qword_1000351C8));
    v62 = (void *)objc_claimAutoreleasedReturnValue(+[NSDate dateWithTimeInterval:sinceDate:](NSDate, "dateWithTimeInterval:sinceDate:", v61, 604800.0));
    v63 = (void *)objc_claimAutoreleasedReturnValue(+[NSDate dateWithTimeInterval:sinceDate:](NSDate, "dateWithTimeInterval:sinceDate:", v61, -604800.0));
    v64 = objc_msgSend(objc_alloc((Class)NSDateInterval), "initWithStartDate:endDate:", v63, v62);

    v65 = v59;
    v56 = objb;
    v66 = objc_msgSend(v65, "initWithMetrics:predicate:timeFilter:limitCount:offsetCount:", objb, v60, v64, 50, 0);

    v107 = (void *)objc_claimAutoreleasedReturnValue(+[NSMutableArray array](NSMutableArray, "array"));
    if (v66)
    {
      v112 = 0;
      v67 = PerfPowerServicesGetData(v66, &v112);
      v68 = (void *)objc_claimAutoreleasedReturnValue(v67);
      v69 = v112;
      if (v69)
      {
        v70 = qword_1000351B8;
        if (os_log_type_enabled((os_log_t)qword_1000351B8, OS_LOG_TYPE_DEFAULT))
        {
          *(_DWORD *)buf = 138412290;
          v116 = v69;
          _os_log_impl((void *)&_mh_execute_header, v70, OS_LOG_TYPE_DEFAULT, "Error from PPSGetData %@", buf, 0xCu);
        }
        v58 = (id)objc_claimAutoreleasedReturnValue(+[NSNull null](NSNull, "null", v91));
      }
      else
      {
        v92 = a1;
        v95 = v68;
        v98 = v66;
        v110 = 0u;
        v111 = 0u;
        v108 = 0u;
        v109 = 0u;
        v104 = v68;
        v72 = objc_msgSend(v104, "countByEnumeratingWithState:objects:count:", &v108, buf, 16);
        if (v72)
        {
          v73 = v72;
          v74 = *(_QWORD *)v109;
          do
          {
            for (j = 0; j != v73; j = (char *)j + 1)
            {
              if (*(_QWORD *)v109 != v74)
                objc_enumerationMutation(v104);
              v76 = *(void **)(*((_QWORD *)&v108 + 1) + 8 * (_QWORD)j);
              v77 = (void *)objc_claimAutoreleasedReturnValue(+[NSMutableDictionary dictionary](NSMutableDictionary, "dictionary", v91));
              v78 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v76, "metricKeysAndValues"));
              v79 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v78, "objectForKeyedSubscript:", CFSTR("TimeAtHighSoc")));
              objc_msgSend(v77, "setObject:forKeyedSubscript:", v79, CFSTR("TimeAtHighSoc"));

              v80 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v78, "objectForKeyedSubscript:", CFSTR("CycleCount")));
              objc_msgSend(v77, "setObject:forKeyedSubscript:", v80, CFSTR("CycleCount"));

              objc_msgSend(v76, "epochTimestamp");
              v81 = (void *)objc_claimAutoreleasedReturnValue(+[NSNumber numberWithDouble:](NSNumber, "numberWithDouble:"));
              objc_msgSend(v77, "setObject:forKeyedSubscript:", v81, CFSTR("Timestamp"));

              objc_msgSend(v107, "addObject:", v77);
            }
            v73 = objc_msgSend(v104, "countByEnumeratingWithState:objects:count:", &v108, buf, 16);
          }
          while (v73);
        }

        v58 = v107;
        a1 = v92;
        v68 = v95;
        v66 = v98;
        v56 = objb;
        v69 = 0;
      }

    }
    else
    {
      v71 = qword_1000351B8;
      if (os_log_type_enabled((os_log_t)qword_1000351B8, OS_LOG_TYPE_DEFAULT))
      {
        *(_WORD *)buf = 0;
        _os_log_impl((void *)&_mh_execute_header, v71, OS_LOG_TYPE_DEFAULT, "Failed to allocated PPS request object", buf, 2u);
      }
      v58 = (id)objc_claimAutoreleasedReturnValue(+[NSNull null](NSNull, "null", v91));
    }

  }
  v82 = *(_QWORD *)(a1 + 32);
  v83 = *(void **)(v82 + 40);
  *(_QWORD *)(v82 + 40) = v58;

  v113[0] = CFSTR("sbcStreamData");
  v84 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(*(id *)(a1 + 32), "sbcData"));
  v114[0] = v84;
  v113[1] = CFSTR("obcStreamData");
  v85 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(*(id *)(a1 + 32), "obcData"));
  v114[1] = v85;
  v113[2] = CFSTR("dailyStreamData");
  v86 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(*(id *)(a1 + 32), "dailyData"));
  v114[2] = v86;
  v113[3] = CFSTR("smcData");
  v87 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(*(id *)(a1 + 32), "smcKeys"));
  v114[3] = v87;
  v88 = objc_claimAutoreleasedReturnValue(+[NSDictionary dictionaryWithObjects:forKeys:count:](NSDictionary, "dictionaryWithObjects:forKeys:count:", v114, v113, 4));
  v89 = *(_QWORD *)(a1 + 32);
  v90 = *(void **)(v89 + 64);
  *(_QWORD *)(v89 + 64) = v88;

}

void sub_100004F98(uint64_t a1)
{
  id v1;
  void *v2;

  v1 = objc_alloc_init(*(Class *)(a1 + 32));
  v2 = (void *)qword_1000351D0;
  qword_1000351D0 = (uint64_t)v1;

}

void sub_1000068FC(void *a1, uint64_t a2, uint64_t a3, const char *a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint8_t a9)
{
  NSObject *v9;

  _os_log_error_impl(a1, v9, OS_LOG_TYPE_ERROR, a4, &a9, 0xCu);
}

void sub_100006928(void *a1, NSObject *a2, uint64_t a3, const char *a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint8_t a9)
{
  _os_log_debug_impl(a1, a2, OS_LOG_TYPE_DEBUG, a4, &a9, 0xCu);
}

id sub_100006938(id a1)
{
  return a1;
}

uint64_t sub_100006940()
{
  uint64_t v0;

  return v0;
}

void sub_1000069C8(uint64_t a1)
{
  id v1;
  void *v2;

  v1 = objc_alloc_init(*(Class *)(a1 + 32));
  v2 = (void *)qword_1000351E0;
  qword_1000351E0 = (uint64_t)v1;

}

void sub_100007C2C(void *a1, NSObject *a2, uint64_t a3, const char *a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint8_t a9)
{
  _os_log_error_impl(a1, a2, OS_LOG_TYPE_ERROR, a4, &a9, 2u);
}

void sub_100007C3C(void *a1, NSObject *a2, uint64_t a3, const char *a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint8_t a9)
{
  _os_log_error_impl(a1, a2, OS_LOG_TYPE_ERROR, a4, &a9, 0xCu);
}

void sub_100007CD4(uint64_t a1)
{
  id v1;
  void *v2;

  v1 = objc_alloc_init(*(Class *)(a1 + 32));
  v2 = (void *)qword_1000351F8;
  qword_1000351F8 = (uint64_t)v1;

}

void sub_100009448(uint64_t a1)
{
  id v1;
  void *v2;

  v1 = objc_alloc_init(*(Class *)(a1 + 32));
  v2 = (void *)qword_100035208;
  qword_100035208 = (uint64_t)v1;

}

void sub_10000A6B8(void *a1, NSObject *a2, uint64_t a3, const char *a4, uint8_t *a5)
{
  _os_log_debug_impl(a1, a2, OS_LOG_TYPE_DEBUG, a4, a5, 2u);
}

int64_t sub_10000AD84(id a1, NSURL *a2, NSURL *a3)
{
  NSURL *v4;
  id v5;
  id v6;
  uint64_t v8;
  id v9;

  v9 = 0;
  v4 = a3;
  -[NSURL getResourceValue:forKey:error:](a2, "getResourceValue:forKey:error:", &v9, NSURLCreationDateKey, 0);
  v8 = 0;
  v5 = v9;
  -[NSURL getResourceValue:forKey:error:](v4, "getResourceValue:forKey:error:", &v8, NSURLCreationDateKey, 0);

  v6 = objc_msgSend(v5, "compare:", v8);
  return (int64_t)v6;
}

id sub_10000BD58(void *a1, void *a2, uint64_t a3, void *a4)
{
  id v7;
  id v8;
  id v9;
  id v10;
  void *v11;
  void *v12;
  void *v13;
  uint64_t v14;
  void *v15;
  void *v16;
  id v17;
  void *v18;
  uint64_t Data;
  void *v20;
  id v21;
  void *v22;
  id v24;
  uint8_t buf[4];
  void *v26;
  __int16 v27;
  void *v28;
  _QWORD v29[2];

  v7 = a1;
  v8 = a2;
  v9 = a4;
  v10 = v8;
  v11 = (void *)objc_claimAutoreleasedReturnValue(+[NSPredicate predicateWithFormat:](NSPredicate, "predicateWithFormat:", CFSTR("(subsystem == 'BatteryIntelligence' AND category == 'BatteryHealthDelta' AND model_name == %@ AND prediction_duration == %@)"), v7, a3));
  if (v9)
  {
    v12 = (void *)objc_claimAutoreleasedReturnValue(+[NSPredicate predicateWithFormat:](NSPredicate, "predicateWithFormat:", CFSTR("prediction_output_name == %@ "), v9));
    v29[0] = v11;
    v29[1] = v12;
    v13 = (void *)objc_claimAutoreleasedReturnValue(+[NSArray arrayWithObjects:count:](NSArray, "arrayWithObjects:count:", v29, 2));
    v14 = objc_claimAutoreleasedReturnValue(+[NSCompoundPredicate andPredicateWithSubpredicates:](NSCompoundPredicate, "andPredicateWithSubpredicates:", v13));

    v11 = (void *)v14;
  }
  if (os_log_type_enabled((os_log_t)&_os_log_default, OS_LOG_TYPE_DEBUG))
    sub_10001E4EC();
  if (os_log_type_enabled((os_log_t)&_os_log_default, OS_LOG_TYPE_INFO))
  {
    v15 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v10, "startDate"));
    v16 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v10, "endDate"));
    *(_DWORD *)buf = 138412546;
    v26 = v15;
    v27 = 2112;
    v28 = v16;
    _os_log_impl((void *)&_mh_execute_header, (os_log_t)&_os_log_default, OS_LOG_TYPE_INFO, "Fetching past predictions in range %@ - %@", buf, 0x16u);

  }
  v17 = objc_msgSend(objc_alloc((Class)PPSTimeSeriesRequest), "initWithMetrics:predicate:timeFilter:limitCount:offsetCount:", 0, v11, v10, 100, 0);
  v18 = v17;
  if (v17)
  {
    v24 = 0;
    Data = PerfPowerServicesGetData(v17, &v24);
    v20 = (void *)objc_claimAutoreleasedReturnValue(Data);
    v21 = v24;
    if (v21)
    {
      if (os_log_type_enabled((os_log_t)&_os_log_default, OS_LOG_TYPE_ERROR))
        sub_10001E484();
LABEL_21:
      v22 = 0;
      goto LABEL_22;
    }
    if (os_log_type_enabled((os_log_t)&_os_log_default, OS_LOG_TYPE_DEBUG))
      sub_10001E41C();
    if (os_log_type_enabled((os_log_t)&_os_log_default, OS_LOG_TYPE_DEBUG))
    {
      sub_10001E3B0(v20);
      if (v20)
      {
LABEL_16:
        if (objc_msgSend(v20, "count"))
        {
          v22 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v20, "array"));
LABEL_22:

          goto LABEL_23;
        }
      }
    }
    else if (v20)
    {
      goto LABEL_16;
    }
    if (os_log_type_enabled((os_log_t)&_os_log_default, OS_LOG_TYPE_ERROR))
      sub_10001E2E0((uint64_t)v7, v10);
    goto LABEL_21;
  }
  v22 = 0;
LABEL_23:

  return v22;
}

void sub_10000CCF8(uint64_t a1)
{
  id v1;
  void *v2;

  v1 = objc_alloc_init((Class)objc_opt_class(*(_QWORD *)(a1 + 32)));
  v2 = (void *)qword_100035220;
  qword_100035220 = (uint64_t)v1;

}

void sub_10000D140(_Unwind_Exception *a1, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, uint64_t a13, uint64_t a14, id location)
{
  id *v15;

  objc_destroyWeak(v15);
  objc_destroyWeak(&location);
  _Unwind_Resume(a1);
}

void sub_10000D15C(uint64_t a1, void *a2)
{
  id v3;
  id v4;
  id v5;
  NSObject *v6;
  id to;

  v3 = a2;
  objc_copyWeak(&to, (id *)(a1 + 32));
  v4 = objc_loadWeakRetained(&to);

  if (v3 && v4)
  {
    v5 = objc_loadWeakRetained(&to);
    v6 = objc_claimAutoreleasedReturnValue(objc_msgSend(v5, "log"));

    if (os_log_type_enabled(v6, OS_LOG_TYPE_ERROR))
      sub_10001E63C((uint64_t)v3, v6);

  }
  objc_destroyWeak(&to);

}

void sub_10000D200(_Unwind_Exception *a1, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, id location)
{
  objc_destroyWeak(&location);
  _Unwind_Resume(a1);
}

void sub_10000F708(void *a1, NSObject *a2, uint64_t a3, const char *a4, uint8_t *a5)
{
  _os_log_error_impl(a1, a2, OS_LOG_TYPE_ERROR, a4, a5, 0xCu);
}

void sub_10000F714(void *a1, NSObject *a2, uint64_t a3, const char *a4, uint8_t *a5)
{
  _os_log_error_impl(a1, a2, OS_LOG_TYPE_ERROR, a4, a5, 0x16u);
}

void start()
{
  unsigned int v0;
  void *v1;
  char *v2;
  uint64_t v3;
  void *v4;
  int v5;
  NSObject *v6;
  const char *v7;
  int v8;
  NSObject *v9;
  const char *v10;
  int v11;
  NSObject *v12;
  const char *v13;
  int v14;
  NSObject *v15;
  const char *v16;
  int v17;
  NSObject *v18;
  const char *v19;
  void *v20;
  int v21;
  _QWORD handler[4];
  char v23;
  uint8_t buf[4];
  const char *v25;

  if ((_set_user_dir_suffix("com.apple.batteryintelligenced") & 1) != 0)
  {
    v0 = +[BIMGUtility isiPhone](BIMGUtility, "isiPhone");
    v1 = objc_autoreleasePoolPush();
    v2 = sub_10001714C("main");
    v3 = objc_claimAutoreleasedReturnValue(v2);
    v4 = (void *)qword_100035238;
    qword_100035238 = v3;

    xpc_set_event_stream_handler("com.apple.notifyd.matching", (dispatch_queue_t)&_dispatch_main_q, &stru_10002C698);
    v5 = _os_feature_enabled_impl("batteryintelligence", "AllTasks");
    byte_100035241 = v5;
    v6 = qword_100035238;
    if (os_log_type_enabled((os_log_t)qword_100035238, OS_LOG_TYPE_INFO))
    {
      if (v5)
        v7 = "Enabled";
      else
        v7 = "Disabled";
      *(_DWORD *)buf = 136315138;
      v25 = v7;
      _os_log_impl((void *)&_mh_execute_header, v6, OS_LOG_TYPE_INFO, "FF: AllTasks %s", buf, 0xCu);
    }
    v8 = _os_feature_enabled_impl("batteryintelligence", "AppleSoftGaugingAllAlgorithms");
    byte_100035242 = v8;
    v9 = qword_100035238;
    if (os_log_type_enabled((os_log_t)qword_100035238, OS_LOG_TYPE_INFO))
    {
      if (v8)
        v10 = "Enabled";
      else
        v10 = "Disabled";
      *(_DWORD *)buf = 136315138;
      v25 = v10;
      _os_log_impl((void *)&_mh_execute_header, v9, OS_LOG_TYPE_INFO, "FF: AppleSoftGaugingAllAlgorithms %s", buf, 0xCu);
    }
    v11 = _os_feature_enabled_impl("batteryintelligence", "BatteryHealthForecastModel");
    byte_100035243 = v11;
    v12 = qword_100035238;
    if (os_log_type_enabled((os_log_t)qword_100035238, OS_LOG_TYPE_INFO))
    {
      if (v11)
        v13 = "Enabled";
      else
        v13 = "Disabled";
      *(_DWORD *)buf = 136315138;
      v25 = v13;
      _os_log_impl((void *)&_mh_execute_header, v12, OS_LOG_TYPE_INFO, "FF: BatteryHealthForecastModel %s", buf, 0xCu);
    }
    v14 = _os_feature_enabled_impl("batteryintelligence", "OCVDriftModel");
    byte_100035244 = v14;
    v15 = qword_100035238;
    if (os_log_type_enabled((os_log_t)qword_100035238, OS_LOG_TYPE_INFO))
    {
      if (v14)
        v16 = "Enabled";
      else
        v16 = "Disabled";
      *(_DWORD *)buf = 136315138;
      v25 = v16;
      _os_log_impl((void *)&_mh_execute_header, v15, OS_LOG_TYPE_INFO, "FF: OCVDriftModel %s", buf, 0xCu);
    }
    v17 = _os_feature_enabled_impl("batteryintelligence", "TimeTo80EstimatorModel");
    byte_100035240 = v17;
    v18 = qword_100035238;
    if (os_log_type_enabled((os_log_t)qword_100035238, OS_LOG_TYPE_INFO))
    {
      if (v17)
        v19 = "Enabled";
      else
        v19 = "Disabled";
      *(_DWORD *)buf = 136315138;
      v25 = v19;
      _os_log_impl((void *)&_mh_execute_header, v18, OS_LOG_TYPE_INFO, "FF: TimeTo80EstimatorModel %s", buf, 0xCu);
    }
    xpc_set_event_stream_handler("com.apple.alarm", (dispatch_queue_t)&_dispatch_main_q, &stru_10002C6B8);

    if (v0 && byte_100035240)
    {
      if (byte_100035241)
      {
        v20 = (void *)objc_claimAutoreleasedReturnValue(+[TimeTo80Listener sharedInstance](TimeTo80Listener, "sharedInstance"));
        objc_msgSend(v20, "setupConnectionListenerForTT80");

      }
    }
    handler[0] = _NSConcreteStackBlock;
    handler[1] = 3221225472;
    handler[2] = sub_10000FD40;
    handler[3] = &unk_10002C6D8;
    v23 = v0;
    xpc_activity_register("com.apple.batteryintelligenced.dailytask", XPC_ACTIVITY_CHECK_IN, handler);
    objc_autoreleasePoolPop(v1);
    CFRunLoopRun();
  }
  else if (os_log_type_enabled((os_log_t)&_os_log_default, OS_LOG_TYPE_ERROR))
  {
    v21 = *__error();
    *(_DWORD *)buf = 67109120;
    LODWORD(v25) = v21;
    _os_log_error_impl((void *)&_mh_execute_header, (os_log_t)&_os_log_default, OS_LOG_TYPE_ERROR, "Failed to set tmp dir suffix: %{darwin.errno}d", buf, 8u);
  }
  exit(1);
}

void sub_10000FAF4(id a1, OS_xpc_object *a2)
{
  OS_xpc_object *v2;
  __CFString *v3;
  NSObject *v4;
  NSObject *v5;
  void *v6;
  NSObject *v7;
  void *v8;
  NSObject *v9;
  int v10;
  const __CFString *v11;

  v2 = a2;
  if (v2)
  {
    v3 = (__CFString *)objc_claimAutoreleasedReturnValue(+[BIXPCAlarm getNameForEvent:](BIXPCAlarm, "getNameForEvent:", v2));
    v4 = qword_100035238;
    if (os_log_type_enabled((os_log_t)qword_100035238, OS_LOG_TYPE_DEFAULT))
    {
      v10 = 138412290;
      v11 = v3;
      _os_log_impl((void *)&_mh_execute_header, v4, OS_LOG_TYPE_DEFAULT, "XPC alarm triggered for %@", (uint8_t *)&v10, 0xCu);
    }
    if (-[__CFString isEqualToString:](v3, "isEqualToString:", CFSTR("tt80RunAtPlugin")))
    {
      +[BIXPCAlarm handleAlarmForEvent:](BIXPCAlarm, "handleAlarmForEvent:", v2);
      v5 = qword_100035238;
      if (os_log_type_enabled((os_log_t)qword_100035238, OS_LOG_TYPE_DEFAULT))
      {
        v10 = 138412290;
        v11 = CFSTR("tt80RunAtPlugin");
        _os_log_impl((void *)&_mh_execute_header, v5, OS_LOG_TYPE_DEFAULT, "Acknowledged %@", (uint8_t *)&v10, 0xCu);
      }
      v6 = (void *)objc_claimAutoreleasedReturnValue(+[TimeTo80Listener sharedInstance](TimeTo80Listener, "sharedInstance"));
      objc_msgSend(v6, "runTT80ModelwithParams:andSetupNextAlarm:", &off_10002FC08, 1);

    }
    if (-[__CFString isEqualToString:](v3, "isEqualToString:", CFSTR("tt80RunDuringChargingSession")))
    {
      +[BIXPCAlarm handleAlarmForEvent:](BIXPCAlarm, "handleAlarmForEvent:", v2);
      v7 = qword_100035238;
      if (os_log_type_enabled((os_log_t)qword_100035238, OS_LOG_TYPE_DEFAULT))
      {
        v10 = 138412290;
        v11 = CFSTR("tt80RunDuringChargingSession");
        _os_log_impl((void *)&_mh_execute_header, v7, OS_LOG_TYPE_DEFAULT, "Acknowledged %@", (uint8_t *)&v10, 0xCu);
      }
      v8 = (void *)objc_claimAutoreleasedReturnValue(+[TimeTo80Listener sharedInstance](TimeTo80Listener, "sharedInstance"));
      objc_msgSend(v8, "runTT80ModelwithParams:andSetupNextAlarm:", &off_10002FC30, 0);

    }
  }
  else
  {
    v9 = qword_100035238;
    if (os_log_type_enabled((os_log_t)qword_100035238, OS_LOG_TYPE_DEFAULT))
    {
      LOWORD(v10) = 0;
      _os_log_impl((void *)&_mh_execute_header, v9, OS_LOG_TYPE_DEFAULT, "xpc_object event is nil", (uint8_t *)&v10, 2u);
    }
  }

}

void sub_10000FD40(uint64_t a1, void *a2)
{
  _xpc_activity_s *v3;
  void *v4;
  xpc_activity_state_t state;
  NSObject *v6;
  const char *v7;
  uint8_t *v8;
  NSObject *v9;
  void *v10;
  NSObject *v11;
  uint64_t v12;
  uint64_t v13;
  uint64_t v14;
  uint64_t v15;
  uint64_t v16;
  uint64_t v17;
  uint64_t v18;
  void *v19;
  void *v20;
  void *v21;
  void *v22;
  void *v23;
  NSObject *v24;
  uint64_t v25;
  uint64_t v26;
  uint64_t v27;
  uint64_t v28;
  uint64_t v29;
  uint64_t v30;
  uint64_t v31;
  void *v32;
  void *v33;
  void *v34;
  NSObject *v35;
  NSObject *v36;
  uint8_t v37[16];
  uint8_t v38[16];
  uint8_t buf[2];
  uint8_t v40[16];
  __int16 v41;

  v3 = a2;
  v4 = objc_autoreleasePoolPush();
  state = xpc_activity_get_state(v3);
  if (state == 2)
  {
    v9 = qword_100035238;
    if (os_log_type_enabled((os_log_t)qword_100035238, OS_LOG_TYPE_DEFAULT))
    {
      *(_WORD *)v38 = 0;
      _os_log_impl((void *)&_mh_execute_header, v9, OS_LOG_TYPE_DEFAULT, "Activity run!", v38, 2u);
    }
    if (*(_BYTE *)(a1 + 32))
    {
      if (!byte_100035241)
      {
        v6 = qword_100035238;
        if (!os_log_type_enabled((os_log_t)qword_100035238, OS_LOG_TYPE_DEFAULT))
          goto LABEL_29;
        v41 = 0;
        v7 = "All tasks disabled!";
        v8 = (uint8_t *)&v41;
        goto LABEL_5;
      }
      if (byte_100035243)
      {
        v10 = (void *)objc_claimAutoreleasedReturnValue(+[NSUserDefaults standardUserDefaults](NSUserDefaults, "standardUserDefaults"));
        if (!v10)
        {
          v11 = qword_100035238;
          if (os_log_type_enabled((os_log_t)qword_100035238, OS_LOG_TYPE_ERROR))
            sub_10001EAE8(v11, v12, v13, v14, v15, v16, v17, v18);
        }
        v19 = (void *)objc_claimAutoreleasedReturnValue(+[NSString stringWithUTF8String:](NSString, "stringWithUTF8String:", "OverrideParams"));
        v20 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v10, "objectForKey:", v19));

        v21 = (void *)objc_claimAutoreleasedReturnValue(+[CombinedHealthSequencePredictor sharedPredictor](CombinedHealthSequencePredictor, "sharedPredictor"));
        objc_msgSend(v21, "predictAndRecordWithParams:", v20);

        v22 = (void *)objc_claimAutoreleasedReturnValue(+[HealthStateEstimationPredictor sharedPredictor](HealthStateEstimationPredictor, "sharedPredictor"));
        objc_msgSend(v22, "predictAndRecordWithParams:", v20);

      }
      if (byte_100035244)
      {
        v23 = (void *)objc_claimAutoreleasedReturnValue(+[NSUserDefaults standardUserDefaults](NSUserDefaults, "standardUserDefaults"));
        if (!v23)
        {
          v24 = qword_100035238;
          if (os_log_type_enabled((os_log_t)qword_100035238, OS_LOG_TYPE_ERROR))
            sub_10001EAE8(v24, v25, v26, v27, v28, v29, v30, v31);
        }
        v32 = (void *)objc_claimAutoreleasedReturnValue(+[NSString stringWithUTF8String:](NSString, "stringWithUTF8String:", "OverrideParams"));
        v33 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v23, "objectForKey:", v32));

        v34 = (void *)objc_claimAutoreleasedReturnValue(+[OcvDriftEstimator sharedPredictor](OcvDriftEstimator, "sharedPredictor"));
        objc_msgSend(v34, "predictAndRecordWithParams:", v33);

      }
      if (byte_100035242)
      {
        v35 = qword_100035238;
        if (os_log_type_enabled((os_log_t)qword_100035238, OS_LOG_TYPE_DEFAULT))
        {
          *(_WORD *)v40 = 0;
          _os_log_impl((void *)&_mh_execute_header, v35, OS_LOG_TYPE_DEFAULT, "ASG enabled!", v40, 2u);
        }
        sub_100014D50();
      }
    }
    else
    {
      v36 = qword_100035238;
      if (os_log_type_enabled((os_log_t)qword_100035238, OS_LOG_TYPE_DEFAULT))
      {
        *(_WORD *)v37 = 0;
        _os_log_impl((void *)&_mh_execute_header, v36, OS_LOG_TYPE_DEFAULT, "Unregistering activity since this is not an iPhone!", v37, 2u);
      }
      xpc_activity_unregister("com.apple.batteryintelligenced.dailytask");
    }
  }
  else if (!state)
  {
    v6 = qword_100035238;
    if (os_log_type_enabled((os_log_t)qword_100035238, OS_LOG_TYPE_DEFAULT))
    {
      *(_WORD *)buf = 0;
      v7 = "Activity check-in!";
      v8 = buf;
LABEL_5:
      _os_log_impl((void *)&_mh_execute_header, v6, OS_LOG_TYPE_DEFAULT, v7, v8, 2u);
    }
  }
LABEL_29:
  objc_autoreleasePoolPop(v4);

}

void sub_1000100A8(id a1)
{
  BIFeatures *v1;
  void *v2;

  v1 = objc_alloc_init(BIFeatures);
  v2 = (void *)qword_100035248;
  qword_100035248 = (uint64_t)v1;

}

NSString *__cdecl sub_10001032C(id a1, NSNumber *a2)
{
  NSNumber *v2;
  uint64_t v3;
  void *v4;
  void *v5;

  v2 = a2;
  if (-[NSNumber unsignedIntValue](v2, "unsignedIntValue") <= 0x63)
    v3 = 10 * (-[NSNumber unsignedIntValue](v2, "unsignedIntValue") / 0xA);
  else
    v3 = 90;
  v4 = (void *)objc_claimAutoreleasedReturnValue(+[NSNumber numberWithUnsignedInt:](NSNumber, "numberWithUnsignedInt:", v3));
  v5 = (void *)objc_claimAutoreleasedReturnValue(+[NSString stringWithFormat:](NSString, "stringWithFormat:", CFSTR("%@s"), v4));

  return (NSString *)v5;
}

NSString *__cdecl sub_1000103D0(id a1, NSNumber *a2)
{
  float v2;
  float v3;
  __CFString *v4;
  unsigned int v5;
  float v6;
  unsigned int v7;
  uint64_t v8;
  void *v9;

  -[NSNumber floatValue](a2, "floatValue");
  v3 = v2 / 100.0;
  if (v3 <= 20.0)
  {
    v4 = CFSTR("LT20t");
  }
  else if (v3 <= 40.0)
  {
    v5 = 2 * (float)(v3 * 0.5);
    v6 = floorf(v3);
    if (((int)v6 & 1) != 0)
      v7 = 2 * (float)(v3 * 0.5);
    else
      v7 = v5 - 2;
    if (v6 == v3)
      v8 = v7;
    else
      v8 = v5;
    v9 = (void *)objc_claimAutoreleasedReturnValue(+[NSNumber numberWithUnsignedInt:](NSNumber, "numberWithUnsignedInt:", v8));
    v4 = (__CFString *)objc_claimAutoreleasedReturnValue(+[NSString stringWithFormat:](NSString, "stringWithFormat:", CFSTR("%@t"), v9));

  }
  else
  {
    v4 = CFSTR("GT40t");
  }
  return (NSString *)v4;
}

NSString *__cdecl sub_1000104A4(id a1, NSNumber *a2)
{
  float v2;
  unsigned int v4;
  float v5;
  _BOOL4 v7;

  -[NSNumber floatValue](a2, "floatValue");
  if (v2 <= -0.5)
    return (NSString *)CFSTR("LT-5c");
  if (v2 > 0.5)
    return (NSString *)CFSTR("GT5c");
  v4 = vcvtps_s32_f32((float)(v2 + -0.1) * 10.0);
  v5 = v2 * 10.0;
  v7 = floorf(v5) == v5 && v4 == (int)v5;
  return (NSString *)(id)objc_claimAutoreleasedReturnValue(+[NSString stringWithFormat:](NSString, "stringWithFormat:", CFSTR("%d%c"), v4 - v7, 99));
}

id sub_1000106F8(uint64_t a1)
{
  void *v2;
  id v3;
  void *v4;

  v2 = (void *)objc_claimAutoreleasedReturnValue(+[BDCSchema sharedBDCSchema](BDCSchema, "sharedBDCSchema"));
  dword_100035260 = objc_msgSend(v2, "columnIndexForColumnName:atVersion:", CFSTR("timestamp"), *(_QWORD *)(a1 + 32));

  v3 = objc_alloc_init((Class)NSDateFormatter);
  v4 = (void *)qword_100035268;
  qword_100035268 = (uint64_t)v3;

  return objc_msgSend((id)qword_100035268, "setDateFormat:", CFSTR("yyyy-MM-dd HH:mm:ss"));
}

void sub_100011894(_Unwind_Exception *a1)
{
  uint64_t v1;

  _Block_object_dispose((const void *)(v1 - 288), 8);
  _Unwind_Resume(a1);
}

void sub_1000118D8(uint64_t a1)
{
  uint64_t v2;
  unint64_t v3;

  bzero(*(void **)(*(_QWORD *)(*(_QWORD *)(a1 + 32) + 8) + 24), *(_QWORD *)(a1 + 40));
  if (*(_DWORD *)(a1 + 48))
  {
    v2 = 0;
    v3 = 0;
    do
    {
      *(_DWORD *)(*(_QWORD *)(*(_QWORD *)(*(_QWORD *)(a1 + 32) + 8) + 24) + v2 + 4) = 0x80000000;
      *(_DWORD *)(*(_QWORD *)(*(_QWORD *)(*(_QWORD *)(a1 + 32) + 8) + 24) + v2 + 8) = 0x7FFFFFFF;
      ++v3;
      v2 += 20;
    }
    while (v3 < *(unsigned int *)(a1 + 48));
  }
}

uint64_t sub_100011A78(uint64_t result, uint64_t a2)
{
  *(_QWORD *)(result + 40) = *(_QWORD *)(a2 + 40);
  *(_QWORD *)(a2 + 40) = 0;
  return result;
}

void sub_100011A88(uint64_t a1)
{

}

void sub_100011A90(uint64_t a1)
{
  id v2;
  uint64_t v3;
  void *v4;

  v2 = objc_msgSend(*(id *)(a1 + 32), "_copyHistogramsOfTypes:withBinners:withParams:", *(_QWORD *)(a1 + 40), *(_QWORD *)(a1 + 48), *(_QWORD *)(a1 + 56));
  v3 = *(_QWORD *)(*(_QWORD *)(a1 + 64) + 8);
  v4 = *(void **)(v3 + 40);
  *(_QWORD *)(v3 + 40) = v2;

}

void sub_100012490(uint64_t a1, void *a2)
{
  id v3;
  id v4;
  __int128 v5;
  id v6;
  void *i;
  void *v8;
  void *v9;
  _UNKNOWN **v10;
  NSObject *v11;
  void *v12;
  void *v13;
  void *v14;
  void *v15;
  unsigned __int8 v16;
  id v17;
  void *v18;
  void *v19;
  void *v20;
  void *v21;
  id v22;
  NSObject *v23;
  id v24;
  void *v25;
  id v26;
  id v27;
  id v28;
  uint64_t v29;
  void *v30;
  void *v31;
  uint64_t v32;
  void *v33;
  unsigned __int8 v34;
  NSObject *v35;
  void *v36;
  id v37;
  void *v38;
  id v39;
  id v40;
  uint64_t v41;
  void *v42;
  void *v43;
  void *v44;
  float v45;
  double v46;
  void *v47;
  NSObject *v48;
  NSObject *v49;
  NSObject *v50;
  NSObject *v51;
  unsigned int v52;
  NSObject *v53;
  unsigned int v54;
  __int128 v55;
  id v56;
  uint64_t v57;
  id v58;
  void *v59;
  id v60;
  __int128 v61;
  __int128 v62;
  __int128 v63;
  __int128 v64;
  id v65;
  __int128 v66;
  __int128 v67;
  __int128 v68;
  __int128 v69;
  id v70;
  id v71;
  __int128 v72;
  __int128 v73;
  __int128 v74;
  __int128 v75;
  _BYTE v76[128];
  uint8_t v77[128];
  uint8_t buf[4];
  _BYTE v79[10];
  _BYTE v80[128];

  v3 = a2;
  if (os_log_type_enabled(*(os_log_t *)(*(_QWORD *)(a1 + 32) + 8), OS_LOG_TYPE_DEBUG))
    sub_10001F00C();
  v74 = 0u;
  v75 = 0u;
  v72 = 0u;
  v73 = 0u;
  v4 = v3;
  v58 = objc_msgSend(v4, "countByEnumeratingWithState:objects:count:", &v72, v80, 16);
  v6 = 0;
  if (v58)
  {
    v57 = *(_QWORD *)v73;
    *(_QWORD *)&v5 = 67109376;
    v55 = v5;
    v56 = v4;
    do
    {
      for (i = 0; i != v58; i = (char *)i + 1)
      {
        if (*(_QWORD *)v73 != v57)
          objc_enumerationMutation(v4);
        v8 = *(void **)(*((_QWORD *)&v72 + 1) + 8 * (_QWORD)i);
        v9 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v4, "objectForKeyedSubscript:", v8, v55));
        v10 = (_UNKNOWN **)objc_claimAutoreleasedReturnValue(objc_msgSend(v9, "objectForKeyedSubscript:", CFSTR("NumSegments")));

        if (objc_msgSend(v10, "unsignedIntValue") >= 0x31)
        {
          v11 = *(NSObject **)(*(_QWORD *)(a1 + 32) + 8);
          if (os_log_type_enabled(v11, OS_LOG_TYPE_ERROR))
          {
            v51 = v11;
            v52 = objc_msgSend(v10, "unsignedIntValue");
            *(_DWORD *)buf = v55;
            *(_DWORD *)v79 = v52;
            *(_WORD *)&v79[4] = 1024;
            *(_DWORD *)&v79[6] = 48;
            _os_log_error_impl((void *)&_mh_execute_header, v51, OS_LOG_TYPE_ERROR, "Skipping NULL segments. Recevied %u, threshold %u ", buf, 0xEu);

          }
          v10 = &off_10002F5C0;
        }
        v59 = v10;
        if (objc_msgSend(v8, "isEqualToString:", CFSTR("uisoc")))
        {
          v12 = *(void **)(a1 + 40);
          v13 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v4, "objectForKeyedSubscript:", v8));
          v14 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v13, "objectForKeyedSubscript:", CFSTR("PrevSegmentVal")));
          v15 = (void *)objc_claimAutoreleasedReturnValue(+[NSNumber numberWithUnsignedInt:](NSNumber, "numberWithUnsignedInt:", objc_msgSend(v10, "unsignedIntValue") - 1));
          v71 = v6;
          v16 = objc_msgSend(v12, "insertValue:thisManyTimes:error:", v14, v15, &v71);
          v17 = v71;

          if ((v16 & 1) != 0)
          {
            v18 = *(void **)(a1 + 40);
            v19 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v4, "objectForKeyedSubscript:", v8));
            v20 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v19, "objectForKeyedSubscript:", CFSTR("CurrSegmentVal")));
            v70 = v17;
            LOBYTE(v18) = objc_msgSend(v18, "insertValue:error:", v20, &v70);
            v6 = v70;

            v4 = v56;
            v17 = v6;
            if ((v18 & 1) != 0)
              goto LABEL_53;
          }
          else
          {

          }
          v35 = *(NSObject **)(*(_QWORD *)(a1 + 32) + 8);
          if (os_log_type_enabled(v35, OS_LOG_TYPE_ERROR))
          {
            *(_DWORD *)buf = 138412290;
            *(_QWORD *)v79 = v17;
            _os_log_error_impl((void *)&_mh_execute_header, v35, OS_LOG_TYPE_ERROR, "Failed to add uisoc %@", buf, 0xCu);
          }
          v6 = v17;
        }
        else
        {
          if (objc_msgSend(v8, "isEqualToString:", CFSTR("temp")))
          {
            v21 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v4, "objectForKeyedSubscript:", v8));
            v22 = objc_msgSend(v21, "mutableCopy");

            if (objc_msgSend(v10, "unsignedIntValue") >= 5)
            {
              v23 = *(NSObject **)(*(_QWORD *)(a1 + 32) + 8);
              if (os_log_type_enabled(v23, OS_LOG_TYPE_ERROR))
              {
                v53 = v23;
                v54 = objc_msgSend(v10, "unsignedIntValue");
                *(_DWORD *)buf = v55;
                *(_DWORD *)v79 = v54;
                *(_WORD *)&v79[4] = 1024;
                *(_DWORD *)&v79[6] = 4;
                _os_log_error_impl((void *)&_mh_execute_header, v53, OS_LOG_TYPE_ERROR, "Skipping NULL temperature segments. Received %u, threshold %u ", buf, 0xEu);

              }
              objc_msgSend(v22, "setObject:forKeyedSubscript:", &off_10002F5C0, CFSTR("NumSegments"));
            }
            v24 = sub_100012C04(v22);
            v25 = (void *)objc_claimAutoreleasedReturnValue(v24);
            v66 = 0u;
            v67 = 0u;
            v68 = 0u;
            v69 = 0u;
            v26 = v25;
            v27 = objc_msgSend(v26, "countByEnumeratingWithState:objects:count:", &v66, v77, 16);
            if (v27)
            {
              v28 = v27;
              v29 = *(_QWORD *)v67;
              while (2)
              {
                v30 = 0;
                v31 = v6;
                do
                {
                  if (*(_QWORD *)v67 != v29)
                    objc_enumerationMutation(v26);
                  v32 = *(_QWORD *)(*((_QWORD *)&v66 + 1) + 8 * (_QWORD)v30);
                  v33 = *(void **)(a1 + 48);
                  v65 = v31;
                  v34 = objc_msgSend(v33, "insertValue:error:", v32, &v65);
                  v6 = v65;

                  if ((v34 & 1) == 0)
                  {
                    v48 = *(NSObject **)(*(_QWORD *)(a1 + 32) + 8);
                    if (os_log_type_enabled(v48, OS_LOG_TYPE_ERROR))
                    {
                      *(_DWORD *)buf = 138412290;
                      *(_QWORD *)v79 = v6;
                      _os_log_error_impl((void *)&_mh_execute_header, v48, OS_LOG_TYPE_ERROR, "Failed to add temp %@", buf, 0xCu);
                    }
                    goto LABEL_46;
                  }
                  v30 = (char *)v30 + 1;
                  v31 = v6;
                }
                while (v28 != v30);
                v28 = objc_msgSend(v26, "countByEnumeratingWithState:objects:count:", &v66, v77, 16);
                if (v28)
                  continue;
                break;
              }
            }
LABEL_46:

LABEL_52:
            v4 = v56;
            goto LABEL_53;
          }
          if (objc_msgSend(v8, "isEqualToString:", CFSTR("amperage")))
          {
            v36 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v4, "objectForKeyedSubscript:", v8));
            v37 = sub_100012C04(v36);
            v38 = (void *)objc_claimAutoreleasedReturnValue(v37);

            v63 = 0u;
            v64 = 0u;
            v61 = 0u;
            v62 = 0u;
            v22 = v38;
            v39 = objc_msgSend(v22, "countByEnumeratingWithState:objects:count:", &v61, v76, 16);
            if (v39)
            {
              v40 = v39;
              v41 = *(_QWORD *)v62;
              while (2)
              {
                v42 = 0;
                v43 = v6;
                do
                {
                  if (*(_QWORD *)v62 != v41)
                    objc_enumerationMutation(v22);
                  objc_msgSend(*(id *)(*((_QWORD *)&v61 + 1) + 8 * (_QWORD)v42), "floatValue");
                  v44 = *(void **)(a1 + 56);
                  *(float *)&v46 = v45 / (float)*(unsigned int *)(a1 + 64);
                  v47 = (void *)objc_claimAutoreleasedReturnValue(+[NSNumber numberWithFloat:](NSNumber, "numberWithFloat:", v46));
                  v60 = v43;
                  LOBYTE(v44) = objc_msgSend(v44, "insertValue:error:", v47, &v60);
                  v6 = v60;

                  if ((v44 & 1) == 0)
                  {
                    v50 = *(NSObject **)(*(_QWORD *)(a1 + 32) + 8);
                    if (os_log_type_enabled(v50, OS_LOG_TYPE_ERROR))
                    {
                      *(_DWORD *)buf = 138412290;
                      *(_QWORD *)v79 = v6;
                      _os_log_error_impl((void *)&_mh_execute_header, v50, OS_LOG_TYPE_ERROR, "Failed to add c-rate %@", buf, 0xCu);
                    }
                    goto LABEL_51;
                  }
                  v42 = (char *)v42 + 1;
                  v43 = v6;
                }
                while (v40 != v42);
                v40 = objc_msgSend(v22, "countByEnumeratingWithState:objects:count:", &v61, v76, 16);
                if (v40)
                  continue;
                break;
              }
            }
LABEL_51:

            goto LABEL_52;
          }
          v49 = *(NSObject **)(*(_QWORD *)(a1 + 32) + 8);
          if (os_log_type_enabled(v49, OS_LOG_TYPE_ERROR))
          {
            *(_DWORD *)buf = 138412290;
            *(_QWORD *)v79 = v8;
            _os_log_error_impl((void *)&_mh_execute_header, v49, OS_LOG_TYPE_ERROR, "Unknown key %@ in resampled callback", buf, 0xCu);
          }
        }
LABEL_53:

      }
      v58 = objc_msgSend(v4, "countByEnumeratingWithState:objects:count:", &v72, v80, 16);
    }
    while (v58);
  }

}

id sub_100012C04(void *a1)
{
  id v1;
  id v2;
  void *v3;
  unsigned int v4;
  void *v5;
  void *v6;
  float v7;
  float v8;
  void *v9;
  float v10;
  float v11;
  double v12;
  float v13;
  float v14;
  unsigned int i;
  void *v16;

  v1 = a1;
  v2 = objc_alloc_init((Class)NSMutableArray);
  v3 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v1, "objectForKeyedSubscript:", CFSTR("NumSegments")));
  v4 = objc_msgSend(v3, "intValue");

  if (v4 == 1)
  {
    v5 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v1, "objectForKeyedSubscript:", CFSTR("CurrSegmentVal")));
    objc_msgSend(v2, "addObject:", v5);

  }
  else
  {
    v6 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v1, "objectForKeyedSubscript:", CFSTR("PrevSegmentVal")));
    objc_msgSend(v6, "floatValue");
    v8 = v7;

    v9 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v1, "objectForKeyedSubscript:", CFSTR("CurrSegmentVal")));
    objc_msgSend(v9, "floatValue");
    v11 = v10;

    *(float *)&v12 = v11 - v8;
    if (v11 < v8)
      *(float *)&v12 = v8 - v11;
    v13 = *(float *)&v12 / (float)v4;
    if (v11 >= v8)
      v14 = v13;
    else
      v14 = -v13;
    if (v4)
    {
      for (i = 1; i <= v4; ++i)
      {
        *(float *)&v12 = v8 + (float)((float)i * v14);
        v16 = (void *)objc_claimAutoreleasedReturnValue(+[NSNumber numberWithFloat:](NSNumber, "numberWithFloat:", v12));
        objc_msgSend(v2, "addObject:", v16);

      }
    }
  }

  return v2;
}

void sub_100014BB4(void *a1, NSObject *a2, uint64_t a3, const char *a4, uint8_t *a5)
{
  _os_log_error_impl(a1, a2, OS_LOG_TYPE_ERROR, a4, a5, 2u);
}

void sub_100014BD8(void *a1, NSObject *a2, uint64_t a3, const char *a4, uint8_t *a5)
{
  _os_log_debug_impl(a1, a2, OS_LOG_TYPE_DEBUG, a4, a5, 0x16u);
}

id sub_100014BE4()
{
  void *v0;

  return objc_msgSend(v0, "count");
}

BOOL sub_100014BF0(id a1)
{
  __int128 v2;
  int v3;

  v3 = -609570151;
  v2 = xmmword_100025BF0;
  return MGIsDeviceOneOfType(&v2);
}

void sub_100014D50()
{
  os_log_t v0;
  void *v1;
  void *v2;
  Block_layout *v3;
  void *v4;
  void *v5;
  uint64_t v6;
  void *v7;
  id v8;
  id v9;
  uint64_t v10;
  void *i;
  void *v12;
  uint64_t v13;
  void *v14;
  void *v15;
  BatteryAlgorithmsRunner *v16;
  void *v17;
  NSObject *v18;
  int v19;
  const __CFString *v20;
  void *v21;
  void *v22;
  void *v23;
  unsigned __int8 v24;
  id v25;
  NSObject *v26;
  NSObject *v27;
  id v28;
  id v29;
  const __CFString *v30;
  uint64_t v31;
  void *j;
  void *v33;
  void *v34;
  NSObject *v35;
  void *v36;
  uint64_t v37;
  NSObject *v38;
  const char *v39;
  const __CFString *v40;
  id v41;
  uint64_t v42;
  NSObject *v43;
  _BOOL4 v44;
  void *v45;
  void *v46;
  NSObject *v47;
  void *v48;
  NSObject *v49;
  void *v50;
  void *v51;
  void *v52;
  void *v53;
  NSObject *v54;
  void *v55;
  id v56;
  void *v57;
  void *v58;
  void *v59;
  CFMutableDictionaryRef v60;
  void *v61;
  void *v62;
  void *v63;
  void *v64;
  void *v65;
  void *v66;
  void *v67;
  void *v68;
  NSObject *v69;
  void *v70;
  NSObject *v71;
  const char *v72;
  void *v73;
  NSObject *v74;
  NSObject *v75;
  id v76;
  void *v77;
  NSObject *v78;
  id v79;
  NSObject *v80;
  NSObject *v81;
  void *v82;
  id v83;
  void *v84;
  id v85;
  void *v86;
  id v87;
  void *v88;
  uint64_t Data;
  void *v90;
  id v91;
  id v92;
  id v93;
  id v94;
  uint64_t v95;
  void *k;
  void *v97;
  void *v98;
  void *v99;
  void *v100;
  void *v101;
  void *v102;
  void *v103;
  void *v104;
  void *v105;
  void *v106;
  id v107;
  unsigned int v108;
  void *v109;
  void *v110;
  NSObject *v111;
  id v112;
  NSObject *v113;
  int v114;
  void *v115;
  NSObject *v116;
  NSObject *v117;
  void *v118;
  void *v119;
  NSObject *v120;
  void *v121;
  NSObject *v122;
  id v123;
  void *v124;
  id v125;
  id obj;
  id v127;
  void *v128;
  void *v129;
  void *v130;
  void *v131;
  void *v132;
  id v133;
  id v134;
  uint64_t v135;
  id v136;
  void *v137;
  int v138;
  void *v139;
  void *v140;
  id v141;
  id v142;
  id v143;
  id v144;
  id v145;
  __int128 v146;
  __int128 v147;
  __int128 v148;
  __int128 v149;
  __int128 v150;
  __int128 v151;
  __int128 v152;
  __int128 v153;
  id v154;
  _BYTE v155[128];
  _QWORD v156[2];
  _QWORD v157[2];
  const __CFString *v158;
  const __CFString *v159;
  _QWORD v160[2];
  __int128 v161;
  __int128 v162;
  __int128 v163;
  __int128 v164;
  _QWORD v165[2];
  _QWORD v166[2];
  _BYTE v167[128];
  uint8_t buf[16];
  __int128 v169;
  __int128 v170;
  __int128 v171;

  v0 = os_log_create("com.apple.batteryintelligence", "BatteryAlgorithmsHelper");
  v1 = (void *)qword_100035278;
  qword_100035278 = (uint64_t)v0;

  v158 = CFSTR("algorithmName");
  v159 = CFSTR("SampleAlgorithm");
  v2 = (void *)objc_claimAutoreleasedReturnValue(+[NSDictionary dictionaryWithObjects:forKeys:count:](NSDictionary, "dictionaryWithObjects:forKeys:count:", &v159, &v158, 1));
  v160[0] = v2;
  v157[0] = CFSTR("OnDeviceACAM");
  v156[0] = CFSTR("algorithmName");
  v156[1] = CFSTR("algorithmTargetEnBlock");
  v3 = objc_retainBlock(off_100035140);
  v157[1] = v3;
  v4 = (void *)objc_claimAutoreleasedReturnValue(+[NSDictionary dictionaryWithObjects:forKeys:count:](NSDictionary, "dictionaryWithObjects:forKeys:count:", v157, v156, 2));
  v160[1] = v4;
  v5 = (void *)objc_claimAutoreleasedReturnValue(+[NSArray arrayWithObjects:count:](NSArray, "arrayWithObjects:count:", v160, 2));

  if (!qword_100035270 || !objc_msgSend((id)qword_100035270, "count"))
  {
    v6 = objc_claimAutoreleasedReturnValue(+[NSMutableArray array](NSMutableArray, "array"));
    v7 = (void *)qword_100035270;
    qword_100035270 = v6;

  }
  obj = v5;
  if ((byte_100035281 & 1) == 0)
  {
    v163 = 0u;
    v164 = 0u;
    v161 = 0u;
    v162 = 0u;
    v8 = objc_msgSend(obj, "countByEnumeratingWithState:objects:count:", &v161, v167, 16);
    if (v8)
    {
      v9 = v8;
      v10 = *(_QWORD *)v162;
      do
      {
        for (i = 0; i != v9; i = (char *)i + 1)
        {
          if (*(_QWORD *)v162 != v10)
            objc_enumerationMutation(obj);
          v12 = *(void **)(*((_QWORD *)&v161 + 1) + 8 * (_QWORD)i);
          v13 = objc_claimAutoreleasedReturnValue(objc_msgSend(v12, "objectForKeyedSubscript:", CFSTR("algorithmTargetEnBlock")));
          v14 = (void *)v13;
          if (v13 && (*(unsigned int (**)(uint64_t))(v13 + 16))(v13))
          {
            byte_100035280 = 1;
            v15 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v12, "objectForKeyedSubscript:", CFSTR("algorithmName")));
            v16 = objc_alloc_init(BatteryAlgorithmsRunner);
            v17 = (void *)objc_claimAutoreleasedReturnValue(+[NSMutableDictionary dictionary](NSMutableDictionary, "dictionary"));
            objc_msgSend(v17, "setObject:forKeyedSubscript:", v16, CFSTR("algorithmObject"));
            objc_msgSend(v17, "setObject:forKeyedSubscript:", v15, CFSTR("algorithmName"));
            objc_msgSend((id)qword_100035270, "addObject:", v17);

          }
        }
        v9 = objc_msgSend(obj, "countByEnumeratingWithState:objects:count:", &v161, v167, 16);
      }
      while (v9);
    }
    byte_100035281 = 1;
  }
  if (byte_100035280 == 1)
  {

    goto LABEL_20;
  }
  v18 = qword_100035278;
  if (!os_log_type_enabled((os_log_t)qword_100035278, OS_LOG_TYPE_DEFAULT))
  {
    v124 = obj;
LABEL_130:

    goto LABEL_131;
  }
  *(_WORD *)buf = 0;
  _os_log_impl((void *)&_mh_execute_header, v18, OS_LOG_TYPE_DEFAULT, "None of the Algorithms are enabled", buf, 2u);
  v19 = byte_100035280;

  if (v19 == 1)
  {
LABEL_20:
    v20 = sub_100017140();
    v21 = (void *)objc_claimAutoreleasedReturnValue(v20);
    v22 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v21, "stringByAppendingFormat:", CFSTR("%@%@"), CFSTR("/"), CFSTR("com.apple.batteryintelligence.batteryalgorithms")));
    v23 = (void *)objc_claimAutoreleasedReturnValue(+[NSFileManager defaultManager](NSFileManager, "defaultManager"));
    *(_QWORD *)v167 = 0;
    v24 = objc_msgSend(v23, "createDirectoryAtPath:withIntermediateDirectories:attributes:error:", v22, 1, 0, v167);
    v25 = *(id *)v167;

    if ((v24 & 1) != 0)
    {

    }
    else
    {
      v26 = qword_100035278;
      if (os_log_type_enabled((os_log_t)qword_100035278, OS_LOG_TYPE_ERROR))
        sub_10001F738((uint64_t)v22, (uint64_t)v25, v26);

      v27 = qword_100035278;
      if (os_log_type_enabled((os_log_t)qword_100035278, OS_LOG_TYPE_ERROR))
        sub_10001F6C4((uint64_t)v22, v27);
    }

    v129 = (void *)objc_claimAutoreleasedReturnValue(+[BatteryAlgorithmsInit sharedInstance](BatteryAlgorithmsInit, "sharedInstance"));
    v146 = 0u;
    v147 = 0u;
    v148 = 0u;
    v149 = 0u;
    v142 = (id)qword_100035270;
    v28 = objc_msgSend(v142, "countByEnumeratingWithState:objects:count:", &v146, v155, 16);
    if (v28)
    {
      v29 = v28;
      v30 = CFSTR("algorithmName");
      v31 = *(_QWORD *)v147;
      do
      {
        for (j = 0; j != v29; j = (char *)j + 1)
        {
          if (*(_QWORD *)v147 != v31)
            objc_enumerationMutation(v142);
          v33 = *(void **)(*((_QWORD *)&v146 + 1) + 8 * (_QWORD)j);
          v34 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v33, "objectForKeyedSubscript:", v30));
          v35 = qword_100035278;
          if (os_log_type_enabled((os_log_t)qword_100035278, OS_LOG_TYPE_DEFAULT))
          {
            *(_DWORD *)v167 = 138412290;
            *(_QWORD *)&v167[4] = v34;
            _os_log_impl((void *)&_mh_execute_header, v35, OS_LOG_TYPE_DEFAULT, "[%@] Algorithm found", v167, 0xCu);
          }
          v36 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v33, "objectForKeyedSubscript:", CFSTR("algorithmObject")));
          if (objc_msgSend(v36, "initDone"))
          {
            v37 = qword_100035278;
            if (!os_log_type_enabled((os_log_t)qword_100035278, OS_LOG_TYPE_DEFAULT))
              goto LABEL_48;
            *(_DWORD *)v167 = 138412290;
            *(_QWORD *)&v167[4] = v34;
            v38 = v37;
            v39 = "[%@] Init done already. Skipping init";
LABEL_47:
            _os_log_impl((void *)&_mh_execute_header, v38, OS_LOG_TYPE_DEFAULT, v39, v167, 0xCu);
            goto LABEL_48;
          }
          v40 = v30;
          objc_msgSend(v36, "setAlgorithmClassName:", v34);
          v41 = objc_retainAutorelease((id)objc_claimAutoreleasedReturnValue(+[NSString stringWithFormat:](NSString, "stringWithFormat:", CFSTR("AppleSoftGauging%@"), v34)));
          v42 = _os_feature_enabled_impl("batteryintelligence", objc_msgSend(v41, "UTF8String"));

          objc_msgSend(v36, "setFeatureFlagEn:", v42);
          LOBYTE(v42) = objc_msgSend(v36, "featureFlagEn");
          v43 = qword_100035278;
          v44 = os_log_type_enabled((os_log_t)qword_100035278, OS_LOG_TYPE_DEFAULT);
          if ((v42 & 1) == 0)
          {
            v30 = v40;
            if (!v44)
              goto LABEL_48;
            *(_DWORD *)v167 = 138412290;
            *(_QWORD *)&v167[4] = v34;
            v38 = v43;
            v39 = "Feature Disabled for %@. Move on";
            goto LABEL_47;
          }
          if (v44)
          {
            *(_DWORD *)v167 = 138412290;
            *(_QWORD *)&v167[4] = v34;
            _os_log_impl((void *)&_mh_execute_header, v43, OS_LOG_TYPE_DEFAULT, "[%@] Algorithm is enabled", v167, 0xCu);
          }
          v45 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v36, "algoStateData"));
          v46 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v129, "preInitData"));
          objc_msgSend(v46, "setObject:forKeyedSubscript:", v45, CFSTR("savedAlgoState"));

          v47 = qword_100035278;
          if (os_log_type_enabled((os_log_t)qword_100035278, OS_LOG_TYPE_DEFAULT))
          {
            *(_DWORD *)v167 = 138412290;
            *(_QWORD *)&v167[4] = v34;
            _os_log_impl((void *)&_mh_execute_header, v47, OS_LOG_TYPE_DEFAULT, "[%@] Call Algorithm init", v167, 0xCu);
          }
          v48 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v129, "preInitData"));
          objc_msgSend(v36, "algoRunnerInitWithData:", v48);

          v30 = v40;
          if (objc_msgSend(v36, "freshInitRequested"))
          {
            v49 = qword_100035278;
            if (os_log_type_enabled((os_log_t)qword_100035278, OS_LOG_TYPE_DEFAULT))
            {
              *(_DWORD *)v167 = 138412290;
              *(_QWORD *)&v167[4] = v34;
              _os_log_impl((void *)&_mh_execute_header, v49, OS_LOG_TYPE_DEFAULT, "[%@] Fresh init needed", v167, 0xCu);
            }
            objc_msgSend(v129, "fullInitDataRead");
            v50 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v129, "fullInitData"));
            objc_msgSend(v36, "algoRunnerFreshInitWithData:", v50);

          }
LABEL_48:

        }
        v29 = objc_msgSend(v142, "countByEnumeratingWithState:objects:count:", &v146, v155, 16);
      }
      while (v29);
    }

    v150 = 0u;
    v151 = 0u;
    v152 = 0u;
    v153 = 0u;
    v127 = (id)qword_100035270;
    v136 = objc_msgSend(v127, "countByEnumeratingWithState:objects:count:", &v150, &v161, 16);
    if (v136)
    {
      v135 = *(_QWORD *)v151;
      do
      {
        v51 = 0;
        do
        {
          if (*(_QWORD *)v151 != v135)
            objc_enumerationMutation(v127);
          v52 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(*(id *)(*((_QWORD *)&v150 + 1) + 8 * (_QWORD)v51), "objectForKeyedSubscript:", CFSTR("algorithmObject")));
          v53 = (void *)qword_100035278;
          if (os_log_type_enabled((os_log_t)qword_100035278, OS_LOG_TYPE_DEFAULT))
          {
            v54 = v53;
            v55 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v52, "AlgorithmClassName"));
            *(_DWORD *)v167 = 138412290;
            *(_QWORD *)&v167[4] = v55;
            _os_log_impl((void *)&_mh_execute_header, v54, OS_LOG_TYPE_DEFAULT, "[%@] Attempt to run", v167, 0xCu);

          }
          if ((objc_msgSend(v52, "featureFlagEn") & 1) == 0)
          {
            v68 = (void *)qword_100035278;
            if (!os_log_type_enabled((os_log_t)qword_100035278, OS_LOG_TYPE_DEFAULT))
              goto LABEL_122;
            v69 = v68;
            v70 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v52, "AlgorithmClassName"));
            *(_DWORD *)v167 = 138412290;
            *(_QWORD *)&v167[4] = v70;
            v71 = v69;
            v72 = "[%@] Feature Flag disabled. Skipping";
LABEL_65:
            _os_log_impl((void *)&_mh_execute_header, v71, OS_LOG_TYPE_DEFAULT, v72, v167, 0xCu);

            goto LABEL_122;
          }
          if ((objc_msgSend(v52, "initDone") & 1) == 0)
          {
            v73 = (void *)qword_100035278;
            if (!os_log_type_enabled((os_log_t)qword_100035278, OS_LOG_TYPE_DEFAULT))
              goto LABEL_122;
            v69 = v73;
            v70 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v52, "AlgorithmClassName"));
            *(_DWORD *)v167 = 138412290;
            *(_QWORD *)&v167[4] = v70;
            v71 = v69;
            v72 = "[%@] Init is still pending. Skipping";
            goto LABEL_65;
          }
          v56 = v52;
          v57 = (void *)objc_claimAutoreleasedReturnValue(+[NSDate now](NSDate, "now"));
          v58 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v56, "runMetaData"));
          v59 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v58, "objectForKey:", CFSTR("LastRunDate")));

          v60 = sub_1000174D8();
          v61 = (void *)objc_claimAutoreleasedReturnValue(v60);
          v62 = v61;
          v130 = v51;
          v128 = v52;
          v137 = v56;
          v139 = v57;
          if (v61)
          {
            v143 = (id)objc_claimAutoreleasedReturnValue(objc_msgSend(v61, "objectForKey:", CFSTR("BatteryData")));
            v140 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v62, "objectForKey:", CFSTR("ChargerData")));
            v63 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v143, "objectForKey:", CFSTR("LifetimeData")));
            v64 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v62, "objectForKey:", CFSTR("CycleCount")));
            v65 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v63, "objectForKey:", CFSTR("TotalOperatingTime")));
            v66 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v140, "objectForKey:", CFSTR("VacVoltageLimit")));
            v67 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v63, "objectForKey:", CFSTR("TimeAtHighSoc")));
            *(_QWORD *)buf = CFSTR("VacVoltageLimit");
            *(_QWORD *)&buf[8] = CFSTR("CycleCount");
            *(_QWORD *)&v169 = CFSTR("TimeAtHighSoc");
            *(_QWORD *)v167 = v66;
            *(_QWORD *)&v167[8] = v64;
            *((_QWORD *)&v169 + 1) = CFSTR("TotalOperatingTime");
            *(_QWORD *)&v167[16] = v67;
            *(_QWORD *)&v167[24] = v65;
            v131 = (void *)objc_claimAutoreleasedReturnValue(+[NSDictionary dictionaryWithObjects:forKeys:count:](NSDictionary, "dictionaryWithObjects:forKeys:count:", v167, buf, 4));

            v56 = v137;
            v57 = v139;

          }
          else
          {
            v131 = 0;
          }

          if (!v59)
          {
            v59 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v57, "dateByAddingTimeInterval:", -2592000.0));
            v74 = qword_100035278;
            if (os_log_type_enabled((os_log_t)qword_100035278, OS_LOG_TYPE_DEFAULT))
            {
              *(_WORD *)v167 = 0;
              _os_log_impl((void *)&_mh_execute_header, v74, OS_LOG_TYPE_DEFAULT, "We could not determine when was the last time we ran, pick last 30 days", v167, 2u);
            }
          }
          v75 = qword_100035278;
          if (os_log_type_enabled((os_log_t)qword_100035278, OS_LOG_TYPE_DEFAULT))
          {
            *(_DWORD *)v167 = 138412290;
            *(_QWORD *)&v167[4] = v59;
            _os_log_impl((void *)&_mh_execute_header, v75, OS_LOG_TYPE_DEFAULT, "Last time we ran till [%@]", v167, 0xCu);
          }
          v76 = v59;
          if (objc_msgSend(v57, "compare:", v76) == (id)-1)
          {
            v113 = qword_100035278;
            if (os_log_type_enabled((os_log_t)qword_100035278, OS_LOG_TYPE_ERROR))
            {
              *(_DWORD *)v167 = 138412546;
              *(_QWORD *)&v167[4] = v76;
              *(_WORD *)&v167[12] = 2112;
              *(_QWORD *)&v167[14] = v57;
              _os_log_error_impl((void *)&_mh_execute_header, v113, OS_LOG_TYPE_ERROR, "dateFrom [%@] is greater than today [%@]. Cannot Continue", v167, 0x16u);
            }
            v114 = -84;
            v115 = v76;
          }
          else
          {
            v77 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v76, "dateByAddingTimeInterval:", 86400.0));
            if (objc_msgSend(v57, "compare:", v77) == (id)-1)
            {
              v78 = qword_100035278;
              if (os_log_type_enabled((os_log_t)qword_100035278, OS_LOG_TYPE_DEFAULT))
              {
                *(_DWORD *)v167 = 138412546;
                *(_QWORD *)&v167[4] = v77;
                *(_WORD *)&v167[12] = 2112;
                *(_QWORD *)&v167[14] = v57;
                _os_log_impl((void *)&_mh_execute_header, v78, OS_LOG_TYPE_DEFAULT, "dateTill [%@] >= today [%@]. Truncate", v167, 0x16u);
              }
              v79 = v57;

              v77 = v79;
            }
            v80 = qword_100035278;
            if (os_log_type_enabled((os_log_t)qword_100035278, OS_LOG_TYPE_DEFAULT))
            {
              *(_DWORD *)v167 = 138412546;
              *(_QWORD *)&v167[4] = v76;
              *(_WORD *)&v167[12] = 2112;
              *(_QWORD *)&v167[14] = v57;
              _os_log_impl((void *)&_mh_execute_header, v80, OS_LOG_TYPE_DEFAULT, "Total data to process [%@] to [%@]", v167, 0x16u);
            }
            v125 = v76;
            if (objc_msgSend(v57, "compare:", v76) == (id)1)
            {
              v138 = 0;
              v145 = v76;
              while (1)
              {
                v81 = qword_100035278;
                if (os_log_type_enabled((os_log_t)qword_100035278, OS_LOG_TYPE_DEFAULT))
                {
                  *(_DWORD *)v167 = 67109634;
                  *(_DWORD *)&v167[4] = v138;
                  *(_WORD *)&v167[8] = 2112;
                  v82 = v145;
                  *(_QWORD *)&v167[10] = v145;
                  *(_WORD *)&v167[18] = 2112;
                  *(_QWORD *)&v167[20] = v77;
                  _os_log_impl((void *)&_mh_execute_header, v81, OS_LOG_TYPE_DEFAULT, "Running chunk #%d from [%@] to [%@]", v167, 0x1Cu);
                  ++v138;
                }
                else
                {
                  v82 = v145;
                }
                v83 = objc_msgSend(objc_alloc((Class)NSDateInterval), "initWithStartDate:endDate:", v82, v77);
                v84 = (void *)objc_claimAutoreleasedReturnValue(+[NSSet setWithArray:](NSSet, "setWithArray:", &off_10002F0E0));
                v85 = objc_alloc((Class)PPSTimeSeriesRequest);
                v86 = (void *)objc_claimAutoreleasedReturnValue(+[NSPredicate predicateWithFormat:](NSPredicate, "predicateWithFormat:", CFSTR("(subsystem == 'BatteryDataCollection' AND category == 'BDC_AMA' AND (AlgoTemperature >= 0 OR AlgoTemperature < 0))")));
                v87 = objc_msgSend(v85, "initWithMetrics:predicate:timeFilter:limitCount:offsetCount:", v84, v86, v83, 86400, 0);

                v88 = (void *)objc_claimAutoreleasedReturnValue(+[NSMutableArray array](NSMutableArray, "array"));
                v144 = v77;
                if (v87)
                {
                  v154 = 0;
                  Data = PerfPowerServicesGetData(v87, &v154);
                  v90 = (void *)objc_claimAutoreleasedReturnValue(Data);
                  v141 = v154;
                  if (v141)
                  {
                    v91 = (id)objc_claimAutoreleasedReturnValue(+[NSNull null](NSNull, "null"));
                  }
                  else
                  {
                    v133 = v87;
                    v134 = v83;
                    v170 = 0u;
                    v171 = 0u;
                    *(_OWORD *)buf = 0u;
                    v169 = 0u;
                    v132 = v90;
                    v92 = v90;
                    v93 = objc_msgSend(v92, "countByEnumeratingWithState:objects:count:", buf, v167, 16);
                    if (v93)
                    {
                      v94 = v93;
                      v95 = *(_QWORD *)v169;
                      do
                      {
                        for (k = 0; k != v94; k = (char *)k + 1)
                        {
                          if (*(_QWORD *)v169 != v95)
                            objc_enumerationMutation(v92);
                          v97 = *(void **)(*(_QWORD *)&buf[8] + 8 * (_QWORD)k);
                          v98 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v97, "metricKeysAndValues"));
                          v99 = (void *)objc_claimAutoreleasedReturnValue(+[NSMutableDictionary dictionary](NSMutableDictionary, "dictionary"));
                          v100 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v98, "objectForKeyedSubscript:", CFSTR("Voltage")));
                          objc_msgSend(v99, "setObject:forKeyedSubscript:", v100, CFSTR("Voltage"));

                          v101 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v98, "objectForKeyedSubscript:", CFSTR("InstantAmperage")));
                          objc_msgSend(v99, "setObject:forKeyedSubscript:", v101, CFSTR("InstantAmperage"));

                          v102 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v98, "objectForKeyedSubscript:", CFSTR("PresentDOD")));
                          objc_msgSend(v99, "setObject:forKeyedSubscript:", v102, CFSTR("PresentDOD"));

                          v103 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v98, "objectForKeyedSubscript:", CFSTR("VirtualTemperature")));
                          objc_msgSend(v99, "setObject:forKeyedSubscript:", v103, CFSTR("VirtualTemperature"));

                          objc_msgSend(v97, "epochTimestamp");
                          v104 = (void *)objc_claimAutoreleasedReturnValue(+[NSNumber numberWithDouble:](NSNumber, "numberWithDouble:"));
                          objc_msgSend(v99, "setObject:forKeyedSubscript:", v104, CFSTR("Timestamp"));

                          objc_msgSend(v88, "addObject:", v99);
                        }
                        v94 = objc_msgSend(v92, "countByEnumeratingWithState:objects:count:", buf, v167, 16);
                      }
                      while (v94);
                    }

                    v91 = v88;
                    v51 = v130;
                    v56 = v137;
                    v83 = v134;
                    v82 = v145;
                    v90 = v132;
                    v87 = v133;
                  }

                }
                else
                {
                  v91 = (id)objc_claimAutoreleasedReturnValue(+[NSNull null](NSNull, "null"));
                }

                v105 = v83;
                v57 = v139;
                if (!v91)
                  goto LABEL_103;
                v106 = (void *)objc_claimAutoreleasedReturnValue(+[NSNull null](NSNull, "null"));
                if ((objc_msgSend(v91, "isEqual:", v106) & 1) != 0)
                  goto LABEL_102;
                v107 = objc_msgSend(v91, "count");

                if (v107)
                  break;
LABEL_103:
                v109 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v56, "runMetaData"));
                objc_msgSend(v109, "setValue:forKey:", v144, CFSTR("LastRunDate"));

                v76 = (id)objc_claimAutoreleasedReturnValue(objc_msgSend(v82, "dateByAddingTimeInterval:", 86400.0));
                v110 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v144, "dateByAddingTimeInterval:", 86400.0));

                if (objc_msgSend(v139, "compare:", v110) != (id)1)
                {
                  v111 = qword_100035278;
                  if (os_log_type_enabled((os_log_t)qword_100035278, OS_LOG_TYPE_DEFAULT))
                  {
                    *(_DWORD *)v167 = 138412546;
                    *(_QWORD *)&v167[4] = v110;
                    *(_WORD *)&v167[12] = 2112;
                    *(_QWORD *)&v167[14] = v139;
                    _os_log_impl((void *)&_mh_execute_header, v111, OS_LOG_TYPE_DEFAULT, "dateTill [%@] is > than today [%@]. Truncate", v167, 0x16u);
                  }
                  v112 = v139;

                  v110 = v112;
                }

                v145 = v76;
                v77 = v110;
                if (objc_msgSend(v139, "compare:", v76) != (id)1)
                  goto LABEL_113;
              }
              v165[0] = CFSTR("amaStreamData");
              v165[1] = CFSTR("smcData");
              v166[0] = v91;
              v166[1] = v131;
              v106 = (void *)objc_claimAutoreleasedReturnValue(+[NSDictionary dictionaryWithObjects:forKeys:count:](NSDictionary, "dictionaryWithObjects:forKeys:count:", v166, v165, 2));
              v108 = objc_msgSend(v56, "algoRunnerExecuteWithData:", v106);
              if (v108)
              {
                v114 = v108;
                v122 = qword_100035278;
                if (os_log_type_enabled((os_log_t)qword_100035278, OS_LOG_TYPE_ERROR))
                {
                  *(_DWORD *)v167 = 67109120;
                  *(_DWORD *)&v167[4] = v114;
                  _os_log_error_impl((void *)&_mh_execute_header, v122, OS_LOG_TYPE_ERROR, "Unable to execute run function %d", v167, 8u);
                }

                v110 = v144;
                goto LABEL_114;
              }
              v56 = v137;
LABEL_102:

              goto LABEL_103;
            }
            v110 = v77;
LABEL_113:
            v105 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v56, "runMetaData"));
            objc_msgSend(v105, "setValue:forKey:", v110, CFSTR("LastRunDate"));
            v114 = 0;
            v145 = v76;
LABEL_114:

            v76 = v125;
            v52 = v128;
            v115 = v145;
          }

          if (!v114)
          {
            v116 = qword_100035278;
            if (os_log_type_enabled((os_log_t)qword_100035278, OS_LOG_TYPE_DEFAULT))
            {
              v117 = v116;
              v118 = v137;
              v119 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v137, "AlgorithmClassName"));
              *(_DWORD *)v167 = 138412290;
              *(_QWORD *)&v167[4] = v119;
              _os_log_impl((void *)&_mh_execute_header, v117, OS_LOG_TYPE_DEFAULT, "[%@] Done running", v167, 0xCu);

              v116 = qword_100035278;
            }
            else
            {
              v118 = v137;
            }
            if (os_log_type_enabled(v116, OS_LOG_TYPE_DEFAULT))
            {
              v120 = v116;
              v121 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v118, "AlgorithmClassName"));
              *(_DWORD *)v167 = 138412290;
              *(_QWORD *)&v167[4] = v121;
              _os_log_impl((void *)&_mh_execute_header, v120, OS_LOG_TYPE_DEFAULT, "[%@] Calling output ", v167, 0xCu);

            }
            objc_msgSend(v118, "algoRunnerStoreOutput");
          }
LABEL_122:

          v51 = (char *)v51 + 1;
        }
        while (v51 != v136);
        v123 = objc_msgSend(v127, "countByEnumeratingWithState:objects:count:", &v150, &v161, 16);
        v136 = v123;
      }
      while (v123);
    }

    v124 = v129;
    goto LABEL_130;
  }
LABEL_131:

}

void sub_10001625C(uint64_t a1)
{
  id v1;
  void *v2;

  v1 = objc_alloc_init(*(Class *)(a1 + 32));
  v2 = (void *)qword_100035288;
  qword_100035288 = (uint64_t)v1;

}

const __CFString *sub_100017134()
{
  return CFSTR("/var/db/Battery/BDC");
}

const __CFString *sub_100017140()
{
  return CFSTR("/var/db/Battery/BI");
}

char *sub_10001714C(char *category)
{
  if (category)
    category = (char *)os_log_create("com.apple.batteryintelligence", category);
  return category;
}

NSDate *sub_100017170(void *a1, unsigned int a2)
{
  double v3;

  objc_msgSend(a1, "timeIntervalSince1970");
  return +[NSDate dateWithTimeIntervalSince1970:](NSDate, "dateWithTimeIntervalSince1970:", floor(v3 / (float)a2) * (double)a2);
}

id sub_1000171B4(unint64_t a1)
{
  void *v1;

  if (a1 < 0x14 && ((0xC07FFu >> a1) & 1) != 0)
  {
    v1 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(CFSTR("/var/db/Battery/BI"), "stringByAppendingFormat:", CFSTR("%@%@"), CFSTR("/"), *(&off_10002CA68 + a1)));
  }
  else
  {
    if (os_log_type_enabled((os_log_t)&_os_log_default, OS_LOG_TYPE_ERROR))
      sub_10001F9D0();
    v1 = 0;
  }
  return v1;
}

id sub_100017248(void *a1, void *a2)
{
  id v3;
  id v4;
  void *v5;
  void *v6;
  unsigned __int8 v7;
  id v8;
  id v9;
  id v10;
  id v12;
  id v13;

  v3 = a1;
  v4 = a2;
  v5 = (void *)objc_claimAutoreleasedReturnValue(+[NSURL fileURLWithPath:isDirectory:](NSURL, "fileURLWithPath:isDirectory:", v4, 0));
  v6 = (void *)objc_claimAutoreleasedReturnValue(+[NSFileManager defaultManager](NSFileManager, "defaultManager"));
  if (objc_msgSend(v6, "fileExistsAtPath:", v4))
  {
    v13 = 0;
    v7 = objc_msgSend(v6, "removeItemAtURL:error:", v5, &v13);
    v8 = v13;
    if ((v7 & 1) == 0 && os_log_type_enabled((os_log_t)&_os_log_default, OS_LOG_TYPE_ERROR))
      sub_10001FAA0();
  }
  else
  {
    v8 = 0;
  }
  v12 = v8;
  v9 = objc_msgSend(v3, "writeToURL:error:", v5, &v12);
  v10 = v12;

  if ((v9 & 1) == 0 && os_log_type_enabled((os_log_t)&_os_log_default, OS_LOG_TYPE_ERROR))
    sub_10001FA38();

  return v9;
}

id sub_100017388(void *a1, unint64_t a2)
{
  id v3;
  id v4;
  void *v5;
  id v6;

  v3 = a1;
  v4 = sub_1000171B4(a2);
  v5 = (void *)objc_claimAutoreleasedReturnValue(v4);
  if (v5)
  {
    v6 = sub_100017248(v3, v5);
  }
  else
  {
    if (os_log_type_enabled((os_log_t)&_os_log_default, OS_LOG_TYPE_ERROR))
      sub_10001FB08();
    v6 = 0;
  }

  return v6;
}

id sub_10001740C(void *a1)
{
  id v1;
  void *v2;
  id v3;
  id v4;
  id v5;
  id v7;

  v1 = a1;
  v2 = (void *)objc_claimAutoreleasedReturnValue(+[NSURL fileURLWithPath:isDirectory:](NSURL, "fileURLWithPath:isDirectory:", v1, 0));
  v7 = 0;
  v3 = objc_msgSend(objc_alloc((Class)NSDictionary), "initWithContentsOfURL:error:", v2, &v7);
  v4 = v7;
  if (v4)
  {
    if (os_log_type_enabled((os_log_t)&_os_log_default, OS_LOG_TYPE_ERROR))
      sub_10001FB70();
    v5 = 0;
  }
  else
  {
    v5 = v3;
  }

  return v5;
}

CFMutableDictionaryRef sub_1000174D8()
{
  io_service_t MatchingService;
  kern_return_t v1;
  BOOL v2;
  CFMutableDictionaryRef v3;
  CFMutableDictionaryRef properties;

  properties = 0;
  MatchingService = dword_1000352D0;
  if (dword_1000352D0)
  {
LABEL_2:
    v1 = IORegistryEntryCreateCFProperties(MatchingService, &properties, kCFAllocatorDefault, 0);
    if (properties)
      v2 = v1 == 0;
    else
      v2 = 0;
    if (!v2)
      return (CFMutableDictionaryRef)0;
    v3 = properties;
    return v3;
  }
  v3 = IOServiceMatching("IOPMPowerSource");
  if (v3)
  {
    MatchingService = IOServiceGetMatchingService(kIOMainPortDefault, v3);
    dword_1000352D0 = MatchingService;
    if (!MatchingService)
      return (CFMutableDictionaryRef)0;
    goto LABEL_2;
  }
  return v3;
}

id sub_100017564()
{
  CFTypeID TypeID;
  id result;
  void *v2;
  void *v3;
  void *v4;
  id v5;

  TypeID = CFDictionaryGetTypeID();
  result = (id)sub_1000175D8(CFSTR("BatteryData"), TypeID);
  if (result)
  {
    v2 = result;
    v3 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(result, "objectForKeyedSubscript:", CFSTR("Qmax")));
    v4 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v3, "firstObject"));
    v5 = objc_msgSend(v4, "unsignedIntValue");

    return v5;
  }
  return result;
}

const void *sub_1000175D8(void *a1, uint64_t a2)
{
  __CFString *v3;
  const __CFDictionary *v4;
  io_service_t MatchingService;
  io_object_t v6;
  CFTypeRef CFProperty;
  const void *v8;
  _BOOL8 v10;
  uint64_t v11;
  uint64_t v12;
  uint64_t v13;
  uint64_t v14;
  uint64_t v15;
  uint64_t v16;
  uint64_t v17;

  v3 = a1;
  v4 = IOServiceMatching("AppleSmartBattery");
  MatchingService = IOServiceGetMatchingService(kIOMainPortDefault, v4);
  if (MatchingService)
  {
    v6 = MatchingService;
    CFProperty = IORegistryEntryCreateCFProperty(MatchingService, v3, kCFAllocatorDefault, 0);
    v8 = CFProperty;
    if (CFProperty && CFGetTypeID(CFProperty) == a2)
      goto LABEL_7;
    if (os_log_type_enabled((os_log_t)&_os_log_default, OS_LOG_TYPE_ERROR))
    {
      sub_10001FC10();
      if (!v8)
        goto LABEL_7;
    }
    else if (!v8)
    {
LABEL_7:
      IOObjectRelease(v6);
      goto LABEL_8;
    }
    CFRelease(v8);
    v8 = 0;
    goto LABEL_7;
  }
  v10 = os_log_type_enabled((os_log_t)&_os_log_default, OS_LOG_TYPE_ERROR);
  if (v10)
    sub_10001FBD8(v10, v11, v12, v13, v14, v15, v16, v17);
  v8 = 0;
LABEL_8:

  return v8;
}

uint64_t sub_1000176E4()
{
  __int16 v1;
  unsigned int v2;

  v2 = 0;
  v1 = 0;
  IOPSGetPercentRemaining(&v2, (char *)&v1 + 1, &v1);
  return v2;
}

id sub_100017718()
{
  CFTypeID TypeID;
  id result;
  void *v2;
  id v3;

  TypeID = CFNumberGetTypeID();
  result = (id)sub_1000175D8(CFSTR("NominalChargeCapacity"), TypeID);
  if (result)
  {
    v2 = result;
    v3 = objc_msgSend(result, "unsignedIntValue");

    return v3;
  }
  return result;
}

id sub_10001775C()
{
  CFTypeID TypeID;
  void *v1;
  void *v2;
  void *v3;
  uint64_t v4;
  id v5;
  uint64_t v6;
  void *v7;

  TypeID = CFDictionaryGetTypeID();
  v1 = (void *)sub_1000175D8(CFSTR("BatteryData"), TypeID);
  if (!v1)
    return 0;
  v2 = v1;
  v3 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v1, "objectForKeyedSubscript:", CFSTR("WeightedRa")));
  v4 = objc_opt_class(NSNumber);
  if ((objc_opt_isKindOfClass(v3, v4) & 1) != 0)
  {
    v5 = objc_msgSend(v3, "unsignedIntValue");
  }
  else
  {
    v6 = objc_opt_class(NSArray);
    if ((objc_opt_isKindOfClass(v3, v6) & 1) != 0)
    {
      v7 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v3, "firstObject"));
      v5 = objc_msgSend(v7, "unsignedIntValue");

    }
    else
    {
      if (os_log_type_enabled((os_log_t)&_os_log_default, OS_LOG_TYPE_ERROR))
        sub_10001FC9C((uint64_t)v3);
      v5 = 0;
    }
  }

  return v5;
}

uint64_t sub_10001784C()
{
  if (qword_1000352A8 != -1)
    dispatch_once(&qword_1000352A8, &stru_10002CA48);
  return dword_1000352A0;
}

void sub_10001788C(id a1)
{
  CFTypeID TypeID;
  void *v2;
  id v3;

  TypeID = CFNumberGetTypeID();
  v2 = (void *)sub_1000175D8(CFSTR("DesignCapacity"), TypeID);
  if (v2)
  {
    v3 = v2;
    dword_1000352A0 = objc_msgSend(v2, "unsignedIntValue");

  }
}

uint64_t sub_1000178DC()
{
  CFTypeID TypeID;
  void *v1;
  void *v2;
  void *v3;
  void *v4;

  TypeID = CFDictionaryGetTypeID();
  v1 = (void *)sub_1000175D8(CFSTR("BatteryData"), TypeID);
  if (v1)
  {
    v2 = v1;
    v3 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v1, "objectForKeyedSubscript:", CFSTR("LifetimeData")));
    v4 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v3, "objectForKeyedSubscript:", CFSTR("TotalOperatingTime")));

    dword_1000352B0 = objc_msgSend(v4, "unsignedIntValue");
  }
  return dword_1000352B0;
}

uint64_t sub_100017960()
{
  CFTypeID TypeID;
  void *v1;
  void *v2;

  TypeID = CFNumberGetTypeID();
  v1 = (void *)sub_1000175D8(CFSTR("CycleCount"), TypeID);
  if (v1)
  {
    v2 = v1;
    dword_1000352B4 = objc_msgSend(v1, "unsignedIntValue");

  }
  return dword_1000352B4;
}

uint64_t sub_1000179A8()
{
  CFTypeID TypeID;
  void *v1;
  void *v2;
  void *v3;

  TypeID = CFDictionaryGetTypeID();
  v1 = (void *)sub_1000175D8(CFSTR("BatteryData"), TypeID);
  if (v1)
  {
    v2 = v1;
    v3 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v1, "objectForKeyedSubscript:", CFSTR("AlgoChemID")));
    dword_1000352B8 = objc_msgSend(v3, "unsignedIntValue");

  }
  return dword_1000352B8;
}

uint64_t sub_100017A10()
{
  CFTypeID TypeID;
  void *v1;
  void *v2;
  void *v3;
  void *v4;

  TypeID = CFDictionaryGetTypeID();
  v1 = (void *)sub_1000175D8(CFSTR("BatteryData"), TypeID);
  if (v1)
  {
    v2 = v1;
    v3 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v1, "objectForKeyedSubscript:", CFSTR("LifetimeData")));
    v4 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v3, "objectForKeyedSubscript:", CFSTR("MaximumTemperature")));

    word_1000352BC = (unsigned __int16)objc_msgSend(v4, "unsignedIntValue");
  }
  return (unsigned __int16)word_1000352BC;
}

BOOL sub_100017A94(_WORD *a1, unsigned __int8 *a2)
{
  _BOOL8 v2;
  CFTypeID TypeID;
  const void *v6;
  const void *v7;
  int v8;
  void *v9;
  void *v10;
  void *v11;
  unsigned __int16 v12;
  unsigned __int8 v13;
  void *v14;
  void *v15;
  unsigned __int16 v16;
  __int16 v17;
  _BOOL8 v18;
  uint64_t v19;
  uint64_t v20;
  uint64_t v21;
  uint64_t v22;
  uint64_t v23;
  uint64_t v24;
  uint64_t v25;
  void *v27;
  void *v28;

  v2 = 0;
  if (a1 && a2)
  {
    TypeID = CFStringGetTypeID();
    v6 = sub_1000175D8(CFSTR("Serial"), TypeID);
    if (v6)
    {
      v7 = v6;
      v28 = 0;
      v8 = IOPSGetYearAndWeekOfManufactureFromBatterySerial(v6, &v28);
      v2 = v8 != 0;
      CFRelease(v7);
      if (v8)
      {
        v9 = v28;
        if (os_log_type_enabled((os_log_t)&_os_log_default, OS_LOG_TYPE_DEBUG))
          sub_10001FDA8();
        v10 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v9, "substringWithRange:", 0, 1));
        v11 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v9, "substringWithRange:", 1, 2));
        v27 = v10;
        v12 = (unsigned __int16)objc_msgSend(v10, "integerValue");
        v13 = objc_msgSend(v11, "integerValue");
        if (os_log_type_enabled((os_log_t)&_os_log_default, OS_LOG_TYPE_DEBUG))
          sub_10001FD20(v13, v12);
        v14 = (void *)objc_claimAutoreleasedReturnValue(+[NSCalendar currentCalendar](NSCalendar, "currentCalendar"));
        v15 = (void *)objc_claimAutoreleasedReturnValue(+[NSDate now](NSDate, "now"));
        v16 = (unsigned __int16)objc_msgSend(v14, "component:fromDate:", 4, v15);

        if (v12 <= v16 % 0xAu)
          v17 = v16 - v16 % 0xAu;
        else
          v17 = v16 - v16 % 0xAu - 10;
        *a1 = v17 + v12;
        *a2 = v13;

      }
      else
      {
        v18 = os_log_type_enabled((os_log_t)&_os_log_default, OS_LOG_TYPE_ERROR);
        if (v18)
          sub_10001FE1C(v18, v19, v20, v21, v22, v23, v24, v25);
      }
    }
    else
    {
      return 0;
    }
  }
  return v2;
}

uint64_t sub_100017C88(uint64_t a1)
{
  void *v2;
  void *v3;
  void *v4;
  void *v5;
  uint64_t v6;
  _QWORD v8[32];
  _QWORD v9[32];

  v8[0] = &off_10002F680;
  v8[1] = &off_10002F6B0;
  v9[0] = &off_10002F698;
  v9[1] = &off_10002F698;
  v8[2] = &off_10002F6C8;
  v8[3] = &off_10002F6F8;
  v9[2] = &off_10002F6E0;
  v9[3] = &off_10002F6E0;
  v8[4] = &off_10002F710;
  v8[5] = &off_10002F740;
  v9[4] = &off_10002F728;
  v9[5] = &off_10002F758;
  v8[6] = &off_10002F770;
  v8[7] = &off_10002F788;
  v9[6] = &off_10002F758;
  v9[7] = &off_10002F7A0;
  v8[8] = &off_10002F7B8;
  v8[9] = &off_10002F7D0;
  v9[8] = &off_10002F7A0;
  v9[9] = &off_10002F7E8;
  v8[10] = &off_10002F800;
  v8[11] = &off_10002F830;
  v9[10] = &off_10002F818;
  v9[11] = &off_10002F818;
  v8[12] = &off_10002F848;
  v8[13] = &off_10002F878;
  v9[12] = &off_10002F860;
  v9[13] = &off_10002F890;
  v8[14] = &off_10002F8A8;
  v8[15] = &off_10002F8D8;
  v9[14] = &off_10002F8C0;
  v9[15] = &off_10002F8F0;
  v8[16] = &off_10002F908;
  v8[17] = &off_10002F938;
  v9[16] = &off_10002F920;
  v9[17] = &off_10002F950;
  v8[18] = &off_10002F968;
  v8[19] = &off_10002F998;
  v9[18] = &off_10002F980;
  v9[19] = &off_10002F9B0;
  v8[20] = &off_10002F9C8;
  v8[21] = &off_10002F9E0;
  v9[20] = &off_10002F6E0;
  v9[21] = &off_10002F6E0;
  v8[22] = &off_10002F9F8;
  v8[23] = &off_10002FA28;
  v9[22] = &off_10002FA10;
  v9[23] = &off_10002FA40;
  v8[24] = &off_10002FA58;
  v8[25] = &off_10002FA88;
  v9[24] = &off_10002FA70;
  v9[25] = &off_10002F698;
  v8[26] = &off_10002FAA0;
  v8[27] = &off_10002FAB8;
  v9[26] = &off_10002F698;
  v9[27] = &off_10002FAD0;
  v8[28] = &off_10002FAE8;
  v8[29] = &off_10002FB00;
  v9[28] = &off_10002F818;
  v9[29] = &off_10002FB18;
  v8[30] = &off_10002FB30;
  v8[31] = &off_10002FB48;
  v9[30] = &off_10002F9B0;
  v9[31] = &off_10002F950;
  v2 = (void *)objc_claimAutoreleasedReturnValue(+[NSDictionary dictionaryWithObjects:forKeys:count:](NSDictionary, "dictionaryWithObjects:forKeys:count:", v9, v8, 32));
  v3 = (void *)objc_claimAutoreleasedReturnValue(+[NSNumber numberWithInt:](NSNumber, "numberWithInt:", a1));
  v4 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v2, "objectForKeyedSubscript:", v3));

  if (v4)
  {
    v5 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v2, "objectForKeyedSubscript:", v3));
    v6 = (uint64_t)objc_msgSend(v5, "unsignedIntValue");

  }
  else
  {
    v6 = 100;
  }

  return v6;
}

id sub_100017F90(void *a1)
{
  id v1;
  void *v2;
  void *v3;
  void *v4;

  v1 = a1;
  v2 = v1;
  if (v1 && objc_msgSend(v1, "count"))
  {
    v3 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v2, "sortedArrayUsingSelector:", "compare:"));
    v4 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v3, "objectAtIndex:", ((unint64_t)objc_msgSend(v2, "count")
                                                                                     - 1) >> 1));

  }
  else
  {
    v4 = (void *)objc_claimAutoreleasedReturnValue(+[NSNull null](NSNull, "null"));
  }

  return v4;
}

id sub_100018024(void *a1)
{
  id v1;
  void *v2;
  void *v3;
  void *v4;

  v1 = a1;
  v2 = v1;
  if (v1 && objc_msgSend(v1, "count"))
  {
    v3 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v2, "sortedArrayUsingSelector:", "compare:"));
    v4 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v3, "lastObject"));

  }
  else
  {
    v4 = (void *)objc_claimAutoreleasedReturnValue(+[NSNull null](NSNull, "null"));
  }

  return v4;
}

id sub_1000180A4(void *a1)
{
  id v1;
  void *v2;
  void *v3;
  void *v4;

  v1 = a1;
  v2 = v1;
  if (v1 && objc_msgSend(v1, "count"))
  {
    v3 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v2, "sortedArrayUsingSelector:", "compare:"));
    v4 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v3, "firstObject"));

  }
  else
  {
    v4 = (void *)objc_claimAutoreleasedReturnValue(+[NSNull null](NSNull, "null"));
  }

  return v4;
}

id sub_100018124(void *a1, void *a2)
{
  id v3;
  id v4;
  void *v5;
  id v6;
  id v7;
  void *v8;
  id v9;
  id v11;
  id v12;

  v3 = a2;
  v4 = a1;
  v5 = (void *)objc_claimAutoreleasedReturnValue(+[NSCalendar currentCalendar](NSCalendar, "currentCalendar"));
  v12 = 0;
  objc_msgSend(v5, "rangeOfUnit:startDate:interval:forDate:", 16, &v12, 0, v4);

  v6 = v12;
  v11 = 0;
  objc_msgSend(v5, "rangeOfUnit:startDate:interval:forDate:", 16, &v11, 0, v3);

  v7 = v11;
  v8 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v5, "components:fromDate:toDate:options:", 16, v6, v7, 0));
  v9 = objc_msgSend(v8, "day");

  return v9;
}

id sub_100018210(void *a1)
{
  id v1;
  unsigned int v2;
  unsigned int v3;
  double v4;
  void *v5;

  v1 = a1;
  if (qword_1000352A8 != -1)
    dispatch_once(&qword_1000352A8, &stru_10002CA48);
  v2 = dword_1000352A0;
  if (objc_msgSend(v1, "isEqualToString:", CFSTR("nccp")))
  {
    v3 = sub_100017718();
LABEL_7:
    *(float *)&v4 = (float)v3 / (float)v2;
LABEL_8:
    v5 = (void *)objc_claimAutoreleasedReturnValue(+[NSNumber numberWithFloat:](NSNumber, "numberWithFloat:", v4));
    goto LABEL_9;
  }
  if (objc_msgSend(v1, "isEqualToString:", CFSTR("qmaxp")))
  {
    v3 = sub_100017564();
    goto LABEL_7;
  }
  if (objc_msgSend(v1, "isEqualToString:", CFSTR("wra")))
  {
    *(float *)&v4 = (float)sub_10001775C();
    goto LABEL_8;
  }
  if (os_log_type_enabled((os_log_t)&_os_log_default, OS_LOG_TYPE_ERROR))
    sub_10001FE54();
  v5 = 0;
LABEL_9:

  return v5;
}

void sub_100018384(uint64_t a1)
{
  id v1;
  void *v2;

  v1 = objc_alloc_init(*(Class *)(a1 + 32));
  v2 = (void *)qword_1000352C0;
  qword_1000352C0 = (uint64_t)v1;

}

id sub_100018924(void *a1)
{
  id v1;
  void *v2;
  void *v3;
  void *v4;
  void *v5;
  void *v6;
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
  void *v17;
  void *v18;
  void *v19;
  _QWORD v21[3];
  _QWORD v22[3];

  v1 = a1;
  v2 = (void *)objc_claimAutoreleasedReturnValue(+[NSBundle mainBundle](NSBundle, "mainBundle"));
  v3 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v2, "pathForResource:ofType:", v1, CFSTR("mlmodelc")));

  if (v3)
  {
    v4 = (void *)objc_claimAutoreleasedReturnValue(+[NSURL fileURLWithPath:](NSURL, "fileURLWithPath:", v3));
    v5 = (void *)objc_claimAutoreleasedReturnValue(+[MLModel modelWithContentsOfURL:error:](MLModel, "modelWithContentsOfURL:error:", v4, 0));

    if (v5)
    {
      v6 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v5, "modelDescription"));
      v7 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v6, "metadata"));

      if (v7)
      {
        v8 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v5, "modelDescription"));
        v9 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v8, "metadata"));
        v10 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v9, "objectForKeyedSubscript:", MLModelVersionStringKey));

        v11 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v5, "modelDescription"));
        v12 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v11, "predictedFeatureName"));

        v13 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v5, "modelDescription"));
        v14 = v13;
        if (v12)
        {
          v15 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v13, "predictedFeatureName"));
          v16 = objc_msgSend(v15, "copy");
LABEL_16:
          v19 = v16;

          v21[0] = CFSTR("mlModel");
          v21[1] = CFSTR("version");
          v22[0] = v5;
          v22[1] = v10;
          v21[2] = CFSTR("predictedFeatureNames");
          v22[2] = v19;
          v17 = (void *)objc_claimAutoreleasedReturnValue(+[NSDictionary dictionaryWithObjects:forKeys:count:](NSDictionary, "dictionaryWithObjects:forKeys:count:", v22, v21, 3));

          goto LABEL_17;
        }
        v18 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v13, "outputDescriptionsByName"));

        if (v18)
        {
          v14 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v5, "modelDescription"));
          v15 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v14, "outputDescriptionsByName"));
          v16 = (id)objc_claimAutoreleasedReturnValue(objc_msgSend(v15, "allKeys"));
          goto LABEL_16;
        }
        if (os_log_type_enabled((os_log_t)&_os_log_default, OS_LOG_TYPE_ERROR))
          sub_10001FFF4();

      }
      else if (os_log_type_enabled((os_log_t)&_os_log_default, OS_LOG_TYPE_ERROR))
      {
        sub_10001FF8C();
      }

    }
    else if (os_log_type_enabled((os_log_t)&_os_log_default, OS_LOG_TYPE_ERROR))
    {
      sub_10001FF24();
    }
  }
  else if (os_log_type_enabled((os_log_t)&_os_log_default, OS_LOG_TYPE_ERROR))
  {
    sub_10001FEBC();
  }
  v17 = 0;
LABEL_17:

  return v17;
}

void sub_100018C08(void *a1, NSObject *a2, uint64_t a3, const char *a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint8_t a9)
{
  _os_log_error_impl(a1, a2, OS_LOG_TYPE_ERROR, a4, &a9, 0x16u);
}

void sub_100018C58(id a1)
{
  TimeTo80Listener *v1;
  void *v2;

  v1 = objc_alloc_init(TimeTo80Listener);
  v2 = (void *)qword_1000352D8;
  qword_1000352D8 = (uint64_t)v1;

}

void sub_100018FDC(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, uint64_t a13, ...)
{
  va_list va;

  va_start(va, a13);
  _Block_object_dispose(va, 8);
  _Unwind_Resume(a1);
}

uint64_t sub_100019000()
{
  uint64_t result;
  NSObject *v1;
  _BOOL4 v2;
  uint8_t v3[4];
  int out_token;
  uint64_t state64;

  state64 = 0;
  out_token = 0;
  notify_register_check("com.apple.system.powersources.timeremaining", &out_token);
  if (notify_is_valid_token(out_token))
  {
    notify_get_state(out_token, &state64);
    notify_cancel(out_token);
    return BYTE2(state64) & 1;
  }
  else
  {
    v1 = qword_1000352E8;
    v2 = os_log_type_enabled((os_log_t)qword_1000352E8, OS_LOG_TYPE_DEFAULT);
    result = 0;
    if (v2)
    {
      *(_WORD *)v3 = 0;
      _os_log_impl((void *)&_mh_execute_header, v1, OS_LOG_TYPE_DEFAULT, "Invalid registration token for kIOPSNotifyTimeRemaining", v3, 2u);
      return 0;
    }
  }
  return result;
}

void sub_1000190B0(uint64_t a1, uint64_t a2)
{
  uint64_t v3;
  const char *v4;
  NSObject *v5;
  os_log_type_t v6;
  uint64_t v7;
  void *v8;
  void *v9;
  _BYTE v10[24];

  if (*(_BYTE *)(*(_QWORD *)(*(_QWORD *)(a1 + 32) + 8) + 24) == 1)
  {
    +[BIXPCAlarm setAlarmWithName:withClock:afterSeconds:wakeUpAP:](BIXPCAlarm, "setAlarmWithName:withClock:afterSeconds:wakeUpAP:", CFSTR("tt80RunAtPlugin"), 4, 1, 10.0);
    v3 = qword_1000352E8;
    if (os_log_type_enabled((os_log_t)qword_1000352E8, OS_LOG_TYPE_DEFAULT))
    {
      *(_DWORD *)v10 = 134218242;
      *(_QWORD *)&v10[4] = 0x4024000000000000;
      *(_WORD *)&v10[12] = 2112;
      *(_QWORD *)&v10[14] = CFSTR("tt80RunAtPlugin");
      v4 = "Alarm set after %g seconds for %@!";
      v5 = v3;
      v6 = OS_LOG_TYPE_DEFAULT;
LABEL_6:
      _os_log_impl((void *)&_mh_execute_header, v5, v6, v4, v10, 0x16u);
    }
  }
  else
  {
    +[BIXPCAlarm deleteAlarmWithName:](BIXPCAlarm, "deleteAlarmWithName:", CFSTR("tt80RunAtPlugin"));
    +[BIXPCAlarm deleteAlarmWithName:](BIXPCAlarm, "deleteAlarmWithName:", CFSTR("tt80RunDuringChargingSession"));
    v7 = qword_1000352E8;
    if (os_log_type_enabled((os_log_t)qword_1000352E8, OS_LOG_TYPE_INFO))
    {
      *(_DWORD *)v10 = 138412546;
      *(_QWORD *)&v10[4] = CFSTR("tt80RunAtPlugin");
      *(_WORD *)&v10[12] = 2112;
      *(_QWORD *)&v10[14] = CFSTR("tt80RunDuringChargingSession");
      v4 = "Deleted alarms: %@ and %@.";
      v5 = v7;
      v6 = OS_LOG_TYPE_INFO;
      goto LABEL_6;
    }
  }
  v8 = (void *)qword_1000352F0;
  v9 = (void *)objc_claimAutoreleasedReturnValue(+[NSNumber numberWithUnsignedChar:](NSNumber, "numberWithUnsignedChar:", a2, *(_OWORD *)v10, *(_QWORD *)&v10[16]));
  objc_msgSend(v8, "setObject:forKey:", v9, CFSTR("LastConnectedState"));

}

void sub_10001924C(uint64_t a1, uint64_t a2)
{
  void *v3;
  int v4;
  uint64_t v5;
  NSObject *v6;
  int v7;
  NSObject *v8;
  uint64_t v9;
  uint64_t v10;
  uint64_t v11;
  uint64_t v12;
  uint64_t v13;
  uint64_t v14;
  uint64_t v15;
  _DWORD v16[2];

  v3 = (void *)os_transaction_create("com.apple.batteryintelligenced.tt80.checkconnection", a2);
  v4 = sub_100019000();
  v5 = *(_QWORD *)(*(_QWORD *)(a1 + 40) + 8);
  if (v4 != *(unsigned __int8 *)(v5 + 24))
  {
    *(_BYTE *)(v5 + 24) = v4;
    v6 = qword_1000352E8;
    if (os_log_type_enabled((os_log_t)qword_1000352E8, OS_LOG_TYPE_DEFAULT))
    {
      v7 = *(unsigned __int8 *)(*(_QWORD *)(*(_QWORD *)(a1 + 40) + 8) + 24);
      v16[0] = 67109120;
      v16[1] = v7;
      _os_log_impl((void *)&_mh_execute_header, v6, OS_LOG_TYPE_DEFAULT, "Connected state changed to %u", (uint8_t *)v16, 8u);
    }
    v8 = qword_1000352E8;
    if (os_log_type_enabled((os_log_t)qword_1000352E8, OS_LOG_TYPE_DEBUG))
      sub_100020154(v8, v9, v10, v11, v12, v13, v14, v15);
    (*(void (**)(void))(*(_QWORD *)(a1 + 32) + 16))();
  }

}

void sub_100019400(uint64_t a1, uint64_t a2)
{
  void *v3;
  uint64_t v4;
  unsigned int v5;
  unsigned int v6;
  NSObject *v7;
  void *v8;
  NSObject *v9;
  void *v10;
  NSObject *v11;
  void *v12;
  void *v13;
  int v14;
  _BYTE v15[10];
  const __CFString *v16;

  v3 = (void *)os_transaction_create("com.apple.batteryintelligenced.tt80.checkconnection", a2);
  v4 = sub_100019000();
  v5 = sub_1000176E4();
  v6 = v5;
  v7 = qword_1000352E8;
  if ((_DWORD)v4 && v5 < 0x4C)
  {
    if (os_log_type_enabled((os_log_t)qword_1000352E8, OS_LOG_TYPE_INFO))
    {
      LOWORD(v14) = 0;
      _os_log_impl((void *)&_mh_execute_header, v7, OS_LOG_TYPE_INFO, "Running TT80 inference!", (uint8_t *)&v14, 2u);
    }
    v8 = (void *)objc_claimAutoreleasedReturnValue(+[TimeTo80Estimator sharedPredictor](TimeTo80Estimator, "sharedPredictor"));
    objc_msgSend(v8, "predictAndRecordWithParams:", *(_QWORD *)(a1 + 32));

    if (*(_BYTE *)(a1 + 40))
    {
      +[BIXPCAlarm setAlarmWithName:withClock:afterSeconds:wakeUpAP:](BIXPCAlarm, "setAlarmWithName:withClock:afterSeconds:wakeUpAP:", CFSTR("tt80RunDuringChargingSession"), 4, 1, 420.0);
      v9 = qword_1000352E8;
      if (os_log_type_enabled((os_log_t)qword_1000352E8, OS_LOG_TYPE_INFO))
      {
        v14 = 134218242;
        *(_QWORD *)v15 = 0x407A400000000000;
        *(_WORD *)&v15[8] = 2112;
        v16 = CFSTR("tt80RunDuringChargingSession");
        _os_log_impl((void *)&_mh_execute_header, v9, OS_LOG_TYPE_INFO, "Alarm set after %g seconds for %@!", (uint8_t *)&v14, 0x16u);
      }
    }
  }
  else
  {
    if (os_log_type_enabled((os_log_t)qword_1000352E8, OS_LOG_TYPE_DEFAULT))
    {
      v14 = 67109376;
      *(_DWORD *)v15 = v4 == 0;
      *(_WORD *)&v15[4] = 1024;
      *(_DWORD *)&v15[6] = v6 > 0x4B;
      _os_log_impl((void *)&_mh_execute_header, v7, OS_LOG_TYPE_DEFAULT, "Aborting inference: %u %u", (uint8_t *)&v14, 0xEu);
    }
    v10 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend((id)qword_1000352F0, "objectForKey:", CFSTR("LastConnectedState")));
    if (objc_msgSend(v10, "unsignedIntValue") != (_DWORD)v4)
    {
      v11 = qword_1000352E8;
      if (os_log_type_enabled((os_log_t)qword_1000352E8, OS_LOG_TYPE_DEFAULT))
      {
        v14 = 67109120;
        *(_DWORD *)v15 = v4;
        _os_log_impl((void *)&_mh_execute_header, v11, OS_LOG_TYPE_DEFAULT, "Connected state changed during inference time to %u", (uint8_t *)&v14, 8u);
      }
      v12 = (void *)qword_1000352F0;
      v13 = (void *)objc_claimAutoreleasedReturnValue(+[NSNumber numberWithUnsignedChar:](NSNumber, "numberWithUnsignedChar:", v4));
      objc_msgSend(v12, "setObject:forKey:", v13, CFSTR("LastConnectedState"));

    }
  }

}

void sub_1000196A8(void *a1, NSObject *a2, uint64_t a3, const char *a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint8_t a9)
{
  _os_log_debug_impl(a1, a2, OS_LOG_TYPE_DEBUG, a4, &a9, 2u);
}

id sub_1000198C4(uint64_t a1)
{
  return *(id *)(a1 + 32);
}

void sub_10001A138(uint64_t a1, void *a2)
{
  nccp_wra_qmaxp_seq_model *v3;
  id v4;

  v4 = a2;
  if (v4)
  {
    v3 = -[nccp_wra_qmaxp_seq_model initWithMLModel:]([nccp_wra_qmaxp_seq_model alloc], "initWithMLModel:", v4);
    (*(void (**)(void))(*(_QWORD *)(a1 + 32) + 16))();

  }
  else
  {
    (*(void (**)(void))(*(_QWORD *)(a1 + 32) + 16))();
  }

}

void sub_10001A48C(uint64_t a1, void *a2, void *a3)
{
  nccp_wra_qmaxp_seq_modelOutput *v5;
  void *v6;
  void *v7;
  void *v8;
  void *v9;
  void *v10;
  void *v11;
  void *v12;
  void *v13;
  void *v14;
  nccp_wra_qmaxp_seq_modelOutput *v15;
  uint64_t v16;
  void (*v17)(uint64_t, _QWORD, nccp_wra_qmaxp_seq_modelOutput *);
  uint64_t v18;
  void *v19;
  id v20;
  id v21;

  v21 = a2;
  if (v21)
  {
    v20 = a3;
    v5 = [nccp_wra_qmaxp_seq_modelOutput alloc];
    v19 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v21, "featureValueForName:", CFSTR("nccp_wra_qmaxp_q10_forecast")));
    v6 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v19, "multiArrayValue"));
    v7 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v21, "featureValueForName:", CFSTR("nccp_wra_qmaxp_q25_forecast")));
    v8 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v7, "multiArrayValue"));
    v9 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v21, "featureValueForName:", CFSTR("nccp_wra_qmaxp_q50_forecast")));
    v10 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v9, "multiArrayValue"));
    v11 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v21, "featureValueForName:", CFSTR("nccp_wra_qmaxp_q75_forecast")));
    v12 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v11, "multiArrayValue"));
    v18 = a1;
    v13 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v21, "featureValueForName:", CFSTR("nccp_wra_qmaxp_q90_forecast")));
    v14 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v13, "multiArrayValue"));
    v15 = -[nccp_wra_qmaxp_seq_modelOutput initWithNccp_wra_qmaxp_q10_forecast:nccp_wra_qmaxp_q25_forecast:nccp_wra_qmaxp_q50_forecast:nccp_wra_qmaxp_q75_forecast:nccp_wra_qmaxp_q90_forecast:](v5, "initWithNccp_wra_qmaxp_q10_forecast:nccp_wra_qmaxp_q25_forecast:nccp_wra_qmaxp_q50_forecast:nccp_wra_qmaxp_q75_forecast:nccp_wra_qmaxp_q90_forecast:", v6, v8, v10, v12, v14);

    (*(void (**)(void))(*(_QWORD *)(v18 + 32) + 16))();
  }
  else
  {
    v16 = *(_QWORD *)(a1 + 32);
    v17 = *(void (**)(uint64_t, _QWORD, nccp_wra_qmaxp_seq_modelOutput *))(v16 + 16);
    v15 = a3;
    v17(v16, 0, v15);
  }

}

void sub_10001A70C(uint64_t a1, void *a2, void *a3)
{
  nccp_wra_qmaxp_seq_modelOutput *v5;
  void *v6;
  void *v7;
  void *v8;
  void *v9;
  void *v10;
  void *v11;
  void *v12;
  void *v13;
  void *v14;
  nccp_wra_qmaxp_seq_modelOutput *v15;
  uint64_t v16;
  void (*v17)(uint64_t, _QWORD, nccp_wra_qmaxp_seq_modelOutput *);
  uint64_t v18;
  void *v19;
  id v20;
  id v21;

  v21 = a2;
  if (v21)
  {
    v20 = a3;
    v5 = [nccp_wra_qmaxp_seq_modelOutput alloc];
    v19 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v21, "featureValueForName:", CFSTR("nccp_wra_qmaxp_q10_forecast")));
    v6 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v19, "multiArrayValue"));
    v7 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v21, "featureValueForName:", CFSTR("nccp_wra_qmaxp_q25_forecast")));
    v8 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v7, "multiArrayValue"));
    v9 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v21, "featureValueForName:", CFSTR("nccp_wra_qmaxp_q50_forecast")));
    v10 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v9, "multiArrayValue"));
    v11 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v21, "featureValueForName:", CFSTR("nccp_wra_qmaxp_q75_forecast")));
    v12 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v11, "multiArrayValue"));
    v18 = a1;
    v13 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v21, "featureValueForName:", CFSTR("nccp_wra_qmaxp_q90_forecast")));
    v14 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v13, "multiArrayValue"));
    v15 = -[nccp_wra_qmaxp_seq_modelOutput initWithNccp_wra_qmaxp_q10_forecast:nccp_wra_qmaxp_q25_forecast:nccp_wra_qmaxp_q50_forecast:nccp_wra_qmaxp_q75_forecast:nccp_wra_qmaxp_q90_forecast:](v5, "initWithNccp_wra_qmaxp_q10_forecast:nccp_wra_qmaxp_q25_forecast:nccp_wra_qmaxp_q50_forecast:nccp_wra_qmaxp_q75_forecast:nccp_wra_qmaxp_q90_forecast:", v6, v8, v10, v12, v14);

    (*(void (**)(void))(*(_QWORD *)(v18 + 32) + 16))();
  }
  else
  {
    v16 = *(_QWORD *)(a1 + 32);
    v17 = *(void (**)(uint64_t, _QWORD, nccp_wra_qmaxp_seq_modelOutput *))(v16 + 16);
    v15 = a3;
    v17(v16, 0, v15);
  }

}

void sub_10001B1BC(uint64_t a1, void *a2)
{
  tt80_lstm_regression *v3;
  id v4;

  v4 = a2;
  if (v4)
  {
    v3 = -[tt80_lstm_regression initWithMLModel:]([tt80_lstm_regression alloc], "initWithMLModel:", v4);
    (*(void (**)(void))(*(_QWORD *)(a1 + 32) + 16))();

  }
  else
  {
    (*(void (**)(void))(*(_QWORD *)(a1 + 32) + 16))();
  }

}

void sub_10001B424(uint64_t a1, void *a2, void *a3)
{
  id v5;
  tt80_lstm_regressionOutput *v6;
  void *v7;
  void *v8;
  tt80_lstm_regressionOutput *v9;
  uint64_t v10;
  void (*v11)(uint64_t, _QWORD, tt80_lstm_regressionOutput *);
  id v12;

  v12 = a2;
  if (v12)
  {
    v5 = a3;
    v6 = [tt80_lstm_regressionOutput alloc];
    v7 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v12, "featureValueForName:", CFSTR("tt80_prediction_in_hrs")));
    v8 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v7, "multiArrayValue"));
    v9 = -[tt80_lstm_regressionOutput initWithTt80_prediction_in_hrs:](v6, "initWithTt80_prediction_in_hrs:", v8);

    (*(void (**)(void))(*(_QWORD *)(a1 + 32) + 16))();
  }
  else
  {
    v10 = *(_QWORD *)(a1 + 32);
    v11 = *(void (**)(uint64_t, _QWORD, tt80_lstm_regressionOutput *))(v10 + 16);
    v9 = a3;
    v11(v10, 0, v9);
  }

}

void sub_10001B5C4(uint64_t a1, void *a2, void *a3)
{
  id v5;
  tt80_lstm_regressionOutput *v6;
  void *v7;
  void *v8;
  tt80_lstm_regressionOutput *v9;
  uint64_t v10;
  void (*v11)(uint64_t, _QWORD, tt80_lstm_regressionOutput *);
  id v12;

  v12 = a2;
  if (v12)
  {
    v5 = a3;
    v6 = [tt80_lstm_regressionOutput alloc];
    v7 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v12, "featureValueForName:", CFSTR("tt80_prediction_in_hrs")));
    v8 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v7, "multiArrayValue"));
    v9 = -[tt80_lstm_regressionOutput initWithTt80_prediction_in_hrs:](v6, "initWithTt80_prediction_in_hrs:", v8);

    (*(void (**)(void))(*(_QWORD *)(a1 + 32) + 16))();
  }
  else
  {
    v10 = *(_QWORD *)(a1 + 32);
    v11 = *(void (**)(uint64_t, _QWORD, tt80_lstm_regressionOutput *))(v10 + 16);
    v9 = a3;
    v11(v10, 0, v9);
  }

}

void sub_10001BF28(uint64_t a1, void *a2)
{
  state_estimation_model *v3;
  id v4;

  v4 = a2;
  if (v4)
  {
    v3 = -[state_estimation_model initWithMLModel:]([state_estimation_model alloc], "initWithMLModel:", v4);
    (*(void (**)(void))(*(_QWORD *)(a1 + 32) + 16))();

  }
  else
  {
    (*(void (**)(void))(*(_QWORD *)(a1 + 32) + 16))();
  }

}

void sub_10001C190(uint64_t a1, void *a2, void *a3)
{
  id v5;
  state_estimation_modelOutput *v6;
  void *v7;
  void *v8;
  state_estimation_modelOutput *v9;
  uint64_t v10;
  void (*v11)(uint64_t, _QWORD, state_estimation_modelOutput *);
  id v12;

  v12 = a2;
  if (v12)
  {
    v5 = a3;
    v6 = [state_estimation_modelOutput alloc];
    v7 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v12, "featureValueForName:", CFSTR("health_state_estimation")));
    v8 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v7, "multiArrayValue"));
    v9 = -[state_estimation_modelOutput initWithHealth_state_estimation:](v6, "initWithHealth_state_estimation:", v8);

    (*(void (**)(void))(*(_QWORD *)(a1 + 32) + 16))();
  }
  else
  {
    v10 = *(_QWORD *)(a1 + 32);
    v11 = *(void (**)(uint64_t, _QWORD, state_estimation_modelOutput *))(v10 + 16);
    v9 = a3;
    v11(v10, 0, v9);
  }

}

void sub_10001C330(uint64_t a1, void *a2, void *a3)
{
  id v5;
  state_estimation_modelOutput *v6;
  void *v7;
  void *v8;
  state_estimation_modelOutput *v9;
  uint64_t v10;
  void (*v11)(uint64_t, _QWORD, state_estimation_modelOutput *);
  id v12;

  v12 = a2;
  if (v12)
  {
    v5 = a3;
    v6 = [state_estimation_modelOutput alloc];
    v7 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v12, "featureValueForName:", CFSTR("health_state_estimation")));
    v8 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v7, "multiArrayValue"));
    v9 = -[state_estimation_modelOutput initWithHealth_state_estimation:](v6, "initWithHealth_state_estimation:", v8);

    (*(void (**)(void))(*(_QWORD *)(a1 + 32) + 16))();
  }
  else
  {
    v10 = *(_QWORD *)(a1 + 32);
    v11 = *(void (**)(uint64_t, _QWORD, state_estimation_modelOutput *))(v10 + 16);
    v9 = a3;
    v11(v10, 0, v9);
  }

}

void sub_10001CC24(uint64_t a1, void *a2)
{
  ocv_drift_model *v3;
  id v4;

  v4 = a2;
  if (v4)
  {
    v3 = -[ocv_drift_model initWithMLModel:]([ocv_drift_model alloc], "initWithMLModel:", v4);
    (*(void (**)(void))(*(_QWORD *)(a1 + 32) + 16))();

  }
  else
  {
    (*(void (**)(void))(*(_QWORD *)(a1 + 32) + 16))();
  }

}

void sub_10001CE8C(uint64_t a1, void *a2, void *a3)
{
  id v5;
  ocv_drift_modelOutput *v6;
  void *v7;
  void *v8;
  ocv_drift_modelOutput *v9;
  uint64_t v10;
  void (*v11)(uint64_t, _QWORD, ocv_drift_modelOutput *);
  id v12;

  v12 = a2;
  if (v12)
  {
    v5 = a3;
    v6 = [ocv_drift_modelOutput alloc];
    v7 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v12, "featureValueForName:", CFSTR("Prediction")));
    v8 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v7, "multiArrayValue"));
    v9 = -[ocv_drift_modelOutput initWithPrediction:](v6, "initWithPrediction:", v8);

    (*(void (**)(void))(*(_QWORD *)(a1 + 32) + 16))();
  }
  else
  {
    v10 = *(_QWORD *)(a1 + 32);
    v11 = *(void (**)(uint64_t, _QWORD, ocv_drift_modelOutput *))(v10 + 16);
    v9 = a3;
    v11(v10, 0, v9);
  }

}

void sub_10001D02C(uint64_t a1, void *a2, void *a3)
{
  id v5;
  ocv_drift_modelOutput *v6;
  void *v7;
  void *v8;
  ocv_drift_modelOutput *v9;
  uint64_t v10;
  void (*v11)(uint64_t, _QWORD, ocv_drift_modelOutput *);
  id v12;

  v12 = a2;
  if (v12)
  {
    v5 = a3;
    v6 = [ocv_drift_modelOutput alloc];
    v7 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v12, "featureValueForName:", CFSTR("Prediction")));
    v8 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v7, "multiArrayValue"));
    v9 = -[ocv_drift_modelOutput initWithPrediction:](v6, "initWithPrediction:", v8);

    (*(void (**)(void))(*(_QWORD *)(a1 + 32) + 16))();
  }
  else
  {
    v10 = *(_QWORD *)(a1 + 32);
    v11 = *(void (**)(uint64_t, _QWORD, ocv_drift_modelOutput *))(v10 + 16);
    v9 = a3;
    v11(v10, 0, v9);
  }

}

void sub_10001D31C()
{
  uint8_t v0[16];

  *(_WORD *)v0 = 0;
  _os_log_error_impl((void *)&_mh_execute_header, (os_log_t)&_os_log_default, OS_LOG_TYPE_ERROR, "Super init failed for BatteryAlgoInputs", v0, 2u);
}

void sub_10001D360()
{
  uint8_t v0[16];

  *(_WORD *)v0 = 0;
  _os_log_error_impl((void *)&_mh_execute_header, (os_log_t)&_os_log_default, OS_LOG_TYPE_ERROR, "Super init failed", v0, 2u);
}

void sub_10001D3A4(void *a1)
{
  void *v1;
  id v2;
  void *v3;
  uint64_t v4;
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t v9;
  uint8_t v10;

  sub_100006938(a1);
  v2 = objc_msgSend((id)sub_100006940(), "name");
  v3 = (void *)objc_claimAutoreleasedReturnValue(v2);
  sub_10000691C();
  sub_1000068FC((void *)&_mh_execute_header, v4, v5, "Asset path for %@ not found", v6, v7, v8, v9, v10);

  sub_100006910();
}

void sub_10001D424(void *a1)
{
  void *v1;
  id v2;
  void *v3;
  uint64_t v4;
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t v9;
  uint8_t v10;

  sub_100006938(a1);
  v2 = objc_msgSend((id)sub_100006940(), "name");
  v3 = (void *)objc_claimAutoreleasedReturnValue(v2);
  sub_10000691C();
  sub_1000068FC((void *)&_mh_execute_header, v4, v5, "ML model file for %@ not found", v6, v7, v8, v9, v10);

  sub_100006910();
}

void sub_10001D4A4(void *a1)
{
  void *v1;
  id v2;
  void *v3;
  uint64_t v4;
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t v9;
  uint8_t v10;

  sub_100006938(a1);
  v2 = objc_msgSend((id)sub_100006940(), "name");
  v3 = (void *)objc_claimAutoreleasedReturnValue(v2);
  sub_10000691C();
  sub_1000068FC((void *)&_mh_execute_header, v4, v5, "Failed at reading predicted feature name for %@", v6, v7, v8, v9, v10);

  sub_100006910();
}

void sub_10001D524(void *a1)
{
  void *v1;
  id v2;
  void *v3;
  uint64_t v4;
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t v9;
  uint8_t v10;

  sub_100006938(a1);
  v2 = objc_msgSend((id)sub_100006940(), "name");
  v3 = (void *)objc_claimAutoreleasedReturnValue(v2);
  sub_10000691C();
  sub_1000068FC((void *)&_mh_execute_header, v4, v5, "Failed at reading metadata for %@", v6, v7, v8, v9, v10);

  sub_100006910();
}

void sub_10001D5A4()
{
  NSObject *v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint8_t v6;

  sub_10000691C();
  sub_100006928((void *)&_mh_execute_header, v0, v1, "Using updated params during inference: %@", v2, v3, v4, v5, v6);
  sub_10000694C();
}

void sub_10001D604()
{
  NSObject *v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint8_t v6;

  sub_10000691C();
  sub_100006928((void *)&_mh_execute_header, v0, v1, "Recieved params for inference: %@", v2, v3, v4, v5, v6);
  sub_10000694C();
}

void sub_10001D664(void *a1, void *a2, uint64_t a3)
{
  NSObject *v5;
  void *v6;
  uint8_t v7[12];
  __int16 v8;
  uint64_t v9;

  v5 = sub_100006938(a1);
  v6 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(a2, "name"));
  sub_10000691C();
  v8 = 2112;
  v9 = a3;
  _os_log_error_impl((void *)&_mh_execute_header, v5, OS_LOG_TYPE_ERROR, "Could not get model predictions for %@ for %@", v7, 0x16u);

}

void sub_10001D718(os_log_t log)
{
  uint8_t v1[16];

  *(_WORD *)v1 = 0;
  _os_log_debug_impl((void *)&_mh_execute_header, log, OS_LOG_TYPE_DEBUG, "Nil params.", v1, 2u);
}

void sub_10001D758()
{
  NSObject *v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint8_t v6;

  sub_10000691C();
  sub_100006928((void *)&_mh_execute_header, v0, v1, "Missing %@ key in params dictionary", v2, v3, v4, v5, v6);
  sub_10000694C();
}

void sub_10001D7B8(void *a1, void *a2)
{
  id v3;
  void *v4;
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t v9;
  uint64_t v10;
  uint8_t v11;

  v3 = sub_100006938(a1);
  v4 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(a2, "objectForKey:", CFSTR("health_metric")));
  sub_10000691C();
  sub_1000068FC((void *)&_mh_execute_header, v5, v6, "Unable to get current value for metric: %@", v7, v8, v9, v10, v11);

  sub_100006910();
}

void sub_10001D844(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8)
{
  sub_100007C2C((void *)&_mh_execute_header, &_os_log_default, a3, "Super init failed", a5, a6, a7, a8, 0);
  sub_100007C4C();
}

void sub_10001D878()
{
  NSObject *v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint8_t v6;

  sub_100007C54();
  sub_100007C2C((void *)&_mh_execute_header, v0, v1, "Failed to create Global FeatureGen", v2, v3, v4, v5, v6);
  sub_100007C4C();
}

void sub_10001D8A4()
{
  NSObject *v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint8_t v6;

  sub_100007C54();
  sub_100007C2C((void *)&_mh_execute_header, v0, v1, "Failed to get health history.", v2, v3, v4, v5, v6);
  sub_100007C4C();
}

void sub_10001D8D0()
{
  NSObject *v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint8_t v6;

  sub_100007C54();
  sub_100007C2C((void *)&_mh_execute_header, v0, v1, "Failed to get usage history.", v2, v3, v4, v5, v6);
  sub_100007C4C();
}

void sub_10001D8FC()
{
  NSObject *v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint8_t v6;

  sub_10000691C();
  sub_100007C3C((void *)&_mh_execute_header, v0, v1, "Unable to get health features for unknown model type: %@.", v2, v3, v4, v5, v6);
  sub_10000694C();
}

void sub_10001D95C(os_log_t log)
{
  int v1;
  uint64_t v2;

  v1 = 138412290;
  v2 = qword_1000351F0;
  _os_log_debug_impl((void *)&_mh_execute_header, log, OS_LOG_TYPE_DEBUG, "Last feature gen date %@", (uint8_t *)&v1, 0xCu);
  sub_10000694C();
}

void sub_10001D9D8()
{
  NSObject *v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint8_t v6;

  sub_10000691C();
  sub_100007C3C((void *)&_mh_execute_header, v0, v1, "Unknown modelName: %@", v2, v3, v4, v5, v6);
  sub_10000694C();
}

void sub_10001DA38()
{
  NSObject *v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint8_t v6;

  sub_100007C54();
  sub_100007C2C((void *)&_mh_execute_header, v0, v1, "Error while copying input features.", v2, v3, v4, v5, v6);
  sub_100007C4C();
}

void sub_10001DA64()
{
  NSObject *v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint8_t v6;

  sub_10000691C();
  sub_100007C3C((void *)&_mh_execute_header, v0, v1, "Error while creating feature provider: %@", v2, v3, v4, v5, v6);
  sub_10000694C();
}

void sub_10001DAC4()
{
  NSObject *v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint8_t v6;

  sub_100007C54();
  sub_100007C2C((void *)&_mh_execute_header, v0, v1, "Error while running inference.", v2, v3, v4, v5, v6);
  sub_100007C4C();
}

void sub_10001DAF0()
{
  NSObject *v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint8_t v6;

  sub_10000691C();
  sub_100007C3C((void *)&_mh_execute_header, v0, v1, "Error while copying input features: %@", v2, v3, v4, v5, v6);
  sub_10000694C();
}

void sub_10001DB50(NSObject *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8)
{
  sub_100007C2C((void *)&_mh_execute_header, a1, a3, "Unable to load TT80EstimatorModel!", a5, a6, a7, a8, 0);
  sub_100007C4C();
}

void sub_10001DB80()
{
  NSObject *v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint8_t v6;

  sub_10000691C();
  sub_100007C3C((void *)&_mh_execute_header, v0, v1, "Error in running inference: %@", v2, v3, v4, v5, v6);
  sub_10000694C();
}

void sub_10001DBE0(NSObject *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8)
{
  sub_100007C2C((void *)&_mh_execute_header, a1, a3, "Nil enumerator for BDC_SBC", a5, a6, a7, a8, 0);
  sub_100007C4C();
}

void sub_10001DC10(void *a1, void *a2)
{
  NSObject *v3;
  _DWORD v4[2];

  v3 = a1;
  v4[0] = 67109120;
  v4[1] = objc_msgSend(a2, "integerValue");
  _os_log_error_impl((void *)&_mh_execute_header, v3, OS_LOG_TYPE_ERROR, "Not enough history to make prediction; only received %d rows",
    (uint8_t *)v4,
    8u);

  sub_10000694C();
}

void sub_10001DCA4(void *a1, void *a2)
{
  NSObject *v3;
  void *v4;
  uint8_t v5[24];

  v3 = a1;
  v4 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(a2, "lastObject"));
  sub_10000691C();
  _os_log_debug_impl((void *)&_mh_execute_header, v3, OS_LOG_TYPE_DEBUG, "Most-recent one: %@", v5, 0xCu);

}

void sub_10001DD44()
{
  NSObject *v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint8_t v6;

  sub_10000691C();
  sub_100007C3C((void *)&_mh_execute_header, v0, v1, "Error from PPSGetData %@", v2, v3, v4, v5, v6);
  sub_10000694C();
}

void sub_10001DDA4(uint8_t *a1, _BYTE *a2, NSObject *a3)
{
  *a1 = 0;
  *a2 = 0;
  sub_10000A6B8((void *)&_mh_execute_header, a3, (uint64_t)a3, "Comparing against current gauge values for CA logging.", a1);
}

void sub_10001DDD8(uint8_t *a1, _BYTE *a2, NSObject *a3)
{
  *a1 = 0;
  *a2 = 0;
  sub_10000A6B8((void *)&_mh_execute_header, a3, (uint64_t)a3, "Logging PPS data for current health state prediction (t=0 days).", a1);
}

void sub_10001DE0C(NSObject *a1, uint64_t a2, uint64_t a3)
{
  uint8_t v3[16];

  *(_WORD *)v3 = 0;
  sub_10000A6B8((void *)&_mh_execute_header, a1, a3, "Nil params.", v3);
}

void sub_10001DE44()
{
  os_log_t v0;
  uint8_t v1[24];

  sub_10000691C();
  _os_log_error_impl((void *)&_mh_execute_header, v0, OS_LOG_TYPE_ERROR, "Unable to get current value for metric: %@", v1, 0xCu);
  sub_10000694C();
}

void sub_10001DEB0()
{
  NSObject *v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint8_t v6;

  sub_10000691C();
  sub_100007C3C((void *)&_mh_execute_header, v0, v1, "Failed to enumerate files %@", v2, v3, v4, v5, v6);
  sub_10000694C();
}

void sub_10001DF10(uint8_t *a1, void *a2, void *a3, _QWORD *a4)
{
  NSObject *v7;
  void *v8;

  v7 = a2;
  v8 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(a3, "absoluteURL"));
  *(_DWORD *)a1 = 138412290;
  *a4 = v8;
  _os_log_debug_impl((void *)&_mh_execute_header, v7, OS_LOG_TYPE_DEBUG, "Found %@", a1, 0xCu);

}

void sub_10001DF90()
{
  NSObject *v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint8_t v6;

  sub_100007C54();
  sub_100007C2C((void *)&_mh_execute_header, v0, v1, "Nil _startDate or _endDate", v2, v3, v4, v5, v6);
  sub_100007C4C();
}

void sub_10001DFBC()
{
  NSObject *v0;
  uint64_t v1;
  uint8_t v2[16];

  sub_100007C54();
  sub_10000A6B8((void *)&_mh_execute_header, v0, v1, "Iteration ended", v2);
  sub_100007C4C();
}

void sub_10001DFEC()
{
  NSObject *v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint8_t v6;

  sub_100007C54();
  sub_100007C2C((void *)&_mh_execute_header, v0, v1, "Failed to allocate PPS request object", v2, v3, v4, v5, v6);
  sub_100007C4C();
}

void sub_10001E018(uint8_t *a1, _BYTE *a2, NSObject *a3)
{
  *a1 = 0;
  *a2 = 0;
  sub_10000A6B8((void *)&_mh_execute_header, a3, (uint64_t)a3, "No data for this range", a1);
}

void sub_10001E04C()
{
  NSObject *v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint8_t v6;

  sub_100007C54();
  sub_100007C2C((void *)&_mh_execute_header, v0, v1, "Currently only BDC_SBC stream is supported", v2, v3, v4, v5, v6);
  sub_100007C4C();
}

void sub_10001E078()
{
  int v0;
  os_log_t v1;
  uint8_t v2[12];
  __int16 v3;
  int v4;

  sub_10000691C();
  v3 = 1024;
  v4 = v0;
  _os_log_debug_impl((void *)&_mh_execute_header, v1, OS_LOG_TYPE_DEBUG, "File %@ Row count %u", v2, 0x12u);
  sub_10000694C();
}

void sub_10001E0F4()
{
  NSObject *v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint8_t v6;

  sub_100007C54();
  sub_100007C2C((void *)&_mh_execute_header, v0, v1, "Failed to allocated PPS request object", v2, v3, v4, v5, v6);
  sub_100007C4C();
}

void sub_10001E120()
{
  NSObject *v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint8_t v6;

  sub_100007C54();
  sub_100007C2C((void *)&_mh_execute_header, v0, v1, "Currently only BDC_Daily and BDC_SBC streams are supported", v2, v3, v4, v5, v6);
  sub_100007C4C();
}

void sub_10001E14C()
{
  NSObject *v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint8_t v6;

  sub_100007C54();
  sub_100007C2C((void *)&_mh_execute_header, v0, v1, "CSVs unsupported.", v2, v3, v4, v5, v6);
  sub_100007C4C();
}

void sub_10001E178()
{
  NSObject *v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint8_t v6;

  sub_100007C54();
  sub_100007C2C((void *)&_mh_execute_header, v0, v1, "Median not found. Nothing to log to CA", v2, v3, v4, v5, v6);
  sub_100007C4C();
}

void sub_10001E1A4()
{
  uint64_t v0;
  os_log_t v1;
  uint8_t v2[12];
  __int16 v3;
  uint64_t v4;

  sub_10000691C();
  v3 = 2112;
  v4 = v0;
  _os_log_debug_impl((void *)&_mh_execute_header, v1, OS_LOG_TYPE_DEBUG, "Array %@ Median %@", v2, 0x16u);
  sub_10000694C();
}

void sub_10001E220()
{
  NSObject *v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint8_t v6;

  sub_10000691C();
  sub_100006928((void *)&_mh_execute_header, v0, v1, "Response %@", v2, v3, v4, v5, v6);
  sub_10000694C();
}

void sub_10001E280()
{
  NSObject *v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint8_t v6;

  sub_10000691C();
  sub_100006928((void *)&_mh_execute_header, v0, v1, "Predicate %@", v2, v3, v4, v5, v6);
  sub_10000694C();
}

void sub_10001E2E0(uint64_t a1, void *a2)
{
  void *v4;
  void *v5;
  int v6;
  uint64_t v7;
  __int16 v8;
  void *v9;
  __int16 v10;
  void *v11;

  v4 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(a2, "startDate"));
  v5 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(a2, "endDate"));
  v6 = 138412802;
  v7 = a1;
  v8 = 2112;
  v9 = v4;
  v10 = 2112;
  v11 = v5;
  _os_log_error_impl((void *)&_mh_execute_header, (os_log_t)&_os_log_default, OS_LOG_TYPE_ERROR, "Past prediction not found for %@. From %@ to %@.", (uint8_t *)&v6, 0x20u);

}

void sub_10001E3B0(void *a1)
{
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint8_t v6;

  objc_msgSend(a1, "count");
  sub_10000691C();
  sub_100006928((void *)&_mh_execute_header, &_os_log_default, v1, "Length of response %lu", v2, v3, v4, v5, v6);
  sub_10000694C();
}

void sub_10001E41C()
{
  uint64_t v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint8_t v5;

  sub_10000691C();
  sub_100006928((void *)&_mh_execute_header, &_os_log_default, v0, "Response %@", v1, v2, v3, v4, v5);
  sub_10000694C();
}

void sub_10001E484()
{
  uint64_t v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint8_t v5;

  sub_10000691C();
  sub_100007C3C((void *)&_mh_execute_header, &_os_log_default, v0, "Error from PPSGetData %@", v1, v2, v3, v4, v5);
  sub_10000694C();
}

void sub_10001E4EC()
{
  uint64_t v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint8_t v5;

  sub_10000691C();
  sub_100006928((void *)&_mh_execute_header, &_os_log_default, v0, "Predicate %@", v1, v2, v3, v4, v5);
  sub_10000694C();
}

void sub_10001E554()
{
  NSObject *v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint8_t v6;

  sub_100007C54();
  sub_100007C2C((void *)&_mh_execute_header, v0, v1, "Nil labelgen", v2, v3, v4, v5, v6);
  sub_100007C4C();
}

void sub_10001E580()
{
  NSObject *v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint8_t v6;

  sub_100007C54();
  sub_100007C2C((void *)&_mh_execute_header, v0, v1, "_histogram alloc failed", v2, v3, v4, v5, v6);
  sub_100007C4C();
}

void sub_10001E5AC()
{
  NSObject *v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint8_t v6;

  sub_100007C54();
  sub_100007C2C((void *)&_mh_execute_header, v0, v1, "Total count of histogram more than max count capacity", v2, v3, v4, v5, v6);
  sub_100007C4C();
}

void sub_10001E5D8()
{
  NSObject *v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint8_t v6;

  sub_100007C54();
  sub_100007C2C((void *)&_mh_execute_header, v0, v1, "Total count exceeds max histogram capacity.", v2, v3, v4, v5, v6);
  sub_100007C4C();
}

void sub_10001E604()
{
  os_log_t v0;
  uint8_t v1[16];

  sub_100007C54();
  _os_log_debug_impl((void *)&_mh_execute_header, v0, OS_LOG_TYPE_DEBUG, "Total value count 0", v1, 2u);
  sub_100007C4C();
}

void sub_10001E63C(uint64_t a1, NSObject *a2)
{
  int v2;
  uint64_t v3;

  v2 = 138412290;
  v3 = a1;
  _os_log_error_impl((void *)&_mh_execute_header, a2, OS_LOG_TYPE_ERROR, "Posted notification with error: %@", (uint8_t *)&v2, 0xCu);
}

void sub_10001E6B0()
{
  uint8_t v0[16];

  *(_WORD *)v0 = 0;
  _os_log_error_impl((void *)&_mh_execute_header, (os_log_t)&_os_log_default, OS_LOG_TYPE_ERROR, "Super init failed for BatteryAlgorithmsRunner", v0, 2u);
}

void sub_10001E6F4(uint8_t *a1, void *a2, unsigned int *a3, NSObject *a4)
{
  unsigned int v7;

  v7 = objc_msgSend(a2, "intValue");
  *(_DWORD *)a1 = 67109120;
  *a3 = v7;
  _os_log_debug_impl((void *)&_mh_execute_header, a4, OS_LOG_TYPE_DEBUG, "Feature dimension cannot be negative, but found %d, skipping..", a1, 8u);
}

void sub_10001E75C(uint64_t a1, uint64_t a2, NSObject *a3)
{
  int v3;
  uint64_t v4;
  __int16 v5;
  uint64_t v6;

  v3 = 134218242;
  v4 = a2;
  v5 = 2112;
  v6 = a1;
  sub_10000F714((void *)&_mh_execute_header, a3, (uint64_t)a3, "Invalid input shape. Dimension %lu has size: %@ which is invalid.", (uint8_t *)&v3);
  sub_10000694C();
}

void sub_10001E7D4()
{
  NSObject *v0;
  uint64_t v1;
  uint8_t v2[24];

  sub_10000691C();
  sub_10000F708((void *)&_mh_execute_header, v0, v1, "Invalid input shape. Dimension 0 (batch dimension) is expected to be 1, but has size: %@.", v2);
  sub_10000694C();
}

void sub_10001E838(void *a1, NSObject *a2)
{
  uint64_t v3;
  uint8_t v4[24];

  objc_msgSend(a1, "count");
  sub_10000691C();
  sub_10000F708((void *)&_mh_execute_header, a2, v3, "Expected inputShape to have 3 dimensions, but got: %lu", v4);
  sub_100006910();
}

void sub_10001E8AC(NSObject *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8)
{
  sub_100007C4C();
}

void sub_10001E8DC()
{
  NSObject *v0;
  uint64_t v1;
  uint8_t v2[24];

  sub_10000691C();
  sub_10000F708((void *)&_mh_execute_header, v0, v1, "Missing feature name for dimension %lu in featureNames dictionary.", v2);
  sub_10000694C();
}

void sub_10001E940(int a1, NSObject *a2)
{
  _DWORD v2[2];

  v2[0] = 67109120;
  v2[1] = a1;
  _os_log_debug_impl((void *)&_mh_execute_header, a2, OS_LOG_TYPE_DEBUG, "Processing multiarray with # features = %i", (uint8_t *)v2, 8u);
  sub_100007C4C();
}

void sub_10001E9B0(int a1, int a2, os_log_t log)
{
  _DWORD v3[2];
  __int16 v4;
  int v5;

  v3[0] = 67109376;
  v3[1] = a1;
  v4 = 1024;
  v5 = a2;
  _os_log_debug_impl((void *)&_mh_execute_header, log, OS_LOG_TYPE_DEBUG, "Processing multiarray with numTimeSteps = %i, # features = %i", (uint8_t *)v3, 0xEu);
  sub_10000694C();
}

void sub_10001EA30(void *a1, uint64_t a2, NSObject *a3)
{
  uint64_t v4;
  int v5;
  uint64_t v6;
  __int16 v7;
  id v8;

  v5 = 134218240;
  v6 = a2;
  v7 = 2048;
  v8 = objc_msgSend(a1, "count");
  sub_10000F714((void *)&_mh_execute_header, a3, v4, "Can't create subarray starting at startIndex %lu when there are only %lu elements in the full arrays.", (uint8_t *)&v5);
  sub_100006910();
}

void sub_10001EAB8(NSObject *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8)
{
  sub_100007C4C();
}

void sub_10001EAE8(NSObject *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8)
{
  sub_100007C2C((void *)&_mh_execute_header, a1, a3, "Failed to alloc defaults", a5, a6, a7, a8, 0);
}

void sub_10001EB1C(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8)
{
  sub_100007C2C((void *)&_mh_execute_header, &_os_log_default, a3, "Super init failed for BIFeatures", a5, a6, a7, a8, 0);
  sub_100007C4C();
}

void sub_10001EB50(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8)
{
  sub_100007C2C((void *)&_mh_execute_header, &_os_log_default, a3, "Log creation failed for BIFeatures", a5, a6, a7, a8, 0);
  sub_100007C4C();
}

void sub_10001EB84()
{
  NSObject *v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint8_t v6;

  sub_100007C54();
  sub_100007C2C((void *)&_mh_execute_header, v0, v1, "Failed to create sampler queue", v2, v3, v4, v5, v6);
  sub_100007C4C();
}

void sub_10001EBB0(uint64_t a1, uint64_t a2, os_log_t log)
{
  int v3;
  uint64_t v4;
  __int16 v5;
  uint64_t v6;

  v3 = 138412546;
  v4 = a1;
  v5 = 2112;
  v6 = a2;
  _os_log_error_impl((void *)&_mh_execute_header, log, OS_LOG_TYPE_ERROR, "Failed to create dir at %@ with err %@", (uint8_t *)&v3, 0x16u);
  sub_10000694C();
}

void sub_10001EC30()
{
  NSObject *v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint8_t v6;

  sub_100007C54();
  sub_100007C2C((void *)&_mh_execute_header, v0, v1, "Unsupported class type for entry", v2, v3, v4, v5, v6);
  sub_100007C4C();
}

void sub_10001EC5C()
{
  NSObject *v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint8_t v6;

  sub_100007C54();
  sub_100007C2C((void *)&_mh_execute_header, v0, v1, "Empty runningCount argument", v2, v3, v4, v5, v6);
  sub_100007C4C();
}

void sub_10001EC88()
{
  NSObject *v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint8_t v6;

  sub_100007C54();
  sub_100007C2C((void *)&_mh_execute_header, v0, v1, "Empty columnNames argument", v2, v3, v4, v5, v6);
  sub_100007C4C();
}

void sub_10001ECB4()
{
  NSObject *v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint8_t v6;

  sub_100007C54();
  sub_100007C2C((void *)&_mh_execute_header, v0, v1, "Empty version argument", v2, v3, v4, v5, v6);
  sub_100007C4C();
}

void sub_10001ECE0()
{
  NSObject *v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint8_t v6;

  sub_10000691C();
  sub_100006928((void *)&_mh_execute_header, v0, v1, "PPSEvent %@", v2, v3, v4, v5, v6);
  sub_10000694C();
}

void sub_10001ED40(void *a1, void *a2)
{
  NSObject *v3;
  uint64_t v4;
  uint8_t v5[24];

  v3 = sub_100006938(a1);
  object_getClassName(a2);
  sub_10000691C();
  sub_10000F708((void *)&_mh_execute_header, v3, v4, "Unsupported class type for entry %s", v5);

  sub_100006910();
}

void sub_10001EDC0()
{
  NSObject *v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint8_t v6;

  sub_100007C54();
  sub_100007C2C((void *)&_mh_execute_header, v0, v1, "Count of aggregationTypes does not match count of columnNames", v2, v3, v4, v5, v6);
  sub_100007C4C();
}

void sub_10001EDEC()
{
  NSObject *v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint8_t v6;

  sub_100007C54();
  sub_100007C2C((void *)&_mh_execute_header, v0, v1, "Empty enumerator object passed in.", v2, v3, v4, v5, v6);
  sub_100007C4C();
}

void sub_10001EE18()
{
  NSObject *v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint8_t v6;

  sub_100007C54();
  sub_100007C2C((void *)&_mh_execute_header, v0, v1, "Failed to get max column index for SBC stream", v2, v3, v4, v5, v6);
  sub_100007C4C();
}

void sub_10001EE44(uint64_t a1, uint64_t a2, NSObject *a3)
{
  *(_DWORD *)a1 = 134217984;
  *(_QWORD *)(a1 + 4) = a2;
  sub_10000F708((void *)&_mh_execute_header, a3, (uint64_t)a3, "Failed to allocate DataSumAndCount array for %lu elements", (uint8_t *)a1);
}

void sub_10001EE80(uint8_t *a1, _BYTE *a2, NSObject *a3)
{
  *a1 = 0;
  *a2 = 0;
  sub_100014BB4((void *)&_mh_execute_header, a3, (uint64_t)a3, "Skipping row due to unexpected format.", a1);
}

void sub_10001EEB4()
{
  NSObject *v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint8_t v6;

  sub_100007C54();
  sub_100007C2C((void *)&_mh_execute_header, v0, v1, "Nil argument", v2, v3, v4, v5, v6);
  sub_100007C4C();
}

void sub_10001EEE0()
{
  NSObject *v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint8_t v6;

  sub_100007C54();
  sub_100007C2C((void *)&_mh_execute_header, v0, v1, "Start date after end date", v2, v3, v4, v5, v6);
  sub_100007C4C();
}

void sub_10001EF0C()
{
  NSObject *v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint8_t v6;

  sub_100007C54();
  sub_100007C2C((void *)&_mh_execute_header, v0, v1, "Could not get design capacity.", v2, v3, v4, v5, v6);
  sub_100007C4C();
}

void sub_10001EF38()
{
  NSObject *v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint8_t v6;

  sub_100007C54();
  sub_100007C2C((void *)&_mh_execute_header, v0, v1, "Nil enumerator for bdc_sbc stream", v2, v3, v4, v5, v6);
  sub_100007C4C();
}

void sub_10001EF64()
{
  os_log_t v0;
  uint8_t v1[16];

  sub_100007C54();
  _os_log_debug_impl((void *)&_mh_execute_header, v0, OS_LOG_TYPE_DEBUG, "Resampling BDC_SBC data", v1, 2u);
  sub_100007C4C();
}

void sub_10001EF9C(int a1, NSObject *a2)
{
  _DWORD v2[2];

  v2[0] = 67109120;
  v2[1] = a1;
  _os_log_debug_impl((void *)&_mh_execute_header, a2, OS_LOG_TYPE_DEBUG, "Design capacity %u", (uint8_t *)v2, 8u);
  sub_100007C4C();
}

void sub_10001F00C()
{
  NSObject *v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint8_t v6;

  sub_10000691C();
  sub_100006928((void *)&_mh_execute_header, v0, v1, "Returned dict %@", v2, v3, v4, v5, v6);
  sub_10000694C();
}

void sub_10001F06C()
{
  NSObject *v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint8_t v6;

  sub_100007C54();
  sub_100007C2C((void *)&_mh_execute_header, v0, v1, "Could not fetch year and week of manufacture", v2, v3, v4, v5, v6);
  sub_100007C4C();
}

void sub_10001F098()
{
  NSObject *v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint8_t v6;

  sub_100007C54();
  sub_100007C2C((void *)&_mh_execute_header, v0, v1, "Nil enumerator for BDC_SBC stream", v2, v3, v4, v5, v6);
  sub_100007C4C();
}

void sub_10001F0C4()
{
  NSObject *v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint8_t v6;

  sub_100007C54();
  sub_100007C2C((void *)&_mh_execute_header, v0, v1, "No data returned from getBDCDataFromStartDate for BDC_SBC stream", v2, v3, v4, v5, v6);
  sub_100007C4C();
}

void sub_10001F0F0()
{
  NSObject *v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint8_t v6;

  sub_100007C54();
  sub_100007C2C((void *)&_mh_execute_header, v0, v1, "Encountered error getting timestamp from first PPS event. Unable to compute timeSinceLastReadingMins feature.", v2, v3, v4, v5, v6);
  sub_100007C4C();
}

void sub_10001F11C()
{
  NSObject *v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint8_t v6;

  sub_100007C54();
  sub_100007C2C((void *)&_mh_execute_header, v0, v1, "Encountered error trying to generate subarrays from arrays that exceed the max size.", v2, v3, v4, v5, v6);
  sub_100007C4C();
}

void sub_10001F148()
{
  NSObject *v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint8_t v6;

  sub_100007C54();
  sub_100007C2C((void *)&_mh_execute_header, v0, v1, "Encountered error trying to generate the multiArray for usage history input.", v2, v3, v4, v5, v6);
  sub_100007C4C();
}

void sub_10001F174()
{
  NSObject *v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint8_t v6;

  sub_10000691C();
  sub_100006928((void *)&_mh_execute_header, v0, v1, "Multiarray generated from VITQ values has shape: %@", v2, v3, v4, v5, v6);
  sub_10000694C();
}

void sub_10001F1D4()
{
  NSObject *v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint8_t v6;

  sub_100007C54();
  sub_100007C2C((void *)&_mh_execute_header, v0, v1, "Encountered error getting timestamp from PPS event. Unable to compute timeSinceLastReadingMins feature.", v2, v3, v4, v5, v6);
  sub_100007C4C();
}

void sub_10001F200()
{
  NSObject *v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint8_t v6;

  sub_100007C54();
  sub_100007C2C((void *)&_mh_execute_header, v0, v1, "Encountered error getting timestamp from first PPS event. Unable to compute timeSinceLastReadingDays feature.", v2, v3, v4, v5, v6);
  sub_100007C4C();
}

void sub_10001F22C()
{
  NSObject *v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint8_t v6;

  sub_100007C54();
  sub_100007C2C((void *)&_mh_execute_header, v0, v1, "Encountered error getting timestamp from PPS event. Unable to compute timeSinceLastReadingDays feature.", v2, v3, v4, v5, v6);
  sub_100007C4C();
}

void sub_10001F258(uint8_t *a1, _BYTE *a2, NSObject *a3)
{
  *a1 = 0;
  *a2 = 0;
  sub_100014BB4((void *)&_mh_execute_header, a3, (uint64_t)a3, "Could not get age from manufacture date.", a1);
}

void sub_10001F28C()
{
  NSObject *v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint8_t v6;

  sub_100007C54();
  sub_100007C2C((void *)&_mh_execute_header, v0, v1, "Health history start date cannot be later than history end date.", v2, v3, v4, v5, v6);
  sub_100007C4C();
}

void sub_10001F2B8()
{
  NSObject *v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint8_t v6;

  sub_100007C54();
  sub_100007C2C((void *)&_mh_execute_header, v0, v1, "Nil enumerator for BDC_Daily stream", v2, v3, v4, v5, v6);
  sub_100007C4C();
}

void sub_10001F2E4()
{
  NSObject *v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint8_t v6;

  sub_100007C54();
  sub_100007C2C((void *)&_mh_execute_header, v0, v1, "Could not get DesignCapacity", v2, v3, v4, v5, v6);
  sub_100007C4C();
}

void sub_10001F310()
{
  NSObject *v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint8_t v6;

  sub_100007C54();
  sub_100007C2C((void *)&_mh_execute_header, v0, v1, "Could not get manufacture date.", v2, v3, v4, v5, v6);
  sub_100007C4C();
}

void sub_10001F33C()
{
  NSObject *v0;
  uint64_t v1;
  uint8_t v2[24];

  sub_10000691C();
  sub_10000F708((void *)&_mh_execute_header, v0, v1, "No data returned from getBDCDataFromStartDate for BDC_Daily stream: %@", v2);
  sub_10000694C();
}

void sub_10001F3A0()
{
  NSObject *v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint8_t v6;

  sub_100007C54();
  sub_100007C2C((void *)&_mh_execute_header, v0, v1, "Encountered error trying to generate subarrays from arrays that exceed the max size.", v2, v3, v4, v5, v6);
  sub_100007C4C();
}

void sub_10001F3CC()
{
  NSObject *v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint8_t v6;

  sub_100007C54();
  sub_100007C2C((void *)&_mh_execute_header, v0, v1, "Encountered error trying to generate the multiArray for daily history input.", v2, v3, v4, v5, v6);
  sub_100007C4C();
}

void sub_10001F3F8(void *a1, void *a2)
{
  NSObject *v3;
  void *v4;
  uint64_t v5;
  uint8_t v6[24];

  v3 = sub_100006938(a1);
  v4 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(a2, "allKeys"));
  sub_100014BC0();
  sub_100014BD8((void *)&_mh_execute_header, v3, v5, "Multiarray generated from %@ has shape: %@", v6);

}

void sub_10001F498()
{
  NSObject *v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint8_t v6;

  sub_10000691C();
  sub_100006928((void *)&_mh_execute_header, v0, v1, "featureArrays: %@ ", v2, v3, v4, v5, v6);
  sub_10000694C();
}

void sub_10001F4F8(void *a1)
{
  NSObject *v1;
  uint64_t v2;
  uint8_t v3[24];

  sub_100006938(a1);
  sub_100014BE4();
  sub_10000691C();
  sub_10000F708((void *)&_mh_execute_header, v1, v2, "At least one of NCCpValues/WRaValues/QMaxpValues/cycleCountValues/ageValues had zero values added after iterating through allData (allData size= %lu)", v3);

  sub_100006910();
}

void sub_10001F570()
{
  NSObject *v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint8_t v6;

  sub_10000691C();
  sub_100006928((void *)&_mh_execute_header, v0, v1, "allArrays: %@ ", v2, v3, v4, v5, v6);
  sub_10000694C();
}

void sub_10001F5D0(void *a1)
{
  NSObject *v1;
  uint64_t v2;
  uint8_t v3[24];

  sub_100006938(a1);
  sub_100014BE4();
  sub_100014BC0();
  sub_100014BD8((void *)&_mh_execute_header, v1, v2, "allData (count = %lu) \n %@", v3);

  sub_100006910();
}

void sub_10001F648()
{
  int v0;
  os_log_t v1;
  uint8_t v2[12];
  __int16 v3;
  int v4;

  sub_10000691C();
  v3 = 1024;
  v4 = v0;
  _os_log_debug_impl((void *)&_mh_execute_header, v1, OS_LOG_TYPE_DEBUG, "Using device manufactureDate: %@ to compute age. Using designCapacity: %u to compute nccp/qmaxp.", v2, 0x12u);
  sub_10000694C();
}

void sub_10001F6C4(uint64_t a1, NSObject *a2)
{
  int v2;
  uint64_t v3;

  v2 = 138412290;
  v3 = a1;
  _os_log_error_impl((void *)&_mh_execute_header, a2, OS_LOG_TYPE_ERROR, "Unable to create folder %@", (uint8_t *)&v2, 0xCu);
}

void sub_10001F738(uint64_t a1, uint64_t a2, os_log_t log)
{
  int v3;
  uint64_t v4;
  __int16 v5;
  uint64_t v6;

  v3 = 138412546;
  v4 = a1;
  v5 = 2112;
  v6 = a2;
  _os_log_error_impl((void *)&_mh_execute_header, log, OS_LOG_TYPE_ERROR, "Failed to create dir at %@ with err %@", (uint8_t *)&v3, 0x16u);
}

void sub_10001F7BC(NSObject *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8)
{
  sub_100007C2C((void *)&_mh_execute_header, a1, a3, "Unable to retrieve golden wRdc.", a5, a6, a7, a8, 0);
  sub_100007C4C();
}

void sub_10001F7EC(NSObject *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8)
{
  sub_100007C2C((void *)&_mh_execute_header, a1, a3, "Unable to create input features", a5, a6, a7, a8, 0);
  sub_100007C4C();
}

void sub_10001F81C()
{
  NSObject *v0;
  uint64_t v1;
  uint8_t v2[24];

  sub_10000691C();
  sub_10000F708((void *)&_mh_execute_header, v0, v1, "Error while creating feature provider: %@", v2);
  sub_10000694C();
}

void sub_10001F880()
{
  NSObject *v0;
  uint64_t v1;
  uint8_t v2[24];

  sub_10000691C();
  sub_10000F708((void *)&_mh_execute_header, v0, v1, "Error in model predictions: %@", v2);
  sub_10000694C();
}

void sub_10001F8E4()
{
  os_log_t v0;
  uint8_t v1[24];

  sub_10000691C();
  _os_log_debug_impl((void *)&_mh_execute_header, v0, OS_LOG_TYPE_DEBUG, "OCV model input dict: %@", v1, 0xCu);
  sub_10000694C();
}

void sub_10001F950(os_log_t log)
{
  uint8_t v1[16];

  *(_WORD *)v1 = 0;
  _os_log_debug_impl((void *)&_mh_execute_header, log, OS_LOG_TYPE_DEBUG, "xpc_dictionary_create return nil. XPC alarm not set. ", v1, 2u);
}

void sub_10001F990(os_log_t log)
{
  uint8_t v1[16];

  *(_WORD *)v1 = 0;
  _os_log_error_impl((void *)&_mh_execute_header, log, OS_LOG_TYPE_ERROR, "Incorrect alarm clock type.  XPC alarm not set.", v1, 2u);
}

void sub_10001F9D0()
{
  uint64_t v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint8_t v5;

  sub_10000691C();
  sub_100007C3C((void *)&_mh_execute_header, &_os_log_default, v0, "Unknown BIFeatureType %lu", v1, v2, v3, v4, v5);
  sub_10000694C();
}

void sub_10001FA38()
{
  uint64_t v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint8_t v5;

  sub_100018BF0();
  sub_100018C08((void *)&_mh_execute_header, &_os_log_default, v0, "Failed to write to file %@ with error %@", v1, v2, v3, v4, v5);
  sub_10000694C();
}

void sub_10001FAA0()
{
  uint64_t v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint8_t v5;

  sub_100018BF0();
  sub_100018C08((void *)&_mh_execute_header, &_os_log_default, v0, "Failed to remove %@ with error %@", v1, v2, v3, v4, v5);
  sub_10000694C();
}

void sub_10001FB08()
{
  uint64_t v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint8_t v5;

  sub_10000691C();
  sub_100007C3C((void *)&_mh_execute_header, &_os_log_default, v0, "Failed to get file path for type %ld", v1, v2, v3, v4, v5);
  sub_10000694C();
}

void sub_10001FB70()
{
  uint64_t v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint8_t v5;

  sub_100018BF0();
  sub_100018C08((void *)&_mh_execute_header, &_os_log_default, v0, "Failed to read %@ with error %@", v1, v2, v3, v4, v5);
  sub_10000694C();
}

void sub_10001FBD8(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8)
{
  sub_100007C2C((void *)&_mh_execute_header, &_os_log_default, a3, "No match for AppleSmartBattery IOService.", a5, a6, a7, a8, 0);
}

void sub_10001FC10()
{
  uint64_t v0;
  uint64_t v1;
  uint8_t v2[12];
  __int16 v3;
  uint64_t v4;
  __int16 v5;
  uint64_t v6;

  sub_10000691C();
  v3 = 2048;
  v4 = v0;
  v5 = 2048;
  v6 = v1;
  _os_log_error_impl((void *)&_mh_execute_header, (os_log_t)&_os_log_default, OS_LOG_TYPE_ERROR, "For key %@ Value of type %lu. Expected type %lu ", v2, 0x20u);
}

void sub_10001FC9C(uint64_t a1)
{
  id v1;
  id v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;
  uint8_t v8;

  objc_opt_class(a1);
  sub_10000691C();
  v2 = v1;
  sub_100007C3C((void *)&_mh_execute_header, &_os_log_default, v3, "Unexpected wRa type %@", v4, v5, v6, v7, v8);

}

void sub_10001FD20(unsigned __int8 a1, int a2)
{
  _DWORD v2[2];
  __int16 v3;
  int v4;

  v2[0] = 67109376;
  v2[1] = a2;
  v3 = 1024;
  v4 = a1;
  _os_log_debug_impl((void *)&_mh_execute_header, (os_log_t)&_os_log_default, OS_LOG_TYPE_DEBUG, "Year digit %u Week digits %u", (uint8_t *)v2, 0xEu);
  sub_10000694C();
}

void sub_10001FDA8()
{
  uint8_t v0[24];

  sub_10000691C();
  _os_log_debug_impl((void *)&_mh_execute_header, (os_log_t)&_os_log_default, OS_LOG_TYPE_DEBUG, "Fetched yww from IOKit: %@", v0, 0xCu);
  sub_10000694C();
}

void sub_10001FE1C(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8)
{
  sub_100007C2C((void *)&_mh_execute_header, &_os_log_default, a3, "Unable to get year and week from IOPSGetYearAndWeekOfManufactureFromBatterySerial", a5, a6, a7, a8, 0);
}

void sub_10001FE54()
{
  uint64_t v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint8_t v5;

  sub_10000691C();
  sub_100007C3C((void *)&_mh_execute_header, &_os_log_default, v0, "Invalid metric name: %@. Supported metric names are 'nccp', 'qmaxp', and 'wra'", v1, v2, v3, v4, v5);
  sub_10000694C();
}

void sub_10001FEBC()
{
  uint64_t v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint8_t v5;

  sub_10000691C();
  sub_100007C3C((void *)&_mh_execute_header, &_os_log_default, v0, "Asset path for %@ not found", v1, v2, v3, v4, v5);
  sub_10000694C();
}

void sub_10001FF24()
{
  uint64_t v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint8_t v5;

  sub_10000691C();
  sub_100007C3C((void *)&_mh_execute_header, &_os_log_default, v0, "ML model file for %@ not found", v1, v2, v3, v4, v5);
  sub_10000694C();
}

void sub_10001FF8C()
{
  uint64_t v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint8_t v5;

  sub_10000691C();
  sub_100007C3C((void *)&_mh_execute_header, &_os_log_default, v0, "Failed at reading metadata for %@", v1, v2, v3, v4, v5);
  sub_10000694C();
}

void sub_10001FFF4()
{
  uint64_t v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint8_t v5;

  sub_10000691C();
  sub_100007C3C((void *)&_mh_execute_header, &_os_log_default, v0, "Failed at reading predicted feature name for %@", v1, v2, v3, v4, v5);
  sub_10000694C();
}

void sub_10002005C()
{
  uint8_t v0[16];

  *(_WORD *)v0 = 0;
  _os_log_error_impl((void *)&_mh_execute_header, (os_log_t)&_os_log_default, OS_LOG_TYPE_ERROR, "Super init failed for TimeTo80Listener", v0, 2u);
  sub_100007C4C();
}

void sub_10002009C(int a1, NSObject *a2)
{
  _DWORD v2[2];
  __int16 v3;
  const char *v4;

  v2[0] = 67109378;
  v2[1] = a1;
  v3 = 2080;
  v4 = "com.apple.system.powersources.source";
  _os_log_error_impl((void *)&_mh_execute_header, a2, OS_LOG_TYPE_ERROR, "Error %d registering for %s notification", (uint8_t *)v2, 0x12u);
}

void sub_100020124(NSObject *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8)
{
  sub_1000196A8((void *)&_mh_execute_header, a1, a3, "Setting/deleting TT80 alarm depending on current state at the start of listener.", a5, a6, a7, a8, 0);
  sub_100007C4C();
}

void sub_100020154(NSObject *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8)
{
  sub_1000196A8((void *)&_mh_execute_header, a1, a3, "Setting/deleting TT80 alarm depending on current state when we get notified while the daemon is running.", a5, a6, a7, a8, 0);
  sub_100007C4C();
}

void sub_100020184(NSObject *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8)
{
  sub_100007C2C((void *)&_mh_execute_header, a1, a3, "Nil payload. Nothing to send to PPS.", a5, a6, a7, a8, 0);
  sub_100007C4C();
}

void sub_1000201B4(NSObject *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8)
{
  sub_100007C2C((void *)&_mh_execute_header, a1, a3, "PPS request object not found. Unable to send data to powerlog.", a5, a6, a7, a8, 0);
  sub_100007C4C();
}

void sub_1000201E4(uint64_t a1, NSObject *a2)
{
  int v2;
  uint64_t v3;

  v2 = 138412290;
  v3 = a1;
  _os_log_debug_impl((void *)&_mh_execute_header, a2, OS_LOG_TYPE_DEBUG, "Could not create ppsId for %@", (uint8_t *)&v2, 0xCu);
}

void sub_100020258(NSObject *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8)
{
  sub_100007C2C((void *)&_mh_execute_header, a1, a3, "Nil payload. Nothing to send to CA.", a5, a6, a7, a8, 0);
  sub_100007C4C();
}

void sub_100020288()
{
  uint8_t v0[16];

  *(_WORD *)v0 = 0;
  _os_log_error_impl((void *)&_mh_execute_header, (os_log_t)&_os_log_default, OS_LOG_TYPE_ERROR, "Could not load nccp_wra_qmaxp_seq_model.mlmodelc in the bundle resource", v0, 2u);
}

void sub_1000202CC()
{
  uint8_t v0[16];

  *(_WORD *)v0 = 0;
  _os_log_error_impl((void *)&_mh_execute_header, (os_log_t)&_os_log_default, OS_LOG_TYPE_ERROR, "Could not load tt80_lstm_regression.mlmodelc in the bundle resource", v0, 2u);
}

void sub_100020310()
{
  uint8_t v0[16];

  *(_WORD *)v0 = 0;
  _os_log_error_impl((void *)&_mh_execute_header, (os_log_t)&_os_log_default, OS_LOG_TYPE_ERROR, "Could not load state_estimation_model.mlmodelc in the bundle resource", v0, 2u);
}

void sub_100020354()
{
  uint8_t v0[16];

  *(_WORD *)v0 = 0;
  _os_log_error_impl((void *)&_mh_execute_header, (os_log_t)&_os_log_default, OS_LOG_TYPE_ERROR, "Could not load ocv_drift_model.mlmodelc in the bundle resource", v0, 2u);
}

id objc_msgSend_AlgorithmClassName(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "AlgorithmClassName");
}

id objc_msgSend_Input(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "Input");
}

id objc_msgSend_Prediction(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "Prediction");
}

id objc_msgSend_URLOfModelInThisBundle(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "URLOfModelInThisBundle");
}

id objc_msgSend_UTF8String(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "UTF8String");
}

id objc_msgSend__copyFeatures(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "_copyFeatures");
}

id objc_msgSend__copyFeaturesWithParams_modelName_error_(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "_copyFeaturesWithParams:modelName:error:");
}

id objc_msgSend__copyHistogramsOfTypes_withBinners_withParams_(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "_copyHistogramsOfTypes:withBinners:withParams:");
}

id objc_msgSend_absoluteURL(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "absoluteURL");
}

id objc_msgSend_addEntriesFromDictionary_(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "addEntriesFromDictionary:");
}

id objc_msgSend_addNotificationRequest_withCompletionHandler_(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "addNotificationRequest:withCompletionHandler:");
}

id objc_msgSend_addObject_(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "addObject:");
}

id objc_msgSend_algoDescription(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "algoDescription");
}

id objc_msgSend_algoRunnerExecuteWithData_(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "algoRunnerExecuteWithData:");
}

id objc_msgSend_algoRunnerFreshInitWithData_(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "algoRunnerFreshInitWithData:");
}

id objc_msgSend_algoRunnerInitWithData_(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "algoRunnerInitWithData:");
}

id objc_msgSend_algoRunnerStoreOutput(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "algoRunnerStoreOutput");
}

id objc_msgSend_algoStateData(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "algoStateData");
}

id objc_msgSend_algorithmObject(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "algorithmObject");
}

id objc_msgSend_algorithmWithData_(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "algorithmWithData:");
}

id objc_msgSend_allKeys(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "allKeys");
}

id objc_msgSend_allObjects(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "allObjects");
}

id objc_msgSend_allValues(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "allValues");
}

id objc_msgSend_andPredicateWithSubpredicates_(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "andPredicateWithSubpredicates:");
}

id objc_msgSend_array(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "array");
}

id objc_msgSend_arrayWithCapacity_(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "arrayWithCapacity:");
}

id objc_msgSend_arrayWithObjects_count_(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "arrayWithObjects:count:");
}

id objc_msgSend_battData(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "battData");
}

id objc_msgSend_bdcNameForColumnName_atVersion_(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "bdcNameForColumnName:atVersion:");
}

id objc_msgSend_BOOLValue(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "BOOLValue");
}

id objc_msgSend_bundleForClass_(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "bundleForClass:");
}

id objc_msgSend_calendar(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "calendar");
}

id objc_msgSend_calendarWithIdentifier_(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "calendarWithIdentifier:");
}

id objc_msgSend_collectionQueue(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "collectionQueue");
}

id objc_msgSend_columnIndexForColumnName_atVersion_(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "columnIndexForColumnName:atVersion:");
}

id objc_msgSend_compare_(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "compare:");
}

id objc_msgSend_component_fromDate_(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "component:fromDate:");
}

id objc_msgSend_components_fromDate_toDate_options_(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "components:fromDate:toDate:options:");
}

id objc_msgSend_componentsSeparatedByString_(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "componentsSeparatedByString:");
}

id objc_msgSend_containsObject_(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "containsObject:");
}

id objc_msgSend_containsString_(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "containsString:");
}

id objc_msgSend_contentsOfDirectoryAtURL_includingPropertiesForKeys_options_error_(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "contentsOfDirectoryAtURL:includingPropertiesForKeys:options:error:");
}

id objc_msgSend_copy(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "copy");
}

id objc_msgSend_copyDailyHealthHistoryForFeatures_withFeatureDimensions_withParams_(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "copyDailyHealthHistoryForFeatures:withFeatureDimensions:withParams:");
}

id objc_msgSend_copyHistogramWithNormalizedCounts(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "copyHistogramWithNormalizedCounts");
}

id objc_msgSend_copyUsageHistory_withFeatureDimensions_withParams_(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "copyUsageHistory:withFeatureDimensions:withParams:");
}

id objc_msgSend_count(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "count");
}

id objc_msgSend_countByEnumeratingWithState_objects_count_(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "countByEnumeratingWithState:objects:count:");
}

id objc_msgSend_create3DMultiArrayFromFeatureArrays_withInputShape_usingFeatureDimensionsDict_(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "create3DMultiArrayFromFeatureArrays:withInputShape:usingFeatureDimensionsDict:");
}

id objc_msgSend_createDirectoryAtPath_withIntermediateDirectories_attributes_error_(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "createDirectoryAtPath:withIntermediateDirectories:attributes:error:");
}

id objc_msgSend_createSubArraysFromArrays_fromStartIndex_withSize_(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "createSubArraysFromArrays:fromStartIndex:withSize:");
}

id objc_msgSend_currentCalendar(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "currentCalendar");
}

id objc_msgSend_dailyData(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "dailyData");
}

id objc_msgSend_daily_history_input(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "daily_history_input");
}

id objc_msgSend_date(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "date");
}

id objc_msgSend_dateByAddingTimeInterval_(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "dateByAddingTimeInterval:");
}

id objc_msgSend_dateFromString_(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "dateFromString:");
}

id objc_msgSend_dateWithTimeInterval_sinceDate_(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "dateWithTimeInterval:sinceDate:");
}

id objc_msgSend_dateWithTimeIntervalSince1970_(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "dateWithTimeIntervalSince1970:");
}

id objc_msgSend_dateWithTimeIntervalSinceNow_(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "dateWithTimeIntervalSinceNow:");
}

id objc_msgSend_day(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "day");
}

id objc_msgSend_defaultManager(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "defaultManager");
}

id objc_msgSend_deleteAlarmWithName_(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "deleteAlarmWithName:");
}

id objc_msgSend_deviceState(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "deviceState");
}

id objc_msgSend_dictionary(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "dictionary");
}

id objc_msgSend_dictionaryWithDictionary_(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "dictionaryWithDictionary:");
}

id objc_msgSend_dictionaryWithObjects_forKeys_(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "dictionaryWithObjects:forKeys:");
}

id objc_msgSend_dictionaryWithObjects_forKeys_count_(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "dictionaryWithObjects:forKeys:count:");
}

id objc_msgSend_doubleValue(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "doubleValue");
}

id objc_msgSend_endDate(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "endDate");
}

id objc_msgSend_epochTimestamp(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "epochTimestamp");
}

id objc_msgSend_errorWithDomain_code_userInfo_(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "errorWithDomain:code:userInfo:");
}

id objc_msgSend_eventCA(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "eventCA");
}

id objc_msgSend_featureFlagEn(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "featureFlagEn");
}

id objc_msgSend_featureGen(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "featureGen");
}

id objc_msgSend_featureNames(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "featureNames");
}

id objc_msgSend_featureValueForName_(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "featureValueForName:");
}

id objc_msgSend_featureValueWithMultiArray_(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "featureValueWithMultiArray:");
}

id objc_msgSend_featuresAtIndex_(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "featuresAtIndex:");
}

id objc_msgSend_fileExistsAtPath_(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "fileExistsAtPath:");
}

id objc_msgSend_fileURLWithPath_(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "fileURLWithPath:");
}

id objc_msgSend_fileURLWithPath_isDirectory_(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "fileURLWithPath:isDirectory:");
}

id objc_msgSend_firstObject(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "firstObject");
}

id objc_msgSend_firstWeekday(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "firstWeekday");
}

id objc_msgSend_floatValue(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "floatValue");
}

id objc_msgSend_freshInitNeeded(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "freshInitNeeded");
}

id objc_msgSend_freshInitRequested(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "freshInitRequested");
}

id objc_msgSend_freshInitWithData_(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "freshInitWithData:");
}

id objc_msgSend_fullInitData(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "fullInitData");
}

id objc_msgSend_fullInitDataRead(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "fullInitDataRead");
}

id objc_msgSend_getBDCDataFromStartDate_toEndDate_forStream_withMetrics_withLimit_(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "getBDCDataFromStartDate:toEndDate:forStream:withMetrics:withLimit:");
}

id objc_msgSend_getDeviceAgeAtDate_usingManufactureDate_(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "getDeviceAgeAtDate:usingManufactureDate:");
}

id objc_msgSend_getDeviceManufactureDate(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "getDeviceManufactureDate");
}

id objc_msgSend_getDeviceModel(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "getDeviceModel");
}

id objc_msgSend_getInputNamesAndDimensionsForModel_(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "getInputNamesAndDimensionsForModel:");
}

id objc_msgSend_getNameForEvent_(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "getNameForEvent:");
}

id objc_msgSend_getOutputNamesAndDimensionsForModel_(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "getOutputNamesAndDimensionsForModel:");
}

id objc_msgSend_getPastBatteryHealthModelPredictionsWithParams_forPredictionOutputName_(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "getPastBatteryHealthModelPredictionsWithParams:forPredictionOutputName:");
}

id objc_msgSend_getPayloadForCoreAnalyticsWithParams_andModelPred_forModelOutput_(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "getPayloadForCoreAnalyticsWithParams:andModelPred:forModelOutput:");
}

id objc_msgSend_getPayloadForCoreAnalyticsWithParams_forModelOutput_(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "getPayloadForCoreAnalyticsWithParams:forModelOutput:");
}

id objc_msgSend_getPayloadForPPSWithParams_andFeatureValue_forModelOutput_(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "getPayloadForPPSWithParams:andFeatureValue:forModelOutput:");
}

id objc_msgSend_getPayloadForPPSWithParams_andPredictionValue_(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "getPayloadForPPSWithParams:andPredictionValue:");
}

id objc_msgSend_getResourceValue_forKey_error_(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "getResourceValue:forKey:error:");
}

id objc_msgSend_getTimestampForEntry_atVersion_(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "getTimestampForEntry:atVersion:");
}

id objc_msgSend_getValuesFrom2DMultiArray_withFeatureNamesForDimensions_(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "getValuesFrom2DMultiArray:withFeatureNamesForDimensions:");
}

id objc_msgSend_getValuesFrom3DMultiArray_withFeatureNamesForDimensions_(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "getValuesFrom3DMultiArray:withFeatureNamesForDimensions:");
}

id objc_msgSend_handleAlarmForEvent_(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "handleAlarmForEvent:");
}

id objc_msgSend_health_state_estimation(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "health_state_estimation");
}

id objc_msgSend_iconForSystemImageNamed_(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "iconForSystemImageNamed:");
}

id objc_msgSend_initDone(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "initDone");
}

id objc_msgSend_initWithBinLabelGenerator_allLabels_(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "initWithBinLabelGenerator:allLabels:");
}

id objc_msgSend_initWithBundleIdentifier_(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "initWithBundleIdentifier:");
}

id objc_msgSend_initWithContentsOfURL_configuration_error_(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "initWithContentsOfURL:configuration:error:");
}

id objc_msgSend_initWithContentsOfURL_error_(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "initWithContentsOfURL:error:");
}

id objc_msgSend_initWithDaily_history_input_usage_history_input_(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "initWithDaily_history_input:usage_history_input:");
}

id objc_msgSend_initWithDictionary_(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "initWithDictionary:");
}

id objc_msgSend_initWithDictionary_error_(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "initWithDictionary:error:");
}

id objc_msgSend_initWithFeatureProviderArray_(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "initWithFeatureProviderArray:");
}

id objc_msgSend_initWithHealth_state_estimation_(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "initWithHealth_state_estimation:");
}

id objc_msgSend_initWithInput_(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "initWithInput:");
}

id objc_msgSend_initWithMLModel_(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "initWithMLModel:");
}

id objc_msgSend_initWithMetrics_predicate_timeFilter_limitCount_offsetCount_(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "initWithMetrics:predicate:timeFilter:limitCount:offsetCount:");
}

id objc_msgSend_initWithMetrics_predicate_timeFilter_limitCount_offsetCount_readDirection_(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "initWithMetrics:predicate:timeFilter:limitCount:offsetCount:readDirection:");
}

id objc_msgSend_initWithNccp_wra_qmaxp_q10_forecast_nccp_wra_qmaxp_q25_forecast_nccp_wra_qmaxp_q50_forecast_nccp_wra_qmaxp_q75_forecast_nccp_wra_qmaxp_q90_forecast_(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "initWithNccp_wra_qmaxp_q10_forecast:nccp_wra_qmaxp_q25_forecast:nccp_wra_qmaxp_q50_forecast:nccp_wra_qmaxp_q75_forecast:nccp_wra_qmaxp_q90_forecast:");
}

id objc_msgSend_initWithObjects_(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "initWithObjects:");
}

id objc_msgSend_initWithPrediction_(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "initWithPrediction:");
}

id objc_msgSend_initWithSbc_in_(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "initWithSbc_in:");
}

id objc_msgSend_initWithShape_dataType_error_(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "initWithShape:dataType:error:");
}

id objc_msgSend_initWithStartDate_endDate_(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "initWithStartDate:endDate:");
}

id objc_msgSend_initWithStartDate_endDate_forBDCStream_atOrAboveVersion_usingDataFromCSVs_(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "initWithStartDate:endDate:forBDCStream:atOrAboveVersion:usingDataFromCSVs:");
}

id objc_msgSend_initWithTt80_prediction_in_hrs_(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "initWithTt80_prediction_in_hrs:");
}

id objc_msgSend_insertValue_error_(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "insertValue:error:");
}

id objc_msgSend_insertValue_thisManyTimes_error_(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "insertValue:thisManyTimes:error:");
}

id objc_msgSend_intValue(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "intValue");
}

id objc_msgSend_integerValue(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "integerValue");
}

id objc_msgSend_isEqual_(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "isEqual:");
}

id objc_msgSend_isEqualToDate_(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "isEqualToDate:");
}

id objc_msgSend_isEqualToNumber_(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "isEqualToNumber:");
}

id objc_msgSend_isEqualToString_(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "isEqualToString:");
}

id objc_msgSend_isiPhone(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "isiPhone");
}

id objc_msgSend_lastObject(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "lastObject");
}

id objc_msgSend_lastPathComponent(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "lastPathComponent");
}

id objc_msgSend_laterDate_(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "laterDate:");
}

id objc_msgSend_length(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "length");
}

id objc_msgSend_loadContentsOfURL_configuration_completionHandler_(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "loadContentsOfURL:configuration:completionHandler:");
}

id objc_msgSend_log(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "log");
}

id objc_msgSend_logger(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "logger");
}

id objc_msgSend_mainBundle(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "mainBundle");
}

id objc_msgSend_maxColumnIndexForBDCStream_atVersion_(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "maxColumnIndexForBDCStream:atVersion:");
}

id objc_msgSend_metaFilePath(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "metaFilePath");
}

id objc_msgSend_metadata(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "metadata");
}

id objc_msgSend_metricKeysAndValues(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "metricKeysAndValues");
}

id objc_msgSend_metricValueForKey_(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "metricValueForKey:");
}

id objc_msgSend_model(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "model");
}

id objc_msgSend_modelDescription(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "modelDescription");
}

id objc_msgSend_modelWithContentsOfURL_configuration_error_(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "modelWithContentsOfURL:configuration:error:");
}

id objc_msgSend_modelWithContentsOfURL_error_(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "modelWithContentsOfURL:error:");
}

id objc_msgSend_multiArrayValue(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "multiArrayValue");
}

id objc_msgSend_mutableCopy(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "mutableCopy");
}

id objc_msgSend_name(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "name");
}

id objc_msgSend_nccp_wra_qmaxp_q10_forecast(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "nccp_wra_qmaxp_q10_forecast");
}

id objc_msgSend_nccp_wra_qmaxp_q25_forecast(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "nccp_wra_qmaxp_q25_forecast");
}

id objc_msgSend_nccp_wra_qmaxp_q50_forecast(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "nccp_wra_qmaxp_q50_forecast");
}

id objc_msgSend_nccp_wra_qmaxp_q75_forecast(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "nccp_wra_qmaxp_q75_forecast");
}

id objc_msgSend_nccp_wra_qmaxp_q90_forecast(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "nccp_wra_qmaxp_q90_forecast");
}

id objc_msgSend_nextObject(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "nextObject");
}

id objc_msgSend_now(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "now");
}

id objc_msgSend_null(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "null");
}

id objc_msgSend_numberWithBool_(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "numberWithBool:");
}

id objc_msgSend_numberWithDouble_(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "numberWithDouble:");
}

id objc_msgSend_numberWithFloat_(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "numberWithFloat:");
}

id objc_msgSend_numberWithInt_(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "numberWithInt:");
}

id objc_msgSend_numberWithInteger_(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "numberWithInteger:");
}

id objc_msgSend_numberWithUnsignedChar_(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "numberWithUnsignedChar:");
}

id objc_msgSend_numberWithUnsignedInt_(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "numberWithUnsignedInt:");
}

id objc_msgSend_numberWithUnsignedInteger_(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "numberWithUnsignedInteger:");
}

id objc_msgSend_obcData(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "obcData");
}

id objc_msgSend_objectAtIndex_(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "objectAtIndex:");
}

id objc_msgSend_objectAtIndexedSubscript_(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "objectAtIndexedSubscript:");
}

id objc_msgSend_objectEnumerator(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "objectEnumerator");
}

id objc_msgSend_objectForKey_(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "objectForKey:");
}

id objc_msgSend_objectForKeyedSubscript_(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "objectForKeyedSubscript:");
}

id objc_msgSend_objectsForKeys_notFoundMarker_(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "objectsForKeys:notFoundMarker:");
}

id objc_msgSend_output(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "output");
}

id objc_msgSend_outputDescriptionsByName(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "outputDescriptionsByName");
}

id objc_msgSend_parseHealthHistoryFromPPSData_withBDCversion_andParams_(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "parseHealthHistoryFromPPSData:withBDCversion:andParams:");
}

id objc_msgSend_parseModelOutputName_(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "parseModelOutputName:");
}

id objc_msgSend_pathForResource_ofType_(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "pathForResource:ofType:");
}

id objc_msgSend_postTT80NotificationWithDuration_(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "postTT80NotificationWithDuration:");
}

id objc_msgSend_preInitData(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "preInitData");
}

id objc_msgSend_predicateWithFormat_(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "predicateWithFormat:");
}

id objc_msgSend_predictAndRecordWithParams_(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "predictAndRecordWithParams:");
}

id objc_msgSend_predictedFeatureName(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "predictedFeatureName");
}

id objc_msgSend_predictedFeatureNames(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "predictedFeatureNames");
}

id objc_msgSend_predictionFromFeatures_completionHandler_(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "predictionFromFeatures:completionHandler:");
}

id objc_msgSend_predictionFromFeatures_error_(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "predictionFromFeatures:error:");
}

id objc_msgSend_predictionFromFeatures_options_completionHandler_(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "predictionFromFeatures:options:completionHandler:");
}

id objc_msgSend_predictionFromFeatures_options_error_(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "predictionFromFeatures:options:error:");
}

id objc_msgSend_predictionsFromBatch_options_error_(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "predictionsFromBatch:options:error:");
}

id objc_msgSend_processDataEntry_forBDCDataColumns_atVersion_intoRunningCount_(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "processDataEntry:forBDCDataColumns:atVersion:intoRunningCount:");
}

id objc_msgSend_rangeOfUnit_startDate_interval_forDate_(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "rangeOfUnit:startDate:interval:forDate:");
}

id objc_msgSend_removeEvent_(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "removeEvent:");
}

id objc_msgSend_removeItemAtURL_error_(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "removeItemAtURL:error:");
}

id objc_msgSend_removeObject_(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "removeObject:");
}

id objc_msgSend_removeObjectAtIndex_(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "removeObjectAtIndex:");
}

id objc_msgSend_requestWithIdentifier_content_trigger_(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "requestWithIdentifier:content:trigger:");
}

id objc_msgSend_resampleUsingEnumerator_forBDCDataColumns_samplingPeriodSeconds_aggregationTypes_callBack_(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "resampleUsingEnumerator:forBDCDataColumns:samplingPeriodSeconds:aggregationTypes:callBack:");
}

id objc_msgSend_runInferenceAndGetPrediction_(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "runInferenceAndGetPrediction:");
}

id objc_msgSend_runInferenceForModel_withParams_outputFeatureType_(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "runInferenceForModel:withParams:outputFeatureType:");
}

id objc_msgSend_runMetaData(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "runMetaData");
}

id objc_msgSend_runTT80ModelwithParams_andSetupNextAlarm_(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "runTT80ModelwithParams:andSetupNextAlarm:");
}

id objc_msgSend_runWithData_(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "runWithData:");
}

id objc_msgSend_sbcData(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "sbcData");
}

id objc_msgSend_sbc_in(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "sbc_in");
}

id objc_msgSend_sendToCoreAnalytics_forEvent_(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "sendToCoreAnalytics:forEvent:");
}

id objc_msgSend_sendToPPS_forIdentifier_(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "sendToPPS:forIdentifier:");
}

id objc_msgSend_setAlarmWithName_withClock_afterSeconds_wakeUpAP_(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "setAlarmWithName:withClock:afterSeconds:wakeUpAP:");
}

id objc_msgSend_setAlgorithmClassName_(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "setAlgorithmClassName:");
}

id objc_msgSend_setBody_(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "setBody:");
}

id objc_msgSend_setCalendar_(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "setCalendar:");
}

id objc_msgSend_setCategoryIdentifier_(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "setCategoryIdentifier:");
}

id objc_msgSend_setComputeUnits_(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "setComputeUnits:");
}

id objc_msgSend_setDelegate_(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "setDelegate:");
}

id objc_msgSend_setDestinations_(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "setDestinations:");
}

id objc_msgSend_setExpirationDate_(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "setExpirationDate:");
}

id objc_msgSend_setFeatureFlagEn_(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "setFeatureFlagEn:");
}

id objc_msgSend_setFeatureGen_(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "setFeatureGen:");
}

id objc_msgSend_setIcon_(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "setIcon:");
}

id objc_msgSend_setLogToCoreAnalytics_(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "setLogToCoreAnalytics:");
}

id objc_msgSend_setLogToPPS_(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "setLogToPPS:");
}

id objc_msgSend_setName_(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "setName:");
}

id objc_msgSend_setObject_forKey_(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "setObject:forKey:");
}

id objc_msgSend_setObject_forKeyedSubscript_(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "setObject:forKeyedSubscript:");
}

id objc_msgSend_setOutputFeatureType_(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "setOutputFeatureType:");
}

id objc_msgSend_setPredictedFeatureNames_(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "setPredictedFeatureNames:");
}

id objc_msgSend_setShouldHideDate_(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "setShouldHideDate:");
}

id objc_msgSend_setShouldIgnoreDoNotDisturb_(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "setShouldIgnoreDoNotDisturb:");
}

id objc_msgSend_setShouldIgnoreDowntime_(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "setShouldIgnoreDowntime:");
}

id objc_msgSend_setShouldSuppressScreenLightUp_(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "setShouldSuppressScreenLightUp:");
}

id objc_msgSend_setTitle_(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "setTitle:");
}

id objc_msgSend_setValue_forKey_(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "setValue:forKey:");
}

id objc_msgSend_setVersion_(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "setVersion:");
}

id objc_msgSend_setWantsNotificationResponsesDelivered(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "setWantsNotificationResponsesDelivered");
}

id objc_msgSend_setWeekOfYear_(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "setWeekOfYear:");
}

id objc_msgSend_setWeekday_(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "setWeekday:");
}

id objc_msgSend_setWithArray_(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "setWithArray:");
}

id objc_msgSend_setWithObject_(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "setWithObject:");
}

id objc_msgSend_setYear_(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "setYear:");
}

id objc_msgSend_setupConnectionListenerForTT80(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "setupConnectionListenerForTT80");
}

id objc_msgSend_shape(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "shape");
}

id objc_msgSend_sharedBDCSchema(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "sharedBDCSchema");
}

id objc_msgSend_sharedInstance(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "sharedInstance");
}

id objc_msgSend_sharedPredictor(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "sharedPredictor");
}

id objc_msgSend_smcKeys(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "smcKeys");
}

id objc_msgSend_sortUsingComparator_(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "sortUsingComparator:");
}

id objc_msgSend_sortedArrayUsingSelector_(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "sortedArrayUsingSelector:");
}

id objc_msgSend_standardUserDefaults(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "standardUserDefaults");
}

id objc_msgSend_startDate(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "startDate");
}

id objc_msgSend_stateFilePath(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "stateFilePath");
}

id objc_msgSend_stringByAppendingFormat_(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "stringByAppendingFormat:");
}

id objc_msgSend_stringWithContentsOfURL_encoding_error_(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "stringWithContentsOfURL:encoding:error:");
}

id objc_msgSend_stringWithFormat_(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "stringWithFormat:");
}

id objc_msgSend_stringWithUTF8String_(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "stringWithUTF8String:");
}

id objc_msgSend_subarrayWithRange_(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "subarrayWithRange:");
}

id objc_msgSend_substringFromIndex_(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "substringFromIndex:");
}

id objc_msgSend_substringWithRange_(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "substringWithRange:");
}

id objc_msgSend_timeIntervalSince1970(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "timeIntervalSince1970");
}

id objc_msgSend_timeIntervalSinceDate_(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "timeIntervalSinceDate:");
}

id objc_msgSend_timeStringFromDuration_(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "timeStringFromDuration:");
}

id objc_msgSend_tt80EstimatorModel(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "tt80EstimatorModel");
}

id objc_msgSend_tt80NotificationContentWithDuration_(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "tt80NotificationContentWithDuration:");
}

id objc_msgSend_tt80NotificationRequestWithDuration_(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "tt80NotificationRequestWithDuration:");
}

id objc_msgSend_tt80_prediction_in_hrs(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "tt80_prediction_in_hrs");
}

id objc_msgSend_unsignedIntValue(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "unsignedIntValue");
}

id objc_msgSend_unsignedLongValue(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "unsignedLongValue");
}

id objc_msgSend_usage_history_input(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "usage_history_input");
}

id objc_msgSend_valueForKey_(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "valueForKey:");
}

id objc_msgSend_verifyArraysHaveSameCount_(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "verifyArraysHaveSameCount:");
}

id objc_msgSend_version(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "version");
}

id objc_msgSend_writeToURL_error_(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "writeToURL:error:");
}
