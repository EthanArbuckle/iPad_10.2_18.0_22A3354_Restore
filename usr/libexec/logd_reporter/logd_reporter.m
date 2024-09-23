id sub_100002A70()
{
  if (qword_10000C780 != -1)
    dispatch_once(&qword_10000C780, &stru_1000082D0);
  return (id)qword_10000C788;
}

void sub_100002AB0(id a1)
{
  os_log_t v1;
  void *v2;

  v1 = os_log_create("com.apple.logd_reporter", "ReadStatistics");
  v2 = (void *)qword_10000C788;
  qword_10000C788 = (uint64_t)v1;

}

id sub_100003690(void *a1, uint64_t a2)
{
  void *v2;
  id v3;
  id v4;

  v2 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(a1, "objectForKeyedSubscript:", a2));
  if (v2)
  {
    objc_opt_class(NSString);
    v3 = sub_100003768(v2);
    v4 = (id)objc_claimAutoreleasedReturnValue(v3);

    if (v4)
      v4 = v2;
  }
  else
  {
    v4 = 0;
  }

  return v4;
}

id sub_1000036FC(void *a1, uint64_t a2)
{
  void *v2;
  id v3;
  id v4;

  v2 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(a1, "objectForKeyedSubscript:", a2));
  if (v2)
  {
    objc_opt_class(NSNumber);
    v3 = sub_100003768(v2);
    v4 = (id)objc_claimAutoreleasedReturnValue(v3);

    if (v4)
      v4 = v2;
  }
  else
  {
    v4 = 0;
  }

  return v4;
}

id sub_100003768(void *a1)
{
  id v1;
  id v2;

  v1 = a1;
  if ((objc_opt_isKindOfClass() & 1) != 0)
    v2 = v1;
  else
    v2 = 0;

  return v2;
}

void start()
{
  sub_1000037E0();
  xpc_activity_register("com.apple.logd_reporter.report_statistics", XPC_ACTIVITY_CHECK_IN, &stru_100008310);
  dispatch_main();
}

size_t sub_1000037E0()
{
  size_t result;
  id v1;
  NSObject *v2;
  int v3;
  _DWORD v4[2];
  char v5[1024];

  bzero(v5, 0x400uLL);
  if (!_set_user_dir_suffix("com.apple.logd_reporter") || (result = confstr(65537, v5, 0x400uLL)) == 0)
  {
    v1 = sub_100004A48();
    v2 = objc_claimAutoreleasedReturnValue(v1);
    if (os_log_type_enabled(v2, OS_LOG_TYPE_ERROR))
    {
      v3 = *__error();
      v4[0] = 67109120;
      v4[1] = v3;
      _os_log_error_impl((void *)&_mh_execute_header, v2, OS_LOG_TYPE_ERROR, "failed to initialize temporary directory: %{darwin.errno}d", (uint8_t *)v4, 8u);
    }

    exit(1);
  }
  return result;
}

void sub_1000038BC(id a1, OS_xpc_object *a2)
{
  OS_xpc_object *v2;
  void *v3;
  xpc_activity_state_t state;
  xpc_activity_state_t v5;
  id v6;
  NSObject *v7;
  const char *v8;
  NSObject *v9;
  uint32_t v10;
  id v11;
  NSObject *v12;
  OS_xpc_object *v13;
  _BOOL4 v14;
  id v15;
  id v16;
  id v17;
  NSObject *v18;
  id v19;
  NSObject *v20;
  time_t v21;
  StatisticsParser *v22;
  const char *v23;
  int v24;
  const char *v25;
  int v26;
  uint64_t i;
  NSMutableDictionary *v28;
  void *v29;
  void *v30;
  void *v31;
  void *v32;
  unint64_t v33;
  unint64_t v34;
  void *v35;
  void *v36;
  void *v37;
  void *v38;
  id v39;
  id v40;
  uint64_t v41;
  uint64_t v42;
  uint64_t v43;
  uint64_t v44;
  void *v45;
  void *v46;
  void *v47;
  void *v48;
  void *v49;
  StatisticsParser *v50;
  void *v51;
  void *v52;
  id v53;
  id v54;
  id v55;
  uint64_t v56;
  uint64_t v57;
  uint64_t v58;
  void *v59;
  void *v60;
  void *v61;
  void *v62;
  void *v63;
  void *v64;
  id v65;
  id v66;
  uint64_t v67;
  void *j;
  void *v69;
  NSMutableDictionary *v70;
  void *v71;
  void *v72;
  void *v73;
  void *v74;
  NSObject *v75;
  const __CFString *v76;
  void *v77;
  void *v78;
  void *v79;
  uint64_t v80;
  void *v81;
  void *v82;
  id v83;
  __CFString *v84;
  uint64_t v85;
  id v86;
  void *v87;
  void *v88;
  void *v89;
  id v90;
  void *v91;
  NSObject *v92;
  void *v93;
  void *v94;
  id v95;
  uint64_t v96;
  void *v97;
  void *v98;
  void *v99;
  void *v100;
  void *v101;
  uint64_t v102;
  void *v103;
  void *v104;
  void *v105;
  int v106;
  void *v107;
  const __CFString *v108;
  void *v109;
  void *v110;
  uint32_t v111;
  void *v112;
  void *v113;
  id v114;
  NSObject *v115;
  void *v116;
  void *v117;
  id v118;
  void *v119;
  void *v120;
  void *v121;
  void *v122;
  id v123;
  id v124;
  void *v125;
  void *v126;
  id v127;
  void *v128;
  void *v129;
  id v130;
  void *v131;
  void *v132;
  id v133;
  void *v134;
  id v135;
  void *v136;
  id v137;
  NSObject *v138;
  id v139;
  NSObject *v140;
  id v141;
  NSObject *v142;
  id v143;
  NSObject *v144;
  NSObject *v145;
  uint64_t v146;
  void *v147;
  void *v148;
  OS_xpc_object *v149;
  void *v150;
  NSObject *v151;
  void *v152;
  id v153;
  void *v154;
  void *v155;
  StatisticsParser *v156;
  void *v157;
  void *v158;
  uint64_t v159;
  NSMutableDictionary *v160;
  id v161;
  void *v162;
  id obj;
  id obja;
  id objb;
  id objc;
  char *v167;
  char *v168;
  const __CFString *v169;
  void *v170;
  _QWORD v171[3];
  _QWORD v172[3];
  const __CFString *v173;
  const __CFString *v174;
  const __CFString *v175;
  void *v176;
  uint64_t v177;
  void *v178;
  _OWORD buf[8];
  __int128 v180;
  __int128 v181;
  __int128 v182;
  __int128 v183;

  v2 = a2;
  v3 = (void *)os_transaction_create("com.apple.logd_reporter");
  state = xpc_activity_get_state(v2);
  if (state != 2)
  {
    v5 = state;
    if (state)
    {
      v16 = sub_100004A48();
      v7 = objc_claimAutoreleasedReturnValue(v16);
      if (os_log_type_enabled(v7, OS_LOG_TYPE_DEFAULT))
      {
        LODWORD(buf[0]) = 134217984;
        *(_QWORD *)((char *)buf + 4) = v5;
        v8 = "Encountered unexpected activity state: %ld";
        v9 = v7;
        v10 = 12;
        goto LABEL_14;
      }
    }
    else
    {
      v6 = sub_100004A48();
      v7 = objc_claimAutoreleasedReturnValue(v6);
      if (os_log_type_enabled(v7, OS_LOG_TYPE_DEFAULT))
      {
        LOWORD(buf[0]) = 0;
        v8 = "Checking in for: \"com.apple.logd_reporter.report_statistics\"";
LABEL_5:
        v9 = v7;
        v10 = 2;
LABEL_14:
        _os_log_impl((void *)&_mh_execute_header, v9, OS_LOG_TYPE_DEFAULT, v8, (uint8_t *)buf, v10);
        goto LABEL_86;
      }
    }
    goto LABEL_86;
  }
  v11 = sub_100004A48();
  v12 = objc_claimAutoreleasedReturnValue(v11);
  if (os_log_type_enabled(v12, OS_LOG_TYPE_DEFAULT))
  {
    LOWORD(buf[0]) = 0;
    _os_log_impl((void *)&_mh_execute_header, v12, OS_LOG_TYPE_DEFAULT, "Activity eligible to run", (uint8_t *)buf, 2u);
  }

  v13 = v2;
  if (!xpc_activity_should_defer(v13))
  {

LABEL_16:
    v17 = sub_100004A48();
    v18 = objc_claimAutoreleasedReturnValue(v17);
    if (os_log_type_enabled(v18, OS_LOG_TYPE_DEFAULT))
    {
      LOWORD(buf[0]) = 0;
      _os_log_impl((void *)&_mh_execute_header, v18, OS_LOG_TYPE_DEFAULT, "Statistics report requested", (uint8_t *)buf, 2u);
    }

    v19 = sub_100004AB8();
    v20 = objc_claimAutoreleasedReturnValue(v19);
    if (os_signpost_enabled(v20))
    {
      LOWORD(buf[0]) = 0;
      _os_signpost_emit_with_name_impl((void *)&_mh_execute_header, v20, OS_SIGNPOST_INTERVAL_BEGIN, 0xEEEEB0B5B2B2EEEELL, "ReportingStatisticsDirectory", "Reporting from statistics directory", (uint8_t *)buf, 2u);
    }

    v21 = time(0);
    v22 = -[StatisticsParser initWithUnixTimeBoundFrom:to:]([StatisticsParser alloc], "initWithUnixTimeBoundFrom:to:", v21 - 86400, v21);
    v167 = (char *)0xAAAAAAAAAAAAAAAALL;
    v168 = (char *)0xAAAAAAAAAAAAAAAALL;
    v23 = (const char *)_os_trace_persistdir_path();
    asprintf(&v168, "%s/%s", v23, "logdata.statistics.0.jsonl");
    v24 = *__error();
    v25 = (const char *)_os_trace_persistdir_path();
    asprintf(&v167, "%s/%s", v25, "logdata.statistics.1.jsonl");
    v26 = *__error();
    if (v168 && v167)
    {
      v148 = v3;
      v149 = v2;
      sub_100004B28((uint64_t)v167, v22);
      sub_100004B28((uint64_t)v168, v22);
      v156 = v22;
      for (i = 0; i != 5; ++i)
      {
        v28 = objc_opt_new(NSMutableDictionary);
        v29 = (void *)objc_claimAutoreleasedReturnValue(-[StatisticsParser topEmitters](v156, "topEmitters"));
        v30 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v29, "objectAtIndexedSubscript:", i));

        v31 = (void *)objc_claimAutoreleasedReturnValue(-[StatisticsParser totalBytes](v156, "totalBytes"));
        v32 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v31, "objectAtIndexedSubscript:", i));

        v33 = (unint64_t)objc_msgSend(v32, "unsignedLongLongValue");
        v173 = CFSTR("elapsedSeconds");
        v34 = v33 / 0x15180;
        v35 = (void *)objc_claimAutoreleasedReturnValue(+[NSNumber numberWithLong:](NSNumber, "numberWithLong:", 86400));
        v176 = v35;
        v177 = (uint64_t)v32;
        v158 = v32;
        v174 = CFSTR("totalPayloadBytes");
        v175 = CFSTR("bytesPerSecond");
        v36 = (void *)objc_claimAutoreleasedReturnValue(+[NSNumber numberWithUnsignedLongLong:](NSNumber, "numberWithUnsignedLongLong:", v34));
        v178 = v36;
        v37 = (void *)objc_claimAutoreleasedReturnValue(+[NSDictionary dictionaryWithObjects:forKeys:count:](NSDictionary, "dictionaryWithObjects:forKeys:count:", &v176, &v173, 3));
        v160 = v28;
        -[NSMutableDictionary addEntriesFromDictionary:](v28, "addEntriesFromDictionary:", v37);

        v38 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v30, "keysSortedByValueUsingComparator:", &stru_1000083B0));
        v180 = 0u;
        v181 = 0u;
        v182 = 0u;
        v183 = 0u;
        obj = v38;
        v39 = objc_msgSend(v38, "countByEnumeratingWithState:objects:count:", &v180, buf, 16);
        if (v39)
        {
          v40 = v39;
          v41 = 0;
          v42 = *(_QWORD *)v181;
LABEL_25:
          v43 = 0;
          while (1)
          {
            if (*(_QWORD *)v181 != v42)
              objc_enumerationMutation(obj);
            v44 = *(_QWORD *)(*((_QWORD *)&v180 + 1) + 8 * v43);
            v171[0] = CFSTR("book");
            v45 = (void *)objc_claimAutoreleasedReturnValue(+[NSNumber numberWithUnsignedLong:](NSNumber, "numberWithUnsignedLong:", i));
            v172[0] = v45;
            v172[1] = v44;
            v171[1] = CFSTR("ProcessName");
            v171[2] = CFSTR("PayloadBytes");
            v46 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v30, "objectForKeyedSubscript:", v44));
            v172[2] = v46;
            v47 = (void *)objc_claimAutoreleasedReturnValue(+[NSDictionary dictionaryWithObjects:forKeys:count:](NSDictionary, "dictionaryWithObjects:forKeys:count:", v172, v171, 3));
            AnalyticsSendEvent(CFSTR("com.apple.logd.statistics.process"), v47);

            if (v41 + v43 == 29)
              break;
            if (v40 == (id)++v43)
            {
              v41 += v43;
              v40 = objc_msgSend(obj, "countByEnumeratingWithState:objects:count:", &v180, buf, 16);
              if (v40)
                goto LABEL_25;
              break;
            }
          }
        }
        v169 = CFSTR("book");
        v48 = (void *)objc_claimAutoreleasedReturnValue(+[NSNumber numberWithUnsignedLong:](NSNumber, "numberWithUnsignedLong:", i));
        v170 = v48;
        v49 = (void *)objc_claimAutoreleasedReturnValue(+[NSDictionary dictionaryWithObjects:forKeys:count:](NSDictionary, "dictionaryWithObjects:forKeys:count:", &v170, &v169, 1));
        -[NSMutableDictionary addEntriesFromDictionary:](v160, "addEntriesFromDictionary:", v49);

        AnalyticsSendEvent(CFSTR("com.apple.logd.statistics"), v160);
      }

      v50 = v156;
      v51 = (void *)objc_claimAutoreleasedReturnValue(-[StatisticsParser snapshotClients](v50, "snapshotClients"));
      v52 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v51, "keysSortedByValueUsingComparator:", &stru_1000083D0));

      v182 = 0u;
      v183 = 0u;
      v180 = 0u;
      v181 = 0u;
      v53 = v52;
      v54 = objc_msgSend(v53, "countByEnumeratingWithState:objects:count:", &v180, buf, 16);
      if (v54)
      {
        v55 = v54;
        v56 = 0;
        v57 = *(_QWORD *)v181;
LABEL_34:
        v58 = 0;
        while (1)
        {
          if (*(_QWORD *)v181 != v57)
            objc_enumerationMutation(v53);
          v176 = *(void **)(*((_QWORD *)&v180 + 1) + 8 * v58);
          v59 = v176;
          v173 = CFSTR("snapshotClientName");
          v174 = CFSTR("snapshotCount");
          v60 = (void *)objc_claimAutoreleasedReturnValue(-[StatisticsParser snapshotClients](v50, "snapshotClients"));
          v61 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v60, "objectForKeyedSubscript:", v59));
          v177 = (uint64_t)v61;
          v62 = (void *)objc_claimAutoreleasedReturnValue(+[NSDictionary dictionaryWithObjects:forKeys:count:](NSDictionary, "dictionaryWithObjects:forKeys:count:", &v176, &v173, 2));
          AnalyticsSendEvent(CFSTR("com.apple.logd.statistics.snapshots"), v62);

          if (v56 + v58 == 4)
            break;
          if (v55 == (id)++v58)
          {
            v56 += v58;
            v55 = objc_msgSend(v53, "countByEnumeratingWithState:objects:count:", &v180, buf, 16);
            if (v55)
              goto LABEL_34;
            break;
          }
        }
      }

      v7 = v50;
      v180 = 0u;
      v181 = 0u;
      v182 = 0u;
      v183 = 0u;
      v63 = (void *)objc_claimAutoreleasedReturnValue(-[NSObject quarantinedClients](v7, "quarantinedClients"));
      v64 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v63, "allKeys"));

      obja = v64;
      v65 = objc_msgSend(v64, "countByEnumeratingWithState:objects:count:", &v180, buf, 16);
      if (v65)
      {
        v66 = v65;
        v67 = *(_QWORD *)v181;
        do
        {
          for (j = 0; j != v66; j = (char *)j + 1)
          {
            if (*(_QWORD *)v181 != v67)
              objc_enumerationMutation(obja);
            v69 = *(void **)(*((_QWORD *)&v180 + 1) + 8 * (_QWORD)j);
            v70 = objc_opt_new(NSMutableDictionary);
            v71 = (void *)objc_claimAutoreleasedReturnValue(-[NSObject quarantinedClients](v7, "quarantinedClients"));
            v72 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v71, "objectForKeyedSubscript:", v69));
            v73 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v72, "objectForKeyedSubscript:", CFSTR("quarantineCount")));

            v173 = CFSTR("ProcessName");
            v174 = CFSTR("quarantineCount");
            v176 = v69;
            v177 = (uint64_t)v73;
            v74 = (void *)objc_claimAutoreleasedReturnValue(+[NSDictionary dictionaryWithObjects:forKeys:count:](NSDictionary, "dictionaryWithObjects:forKeys:count:", &v176, &v173, 2));
            -[NSMutableDictionary addEntriesFromDictionary:](v70, "addEntriesFromDictionary:", v74);

            AnalyticsSendEvent(CFSTR("com.apple.logd.statistics.quarantines"), v70);
          }
          v66 = objc_msgSend(obja, "countByEnumeratingWithState:objects:count:", &v180, buf, 16);
        }
        while (v66);
      }

      v3 = v148;
      v2 = v149;
      if (_os_trace_is_development_build() && &_DRSubmitLog)
      {
        v75 = v7;
        if (_os_feature_enabled_impl("Libtrace", "logd_reporter_quarantine_reports"))
        {
          v76 = sub_100004DF0();
          v150 = (void *)objc_claimAutoreleasedReturnValue(v76);
          if (v150)
          {
            v144 = v7;
            v182 = 0u;
            v183 = 0u;
            v180 = 0u;
            v181 = 0u;
            v77 = (void *)objc_claimAutoreleasedReturnValue(-[NSObject quarantinedClients](v75, "quarantinedClients"));
            v78 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v77, "allKeys"));

            v153 = v78;
            v161 = objc_msgSend(v78, "countByEnumeratingWithState:objects:count:", &v180, buf, 16);
            if (v161)
            {
              v146 = 0;
              v159 = *(_QWORD *)v181;
              v151 = v75;
              do
              {
                v79 = 0;
                v147 = (void *)(4 - v146);
                v146 += (uint64_t)v161;
                do
                {
                  if (*(_QWORD *)v181 != v159)
                    objc_enumerationMutation(v153);
                  v80 = *(_QWORD *)(*((_QWORD *)&v180 + 1) + 8 * (_QWORD)v79);
                  objb = objc_autoreleasePoolPush();
                  v81 = (void *)objc_claimAutoreleasedReturnValue(-[NSObject quarantinedClients](v75, "quarantinedClients"));
                  v82 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v81, "objectForKeyedSubscript:", v80));
                  v83 = objc_msgSend(v82, "mutableCopy");

                  v84 = (__CFString *)objc_claimAutoreleasedReturnValue(objc_msgSend(v83, "objectForKeyedSubscript:", CFSTR("fileName")));
                  v85 = objc_claimAutoreleasedReturnValue(+[NSPredicate predicateWithFormat:](NSPredicate, "predicateWithFormat:", CFSTR("process == %@"), v80));
                  v86 = objc_alloc((Class)NSDateInterval);
                  v87 = (void *)objc_claimAutoreleasedReturnValue(+[NSDate distantPast](NSDate, "distantPast"));
                  v88 = (void *)v85;
                  v89 = (void *)objc_claimAutoreleasedReturnValue(+[NSDate date](NSDate, "date"));
                  v90 = objc_msgSend(v86, "initWithStartDate:endDate:", v87, v89);

                  v173 = v84;
                  v91 = (void *)objc_claimAutoreleasedReturnValue(+[NSArray arrayWithObjects:count:](NSArray, "arrayWithObjects:count:", &v173, 1));
                  v92 = sub_100004F04(v91, v88, v90);
                  v93 = (void *)objc_claimAutoreleasedReturnValue(v92);

                  if (v93 && objc_msgSend(v93, "eventCount"))
                  {
                    v157 = v88;
                    v94 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v90, "endDate"));
                    v95 = sub_100005170(v94);
                    v96 = objc_claimAutoreleasedReturnValue(v95);

                    v154 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v93, "aggregationsForTier:", 5));
                    v97 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v154, "sortedArrayUsingComparator:", &stru_100008410));
                    v98 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v97, "firstObject"));
                    v99 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v98, "label"));

                    v155 = (void *)v96;
                    if (v99)
                    {
                      v100 = (void *)objc_claimAutoreleasedReturnValue(-[__CFString pathComponents](v84, "pathComponents"));
                      v101 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v100, "objectAtIndexedSubscript:", 0));
                      objc_msgSend(v83, "setObject:forKey:", v101, CFSTR("book"));

                      objc_msgSend(v83, "setObject:forKey:", v80, CFSTR("process"));
                      objc_msgSend(v83, "setObject:forKey:", v99, CFSTR("subsystem"));
                      v102 = objc_claimAutoreleasedReturnValue(+[NSString stringWithFormat:](NSString, "stringWithFormat:", CFSTR("quarantine_report_%@_%@.json"), v80, v96));
                      v176 = v150;
                      v177 = v102;
                      v152 = (void *)v102;
                      v103 = (void *)objc_claimAutoreleasedReturnValue(+[NSArray arrayWithObjects:count:](NSArray, "arrayWithObjects:count:", &v176, 2));
                      v104 = (void *)objc_claimAutoreleasedReturnValue(+[NSString pathWithComponents:](NSString, "pathWithComponents:", v103));

                      if (sub_1000051FC(v93, v104))
                      {
                        v105 = (void *)objc_claimAutoreleasedReturnValue(+[NSString stringWithFormat:](NSString, "stringWithFormat:", CFSTR("Quarantined %@ with top subsystem %@"), v80, v99));
                        sub_100005328(CFSTR("Quarantine"), v105, v83, v104);
                        v106 = 2 * (v147 == v79);

                      }
                      else
                      {
                        v106 = 3;
                      }
                      v75 = v151;
                      v107 = objb;

                    }
                    else
                    {
                      v106 = 3;
                      v75 = v151;
                      v107 = objb;
                    }

                    objc_autoreleasePoolPop(v107);
                    if (v106 != 3 && v106)
                      goto LABEL_69;
                  }
                  else
                  {

                    objc_autoreleasePoolPop(objb);
                  }
                  v79 = (char *)v79 + 1;
                }
                while (v161 != v79);
                v161 = objc_msgSend(v153, "countByEnumeratingWithState:objects:count:", &v180, buf, 16);
              }
              while (v161);
            }
LABEL_69:

            v3 = v148;
            v2 = v149;
            v7 = v144;
          }

        }
        if (_os_feature_enabled_impl("Libtrace", "logd_reporter_sampling_reports"))
        {
          v108 = sub_100004DF0();
          v109 = (void *)objc_claimAutoreleasedReturnValue(v108);
          if (v109)
          {
            v145 = v7;
            v110 = objc_autoreleasePoolPush();
            v111 = arc4random_uniform(0x90u);
            v112 = (void *)objc_claimAutoreleasedReturnValue(+[NSDate date](NSDate, "date"));
            v113 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v112, "dateByAddingTimeInterval:", (double)(int)(-600 * v111)));

            v114 = objc_msgSend(objc_alloc((Class)NSDateInterval), "initWithStartDate:duration:", v113, 600.0);
            v115 = sub_100004F04(0, 0, v114);
            v116 = (void *)objc_claimAutoreleasedReturnValue(v115);
            v117 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v114, "endDate"));
            v118 = sub_100005170(v117);
            v119 = (void *)objc_claimAutoreleasedReturnValue(v118);

            v120 = (void *)objc_claimAutoreleasedReturnValue(+[NSString stringWithFormat:](NSString, "stringWithFormat:", CFSTR("logging_sample_%@.json"), v119));
            *(_QWORD *)&buf[0] = v109;
            *((_QWORD *)&buf[0] + 1) = v120;
            v121 = (void *)objc_claimAutoreleasedReturnValue(+[NSArray arrayWithObjects:count:](NSArray, "arrayWithObjects:count:", buf, 2));
            v122 = (void *)objc_claimAutoreleasedReturnValue(+[NSString pathWithComponents:](NSString, "pathWithComponents:", v121));

            if (sub_1000051FC(v116, v122))
            {
              v123 = v116;
              objc = v116;
              v124 = v114;
              v125 = (void *)objc_claimAutoreleasedReturnValue(+[NSMutableDictionary dictionary](NSMutableDictionary, "dictionary"));
              v162 = v120;
              v126 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v124, "startDate"));
              v127 = sub_100005170(v126);
              v128 = (void *)objc_claimAutoreleasedReturnValue(v127);
              objc_msgSend(v125, "setValue:forKey:", v128, CFSTR("start_time"));

              v129 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v124, "endDate"));
              v130 = sub_100005170(v129);
              v131 = (void *)objc_claimAutoreleasedReturnValue(v130);
              objc_msgSend(v125, "setValue:forKey:", v131, CFSTR("end_time"));

              objc_msgSend(v125, "setValue:forKey:", &off_100008A90, CFSTR("interval_size"));
              v132 = (void *)objc_claimAutoreleasedReturnValue(+[NSNumber numberWithUnsignedLongLong:](NSNumber, "numberWithUnsignedLongLong:", objc_msgSend(v123, "eventCount")));
              objc_msgSend(v125, "setValue:forKey:", v132, CFSTR("total_count"));

              v133 = objc_msgSend(v123, "eventBytes");
              v134 = (void *)objc_claimAutoreleasedReturnValue(+[NSNumber numberWithUnsignedLongLong:](NSNumber, "numberWithUnsignedLongLong:", v133));
              objc_msgSend(v125, "setValue:forKey:", v134, CFSTR("total_bytes"));

              v135 = objc_msgSend(v125, "copy");
              v136 = (void *)objc_claimAutoreleasedReturnValue(+[NSString stringWithFormat:](NSString, "stringWithFormat:", CFSTR("Logging sample from %@"), v119));
              sub_100005328(CFSTR("LoggingSample"), v136, v135, v122);

              v116 = objc;
              v120 = v162;
            }

            objc_autoreleasePoolPop(v110);
            v3 = v148;
            v2 = v149;
            v7 = v145;
          }

        }
      }
      v137 = sub_100004AB8();
      v138 = objc_claimAutoreleasedReturnValue(v137);
      if (os_signpost_enabled(v138))
      {
        LOWORD(buf[0]) = 0;
        _os_signpost_emit_with_name_impl((void *)&_mh_execute_header, v138, OS_SIGNPOST_INTERVAL_END, 0xEEEEB0B5B2B2EEEELL, "ReportingStatisticsDirectory", "Success!", (uint8_t *)buf, 2u);
      }

      free(v168);
      free(v167);
    }
    else
    {
      v139 = sub_100004A48();
      v140 = objc_claimAutoreleasedReturnValue(v139);
      if (os_log_type_enabled(v140, OS_LOG_TYPE_ERROR))
      {
        LODWORD(buf[0]) = 67109376;
        DWORD1(buf[0]) = v24;
        WORD4(buf[0]) = 1024;
        *(_DWORD *)((char *)buf + 10) = v26;
        _os_log_error_impl((void *)&_mh_execute_header, v140, OS_LOG_TYPE_ERROR, "Unable to generate strings for paths to statistics files: %{darwin.errno}d and %{darwin.errno}d", (uint8_t *)buf, 0xEu);
      }

      free(v168);
      free(v167);
      v141 = sub_100004AB8();
      v142 = objc_claimAutoreleasedReturnValue(v141);
      if (os_signpost_enabled(v142))
      {
        LOWORD(buf[0]) = 0;
        _os_signpost_emit_with_name_impl((void *)&_mh_execute_header, v142, OS_SIGNPOST_INTERVAL_END, 0xEEEEB0B5B2B2EEEELL, "ReportingStatisticsDirectory", "Encountered error", (uint8_t *)buf, 2u);
      }

      v143 = sub_100004A48();
      v7 = objc_claimAutoreleasedReturnValue(v143);
      if (os_log_type_enabled(v7, OS_LOG_TYPE_ERROR))
      {
        LOWORD(buf[0]) = 0;
        _os_log_error_impl((void *)&_mh_execute_header, v7, OS_LOG_TYPE_ERROR, "Statistics report could not be generated", (uint8_t *)buf, 2u);
      }
    }
    goto LABEL_86;
  }
  v14 = xpc_activity_set_state(v13, 3);

  if (!v14)
    goto LABEL_16;
  v15 = sub_100004A48();
  v7 = objc_claimAutoreleasedReturnValue(v15);
  if (os_log_type_enabled(v7, OS_LOG_TYPE_DEFAULT))
  {
    LOWORD(buf[0]) = 0;
    v8 = "Asked to defer immediately";
    goto LABEL_5;
  }
LABEL_86:

  xpc_transaction_exit_clean();
}

id sub_100004A48()
{
  if (qword_10000C790 != -1)
    dispatch_once(&qword_10000C790, &stru_100008350);
  return (id)qword_10000C798;
}

void sub_100004A88(id a1)
{
  os_log_t v1;
  void *v2;

  v1 = os_log_create("com.apple.logd_reporter", "Main");
  v2 = (void *)qword_10000C798;
  qword_10000C798 = (uint64_t)v1;

}

id sub_100004AB8()
{
  if (qword_10000C7A0 != -1)
    dispatch_once(&qword_10000C7A0, &stru_100008370);
  return (id)qword_10000C7A8;
}

void sub_100004AF8(id a1)
{
  os_log_t v1;
  void *v2;

  v1 = os_log_create("com.apple.logd_reporter", "ReportStatistics");
  v2 = (void *)qword_10000C7A8;
  qword_10000C7A8 = (uint64_t)v1;

}

void sub_100004B28(uint64_t a1, void *a2)
{
  id v3;
  id v4;
  NSObject *v5;
  LineReader *v6;
  void *v7;
  LineReader *v8;
  void *v9;
  uint64_t v10;
  __int128 v11;
  void *v12;
  char v13;
  int v14;
  unsigned __int8 v15;
  id v16;
  id v17;
  NSObject *v18;
  id v19;
  id v20;
  NSObject *v21;
  const char *v22;
  id v23;
  __int128 v24;
  id v25;
  uint8_t buf[4];
  uint64_t v27;
  __int16 v28;
  int v29;
  __int16 v30;
  id v31;
  __int16 v32;
  id v33;

  v3 = a2;
  v4 = sub_100004AB8();
  v5 = objc_claimAutoreleasedReturnValue(v4);
  if (os_signpost_enabled(v5))
  {
    *(_DWORD *)buf = 136315138;
    v27 = a1;
  }

  v6 = [LineReader alloc];
  v7 = (void *)objc_claimAutoreleasedReturnValue(+[NSString stringWithUTF8String:](NSString, "stringWithUTF8String:", a1));
  v8 = -[LineReader initWithFile:](v6, "initWithFile:", v7);

  v9 = objc_autoreleasePoolPush();
  v10 = objc_claimAutoreleasedReturnValue(-[LineReader nextLine](v8, "nextLine"));
  if (v10)
  {
    v12 = (void *)v10;
    v13 = 0;
    v14 = 1;
    *(_QWORD *)&v11 = 136446978;
    v24 = v11;
    do
    {
      v25 = 0;
      v15 = objc_msgSend(v3, "feedJSONLine:error:", v12, &v25, v24);
      v16 = v25;
      if ((v15 & 1) == 0 && (v13 & 1) == 0)
      {
        v17 = sub_100004AB8();
        v18 = objc_claimAutoreleasedReturnValue(v17);
        if (os_log_type_enabled(v18, OS_LOG_TYPE_DEFAULT))
        {
          v19 = objc_msgSend(objc_retainAutorelease(v12), "UTF8String");
          *(_DWORD *)buf = v24;
          v27 = a1;
          v28 = 1024;
          v29 = v14;
          v30 = 2082;
          v31 = v19;
          v32 = 2114;
          v33 = v16;
        }

        v13 = 1;
      }

      objc_autoreleasePoolPop(v9);
      v9 = objc_autoreleasePoolPush();
      v12 = (void *)objc_claimAutoreleasedReturnValue(-[LineReader nextLine](v8, "nextLine"));
      ++v14;
    }
    while (v12);
    objc_autoreleasePoolPop(v9);
    if ((v13 & 1) != 0)
    {
      v20 = sub_100004AB8();
      v21 = objc_claimAutoreleasedReturnValue(v20);
      if (os_signpost_enabled(v21))
      {
        *(_WORD *)buf = 0;
        v22 = "Encountered error";
LABEL_17:
        _os_signpost_emit_with_name_impl((void *)&_mh_execute_header, v21, OS_SIGNPOST_INTERVAL_END, 0xEEEEB0B5B2B2EEEELL, "ReportingStatisticsFile", v22, buf, 2u);
        goto LABEL_18;
      }
      goto LABEL_18;
    }
  }
  else
  {
    objc_autoreleasePoolPop(v9);
  }
  v23 = sub_100004AB8();
  v21 = objc_claimAutoreleasedReturnValue(v23);
  if (os_signpost_enabled(v21))
  {
    *(_WORD *)buf = 0;
    v22 = "Success!";
    goto LABEL_17;
  }
LABEL_18:

}

const __CFString *sub_100004DF0()
{
  void *v0;
  const __CFString *v1;
  unsigned __int8 v2;
  id v3;
  id v4;
  NSObject *v5;
  void *v7;
  id v8;
  uint8_t buf[4];
  void *v10;

  v0 = (void *)objc_claimAutoreleasedReturnValue(+[NSFileManager defaultManager](NSFileManager, "defaultManager"));
  v8 = 0;
  v1 = CFSTR("/private/var/mobile/Library/Logs/com.apple.logd_reporter");
  v2 = objc_msgSend(v0, "createDirectoryAtPath:withIntermediateDirectories:attributes:error:", CFSTR("/private/var/mobile/Library/Logs/com.apple.logd_reporter"), 1, 0, &v8);
  v3 = v8;

  if ((v2 & 1) == 0)
  {
    v4 = sub_100004AB8();
    v5 = objc_claimAutoreleasedReturnValue(v4);
    if (os_log_type_enabled(v5, OS_LOG_TYPE_ERROR))
    {
      v7 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v3, "localizedDescription"));
      *(_DWORD *)buf = 138412290;
      v10 = v7;
      _os_log_error_impl((void *)&_mh_execute_header, v5, OS_LOG_TYPE_ERROR, "Error initialising output directory for quarantine reports: %@", buf, 0xCu);

    }
    v1 = 0;
  }

  return v1;
}

NSObject *sub_100004F04(void *a1, void *a2, void *a3)
{
  id v5;
  id v6;
  id v7;
  id v8;
  id v9;
  void *v10;
  void *v11;
  void *v12;
  id v13;
  NSObject *v14;
  NSObject *v15;
  id v16;
  id v17;
  NSObject *v18;
  void *v20;
  void *v21;
  void *v22;
  void *v23;
  id v24;
  id v25;
  uint8_t buf[4];
  void *v27;
  __int16 v28;
  void *v29;

  v5 = a2;
  v6 = a3;
  v7 = a1;
  v25 = 0;
  v8 = objc_msgSend(objc_alloc((Class)OSLogStatistics), "initWithLogArchivePath:forRelativePaths:errorOut:", 0, v7, &v25);

  v9 = v25;
  if (v8)
  {
    v10 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v6, "startDate"));
    v11 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v6, "endDate"));
    v24 = v9;
    v12 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v8, "aggregationForStartDate:endDate:predicate:withOptions:errorOut:", v10, v11, v5, 7, &v24));
    v13 = v24;

    if (v12)
    {
      v14 = v12;
      v15 = v14;
    }
    else
    {
      v17 = sub_100004AB8();
      v18 = objc_claimAutoreleasedReturnValue(v17);
      if (os_log_type_enabled(v18, OS_LOG_TYPE_ERROR))
      {
        v22 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v5, "description"));
        v23 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v13, "localizedDescription"));
        *(_DWORD *)buf = 138412546;
        v27 = v22;
        v28 = 2112;
        v29 = v23;
        _os_log_error_impl((void *)&_mh_execute_header, v18, OS_LOG_TYPE_ERROR, "Error during aggregations of OSLogStatistics for predicate %@ : %@", buf, 0x16u);

      }
      v14 = 0;
      v15 = 0;
    }
  }
  else
  {
    v16 = sub_100004AB8();
    v14 = objc_claimAutoreleasedReturnValue(v16);
    if (os_log_type_enabled(v14, OS_LOG_TYPE_ERROR))
    {
      v20 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v5, "description"));
      v21 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v9, "localizedDescription"));
      *(_DWORD *)buf = 138412546;
      v27 = v20;
      v28 = 2112;
      v29 = v21;
      _os_log_error_impl((void *)&_mh_execute_header, v14, OS_LOG_TYPE_ERROR, "Error during initialisation of OSLogStatistics for predicate %@: %@", buf, 0x16u);

    }
    v15 = 0;
    v13 = v9;
  }

  return v15;
}

id sub_100005170(void *a1)
{
  id v1;
  void *v2;
  id v3;
  void *v4;

  v1 = a1;
  v2 = (void *)objc_claimAutoreleasedReturnValue(+[NSTimeZone defaultTimeZone](NSTimeZone, "defaultTimeZone"));
  v3 = objc_alloc_init((Class)NSDateFormatter);
  objc_msgSend(v3, "setTimeZone:", v2);
  objc_msgSend(v3, "setDateFormat:", CFSTR("yyyy-MM-dd-HHmm"));
  v4 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v3, "stringFromDate:", v1));

  return v4;
}

id sub_1000051FC(void *a1, void *a2)
{
  id v3;
  void *v4;
  id v5;
  id v6;
  id v7;
  NSObject *v8;
  void *v10;
  id v11;
  uint8_t buf[4];
  id v13;
  __int16 v14;
  void *v15;

  v3 = a2;
  v4 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(a1, "jsonDescription:", 0));
  v11 = 0;
  v5 = objc_msgSend(v4, "writeToFile:atomically:encoding:error:", v3, 0, 4, &v11);
  v6 = v11;
  if ((v5 & 1) == 0)
  {
    v7 = sub_100004AB8();
    v8 = objc_claimAutoreleasedReturnValue(v7);
    if (os_log_type_enabled(v8, OS_LOG_TYPE_ERROR))
    {
      v10 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v6, "localizedDescription"));
      *(_DWORD *)buf = 138412546;
      v13 = v3;
      v14 = 2112;
      v15 = v10;
      _os_log_error_impl((void *)&_mh_execute_header, v8, OS_LOG_TYPE_ERROR, "Error writing aggregations at path %@: %@", buf, 0x16u);

    }
  }

  return v5;
}

void sub_100005328(void *a1, void *a2, void *a3, void *a4)
{
  char *v7;
  id v8;
  id v9;
  id v10;
  void *v11;
  void *v12;
  unsigned __int8 v13;
  id v14;
  id v15;
  NSObject *v16;
  char v17;
  id v18;
  id v19;
  NSObject *v20;
  id v21;
  const char *v22;
  int v23;
  id v24;
  NSObject *v25;
  NSObject *v26;
  int *v27;
  char *v28;
  char *v29;
  void *v30;
  id v31;
  id v32;
  NSFileAttributeKey v33;
  uint8_t buf[4];
  const char *v35;
  __int16 v36;
  uint64_t v37;
  __int16 v38;
  uint64_t v39;
  uint64_t v40;

  v7 = a1;
  v8 = a4;
  v9 = a3;
  v10 = a2;
  v11 = (void *)objc_claimAutoreleasedReturnValue(+[NSFileManager defaultManager](NSFileManager, "defaultManager"));
  v33 = NSFileGroupOwnerAccountName;
  v40 = (uint64_t)CFSTR("_analyticsusers");
  v12 = (void *)objc_claimAutoreleasedReturnValue(+[NSDictionary dictionaryWithObjects:forKeys:count:](NSDictionary, "dictionaryWithObjects:forKeys:count:", &v40, &v33, 1));
  v32 = 0;
  v13 = objc_msgSend(v11, "setAttributes:ofItemAtPath:error:", v12, v8, &v32);
  v14 = v32;

  if ((v13 & 1) == 0)
  {
    v15 = sub_100004AB8();
    v16 = objc_claimAutoreleasedReturnValue(v15);
    if (os_log_type_enabled(v16, OS_LOG_TYPE_ERROR))
    {
      v29 = (char *)objc_claimAutoreleasedReturnValue(objc_msgSend(v14, "localizedDescription"));
      *(_DWORD *)buf = 138412290;
      v35 = v29;
      _os_log_error_impl((void *)&_mh_execute_header, v16, OS_LOG_TYPE_ERROR, "setAttributes: %@", buf, 0xCu);

    }
  }

  v31 = 0;
  v17 = DRSubmitLog(CFSTR("com.apple.libtrace"), v7, v10, v9, CFSTR("json"), v8, 0, &v31);

  v18 = v31;
  if ((v17 & 1) == 0)
  {
    v19 = sub_100004AB8();
    v20 = objc_claimAutoreleasedReturnValue(v19);
    if (os_log_type_enabled(v20, OS_LOG_TYPE_ERROR))
    {
      v30 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v18, "localizedDescription"));
      *(_DWORD *)buf = 138412546;
      v35 = v7;
      v36 = 2112;
      v37 = (uint64_t)v30;
      _os_log_error_impl((void *)&_mh_execute_header, v20, OS_LOG_TYPE_ERROR, "Error during submission of %@ report : %@", buf, 0x16u);

    }
  }
  v21 = objc_retainAutorelease(v8);
  v22 = (const char *)objc_msgSend(v21, "fileSystemRepresentation");
  v40 = 65540;
  v23 = fsctl(v22, 0xC0084A44uLL, &v40, 0);
  v24 = sub_100004AB8();
  v25 = objc_claimAutoreleasedReturnValue(v24);
  v26 = v25;
  if (v23)
  {
    if (os_log_type_enabled(v25, OS_LOG_TYPE_ERROR))
    {
      v27 = __error();
      v28 = strerror(*v27);
      *(_DWORD *)buf = 136315650;
      v35 = v22;
      v36 = 2080;
      v37 = (uint64_t)v28;
      v38 = 2048;
      v39 = v40;
      _os_log_error_impl((void *)&_mh_execute_header, v26, OS_LOG_TYPE_ERROR, "Failed to mark %s as purgeable %s (flags 0x%llx)\n", buf, 0x20u);
    }
  }
  else if (os_log_type_enabled(v25, OS_LOG_TYPE_DEFAULT))
  {
    *(_DWORD *)buf = 136315394;
    v35 = v22;
    v36 = 2048;
    v37 = v40;
    _os_log_impl((void *)&_mh_execute_header, v26, OS_LOG_TYPE_DEFAULT, "Marked %s purgeable with flags 0x%llx\n", buf, 0x16u);
  }

}

int64_t sub_100005680(id a1, OSLogStatisticsAggregation *a2, OSLogStatisticsAggregation *a3)
{
  OSLogStatisticsAggregation *v4;
  OSLogStatisticsAggregation *v5;
  id v6;
  int64_t v7;
  id v8;

  v4 = a2;
  v5 = a3;
  v6 = -[OSLogStatisticsAggregation eventBytes](v4, "eventBytes");
  if (v6 <= -[OSLogStatisticsAggregation eventBytes](v5, "eventBytes"))
  {
    v8 = -[OSLogStatisticsAggregation eventBytes](v4, "eventBytes");
    v7 = v8 != -[OSLogStatisticsAggregation eventBytes](v5, "eventBytes");
  }
  else
  {
    v7 = -1;
  }

  return v7;
}

int64_t sub_100005700(id a1, id a2, id a3)
{
  return (int64_t)objc_msgSend(a3, "compare:", a2);
}

int64_t sub_10000570C(id a1, id a2, id a3)
{
  return (int64_t)objc_msgSend(a3, "compare:", a2);
}

id objc_msgSend_JSONObjectWithData_options_error_(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "JSONObjectWithData:options:error:");
}

id objc_msgSend_UTF8String(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "UTF8String");
}

id objc_msgSend__handleEmitter_inBook_(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "_handleEmitter:inBook:");
}

id objc_msgSend__handleQuarantineRecord_(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "_handleQuarantineRecord:");
}

id objc_msgSend__handleSnapshotRecord_(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "_handleSnapshotRecord:");
}

id objc_msgSend__handleStatisticsRecord_(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "_handleStatisticsRecord:");
}

id objc_msgSend__readNextChunk(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "_readNextChunk");
}

id objc_msgSend_addEntriesFromDictionary_(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "addEntriesFromDictionary:");
}

id objc_msgSend_aggregationForStartDate_endDate_predicate_withOptions_errorOut_(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "aggregationForStartDate:endDate:predicate:withOptions:errorOut:");
}

id objc_msgSend_aggregationsForTier_(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "aggregationsForTier:");
}

id objc_msgSend_allKeys(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "allKeys");
}

id objc_msgSend_arrayWithObjects_count_(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "arrayWithObjects:count:");
}

id objc_msgSend_closeFile(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "closeFile");
}

id objc_msgSend_componentsSeparatedByString_(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "componentsSeparatedByString:");
}

id objc_msgSend_copy(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "copy");
}

id objc_msgSend_count(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "count");
}

id objc_msgSend_countByEnumeratingWithState_objects_count_(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "countByEnumeratingWithState:objects:count:");
}

id objc_msgSend_createDirectoryAtPath_withIntermediateDirectories_attributes_error_(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "createDirectoryAtPath:withIntermediateDirectories:attributes:error:");
}

id objc_msgSend_dataUsingEncoding_(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "dataUsingEncoding:");
}

id objc_msgSend_date(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "date");
}

id objc_msgSend_dateByAddingTimeInterval_(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "dateByAddingTimeInterval:");
}

id objc_msgSend_defaultManager(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "defaultManager");
}

id objc_msgSend_defaultTimeZone(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "defaultTimeZone");
}

id objc_msgSend_description(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "description");
}

id objc_msgSend_dictionary(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "dictionary");
}

id objc_msgSend_dictionaryWithObjects_forKeys_count_(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "dictionaryWithObjects:forKeys:count:");
}

id objc_msgSend_distantPast(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "distantPast");
}

id objc_msgSend_endDate(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "endDate");
}

id objc_msgSend_eventBytes(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "eventBytes");
}

id objc_msgSend_eventCount(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "eventCount");
}

id objc_msgSend_feedJSONLine_error_(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "feedJSONLine:error:");
}

id objc_msgSend_fileHandleForReadingFromURL_error_(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "fileHandleForReadingFromURL:error:");
}

id objc_msgSend_fileSystemRepresentation(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "fileSystemRepresentation");
}

id objc_msgSend_fileURLWithPath_(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "fileURLWithPath:");
}

id objc_msgSend_firstObject(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "firstObject");
}

id objc_msgSend_initWithData_encoding_(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "initWithData:encoding:");
}

id objc_msgSend_initWithFile_(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "initWithFile:");
}

id objc_msgSend_initWithLogArchivePath_forRelativePaths_errorOut_(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "initWithLogArchivePath:forRelativePaths:errorOut:");
}

id objc_msgSend_initWithStartDate_duration_(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "initWithStartDate:duration:");
}

id objc_msgSend_initWithStartDate_endDate_(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "initWithStartDate:endDate:");
}

id objc_msgSend_initWithUnixTimeBoundFrom_to_(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "initWithUnixTimeBoundFrom:to:");
}

id objc_msgSend_intValue(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "intValue");
}

id objc_msgSend_isEqualToString_(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "isEqualToString:");
}

id objc_msgSend_jsonDescription_(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "jsonDescription:");
}

id objc_msgSend_keysSortedByValueUsingComparator_(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "keysSortedByValueUsingComparator:");
}

id objc_msgSend_label(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "label");
}

id objc_msgSend_lastObject(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "lastObject");
}

id objc_msgSend_lastPathComponent(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "lastPathComponent");
}

id objc_msgSend_length(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "length");
}

id objc_msgSend_localizedDescription(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "localizedDescription");
}

id objc_msgSend_mutableCopy(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "mutableCopy");
}

id objc_msgSend_nextLine(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "nextLine");
}

id objc_msgSend_numberWithInt_(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "numberWithInt:");
}

id objc_msgSend_numberWithLong_(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "numberWithLong:");
}

id objc_msgSend_numberWithUnsignedLong_(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "numberWithUnsignedLong:");
}

id objc_msgSend_numberWithUnsignedLongLong_(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "numberWithUnsignedLongLong:");
}

id objc_msgSend_objectAtIndexedSubscript_(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "objectAtIndexedSubscript:");
}

id objc_msgSend_objectForKeyedSubscript_(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "objectForKeyedSubscript:");
}

id objc_msgSend_pathComponents(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "pathComponents");
}

id objc_msgSend_pathWithComponents_(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "pathWithComponents:");
}

id objc_msgSend_predicateWithFormat_(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "predicateWithFormat:");
}

id objc_msgSend_quarantinedClients(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "quarantinedClients");
}

id objc_msgSend_readDataUpToLength_error_(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "readDataUpToLength:error:");
}

id objc_msgSend_removeLastObject(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "removeLastObject");
}

id objc_msgSend_removeObjectAtIndex_(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "removeObjectAtIndex:");
}

id objc_msgSend_seekToEndReturningOffset_error_(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "seekToEndReturningOffset:error:");
}

id objc_msgSend_seekToOffset_error_(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "seekToOffset:error:");
}

id objc_msgSend_setAttributes_ofItemAtPath_error_(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "setAttributes:ofItemAtPath:error:");
}

id objc_msgSend_setDateFormat_(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "setDateFormat:");
}

id objc_msgSend_setObject_atIndexedSubscript_(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "setObject:atIndexedSubscript:");
}

id objc_msgSend_setObject_forKey_(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "setObject:forKey:");
}

id objc_msgSend_setObject_forKeyedSubscript_(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "setObject:forKeyedSubscript:");
}

id objc_msgSend_setTimeZone_(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "setTimeZone:");
}

id objc_msgSend_setValue_forKey_(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "setValue:forKey:");
}

id objc_msgSend_snapshotClients(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "snapshotClients");
}

id objc_msgSend_sortedArrayUsingComparator_(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "sortedArrayUsingComparator:");
}

id objc_msgSend_startDate(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "startDate");
}

id objc_msgSend_stringByAppendingString_(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "stringByAppendingString:");
}

id objc_msgSend_stringFromDate_(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "stringFromDate:");
}

id objc_msgSend_stringWithFormat_(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "stringWithFormat:");
}

id objc_msgSend_stringWithString_(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "stringWithString:");
}

id objc_msgSend_stringWithUTF8String_(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "stringWithUTF8String:");
}

id objc_msgSend_topEmitters(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "topEmitters");
}

id objc_msgSend_totalBytes(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "totalBytes");
}

id objc_msgSend_unsignedLongLongValue(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "unsignedLongLongValue");
}

id objc_msgSend_unsignedLongValue(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "unsignedLongValue");
}

id objc_msgSend_writeToFile_atomically_encoding_error_(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "writeToFile:atomically:encoding:error:");
}
