@implementation PowerUIMLWatchPredictor

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
  uint64_t v50;
  NSObject *v51;
  uint64_t v52;
  NSObject *v53;
  uint64_t v54;
  NSObject *v55;
  uint64_t v56;
  NSObject *v57;
  uint64_t v58;
  NSObject *v59;
  uint64_t v60;
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
  uint64_t v84;
  uint64_t v85;
  uint64_t v86;
  uint64_t v87;
  void *v88;
  NSObject *v89;
  void *v90;
  double v91;
  double v92;
  void *v93;
  void *v94;
  void *v95;
  void *v96;
  void *v97;
  id v98;
  void *v99;
  NSObject *v100;
  void *v101;
  void *v103;
  void *v105;
  void *v106;
  id v107;
  id v108;
  double v109;
  void *v110;
  double v111;
  void *v112;
  double v113;
  void *v114;
  double v115;
  void *v116;
  void *v117;
  void *v118;
  void *v121;
  id v122;
  __int128 v123;
  __int128 v124;
  __int128 v125;
  __int128 v126;
  _QWORD v127[2];
  _QWORD v128[3];
  _QWORD v129[3];
  uint8_t v130[128];
  uint8_t buf[4];
  uint64_t v132;
  __int16 v133;
  double v134;
  __int16 v135;
  double v136;
  __int16 v137;
  void *v138;
  uint64_t v139;

  v139 = *MEMORY[0x24BDAC8D0];
  v10 = a4;
  v11 = a7;
  v12 = a8;
  objc_msgSend(MEMORY[0x24BDBCE48], "currentCalendar");
  v13 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v13, "components:fromDate:", 32, v11);
  v14 = (void *)objc_claimAutoreleasedReturnValue();

  v103 = v14;
  v115 = (double)objc_msgSend(v14, "hour");
  +[PowerUIPredictorHelper events:forHourBin:date:withMaxDuration:](PowerUIPredictorHelper, "events:forHourBin:date:withMaxDuration:", v10, 1, v11, 12.0);
  v15 = (void *)objc_claimAutoreleasedReturnValue();
  +[PowerUIPredictorHelper events:forHourBin:date:withMaxDuration:](PowerUIPredictorHelper, "events:forHourBin:date:withMaxDuration:", v10, 2, v11, 12.0);
  v16 = objc_claimAutoreleasedReturnValue();
  +[PowerUIPredictorHelper events:forHourBin:date:withMaxDuration:](PowerUIPredictorHelper, "events:forHourBin:date:withMaxDuration:", v10, 4, v11, 12.0);
  v17 = (void *)objc_claimAutoreleasedReturnValue();
  +[PowerUIPredictorHelper events:forHourBin:date:withMaxDuration:](PowerUIPredictorHelper, "events:forHourBin:date:withMaxDuration:", v10, 8, v11, 12.0);
  v18 = (void *)objc_claimAutoreleasedReturnValue();
  +[PowerUIPredictorHelper events:forHourBin:date:withMaxDuration:](PowerUIPredictorHelper, "events:forHourBin:date:withMaxDuration:", v10, 16, v11, 12.0);
  v19 = objc_claimAutoreleasedReturnValue();
  v106 = v10;
  +[PowerUIPredictorHelper events:forHourBin:date:withMaxDuration:](PowerUIPredictorHelper, "events:forHourBin:date:withMaxDuration:", v10, 24, v11, 12.0);
  v20 = (void *)objc_claimAutoreleasedReturnValue();
  +[PowerUIPredictorHelper standardDeviationOf:](PowerUIPredictorHelper, "standardDeviationOf:", v15);
  v22 = v21;
  +[PowerUIPredictorHelper standardDeviationOf:](PowerUIPredictorHelper, "standardDeviationOf:", v16);
  v24 = v23;
  +[PowerUIPredictorHelper standardDeviationOf:](PowerUIPredictorHelper, "standardDeviationOf:", v17);
  v26 = v25;
  +[PowerUIPredictorHelper standardDeviationOf:](PowerUIPredictorHelper, "standardDeviationOf:", v18);
  v28 = v27;
  +[PowerUIPredictorHelper standardDeviationOf:](PowerUIPredictorHelper, "standardDeviationOf:", v19);
  v30 = v29;
  +[PowerUIPredictorHelper standardDeviationOf:](PowerUIPredictorHelper, "standardDeviationOf:", v20);
  v32 = v31;
  +[PowerUIPredictorHelper medianOf:](PowerUIPredictorHelper, "medianOf:", v15);
  v107 = v33;
  v118 = (void *)v16;
  +[PowerUIPredictorHelper medianOf:](PowerUIPredictorHelper, "medianOf:", v16);
  v109 = v34;
  +[PowerUIPredictorHelper medianOf:](PowerUIPredictorHelper, "medianOf:", v17);
  v111 = v35;
  +[PowerUIPredictorHelper medianOf:](PowerUIPredictorHelper, "medianOf:", v18);
  v113 = v36;
  v117 = (void *)v19;
  +[PowerUIPredictorHelper medianOf:](PowerUIPredictorHelper, "medianOf:", v19);
  v38 = v37;
  +[PowerUIPredictorHelper medianOf:](PowerUIPredictorHelper, "medianOf:", v20);
  v40 = v39;
  v41 = v12;
  if (os_log_type_enabled(v41, OS_LOG_TYPE_DEFAULT))
  {
    objc_msgSend(MEMORY[0x24BDD16E0], "numberWithDouble:", v115);
    v42 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(MEMORY[0x24BDD16E0], "numberWithUnsignedInteger:", a5);
    v43 = v20;
    v44 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(MEMORY[0x24BDD16E0], "numberWithDouble:", a3);
    v45 = v17;
    v46 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(MEMORY[0x24BDD16E0], "numberWithDouble:", a6);
    v47 = v18;
    v48 = (void *)objc_claimAutoreleasedReturnValue();
    *(_DWORD *)buf = 138413058;
    v132 = (uint64_t)v42;
    v133 = 2112;
    v134 = *(double *)&v44;
    v135 = 2112;
    v136 = *(double *)&v46;
    v137 = 2112;
    v138 = v48;
    _os_log_impl(&dword_215A71000, v41, OS_LOG_TYPE_DEFAULT, "Model inputs: PluginHour=%@, PluginBatteryLevel=%@, Hour=%@, TimeFromPlugin=%@", buf, 0x2Au);

    v18 = v47;
    v17 = v45;

    v20 = v43;
  }

  if (os_log_type_enabled(v41, OS_LOG_TYPE_DEBUG))
    -[PowerUIMLPhonePredictor getInputFeatures:events:pluginBatteryLevel:timeFromPlugin:pluginDate:withLog:].cold.12();
  v49 = v41;
  if (os_log_type_enabled(v49, OS_LOG_TYPE_DEFAULT))
  {
    v50 = objc_msgSend(v15, "count");
    *(_DWORD *)buf = 134218496;
    v132 = v50;
    v133 = 2048;
    v134 = v22;
    v135 = 2048;
    v136 = *(double *)&v107;
    _os_log_impl(&dword_215A71000, v49, OS_LOG_TYPE_DEFAULT, "Model inputs for hourBin1: count %lu, std_dur_1: %f, med_dur_1: %lf", buf, 0x20u);
  }

  if (os_log_type_enabled(v49, OS_LOG_TYPE_DEBUG))
    -[PowerUIMLPhonePredictor getInputFeatures:events:pluginBatteryLevel:timeFromPlugin:pluginDate:withLog:].cold.11();
  v51 = v49;
  if (os_log_type_enabled(v51, OS_LOG_TYPE_DEFAULT))
  {
    v52 = objc_msgSend(v118, "count");
    *(_DWORD *)buf = 134218496;
    v132 = v52;
    v133 = 2048;
    v134 = v24;
    v135 = 2048;
    v136 = v109;
    _os_log_impl(&dword_215A71000, v51, OS_LOG_TYPE_DEFAULT, "Model inputs for hourBin2: count %lu, std_dur_2: %f, med_dur_2: %lf", buf, 0x20u);
  }

  if (os_log_type_enabled(v51, OS_LOG_TYPE_DEBUG))
    -[PowerUIMLPhonePredictor getInputFeatures:events:pluginBatteryLevel:timeFromPlugin:pluginDate:withLog:].cold.10();
  v53 = v51;
  if (os_log_type_enabled(v53, OS_LOG_TYPE_DEFAULT))
  {
    v54 = objc_msgSend(v17, "count");
    *(_DWORD *)buf = 134218496;
    v132 = v54;
    v133 = 2048;
    v134 = v26;
    v135 = 2048;
    v136 = v111;
    _os_log_impl(&dword_215A71000, v53, OS_LOG_TYPE_DEFAULT, "Model inputs for hourBin4: count %lu, std_dur_4: %f, med_dur_4: %lf", buf, 0x20u);
  }

  if (os_log_type_enabled(v53, OS_LOG_TYPE_DEBUG))
    -[PowerUIMLPhonePredictor getInputFeatures:events:pluginBatteryLevel:timeFromPlugin:pluginDate:withLog:].cold.9();
  v55 = v53;
  if (os_log_type_enabled(v55, OS_LOG_TYPE_DEFAULT))
  {
    v56 = objc_msgSend(v18, "count");
    *(_DWORD *)buf = 134218496;
    v132 = v56;
    v133 = 2048;
    v134 = v28;
    v135 = 2048;
    v136 = v113;
    _os_log_impl(&dword_215A71000, v55, OS_LOG_TYPE_DEFAULT, "Model inputs for hourBin8: count %lu, std_dur_8: %f, med_dur_8: %lf", buf, 0x20u);
  }

  if (os_log_type_enabled(v55, OS_LOG_TYPE_DEBUG))
    -[PowerUIMLPhonePredictor getInputFeatures:events:pluginBatteryLevel:timeFromPlugin:pluginDate:withLog:].cold.8();
  v57 = v55;
  if (os_log_type_enabled(v57, OS_LOG_TYPE_DEFAULT))
  {
    v58 = objc_msgSend(v117, "count");
    *(_DWORD *)buf = 134218496;
    v132 = v58;
    v133 = 2048;
    v134 = v30;
    v135 = 2048;
    v136 = v38;
    _os_log_impl(&dword_215A71000, v57, OS_LOG_TYPE_DEFAULT, "Model inputs for hourBin16: count %lu, std_dur_16: %f, med_dur_16: %lf", buf, 0x20u);
  }
  v105 = v11;

  if (os_log_type_enabled(v57, OS_LOG_TYPE_DEBUG))
    -[PowerUIMLPhonePredictor getInputFeatures:events:pluginBatteryLevel:timeFromPlugin:pluginDate:withLog:].cold.7();
  v59 = v57;
  if (os_log_type_enabled(v59, OS_LOG_TYPE_DEFAULT))
  {
    v60 = objc_msgSend(v20, "count");
    *(_DWORD *)buf = 134218496;
    v132 = v60;
    v133 = 2048;
    v134 = v32;
    v135 = 2048;
    v136 = v40;
    _os_log_impl(&dword_215A71000, v59, OS_LOG_TYPE_DEFAULT, "Model inputs for hourBin24: count %lu, std_dur_24: %f, med_dur_24: %lf", buf, 0x20u);
  }

  objc_msgSend(MEMORY[0x24BDBCED8], "dictionary");
  v61 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(MEMORY[0x24BDD16E0], "numberWithUnsignedInteger:", a5);
  v62 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v61, "setObject:forKeyedSubscript:", v62, CFSTR("plugin_battery_level"));

  objc_msgSend(MEMORY[0x24BDD16E0], "numberWithDouble:", a6);
  v63 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v61, "setObject:forKeyedSubscript:", v63, CFSTR("time_from_plugin"));

  objc_msgSend(MEMORY[0x24BDD16E0], "numberWithDouble:", v115);
  v64 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v61, "setObject:forKeyedSubscript:", v64, CFSTR("hour"));

  objc_msgSend(MEMORY[0x24BDD16E0], "numberWithDouble:", *(double *)&v107);
  v65 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v61, "setObject:forKeyedSubscript:", v65, CFSTR("med_dur_1"));

  objc_msgSend(MEMORY[0x24BDD16E0], "numberWithDouble:", v109);
  v66 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v61, "setObject:forKeyedSubscript:", v66, CFSTR("med_dur_2"));

  objc_msgSend(MEMORY[0x24BDD16E0], "numberWithDouble:", v111);
  v67 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v61, "setObject:forKeyedSubscript:", v67, CFSTR("med_dur_4"));

  objc_msgSend(MEMORY[0x24BDD16E0], "numberWithDouble:", v113);
  v68 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v61, "setObject:forKeyedSubscript:", v68, CFSTR("med_dur_8"));

  objc_msgSend(MEMORY[0x24BDD16E0], "numberWithDouble:", v38);
  v69 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v61, "setObject:forKeyedSubscript:", v69, CFSTR("med_dur_16"));

  objc_msgSend(MEMORY[0x24BDD16E0], "numberWithDouble:", v40);
  v70 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v61, "setObject:forKeyedSubscript:", v70, CFSTR("med_dur_24"));

  v116 = v15;
  objc_msgSend(MEMORY[0x24BDD16E0], "numberWithUnsignedInteger:", objc_msgSend(v15, "count"));
  v71 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v61, "setObject:forKeyedSubscript:", v71, CFSTR("cnt_dur_1"));

  objc_msgSend(MEMORY[0x24BDD16E0], "numberWithUnsignedInteger:", objc_msgSend(v118, "count"));
  v72 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v61, "setObject:forKeyedSubscript:", v72, CFSTR("cnt_dur_2"));

  v114 = v17;
  objc_msgSend(MEMORY[0x24BDD16E0], "numberWithUnsignedInteger:", objc_msgSend(v17, "count"));
  v73 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v61, "setObject:forKeyedSubscript:", v73, CFSTR("cnt_dur_4"));

  v112 = v18;
  objc_msgSend(MEMORY[0x24BDD16E0], "numberWithUnsignedInteger:", objc_msgSend(v18, "count"));
  v74 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v61, "setObject:forKeyedSubscript:", v74, CFSTR("cnt_dur_8"));

  objc_msgSend(MEMORY[0x24BDD16E0], "numberWithUnsignedInteger:", objc_msgSend(v117, "count"));
  v75 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v61, "setObject:forKeyedSubscript:", v75, CFSTR("cnt_dur_16"));

  v110 = v20;
  objc_msgSend(MEMORY[0x24BDD16E0], "numberWithUnsignedInteger:", objc_msgSend(v20, "count"));
  v76 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v61, "setObject:forKeyedSubscript:", v76, CFSTR("cnt_dur_24"));

  objc_msgSend(MEMORY[0x24BDD16E0], "numberWithDouble:", v22);
  v77 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v61, "setObject:forKeyedSubscript:", v77, CFSTR("std_dur_1"));

  objc_msgSend(MEMORY[0x24BDD16E0], "numberWithDouble:", v24);
  v78 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v61, "setObject:forKeyedSubscript:", v78, CFSTR("std_dur_2"));

  objc_msgSend(MEMORY[0x24BDD16E0], "numberWithDouble:", v26);
  v79 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v61, "setObject:forKeyedSubscript:", v79, CFSTR("std_dur_4"));

  objc_msgSend(MEMORY[0x24BDD16E0], "numberWithDouble:", v28);
  v80 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v61, "setObject:forKeyedSubscript:", v80, CFSTR("std_dur_8"));

  objc_msgSend(MEMORY[0x24BDD16E0], "numberWithDouble:", v30);
  v81 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v61, "setObject:forKeyedSubscript:", v81, CFSTR("std_dur_16"));

  objc_msgSend(MEMORY[0x24BDD16E0], "numberWithDouble:", v32);
  v82 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v61, "setObject:forKeyedSubscript:", v82, CFSTR("std_dur_24"));

  v108 = (id)objc_msgSend(objc_alloc(MEMORY[0x24BDBFF80]), "initWithDictionary:error:", v61, 0);
  v123 = 0u;
  v124 = 0u;
  v125 = 0u;
  v126 = 0u;
  v121 = v61;
  objc_msgSend(v61, "allKeys");
  v83 = (void *)objc_claimAutoreleasedReturnValue();
  v84 = objc_msgSend(v83, "countByEnumeratingWithState:objects:count:", &v123, v130, 16);
  if (v84)
  {
    v85 = v84;
    v86 = *(_QWORD *)v124;
    do
    {
      v87 = 0;
      do
      {
        if (*(_QWORD *)v124 != v86)
          objc_enumerationMutation(v83);
        v88 = *(void **)(*((_QWORD *)&v123 + 1) + 8 * v87);
        v89 = v59;
        if (os_log_type_enabled(v89, OS_LOG_TYPE_DEBUG))
        {
          objc_msgSend(v121, "objectForKeyedSubscript:", v88);
          v90 = (void *)objc_claimAutoreleasedReturnValue();
          *(_DWORD *)buf = 138412546;
          v132 = (uint64_t)v88;
          v133 = 2112;
          v134 = *(double *)&v90;
          _os_log_debug_impl(&dword_215A71000, v89, OS_LOG_TYPE_DEBUG, "input for feature '%@': %@", buf, 0x16u);

        }
        ++v87;
      }
      while (v85 != v87);
      v85 = objc_msgSend(v83, "countByEnumeratingWithState:objects:count:", &v123, v130, 16);
    }
    while (v85);
  }

  objc_msgSend(v105, "timeIntervalSince1970");
  v92 = floor(v91);
  v128[0] = CFSTR("pluginDateAsInterval");
  objc_msgSend(MEMORY[0x24BDD16E0], "numberWithDouble:", v92);
  v93 = (void *)objc_claimAutoreleasedReturnValue();
  v129[0] = v93;
  v129[1] = v121;
  v128[1] = CFSTR("features");
  v128[2] = CFSTR("dataVersion");
  v129[2] = &unk_24D4436A8;
  objc_msgSend(MEMORY[0x24BDBCE70], "dictionaryWithObjects:forKeys:count:", v129, v128, 3);
  v94 = (void *)objc_claimAutoreleasedReturnValue();

  v95 = (void *)MEMORY[0x24BDBCF48];
  v127[0] = CFSTR("/var/mobile/Library/PowerUI");
  v127[1] = CFSTR("obc_features");
  objc_msgSend(MEMORY[0x24BDBCE30], "arrayWithObjects:count:", v127, 2);
  v96 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v95, "fileURLWithPathComponents:", v96);
  v97 = (void *)objc_claimAutoreleasedReturnValue();

  v122 = 0;
  objc_msgSend(v94, "writeToURL:error:", v97, &v122);
  v98 = v122;
  if (v98)
  {
    v99 = v118;
    if (os_log_type_enabled(v59, OS_LOG_TYPE_ERROR))
      -[PowerUIMLPhonePredictor getInputFeatures:events:pluginBatteryLevel:timeFromPlugin:pluginDate:withLog:].cold.1();
  }
  else
  {
    v100 = v59;
    v99 = v118;
    if (os_log_type_enabled(v100, OS_LOG_TYPE_DEFAULT))
    {
      objc_msgSend(MEMORY[0x24BDD16E0], "numberWithDouble:", v92);
      v101 = (void *)objc_claimAutoreleasedReturnValue();
      *(_DWORD *)buf = 138412290;
      v132 = (uint64_t)v101;
      _os_log_impl(&dword_215A71000, v100, OS_LOG_TYPE_DEFAULT, "Feature dict saved for plugin: %@", buf, 0xCu);

    }
  }

  return v108;
}

@end
