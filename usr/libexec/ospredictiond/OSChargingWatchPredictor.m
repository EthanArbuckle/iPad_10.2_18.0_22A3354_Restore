@implementation OSChargingWatchPredictor

- (id)getInputFeatures:(double)a3 events:(id)a4 pluginBatteryLevel:(unint64_t)a5 timeFromPlugin:(double)a6 pluginDate:(id)a7 withLog:(id)a8
{
  id v10;
  id v11;
  id v12;
  void *v13;
  void *v14;
  void *v15;
  uint64_t v16;
  void *v17;
  void *v18;
  uint64_t v19;
  void *v20;
  double v21;
  double v22;
  double v23;
  double v24;
  double v25;
  double v26;
  double v27;
  double v28;
  double v29;
  double v30;
  double v31;
  double v32;
  void *v33;
  double v34;
  double v35;
  double v36;
  double v37;
  double v38;
  double v39;
  double v40;
  NSObject *v41;
  void *v42;
  void *v43;
  void *v44;
  void *v45;
  void *v46;
  void *v47;
  void *v48;
  NSObject *v49;
  id v50;
  NSObject *v51;
  id v52;
  NSObject *v53;
  id v54;
  NSObject *v55;
  id v56;
  NSObject *v57;
  id v58;
  NSObject *v59;
  id v60;
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
  void *v72;
  void *v73;
  void *v74;
  void *v75;
  void *v76;
  void *v77;
  void *v78;
  void *v79;
  void *v80;
  void *v81;
  void *v82;
  void *v83;
  id v84;
  id v85;
  uint64_t v86;
  void *v87;
  void *v88;
  NSObject *v89;
  void *v90;
  double v91;
  double v92;
  void *v93;
  void *v94;
  void *v95;
  void *v96;
  id v97;
  void *v98;
  NSObject *v99;
  void *v100;
  void *v102;
  void *v104;
  void *v105;
  id v106;
  id v107;
  double v108;
  void *v109;
  double v110;
  void *v111;
  double v112;
  void *v113;
  double v114;
  void *v115;
  void *v116;
  void *v117;
  void *v120;
  id v121;
  __int128 v122;
  __int128 v123;
  __int128 v124;
  __int128 v125;
  _QWORD v126[2];
  _QWORD v127[3];
  _QWORD v128[3];
  uint8_t v129[128];
  uint8_t buf[4];
  id v131;
  __int16 v132;
  double v133;
  __int16 v134;
  double v135;
  __int16 v136;
  void *v137;

  v10 = a4;
  v11 = a7;
  v12 = a8;
  v13 = (void *)objc_claimAutoreleasedReturnValue(+[NSCalendar currentCalendar](NSCalendar, "currentCalendar"));
  v14 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v13, "components:fromDate:", 32, v11));

  v102 = v14;
  v114 = (double)(uint64_t)objc_msgSend(v14, "hour");
  v15 = (void *)objc_claimAutoreleasedReturnValue(+[OSIntelligenceUtilities events:forHourBin:date:withMaxDuration:](OSIntelligenceUtilities, "events:forHourBin:date:withMaxDuration:", v10, 1, v11, 12.0));
  v16 = objc_claimAutoreleasedReturnValue(+[OSIntelligenceUtilities events:forHourBin:date:withMaxDuration:](OSIntelligenceUtilities, "events:forHourBin:date:withMaxDuration:", v10, 2, v11, 12.0));
  v17 = (void *)objc_claimAutoreleasedReturnValue(+[OSIntelligenceUtilities events:forHourBin:date:withMaxDuration:](OSIntelligenceUtilities, "events:forHourBin:date:withMaxDuration:", v10, 4, v11, 12.0));
  v18 = (void *)objc_claimAutoreleasedReturnValue(+[OSIntelligenceUtilities events:forHourBin:date:withMaxDuration:](OSIntelligenceUtilities, "events:forHourBin:date:withMaxDuration:", v10, 8, v11, 12.0));
  v19 = objc_claimAutoreleasedReturnValue(+[OSIntelligenceUtilities events:forHourBin:date:withMaxDuration:](OSIntelligenceUtilities, "events:forHourBin:date:withMaxDuration:", v10, 16, v11, 12.0));
  v105 = v10;
  v20 = (void *)objc_claimAutoreleasedReturnValue(+[OSIntelligenceUtilities events:forHourBin:date:withMaxDuration:](OSIntelligenceUtilities, "events:forHourBin:date:withMaxDuration:", v10, 24, v11, 12.0));
  +[OSIntelligenceUtilities standardDeviationOf:](OSIntelligenceUtilities, "standardDeviationOf:", v15);
  v22 = v21;
  +[OSIntelligenceUtilities standardDeviationOf:](OSIntelligenceUtilities, "standardDeviationOf:", v16);
  v24 = v23;
  +[OSIntelligenceUtilities standardDeviationOf:](OSIntelligenceUtilities, "standardDeviationOf:", v17);
  v26 = v25;
  +[OSIntelligenceUtilities standardDeviationOf:](OSIntelligenceUtilities, "standardDeviationOf:", v18);
  v28 = v27;
  +[OSIntelligenceUtilities standardDeviationOf:](OSIntelligenceUtilities, "standardDeviationOf:", v19);
  v30 = v29;
  +[OSIntelligenceUtilities standardDeviationOf:](OSIntelligenceUtilities, "standardDeviationOf:", v20);
  v32 = v31;
  +[OSIntelligenceUtilities medianOf:](OSIntelligenceUtilities, "medianOf:", v15);
  v106 = v33;
  v117 = (void *)v16;
  +[OSIntelligenceUtilities medianOf:](OSIntelligenceUtilities, "medianOf:", v16);
  v108 = v34;
  +[OSIntelligenceUtilities medianOf:](OSIntelligenceUtilities, "medianOf:", v17);
  v110 = v35;
  +[OSIntelligenceUtilities medianOf:](OSIntelligenceUtilities, "medianOf:", v18);
  v112 = v36;
  v116 = (void *)v19;
  +[OSIntelligenceUtilities medianOf:](OSIntelligenceUtilities, "medianOf:", v19);
  v38 = v37;
  +[OSIntelligenceUtilities medianOf:](OSIntelligenceUtilities, "medianOf:", v20);
  v40 = v39;
  v41 = v12;
  if (os_log_type_enabled(v41, OS_LOG_TYPE_DEFAULT))
  {
    v42 = (void *)objc_claimAutoreleasedReturnValue(+[NSNumber numberWithDouble:](NSNumber, "numberWithDouble:", v114));
    v43 = v20;
    v44 = (void *)objc_claimAutoreleasedReturnValue(+[NSNumber numberWithUnsignedInteger:](NSNumber, "numberWithUnsignedInteger:", a5));
    v45 = v17;
    v46 = (void *)objc_claimAutoreleasedReturnValue(+[NSNumber numberWithDouble:](NSNumber, "numberWithDouble:", a3));
    v47 = v18;
    v48 = (void *)objc_claimAutoreleasedReturnValue(+[NSNumber numberWithDouble:](NSNumber, "numberWithDouble:", a6));
    *(_DWORD *)buf = 138413058;
    v131 = v42;
    v132 = 2112;
    v133 = *(double *)&v44;
    v134 = 2112;
    v135 = *(double *)&v46;
    v136 = 2112;
    v137 = v48;
    _os_log_impl((void *)&_mh_execute_header, v41, OS_LOG_TYPE_DEFAULT, "Model inputs: PluginHour=%@, PluginBatteryLevel=%@, Hour=%@, TimeFromPlugin=%@", buf, 0x2Au);

    v18 = v47;
    v17 = v45;

    v20 = v43;
  }

  if (os_log_type_enabled(v41, OS_LOG_TYPE_DEBUG))
    sub_10003EA70();
  v49 = v41;
  if (os_log_type_enabled(v49, OS_LOG_TYPE_DEFAULT))
  {
    v50 = objc_msgSend(v15, "count");
    *(_DWORD *)buf = 134218496;
    v131 = v50;
    v132 = 2048;
    v133 = v22;
    v134 = 2048;
    v135 = *(double *)&v106;
    _os_log_impl((void *)&_mh_execute_header, v49, OS_LOG_TYPE_DEFAULT, "Model inputs for hourBin1: count %lu, std_dur_1: %f, med_dur_1: %lf", buf, 0x20u);
  }

  if (os_log_type_enabled(v49, OS_LOG_TYPE_DEBUG))
    sub_10003EA10();
  v51 = v49;
  if (os_log_type_enabled(v51, OS_LOG_TYPE_DEFAULT))
  {
    v52 = objc_msgSend(v117, "count");
    *(_DWORD *)buf = 134218496;
    v131 = v52;
    v132 = 2048;
    v133 = v24;
    v134 = 2048;
    v135 = v108;
    _os_log_impl((void *)&_mh_execute_header, v51, OS_LOG_TYPE_DEFAULT, "Model inputs for hourBin2: count %lu, std_dur_2: %f, med_dur_2: %lf", buf, 0x20u);
  }

  if (os_log_type_enabled(v51, OS_LOG_TYPE_DEBUG))
    sub_10003E9B0();
  v53 = v51;
  if (os_log_type_enabled(v53, OS_LOG_TYPE_DEFAULT))
  {
    v54 = objc_msgSend(v17, "count");
    *(_DWORD *)buf = 134218496;
    v131 = v54;
    v132 = 2048;
    v133 = v26;
    v134 = 2048;
    v135 = v110;
    _os_log_impl((void *)&_mh_execute_header, v53, OS_LOG_TYPE_DEFAULT, "Model inputs for hourBin4: count %lu, std_dur_4: %f, med_dur_4: %lf", buf, 0x20u);
  }

  if (os_log_type_enabled(v53, OS_LOG_TYPE_DEBUG))
    sub_10003E950();
  v55 = v53;
  if (os_log_type_enabled(v55, OS_LOG_TYPE_DEFAULT))
  {
    v56 = objc_msgSend(v18, "count");
    *(_DWORD *)buf = 134218496;
    v131 = v56;
    v132 = 2048;
    v133 = v28;
    v134 = 2048;
    v135 = v112;
    _os_log_impl((void *)&_mh_execute_header, v55, OS_LOG_TYPE_DEFAULT, "Model inputs for hourBin8: count %lu, std_dur_8: %f, med_dur_8: %lf", buf, 0x20u);
  }

  if (os_log_type_enabled(v55, OS_LOG_TYPE_DEBUG))
    sub_10003E8F0();
  v57 = v55;
  if (os_log_type_enabled(v57, OS_LOG_TYPE_DEFAULT))
  {
    v58 = objc_msgSend(v116, "count");
    *(_DWORD *)buf = 134218496;
    v131 = v58;
    v132 = 2048;
    v133 = v30;
    v134 = 2048;
    v135 = v38;
    _os_log_impl((void *)&_mh_execute_header, v57, OS_LOG_TYPE_DEFAULT, "Model inputs for hourBin16: count %lu, std_dur_16: %f, med_dur_16: %lf", buf, 0x20u);
  }
  v104 = v11;

  if (os_log_type_enabled(v57, OS_LOG_TYPE_DEBUG))
    sub_10003E890();
  v59 = v57;
  if (os_log_type_enabled(v59, OS_LOG_TYPE_DEFAULT))
  {
    v60 = objc_msgSend(v20, "count");
    *(_DWORD *)buf = 134218496;
    v131 = v60;
    v132 = 2048;
    v133 = v32;
    v134 = 2048;
    v135 = v40;
    _os_log_impl((void *)&_mh_execute_header, v59, OS_LOG_TYPE_DEFAULT, "Model inputs for hourBin24: count %lu, std_dur_24: %f, med_dur_24: %lf", buf, 0x20u);
  }

  v61 = (void *)objc_claimAutoreleasedReturnValue(+[NSMutableDictionary dictionary](NSMutableDictionary, "dictionary"));
  v62 = (void *)objc_claimAutoreleasedReturnValue(+[NSNumber numberWithUnsignedInteger:](NSNumber, "numberWithUnsignedInteger:", a5));
  objc_msgSend(v61, "setObject:forKeyedSubscript:", v62, CFSTR("plugin_battery_level"));

  v63 = (void *)objc_claimAutoreleasedReturnValue(+[NSNumber numberWithDouble:](NSNumber, "numberWithDouble:", a6));
  objc_msgSend(v61, "setObject:forKeyedSubscript:", v63, CFSTR("time_from_plugin"));

  v64 = (void *)objc_claimAutoreleasedReturnValue(+[NSNumber numberWithDouble:](NSNumber, "numberWithDouble:", v114));
  objc_msgSend(v61, "setObject:forKeyedSubscript:", v64, CFSTR("hour"));

  v65 = (void *)objc_claimAutoreleasedReturnValue(+[NSNumber numberWithDouble:](NSNumber, "numberWithDouble:", *(double *)&v106));
  objc_msgSend(v61, "setObject:forKeyedSubscript:", v65, CFSTR("med_dur_1"));

  v66 = (void *)objc_claimAutoreleasedReturnValue(+[NSNumber numberWithDouble:](NSNumber, "numberWithDouble:", v108));
  objc_msgSend(v61, "setObject:forKeyedSubscript:", v66, CFSTR("med_dur_2"));

  v67 = (void *)objc_claimAutoreleasedReturnValue(+[NSNumber numberWithDouble:](NSNumber, "numberWithDouble:", v110));
  objc_msgSend(v61, "setObject:forKeyedSubscript:", v67, CFSTR("med_dur_4"));

  v68 = (void *)objc_claimAutoreleasedReturnValue(+[NSNumber numberWithDouble:](NSNumber, "numberWithDouble:", v112));
  objc_msgSend(v61, "setObject:forKeyedSubscript:", v68, CFSTR("med_dur_8"));

  v69 = (void *)objc_claimAutoreleasedReturnValue(+[NSNumber numberWithDouble:](NSNumber, "numberWithDouble:", v38));
  objc_msgSend(v61, "setObject:forKeyedSubscript:", v69, CFSTR("med_dur_16"));

  v70 = (void *)objc_claimAutoreleasedReturnValue(+[NSNumber numberWithDouble:](NSNumber, "numberWithDouble:", v40));
  objc_msgSend(v61, "setObject:forKeyedSubscript:", v70, CFSTR("med_dur_24"));

  v115 = v15;
  v71 = (void *)objc_claimAutoreleasedReturnValue(+[NSNumber numberWithUnsignedInteger:](NSNumber, "numberWithUnsignedInteger:", objc_msgSend(v15, "count")));
  objc_msgSend(v61, "setObject:forKeyedSubscript:", v71, CFSTR("cnt_dur_1"));

  v72 = (void *)objc_claimAutoreleasedReturnValue(+[NSNumber numberWithUnsignedInteger:](NSNumber, "numberWithUnsignedInteger:", objc_msgSend(v117, "count")));
  objc_msgSend(v61, "setObject:forKeyedSubscript:", v72, CFSTR("cnt_dur_2"));

  v113 = v17;
  v73 = (void *)objc_claimAutoreleasedReturnValue(+[NSNumber numberWithUnsignedInteger:](NSNumber, "numberWithUnsignedInteger:", objc_msgSend(v17, "count")));
  objc_msgSend(v61, "setObject:forKeyedSubscript:", v73, CFSTR("cnt_dur_4"));

  v111 = v18;
  v74 = (void *)objc_claimAutoreleasedReturnValue(+[NSNumber numberWithUnsignedInteger:](NSNumber, "numberWithUnsignedInteger:", objc_msgSend(v18, "count")));
  objc_msgSend(v61, "setObject:forKeyedSubscript:", v74, CFSTR("cnt_dur_8"));

  v75 = (void *)objc_claimAutoreleasedReturnValue(+[NSNumber numberWithUnsignedInteger:](NSNumber, "numberWithUnsignedInteger:", objc_msgSend(v116, "count")));
  objc_msgSend(v61, "setObject:forKeyedSubscript:", v75, CFSTR("cnt_dur_16"));

  v109 = v20;
  v76 = (void *)objc_claimAutoreleasedReturnValue(+[NSNumber numberWithUnsignedInteger:](NSNumber, "numberWithUnsignedInteger:", objc_msgSend(v20, "count")));
  objc_msgSend(v61, "setObject:forKeyedSubscript:", v76, CFSTR("cnt_dur_24"));

  v77 = (void *)objc_claimAutoreleasedReturnValue(+[NSNumber numberWithDouble:](NSNumber, "numberWithDouble:", v22));
  objc_msgSend(v61, "setObject:forKeyedSubscript:", v77, CFSTR("std_dur_1"));

  v78 = (void *)objc_claimAutoreleasedReturnValue(+[NSNumber numberWithDouble:](NSNumber, "numberWithDouble:", v24));
  objc_msgSend(v61, "setObject:forKeyedSubscript:", v78, CFSTR("std_dur_2"));

  v79 = (void *)objc_claimAutoreleasedReturnValue(+[NSNumber numberWithDouble:](NSNumber, "numberWithDouble:", v26));
  objc_msgSend(v61, "setObject:forKeyedSubscript:", v79, CFSTR("std_dur_4"));

  v80 = (void *)objc_claimAutoreleasedReturnValue(+[NSNumber numberWithDouble:](NSNumber, "numberWithDouble:", v28));
  objc_msgSend(v61, "setObject:forKeyedSubscript:", v80, CFSTR("std_dur_8"));

  v81 = (void *)objc_claimAutoreleasedReturnValue(+[NSNumber numberWithDouble:](NSNumber, "numberWithDouble:", v30));
  objc_msgSend(v61, "setObject:forKeyedSubscript:", v81, CFSTR("std_dur_16"));

  v82 = (void *)objc_claimAutoreleasedReturnValue(+[NSNumber numberWithDouble:](NSNumber, "numberWithDouble:", v32));
  objc_msgSend(v61, "setObject:forKeyedSubscript:", v82, CFSTR("std_dur_24"));

  v107 = objc_msgSend(objc_alloc((Class)MLDictionaryFeatureProvider), "initWithDictionary:error:", v61, 0);
  v122 = 0u;
  v123 = 0u;
  v124 = 0u;
  v125 = 0u;
  v120 = v61;
  v83 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v61, "allKeys"));
  v84 = objc_msgSend(v83, "countByEnumeratingWithState:objects:count:", &v122, v129, 16);
  if (v84)
  {
    v85 = v84;
    v86 = *(_QWORD *)v123;
    do
    {
      v87 = 0;
      do
      {
        if (*(_QWORD *)v123 != v86)
          objc_enumerationMutation(v83);
        v88 = *(void **)(*((_QWORD *)&v122 + 1) + 8 * (_QWORD)v87);
        v89 = v59;
        if (os_log_type_enabled(v89, OS_LOG_TYPE_DEBUG))
        {
          v90 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v120, "objectForKeyedSubscript:", v88));
          *(_DWORD *)buf = 138412546;
          v131 = v88;
          v132 = 2112;
          v133 = *(double *)&v90;
          _os_log_debug_impl((void *)&_mh_execute_header, v89, OS_LOG_TYPE_DEBUG, "input for feature '%@': %@", buf, 0x16u);

        }
        v87 = (char *)v87 + 1;
      }
      while (v85 != v87);
      v85 = objc_msgSend(v83, "countByEnumeratingWithState:objects:count:", &v122, v129, 16);
    }
    while (v85);
  }

  objc_msgSend(v104, "timeIntervalSince1970");
  v92 = floor(v91);
  v127[0] = CFSTR("pluginDateAsInterval");
  v93 = (void *)objc_claimAutoreleasedReturnValue(+[NSNumber numberWithDouble:](NSNumber, "numberWithDouble:", v92));
  v128[0] = v93;
  v128[1] = v120;
  v127[1] = CFSTR("features");
  v127[2] = CFSTR("dataVersion");
  v128[2] = &off_100064D78;
  v94 = (void *)objc_claimAutoreleasedReturnValue(+[NSDictionary dictionaryWithObjects:forKeys:count:](NSDictionary, "dictionaryWithObjects:forKeys:count:", v128, v127, 3));

  v126[0] = CFSTR("/var/mobile/Library/OSIntelligence");
  v126[1] = CFSTR("obc_features");
  v95 = (void *)objc_claimAutoreleasedReturnValue(+[NSArray arrayWithObjects:count:](NSArray, "arrayWithObjects:count:", v126, 2));
  v96 = (void *)objc_claimAutoreleasedReturnValue(+[NSURL fileURLWithPathComponents:](NSURL, "fileURLWithPathComponents:", v95));

  v121 = 0;
  objc_msgSend(v94, "writeToURL:error:", v96, &v121);
  v97 = v121;
  if (v97)
  {
    v98 = v117;
    if (os_log_type_enabled(v59, OS_LOG_TYPE_ERROR))
      sub_10003EFF0();
  }
  else
  {
    v99 = v59;
    v98 = v117;
    if (os_log_type_enabled(v99, OS_LOG_TYPE_DEFAULT))
    {
      v100 = (void *)objc_claimAutoreleasedReturnValue(+[NSNumber numberWithDouble:](NSNumber, "numberWithDouble:", v92));
      *(_DWORD *)buf = 138412290;
      v131 = v100;
      _os_log_impl((void *)&_mh_execute_header, v99, OS_LOG_TYPE_DEFAULT, "Feature dict saved for plugin: %@", buf, 0xCu);

    }
  }

  return v107;
}

@end
