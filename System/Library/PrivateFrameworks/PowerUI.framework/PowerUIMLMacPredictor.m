@implementation PowerUIMLMacPredictor

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
  void *v47;
  double v48;
  void *v49;
  void *v50;
  void *v51;
  uint64_t v52;
  void *v53;
  int v54;
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
  void *v72;
  void *v73;
  uint64_t v74;
  uint64_t v75;
  uint64_t v76;
  uint64_t v77;
  void *v78;
  NSObject *v79;
  void *v80;
  double v81;
  double v82;
  void *v83;
  void *v84;
  void *v85;
  void *v86;
  void *v87;
  void *v88;
  id v89;
  NSObject *v90;
  void *v91;
  double v93;
  double v94;
  double v95;
  double v96;
  double v97;
  id v98;
  id v99;
  void *v100;
  void *v101;
  void *v102;
  void *v103;
  void *v104;
  void *v105;
  void *v107;
  void *v108;
  void *v109;
  void *v110;
  double v111;
  id v112;
  __int128 v113;
  __int128 v114;
  __int128 v115;
  __int128 v116;
  _QWORD v117[2];
  _QWORD v118[3];
  _QWORD v119[3];
  uint8_t buf[4];
  void *v121;
  __int16 v122;
  void *v123;
  _BYTE v124[128];
  uint64_t v125;

  v125 = *MEMORY[0x24BDAC8D0];
  v11 = a4;
  v12 = a7;
  v13 = a8;
  objc_msgSend(MEMORY[0x24BDBCE48], "currentCalendar");
  v14 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v14, "components:fromDate:", 96, v12);
  v110 = (void *)objc_claimAutoreleasedReturnValue();

  v15 = (double)objc_msgSend(v110, "hour");
  v16 = 0.0;
  +[PowerUIPredictorHelper events:forHourBin:date:withMaxDuration:](PowerUIPredictorHelper, "events:forHourBin:date:withMaxDuration:", v11, 1, v12, 0.0);
  v17 = objc_claimAutoreleasedReturnValue();
  +[PowerUIPredictorHelper events:forHourBin:date:withMaxDuration:](PowerUIPredictorHelper, "events:forHourBin:date:withMaxDuration:", v11, 2, v12, 0.0);
  v18 = objc_claimAutoreleasedReturnValue();
  +[PowerUIPredictorHelper events:forHourBin:date:withMaxDuration:](PowerUIPredictorHelper, "events:forHourBin:date:withMaxDuration:", v11, 4, v12, 0.0);
  v19 = objc_claimAutoreleasedReturnValue();
  +[PowerUIPredictorHelper events:forHourBin:date:withMaxDuration:](PowerUIPredictorHelper, "events:forHourBin:date:withMaxDuration:", v11, 8, v12, 0.0);
  v20 = objc_claimAutoreleasedReturnValue();
  +[PowerUIPredictorHelper events:forHourBin:date:withMaxDuration:](PowerUIPredictorHelper, "events:forHourBin:date:withMaxDuration:", v11, 16, v12, 0.0);
  v21 = objc_claimAutoreleasedReturnValue();
  +[PowerUIPredictorHelper events:forHourBin:date:withMaxDuration:](PowerUIPredictorHelper, "events:forHourBin:date:withMaxDuration:", v11, 24, v12, 0.0);
  v22 = objc_claimAutoreleasedReturnValue();
  +[PowerUIPredictorHelper standardDeviationOf:](PowerUIPredictorHelper, "standardDeviationOf:", v17);
  v94 = v23;
  +[PowerUIPredictorHelper standardDeviationOf:](PowerUIPredictorHelper, "standardDeviationOf:", v18);
  v95 = v24;
  +[PowerUIPredictorHelper standardDeviationOf:](PowerUIPredictorHelper, "standardDeviationOf:", v19);
  v96 = v25;
  +[PowerUIPredictorHelper standardDeviationOf:](PowerUIPredictorHelper, "standardDeviationOf:", v20);
  v97 = v26;
  +[PowerUIPredictorHelper standardDeviationOf:](PowerUIPredictorHelper, "standardDeviationOf:", v21);
  v98 = v27;
  +[PowerUIPredictorHelper standardDeviationOf:](PowerUIPredictorHelper, "standardDeviationOf:", v22);
  v111 = v28;
  v104 = (void *)v17;
  +[PowerUIPredictorHelper medianOf:](PowerUIPredictorHelper, "medianOf:", v17);
  v30 = v29;
  v109 = (void *)v18;
  +[PowerUIPredictorHelper medianOf:](PowerUIPredictorHelper, "medianOf:", v18);
  v32 = v31;
  v103 = (void *)v19;
  +[PowerUIPredictorHelper medianOf:](PowerUIPredictorHelper, "medianOf:", v19);
  v34 = v33;
  v102 = (void *)v20;
  +[PowerUIPredictorHelper medianOf:](PowerUIPredictorHelper, "medianOf:", v20);
  v36 = v35;
  v101 = (void *)v21;
  +[PowerUIPredictorHelper medianOf:](PowerUIPredictorHelper, "medianOf:", v21);
  v38 = v37;
  v108 = (void *)v22;
  +[PowerUIPredictorHelper medianOf:](PowerUIPredictorHelper, "medianOf:", v22);
  v93 = v39;
  objc_msgSend(MEMORY[0x24BDBCED8], "dictionary");
  v40 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(MEMORY[0x24BDD16E0], "numberWithUnsignedInteger:", a5);
  v41 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v40, "setObject:forKeyedSubscript:", v41, CFSTR("plugin_battery_level"));

  objc_msgSend(MEMORY[0x24BDD16E0], "numberWithDouble:", v15);
  v42 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v40, "setObject:forKeyedSubscript:", v42, CFSTR("hour"));

  v43 = (void *)MEMORY[0x24BDD16E0];
  objc_msgSend(v11, "lastObject");
  v44 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v44, "endDate");
  v45 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v11, "lastObject");
  v46 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v46, "startDate");
  v47 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v45, "timeIntervalSinceDate:", v47);
  objc_msgSend(v43, "numberWithDouble:", v48 / 3600.0);
  v49 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v40, "setObject:forKeyedSubscript:", v49, CFSTR("prev_charge_duration_1"));

  v105 = v12;
  v107 = v11;
  +[PowerUIPredictorHelper getUsageBucketsForEvents:forDate:withLog:](PowerUIPredictorHelper, "getUsageBucketsForEvents:forDate:withLog:", v11, v12, v13);
  v50 = (void *)objc_claimAutoreleasedReturnValue();
  +[PowerUIPredictorHelper hoursUntilUseFromBucketedUsage:withCurrentHour:withComponentsMinutes:](PowerUIPredictorHelper, "hoursUntilUseFromBucketedUsage:withCurrentHour:withComponentsMinutes:", v50, (int)a3, objc_msgSend(v110, "minute"));
  objc_msgSend(MEMORY[0x24BDD16E0], "numberWithDouble:");
  v51 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v40, "setObject:forKeyedSubscript:", v51, CFSTR("hours_until_use"));

  v52 = 0;
  do
  {
    objc_msgSend(MEMORY[0x24BDD17C8], "stringWithFormat:", CFSTR("hour_plus_%d"), v52);
    v53 = (void *)objc_claimAutoreleasedReturnValue();
    v54 = (int)(v16 + a3);
    if (v54 > 23)
      v54 -= 24;
    v55 = (void *)MEMORY[0x24BDD16E0];
    objc_msgSend(v50, "objectAtIndexedSubscript:", v54);
    v56 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v56, "doubleValue");
    objc_msgSend(v55, "numberWithDouble:");
    v57 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v40, "setObject:forKeyedSubscript:", v57, v53);

    v16 = v16 + 1.0;
    v52 = (v52 + 1);
  }
  while ((_DWORD)v52 != 6);
  v100 = v50;
  objc_msgSend(MEMORY[0x24BDD16E0], "numberWithDouble:", v30);
  v58 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v40, "setObject:forKeyedSubscript:", v58, CFSTR("med_dur_1"));

  objc_msgSend(MEMORY[0x24BDD16E0], "numberWithDouble:", v32);
  v59 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v40, "setObject:forKeyedSubscript:", v59, CFSTR("med_dur_2"));

  objc_msgSend(MEMORY[0x24BDD16E0], "numberWithDouble:", v34);
  v60 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v40, "setObject:forKeyedSubscript:", v60, CFSTR("med_dur_4"));

  objc_msgSend(MEMORY[0x24BDD16E0], "numberWithDouble:", v36);
  v61 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v40, "setObject:forKeyedSubscript:", v61, CFSTR("med_dur_8"));

  objc_msgSend(MEMORY[0x24BDD16E0], "numberWithDouble:", v38);
  v62 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v40, "setObject:forKeyedSubscript:", v62, CFSTR("med_dur_16"));

  objc_msgSend(MEMORY[0x24BDD16E0], "numberWithDouble:", v93);
  v63 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v40, "setObject:forKeyedSubscript:", v63, CFSTR("med_dur_24"));

  objc_msgSend(MEMORY[0x24BDD16E0], "numberWithUnsignedInteger:", objc_msgSend(v109, "count"));
  v64 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v40, "setObject:forKeyedSubscript:", v64, CFSTR("cnt_dur_2"));

  objc_msgSend(MEMORY[0x24BDD16E0], "numberWithUnsignedInteger:", objc_msgSend(v108, "count"));
  v65 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v40, "setObject:forKeyedSubscript:", v65, CFSTR("cnt_dur_24"));

  objc_msgSend(MEMORY[0x24BDD16E0], "numberWithDouble:", v94);
  v66 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v40, "setObject:forKeyedSubscript:", v66, CFSTR("std_dur_1"));

  objc_msgSend(MEMORY[0x24BDD16E0], "numberWithDouble:", v95);
  v67 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v40, "setObject:forKeyedSubscript:", v67, CFSTR("std_dur_2"));

  objc_msgSend(MEMORY[0x24BDD16E0], "numberWithDouble:", v96);
  v68 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v40, "setObject:forKeyedSubscript:", v68, CFSTR("std_dur_4"));

  objc_msgSend(MEMORY[0x24BDD16E0], "numberWithDouble:", v97);
  v69 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v40, "setObject:forKeyedSubscript:", v69, CFSTR("std_dur_8"));

  objc_msgSend(MEMORY[0x24BDD16E0], "numberWithDouble:", *(double *)&v98);
  v70 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v40, "setObject:forKeyedSubscript:", v70, CFSTR("std_dur_16"));

  objc_msgSend(MEMORY[0x24BDD16E0], "numberWithDouble:", v111);
  v71 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v40, "setObject:forKeyedSubscript:", v71, CFSTR("std_dur_24"));

  v99 = (id)objc_msgSend(objc_alloc(MEMORY[0x24BDBFF80]), "initWithDictionary:error:", v40, 0);
  v113 = 0u;
  v114 = 0u;
  v115 = 0u;
  v116 = 0u;
  v72 = v40;
  objc_msgSend(v40, "allKeys");
  v73 = (void *)objc_claimAutoreleasedReturnValue();
  v74 = objc_msgSend(v73, "countByEnumeratingWithState:objects:count:", &v113, v124, 16);
  if (v74)
  {
    v75 = v74;
    v76 = *(_QWORD *)v114;
    do
    {
      v77 = 0;
      do
      {
        if (*(_QWORD *)v114 != v76)
          objc_enumerationMutation(v73);
        v78 = *(void **)(*((_QWORD *)&v113 + 1) + 8 * v77);
        v79 = v13;
        if (os_log_type_enabled(v79, OS_LOG_TYPE_DEBUG))
        {
          objc_msgSend(v72, "objectForKeyedSubscript:", v78);
          v80 = (void *)objc_claimAutoreleasedReturnValue();
          *(_DWORD *)buf = 138412546;
          v121 = v78;
          v122 = 2112;
          v123 = v80;
          _os_log_debug_impl(&dword_215A71000, v79, OS_LOG_TYPE_DEBUG, "input for feature '%@': %@", buf, 0x16u);

        }
        ++v77;
      }
      while (v75 != v77);
      v75 = objc_msgSend(v73, "countByEnumeratingWithState:objects:count:", &v113, v124, 16);
    }
    while (v75);
  }

  objc_msgSend(v105, "timeIntervalSince1970");
  v82 = floor(v81);
  v118[0] = CFSTR("pluginDateAsInterval");
  objc_msgSend(MEMORY[0x24BDD16E0], "numberWithDouble:", v82);
  v83 = (void *)objc_claimAutoreleasedReturnValue();
  v119[0] = v83;
  v119[1] = v72;
  v84 = v72;
  v118[1] = CFSTR("features");
  v118[2] = CFSTR("dataVersion");
  v119[2] = &unk_24D443618;
  objc_msgSend(MEMORY[0x24BDBCE70], "dictionaryWithObjects:forKeys:count:", v119, v118, 3);
  v85 = (void *)objc_claimAutoreleasedReturnValue();

  v86 = (void *)MEMORY[0x24BDBCF48];
  v117[0] = CFSTR("/var/mobile/Library/PowerUI");
  v117[1] = CFSTR("obc_features");
  objc_msgSend(MEMORY[0x24BDBCE30], "arrayWithObjects:count:", v117, 2);
  v87 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v86, "fileURLWithPathComponents:", v87);
  v88 = (void *)objc_claimAutoreleasedReturnValue();

  v112 = 0;
  objc_msgSend(v85, "writeToURL:error:", v88, &v112);
  v89 = v112;
  if (v89)
  {
    if (os_log_type_enabled(v13, OS_LOG_TYPE_ERROR))
      -[PowerUIMLMacPredictor getInputFeatures:events:pluginBatteryLevel:timeFromPlugin:pluginDate:withLog:].cold.1((uint64_t)v89, v13);
  }
  else
  {
    v90 = v13;
    if (os_log_type_enabled(v90, OS_LOG_TYPE_DEFAULT))
    {
      objc_msgSend(MEMORY[0x24BDD16E0], "numberWithDouble:", v82);
      v91 = (void *)objc_claimAutoreleasedReturnValue();
      *(_DWORD *)buf = 138412290;
      v121 = v91;
      _os_log_impl(&dword_215A71000, v90, OS_LOG_TYPE_DEFAULT, "Feature dict saved for plugin: %@", buf, 0xCu);

    }
  }

  return v99;
}

- (void)getInputFeatures:(uint64_t)a1 events:(NSObject *)a2 pluginBatteryLevel:timeFromPlugin:pluginDate:withLog:.cold.1(uint64_t a1, NSObject *a2)
{
  int v2;
  uint64_t v3;
  uint64_t v4;

  v4 = *MEMORY[0x24BDAC8D0];
  v2 = 138412290;
  v3 = a1;
  _os_log_error_impl(&dword_215A71000, a2, OS_LOG_TYPE_ERROR, "Error saving latest features: %@", (uint8_t *)&v2, 0xCu);
}

@end
