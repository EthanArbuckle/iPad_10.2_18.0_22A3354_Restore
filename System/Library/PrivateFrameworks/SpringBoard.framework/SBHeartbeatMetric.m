@implementation SBHeartbeatMetric

- (BOOL)handleEvent:(unint64_t)a3 withContext:(id)a4
{
  void *v6;
  void *v7;

  if (a3 == 11)
  {
    -[SBHeartbeatMetricPersistence metricsByDatestamp](self->_heartbeatMetricPersistence, "metricsByDatestamp", 11, a4);
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    -[SBHeartbeatMetric _makePayloadFromMetricsByDatestamp:](self, "_makePayloadFromMetricsByDatestamp:", v6);
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    -[SBHeartbeatMetric sendCoreAnalyticsEventWithName:payload:](self, "sendCoreAnalyticsEventWithName:payload:", CFSTR("com.apple.SpringBoard.Analytics.Heartbeat"), v7);

  }
  return a3 == 11;
}

- (SBHeartbeatMetric)initWithPersistence:(id)a3
{
  id v5;
  SBHeartbeatMetric *v6;
  SBHeartbeatMetric *v7;
  objc_super v9;

  v5 = a3;
  v9.receiver = self;
  v9.super_class = (Class)SBHeartbeatMetric;
  v6 = -[SBHeartbeatMetric init](&v9, sel_init);
  v7 = v6;
  if (v6)
    objc_storeStrong((id *)&v6->_heartbeatMetricPersistence, a3);

  return v7;
}

- (BOOL)sendCoreAnalyticsEventWithName:(id)a3 payload:(id)a4
{
  id v4;
  char v5;
  id v7;

  v7 = a4;
  v4 = v7;
  v5 = AnalyticsSendEventLazy();

  return v5;
}

id __60__SBHeartbeatMetric_sendCoreAnalyticsEventWithName_payload___block_invoke(uint64_t a1)
{
  return *(id *)(a1 + 32);
}

- (id)_makePayloadFromMetricsByDatestamp:(id)a3
{
  id v4;
  void *v5;
  void *v6;
  void *v7;
  id v8;
  uint64_t v9;
  uint64_t v10;
  uint64_t v11;
  uint64_t i;
  void *v13;
  void *v14;
  void *v15;
  void *v16;
  void *v17;
  uint64_t v18;
  uint64_t v19;
  uint64_t v20;
  uint64_t j;
  uint64_t v22;
  void *v23;
  void *v24;
  void *v25;
  uint64_t v26;
  uint64_t v27;
  uint64_t v28;
  uint64_t k;
  uint64_t v30;
  void *v31;
  void *v32;
  void *v33;
  uint64_t v34;
  uint64_t v35;
  void *v36;
  void *v37;
  void *v38;
  uint64_t v39;
  uint64_t v40;
  id v41;
  uint64_t m;
  uint64_t v43;
  void *v44;
  uint64_t v45;
  void *v46;
  void *v47;
  uint64_t v48;
  uint64_t v49;
  void *v50;
  void *v51;
  void *v52;
  uint64_t v53;
  uint64_t v54;
  void *v55;
  void *v56;
  void *v57;
  uint64_t v58;
  void *v59;
  void *v60;
  uint64_t v61;
  uint64_t v62;
  uint64_t v63;
  uint64_t n;
  uint64_t v65;
  void *v66;
  double v67;
  double v68;
  void *v69;
  void *v70;
  double v71;
  double v72;
  void *v73;
  void *v74;
  void *v75;
  double v76;
  double v77;
  void *v78;
  void *v79;
  void *v80;
  double v81;
  double v82;
  void *v83;
  void *v84;
  uint64_t v85;
  uint64_t v86;
  uint64_t v87;
  uint64_t ii;
  void *v89;
  void *v90;
  double v91;
  double v92;
  uint64_t v93;
  double v94;
  void *v95;
  void *v97;
  id v98;
  id v99;
  id v100;
  uint64_t v101;
  void *v102;
  uint64_t v103;
  uint64_t v104;
  void *v105;
  void *v106;
  id obj;
  id obja;
  id v109;
  void *v110;
  void *v111;
  void *v112;
  void *v113;
  id v114;
  __int128 v115;
  __int128 v116;
  __int128 v117;
  __int128 v118;
  __int128 v119;
  __int128 v120;
  __int128 v121;
  __int128 v122;
  __int128 v123;
  __int128 v124;
  __int128 v125;
  __int128 v126;
  __int128 v127;
  __int128 v128;
  __int128 v129;
  __int128 v130;
  __int128 v131;
  __int128 v132;
  __int128 v133;
  __int128 v134;
  __int128 v135;
  __int128 v136;
  __int128 v137;
  __int128 v138;
  __int128 v139;
  __int128 v140;
  __int128 v141;
  __int128 v142;
  _BYTE v143[128];
  _BYTE v144[128];
  _BYTE v145[128];
  _BYTE v146[128];
  _BYTE v147[128];
  _BYTE v148[128];
  _BYTE v149[128];
  uint64_t v150;

  v150 = *MEMORY[0x1E0C80C00];
  v4 = a3;
  -[SBHeartbeatMetric calendar](self, "calendar");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  -[SBHeartbeatMetric dateFormatter](self, "dateFormatter");
  v102 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(MEMORY[0x1E0C99D68], "date");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "startOfDayForDate:", v6);
  v7 = (void *)objc_claimAutoreleasedReturnValue();

  objc_msgSend(v5, "dateByAddingUnit:value:toDate:options:", 16, -1, v7, 0);
  v113 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "dateByAddingUnit:value:toDate:options:", 16, -7, v7, 0);
  v112 = (void *)objc_claimAutoreleasedReturnValue();
  v97 = v5;
  objc_msgSend(v5, "dateByAddingUnit:value:toDate:options:", 16, -30, v7, 0);
  v111 = (void *)objc_claimAutoreleasedReturnValue();
  v109 = objc_alloc_init(MEMORY[0x1E0C99E20]);
  v8 = objc_alloc_init(MEMORY[0x1E0C99E20]);
  v139 = 0u;
  v140 = 0u;
  v141 = 0u;
  v142 = 0u;
  v105 = v4;
  objc_msgSend(v4, "allKeys");
  obj = (id)objc_claimAutoreleasedReturnValue();
  v9 = objc_msgSend(obj, "countByEnumeratingWithState:objects:count:", &v139, v149, 16);
  if (v9)
  {
    v10 = v9;
    v11 = *(_QWORD *)v140;
    do
    {
      for (i = 0; i != v10; ++i)
      {
        if (*(_QWORD *)v140 != v11)
          objc_enumerationMutation(obj);
        objc_msgSend(v105, "objectForKey:", *(_QWORD *)(*((_QWORD *)&v139 + 1) + 8 * i));
        v13 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v13, "objectForKey:", CFSTR("Counts"));
        v14 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v13, "objectForKey:", CFSTR("Durations"));
        v15 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v14, "allKeys");
        v16 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v109, "addObjectsFromArray:", v16);

        objc_msgSend(v15, "allKeys");
        v17 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v8, "addObjectsFromArray:", v17);

      }
      v10 = objc_msgSend(obj, "countByEnumeratingWithState:objects:count:", &v139, v149, 16);
    }
    while (v10);
  }

  v114 = objc_alloc_init(MEMORY[0x1E0C99E08]);
  v135 = 0u;
  v136 = 0u;
  v137 = 0u;
  v138 = 0u;
  v100 = v109;
  v18 = objc_msgSend(v100, "countByEnumeratingWithState:objects:count:", &v135, v148, 16);
  if (v18)
  {
    v19 = v18;
    v20 = *(_QWORD *)v136;
    do
    {
      for (j = 0; j != v19; ++j)
      {
        if (*(_QWORD *)v136 != v20)
          objc_enumerationMutation(v100);
        v22 = *(_QWORD *)(*((_QWORD *)&v135 + 1) + 8 * j);
        objc_msgSend(MEMORY[0x1E0CB3940], "stringWithFormat:", CFSTR("%@CountTrailing1Day"), v22);
        v23 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v114, "setObject:forKey:", &unk_1E91D1208, v23);

        objc_msgSend(MEMORY[0x1E0CB3940], "stringWithFormat:", CFSTR("%@CountTrailing7Days"), v22);
        v24 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v114, "setObject:forKey:", &unk_1E91D1208, v24);

        objc_msgSend(MEMORY[0x1E0CB3940], "stringWithFormat:", CFSTR("%@CountTrailing30Days"), v22);
        v25 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v114, "setObject:forKey:", &unk_1E91D1208, v25);

      }
      v19 = objc_msgSend(v100, "countByEnumeratingWithState:objects:count:", &v135, v148, 16);
    }
    while (v19);
  }

  v133 = 0u;
  v134 = 0u;
  v131 = 0u;
  v132 = 0u;
  v99 = v8;
  v26 = objc_msgSend(v99, "countByEnumeratingWithState:objects:count:", &v131, v147, 16);
  if (v26)
  {
    v27 = v26;
    v28 = *(_QWORD *)v132;
    do
    {
      for (k = 0; k != v27; ++k)
      {
        if (*(_QWORD *)v132 != v28)
          objc_enumerationMutation(v99);
        v30 = *(_QWORD *)(*((_QWORD *)&v131 + 1) + 8 * k);
        objc_msgSend(MEMORY[0x1E0CB3940], "stringWithFormat:", CFSTR("%@DurationTrailing1Day"), v30);
        v31 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v114, "setObject:forKey:", &unk_1E91CF7B8, v31);

        objc_msgSend(MEMORY[0x1E0CB3940], "stringWithFormat:", CFSTR("%@DurationTrailing7Days"), v30);
        v32 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v114, "setObject:forKey:", &unk_1E91CF7B8, v32);

        objc_msgSend(MEMORY[0x1E0CB3940], "stringWithFormat:", CFSTR("%@DurationTrailing30Days"), v30);
        v33 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v114, "setObject:forKey:", &unk_1E91CF7B8, v33);

      }
      v27 = objc_msgSend(v99, "countByEnumeratingWithState:objects:count:", &v131, v147, 16);
    }
    while (v27);
  }

  v129 = 0u;
  v130 = 0u;
  v127 = 0u;
  v128 = 0u;
  objc_msgSend(v105, "allKeys");
  v98 = (id)objc_claimAutoreleasedReturnValue();
  v103 = objc_msgSend(v98, "countByEnumeratingWithState:objects:count:", &v127, v146, 16);
  if (v103)
  {
    v101 = *(_QWORD *)v128;
    do
    {
      v34 = 0;
      do
      {
        if (*(_QWORD *)v128 != v101)
          objc_enumerationMutation(v98);
        v104 = v34;
        v35 = *(_QWORD *)(*((_QWORD *)&v127 + 1) + 8 * v34);
        objc_msgSend(v105, "objectForKey:", v35);
        v36 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v102, "dateFromString:", v35);
        v37 = (void *)objc_claimAutoreleasedReturnValue();
        v106 = v36;
        objc_msgSend(v36, "objectForKey:", CFSTR("Counts"));
        v38 = (void *)objc_claimAutoreleasedReturnValue();
        v123 = 0u;
        v124 = 0u;
        v125 = 0u;
        v126 = 0u;
        v39 = objc_msgSend(v38, "countByEnumeratingWithState:objects:count:", &v123, v145, 16);
        v110 = v38;
        if (v39)
        {
          v40 = v39;
          v41 = *(id *)v124;
          obja = *(id *)v124;
          do
          {
            for (m = 0; m != v40; ++m)
            {
              if (*(id *)v124 != v41)
                objc_enumerationMutation(v38);
              v43 = *(_QWORD *)(*((_QWORD *)&v123 + 1) + 8 * m);
              objc_msgSend(v38, "objectForKey:", v43);
              v44 = (void *)objc_claimAutoreleasedReturnValue();
              v45 = objc_msgSend(v44, "integerValue");

              if (objc_msgSend(v37, "compare:", v7) == -1 && !objc_msgSend(v37, "compare:", v113))
              {
                objc_msgSend(MEMORY[0x1E0CB3940], "stringWithFormat:", CFSTR("%@CountTrailing1Day"), v43);
                v46 = (void *)objc_claimAutoreleasedReturnValue();
                objc_msgSend(v114, "objectForKey:", v46);
                v47 = (void *)objc_claimAutoreleasedReturnValue();
                v48 = objc_msgSend(v47, "integerValue");

                v49 = v48 + v45;
                v38 = v110;
                objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithInteger:", v49);
                v50 = (void *)objc_claimAutoreleasedReturnValue();
                v41 = obja;
                objc_msgSend(v114, "setObject:forKey:", v50, v46);

              }
              if (objc_msgSend(v37, "compare:", v7) == -1 && objc_msgSend(v37, "compare:", v112) != -1)
              {
                objc_msgSend(MEMORY[0x1E0CB3940], "stringWithFormat:", CFSTR("%@CountTrailing7Days"), v43);
                v51 = (void *)objc_claimAutoreleasedReturnValue();
                objc_msgSend(v114, "objectForKey:", v51);
                v52 = (void *)objc_claimAutoreleasedReturnValue();
                v53 = objc_msgSend(v52, "integerValue");

                v54 = v53 + v45;
                v38 = v110;
                objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithInteger:", v54);
                v55 = (void *)objc_claimAutoreleasedReturnValue();
                v41 = obja;
                objc_msgSend(v114, "setObject:forKey:", v55, v51);

              }
              if (objc_msgSend(v37, "compare:", v7) == -1 && objc_msgSend(v37, "compare:", v111) != -1)
              {
                objc_msgSend(MEMORY[0x1E0CB3940], "stringWithFormat:", CFSTR("%@CountTrailing30Days"), v43);
                v56 = (void *)objc_claimAutoreleasedReturnValue();
                objc_msgSend(v114, "objectForKey:", v56);
                v57 = (void *)objc_claimAutoreleasedReturnValue();
                v58 = objc_msgSend(v57, "integerValue");

                objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithInteger:", v58 + v45);
                v59 = (void *)objc_claimAutoreleasedReturnValue();
                v38 = v110;
                objc_msgSend(v114, "setObject:forKey:", v59, v56);

              }
            }
            v40 = objc_msgSend(v38, "countByEnumeratingWithState:objects:count:", &v123, v145, 16);
          }
          while (v40);
        }
        objc_msgSend(v106, "objectForKey:", CFSTR("Durations"));
        v60 = (void *)objc_claimAutoreleasedReturnValue();
        v119 = 0u;
        v120 = 0u;
        v121 = 0u;
        v122 = 0u;
        v61 = objc_msgSend(v60, "countByEnumeratingWithState:objects:count:", &v119, v144, 16);
        if (v61)
        {
          v62 = v61;
          v63 = *(_QWORD *)v120;
          do
          {
            for (n = 0; n != v62; ++n)
            {
              if (*(_QWORD *)v120 != v63)
                objc_enumerationMutation(v60);
              v65 = *(_QWORD *)(*((_QWORD *)&v119 + 1) + 8 * n);
              objc_msgSend(v60, "objectForKey:", v65);
              v66 = (void *)objc_claimAutoreleasedReturnValue();
              objc_msgSend(v66, "doubleValue");
              v68 = v67;

              if (objc_msgSend(v37, "compare:", v7) == -1 && !objc_msgSend(v37, "compare:", v113))
              {
                objc_msgSend(MEMORY[0x1E0CB3940], "stringWithFormat:", CFSTR("%@DurationTrailing1Day"), v65);
                v69 = (void *)objc_claimAutoreleasedReturnValue();
                objc_msgSend(v114, "objectForKey:", v69);
                v70 = (void *)objc_claimAutoreleasedReturnValue();
                objc_msgSend(v70, "doubleValue");
                v72 = v71;

                objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithDouble:", v68 + v72);
                v73 = (void *)objc_claimAutoreleasedReturnValue();
                objc_msgSend(v114, "setObject:forKey:", v73, v69);

              }
              if (objc_msgSend(v37, "compare:", v7) == -1 && objc_msgSend(v37, "compare:", v112) != -1)
              {
                objc_msgSend(MEMORY[0x1E0CB3940], "stringWithFormat:", CFSTR("%@DurationTrailing7Days"), v65);
                v74 = (void *)objc_claimAutoreleasedReturnValue();
                objc_msgSend(v114, "objectForKey:", v74);
                v75 = (void *)objc_claimAutoreleasedReturnValue();
                objc_msgSend(v75, "doubleValue");
                v77 = v76;

                objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithDouble:", v68 + v77);
                v78 = (void *)objc_claimAutoreleasedReturnValue();
                objc_msgSend(v114, "setObject:forKey:", v78, v74);

              }
              if (objc_msgSend(v37, "compare:", v7) == -1 && objc_msgSend(v37, "compare:", v111) != -1)
              {
                objc_msgSend(MEMORY[0x1E0CB3940], "stringWithFormat:", CFSTR("%@DurationTrailing30Days"), v65);
                v79 = (void *)objc_claimAutoreleasedReturnValue();
                objc_msgSend(v114, "objectForKey:", v79);
                v80 = (void *)objc_claimAutoreleasedReturnValue();
                objc_msgSend(v80, "doubleValue");
                v82 = v81;

                objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithDouble:", v68 + v82);
                v83 = (void *)objc_claimAutoreleasedReturnValue();
                objc_msgSend(v114, "setObject:forKey:", v83, v79);

              }
            }
            v62 = objc_msgSend(v60, "countByEnumeratingWithState:objects:count:", &v119, v144, 16);
          }
          while (v62);
        }

        v34 = v104 + 1;
      }
      while (v104 + 1 != v103);
      v103 = objc_msgSend(v98, "countByEnumeratingWithState:objects:count:", &v127, v146, 16);
    }
    while (v103);
  }

  v117 = 0u;
  v118 = 0u;
  v115 = 0u;
  v116 = 0u;
  objc_msgSend(v114, "allKeys");
  v84 = (void *)objc_claimAutoreleasedReturnValue();
  v85 = objc_msgSend(v84, "countByEnumeratingWithState:objects:count:", &v115, v143, 16);
  if (v85)
  {
    v86 = v85;
    v87 = *(_QWORD *)v116;
    do
    {
      for (ii = 0; ii != v86; ++ii)
      {
        if (*(_QWORD *)v116 != v87)
          objc_enumerationMutation(v84);
        v89 = *(void **)(*((_QWORD *)&v115 + 1) + 8 * ii);
        if (objc_msgSend(v89, "containsString:", CFSTR("Duration")))
        {
          objc_msgSend(v114, "objectForKey:", v89);
          v90 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v90, "doubleValue");
          v92 = v91;

          v93 = 0;
          while (v92 >= dbl_1D0E8A068[v93])
          {
            if (++v93 == 50)
            {
              v94 = 300000.0;
              goto LABEL_74;
            }
          }
          if ((int)v93 <= 1)
            LODWORD(v93) = 1;
          v94 = dbl_1D0E8A068[(v93 - 1)];
LABEL_74:
          objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithDouble:", v94);
          v95 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v114, "setObject:forKey:", v95, v89);

        }
      }
      v86 = objc_msgSend(v84, "countByEnumeratingWithState:objects:count:", &v115, v143, 16);
    }
    while (v86);
  }

  return v114;
}

- (id)calendar
{
  NSCalendar *calendar;
  NSCalendar *v4;
  void *v5;
  NSCalendar *v6;

  calendar = self->_calendar;
  if (!calendar)
  {
    objc_msgSend(MEMORY[0x1E0C99D48], "calendarWithIdentifier:", *MEMORY[0x1E0C996C8]);
    v4 = (NSCalendar *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(MEMORY[0x1E0C99E80], "timeZoneWithName:", CFSTR("UTC"));
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    -[NSCalendar setTimeZone:](v4, "setTimeZone:", v5);

    v6 = self->_calendar;
    self->_calendar = v4;

    calendar = self->_calendar;
  }
  return calendar;
}

- (id)dateFormatter
{
  NSISO8601DateFormatter *dateFormatter;
  NSISO8601DateFormatter *v4;
  NSISO8601DateFormatter *v5;

  dateFormatter = self->_dateFormatter;
  if (!dateFormatter)
  {
    v4 = (NSISO8601DateFormatter *)objc_alloc_init(MEMORY[0x1E0CB36A8]);
    v5 = self->_dateFormatter;
    self->_dateFormatter = v4;

    dateFormatter = self->_dateFormatter;
  }
  return dateFormatter;
}

- (SBHeartbeatMetricPersistence)heartbeatMetricPersistence
{
  return self->_heartbeatMetricPersistence;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_heartbeatMetricPersistence, 0);
  objc_storeStrong((id *)&self->_dateFormatter, 0);
  objc_storeStrong((id *)&self->_calendar, 0);
}

@end
