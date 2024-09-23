@implementation HKSHSleepChartFormatter

- (HKSHSleepChartFormatter)initWithHealthStore:(id)a3
{
  id v5;
  HKSHSleepChartFormatter *v6;
  HKSHSleepChartFormatter *v7;
  objc_super v9;

  v5 = a3;
  v9.receiver = self;
  v9.super_class = (Class)HKSHSleepChartFormatter;
  v6 = -[HKSHSleepChartFormatter init](&v9, sel_init);
  v7 = v6;
  if (v6)
    objc_storeStrong((id *)&v6->_healthStore, a3);

  return v7;
}

- (id)formattedSelectedRangeLabelDataWithChartData:(id)a3 context:(int64_t)a4
{
  id v4;
  uint64_t v5;
  uint64_t v6;
  void *v7;
  void *v8;
  uint64_t v9;
  uint64_t v10;
  uint64_t i;
  void *v12;
  void *v13;
  void *v14;
  id v15;
  void *v16;
  void *v17;
  void *v18;
  char v19;
  uint64_t v20;
  uint64_t v21;
  void *v22;
  void *v23;
  void *v24;
  void *v25;
  double v26;
  double v27;
  void *v28;
  void *v29;
  double v30;
  double v31;
  void *v32;
  void *v33;
  double v34;
  double v35;
  void *v36;
  void *v37;
  double v38;
  double v39;
  void *v40;
  void *v41;
  double v42;
  double v43;
  void *v44;
  void *v45;
  double v46;
  double v47;
  void *v48;
  void *v49;
  void *v50;
  void *v51;
  uint64_t v52;
  void *v53;
  uint64_t v54;
  void *v55;
  void *v56;
  void *v57;
  void *v58;
  void *v59;
  uint64_t v60;
  void *v61;
  void *v62;
  uint64_t v63;
  uint64_t v64;
  void *v65;
  void *v66;
  void *v67;
  void *v68;
  uint64_t v69;
  uint64_t v70;
  uint64_t v71;
  void *v72;
  void *v73;
  uint64_t v74;
  void *v76;
  void *v77;
  void *v78;
  void *v79;
  void *v80;
  void *v81;
  void *v82;
  uint64_t v83;
  void *v84;
  void *v85;
  void *v86;
  uint64_t v87;
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
  uint64_t v99;
  void *v100;
  void *v101;
  int64_t v102;
  void *v103;
  void *v104;
  void *v105;
  void *v106;
  void *v107;
  void *v109;
  void *v110;
  void *v111;
  void *v112;
  void *v113;
  uint64_t v115;
  void *v116;
  void *v117;
  id v118;
  uint64_t v119;
  void *v120;
  void *v121;
  void *v122;
  uint64_t v123;
  void *v124;
  void *v125;
  void *v126;
  void *v127;
  void *v128;
  void *v129;
  void *v130;
  id obj;
  unsigned __int8 v132;
  uint64_t v133;
  uint64_t v134;
  uint64_t v135;
  uint64_t v136;
  void *v137;
  __int128 v138;
  __int128 v139;
  __int128 v140;
  __int128 v141;
  _BYTE v142[128];
  uint64_t v143;

  v143 = *MEMORY[0x1E0C80C00];
  v4 = a3;
  v118 = objc_alloc_init(MEMORY[0x1E0C99DE8]);
  v138 = 0u;
  v139 = 0u;
  v140 = 0u;
  v141 = 0u;
  obj = v4;
  v5 = objc_msgSend(obj, "countByEnumeratingWithState:objects:count:", &v138, v142, 16);
  if (v5)
  {
    v6 = v5;
    v132 = 0;
    v7 = 0;
    v8 = 0;
    v123 = 0;
    v130 = 0;
    v9 = 0;
    v10 = *(_QWORD *)v139;
    v115 = 131;
    v119 = 3;
    do
    {
      for (i = 0; i != v6; ++i)
      {
        if (*(_QWORD *)v139 != v10)
          objc_enumerationMutation(obj);
        v12 = *(void **)(*((_QWORD *)&v138 + 1) + 8 * i);
        objc_opt_class();
        if ((objc_opt_isKindOfClass() & 1) != 0)
        {
          v13 = v8;
          v14 = v7;
          v15 = v12;
          objc_msgSend(v15, "sleepDaySummary");
          v16 = (void *)objc_claimAutoreleasedReturnValue();

          if (v16)
          {
            objc_msgSend(v15, "sleepDaySummary");
            v17 = (void *)objc_claimAutoreleasedReturnValue();
            objc_msgSend(v118, "addObject:", v17);

            objc_msgSend(v15, "sleepDaySummary");
            v18 = (void *)objc_claimAutoreleasedReturnValue();
            v19 = objc_msgSend(v18, "isWeeklyAggregatedSummary");

            v132 |= v19;
          }
          v123 = objc_msgSend(v15, "seriesType");
          v119 = objc_msgSend(v15, "annotationOptions");
          objc_msgSend(v15, "annotationOverrideDuration");
          v8 = (void *)objc_claimAutoreleasedReturnValue();

          objc_msgSend(v15, "annotationOverridePrefixColorsActive");
          v20 = objc_claimAutoreleasedReturnValue();

          if (objc_msgSend(v15, "currentValueViewOptionsPriority") >= v9)
          {
            v115 = objc_msgSend(v15, "currentValueViewOptions");
            v9 = objc_msgSend(v15, "currentValueViewOptionsPriority");
            objc_msgSend(v15, "currentValueViewOverridePrefixColorsActive");
            v21 = objc_claimAutoreleasedReturnValue();

            v130 = (void *)v21;
          }

          v7 = (void *)v20;
        }
      }
      v6 = objc_msgSend(obj, "countByEnumeratingWithState:objects:count:", &v138, v142, 16);
    }
    while (v6);
  }
  else
  {
    v132 = 0;
    v7 = 0;
    v8 = 0;
    v123 = 0;
    v130 = 0;
    v115 = 131;
    v119 = 3;
  }

  v22 = v118;
  if (objc_msgSend(v118, "count"))
  {
    objc_msgSend(MEMORY[0x1E0DA85B0], "sleepMetricsForDaySummaries:", v118);
    v23 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v23, "averageInBedDuration");
    v24 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(MEMORY[0x1E0CB6CD0], "secondUnit");
    v25 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v24, "doubleValueForUnit:", v25);
    v27 = v26;

    objc_msgSend(v23, "averageAwakeDuration");
    v28 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(MEMORY[0x1E0CB6CD0], "secondUnit");
    v29 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v28, "doubleValueForUnit:", v29);
    v31 = v30;

    objc_msgSend(v23, "averageCoreSleepDuration");
    v32 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(MEMORY[0x1E0CB6CD0], "secondUnit");
    v33 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v32, "doubleValueForUnit:", v33);
    v35 = v34;

    objc_msgSend(v23, "averageREMSleepDuration");
    v36 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(MEMORY[0x1E0CB6CD0], "secondUnit");
    v37 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v36, "doubleValueForUnit:", v37);
    v39 = v38;

    objc_msgSend(v23, "averageDeepSleepDuration");
    v40 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(MEMORY[0x1E0CB6CD0], "secondUnit");
    v41 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v40, "doubleValueForUnit:", v41);
    v43 = v42;

    objc_msgSend(v23, "averageSleepDuration");
    v44 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(MEMORY[0x1E0CB6CD0], "secondUnit");
    v45 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v44, "doubleValueForUnit:", v45);
    v47 = v46;

    v48 = v118;
    objc_msgSend(v23, "averageInBedStartTime");
    v107 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v23, "averageInBedEndTime");
    v49 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v23, "averageSleepStartTime");
    v50 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v23, "averageSleepEndTime");
    v51 = (void *)objc_claimAutoreleasedReturnValue();
    -[HKSHSleepChartFormatter _firstCalendarForSummaries:](self, "_firstCalendarForSummaries:", v118);
    v52 = objc_claimAutoreleasedReturnValue();
    -[HKSHSleepChartFormatter _firstDateForSummaries:](self, "_firstDateForSummaries:", v118);
    v105 = (void *)objc_claimAutoreleasedReturnValue();
    v106 = (void *)v52;
    v22 = v118;
    v102 = -[HKSHSleepChartFormatter _statisticsTypeForSummaries:calendar:](self, "_statisticsTypeForSummaries:calendar:", v118, v52);
    v103 = v51;
    v104 = v8;
    switch(v123)
    {
      case 0:
      case 5:
        if (a4 == 1)
        {
          v127 = v49;
          objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithDouble:", v27);
          v59 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithDouble:", v47);
          v134 = objc_claimAutoreleasedReturnValue();
          objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithDouble:", v31);
          v110 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithDouble:", v35);
          v94 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithDouble:", v43);
          v98 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithDouble:", v39);
          v120 = v7;
          v76 = (void *)objc_claimAutoreleasedReturnValue();
          -[HKInteractiveChartDataFormatter majorFont](self, "majorFont");
          v77 = (void *)objc_claimAutoreleasedReturnValue();
          -[HKInteractiveChartDataFormatter minorFont](self, "minorFont");
          v78 = (void *)objc_claimAutoreleasedReturnValue();
          v62 = v130;
          -[HKSHSleepChartFormatter _rangeDataForInBedDuration:sleepDuration:awakeDuration:asleepCoreDuration:asleepDeepDuration:asleepREMDuration:overrideDuration:arePrefixColorsActive:statisticsType:valueFont:unitFont:formatterOptions:](self, "_rangeDataForInBedDuration:sleepDuration:awakeDuration:asleepCoreDuration:asleepDeepDuration:asleepREMDuration:overrideDuration:arePrefixColorsActive:statisticsType:valueFont:unitFont:formatterOptions:", v59, v134, v110, v94, v98, v76, 0, v130, v102, v77, v78, v115);
          v48 = (void *)objc_claimAutoreleasedReturnValue();

          v49 = v127;
          v22 = v118;

          v7 = v120;
          v61 = (void *)v134;
          goto LABEL_37;
        }
        if (a4)
          goto LABEL_34;
        v124 = v49;
        objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithDouble:", v27);
        v53 = v8;
        v54 = objc_claimAutoreleasedReturnValue();
        objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithDouble:", v47);
        v133 = objc_claimAutoreleasedReturnValue();
        objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithDouble:", v31);
        v109 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithDouble:", v35);
        v97 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithDouble:", v43);
        v93 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithDouble:", v39);
        v116 = v50;
        v55 = (void *)objc_claimAutoreleasedReturnValue();
        -[HKInteractiveChartDataFormatter majorFont](self, "majorFont");
        v56 = v7;
        v57 = (void *)objc_claimAutoreleasedReturnValue();
        -[HKInteractiveChartDataFormatter minorFont](self, "minorFont");
        v58 = (void *)objc_claimAutoreleasedReturnValue();
        v92 = v53;
        v59 = (void *)v54;
        v60 = v54;
        v61 = (void *)v133;
        -[HKSHSleepChartFormatter _rangeDataForInBedDuration:sleepDuration:awakeDuration:asleepCoreDuration:asleepDeepDuration:asleepREMDuration:overrideDuration:arePrefixColorsActive:statisticsType:valueFont:unitFont:formatterOptions:](self, "_rangeDataForInBedDuration:sleepDuration:awakeDuration:asleepCoreDuration:asleepDeepDuration:asleepREMDuration:overrideDuration:arePrefixColorsActive:statisticsType:valueFont:unitFont:formatterOptions:", v60, v133, v109, v97, v93, v55, v92, v56, v102, v57, v58, v119);
        v48 = (void *)objc_claimAutoreleasedReturnValue();

        v49 = v124;
        v22 = v118;

        v7 = v56;
        v50 = v116;

        goto LABEL_36;
      case 1:
      case 6:
        if (a4 == 1)
        {
          v128 = v49;
          objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithDouble:", v27);
          v99 = objc_claimAutoreleasedReturnValue();
          objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithDouble:", v47);
          v135 = objc_claimAutoreleasedReturnValue();
          objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithDouble:", v31);
          v111 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithDouble:", v35);
          v95 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithDouble:", v43);
          v79 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithDouble:", v39);
          v121 = v7;
          v80 = (void *)objc_claimAutoreleasedReturnValue();
          -[HKInteractiveChartDataFormatter majorFont](self, "majorFont");
          v81 = (void *)objc_claimAutoreleasedReturnValue();
          -[HKInteractiveChartDataFormatter minorFont](self, "minorFont");
          v82 = (void *)objc_claimAutoreleasedReturnValue();
          v62 = v130;
          -[HKSHSleepChartFormatter _rangeDataForInBedDuration:sleepDuration:awakeDuration:asleepCoreDuration:asleepDeepDuration:asleepREMDuration:overrideDuration:arePrefixColorsActive:statisticsType:valueFont:unitFont:formatterOptions:](self, "_rangeDataForInBedDuration:sleepDuration:awakeDuration:asleepCoreDuration:asleepDeepDuration:asleepREMDuration:overrideDuration:arePrefixColorsActive:statisticsType:valueFont:unitFont:formatterOptions:", v99, v135, v111, v95, v79, v80, 0, v130, v102, v81, v82, v115);
          v48 = (void *)objc_claimAutoreleasedReturnValue();

          v49 = v128;
          v22 = v118;

          v7 = v121;
          v61 = (void *)v135;
          v59 = (void *)v99;
          goto LABEL_37;
        }
        if (a4)
          goto LABEL_34;
        v125 = v49;
        objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithDouble:", v27);
        v63 = objc_claimAutoreleasedReturnValue();
        objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithDouble:", v47);
        v64 = objc_claimAutoreleasedReturnValue();
        -[HKInteractiveChartDataFormatter majorFont](self, "majorFont");
        v65 = (void *)objc_claimAutoreleasedReturnValue();
        -[HKInteractiveChartDataFormatter minorFont](self, "minorFont");
        v66 = v50;
        v67 = (void *)objc_claimAutoreleasedReturnValue();
        v68 = v51;
        v59 = (void *)v63;
        v69 = v63;
        v61 = (void *)v64;
        -[HKSHSleepChartFormatter _rangeDataForAverageInBedStartTime:averageInBedEndTime:averageSleepStartTime:averageSleepEndTime:inBedDuration:sleepDuration:calendar:firstDayStart:timeFont:amPmFont:formatterOptions:](self, "_rangeDataForAverageInBedStartTime:averageInBedEndTime:averageSleepStartTime:averageSleepEndTime:inBedDuration:sleepDuration:calendar:firstDayStart:timeFont:amPmFont:formatterOptions:", v107, v125, v66, v68, v69, v64, v106, v105, v65, v67, v119);
        v48 = (void *)objc_claimAutoreleasedReturnValue();

        v50 = v66;
        v49 = v125;
        goto LABEL_25;
      case 2:
        goto LABEL_34;
      case 3:
        if (a4 == 1)
          goto LABEL_42;
        if (a4)
          goto LABEL_34;
        -[HKInteractiveChartDataFormatter majorFont](self, "majorFont");
        v70 = objc_claimAutoreleasedReturnValue();
        -[HKInteractiveChartDataFormatter minorFont](self, "minorFont");
        v61 = (void *)objc_claimAutoreleasedReturnValue();
        v59 = (void *)v70;
        -[HKSHSleepChartFormatter _rangeDataForSleepScheduleWithSleepDaySummaries:timeFont:amPmFont:](self, "_rangeDataForSleepScheduleWithSleepDaySummaries:timeFont:amPmFont:", v118, v70, v61);
        v71 = objc_claimAutoreleasedReturnValue();
        goto LABEL_35;
      case 4:
        if (a4 == 1)
        {
LABEL_42:
          v129 = v49;
          objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithDouble:", v27);
          v83 = objc_claimAutoreleasedReturnValue();
          objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithDouble:", v47);
          v136 = objc_claimAutoreleasedReturnValue();
          objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithDouble:", v31);
          v112 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithDouble:", v35);
          v100 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithDouble:", v43);
          v96 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithDouble:", v39);
          v122 = v7;
          v84 = (void *)objc_claimAutoreleasedReturnValue();
          -[HKInteractiveChartDataFormatter majorFont](self, "majorFont");
          v85 = (void *)objc_claimAutoreleasedReturnValue();
          -[HKInteractiveChartDataFormatter minorFont](self, "minorFont");
          v86 = (void *)objc_claimAutoreleasedReturnValue();
          v62 = v130;
          v59 = (void *)v83;
          v87 = v83;
          v61 = (void *)v136;
          -[HKSHSleepChartFormatter _rangeDataForInBedDuration:sleepDuration:awakeDuration:asleepCoreDuration:asleepDeepDuration:asleepREMDuration:overrideDuration:arePrefixColorsActive:statisticsType:valueFont:unitFont:formatterOptions:](self, "_rangeDataForInBedDuration:sleepDuration:awakeDuration:asleepCoreDuration:asleepDeepDuration:asleepREMDuration:overrideDuration:arePrefixColorsActive:statisticsType:valueFont:unitFont:formatterOptions:", v87, v136, v112, v100, v96, v84, 0, v130, v102, v85, v86, v115);
          v48 = (void *)objc_claimAutoreleasedReturnValue();

          v49 = v129;
          v22 = v118;

          v7 = v122;
        }
        else
        {
          if (a4)
          {
LABEL_34:
            -[HKInteractiveChartDataFormatter majorFont](self, "majorFont");
            v74 = objc_claimAutoreleasedReturnValue();
            -[HKInteractiveChartDataFormatter minorFont](self, "minorFont");
            v61 = (void *)objc_claimAutoreleasedReturnValue();
            v59 = (void *)v74;
            -[HKSHSleepChartFormatter _rangeDataForDurationGoalWithSleepDaySummaries:valueFont:unitFont:](self, "_rangeDataForDurationGoalWithSleepDaySummaries:valueFont:unitFont:", v118, v74, v61);
            v71 = objc_claimAutoreleasedReturnValue();
LABEL_35:
            v48 = (void *)v71;
LABEL_36:
            v62 = v130;
            goto LABEL_37;
          }
          v117 = v50;
          v126 = v49;
          objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithDouble:", v27);
          v59 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithDouble:", v47);
          v61 = (void *)objc_claimAutoreleasedReturnValue();
          if ((v132 & ((v119 & 0x3C) == 0)) == 1)
          {
            -[HKInteractiveChartDataFormatter majorFont](self, "majorFont");
            v72 = (void *)objc_claimAutoreleasedReturnValue();
            -[HKInteractiveChartDataFormatter minorFont](self, "minorFont");
            v73 = (void *)objc_claimAutoreleasedReturnValue();
            -[HKSHSleepChartFormatter _rangeDataForAverageInBedStartTime:averageInBedEndTime:averageSleepStartTime:averageSleepEndTime:inBedDuration:sleepDuration:calendar:firstDayStart:timeFont:amPmFont:formatterOptions:](self, "_rangeDataForAverageInBedStartTime:averageInBedEndTime:averageSleepStartTime:averageSleepEndTime:inBedDuration:sleepDuration:calendar:firstDayStart:timeFont:amPmFont:formatterOptions:", v107, v126, v117, v103, v59, v61, v52, v105, v72, v73, v119);
            v48 = (void *)objc_claimAutoreleasedReturnValue();

            v50 = v117;
            v49 = v126;
LABEL_25:
            v22 = v118;
            goto LABEL_36;
          }
          objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithDouble:", v31);
          v137 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithDouble:", v35);
          v113 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithDouble:", v43);
          v101 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithDouble:", v39);
          v88 = v7;
          v89 = (void *)objc_claimAutoreleasedReturnValue();
          -[HKInteractiveChartDataFormatter majorFont](self, "majorFont");
          v90 = (void *)objc_claimAutoreleasedReturnValue();
          -[HKInteractiveChartDataFormatter minorFont](self, "minorFont");
          v91 = (void *)objc_claimAutoreleasedReturnValue();
          -[HKSHSleepChartFormatter _rangeDataForInBedDuration:sleepDuration:awakeDuration:asleepCoreDuration:asleepDeepDuration:asleepREMDuration:overrideDuration:arePrefixColorsActive:statisticsType:valueFont:unitFont:formatterOptions:](self, "_rangeDataForInBedDuration:sleepDuration:awakeDuration:asleepCoreDuration:asleepDeepDuration:asleepREMDuration:overrideDuration:arePrefixColorsActive:statisticsType:valueFont:unitFont:formatterOptions:", v59, v61, v137, v113, v101, v89, v104, v88, v102, v90, v91, v119);
          v48 = (void *)objc_claimAutoreleasedReturnValue();

          v7 = v88;
          v50 = v117;
          v22 = v118;
          v49 = v126;
          v62 = v130;
        }
LABEL_37:

        v51 = v103;
        v8 = v104;
LABEL_38:

        break;
      default:
        v62 = v130;
        goto LABEL_38;
    }
  }
  else
  {
    v48 = (void *)MEMORY[0x1E0C9AA60];
    v62 = v130;
  }

  return v48;
}

- (int64_t)_statisticsTypeForSummaries:(id)a3 calendar:(id)a4
{
  id v5;
  void *v6;
  uint64_t v7;
  void *v8;
  void *v9;
  void *v10;
  void *v11;
  uint64_t v12;
  void *v13;
  void *v14;
  uint64_t v15;
  int64_t v16;

  v5 = a4;
  objc_msgSend(MEMORY[0x1E0C99E60], "setWithArray:", a3);
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  v7 = objc_msgSend(v6, "count");
  if (v7 == 1)
  {
    objc_msgSend(v6, "allObjects");
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v8, "firstObject");
    v9 = (void *)objc_claimAutoreleasedReturnValue();

    objc_msgSend(v9, "dateInterval");
    v10 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v10, "startDate");
    v11 = (void *)objc_claimAutoreleasedReturnValue();
    v12 = objc_msgSend(v11, "hk_morningIndexWithCalendar:", v5);

    objc_msgSend(v9, "dateInterval");
    v13 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v13, "endDate");
    v14 = (void *)objc_claimAutoreleasedReturnValue();
    v15 = objc_msgSend(v14, "hk_morningIndexWithCalendar:", v5);

    v7 = v15 - v12;
  }
  if (v7 <= 1)
    v16 = 0;
  else
    v16 = 3;

  return v16;
}

- (id)_rangeDataForInBedDuration:(id)a3 sleepDuration:(id)a4 awakeDuration:(id)a5 asleepCoreDuration:(id)a6 asleepDeepDuration:(id)a7 asleepREMDuration:(id)a8 overrideDuration:(id)a9 arePrefixColorsActive:(id)a10 statisticsType:(int64_t)a11 valueFont:(id)a12 unitFont:(id)a13 formatterOptions:(unint64_t)a14
{
  id v19;
  id v20;
  id v21;
  id v22;
  id v23;
  id v24;
  id v25;
  id v26;
  double v27;
  id v28;
  void *v29;
  double v30;
  id v31;
  void *v32;
  double v33;
  id v34;
  void *v35;
  double v36;
  id v37;
  void *v38;
  double v39;
  id v40;
  void *v41;
  double v42;
  id v43;
  void *v44;
  id v46;
  id v47;
  id v48;

  v19 = a3;
  v48 = a4;
  v47 = a5;
  v46 = a6;
  v20 = a7;
  v21 = a8;
  v22 = a9;
  v23 = a10;
  v24 = a12;
  v25 = a13;
  v26 = objc_alloc_init(MEMORY[0x1E0C99DE8]);
  objc_msgSend(v19, "doubleValue");
  if ((a14 & 1) != 0 && v27 > 0.0)
  {
    if (v22)
      v28 = v22;
    else
      v28 = v19;
    -[HKSHSleepChartFormatter _rangeDataForDurationValue:dataType:sleepValue:isPrefixColorActive:valueFont:unitFont:statisticsType:formatterOptions:](self, "_rangeDataForDurationValue:dataType:sleepValue:isPrefixColorActive:valueFont:unitFont:statisticsType:formatterOptions:", v28, 9, 0, v23, v24, v25, a11, a14);
    v29 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v26, "addObject:", v29);

  }
  objc_msgSend(v48, "doubleValue");
  if ((a14 & 2) != 0 && v30 > 0.0)
  {
    if (v22)
      v31 = v22;
    else
      v31 = v48;
    -[HKSHSleepChartFormatter _rangeDataForDurationValue:dataType:sleepValue:isPrefixColorActive:valueFont:unitFont:statisticsType:formatterOptions:](self, "_rangeDataForDurationValue:dataType:sleepValue:isPrefixColorActive:valueFont:unitFont:statisticsType:formatterOptions:", v31, 10, _HKCategoryValueSleepAnalysisDefaultAsleepValue(), v23, v24, v25, a11, a14);
    v32 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v26, "addObject:", v32);

  }
  objc_msgSend(v47, "doubleValue");
  if ((a14 & 4) != 0 && v33 > 0.0)
  {
    if (v22)
      v34 = v22;
    else
      v34 = v47;
    -[HKSHSleepChartFormatter _rangeDataForDurationValue:dataType:sleepValue:isPrefixColorActive:valueFont:unitFont:statisticsType:formatterOptions:](self, "_rangeDataForDurationValue:dataType:sleepValue:isPrefixColorActive:valueFont:unitFont:statisticsType:formatterOptions:", v34, 24, 2, v23, v24, v25, a11, a14);
    v35 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v26, "addObject:", v35);

  }
  objc_msgSend(v46, "doubleValue");
  if ((a14 & 0x10) != 0 && v36 > 0.0)
  {
    if (v22)
      v37 = v22;
    else
      v37 = v46;
    -[HKSHSleepChartFormatter _rangeDataForDurationValue:dataType:sleepValue:isPrefixColorActive:valueFont:unitFont:statisticsType:formatterOptions:](self, "_rangeDataForDurationValue:dataType:sleepValue:isPrefixColorActive:valueFont:unitFont:statisticsType:formatterOptions:", v37, 25, 3, v23, v24, v25, a11, a14);
    v38 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v26, "addObject:", v38);

  }
  objc_msgSend(v20, "doubleValue");
  if ((a14 & 0x20) != 0 && v39 > 0.0)
  {
    if (v22)
      v40 = v22;
    else
      v40 = v20;
    -[HKSHSleepChartFormatter _rangeDataForDurationValue:dataType:sleepValue:isPrefixColorActive:valueFont:unitFont:statisticsType:formatterOptions:](self, "_rangeDataForDurationValue:dataType:sleepValue:isPrefixColorActive:valueFont:unitFont:statisticsType:formatterOptions:", v40, 26, 4, v23, v24, v25, a11, a14);
    v41 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v26, "addObject:", v41);

  }
  objc_msgSend(v21, "doubleValue");
  if ((a14 & 8) != 0 && v42 > 0.0)
  {
    if (v22)
      v43 = v22;
    else
      v43 = v21;
    -[HKSHSleepChartFormatter _rangeDataForDurationValue:dataType:sleepValue:isPrefixColorActive:valueFont:unitFont:statisticsType:formatterOptions:](self, "_rangeDataForDurationValue:dataType:sleepValue:isPrefixColorActive:valueFont:unitFont:statisticsType:formatterOptions:", v43, 27, 5, v23, v24, v25, a11, a14);
    v44 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v26, "addObject:", v44);

  }
  return v26;
}

- (id)_rangeDataForDurationValue:(id)a3 dataType:(int64_t)a4 sleepValue:(int64_t)a5 isPrefixColorActive:(id)a6 valueFont:(id)a7 unitFont:(id)a8 statisticsType:(int64_t)a9 formatterOptions:(unint64_t)a10
{
  id v14;
  id v15;
  void *v16;
  void *v17;
  void *v18;
  void *v19;
  void *v20;

  v14 = a6;
  v15 = a3;
  HKTimePeriodStringWithFonts();
  v16 = (void *)objc_claimAutoreleasedReturnValue();
  v17 = (void *)objc_msgSend(v16, "mutableCopy");

  v18 = (void *)objc_msgSend(objc_alloc(MEMORY[0x1E0D2F840]), "initWithStatisticsType:", a9);
  objc_msgSend(v18, "setDataType:", a4);
  objc_msgSend(v18, "setAttributedString:", v17);
  objc_msgSend(v18, "setValueAsNumber:", v15);

  objc_msgSend(v18, "setPrefersImageAffixes:", (a10 & 0x40) == 0);
  -[HKSHSleepChartFormatter _prefixColorForSleepValue:isPrefixColorActive:](self, "_prefixColorForSleepValue:isPrefixColorActive:", a5, v14);
  v19 = (void *)objc_claimAutoreleasedReturnValue();

  objc_msgSend(v18, "setPrefixColor:", v19);
  if ((a10 & 0x80) != 0)
  {
    -[HKSHSleepChartFormatter _longTitleForSelectedRangeDataType:statisticsType:](self, "_longTitleForSelectedRangeDataType:statisticsType:", a4, a9);
    v20 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v18, "setTitleOverride:", v20);

  }
  return v18;
}

- (id)_rangeDataForDurationGoalWithSleepDaySummaries:(id)a3 valueFont:(id)a4 unitFont:(id)a5
{
  id v8;
  id v9;
  void *v10;
  void *v11;
  void *v12;
  void *v13;
  void *v14;
  void *v15;
  void *v16;
  _QWORD v18[2];

  v18[1] = *MEMORY[0x1E0C80C00];
  v8 = a4;
  v9 = a5;
  -[HKSHSleepChartFormatter _lastSleepGoalForSummaries:](self, "_lastSleepGoalForSummaries:", a3);
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  v11 = (void *)objc_msgSend(objc_alloc(MEMORY[0x1E0D2F840]), "initWithStatisticsType:", 0);
  objc_msgSend(v11, "setDataType:", 13);
  if (v10)
  {
    HKTimePeriodStringWithFonts();
    v12 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v11, "setAttributedString:", v12);

    objc_msgSend(v11, "setValueAsNumber:", v10);
  }
  else
  {
    objc_msgSend(MEMORY[0x1E0CB34D0], "bundleWithIdentifier:", CFSTR("com.apple.HealthUI"));
    v13 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v13, "localizedStringForKey:value:table:", CFSTR("SLEEP_NO_GOAL_CONTEXT"), &stru_1E55DF628, CFSTR("HealthUI-Localizable-Eucalyptus"));
    v14 = (void *)objc_claimAutoreleasedReturnValue();
    -[HKSHSleepChartFormatter _attributedValueString:valueFont:](self, "_attributedValueString:valueFont:", v14, v8);
    v15 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v11, "setAttributedString:", v15);

  }
  v18[0] = v11;
  objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", v18, 1);
  v16 = (void *)objc_claimAutoreleasedReturnValue();

  return v16;
}

- (id)_rangeDataForSleepScheduleWithSleepDaySummaries:(id)a3 timeFont:(id)a4 amPmFont:(id)a5
{
  id v8;
  void *v9;
  void *v10;
  void *v11;
  void *v12;
  void *v13;
  void *v14;
  void **v15;
  void *v16;
  void *v17;
  void *v18;
  void *v19;
  void *v20;
  void *v21;
  void *v22;
  void *v23;
  _QWORD v25[2];
  void *v26;
  _QWORD v27[2];

  v27[1] = *MEMORY[0x1E0C80C00];
  v8 = a4;
  -[HKSHSleepChartFormatter _localizedSchedulesFromSummaries:timeFont:amPmFont:](self, "_localizedSchedulesFromSummaries:timeFont:amPmFont:", a3, v8, a5);
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  if (objc_msgSend(v9, "count"))
  {
    if ((unint64_t)objc_msgSend(v9, "count") < 2)
    {
      objc_msgSend(v9, "anyObject");
      v10 = (void *)objc_claimAutoreleasedReturnValue();
      v20 = (void *)objc_msgSend(objc_alloc(MEMORY[0x1E0D2F840]), "initWithStatisticsType:", 0);
      objc_msgSend(v20, "setDataType:", 14);
      objc_msgSend(v10, "localizedBedTime");
      v21 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v20, "setAttributedString:", v21);

      v22 = (void *)objc_msgSend(objc_alloc(MEMORY[0x1E0D2F840]), "initWithStatisticsType:", 0);
      objc_msgSend(v22, "setDataType:", 15);
      objc_msgSend(v10, "localizedWakeTime");
      v23 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v22, "setAttributedString:", v23);

      v25[0] = v20;
      v25[1] = v22;
      objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", v25, 2);
      v19 = (void *)objc_claimAutoreleasedReturnValue();

      goto LABEL_7;
    }
    v10 = (void *)objc_msgSend(objc_alloc(MEMORY[0x1E0D2F840]), "initWithStatisticsType:", 0);
    objc_msgSend(v10, "setDataType:", 0);
    objc_msgSend(MEMORY[0x1E0CB34D0], "bundleWithIdentifier:", CFSTR("com.apple.HealthUI"));
    v11 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v11, "localizedStringForKey:value:table:", CFSTR("SLEEP_MULTIPLE_SCHEDULES"), &stru_1E55DF628, CFSTR("HealthUI-Localizable-Eucalyptus"));
    v12 = (void *)objc_claimAutoreleasedReturnValue();
    -[HKSHSleepChartFormatter _attributedValueString:valueFont:](self, "_attributedValueString:valueFont:", v12, v8);
    v13 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v10, "setAttributedString:", v13);

    v26 = v10;
    v14 = (void *)MEMORY[0x1E0C99D20];
    v15 = &v26;
  }
  else
  {
    v10 = (void *)objc_msgSend(objc_alloc(MEMORY[0x1E0D2F840]), "initWithStatisticsType:", 0);
    objc_msgSend(v10, "setDataType:", 0);
    objc_msgSend(MEMORY[0x1E0CB34D0], "bundleWithIdentifier:", CFSTR("com.apple.HealthUI"));
    v16 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v16, "localizedStringForKey:value:table:", CFSTR("SLEEP_NO_SCHEDULE"), &stru_1E55DF628, CFSTR("HealthUI-Localizable-Eucalyptus"));
    v17 = (void *)objc_claimAutoreleasedReturnValue();
    -[HKSHSleepChartFormatter _attributedValueString:valueFont:](self, "_attributedValueString:valueFont:", v17, v8);
    v18 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v10, "setAttributedString:", v18);

    v27[0] = v10;
    v14 = (void *)MEMORY[0x1E0C99D20];
    v15 = (void **)v27;
  }
  objc_msgSend(v14, "arrayWithObjects:count:", v15, 1);
  v19 = (void *)objc_claimAutoreleasedReturnValue();
LABEL_7:

  return v19;
}

- (id)_rangeDataForAverageInBedStartTime:(id)a3 averageInBedEndTime:(id)a4 averageSleepStartTime:(id)a5 averageSleepEndTime:(id)a6 inBedDuration:(id)a7 sleepDuration:(id)a8 calendar:(id)a9 firstDayStart:(id)a10 timeFont:(id)a11 amPmFont:(id)a12 formatterOptions:(unint64_t)a13
{
  uint64_t v18;
  unint64_t v19;
  uint64_t v20;
  unint64_t v21;
  id v22;
  id v23;
  id v24;
  id v25;
  id v26;
  id v27;
  double v28;
  char v29;
  void *v30;
  unint64_t v31;
  void *v32;
  double v33;
  unint64_t v34;
  BOOL v35;
  char v36;
  id v37;
  void *v38;
  void *v39;
  void *v40;
  void *v41;
  id v42;
  void *v43;
  void *v44;
  void *v45;
  void *v46;
  void *v47;
  void *v48;
  void *v49;
  id v50;
  void *v51;
  void *v52;
  id v55;
  id v56;
  uint64_t v57;
  uint64_t v58;
  id v59;
  _QWORD v60[2];

  v60[1] = *MEMORY[0x1E0C80C00];
  v18 = (uint64_t)a3;
  v19 = (unint64_t)a4;
  v20 = (uint64_t)a5;
  v21 = (unint64_t)a6;
  v22 = a7;
  v23 = a8;
  v24 = a9;
  v25 = a10;
  v26 = a11;
  v59 = a12;
  v56 = v22;
  v57 = v18;
  v27 = (id)v19;
  if (v18 | v19 && (objc_msgSend(v22, "doubleValue"), v28 > 0.0))
    v29 = a13 & 1;
  else
    v29 = 0;
  v30 = (void *)v21;
  v31 = v20 | v21;
  v32 = v27;
  v58 = v20;
  if (v31 && (objc_msgSend(v23, "doubleValue"), v33 > 0.0))
  {
    v34 = (a13 >> 1) & 1;
    if ((v29 & 1) == 0)
      goto LABEL_8;
  }
  else
  {
    LODWORD(v34) = 0;
    if ((v29 & 1) == 0)
    {
LABEL_8:
      if (v24)
        v35 = v25 == 0;
      else
        v35 = 1;
      if (v35)
        v36 = 0;
      else
        v36 = v34;
      if ((v36 & 1) == 0)
        goto LABEL_21;
LABEL_19:
      v37 = objc_alloc_init(MEMORY[0x1E0C99DE8]);
      if ((_DWORD)v34)
      {
        v55 = v23;
        v38 = (void *)objc_msgSend(objc_alloc(MEMORY[0x1E0D2F840]), "initWithStatisticsType:", 0);
        objc_msgSend(v38, "setDataType:", 16);
        HKSHLocalizedTimeForComponents(v58, v24, (uint64_t)v25, v26, v59);
        v39 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v38, "setAttributedString:", v39);

        objc_msgSend(v37, "addObject:", v38);
        v40 = (void *)objc_msgSend(objc_alloc(MEMORY[0x1E0D2F840]), "initWithStatisticsType:", 0);
        objc_msgSend(v40, "setDataType:", 17);
        HKSHLocalizedTimeForComponents((uint64_t)v30, v24, (uint64_t)v25, v26, v59);
        v41 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v40, "setAttributedString:", v41);

        objc_msgSend(v37, "addObject:", v40);
        v18 = v57;
      }
      else
      {
        if (v18)
        {
          v49 = (void *)objc_msgSend(objc_alloc(MEMORY[0x1E0D2F840]), "initWithStatisticsType:", 0);
          objc_msgSend(v49, "setDataType:", 18);
          HKSHLocalizedTimeForComponents(v18, v24, (uint64_t)v25, v26, v59);
          v50 = v23;
          v51 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v49, "setAttributedString:", v51);

          v23 = v50;
          objc_msgSend(v37, "addObject:", v49);

        }
        if (!v32)
          goto LABEL_22;
        v55 = v23;
        v38 = (void *)objc_msgSend(objc_alloc(MEMORY[0x1E0D2F840]), "initWithStatisticsType:", 0);
        objc_msgSend(v38, "setDataType:", 19);
        HKSHLocalizedTimeForComponents((uint64_t)v32, v24, (uint64_t)v25, v26, v59);
        v52 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v38, "setAttributedString:", v52);

        objc_msgSend(v37, "addObject:", v38);
      }

      v47 = (void *)v58;
      v23 = v55;
      v48 = v56;
      goto LABEL_28;
    }
  }
  if (v24 && v25)
    goto LABEL_19;
LABEL_21:
  v42 = v23;
  v43 = (void *)objc_msgSend(objc_alloc(MEMORY[0x1E0D2F840]), "initWithStatisticsType:", 0);
  objc_msgSend(v43, "setDataType:", 0);
  objc_msgSend(MEMORY[0x1E0CB34D0], "bundleWithIdentifier:", CFSTR("com.apple.HealthUI"));
  v44 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v44, "localizedStringForKey:value:table:", CFSTR("SLEEP_NO_TIMES"), &stru_1E55DF628, CFSTR("HealthUI-Localizable-Eucalyptus"));
  v45 = (void *)objc_claimAutoreleasedReturnValue();
  -[HKSHSleepChartFormatter _attributedValueString:valueFont:](self, "_attributedValueString:valueFont:", v45, v26);
  v46 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v43, "setAttributedString:", v46);

  v60[0] = v43;
  objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", v60, 1);
  v37 = (id)objc_claimAutoreleasedReturnValue();

  v23 = v42;
  v18 = v57;
LABEL_22:
  v47 = (void *)v58;
  v48 = v56;
LABEL_28:

  return v37;
}

- (id)_lastSleepGoalForSummaries:(id)a3
{
  id v3;
  uint64_t v4;
  uint64_t v5;
  void *v6;
  uint64_t v7;
  uint64_t i;
  void *v9;
  void *v10;
  void *v11;
  void *v12;
  void *v13;
  uint64_t v14;
  __int128 v16;
  __int128 v17;
  __int128 v18;
  __int128 v19;
  _BYTE v20[128];
  uint64_t v21;

  v21 = *MEMORY[0x1E0C80C00];
  v3 = a3;
  v16 = 0u;
  v17 = 0u;
  v18 = 0u;
  v19 = 0u;
  v4 = objc_msgSend(v3, "countByEnumeratingWithState:objects:count:", &v16, v20, 16);
  if (v4)
  {
    v5 = v4;
    v6 = 0;
    v7 = *(_QWORD *)v17;
    do
    {
      for (i = 0; i != v5; ++i)
      {
        if (*(_QWORD *)v17 != v7)
          objc_enumerationMutation(v3);
        v9 = *(void **)(*((_QWORD *)&v16 + 1) + 8 * i);
        objc_msgSend(v9, "sleepDurationGoal");
        v10 = (void *)objc_claimAutoreleasedReturnValue();

        if (v10)
        {
          v11 = (void *)MEMORY[0x1E0CB37E8];
          objc_msgSend(v9, "sleepDurationGoal");
          v12 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(MEMORY[0x1E0CB6CD0], "secondUnit");
          v13 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v12, "doubleValueForUnit:", v13);
          objc_msgSend(v11, "numberWithDouble:");
          v14 = objc_claimAutoreleasedReturnValue();

          v6 = (void *)v14;
        }
      }
      v5 = objc_msgSend(v3, "countByEnumeratingWithState:objects:count:", &v16, v20, 16);
    }
    while (v5);
  }
  else
  {
    v6 = 0;
  }

  return v6;
}

- (id)_firstCalendarForSummaries:(id)a3
{
  id v3;
  void *v4;
  uint64_t v5;
  void *i;
  void *v7;
  void *v8;
  __int128 v10;
  __int128 v11;
  __int128 v12;
  __int128 v13;
  _BYTE v14[128];
  uint64_t v15;

  v15 = *MEMORY[0x1E0C80C00];
  v10 = 0u;
  v11 = 0u;
  v12 = 0u;
  v13 = 0u;
  v3 = a3;
  v4 = (void *)objc_msgSend(v3, "countByEnumeratingWithState:objects:count:", &v10, v14, 16);
  if (v4)
  {
    v5 = *(_QWORD *)v11;
    while (2)
    {
      for (i = 0; i != v4; i = (char *)i + 1)
      {
        if (*(_QWORD *)v11 != v5)
          objc_enumerationMutation(v3);
        v7 = *(void **)(*((_QWORD *)&v10 + 1) + 8 * (_QWORD)i);
        objc_msgSend(v7, "calendar", (_QWORD)v10);
        v8 = (void *)objc_claimAutoreleasedReturnValue();

        if (v8)
        {
          objc_msgSend(v7, "calendar");
          v4 = (void *)objc_claimAutoreleasedReturnValue();
          goto LABEL_11;
        }
      }
      v4 = (void *)objc_msgSend(v3, "countByEnumeratingWithState:objects:count:", &v10, v14, 16);
      if (v4)
        continue;
      break;
    }
  }
LABEL_11:

  return v4;
}

- (id)_firstDateForSummaries:(id)a3
{
  id v3;
  void *v4;
  uint64_t v5;
  void *i;
  void *v7;
  void *v8;
  void *v9;
  void *v10;
  __int128 v12;
  __int128 v13;
  __int128 v14;
  __int128 v15;
  _BYTE v16[128];
  uint64_t v17;

  v17 = *MEMORY[0x1E0C80C00];
  v12 = 0u;
  v13 = 0u;
  v14 = 0u;
  v15 = 0u;
  v3 = a3;
  v4 = (void *)objc_msgSend(v3, "countByEnumeratingWithState:objects:count:", &v12, v16, 16);
  if (v4)
  {
    v5 = *(_QWORD *)v13;
    while (2)
    {
      for (i = 0; i != v4; i = (char *)i + 1)
      {
        if (*(_QWORD *)v13 != v5)
          objc_enumerationMutation(v3);
        v7 = *(void **)(*((_QWORD *)&v12 + 1) + 8 * (_QWORD)i);
        objc_msgSend(v7, "dateInterval", (_QWORD)v12);
        v8 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v8, "startDate");
        v9 = (void *)objc_claimAutoreleasedReturnValue();

        if (v9)
        {
          objc_msgSend(v7, "dateInterval");
          v10 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v10, "startDate");
          v4 = (void *)objc_claimAutoreleasedReturnValue();

          goto LABEL_11;
        }
      }
      v4 = (void *)objc_msgSend(v3, "countByEnumeratingWithState:objects:count:", &v12, v16, 16);
      if (v4)
        continue;
      break;
    }
  }
LABEL_11:

  return v4;
}

- (id)_localizedSchedulesFromSummaries:(id)a3 timeFont:(id)a4 amPmFont:(id)a5
{
  id v7;
  id v8;
  uint64_t v9;
  void *v10;
  void *v11;
  void *v12;
  void *v13;
  uint64_t v14;
  uint64_t v15;
  uint64_t v16;
  uint64_t i;
  void *v18;
  uint64_t v19;
  void *v20;
  void *v21;
  _HKSHLocalizedSleepSchedule *v22;
  void *v23;
  _HKSHLocalizedSleepSchedule *v24;
  id obj;
  uint64_t v27;
  uint64_t v28;
  uint64_t v29;
  id v30;
  id v31;
  __int128 v32;
  __int128 v33;
  __int128 v34;
  __int128 v35;
  __int128 v36;
  __int128 v37;
  __int128 v38;
  __int128 v39;
  _BYTE v40[128];
  _BYTE v41[128];
  uint64_t v42;

  v42 = *MEMORY[0x1E0C80C00];
  v7 = a3;
  v31 = a4;
  v8 = a5;
  v30 = objc_alloc_init(MEMORY[0x1E0C99E20]);
  v36 = 0u;
  v37 = 0u;
  v38 = 0u;
  v39 = 0u;
  obj = v7;
  v28 = objc_msgSend(obj, "countByEnumeratingWithState:objects:count:", &v36, v41, 16);
  if (v28)
  {
    v27 = *(_QWORD *)v37;
    do
    {
      v9 = 0;
      do
      {
        if (*(_QWORD *)v37 != v27)
          objc_enumerationMutation(obj);
        v29 = v9;
        v10 = *(void **)(*((_QWORD *)&v36 + 1) + 8 * v9);
        objc_msgSend(v10, "dateInterval");
        v11 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v11, "startDate");
        v12 = (void *)objc_claimAutoreleasedReturnValue();

        v34 = 0u;
        v35 = 0u;
        v32 = 0u;
        v33 = 0u;
        objc_msgSend(v10, "schedules");
        v13 = (void *)objc_claimAutoreleasedReturnValue();
        v14 = objc_msgSend(v13, "countByEnumeratingWithState:objects:count:", &v32, v40, 16);
        if (v14)
        {
          v15 = v14;
          v16 = *(_QWORD *)v33;
          do
          {
            for (i = 0; i != v15; ++i)
            {
              if (*(_QWORD *)v33 != v16)
                objc_enumerationMutation(v13);
              v18 = *(void **)(*((_QWORD *)&v32 + 1) + 8 * i);
              objc_msgSend(v18, "bedTimeComponents");
              v19 = objc_claimAutoreleasedReturnValue();
              if (v19)
              {
                v20 = (void *)v19;
                objc_msgSend(v18, "wakeTimeComponents");
                v21 = (void *)objc_claimAutoreleasedReturnValue();

                if (v21)
                {
                  v22 = [_HKSHLocalizedSleepSchedule alloc];
                  objc_msgSend(v10, "calendar");
                  v23 = (void *)objc_claimAutoreleasedReturnValue();
                  v24 = -[_HKSHLocalizedSleepSchedule initWithSleepSchedule:calendar:dayStart:timeFont:amPmFont:](v22, "initWithSleepSchedule:calendar:dayStart:timeFont:amPmFont:", v18, v23, v12, v31, v8);

                  objc_msgSend(v30, "addObject:", v24);
                }
              }
            }
            v15 = objc_msgSend(v13, "countByEnumeratingWithState:objects:count:", &v32, v40, 16);
          }
          while (v15);
        }

        v9 = v29 + 1;
      }
      while (v29 + 1 != v28);
      v28 = objc_msgSend(obj, "countByEnumeratingWithState:objects:count:", &v36, v41, 16);
    }
    while (v28);
  }

  return v30;
}

- (id)_attributedValueString:(id)a3 valueFont:(id)a4
{
  void *v5;
  id v6;
  id v7;
  void *v8;
  id v9;
  void *v10;
  uint64_t v12;
  _QWORD v13[2];

  v13[1] = *MEMORY[0x1E0C80C00];
  v12 = *MEMORY[0x1E0DC1138];
  v13[0] = a4;
  v5 = (void *)MEMORY[0x1E0C99D80];
  v6 = a4;
  v7 = a3;
  objc_msgSend(v5, "dictionaryWithObjects:forKeys:count:", v13, &v12, 1);
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  v9 = objc_alloc(MEMORY[0x1E0CB3498]);

  v10 = (void *)objc_msgSend(v9, "initWithString:attributes:", v7, v8);
  return v10;
}

- (id)_longTitleForSelectedRangeDataType:(int64_t)a3 statisticsType:(int64_t)a4
{
  void *v4;
  void *v5;
  void *v6;
  const __CFString *v7;
  void *v8;

  if (a4)
    goto LABEL_2;
  if (a3 == 10)
  {
    objc_msgSend(MEMORY[0x1E0CB34D0], "bundleWithIdentifier:", CFSTR("com.apple.HealthUI"));
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    v6 = v5;
    v7 = CFSTR("TIME_ASLEEP");
    goto LABEL_7;
  }
  if (a3 == 9)
  {
    objc_msgSend(MEMORY[0x1E0CB34D0], "bundleWithIdentifier:", CFSTR("com.apple.HealthUI"));
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    v6 = v5;
    v7 = CFSTR("TIME_IN_BED");
LABEL_7:
    objc_msgSend(v5, "localizedStringForKey:value:table:", v7, &stru_1E55DF628, CFSTR("HealthUI-Localizable"));
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v8, "localizedUppercaseString");
    v4 = (void *)objc_claimAutoreleasedReturnValue();

    return v4;
  }
LABEL_2:
  v4 = 0;
  return v4;
}

- (id)_prefixColorForSleepValue:(int64_t)a3 isPrefixColorActive:(id)a4
{
  id v5;
  void *v6;
  void *v7;

  v5 = a4;
  v6 = v5;
  if (v5)
  {
    if ((objc_msgSend(v5, "BOOLValue") & 1) != 0)
      objc_msgSend(MEMORY[0x1E0DC3658], "hk_sleepColorForSleepAnalysis:", a3);
    else
      objc_msgSend(MEMORY[0x1E0DC3658], "hk_sleepInactiveColorForSleepAnalysis:", a3);
    v7 = (void *)objc_claimAutoreleasedReturnValue();
  }
  else
  {
    v7 = 0;
  }

  return v7;
}

- (HKHealthStore)healthStore
{
  return self->_healthStore;
}

- (void)setHealthStore:(id)a3
{
  objc_storeStrong((id *)&self->_healthStore, a3);
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_healthStore, 0);
}

@end
