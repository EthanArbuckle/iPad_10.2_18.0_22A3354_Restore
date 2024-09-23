@implementation OSChargingPhoneOnPluginPredictor

- (MLModel)engageOnPluginModel
{
  MLModel *engageOnPluginModel;
  MLModel *v4;
  MLModel *v5;

  engageOnPluginModel = self->_engageOnPluginModel;
  if (!engageOnPluginModel)
  {
    v4 = (MLModel *)objc_claimAutoreleasedReturnValue(-[OSChargingTwoStagePredictor loadModelWithModelNameString:](self, "loadModelWithModelNameString:", CFSTR("engageOnPlugin")));
    v5 = self->_engageOnPluginModel;
    self->_engageOnPluginModel = v4;

    engageOnPluginModel = self->_engageOnPluginModel;
  }
  return engageOnPluginModel;
}

- (MLModel)shortDurationModel
{
  MLModel *shortDurationModel;
  MLModel *v4;
  MLModel *v5;

  shortDurationModel = self->_shortDurationModel;
  if (!shortDurationModel)
  {
    v4 = (MLModel *)objc_claimAutoreleasedReturnValue(-[OSChargingTwoStagePredictor loadModelWithModelNameString:](self, "loadModelWithModelNameString:", CFSTR("shortDurationModel")));
    v5 = self->_shortDurationModel;
    self->_shortDurationModel = v4;

    shortDurationModel = self->_shortDurationModel;
  }
  return shortDurationModel;
}

- (MLModel)longDurationModel
{
  MLModel *longDurationModel;
  MLModel *v4;
  MLModel *v5;

  longDurationModel = self->_longDurationModel;
  if (!longDurationModel)
  {
    v4 = (MLModel *)objc_claimAutoreleasedReturnValue(-[OSChargingTwoStagePredictor loadModelWithModelNameString:](self, "loadModelWithModelNameString:", CFSTR("longDurationModel")));
    v5 = self->_longDurationModel;
    self->_longDurationModel = v4;

    longDurationModel = self->_longDurationModel;
  }
  return longDurationModel;
}

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
  void *v20;
  void *v21;
  void *v22;
  void *v23;
  uint64_t v24;
  void *v25;
  void *v26;
  uint64_t v27;
  uint64_t v28;
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
  double v48;
  double v49;
  double v50;
  double v51;
  double v52;
  double v53;
  double v54;
  NSObject *v55;
  void *v56;
  void *v57;
  void *v58;
  NSObject *v59;
  id v60;
  NSObject *v61;
  id v62;
  NSObject *v63;
  id v64;
  NSObject *v65;
  id v66;
  NSObject *v67;
  id v68;
  NSObject *v69;
  id v70;
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
  id v98;
  id v102;
  void *v103;
  void *v104;
  void *v105;
  void *v106;
  void *v107;
  void *v108;
  double v109;
  double v110;
  double v111;
  double v112;
  double v113;
  double v115;
  double v116;
  double v117;
  double v118;
  double v119;
  void *v120;
  void *v121;
  void *v122;
  void *v123;
  void *v124;
  void *v125;
  void *v126;
  void *v127;
  void *v128;
  void *v129;
  uint8_t buf[4];
  double v131;
  __int16 v132;
  double v133;
  __int16 v134;
  double v135;

  v102 = a8;
  v10 = a7;
  v11 = a4;
  v12 = objc_claimAutoreleasedReturnValue(+[OSIntelligenceUtilities filterEventsSortedByStartDateAscending:startsBefore:dynamicallyAroundDate:withHourBinWidth:](OSIntelligenceUtilities, "filterEventsSortedByStartDateAscending:startsBefore:dynamicallyAroundDate:withHourBinWidth:", v11, v10, v10, 1));
  v13 = objc_claimAutoreleasedReturnValue(+[OSIntelligenceUtilities filterEventsSortedByStartDateAscending:startsBefore:dynamicallyAroundDate:withHourBinWidth:](OSIntelligenceUtilities, "filterEventsSortedByStartDateAscending:startsBefore:dynamicallyAroundDate:withHourBinWidth:", v11, v10, v10, 2));
  v14 = objc_claimAutoreleasedReturnValue(+[OSIntelligenceUtilities filterEventsSortedByStartDateAscending:startsBefore:dynamicallyAroundDate:withHourBinWidth:](OSIntelligenceUtilities, "filterEventsSortedByStartDateAscending:startsBefore:dynamicallyAroundDate:withHourBinWidth:", v11, v10, v10, 4));
  v15 = objc_claimAutoreleasedReturnValue(+[OSIntelligenceUtilities filterEventsSortedByStartDateAscending:startsBefore:dynamicallyAroundDate:withHourBinWidth:](OSIntelligenceUtilities, "filterEventsSortedByStartDateAscending:startsBefore:dynamicallyAroundDate:withHourBinWidth:", v11, v10, v10, 8));
  v129 = (void *)objc_claimAutoreleasedReturnValue(+[OSIntelligenceUtilities filterEventsSortedByStartDateAscending:startsBefore:dynamicallyAroundDate:withHourBinWidth:](OSIntelligenceUtilities, "filterEventsSortedByStartDateAscending:startsBefore:dynamicallyAroundDate:withHourBinWidth:", v11, v10, v10, 16));
  v16 = objc_claimAutoreleasedReturnValue(+[OSIntelligenceUtilities filterEventsSortedByStartDateAscending:startsBefore:dynamicallyAroundDate:withHourBinWidth:](OSIntelligenceUtilities, "filterEventsSortedByStartDateAscending:startsBefore:dynamicallyAroundDate:withHourBinWidth:", v11, v10, v10, 24));

  v17 = objc_claimAutoreleasedReturnValue(+[OSIntelligenceUtilities filterEvents:startOnSameWeekdayAs:](OSIntelligenceUtilities, "filterEvents:startOnSameWeekdayAs:", v12, v10));
  v18 = objc_claimAutoreleasedReturnValue(+[OSIntelligenceUtilities filterEvents:startOnSameWeekdayAs:](OSIntelligenceUtilities, "filterEvents:startOnSameWeekdayAs:", v13, v10));
  v19 = objc_claimAutoreleasedReturnValue(+[OSIntelligenceUtilities filterEvents:startOnSameWeekdayAs:](OSIntelligenceUtilities, "filterEvents:startOnSameWeekdayAs:", v14, v10));
  v127 = (void *)objc_claimAutoreleasedReturnValue(+[OSIntelligenceUtilities filterEvents:startOnSameWeekdayAs:](OSIntelligenceUtilities, "filterEvents:startOnSameWeekdayAs:", v15, v10));
  v126 = (void *)objc_claimAutoreleasedReturnValue(+[OSIntelligenceUtilities filterEvents:startOnSameWeekdayAs:](OSIntelligenceUtilities, "filterEvents:startOnSameWeekdayAs:", v16, v10));

  v128 = (void *)v12;
  v20 = (void *)objc_claimAutoreleasedReturnValue(+[OSIntelligenceUtilities getDurationsFromEvents:withUnit:cappedAt:](OSIntelligenceUtilities, "getDurationsFromEvents:withUnit:cappedAt:", v12, 3600.0, 0.0));
  v123 = (void *)v13;
  v21 = (void *)objc_claimAutoreleasedReturnValue(+[OSIntelligenceUtilities getDurationsFromEvents:withUnit:cappedAt:](OSIntelligenceUtilities, "getDurationsFromEvents:withUnit:cappedAt:", v13, 3600.0, 0.0));
  v122 = (void *)v14;
  v22 = (void *)objc_claimAutoreleasedReturnValue(+[OSIntelligenceUtilities getDurationsFromEvents:withUnit:cappedAt:](OSIntelligenceUtilities, "getDurationsFromEvents:withUnit:cappedAt:", v14, 3600.0, 0.0));
  v121 = (void *)v15;
  v23 = (void *)objc_claimAutoreleasedReturnValue(+[OSIntelligenceUtilities getDurationsFromEvents:withUnit:cappedAt:](OSIntelligenceUtilities, "getDurationsFromEvents:withUnit:cappedAt:", v15, 3600.0, 0.0));
  v24 = objc_claimAutoreleasedReturnValue(+[OSIntelligenceUtilities getDurationsFromEvents:withUnit:cappedAt:](OSIntelligenceUtilities, "getDurationsFromEvents:withUnit:cappedAt:", v129, 3600.0, 0.0));
  v120 = (void *)v16;
  v25 = (void *)objc_claimAutoreleasedReturnValue(+[OSIntelligenceUtilities getDurationsFromEvents:withUnit:cappedAt:](OSIntelligenceUtilities, "getDurationsFromEvents:withUnit:cappedAt:", v16, 3600.0, 0.0));
  v108 = (void *)v17;
  v125 = (void *)objc_claimAutoreleasedReturnValue(+[OSIntelligenceUtilities getDurationsFromEvents:withUnit:cappedAt:](OSIntelligenceUtilities, "getDurationsFromEvents:withUnit:cappedAt:", v17, 3600.0, 0.0));
  v107 = (void *)v18;
  v124 = (void *)objc_claimAutoreleasedReturnValue(+[OSIntelligenceUtilities getDurationsFromEvents:withUnit:cappedAt:](OSIntelligenceUtilities, "getDurationsFromEvents:withUnit:cappedAt:", v18, 3600.0, 0.0));
  v106 = (void *)v19;
  v26 = (void *)objc_claimAutoreleasedReturnValue(+[OSIntelligenceUtilities getDurationsFromEvents:withUnit:cappedAt:](OSIntelligenceUtilities, "getDurationsFromEvents:withUnit:cappedAt:", v19, 3600.0, 0.0));
  v27 = objc_claimAutoreleasedReturnValue(+[OSIntelligenceUtilities getDurationsFromEvents:withUnit:cappedAt:](OSIntelligenceUtilities, "getDurationsFromEvents:withUnit:cappedAt:", v127, 3600.0, 0.0));
  v28 = objc_claimAutoreleasedReturnValue(+[OSIntelligenceUtilities getDurationsFromEvents:withUnit:cappedAt:](OSIntelligenceUtilities, "getDurationsFromEvents:withUnit:cappedAt:", v126, 3600.0, 0.0));
  +[OSIntelligenceUtilities standardDeviationOf:](OSIntelligenceUtilities, "standardDeviationOf:", v20);
  v115 = v29;
  +[OSIntelligenceUtilities standardDeviationOf:](OSIntelligenceUtilities, "standardDeviationOf:", v21);
  v116 = v30;
  +[OSIntelligenceUtilities standardDeviationOf:](OSIntelligenceUtilities, "standardDeviationOf:", v22);
  v118 = v31;
  +[OSIntelligenceUtilities standardDeviationOf:](OSIntelligenceUtilities, "standardDeviationOf:", v23);
  v33 = v32;
  +[OSIntelligenceUtilities standardDeviationOf:](OSIntelligenceUtilities, "standardDeviationOf:", v24);
  v35 = v34;
  +[OSIntelligenceUtilities standardDeviationOf:](OSIntelligenceUtilities, "standardDeviationOf:", v25);
  v37 = v36;
  +[OSIntelligenceUtilities standardDeviationOf:](OSIntelligenceUtilities, "standardDeviationOf:", v26);
  v39 = v38;
  +[OSIntelligenceUtilities medianOf:](OSIntelligenceUtilities, "medianOf:", v20);
  v41 = v40;
  +[OSIntelligenceUtilities medianOf:](OSIntelligenceUtilities, "medianOf:", v21);
  v109 = v42;
  +[OSIntelligenceUtilities medianOf:](OSIntelligenceUtilities, "medianOf:", v22);
  v110 = v43;
  +[OSIntelligenceUtilities medianOf:](OSIntelligenceUtilities, "medianOf:", v23);
  v111 = v44;
  v105 = (void *)v24;
  +[OSIntelligenceUtilities medianOf:](OSIntelligenceUtilities, "medianOf:", v24);
  v112 = v45;
  +[OSIntelligenceUtilities medianOf:](OSIntelligenceUtilities, "medianOf:", v25);
  v113 = v46;
  +[OSIntelligenceUtilities medianOf:](OSIntelligenceUtilities, "medianOf:", v125);
  v117 = v47;
  +[OSIntelligenceUtilities medianOf:](OSIntelligenceUtilities, "medianOf:", v124);
  v119 = v48;
  +[OSIntelligenceUtilities medianOf:](OSIntelligenceUtilities, "medianOf:", v26);
  v50 = v49;
  v104 = (void *)v27;
  +[OSIntelligenceUtilities medianOf:](OSIntelligenceUtilities, "medianOf:", v27);
  v52 = v51;
  v103 = (void *)v28;
  +[OSIntelligenceUtilities medianOf:](OSIntelligenceUtilities, "medianOf:", v28);
  v54 = v53;
  v55 = v102;
  if (os_log_type_enabled(v55, OS_LOG_TYPE_DEFAULT))
  {
    v56 = (void *)objc_claimAutoreleasedReturnValue(+[NSNumber numberWithUnsignedInteger:](NSNumber, "numberWithUnsignedInteger:", a5));
    v57 = (void *)objc_claimAutoreleasedReturnValue(+[NSNumber numberWithDouble:](NSNumber, "numberWithDouble:", a3));
    v58 = (void *)objc_claimAutoreleasedReturnValue(+[NSNumber numberWithDouble:](NSNumber, "numberWithDouble:", a6));
    *(_DWORD *)buf = 138412802;
    v131 = *(double *)&v56;
    v132 = 2112;
    v133 = *(double *)&v57;
    v134 = 2112;
    v135 = *(double *)&v58;
    _os_log_impl((void *)&_mh_execute_header, v55, OS_LOG_TYPE_DEFAULT, "Model inputs: PluginBatteryLevel=%@, Hour=%@, TimeFromPlugin=%@", buf, 0x20u);

  }
  if (os_log_type_enabled(v55, OS_LOG_TYPE_DEBUG))
    sub_10003EA70();
  v59 = v55;
  if (os_log_type_enabled(v59, OS_LOG_TYPE_DEFAULT))
  {
    v60 = objc_msgSend(v128, "count");
    *(_DWORD *)buf = 134218496;
    v131 = *(double *)&v60;
    v132 = 2048;
    v133 = v115;
    v134 = 2048;
    v135 = v41;
    _os_log_impl((void *)&_mh_execute_header, v59, OS_LOG_TYPE_DEFAULT, "Model inputs for hourBin1: count %lu, std_dur_1: %f, med_dur_1: %lf", buf, 0x20u);
  }

  if (os_log_type_enabled(v59, OS_LOG_TYPE_DEBUG))
    sub_10003EA10();
  v61 = v59;
  if (os_log_type_enabled(v61, OS_LOG_TYPE_DEFAULT))
  {
    v62 = objc_msgSend(v123, "count");
    *(_DWORD *)buf = 134218496;
    v131 = *(double *)&v62;
    v132 = 2048;
    v133 = v116;
    v134 = 2048;
    v135 = v109;
    _os_log_impl((void *)&_mh_execute_header, v61, OS_LOG_TYPE_DEFAULT, "Model inputs for hourBin2: count %lu, std_dur_2: %f, med_dur_2: %lf", buf, 0x20u);
  }

  if (os_log_type_enabled(v61, OS_LOG_TYPE_DEBUG))
    sub_10003E9B0();
  v63 = v61;
  if (os_log_type_enabled(v63, OS_LOG_TYPE_DEFAULT))
  {
    v64 = objc_msgSend(v122, "count");
    *(_DWORD *)buf = 134218496;
    v131 = *(double *)&v64;
    v132 = 2048;
    v133 = v118;
    v134 = 2048;
    v135 = v110;
    _os_log_impl((void *)&_mh_execute_header, v63, OS_LOG_TYPE_DEFAULT, "Model inputs for hourBin4: count %lu, std_dur_4: %f, med_dur_4: %lf", buf, 0x20u);
  }

  if (os_log_type_enabled(v63, OS_LOG_TYPE_DEBUG))
    sub_10003E950();
  v65 = v63;
  if (os_log_type_enabled(v65, OS_LOG_TYPE_DEFAULT))
  {
    v66 = objc_msgSend(v121, "count");
    *(_DWORD *)buf = 134218496;
    v131 = *(double *)&v66;
    v132 = 2048;
    v133 = v33;
    v134 = 2048;
    v135 = v111;
    _os_log_impl((void *)&_mh_execute_header, v65, OS_LOG_TYPE_DEFAULT, "Model inputs for hourBin8: count %lu, std_dur_8: %f, med_dur_8: %lf", buf, 0x20u);
  }

  if (os_log_type_enabled(v65, OS_LOG_TYPE_DEBUG))
    sub_10003E8F0();
  v67 = v65;
  if (os_log_type_enabled(v67, OS_LOG_TYPE_DEFAULT))
  {
    v68 = objc_msgSend(v129, "count");
    *(_DWORD *)buf = 134218496;
    v131 = *(double *)&v68;
    v132 = 2048;
    v133 = v35;
    v134 = 2048;
    v135 = v112;
    _os_log_impl((void *)&_mh_execute_header, v67, OS_LOG_TYPE_DEFAULT, "Model inputs for hourBin16: count %lu, std_dur_16: %f, med_dur_16: %lf", buf, 0x20u);
  }

  if (os_log_type_enabled(v67, OS_LOG_TYPE_DEBUG))
    sub_10003E890();
  v69 = v67;
  if (os_log_type_enabled(v69, OS_LOG_TYPE_DEFAULT))
  {
    v70 = objc_msgSend(v120, "count");
    *(_DWORD *)buf = 134218496;
    v131 = *(double *)&v70;
    v132 = 2048;
    v133 = v37;
    v134 = 2048;
    v135 = v113;
    _os_log_impl((void *)&_mh_execute_header, v69, OS_LOG_TYPE_DEFAULT, "Model inputs for hourBin24: count %lu, std_dur_24: %f, med_dur_24: %lf", buf, 0x20u);
  }

  if (os_log_type_enabled(v69, OS_LOG_TYPE_DEBUG))
    sub_10003E830();
  if (os_log_type_enabled(v69, OS_LOG_TYPE_DEFAULT))
  {
    *(_DWORD *)buf = 134217984;
    v131 = v117;
    _os_log_impl((void *)&_mh_execute_header, v69, OS_LOG_TYPE_DEFAULT, "Model inputs for weekday1: weekday_med_dur_1: %lf", buf, 0xCu);
  }
  if (os_log_type_enabled(v69, OS_LOG_TYPE_DEBUG))
    sub_10003E7D0();
  if (os_log_type_enabled(v69, OS_LOG_TYPE_DEFAULT))
  {
    *(_DWORD *)buf = 134217984;
    v131 = v119;
    _os_log_impl((void *)&_mh_execute_header, v69, OS_LOG_TYPE_DEFAULT, "Model inputs for weekday2: weekday_med_dur_2: %lf", buf, 0xCu);
  }
  if (os_log_type_enabled(v69, OS_LOG_TYPE_DEBUG))
    sub_10003E770();
  if (os_log_type_enabled(v69, OS_LOG_TYPE_DEFAULT))
  {
    *(_DWORD *)buf = 134218240;
    v131 = v50;
    v132 = 2048;
    v133 = v39;
    _os_log_impl((void *)&_mh_execute_header, v69, OS_LOG_TYPE_DEFAULT, "Model inputs for weekday4: weekday_med_dur_4: %lf, weekday_std_dur_4: %lf", buf, 0x16u);
  }
  if (os_log_type_enabled(v69, OS_LOG_TYPE_DEBUG))
    sub_10003E710();
  if (os_log_type_enabled(v69, OS_LOG_TYPE_DEFAULT))
  {
    *(_DWORD *)buf = 134217984;
    v131 = v52;
    _os_log_impl((void *)&_mh_execute_header, v69, OS_LOG_TYPE_DEFAULT, "Model inputs for weekday8: weekday_med_dur_8: %lf", buf, 0xCu);
  }
  if (os_log_type_enabled(v69, OS_LOG_TYPE_DEBUG))
    sub_10003E6B0();
  if (os_log_type_enabled(v69, OS_LOG_TYPE_DEFAULT))
  {
    *(_DWORD *)buf = 134217984;
    v131 = v54;
    _os_log_impl((void *)&_mh_execute_header, v69, OS_LOG_TYPE_DEFAULT, "Model inputs for weekday24: weekday_med_dur_24: %lf", buf, 0xCu);
  }
  v71 = (void *)objc_claimAutoreleasedReturnValue(+[NSMutableDictionary dictionary](NSMutableDictionary, "dictionary", *(_QWORD *)&a3));
  v72 = (void *)objc_claimAutoreleasedReturnValue(+[NSNumber numberWithUnsignedInteger:](NSNumber, "numberWithUnsignedInteger:", a5));
  objc_msgSend(v71, "setObject:forKeyedSubscript:", v72, CFSTR("plugin_battery_level"));

  v73 = (void *)objc_claimAutoreleasedReturnValue(+[NSNumber numberWithDouble:](NSNumber, "numberWithDouble:", a6));
  objc_msgSend(v71, "setObject:forKeyedSubscript:", v73, CFSTR("time_from_plugin"));

  v74 = (void *)objc_claimAutoreleasedReturnValue(+[NSNumber numberWithDouble:](NSNumber, "numberWithDouble:", v41));
  objc_msgSend(v71, "setObject:forKeyedSubscript:", v74, CFSTR("med_dur_1"));

  v75 = (void *)objc_claimAutoreleasedReturnValue(+[NSNumber numberWithDouble:](NSNumber, "numberWithDouble:", v109));
  objc_msgSend(v71, "setObject:forKeyedSubscript:", v75, CFSTR("med_dur_2"));

  v76 = (void *)objc_claimAutoreleasedReturnValue(+[NSNumber numberWithDouble:](NSNumber, "numberWithDouble:", v110));
  objc_msgSend(v71, "setObject:forKeyedSubscript:", v76, CFSTR("med_dur_4"));

  v77 = (void *)objc_claimAutoreleasedReturnValue(+[NSNumber numberWithDouble:](NSNumber, "numberWithDouble:", v111));
  objc_msgSend(v71, "setObject:forKeyedSubscript:", v77, CFSTR("med_dur_8"));

  v78 = (void *)objc_claimAutoreleasedReturnValue(+[NSNumber numberWithDouble:](NSNumber, "numberWithDouble:", v112));
  objc_msgSend(v71, "setObject:forKeyedSubscript:", v78, CFSTR("med_dur_16"));

  v79 = (void *)objc_claimAutoreleasedReturnValue(+[NSNumber numberWithDouble:](NSNumber, "numberWithDouble:", v113));
  objc_msgSend(v71, "setObject:forKeyedSubscript:", v79, CFSTR("med_dur_24"));

  v80 = (void *)objc_claimAutoreleasedReturnValue(+[NSNumber numberWithUnsignedInteger:](NSNumber, "numberWithUnsignedInteger:", objc_msgSend(v128, "count")));
  objc_msgSend(v71, "setObject:forKeyedSubscript:", v80, CFSTR("cnt_dur_1"));

  v81 = (void *)objc_claimAutoreleasedReturnValue(+[NSNumber numberWithUnsignedInteger:](NSNumber, "numberWithUnsignedInteger:", objc_msgSend(v123, "count")));
  objc_msgSend(v71, "setObject:forKeyedSubscript:", v81, CFSTR("cnt_dur_2"));

  v82 = (void *)objc_claimAutoreleasedReturnValue(+[NSNumber numberWithUnsignedInteger:](NSNumber, "numberWithUnsignedInteger:", objc_msgSend(v122, "count")));
  objc_msgSend(v71, "setObject:forKeyedSubscript:", v82, CFSTR("cnt_dur_4"));

  v83 = (void *)objc_claimAutoreleasedReturnValue(+[NSNumber numberWithUnsignedInteger:](NSNumber, "numberWithUnsignedInteger:", objc_msgSend(v121, "count")));
  objc_msgSend(v71, "setObject:forKeyedSubscript:", v83, CFSTR("cnt_dur_8"));

  v84 = (void *)objc_claimAutoreleasedReturnValue(+[NSNumber numberWithUnsignedInteger:](NSNumber, "numberWithUnsignedInteger:", objc_msgSend(v129, "count")));
  objc_msgSend(v71, "setObject:forKeyedSubscript:", v84, CFSTR("cnt_dur_16"));

  v85 = (void *)objc_claimAutoreleasedReturnValue(+[NSNumber numberWithUnsignedInteger:](NSNumber, "numberWithUnsignedInteger:", objc_msgSend(v120, "count")));
  objc_msgSend(v71, "setObject:forKeyedSubscript:", v85, CFSTR("cnt_dur_24"));

  v86 = (void *)objc_claimAutoreleasedReturnValue(+[NSNumber numberWithDouble:](NSNumber, "numberWithDouble:", v115));
  objc_msgSend(v71, "setObject:forKeyedSubscript:", v86, CFSTR("std_dur_1"));

  v87 = (void *)objc_claimAutoreleasedReturnValue(+[NSNumber numberWithDouble:](NSNumber, "numberWithDouble:", v116));
  objc_msgSend(v71, "setObject:forKeyedSubscript:", v87, CFSTR("std_dur_2"));

  v88 = (void *)objc_claimAutoreleasedReturnValue(+[NSNumber numberWithDouble:](NSNumber, "numberWithDouble:", v118));
  objc_msgSend(v71, "setObject:forKeyedSubscript:", v88, CFSTR("std_dur_4"));

  v89 = (void *)objc_claimAutoreleasedReturnValue(+[NSNumber numberWithDouble:](NSNumber, "numberWithDouble:", v33));
  objc_msgSend(v71, "setObject:forKeyedSubscript:", v89, CFSTR("std_dur_8"));

  v90 = (void *)objc_claimAutoreleasedReturnValue(+[NSNumber numberWithDouble:](NSNumber, "numberWithDouble:", v35));
  objc_msgSend(v71, "setObject:forKeyedSubscript:", v90, CFSTR("std_dur_16"));

  v91 = (void *)objc_claimAutoreleasedReturnValue(+[NSNumber numberWithDouble:](NSNumber, "numberWithDouble:", v37));
  objc_msgSend(v71, "setObject:forKeyedSubscript:", v91, CFSTR("std_dur_24"));

  v92 = (void *)objc_claimAutoreleasedReturnValue(+[NSNumber numberWithDouble:](NSNumber, "numberWithDouble:", v117));
  objc_msgSend(v71, "setObject:forKeyedSubscript:", v92, CFSTR("weekday_med_dur_1"));

  v93 = (void *)objc_claimAutoreleasedReturnValue(+[NSNumber numberWithDouble:](NSNumber, "numberWithDouble:", v119));
  objc_msgSend(v71, "setObject:forKeyedSubscript:", v93, CFSTR("weekday_med_dur_2"));

  v94 = (void *)objc_claimAutoreleasedReturnValue(+[NSNumber numberWithDouble:](NSNumber, "numberWithDouble:", v50));
  objc_msgSend(v71, "setObject:forKeyedSubscript:", v94, CFSTR("weekday_med_dur_4"));

  v95 = (void *)objc_claimAutoreleasedReturnValue(+[NSNumber numberWithDouble:](NSNumber, "numberWithDouble:", v52));
  objc_msgSend(v71, "setObject:forKeyedSubscript:", v95, CFSTR("weekday_med_dur_8"));

  v96 = (void *)objc_claimAutoreleasedReturnValue(+[NSNumber numberWithDouble:](NSNumber, "numberWithDouble:", v54));
  objc_msgSend(v71, "setObject:forKeyedSubscript:", v96, CFSTR("weekday_med_dur_24"));

  v97 = (void *)objc_claimAutoreleasedReturnValue(+[NSNumber numberWithDouble:](NSNumber, "numberWithDouble:", v39));
  objc_msgSend(v71, "setObject:forKeyedSubscript:", v97, CFSTR("weekday_std_dur_4"));

  v98 = objc_msgSend(objc_alloc((Class)MLDictionaryFeatureProvider), "initWithDictionary:error:", v71, 0);
  return v98;
}

- (OSChargingTwoStagePredictorQueryResult)chargingDecision:(SEL)a3 withPluginDate:(unint64_t)a4 withPluginBatteryLevel:(id)a5 forDate:(double)a6 withLog:(id)a7
{
  NSObject *v13;
  id v14;
  id v15;
  void *v16;
  void *v17;
  void *v18;
  void *v19;
  void *v20;
  void *v21;
  NSObject *v22;
  void *v23;
  void *v24;
  double v25;
  double v26;
  _BOOL4 v27;
  void *v28;
  BOOL v29;
  void *v30;
  void *v31;
  double v32;
  double v33;
  OSChargingTwoStagePredictorQueryResult *result;
  int v35;
  double v36;

  v13 = a8;
  v14 = a7;
  v15 = a5;
  v16 = (void *)os_transaction_create("com.apple.osintelligence.smartcharging.mlmodelpredictor.decision");
  if (os_log_type_enabled(v13, OS_LOG_TYPE_DEFAULT))
  {
    LOWORD(v35) = 0;
    _os_log_impl((void *)&_mh_execute_header, v13, OS_LOG_TYPE_DEFAULT, "Getting predictions with on plugin model", (uint8_t *)&v35, 2u);
  }
  v17 = (void *)objc_claimAutoreleasedReturnValue(-[OSChargingTwoStagePredictor getInputFeaturesWithPluginDate:withPluginBatteryLevel:forDate:withLog:](self, "getInputFeaturesWithPluginDate:withPluginBatteryLevel:forDate:withLog:", v15, v14, v13, a6));

  *(_QWORD *)&retstr->var0 = 0;
  *(int64x2_t *)&retstr->var1 = vdupq_n_s64(0xC0F869F000000000);
  v18 = (void *)objc_claimAutoreleasedReturnValue(-[OSChargingPhoneOnPluginPredictor engageOnPluginModel](self, "engageOnPluginModel"));
  v19 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v18, "predictionFromFeatures:error:", v17, 0));

  v20 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v19, "featureValueForName:", CFSTR("classProbability")));
  v21 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v20, "dictionaryValue"));

  v22 = v13;
  if (os_log_type_enabled(v22, OS_LOG_TYPE_DEFAULT))
  {
    v23 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v21, "description"));
    v35 = 138412290;
    v36 = *(double *)&v23;
    _os_log_impl((void *)&_mh_execute_header, v22, OS_LOG_TYPE_DEFAULT, "On plugin engagement model raw output %@", (uint8_t *)&v35, 0xCu);

  }
  v24 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v21, "objectForKeyedSubscript:", &off_100064D48));
  objc_msgSend(v24, "doubleValue");
  v26 = v25;

  retstr->var2 = v26;
  v27 = os_log_type_enabled(v22, OS_LOG_TYPE_DEFAULT);
  if (v26 <= 0.675)
  {
    if (v27)
    {
      LOWORD(v35) = 0;
      _os_log_impl((void *)&_mh_execute_header, v22, OS_LOG_TYPE_DEFAULT, "Querying on plugin short duration model", (uint8_t *)&v35, 2u);
    }
    v28 = (void *)objc_claimAutoreleasedReturnValue(-[OSChargingPhoneOnPluginPredictor shortDurationModel](self, "shortDurationModel"));
    v29 = 0;
  }
  else
  {
    if (v27)
    {
      LOWORD(v35) = 0;
      _os_log_impl((void *)&_mh_execute_header, v22, OS_LOG_TYPE_DEFAULT, "Querying on plugin long duration model", (uint8_t *)&v35, 2u);
    }
    v28 = (void *)objc_claimAutoreleasedReturnValue(-[OSChargingPhoneOnPluginPredictor longDurationModel](self, "longDurationModel"));
    v29 = 1;
  }
  v30 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v28, "predictionFromFeatures:error:", v17, 0));

  retstr->var0 = v29;
  v31 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v30, "featureValueForName:", CFSTR("duration_pred")));
  objc_msgSend(v31, "doubleValue");
  v33 = v32;

  if (os_log_type_enabled(v22, OS_LOG_TYPE_DEFAULT))
  {
    v35 = 134217984;
    v36 = v33;
    _os_log_impl((void *)&_mh_execute_header, v22, OS_LOG_TYPE_DEFAULT, "Overall on plugin regression model output: %lf", (uint8_t *)&v35, 0xCu);
  }
  retstr->var1 = v33;

  return result;
}

- (void)setEngageOnPluginModel:(id)a3
{
  objc_storeStrong((id *)&self->_engageOnPluginModel, a3);
}

- (void)setShortDurationModel:(id)a3
{
  objc_storeStrong((id *)&self->_shortDurationModel, a3);
}

- (void)setLongDurationModel:(id)a3
{
  objc_storeStrong((id *)&self->_longDurationModel, a3);
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_longDurationModel, 0);
  objc_storeStrong((id *)&self->_shortDurationModel, 0);
  objc_storeStrong((id *)&self->_engageOnPluginModel, 0);
}

@end
