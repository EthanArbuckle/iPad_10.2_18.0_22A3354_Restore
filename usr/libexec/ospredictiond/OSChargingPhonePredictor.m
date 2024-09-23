@implementation OSChargingPhonePredictor

- (id)getInputFeatures:(double)a3 events:(id)a4 pluginBatteryLevel:(unint64_t)a5 timeFromPlugin:(double)a6 pluginDate:(id)a7 withLog:(id)a8
{
  id v10;
  id v11;
  uint64_t v12;
  uint64_t v13;
  uint64_t v14;
  uint64_t v15;
  uint64_t v16;
  uint64_t v17;
  uint64_t v18;
  uint64_t v19;
  uint64_t v20;
  void *v21;
  uint64_t v22;
  uint64_t v23;
  uint64_t v24;
  uint64_t v25;
  uint64_t v26;
  uint64_t v27;
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
  double v40;
  double v41;
  double v42;
  double v43;
  double v44;
  double v45;
  double v46;
  double v47;
  uint64_t v48;
  void *v49;
  double v50;
  double v51;
  double v52;
  double v53;
  double v54;
  double v55;
  NSObject *v56;
  void *v57;
  void *v58;
  void *v59;
  NSObject *v60;
  id v61;
  NSObject *v62;
  id v63;
  NSObject *v64;
  id v65;
  NSObject *v66;
  id v67;
  NSObject *v68;
  id v69;
  NSObject *v70;
  id v71;
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
  void *v84;
  void *v85;
  void *v86;
  void *v87;
  void *v88;
  void *v89;
  void *v90;
  void *v91;
  void *v92;
  void *v93;
  void *v94;
  void *v95;
  void *v96;
  void *v97;
  void *v98;
  void *v99;
  id v100;
  double v101;
  double v102;
  void *v103;
  void *v104;
  void *v105;
  void *v106;
  id v107;
  OS_os_log *v108;
  NSObject *v109;
  OS_os_log *v110;
  void *v111;
  void *v114;
  void *v115;
  id v116;
  void *v117;
  void *v118;
  void *v119;
  void *v120;
  void *v121;
  void *v122;
  void *v124;
  void *v125;
  void *v126;
  double v128;
  double v129;
  double v130;
  double v131;
  double v132;
  double v134;
  double v135;
  double v136;
  double v137;
  double v138;
  void *v139;
  void *v140;
  void *v141;
  void *v142;
  void *v143;
  void *v144;
  void *v145;
  void *v146;
  void *v147;
  void *v148;
  void *v149;
  objc_super v150;
  objc_super v151;
  id v152;
  _QWORD v153[2];
  _QWORD v154[3];
  _QWORD v155[3];
  uint8_t buf[4];
  double v157;
  __int16 v158;
  double v159;
  __int16 v160;
  double v161;

  v10 = a7;
  v116 = a8;
  v11 = a4;
  v12 = objc_claimAutoreleasedReturnValue(+[OSIntelligenceUtilities filterEventsSortedByStartDateAscending:startsBefore:dynamicallyAroundDate:withHourBinWidth:](OSIntelligenceUtilities, "filterEventsSortedByStartDateAscending:startsBefore:dynamicallyAroundDate:withHourBinWidth:", v11, v10, v10, 1));
  v13 = objc_claimAutoreleasedReturnValue(+[OSIntelligenceUtilities filterEventsSortedByStartDateAscending:startsBefore:dynamicallyAroundDate:withHourBinWidth:](OSIntelligenceUtilities, "filterEventsSortedByStartDateAscending:startsBefore:dynamicallyAroundDate:withHourBinWidth:", v11, v10, v10, 2));
  v14 = objc_claimAutoreleasedReturnValue(+[OSIntelligenceUtilities filterEventsSortedByStartDateAscending:startsBefore:dynamicallyAroundDate:withHourBinWidth:](OSIntelligenceUtilities, "filterEventsSortedByStartDateAscending:startsBefore:dynamicallyAroundDate:withHourBinWidth:", v11, v10, v10, 4));
  v15 = objc_claimAutoreleasedReturnValue(+[OSIntelligenceUtilities filterEventsSortedByStartDateAscending:startsBefore:dynamicallyAroundDate:withHourBinWidth:](OSIntelligenceUtilities, "filterEventsSortedByStartDateAscending:startsBefore:dynamicallyAroundDate:withHourBinWidth:", v11, v10, v10, 8));
  v149 = (void *)objc_claimAutoreleasedReturnValue(+[OSIntelligenceUtilities filterEventsSortedByStartDateAscending:startsBefore:dynamicallyAroundDate:withHourBinWidth:](OSIntelligenceUtilities, "filterEventsSortedByStartDateAscending:startsBefore:dynamicallyAroundDate:withHourBinWidth:", v11, v10, v10, 16));
  v16 = objc_claimAutoreleasedReturnValue(+[OSIntelligenceUtilities filterEventsSortedByStartDateAscending:startsBefore:dynamicallyAroundDate:withHourBinWidth:](OSIntelligenceUtilities, "filterEventsSortedByStartDateAscending:startsBefore:dynamicallyAroundDate:withHourBinWidth:", v11, v10, v10, 24));

  v17 = objc_claimAutoreleasedReturnValue(+[OSIntelligenceUtilities filterEvents:startOnSameWeekdayAs:](OSIntelligenceUtilities, "filterEvents:startOnSameWeekdayAs:", v12, v10));
  v143 = (void *)v13;
  v18 = objc_claimAutoreleasedReturnValue(+[OSIntelligenceUtilities filterEvents:startOnSameWeekdayAs:](OSIntelligenceUtilities, "filterEvents:startOnSameWeekdayAs:", v13, v10));
  v115 = (void *)v14;
  v19 = objc_claimAutoreleasedReturnValue(+[OSIntelligenceUtilities filterEvents:startOnSameWeekdayAs:](OSIntelligenceUtilities, "filterEvents:startOnSameWeekdayAs:", v14, v10));
  v146 = (void *)objc_claimAutoreleasedReturnValue(+[OSIntelligenceUtilities filterEvents:startOnSameWeekdayAs:](OSIntelligenceUtilities, "filterEvents:startOnSameWeekdayAs:", v15, v10));
  v141 = v10;
  v145 = (void *)objc_claimAutoreleasedReturnValue(+[OSIntelligenceUtilities filterEvents:startOnSameWeekdayAs:](OSIntelligenceUtilities, "filterEvents:startOnSameWeekdayAs:", v16, v10));
  v144 = (void *)v12;
  v142 = (void *)objc_claimAutoreleasedReturnValue(+[OSIntelligenceUtilities getDurationsFromEvents:withUnit:cappedAt:](OSIntelligenceUtilities, "getDurationsFromEvents:withUnit:cappedAt:", v12, 3600.0, 0.0));
  v20 = objc_claimAutoreleasedReturnValue(+[OSIntelligenceUtilities getDurationsFromEvents:withUnit:cappedAt:](OSIntelligenceUtilities, "getDurationsFromEvents:withUnit:cappedAt:", v13, 3600.0, 0.0));
  v21 = (void *)objc_claimAutoreleasedReturnValue(+[OSIntelligenceUtilities getDurationsFromEvents:withUnit:cappedAt:](OSIntelligenceUtilities, "getDurationsFromEvents:withUnit:cappedAt:", v14, 3600.0, 0.0));
  v148 = (void *)v15;
  v22 = objc_claimAutoreleasedReturnValue(+[OSIntelligenceUtilities getDurationsFromEvents:withUnit:cappedAt:](OSIntelligenceUtilities, "getDurationsFromEvents:withUnit:cappedAt:", v15, 3600.0, 0.0));
  v23 = objc_claimAutoreleasedReturnValue(+[OSIntelligenceUtilities getDurationsFromEvents:withUnit:cappedAt:](OSIntelligenceUtilities, "getDurationsFromEvents:withUnit:cappedAt:", v149, 3600.0, 0.0));
  v147 = (void *)v16;
  v24 = objc_claimAutoreleasedReturnValue(+[OSIntelligenceUtilities getDurationsFromEvents:withUnit:cappedAt:](OSIntelligenceUtilities, "getDurationsFromEvents:withUnit:cappedAt:", v16, 3600.0, 0.0));
  v126 = (void *)v17;
  v140 = (void *)objc_claimAutoreleasedReturnValue(+[OSIntelligenceUtilities getDurationsFromEvents:withUnit:cappedAt:](OSIntelligenceUtilities, "getDurationsFromEvents:withUnit:cappedAt:", v17, 3600.0, 0.0));
  v125 = (void *)v18;
  v139 = (void *)objc_claimAutoreleasedReturnValue(+[OSIntelligenceUtilities getDurationsFromEvents:withUnit:cappedAt:](OSIntelligenceUtilities, "getDurationsFromEvents:withUnit:cappedAt:", v18, 3600.0, 0.0));
  v124 = (void *)v19;
  v25 = objc_claimAutoreleasedReturnValue(+[OSIntelligenceUtilities getDurationsFromEvents:withUnit:cappedAt:](OSIntelligenceUtilities, "getDurationsFromEvents:withUnit:cappedAt:", v19, 3600.0, 0.0));
  v26 = objc_claimAutoreleasedReturnValue(+[OSIntelligenceUtilities getDurationsFromEvents:withUnit:cappedAt:](OSIntelligenceUtilities, "getDurationsFromEvents:withUnit:cappedAt:", v146, 3600.0, 0.0));
  v27 = objc_claimAutoreleasedReturnValue(+[OSIntelligenceUtilities getDurationsFromEvents:withUnit:cappedAt:](OSIntelligenceUtilities, "getDurationsFromEvents:withUnit:cappedAt:", v145, 3600.0, 0.0));
  +[OSIntelligenceUtilities standardDeviationOf:](OSIntelligenceUtilities, "standardDeviationOf:", v142);
  v134 = v28;
  +[OSIntelligenceUtilities standardDeviationOf:](OSIntelligenceUtilities, "standardDeviationOf:", v20);
  v135 = v29;
  +[OSIntelligenceUtilities standardDeviationOf:](OSIntelligenceUtilities, "standardDeviationOf:", v21);
  v137 = v30;
  +[OSIntelligenceUtilities standardDeviationOf:](OSIntelligenceUtilities, "standardDeviationOf:", v22);
  v32 = v31;
  +[OSIntelligenceUtilities standardDeviationOf:](OSIntelligenceUtilities, "standardDeviationOf:", v23);
  v34 = v33;
  +[OSIntelligenceUtilities standardDeviationOf:](OSIntelligenceUtilities, "standardDeviationOf:", v24);
  v36 = v35;
  +[OSIntelligenceUtilities standardDeviationOf:](OSIntelligenceUtilities, "standardDeviationOf:", v25);
  v38 = v37;
  +[OSIntelligenceUtilities medianOf:](OSIntelligenceUtilities, "medianOf:", v142);
  v40 = v39;
  v114 = (void *)v20;
  +[OSIntelligenceUtilities medianOf:](OSIntelligenceUtilities, "medianOf:", v20);
  v128 = v41;
  +[OSIntelligenceUtilities medianOf:](OSIntelligenceUtilities, "medianOf:", v21);
  v129 = v42;
  v122 = (void *)v22;
  +[OSIntelligenceUtilities medianOf:](OSIntelligenceUtilities, "medianOf:", v22);
  v130 = v43;
  v121 = (void *)v23;
  +[OSIntelligenceUtilities medianOf:](OSIntelligenceUtilities, "medianOf:", v23);
  v131 = v44;
  v120 = (void *)v24;
  +[OSIntelligenceUtilities medianOf:](OSIntelligenceUtilities, "medianOf:", v24);
  v132 = v45;
  +[OSIntelligenceUtilities medianOf:](OSIntelligenceUtilities, "medianOf:", v140);
  v136 = v46;
  +[OSIntelligenceUtilities medianOf:](OSIntelligenceUtilities, "medianOf:", v139);
  v138 = v47;
  v119 = (void *)v25;
  v48 = v25;
  v49 = v115;
  +[OSIntelligenceUtilities medianOf:](OSIntelligenceUtilities, "medianOf:", v48);
  v51 = v50;
  v118 = (void *)v26;
  +[OSIntelligenceUtilities medianOf:](OSIntelligenceUtilities, "medianOf:", v26);
  v53 = v52;
  v117 = (void *)v27;
  +[OSIntelligenceUtilities medianOf:](OSIntelligenceUtilities, "medianOf:", v27);
  v55 = v54;
  v56 = v116;
  if (os_log_type_enabled(v56, OS_LOG_TYPE_DEFAULT))
  {
    v57 = (void *)objc_claimAutoreleasedReturnValue(+[NSNumber numberWithUnsignedInteger:](NSNumber, "numberWithUnsignedInteger:", a5));
    v58 = (void *)objc_claimAutoreleasedReturnValue(+[NSNumber numberWithDouble:](NSNumber, "numberWithDouble:", a3));
    v59 = (void *)objc_claimAutoreleasedReturnValue(+[NSNumber numberWithDouble:](NSNumber, "numberWithDouble:", a6));
    *(_DWORD *)buf = 138412802;
    v157 = *(double *)&v57;
    v158 = 2112;
    v159 = *(double *)&v58;
    v160 = 2112;
    v161 = *(double *)&v59;
    _os_log_impl((void *)&_mh_execute_header, v56, OS_LOG_TYPE_DEFAULT, "Model inputs: PluginBatteryLevel=%@, Hour=%@, TimeFromPlugin=%@", buf, 0x20u);

    v49 = v115;
  }

  if (os_log_type_enabled(v56, OS_LOG_TYPE_DEBUG))
    sub_10003EA70();
  v60 = v56;
  if (os_log_type_enabled(v60, OS_LOG_TYPE_DEFAULT))
  {
    v61 = objc_msgSend(v144, "count");
    *(_DWORD *)buf = 134218496;
    v157 = *(double *)&v61;
    v158 = 2048;
    v159 = v134;
    v160 = 2048;
    v161 = v40;
    _os_log_impl((void *)&_mh_execute_header, v60, OS_LOG_TYPE_DEFAULT, "Model inputs for hourBin1: count %lu, std_dur_1: %f, med_dur_1: %lf", buf, 0x20u);
  }

  if (os_log_type_enabled(v60, OS_LOG_TYPE_DEBUG))
    sub_10003EA10();
  v62 = v60;
  if (os_log_type_enabled(v62, OS_LOG_TYPE_DEFAULT))
  {
    v63 = objc_msgSend(v143, "count");
    *(_DWORD *)buf = 134218496;
    v157 = *(double *)&v63;
    v158 = 2048;
    v159 = v135;
    v160 = 2048;
    v161 = v128;
    _os_log_impl((void *)&_mh_execute_header, v62, OS_LOG_TYPE_DEFAULT, "Model inputs for hourBin2: count %lu, std_dur_2: %f, med_dur_2: %lf", buf, 0x20u);
  }

  if (os_log_type_enabled(v62, OS_LOG_TYPE_DEBUG))
    sub_10003E9B0();
  v64 = v62;
  if (os_log_type_enabled(v64, OS_LOG_TYPE_DEFAULT))
  {
    v65 = objc_msgSend(v49, "count");
    *(_DWORD *)buf = 134218496;
    v157 = *(double *)&v65;
    v158 = 2048;
    v159 = v137;
    v160 = 2048;
    v161 = v129;
    _os_log_impl((void *)&_mh_execute_header, v64, OS_LOG_TYPE_DEFAULT, "Model inputs for hourBin4: count %lu, std_dur_4: %f, med_dur_4: %lf", buf, 0x20u);
  }

  if (os_log_type_enabled(v64, OS_LOG_TYPE_DEBUG))
    sub_10003E950();
  v66 = v64;
  if (os_log_type_enabled(v66, OS_LOG_TYPE_DEFAULT))
  {
    v67 = objc_msgSend(v148, "count");
    *(_DWORD *)buf = 134218496;
    v157 = *(double *)&v67;
    v158 = 2048;
    v159 = v32;
    v160 = 2048;
    v161 = v130;
    _os_log_impl((void *)&_mh_execute_header, v66, OS_LOG_TYPE_DEFAULT, "Model inputs for hourBin8: count %lu, std_dur_8: %f, med_dur_8: %lf", buf, 0x20u);
  }

  if (os_log_type_enabled(v66, OS_LOG_TYPE_DEBUG))
    sub_10003E8F0();
  v68 = v66;
  if (os_log_type_enabled(v68, OS_LOG_TYPE_DEFAULT))
  {
    v69 = objc_msgSend(v149, "count");
    *(_DWORD *)buf = 134218496;
    v157 = *(double *)&v69;
    v158 = 2048;
    v159 = v34;
    v160 = 2048;
    v161 = v131;
    _os_log_impl((void *)&_mh_execute_header, v68, OS_LOG_TYPE_DEFAULT, "Model inputs for hourBin16: count %lu, std_dur_16: %f, med_dur_16: %lf", buf, 0x20u);
  }

  if (os_log_type_enabled(v68, OS_LOG_TYPE_DEBUG))
    sub_10003E890();
  v70 = v68;
  if (os_log_type_enabled(v70, OS_LOG_TYPE_DEFAULT))
  {
    v71 = objc_msgSend(v147, "count");
    *(_DWORD *)buf = 134218496;
    v157 = *(double *)&v71;
    v158 = 2048;
    v159 = v36;
    v160 = 2048;
    v161 = v132;
    _os_log_impl((void *)&_mh_execute_header, v70, OS_LOG_TYPE_DEFAULT, "Model inputs for hourBin24: count %lu, std_dur_24: %f, med_dur_24: %lf", buf, 0x20u);
  }

  if (os_log_type_enabled(v70, OS_LOG_TYPE_DEBUG))
    sub_10003E830();
  if (os_log_type_enabled(v70, OS_LOG_TYPE_DEFAULT))
  {
    *(_DWORD *)buf = 134217984;
    v157 = v136;
    _os_log_impl((void *)&_mh_execute_header, v70, OS_LOG_TYPE_DEFAULT, "Model inputs for weekday1: weekday_med_dur_1: %lf", buf, 0xCu);
  }
  if (os_log_type_enabled(v70, OS_LOG_TYPE_DEBUG))
    sub_10003E7D0();
  if (os_log_type_enabled(v70, OS_LOG_TYPE_DEFAULT))
  {
    *(_DWORD *)buf = 134217984;
    v157 = v138;
    _os_log_impl((void *)&_mh_execute_header, v70, OS_LOG_TYPE_DEFAULT, "Model inputs for weekday2: weekday_med_dur_2: %lf", buf, 0xCu);
  }
  if (os_log_type_enabled(v70, OS_LOG_TYPE_DEBUG))
    sub_10003E770();
  if (os_log_type_enabled(v70, OS_LOG_TYPE_DEFAULT))
  {
    *(_DWORD *)buf = 134218240;
    v157 = v51;
    v158 = 2048;
    v159 = v38;
    _os_log_impl((void *)&_mh_execute_header, v70, OS_LOG_TYPE_DEFAULT, "Model inputs for weekday4: weekday_med_dur_4: %lf, weekday_std_dur_4: %lf", buf, 0x16u);
  }
  if (os_log_type_enabled(v70, OS_LOG_TYPE_DEBUG))
    sub_10003E710();
  if (os_log_type_enabled(v70, OS_LOG_TYPE_DEFAULT))
  {
    *(_DWORD *)buf = 134217984;
    v157 = v53;
    _os_log_impl((void *)&_mh_execute_header, v70, OS_LOG_TYPE_DEFAULT, "Model inputs for weekday8: weekday_med_dur_8: %lf", buf, 0xCu);
  }
  if (os_log_type_enabled(v70, OS_LOG_TYPE_DEBUG))
    sub_10003E6B0();
  if (os_log_type_enabled(v70, OS_LOG_TYPE_DEFAULT))
  {
    *(_DWORD *)buf = 134217984;
    v157 = v55;
    _os_log_impl((void *)&_mh_execute_header, v70, OS_LOG_TYPE_DEFAULT, "Model inputs for weekday24: weekday_med_dur_24: %lf", buf, 0xCu);
  }
  v72 = (void *)objc_claimAutoreleasedReturnValue(+[NSMutableDictionary dictionary](NSMutableDictionary, "dictionary"));
  v73 = (void *)objc_claimAutoreleasedReturnValue(+[NSNumber numberWithUnsignedInteger:](NSNumber, "numberWithUnsignedInteger:", a5));
  objc_msgSend(v72, "setObject:forKeyedSubscript:", v73, CFSTR("plugin_battery_level"));

  v74 = (void *)objc_claimAutoreleasedReturnValue(+[NSNumber numberWithDouble:](NSNumber, "numberWithDouble:", a6));
  objc_msgSend(v72, "setObject:forKeyedSubscript:", v74, CFSTR("time_from_plugin"));

  v75 = (void *)objc_claimAutoreleasedReturnValue(+[NSNumber numberWithDouble:](NSNumber, "numberWithDouble:", v40));
  objc_msgSend(v72, "setObject:forKeyedSubscript:", v75, CFSTR("med_dur_1"));

  v76 = (void *)objc_claimAutoreleasedReturnValue(+[NSNumber numberWithDouble:](NSNumber, "numberWithDouble:", v128));
  objc_msgSend(v72, "setObject:forKeyedSubscript:", v76, CFSTR("med_dur_2"));

  v77 = (void *)objc_claimAutoreleasedReturnValue(+[NSNumber numberWithDouble:](NSNumber, "numberWithDouble:", v129));
  objc_msgSend(v72, "setObject:forKeyedSubscript:", v77, CFSTR("med_dur_4"));

  v78 = (void *)objc_claimAutoreleasedReturnValue(+[NSNumber numberWithDouble:](NSNumber, "numberWithDouble:", v130));
  objc_msgSend(v72, "setObject:forKeyedSubscript:", v78, CFSTR("med_dur_8"));

  v79 = (void *)objc_claimAutoreleasedReturnValue(+[NSNumber numberWithDouble:](NSNumber, "numberWithDouble:", v131));
  objc_msgSend(v72, "setObject:forKeyedSubscript:", v79, CFSTR("med_dur_16"));

  v80 = (void *)objc_claimAutoreleasedReturnValue(+[NSNumber numberWithDouble:](NSNumber, "numberWithDouble:", v132));
  objc_msgSend(v72, "setObject:forKeyedSubscript:", v80, CFSTR("med_dur_24"));

  v81 = (void *)objc_claimAutoreleasedReturnValue(+[NSNumber numberWithUnsignedInteger:](NSNumber, "numberWithUnsignedInteger:", objc_msgSend(v144, "count")));
  objc_msgSend(v72, "setObject:forKeyedSubscript:", v81, CFSTR("cnt_dur_1"));

  v82 = (void *)objc_claimAutoreleasedReturnValue(+[NSNumber numberWithUnsignedInteger:](NSNumber, "numberWithUnsignedInteger:", objc_msgSend(v143, "count")));
  objc_msgSend(v72, "setObject:forKeyedSubscript:", v82, CFSTR("cnt_dur_2"));

  v83 = v49;
  v84 = (void *)objc_claimAutoreleasedReturnValue(+[NSNumber numberWithUnsignedInteger:](NSNumber, "numberWithUnsignedInteger:", objc_msgSend(v49, "count")));
  objc_msgSend(v72, "setObject:forKeyedSubscript:", v84, CFSTR("cnt_dur_4"));

  v85 = (void *)objc_claimAutoreleasedReturnValue(+[NSNumber numberWithUnsignedInteger:](NSNumber, "numberWithUnsignedInteger:", objc_msgSend(v148, "count")));
  objc_msgSend(v72, "setObject:forKeyedSubscript:", v85, CFSTR("cnt_dur_8"));

  v86 = (void *)objc_claimAutoreleasedReturnValue(+[NSNumber numberWithUnsignedInteger:](NSNumber, "numberWithUnsignedInteger:", objc_msgSend(v149, "count")));
  objc_msgSend(v72, "setObject:forKeyedSubscript:", v86, CFSTR("cnt_dur_16"));

  v87 = (void *)objc_claimAutoreleasedReturnValue(+[NSNumber numberWithUnsignedInteger:](NSNumber, "numberWithUnsignedInteger:", objc_msgSend(v147, "count")));
  objc_msgSend(v72, "setObject:forKeyedSubscript:", v87, CFSTR("cnt_dur_24"));

  v88 = (void *)objc_claimAutoreleasedReturnValue(+[NSNumber numberWithDouble:](NSNumber, "numberWithDouble:", v134));
  objc_msgSend(v72, "setObject:forKeyedSubscript:", v88, CFSTR("std_dur_1"));

  v89 = (void *)objc_claimAutoreleasedReturnValue(+[NSNumber numberWithDouble:](NSNumber, "numberWithDouble:", v135));
  objc_msgSend(v72, "setObject:forKeyedSubscript:", v89, CFSTR("std_dur_2"));

  v90 = (void *)objc_claimAutoreleasedReturnValue(+[NSNumber numberWithDouble:](NSNumber, "numberWithDouble:", v137));
  objc_msgSend(v72, "setObject:forKeyedSubscript:", v90, CFSTR("std_dur_4"));

  v91 = (void *)objc_claimAutoreleasedReturnValue(+[NSNumber numberWithDouble:](NSNumber, "numberWithDouble:", v32));
  objc_msgSend(v72, "setObject:forKeyedSubscript:", v91, CFSTR("std_dur_8"));

  v92 = (void *)objc_claimAutoreleasedReturnValue(+[NSNumber numberWithDouble:](NSNumber, "numberWithDouble:", v34));
  objc_msgSend(v72, "setObject:forKeyedSubscript:", v92, CFSTR("std_dur_16"));

  v93 = (void *)objc_claimAutoreleasedReturnValue(+[NSNumber numberWithDouble:](NSNumber, "numberWithDouble:", v36));
  objc_msgSend(v72, "setObject:forKeyedSubscript:", v93, CFSTR("std_dur_24"));

  v94 = (void *)objc_claimAutoreleasedReturnValue(+[NSNumber numberWithDouble:](NSNumber, "numberWithDouble:", v136));
  objc_msgSend(v72, "setObject:forKeyedSubscript:", v94, CFSTR("weekday_med_dur_1"));

  v95 = (void *)objc_claimAutoreleasedReturnValue(+[NSNumber numberWithDouble:](NSNumber, "numberWithDouble:", v138));
  objc_msgSend(v72, "setObject:forKeyedSubscript:", v95, CFSTR("weekday_med_dur_2"));

  v96 = (void *)objc_claimAutoreleasedReturnValue(+[NSNumber numberWithDouble:](NSNumber, "numberWithDouble:", v51));
  objc_msgSend(v72, "setObject:forKeyedSubscript:", v96, CFSTR("weekday_med_dur_4"));

  v97 = (void *)objc_claimAutoreleasedReturnValue(+[NSNumber numberWithDouble:](NSNumber, "numberWithDouble:", v53));
  objc_msgSend(v72, "setObject:forKeyedSubscript:", v97, CFSTR("weekday_med_dur_8"));

  v98 = (void *)objc_claimAutoreleasedReturnValue(+[NSNumber numberWithDouble:](NSNumber, "numberWithDouble:", v55));
  objc_msgSend(v72, "setObject:forKeyedSubscript:", v98, CFSTR("weekday_med_dur_24"));

  v99 = (void *)objc_claimAutoreleasedReturnValue(+[NSNumber numberWithDouble:](NSNumber, "numberWithDouble:", v38));
  objc_msgSend(v72, "setObject:forKeyedSubscript:", v99, CFSTR("weekday_std_dur_4"));

  v100 = objc_msgSend(objc_alloc((Class)MLDictionaryFeatureProvider), "initWithDictionary:error:", v72, 0);
  objc_msgSend(v141, "timeIntervalSince1970");
  v102 = floor(v101);
  v154[0] = CFSTR("pluginDateAsInterval");
  v103 = (void *)objc_claimAutoreleasedReturnValue(+[NSNumber numberWithDouble:](NSNumber, "numberWithDouble:", v102));
  v155[0] = v103;
  v155[1] = v72;
  v154[1] = CFSTR("features");
  v154[2] = CFSTR("dataVersion");
  v155[2] = &off_100064D90;
  v104 = (void *)objc_claimAutoreleasedReturnValue(+[NSDictionary dictionaryWithObjects:forKeys:count:](NSDictionary, "dictionaryWithObjects:forKeys:count:", v155, v154, 3));

  v153[0] = CFSTR("/var/mobile/Library/OSIntelligence");
  v153[1] = CFSTR("obc_features");
  v105 = (void *)objc_claimAutoreleasedReturnValue(+[NSArray arrayWithObjects:count:](NSArray, "arrayWithObjects:count:", v153, 2));
  v106 = (void *)objc_claimAutoreleasedReturnValue(+[NSURL fileURLWithPathComponents:](NSURL, "fileURLWithPathComponents:", v105));

  v152 = 0;
  objc_msgSend(v104, "writeToURL:error:", v106, &v152);
  v107 = v152;
  if (v107)
  {
    v151.receiver = self;
    v151.super_class = (Class)OSChargingPhonePredictor;
    v108 = -[OSChargingTwoStagePredictor log](&v151, "log");
    v109 = objc_claimAutoreleasedReturnValue(v108);
    if (os_log_type_enabled(v109, OS_LOG_TYPE_ERROR))
      sub_10003EFF0();
  }
  else
  {
    v150.receiver = self;
    v150.super_class = (Class)OSChargingPhonePredictor;
    v110 = -[OSChargingTwoStagePredictor log](&v150, "log");
    v109 = objc_claimAutoreleasedReturnValue(v110);
    if (os_log_type_enabled(v109, OS_LOG_TYPE_DEFAULT))
    {
      v111 = (void *)objc_claimAutoreleasedReturnValue(+[NSNumber numberWithDouble:](NSNumber, "numberWithDouble:", v102));
      *(_DWORD *)buf = 138412290;
      v157 = *(double *)&v111;
      _os_log_impl((void *)&_mh_execute_header, v109, OS_LOG_TYPE_DEFAULT, "Feature dict saved for plugin: %@", buf, 0xCu);

    }
  }

  return v100;
}

- (id)getMultiArrayForFeatureDict:(id)a3
{
  id v3;
  void *v4;
  id v5;
  __int128 v6;
  id v7;
  uint64_t v8;
  void *i;
  uint64_t v10;
  void *v11;
  void *v12;
  OS_os_log *v13;
  NSObject *v14;
  void *v15;
  void *v16;
  id v17;
  __int128 v19;
  char v20;
  objc_super v22;
  objc_super v23;
  __int128 v24;
  __int128 v25;
  __int128 v26;
  __int128 v27;
  uint8_t buf[4];
  uint64_t v29;
  _BYTE v30[128];

  v3 = a3;
  v4 = (void *)objc_claimAutoreleasedReturnValue(+[NSMutableArray array](NSMutableArray, "array"));
  v24 = 0u;
  v25 = 0u;
  v26 = 0u;
  v27 = 0u;
  v5 = objc_msgSend(&off_100065920, "countByEnumeratingWithState:objects:count:", &v24, v30, 16);
  if (!v5)
    goto LABEL_15;
  v7 = v5;
  v20 = 0;
  v8 = *(_QWORD *)v25;
  *(_QWORD *)&v6 = 138412290;
  v19 = v6;
  do
  {
    for (i = 0; i != v7; i = (char *)i + 1)
    {
      if (*(_QWORD *)v25 != v8)
        objc_enumerationMutation(&off_100065920);
      v10 = *(_QWORD *)(*((_QWORD *)&v24 + 1) + 8 * (_QWORD)i);
      v11 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v3, "objectForKeyedSubscript:", v10, v19));
      objc_msgSend(v11, "doubleValue");
      v12 = (void *)objc_claimAutoreleasedReturnValue(+[NSNumber numberWithDouble:](NSNumber, "numberWithDouble:"));

      if (v12)
      {
        objc_msgSend(v4, "addObject:", v12);
      }
      else
      {
        v23.receiver = self;
        v23.super_class = (Class)OSChargingPhonePredictor;
        v13 = -[OSChargingTwoStagePredictor log](&v23, "log");
        v14 = objc_claimAutoreleasedReturnValue(v13);
        if (os_log_type_enabled(v14, OS_LOG_TYPE_ERROR))
        {
          *(_DWORD *)buf = v19;
          v29 = v10;
          _os_log_error_impl((void *)&_mh_execute_header, v14, OS_LOG_TYPE_ERROR, "Error: feature value for key '%@' is nil", buf, 0xCu);
        }

        v20 = 1;
      }

    }
    v7 = objc_msgSend(&off_100065920, "countByEnumeratingWithState:objects:count:", &v24, v30, 16);
  }
  while (v7);
  if ((v20 & 1) != 0)
  {
    v15 = 0;
  }
  else
  {
LABEL_15:
    v16 = (void *)objc_claimAutoreleasedReturnValue(+[NSArray arrayWithArray:](NSArray, "arrayWithArray:", v4));
    v22.receiver = self;
    v22.super_class = (Class)OSChargingPhonePredictor;
    v17 = -[OSChargingTwoStagePredictor arrayWithShape:values:type:](&v22, "arrayWithShape:values:type:", &off_100065938, v16, 65568);
    v15 = (void *)objc_claimAutoreleasedReturnValue(v17);

  }
  return v15;
}

@end
