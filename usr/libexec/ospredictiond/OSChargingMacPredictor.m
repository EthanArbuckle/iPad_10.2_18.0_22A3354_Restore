@implementation OSChargingMacPredictor

- (id)getInputFeatures:(double)a3 events:(id)a4 pluginBatteryLevel:(unint64_t)a5 timeFromPlugin:(double)a6 pluginDate:(id)a7 withLog:(id)a8
{
  id v11;
  id v12;
  NSObject *v13;
  void *v14;
  double v15;
  double v16;
  uint64_t v17;
  uint64_t v18;
  uint64_t v19;
  uint64_t v20;
  uint64_t v21;
  uint64_t v22;
  double v23;
  double v24;
  double v25;
  double v26;
  void *v27;
  double v28;
  double v29;
  double v30;
  double v31;
  double v32;
  double v33;
  double v34;
  double v35;
  double v36;
  double v37;
  double v38;
  double v39;
  void *v40;
  void *v41;
  void *v42;
  void *v43;
  void *v44;
  void *v45;
  void *v46;
  double v47;
  void *v48;
  void *v49;
  void *v50;
  uint64_t v51;
  void *v52;
  int v53;
  void *v54;
  void *v55;
  void *v56;
  void *v57;
  void *v58;
  void *v59;
  void *v60;
  void *v61;
  void *v62;
  void *v63;
  void *v64;
  void *v65;
  void *v66;
  void *v67;
  void *v68;
  void *v69;
  void *v70;
  void *v71;
  id v72;
  id v73;
  uint64_t v74;
  void *v75;
  void *v76;
  NSObject *v77;
  void *v78;
  double v79;
  double v80;
  void *v81;
  void *v82;
  void *v83;
  void *v84;
  void *v85;
  id v86;
  NSObject *v87;
  void *v88;
  double v90;
  double v91;
  double v92;
  double v93;
  double v94;
  id v95;
  id v96;
  void *v97;
  void *v98;
  void *v99;
  void *v100;
  void *v101;
  void *v102;
  void *v104;
  void *v105;
  void *v106;
  void *v107;
  double v108;
  id v109;
  __int128 v110;
  __int128 v111;
  __int128 v112;
  __int128 v113;
  _QWORD v114[2];
  _QWORD v115[3];
  _QWORD v116[3];
  uint8_t buf[4];
  void *v118;
  __int16 v119;
  void *v120;
  _BYTE v121[128];

  v11 = a4;
  v12 = a7;
  v13 = a8;
  v14 = (void *)objc_claimAutoreleasedReturnValue(+[NSCalendar currentCalendar](NSCalendar, "currentCalendar"));
  v107 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v14, "components:fromDate:", 96, v12));

  v15 = (double)(uint64_t)objc_msgSend(v107, "hour");
  v16 = 0.0;
  v17 = objc_claimAutoreleasedReturnValue(+[OSIntelligenceUtilities events:forHourBin:date:withMaxDuration:](OSIntelligenceUtilities, "events:forHourBin:date:withMaxDuration:", v11, 1, v12, 0.0));
  v18 = objc_claimAutoreleasedReturnValue(+[OSIntelligenceUtilities events:forHourBin:date:withMaxDuration:](OSIntelligenceUtilities, "events:forHourBin:date:withMaxDuration:", v11, 2, v12, 0.0));
  v19 = objc_claimAutoreleasedReturnValue(+[OSIntelligenceUtilities events:forHourBin:date:withMaxDuration:](OSIntelligenceUtilities, "events:forHourBin:date:withMaxDuration:", v11, 4, v12, 0.0));
  v20 = objc_claimAutoreleasedReturnValue(+[OSIntelligenceUtilities events:forHourBin:date:withMaxDuration:](OSIntelligenceUtilities, "events:forHourBin:date:withMaxDuration:", v11, 8, v12, 0.0));
  v21 = objc_claimAutoreleasedReturnValue(+[OSIntelligenceUtilities events:forHourBin:date:withMaxDuration:](OSIntelligenceUtilities, "events:forHourBin:date:withMaxDuration:", v11, 16, v12, 0.0));
  v22 = objc_claimAutoreleasedReturnValue(+[OSIntelligenceUtilities events:forHourBin:date:withMaxDuration:](OSIntelligenceUtilities, "events:forHourBin:date:withMaxDuration:", v11, 24, v12, 0.0));
  +[OSIntelligenceUtilities standardDeviationOf:](OSIntelligenceUtilities, "standardDeviationOf:", v17);
  v91 = v23;
  +[OSIntelligenceUtilities standardDeviationOf:](OSIntelligenceUtilities, "standardDeviationOf:", v18);
  v92 = v24;
  +[OSIntelligenceUtilities standardDeviationOf:](OSIntelligenceUtilities, "standardDeviationOf:", v19);
  v93 = v25;
  +[OSIntelligenceUtilities standardDeviationOf:](OSIntelligenceUtilities, "standardDeviationOf:", v20);
  v94 = v26;
  +[OSIntelligenceUtilities standardDeviationOf:](OSIntelligenceUtilities, "standardDeviationOf:", v21);
  v95 = v27;
  +[OSIntelligenceUtilities standardDeviationOf:](OSIntelligenceUtilities, "standardDeviationOf:", v22);
  v108 = v28;
  v101 = (void *)v17;
  +[OSIntelligenceUtilities medianOf:](OSIntelligenceUtilities, "medianOf:", v17);
  v30 = v29;
  v106 = (void *)v18;
  +[OSIntelligenceUtilities medianOf:](OSIntelligenceUtilities, "medianOf:", v18);
  v32 = v31;
  v100 = (void *)v19;
  +[OSIntelligenceUtilities medianOf:](OSIntelligenceUtilities, "medianOf:", v19);
  v34 = v33;
  v99 = (void *)v20;
  +[OSIntelligenceUtilities medianOf:](OSIntelligenceUtilities, "medianOf:", v20);
  v36 = v35;
  v98 = (void *)v21;
  +[OSIntelligenceUtilities medianOf:](OSIntelligenceUtilities, "medianOf:", v21);
  v38 = v37;
  v105 = (void *)v22;
  +[OSIntelligenceUtilities medianOf:](OSIntelligenceUtilities, "medianOf:", v22);
  v90 = v39;
  v40 = (void *)objc_claimAutoreleasedReturnValue(+[NSMutableDictionary dictionary](NSMutableDictionary, "dictionary"));
  v41 = (void *)objc_claimAutoreleasedReturnValue(+[NSNumber numberWithUnsignedInteger:](NSNumber, "numberWithUnsignedInteger:", a5));
  objc_msgSend(v40, "setObject:forKeyedSubscript:", v41, CFSTR("plugin_battery_level"));

  v42 = (void *)objc_claimAutoreleasedReturnValue(+[NSNumber numberWithDouble:](NSNumber, "numberWithDouble:", v15));
  objc_msgSend(v40, "setObject:forKeyedSubscript:", v42, CFSTR("hour"));

  v43 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v11, "lastObject"));
  v44 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v43, "endDate"));
  v45 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v11, "lastObject"));
  v46 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v45, "startDate"));
  objc_msgSend(v44, "timeIntervalSinceDate:", v46);
  v48 = (void *)objc_claimAutoreleasedReturnValue(+[NSNumber numberWithDouble:](NSNumber, "numberWithDouble:", v47 / 3600.0));
  objc_msgSend(v40, "setObject:forKeyedSubscript:", v48, CFSTR("prev_charge_duration_1"));

  v102 = v12;
  v104 = v11;
  v49 = (void *)objc_claimAutoreleasedReturnValue(+[OSIntelligenceUtilities getUsageBucketsForEvents:forDate:withLog:](OSIntelligenceUtilities, "getUsageBucketsForEvents:forDate:withLog:", v11, v12, v13));
  +[OSIntelligenceUtilities hoursUntilUseFromBucketedUsage:withCurrentHour:withComponentsMinutes:](OSIntelligenceUtilities, "hoursUntilUseFromBucketedUsage:withCurrentHour:withComponentsMinutes:", v49, (int)a3, objc_msgSend(v107, "minute"));
  v50 = (void *)objc_claimAutoreleasedReturnValue(+[NSNumber numberWithDouble:](NSNumber, "numberWithDouble:"));
  objc_msgSend(v40, "setObject:forKeyedSubscript:", v50, CFSTR("hours_until_use"));

  v51 = 0;
  do
  {
    v52 = (void *)objc_claimAutoreleasedReturnValue(+[NSString stringWithFormat:](NSString, "stringWithFormat:", CFSTR("hour_plus_%d"), v51));
    v53 = (int)(v16 + a3);
    if (v53 > 23)
      v53 -= 24;
    v54 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v49, "objectAtIndexedSubscript:", v53));
    objc_msgSend(v54, "doubleValue");
    v55 = (void *)objc_claimAutoreleasedReturnValue(+[NSNumber numberWithDouble:](NSNumber, "numberWithDouble:"));
    objc_msgSend(v40, "setObject:forKeyedSubscript:", v55, v52);

    v16 = v16 + 1.0;
    v51 = (v51 + 1);
  }
  while ((_DWORD)v51 != 6);
  v97 = v49;
  v56 = (void *)objc_claimAutoreleasedReturnValue(+[NSNumber numberWithDouble:](NSNumber, "numberWithDouble:", v30));
  objc_msgSend(v40, "setObject:forKeyedSubscript:", v56, CFSTR("med_dur_1"));

  v57 = (void *)objc_claimAutoreleasedReturnValue(+[NSNumber numberWithDouble:](NSNumber, "numberWithDouble:", v32));
  objc_msgSend(v40, "setObject:forKeyedSubscript:", v57, CFSTR("med_dur_2"));

  v58 = (void *)objc_claimAutoreleasedReturnValue(+[NSNumber numberWithDouble:](NSNumber, "numberWithDouble:", v34));
  objc_msgSend(v40, "setObject:forKeyedSubscript:", v58, CFSTR("med_dur_4"));

  v59 = (void *)objc_claimAutoreleasedReturnValue(+[NSNumber numberWithDouble:](NSNumber, "numberWithDouble:", v36));
  objc_msgSend(v40, "setObject:forKeyedSubscript:", v59, CFSTR("med_dur_8"));

  v60 = (void *)objc_claimAutoreleasedReturnValue(+[NSNumber numberWithDouble:](NSNumber, "numberWithDouble:", v38));
  objc_msgSend(v40, "setObject:forKeyedSubscript:", v60, CFSTR("med_dur_16"));

  v61 = (void *)objc_claimAutoreleasedReturnValue(+[NSNumber numberWithDouble:](NSNumber, "numberWithDouble:", v90));
  objc_msgSend(v40, "setObject:forKeyedSubscript:", v61, CFSTR("med_dur_24"));

  v62 = (void *)objc_claimAutoreleasedReturnValue(+[NSNumber numberWithUnsignedInteger:](NSNumber, "numberWithUnsignedInteger:", objc_msgSend(v106, "count")));
  objc_msgSend(v40, "setObject:forKeyedSubscript:", v62, CFSTR("cnt_dur_2"));

  v63 = (void *)objc_claimAutoreleasedReturnValue(+[NSNumber numberWithUnsignedInteger:](NSNumber, "numberWithUnsignedInteger:", objc_msgSend(v105, "count")));
  objc_msgSend(v40, "setObject:forKeyedSubscript:", v63, CFSTR("cnt_dur_24"));

  v64 = (void *)objc_claimAutoreleasedReturnValue(+[NSNumber numberWithDouble:](NSNumber, "numberWithDouble:", v91));
  objc_msgSend(v40, "setObject:forKeyedSubscript:", v64, CFSTR("std_dur_1"));

  v65 = (void *)objc_claimAutoreleasedReturnValue(+[NSNumber numberWithDouble:](NSNumber, "numberWithDouble:", v92));
  objc_msgSend(v40, "setObject:forKeyedSubscript:", v65, CFSTR("std_dur_2"));

  v66 = (void *)objc_claimAutoreleasedReturnValue(+[NSNumber numberWithDouble:](NSNumber, "numberWithDouble:", v93));
  objc_msgSend(v40, "setObject:forKeyedSubscript:", v66, CFSTR("std_dur_4"));

  v67 = (void *)objc_claimAutoreleasedReturnValue(+[NSNumber numberWithDouble:](NSNumber, "numberWithDouble:", v94));
  objc_msgSend(v40, "setObject:forKeyedSubscript:", v67, CFSTR("std_dur_8"));

  v68 = (void *)objc_claimAutoreleasedReturnValue(+[NSNumber numberWithDouble:](NSNumber, "numberWithDouble:", *(double *)&v95));
  objc_msgSend(v40, "setObject:forKeyedSubscript:", v68, CFSTR("std_dur_16"));

  v69 = (void *)objc_claimAutoreleasedReturnValue(+[NSNumber numberWithDouble:](NSNumber, "numberWithDouble:", v108));
  objc_msgSend(v40, "setObject:forKeyedSubscript:", v69, CFSTR("std_dur_24"));

  v96 = objc_msgSend(objc_alloc((Class)MLDictionaryFeatureProvider), "initWithDictionary:error:", v40, 0);
  v110 = 0u;
  v111 = 0u;
  v112 = 0u;
  v113 = 0u;
  v70 = v40;
  v71 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v40, "allKeys"));
  v72 = objc_msgSend(v71, "countByEnumeratingWithState:objects:count:", &v110, v121, 16);
  if (v72)
  {
    v73 = v72;
    v74 = *(_QWORD *)v111;
    do
    {
      v75 = 0;
      do
      {
        if (*(_QWORD *)v111 != v74)
          objc_enumerationMutation(v71);
        v76 = *(void **)(*((_QWORD *)&v110 + 1) + 8 * (_QWORD)v75);
        v77 = v13;
        if (os_log_type_enabled(v77, OS_LOG_TYPE_DEBUG))
        {
          v78 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v70, "objectForKeyedSubscript:", v76));
          *(_DWORD *)buf = 138412546;
          v118 = v76;
          v119 = 2112;
          v120 = v78;
          _os_log_debug_impl((void *)&_mh_execute_header, v77, OS_LOG_TYPE_DEBUG, "input for feature '%@': %@", buf, 0x16u);

        }
        v75 = (char *)v75 + 1;
      }
      while (v73 != v75);
      v73 = objc_msgSend(v71, "countByEnumeratingWithState:objects:count:", &v110, v121, 16);
    }
    while (v73);
  }

  objc_msgSend(v102, "timeIntervalSince1970");
  v80 = floor(v79);
  v115[0] = CFSTR("pluginDateAsInterval");
  v81 = (void *)objc_claimAutoreleasedReturnValue(+[NSNumber numberWithDouble:](NSNumber, "numberWithDouble:", v80));
  v116[0] = v81;
  v116[1] = v70;
  v82 = v70;
  v115[1] = CFSTR("features");
  v115[2] = CFSTR("dataVersion");
  v116[2] = &off_100064D60;
  v83 = (void *)objc_claimAutoreleasedReturnValue(+[NSDictionary dictionaryWithObjects:forKeys:count:](NSDictionary, "dictionaryWithObjects:forKeys:count:", v116, v115, 3));

  v114[0] = CFSTR("/var/mobile/Library/OSIntelligence");
  v114[1] = CFSTR("obc_features");
  v84 = (void *)objc_claimAutoreleasedReturnValue(+[NSArray arrayWithObjects:count:](NSArray, "arrayWithObjects:count:", v114, 2));
  v85 = (void *)objc_claimAutoreleasedReturnValue(+[NSURL fileURLWithPathComponents:](NSURL, "fileURLWithPathComponents:", v84));

  v109 = 0;
  objc_msgSend(v83, "writeToURL:error:", v85, &v109);
  v86 = v109;
  if (v86)
  {
    if (os_log_type_enabled(v13, OS_LOG_TYPE_ERROR))
      sub_10003EF7C((uint64_t)v86, v13);
  }
  else
  {
    v87 = v13;
    if (os_log_type_enabled(v87, OS_LOG_TYPE_DEFAULT))
    {
      v88 = (void *)objc_claimAutoreleasedReturnValue(+[NSNumber numberWithDouble:](NSNumber, "numberWithDouble:", v80));
      *(_DWORD *)buf = 138412290;
      v118 = v88;
      _os_log_impl((void *)&_mh_execute_header, v87, OS_LOG_TYPE_DEFAULT, "Feature dict saved for plugin: %@", buf, 0xCu);

    }
  }

  return v96;
}

@end
