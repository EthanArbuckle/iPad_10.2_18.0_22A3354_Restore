@implementation PowerUIMLPhonePredictor

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
  uint64_t v61;
  NSObject *v62;
  uint64_t v63;
  NSObject *v64;
  uint64_t v65;
  NSObject *v66;
  uint64_t v67;
  NSObject *v68;
  uint64_t v69;
  NSObject *v70;
  uint64_t v71;
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
  void *v100;
  double v101;
  double v102;
  void *v103;
  void *v104;
  void *v105;
  void *v106;
  void *v107;
  id v108;
  NSObject *v109;
  void *v110;
  void *v113;
  void *v114;
  id v115;
  void *v116;
  void *v117;
  void *v118;
  void *v119;
  void *v120;
  void *v121;
  void *v123;
  void *v124;
  void *v125;
  double v127;
  double v128;
  double v129;
  double v130;
  double v131;
  double v133;
  double v134;
  double v135;
  double v136;
  double v137;
  void *v138;
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
  objc_super v149;
  objc_super v150;
  id v151;
  _QWORD v152[2];
  _QWORD v153[3];
  _QWORD v154[3];
  uint8_t buf[4];
  double v156;
  __int16 v157;
  double v158;
  __int16 v159;
  double v160;
  uint64_t v161;

  v161 = *MEMORY[0x24BDAC8D0];
  v10 = a7;
  v115 = a8;
  v11 = a4;
  +[PowerUIPredictorHelper filterEventsSortedByStartDateAscending:startsBefore:dynamicallyAroundDate:withHourBinWidth:](PowerUIPredictorHelper, "filterEventsSortedByStartDateAscending:startsBefore:dynamicallyAroundDate:withHourBinWidth:", v11, v10, v10, 1);
  v12 = objc_claimAutoreleasedReturnValue();
  +[PowerUIPredictorHelper filterEventsSortedByStartDateAscending:startsBefore:dynamicallyAroundDate:withHourBinWidth:](PowerUIPredictorHelper, "filterEventsSortedByStartDateAscending:startsBefore:dynamicallyAroundDate:withHourBinWidth:", v11, v10, v10, 2);
  v13 = objc_claimAutoreleasedReturnValue();
  +[PowerUIPredictorHelper filterEventsSortedByStartDateAscending:startsBefore:dynamicallyAroundDate:withHourBinWidth:](PowerUIPredictorHelper, "filterEventsSortedByStartDateAscending:startsBefore:dynamicallyAroundDate:withHourBinWidth:", v11, v10, v10, 4);
  v14 = objc_claimAutoreleasedReturnValue();
  +[PowerUIPredictorHelper filterEventsSortedByStartDateAscending:startsBefore:dynamicallyAroundDate:withHourBinWidth:](PowerUIPredictorHelper, "filterEventsSortedByStartDateAscending:startsBefore:dynamicallyAroundDate:withHourBinWidth:", v11, v10, v10, 8);
  v15 = objc_claimAutoreleasedReturnValue();
  +[PowerUIPredictorHelper filterEventsSortedByStartDateAscending:startsBefore:dynamicallyAroundDate:withHourBinWidth:](PowerUIPredictorHelper, "filterEventsSortedByStartDateAscending:startsBefore:dynamicallyAroundDate:withHourBinWidth:", v11, v10, v10, 16);
  v148 = (void *)objc_claimAutoreleasedReturnValue();
  +[PowerUIPredictorHelper filterEventsSortedByStartDateAscending:startsBefore:dynamicallyAroundDate:withHourBinWidth:](PowerUIPredictorHelper, "filterEventsSortedByStartDateAscending:startsBefore:dynamicallyAroundDate:withHourBinWidth:", v11, v10, v10, 24);
  v16 = objc_claimAutoreleasedReturnValue();

  +[PowerUIPredictorHelper filterEvents:startOnSameWeekdayAs:](PowerUIPredictorHelper, "filterEvents:startOnSameWeekdayAs:", v12, v10);
  v17 = objc_claimAutoreleasedReturnValue();
  v142 = (void *)v13;
  +[PowerUIPredictorHelper filterEvents:startOnSameWeekdayAs:](PowerUIPredictorHelper, "filterEvents:startOnSameWeekdayAs:", v13, v10);
  v18 = objc_claimAutoreleasedReturnValue();
  v114 = (void *)v14;
  +[PowerUIPredictorHelper filterEvents:startOnSameWeekdayAs:](PowerUIPredictorHelper, "filterEvents:startOnSameWeekdayAs:", v14, v10);
  v19 = objc_claimAutoreleasedReturnValue();
  +[PowerUIPredictorHelper filterEvents:startOnSameWeekdayAs:](PowerUIPredictorHelper, "filterEvents:startOnSameWeekdayAs:", v15, v10);
  v145 = (void *)objc_claimAutoreleasedReturnValue();
  v140 = v10;
  +[PowerUIPredictorHelper filterEvents:startOnSameWeekdayAs:](PowerUIPredictorHelper, "filterEvents:startOnSameWeekdayAs:", v16, v10);
  v144 = (void *)objc_claimAutoreleasedReturnValue();
  v143 = (void *)v12;
  +[PowerUIPredictorHelper getDurationsFromEvents:withUnit:cappedAt:](PowerUIPredictorHelper, "getDurationsFromEvents:withUnit:cappedAt:", v12, 3600.0, 0.0);
  v141 = (void *)objc_claimAutoreleasedReturnValue();
  +[PowerUIPredictorHelper getDurationsFromEvents:withUnit:cappedAt:](PowerUIPredictorHelper, "getDurationsFromEvents:withUnit:cappedAt:", v13, 3600.0, 0.0);
  v20 = objc_claimAutoreleasedReturnValue();
  +[PowerUIPredictorHelper getDurationsFromEvents:withUnit:cappedAt:](PowerUIPredictorHelper, "getDurationsFromEvents:withUnit:cappedAt:", v14, 3600.0, 0.0);
  v21 = (void *)objc_claimAutoreleasedReturnValue();
  v147 = (void *)v15;
  +[PowerUIPredictorHelper getDurationsFromEvents:withUnit:cappedAt:](PowerUIPredictorHelper, "getDurationsFromEvents:withUnit:cappedAt:", v15, 3600.0, 0.0);
  v22 = objc_claimAutoreleasedReturnValue();
  +[PowerUIPredictorHelper getDurationsFromEvents:withUnit:cappedAt:](PowerUIPredictorHelper, "getDurationsFromEvents:withUnit:cappedAt:", v148, 3600.0, 0.0);
  v23 = objc_claimAutoreleasedReturnValue();
  v146 = (void *)v16;
  +[PowerUIPredictorHelper getDurationsFromEvents:withUnit:cappedAt:](PowerUIPredictorHelper, "getDurationsFromEvents:withUnit:cappedAt:", v16, 3600.0, 0.0);
  v24 = objc_claimAutoreleasedReturnValue();
  v125 = (void *)v17;
  +[PowerUIPredictorHelper getDurationsFromEvents:withUnit:cappedAt:](PowerUIPredictorHelper, "getDurationsFromEvents:withUnit:cappedAt:", v17, 3600.0, 0.0);
  v139 = (void *)objc_claimAutoreleasedReturnValue();
  v124 = (void *)v18;
  +[PowerUIPredictorHelper getDurationsFromEvents:withUnit:cappedAt:](PowerUIPredictorHelper, "getDurationsFromEvents:withUnit:cappedAt:", v18, 3600.0, 0.0);
  v138 = (void *)objc_claimAutoreleasedReturnValue();
  v123 = (void *)v19;
  +[PowerUIPredictorHelper getDurationsFromEvents:withUnit:cappedAt:](PowerUIPredictorHelper, "getDurationsFromEvents:withUnit:cappedAt:", v19, 3600.0, 0.0);
  v25 = objc_claimAutoreleasedReturnValue();
  +[PowerUIPredictorHelper getDurationsFromEvents:withUnit:cappedAt:](PowerUIPredictorHelper, "getDurationsFromEvents:withUnit:cappedAt:", v145, 3600.0, 0.0);
  v26 = objc_claimAutoreleasedReturnValue();
  +[PowerUIPredictorHelper getDurationsFromEvents:withUnit:cappedAt:](PowerUIPredictorHelper, "getDurationsFromEvents:withUnit:cappedAt:", v144, 3600.0, 0.0);
  v27 = objc_claimAutoreleasedReturnValue();
  +[PowerUIPredictorHelper standardDeviationOf:](PowerUIPredictorHelper, "standardDeviationOf:", v141);
  v133 = v28;
  +[PowerUIPredictorHelper standardDeviationOf:](PowerUIPredictorHelper, "standardDeviationOf:", v20);
  v134 = v29;
  +[PowerUIPredictorHelper standardDeviationOf:](PowerUIPredictorHelper, "standardDeviationOf:", v21);
  v136 = v30;
  +[PowerUIPredictorHelper standardDeviationOf:](PowerUIPredictorHelper, "standardDeviationOf:", v22);
  v32 = v31;
  +[PowerUIPredictorHelper standardDeviationOf:](PowerUIPredictorHelper, "standardDeviationOf:", v23);
  v34 = v33;
  +[PowerUIPredictorHelper standardDeviationOf:](PowerUIPredictorHelper, "standardDeviationOf:", v24);
  v36 = v35;
  +[PowerUIPredictorHelper standardDeviationOf:](PowerUIPredictorHelper, "standardDeviationOf:", v25);
  v38 = v37;
  +[PowerUIPredictorHelper medianOf:](PowerUIPredictorHelper, "medianOf:", v141);
  v40 = v39;
  v113 = (void *)v20;
  +[PowerUIPredictorHelper medianOf:](PowerUIPredictorHelper, "medianOf:", v20);
  v127 = v41;
  +[PowerUIPredictorHelper medianOf:](PowerUIPredictorHelper, "medianOf:", v21);
  v128 = v42;
  v121 = (void *)v22;
  +[PowerUIPredictorHelper medianOf:](PowerUIPredictorHelper, "medianOf:", v22);
  v129 = v43;
  v120 = (void *)v23;
  +[PowerUIPredictorHelper medianOf:](PowerUIPredictorHelper, "medianOf:", v23);
  v130 = v44;
  v119 = (void *)v24;
  +[PowerUIPredictorHelper medianOf:](PowerUIPredictorHelper, "medianOf:", v24);
  v131 = v45;
  +[PowerUIPredictorHelper medianOf:](PowerUIPredictorHelper, "medianOf:", v139);
  v135 = v46;
  +[PowerUIPredictorHelper medianOf:](PowerUIPredictorHelper, "medianOf:", v138);
  v137 = v47;
  v118 = (void *)v25;
  v48 = v25;
  v49 = v114;
  +[PowerUIPredictorHelper medianOf:](PowerUIPredictorHelper, "medianOf:", v48);
  v51 = v50;
  v117 = (void *)v26;
  +[PowerUIPredictorHelper medianOf:](PowerUIPredictorHelper, "medianOf:", v26);
  v53 = v52;
  v116 = (void *)v27;
  +[PowerUIPredictorHelper medianOf:](PowerUIPredictorHelper, "medianOf:", v27);
  v55 = v54;
  v56 = v115;
  if (os_log_type_enabled(v56, OS_LOG_TYPE_DEFAULT))
  {
    objc_msgSend(MEMORY[0x24BDD16E0], "numberWithUnsignedInteger:", a5);
    v57 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(MEMORY[0x24BDD16E0], "numberWithDouble:", a3);
    v58 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(MEMORY[0x24BDD16E0], "numberWithDouble:", a6);
    v59 = (void *)objc_claimAutoreleasedReturnValue();
    *(_DWORD *)buf = 138412802;
    v156 = *(double *)&v57;
    v157 = 2112;
    v158 = *(double *)&v58;
    v159 = 2112;
    v160 = *(double *)&v59;
    _os_log_impl(&dword_215A71000, v56, OS_LOG_TYPE_DEFAULT, "Model inputs: PluginBatteryLevel=%@, Hour=%@, TimeFromPlugin=%@", buf, 0x20u);

    v49 = v114;
  }

  if (os_log_type_enabled(v56, OS_LOG_TYPE_DEBUG))
    -[PowerUIMLPhonePredictor getInputFeatures:events:pluginBatteryLevel:timeFromPlugin:pluginDate:withLog:].cold.12();
  v60 = v56;
  if (os_log_type_enabled(v60, OS_LOG_TYPE_DEFAULT))
  {
    v61 = objc_msgSend(v143, "count");
    *(_DWORD *)buf = 134218496;
    v156 = *(double *)&v61;
    v157 = 2048;
    v158 = v133;
    v159 = 2048;
    v160 = v40;
    _os_log_impl(&dword_215A71000, v60, OS_LOG_TYPE_DEFAULT, "Model inputs for hourBin1: count %lu, std_dur_1: %f, med_dur_1: %lf", buf, 0x20u);
  }

  if (os_log_type_enabled(v60, OS_LOG_TYPE_DEBUG))
    -[PowerUIMLPhonePredictor getInputFeatures:events:pluginBatteryLevel:timeFromPlugin:pluginDate:withLog:].cold.11();
  v62 = v60;
  if (os_log_type_enabled(v62, OS_LOG_TYPE_DEFAULT))
  {
    v63 = objc_msgSend(v142, "count");
    *(_DWORD *)buf = 134218496;
    v156 = *(double *)&v63;
    v157 = 2048;
    v158 = v134;
    v159 = 2048;
    v160 = v127;
    _os_log_impl(&dword_215A71000, v62, OS_LOG_TYPE_DEFAULT, "Model inputs for hourBin2: count %lu, std_dur_2: %f, med_dur_2: %lf", buf, 0x20u);
  }

  if (os_log_type_enabled(v62, OS_LOG_TYPE_DEBUG))
    -[PowerUIMLPhonePredictor getInputFeatures:events:pluginBatteryLevel:timeFromPlugin:pluginDate:withLog:].cold.10();
  v64 = v62;
  if (os_log_type_enabled(v64, OS_LOG_TYPE_DEFAULT))
  {
    v65 = objc_msgSend(v49, "count");
    *(_DWORD *)buf = 134218496;
    v156 = *(double *)&v65;
    v157 = 2048;
    v158 = v136;
    v159 = 2048;
    v160 = v128;
    _os_log_impl(&dword_215A71000, v64, OS_LOG_TYPE_DEFAULT, "Model inputs for hourBin4: count %lu, std_dur_4: %f, med_dur_4: %lf", buf, 0x20u);
  }

  if (os_log_type_enabled(v64, OS_LOG_TYPE_DEBUG))
    -[PowerUIMLPhonePredictor getInputFeatures:events:pluginBatteryLevel:timeFromPlugin:pluginDate:withLog:].cold.9();
  v66 = v64;
  if (os_log_type_enabled(v66, OS_LOG_TYPE_DEFAULT))
  {
    v67 = objc_msgSend(v147, "count");
    *(_DWORD *)buf = 134218496;
    v156 = *(double *)&v67;
    v157 = 2048;
    v158 = v32;
    v159 = 2048;
    v160 = v129;
    _os_log_impl(&dword_215A71000, v66, OS_LOG_TYPE_DEFAULT, "Model inputs for hourBin8: count %lu, std_dur_8: %f, med_dur_8: %lf", buf, 0x20u);
  }

  if (os_log_type_enabled(v66, OS_LOG_TYPE_DEBUG))
    -[PowerUIMLPhonePredictor getInputFeatures:events:pluginBatteryLevel:timeFromPlugin:pluginDate:withLog:].cold.8();
  v68 = v66;
  if (os_log_type_enabled(v68, OS_LOG_TYPE_DEFAULT))
  {
    v69 = objc_msgSend(v148, "count");
    *(_DWORD *)buf = 134218496;
    v156 = *(double *)&v69;
    v157 = 2048;
    v158 = v34;
    v159 = 2048;
    v160 = v130;
    _os_log_impl(&dword_215A71000, v68, OS_LOG_TYPE_DEFAULT, "Model inputs for hourBin16: count %lu, std_dur_16: %f, med_dur_16: %lf", buf, 0x20u);
  }

  if (os_log_type_enabled(v68, OS_LOG_TYPE_DEBUG))
    -[PowerUIMLPhonePredictor getInputFeatures:events:pluginBatteryLevel:timeFromPlugin:pluginDate:withLog:].cold.7();
  v70 = v68;
  if (os_log_type_enabled(v70, OS_LOG_TYPE_DEFAULT))
  {
    v71 = objc_msgSend(v146, "count");
    *(_DWORD *)buf = 134218496;
    v156 = *(double *)&v71;
    v157 = 2048;
    v158 = v36;
    v159 = 2048;
    v160 = v131;
    _os_log_impl(&dword_215A71000, v70, OS_LOG_TYPE_DEFAULT, "Model inputs for hourBin24: count %lu, std_dur_24: %f, med_dur_24: %lf", buf, 0x20u);
  }

  if (os_log_type_enabled(v70, OS_LOG_TYPE_DEBUG))
    -[PowerUIMLPhonePredictor getInputFeatures:events:pluginBatteryLevel:timeFromPlugin:pluginDate:withLog:].cold.6();
  if (os_log_type_enabled(v70, OS_LOG_TYPE_DEFAULT))
  {
    *(_DWORD *)buf = 134217984;
    v156 = v135;
    _os_log_impl(&dword_215A71000, v70, OS_LOG_TYPE_DEFAULT, "Model inputs for weekday1: weekday_med_dur_1: %lf", buf, 0xCu);
  }
  if (os_log_type_enabled(v70, OS_LOG_TYPE_DEBUG))
    -[PowerUIMLPhonePredictor getInputFeatures:events:pluginBatteryLevel:timeFromPlugin:pluginDate:withLog:].cold.5();
  if (os_log_type_enabled(v70, OS_LOG_TYPE_DEFAULT))
  {
    *(_DWORD *)buf = 134217984;
    v156 = v137;
    _os_log_impl(&dword_215A71000, v70, OS_LOG_TYPE_DEFAULT, "Model inputs for weekday2: weekday_med_dur_2: %lf", buf, 0xCu);
  }
  if (os_log_type_enabled(v70, OS_LOG_TYPE_DEBUG))
    -[PowerUIMLPhonePredictor getInputFeatures:events:pluginBatteryLevel:timeFromPlugin:pluginDate:withLog:].cold.4();
  if (os_log_type_enabled(v70, OS_LOG_TYPE_DEFAULT))
  {
    *(_DWORD *)buf = 134218240;
    v156 = v51;
    v157 = 2048;
    v158 = v38;
    _os_log_impl(&dword_215A71000, v70, OS_LOG_TYPE_DEFAULT, "Model inputs for weekday4: weekday_med_dur_4: %lf, weekday_std_dur_4: %lf", buf, 0x16u);
  }
  if (os_log_type_enabled(v70, OS_LOG_TYPE_DEBUG))
    -[PowerUIMLPhonePredictor getInputFeatures:events:pluginBatteryLevel:timeFromPlugin:pluginDate:withLog:].cold.3();
  if (os_log_type_enabled(v70, OS_LOG_TYPE_DEFAULT))
  {
    *(_DWORD *)buf = 134217984;
    v156 = v53;
    _os_log_impl(&dword_215A71000, v70, OS_LOG_TYPE_DEFAULT, "Model inputs for weekday8: weekday_med_dur_8: %lf", buf, 0xCu);
  }
  if (os_log_type_enabled(v70, OS_LOG_TYPE_DEBUG))
    -[PowerUIMLPhonePredictor getInputFeatures:events:pluginBatteryLevel:timeFromPlugin:pluginDate:withLog:].cold.2();
  if (os_log_type_enabled(v70, OS_LOG_TYPE_DEFAULT))
  {
    *(_DWORD *)buf = 134217984;
    v156 = v55;
    _os_log_impl(&dword_215A71000, v70, OS_LOG_TYPE_DEFAULT, "Model inputs for weekday24: weekday_med_dur_24: %lf", buf, 0xCu);
  }
  objc_msgSend(MEMORY[0x24BDBCED8], "dictionary");
  v72 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(MEMORY[0x24BDD16E0], "numberWithUnsignedInteger:", a5);
  v73 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v72, "setObject:forKeyedSubscript:", v73, CFSTR("plugin_battery_level"));

  objc_msgSend(MEMORY[0x24BDD16E0], "numberWithDouble:", a6);
  v74 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v72, "setObject:forKeyedSubscript:", v74, CFSTR("time_from_plugin"));

  objc_msgSend(MEMORY[0x24BDD16E0], "numberWithDouble:", v40);
  v75 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v72, "setObject:forKeyedSubscript:", v75, CFSTR("med_dur_1"));

  objc_msgSend(MEMORY[0x24BDD16E0], "numberWithDouble:", v127);
  v76 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v72, "setObject:forKeyedSubscript:", v76, CFSTR("med_dur_2"));

  objc_msgSend(MEMORY[0x24BDD16E0], "numberWithDouble:", v128);
  v77 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v72, "setObject:forKeyedSubscript:", v77, CFSTR("med_dur_4"));

  objc_msgSend(MEMORY[0x24BDD16E0], "numberWithDouble:", v129);
  v78 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v72, "setObject:forKeyedSubscript:", v78, CFSTR("med_dur_8"));

  objc_msgSend(MEMORY[0x24BDD16E0], "numberWithDouble:", v130);
  v79 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v72, "setObject:forKeyedSubscript:", v79, CFSTR("med_dur_16"));

  objc_msgSend(MEMORY[0x24BDD16E0], "numberWithDouble:", v131);
  v80 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v72, "setObject:forKeyedSubscript:", v80, CFSTR("med_dur_24"));

  objc_msgSend(MEMORY[0x24BDD16E0], "numberWithUnsignedInteger:", objc_msgSend(v143, "count"));
  v81 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v72, "setObject:forKeyedSubscript:", v81, CFSTR("cnt_dur_1"));

  objc_msgSend(MEMORY[0x24BDD16E0], "numberWithUnsignedInteger:", objc_msgSend(v142, "count"));
  v82 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v72, "setObject:forKeyedSubscript:", v82, CFSTR("cnt_dur_2"));

  v83 = v49;
  objc_msgSend(MEMORY[0x24BDD16E0], "numberWithUnsignedInteger:", objc_msgSend(v49, "count"));
  v84 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v72, "setObject:forKeyedSubscript:", v84, CFSTR("cnt_dur_4"));

  objc_msgSend(MEMORY[0x24BDD16E0], "numberWithUnsignedInteger:", objc_msgSend(v147, "count"));
  v85 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v72, "setObject:forKeyedSubscript:", v85, CFSTR("cnt_dur_8"));

  objc_msgSend(MEMORY[0x24BDD16E0], "numberWithUnsignedInteger:", objc_msgSend(v148, "count"));
  v86 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v72, "setObject:forKeyedSubscript:", v86, CFSTR("cnt_dur_16"));

  objc_msgSend(MEMORY[0x24BDD16E0], "numberWithUnsignedInteger:", objc_msgSend(v146, "count"));
  v87 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v72, "setObject:forKeyedSubscript:", v87, CFSTR("cnt_dur_24"));

  objc_msgSend(MEMORY[0x24BDD16E0], "numberWithDouble:", v133);
  v88 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v72, "setObject:forKeyedSubscript:", v88, CFSTR("std_dur_1"));

  objc_msgSend(MEMORY[0x24BDD16E0], "numberWithDouble:", v134);
  v89 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v72, "setObject:forKeyedSubscript:", v89, CFSTR("std_dur_2"));

  objc_msgSend(MEMORY[0x24BDD16E0], "numberWithDouble:", v136);
  v90 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v72, "setObject:forKeyedSubscript:", v90, CFSTR("std_dur_4"));

  objc_msgSend(MEMORY[0x24BDD16E0], "numberWithDouble:", v32);
  v91 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v72, "setObject:forKeyedSubscript:", v91, CFSTR("std_dur_8"));

  objc_msgSend(MEMORY[0x24BDD16E0], "numberWithDouble:", v34);
  v92 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v72, "setObject:forKeyedSubscript:", v92, CFSTR("std_dur_16"));

  objc_msgSend(MEMORY[0x24BDD16E0], "numberWithDouble:", v36);
  v93 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v72, "setObject:forKeyedSubscript:", v93, CFSTR("std_dur_24"));

  objc_msgSend(MEMORY[0x24BDD16E0], "numberWithDouble:", v135);
  v94 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v72, "setObject:forKeyedSubscript:", v94, CFSTR("weekday_med_dur_1"));

  objc_msgSend(MEMORY[0x24BDD16E0], "numberWithDouble:", v137);
  v95 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v72, "setObject:forKeyedSubscript:", v95, CFSTR("weekday_med_dur_2"));

  objc_msgSend(MEMORY[0x24BDD16E0], "numberWithDouble:", v51);
  v96 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v72, "setObject:forKeyedSubscript:", v96, CFSTR("weekday_med_dur_4"));

  objc_msgSend(MEMORY[0x24BDD16E0], "numberWithDouble:", v53);
  v97 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v72, "setObject:forKeyedSubscript:", v97, CFSTR("weekday_med_dur_8"));

  objc_msgSend(MEMORY[0x24BDD16E0], "numberWithDouble:", v55);
  v98 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v72, "setObject:forKeyedSubscript:", v98, CFSTR("weekday_med_dur_24"));

  objc_msgSend(MEMORY[0x24BDD16E0], "numberWithDouble:", v38);
  v99 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v72, "setObject:forKeyedSubscript:", v99, CFSTR("weekday_std_dur_4"));

  v100 = (void *)objc_msgSend(objc_alloc(MEMORY[0x24BDBFF80]), "initWithDictionary:error:", v72, 0);
  objc_msgSend(v140, "timeIntervalSince1970");
  v102 = floor(v101);
  v153[0] = CFSTR("pluginDateAsInterval");
  objc_msgSend(MEMORY[0x24BDD16E0], "numberWithDouble:", v102);
  v103 = (void *)objc_claimAutoreleasedReturnValue();
  v154[0] = v103;
  v154[1] = v72;
  v153[1] = CFSTR("features");
  v153[2] = CFSTR("dataVersion");
  v154[2] = &unk_24D4435D0;
  objc_msgSend(MEMORY[0x24BDBCE70], "dictionaryWithObjects:forKeys:count:", v154, v153, 3);
  v104 = (void *)objc_claimAutoreleasedReturnValue();

  v105 = (void *)MEMORY[0x24BDBCF48];
  v152[0] = CFSTR("/var/mobile/Library/PowerUI");
  v152[1] = CFSTR("obc_features");
  objc_msgSend(MEMORY[0x24BDBCE30], "arrayWithObjects:count:", v152, 2);
  v106 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v105, "fileURLWithPathComponents:", v106);
  v107 = (void *)objc_claimAutoreleasedReturnValue();

  v151 = 0;
  objc_msgSend(v104, "writeToURL:error:", v107, &v151);
  v108 = v151;
  if (v108)
  {
    v150.receiver = self;
    v150.super_class = (Class)PowerUIMLPhonePredictor;
    -[PowerUIMLTwoStageModelPredictor log](&v150, "log");
    v109 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v109, OS_LOG_TYPE_ERROR))
      -[PowerUIMLPhonePredictor getInputFeatures:events:pluginBatteryLevel:timeFromPlugin:pluginDate:withLog:].cold.1();
  }
  else
  {
    v149.receiver = self;
    v149.super_class = (Class)PowerUIMLPhonePredictor;
    -[PowerUIMLTwoStageModelPredictor log](&v149, "log");
    v109 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v109, OS_LOG_TYPE_DEFAULT))
    {
      objc_msgSend(MEMORY[0x24BDD16E0], "numberWithDouble:", v102);
      v110 = (void *)objc_claimAutoreleasedReturnValue();
      *(_DWORD *)buf = 138412290;
      v156 = *(double *)&v110;
      _os_log_impl(&dword_215A71000, v109, OS_LOG_TYPE_DEFAULT, "Feature dict saved for plugin: %@", buf, 0xCu);

    }
  }

  return v100;
}

- (id)getMultiArrayForFeatureDict:(id)a3
{
  id v3;
  void *v4;
  uint64_t v5;
  __int128 v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t i;
  uint64_t v10;
  void *v11;
  void *v12;
  void *v13;
  NSObject *v14;
  void *v15;
  void *v16;
  __int128 v18;
  char v19;
  objc_super v21;
  objc_super v22;
  __int128 v23;
  __int128 v24;
  __int128 v25;
  __int128 v26;
  uint8_t buf[4];
  uint64_t v28;
  _BYTE v29[128];
  uint64_t v30;

  v30 = *MEMORY[0x24BDAC8D0];
  v3 = a3;
  objc_msgSend(MEMORY[0x24BDBCEB8], "array");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  v23 = 0u;
  v24 = 0u;
  v25 = 0u;
  v26 = 0u;
  v5 = objc_msgSend(&unk_24D44ABA8, "countByEnumeratingWithState:objects:count:", &v23, v29, 16);
  if (!v5)
    goto LABEL_15;
  v7 = v5;
  v19 = 0;
  v8 = *(_QWORD *)v24;
  *(_QWORD *)&v6 = 138412290;
  v18 = v6;
  do
  {
    for (i = 0; i != v7; ++i)
    {
      if (*(_QWORD *)v24 != v8)
        objc_enumerationMutation(&unk_24D44ABA8);
      v10 = *(_QWORD *)(*((_QWORD *)&v23 + 1) + 8 * i);
      v11 = (void *)MEMORY[0x24BDD16E0];
      objc_msgSend(v3, "objectForKeyedSubscript:", v10, v18);
      v12 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v12, "doubleValue");
      objc_msgSend(v11, "numberWithDouble:");
      v13 = (void *)objc_claimAutoreleasedReturnValue();

      if (v13)
      {
        objc_msgSend(v4, "addObject:", v13);
      }
      else
      {
        v22.receiver = self;
        v22.super_class = (Class)PowerUIMLPhonePredictor;
        -[PowerUIMLTwoStageModelPredictor log](&v22, "log");
        v14 = objc_claimAutoreleasedReturnValue();
        if (os_log_type_enabled(v14, OS_LOG_TYPE_ERROR))
        {
          *(_DWORD *)buf = v18;
          v28 = v10;
          _os_log_error_impl(&dword_215A71000, v14, OS_LOG_TYPE_ERROR, "Error: feature value for key '%@' is nil", buf, 0xCu);
        }

        v19 = 1;
      }

    }
    v7 = objc_msgSend(&unk_24D44ABA8, "countByEnumeratingWithState:objects:count:", &v23, v29, 16);
  }
  while (v7);
  if ((v19 & 1) != 0)
  {
    v15 = 0;
  }
  else
  {
LABEL_15:
    objc_msgSend(MEMORY[0x24BDBCE30], "arrayWithArray:", v4);
    v16 = (void *)objc_claimAutoreleasedReturnValue();
    v21.receiver = self;
    v21.super_class = (Class)PowerUIMLPhonePredictor;
    -[PowerUIMLTwoStageModelPredictor arrayWithShape:values:type:](&v21, sel_arrayWithShape_values_type_, &unk_24D44ABC0, v16, 65568);
    v15 = (void *)objc_claimAutoreleasedReturnValue();

  }
  return v15;
}

- (int)modelDataVersion
{
  return 2;
}

- (void)getInputFeatures:events:pluginBatteryLevel:timeFromPlugin:pluginDate:withLog:.cold.1()
{
  os_log_t v0;
  uint8_t v1[24];
  uint64_t v2;

  v2 = *MEMORY[0x24BDAC8D0];
  OUTLINED_FUNCTION_4();
  _os_log_error_impl(&dword_215A71000, v0, OS_LOG_TYPE_ERROR, "Error saving latest features: %@", v1, 0xCu);
  OUTLINED_FUNCTION_2();
}

- (void)getInputFeatures:events:pluginBatteryLevel:timeFromPlugin:pluginDate:withLog:.cold.2()
{
  NSObject *v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint8_t v6;

  OUTLINED_FUNCTION_4();
  OUTLINED_FUNCTION_3(&dword_215A71000, v0, v1, "weekday24 events: %@", v2, v3, v4, v5, v6);
  OUTLINED_FUNCTION_2();
}

- (void)getInputFeatures:events:pluginBatteryLevel:timeFromPlugin:pluginDate:withLog:.cold.3()
{
  NSObject *v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint8_t v6;

  OUTLINED_FUNCTION_4();
  OUTLINED_FUNCTION_3(&dword_215A71000, v0, v1, "weekday8 events: %@", v2, v3, v4, v5, v6);
  OUTLINED_FUNCTION_2();
}

- (void)getInputFeatures:events:pluginBatteryLevel:timeFromPlugin:pluginDate:withLog:.cold.4()
{
  NSObject *v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint8_t v6;

  OUTLINED_FUNCTION_4();
  OUTLINED_FUNCTION_3(&dword_215A71000, v0, v1, "weekday4 events: %@", v2, v3, v4, v5, v6);
  OUTLINED_FUNCTION_2();
}

- (void)getInputFeatures:events:pluginBatteryLevel:timeFromPlugin:pluginDate:withLog:.cold.5()
{
  NSObject *v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint8_t v6;

  OUTLINED_FUNCTION_4();
  OUTLINED_FUNCTION_3(&dword_215A71000, v0, v1, "weekday2 events: %@", v2, v3, v4, v5, v6);
  OUTLINED_FUNCTION_2();
}

- (void)getInputFeatures:events:pluginBatteryLevel:timeFromPlugin:pluginDate:withLog:.cold.6()
{
  NSObject *v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint8_t v6;

  OUTLINED_FUNCTION_4();
  OUTLINED_FUNCTION_3(&dword_215A71000, v0, v1, "weekday1 events: %@", v2, v3, v4, v5, v6);
  OUTLINED_FUNCTION_2();
}

- (void)getInputFeatures:events:pluginBatteryLevel:timeFromPlugin:pluginDate:withLog:.cold.7()
{
  NSObject *v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint8_t v6;

  OUTLINED_FUNCTION_4();
  OUTLINED_FUNCTION_3(&dword_215A71000, v0, v1, "hourBin24 events: %@", v2, v3, v4, v5, v6);
  OUTLINED_FUNCTION_2();
}

- (void)getInputFeatures:events:pluginBatteryLevel:timeFromPlugin:pluginDate:withLog:.cold.8()
{
  NSObject *v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint8_t v6;

  OUTLINED_FUNCTION_4();
  OUTLINED_FUNCTION_3(&dword_215A71000, v0, v1, "hourBin16 events: %@", v2, v3, v4, v5, v6);
  OUTLINED_FUNCTION_2();
}

- (void)getInputFeatures:events:pluginBatteryLevel:timeFromPlugin:pluginDate:withLog:.cold.9()
{
  NSObject *v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint8_t v6;

  OUTLINED_FUNCTION_4();
  OUTLINED_FUNCTION_3(&dword_215A71000, v0, v1, "hourBin8 events: %@", v2, v3, v4, v5, v6);
  OUTLINED_FUNCTION_2();
}

- (void)getInputFeatures:events:pluginBatteryLevel:timeFromPlugin:pluginDate:withLog:.cold.10()
{
  NSObject *v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint8_t v6;

  OUTLINED_FUNCTION_4();
  OUTLINED_FUNCTION_3(&dword_215A71000, v0, v1, "hourBin4 events: %@", v2, v3, v4, v5, v6);
  OUTLINED_FUNCTION_2();
}

- (void)getInputFeatures:events:pluginBatteryLevel:timeFromPlugin:pluginDate:withLog:.cold.11()
{
  NSObject *v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint8_t v6;

  OUTLINED_FUNCTION_4();
  OUTLINED_FUNCTION_3(&dword_215A71000, v0, v1, "hourBin2 events: %@", v2, v3, v4, v5, v6);
  OUTLINED_FUNCTION_2();
}

- (void)getInputFeatures:events:pluginBatteryLevel:timeFromPlugin:pluginDate:withLog:.cold.12()
{
  NSObject *v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint8_t v6;

  OUTLINED_FUNCTION_4();
  OUTLINED_FUNCTION_3(&dword_215A71000, v0, v1, "hourBin1 events: %@", v2, v3, v4, v5, v6);
  OUTLINED_FUNCTION_2();
}

@end
