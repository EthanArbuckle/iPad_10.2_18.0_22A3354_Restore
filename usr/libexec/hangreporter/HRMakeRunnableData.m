@implementation HRMakeRunnableData

- (HRMakeRunnableData)init
{
  HRMakeRunnableData *v2;
  void *v3;
  void *v4;
  objc_super v6;

  v6.receiver = self;
  v6.super_class = (Class)HRMakeRunnableData;
  v2 = -[HRMakeRunnableData init](&v6, "init");
  if (v2)
  {
    v3 = (void *)objc_claimAutoreleasedReturnValue(+[NSMutableArray array](NSMutableArray, "array"));
    -[HRMakeRunnableData setAllBlockingThreadsArray:](v2, "setAllBlockingThreadsArray:", v3);

    v4 = (void *)objc_claimAutoreleasedReturnValue(+[NSNumber numberWithInt:](NSNumber, "numberWithInt:", 0xFFFFFFFFLL));
    -[HRMakeRunnableData setTopBlockingPid:](v2, "setTopBlockingPid:", v4);

    -[HRMakeRunnableData setBlockingThreadInfo:](v2, "setBlockingThreadInfo:", 0);
  }
  return v2;
}

- (void)storeTopBlockingThreadInfoInBlockingThreadInfo:(id)a3 sampleStore:(id)a4 mostBlockingTimeThreadId:(id)a5 pidMostBlockingTime:(id)a6 blockedTime:(id)a7 isHangMainThread:(BOOL)a8
{
  _BOOL4 v8;
  id v14;
  id v15;
  id v16;
  id v17;
  void *v18;
  __CFString *v19;
  void *v20;
  id v21;

  v8 = a8;
  v21 = a5;
  v14 = a6;
  v15 = a7;
  v16 = a4;
  v17 = a3;
  v18 = (void *)objc_claimAutoreleasedReturnValue(+[NSString stringWithFormat:](NSString, "stringWithFormat:", CFSTR("%#llx"), objc_msgSend(v21, "unsignedLongLongValue")));
  objc_msgSend(v17, "setObject:forKeyedSubscript:", v18, CFSTR("topBlockingThreadId"));

  objc_msgSend(v17, "setObject:forKeyedSubscript:", v14, CFSTR("topBlockingPid"));
  v19 = sub_100012E38(v16, v14);
  v20 = (void *)objc_claimAutoreleasedReturnValue(v19);

  objc_msgSend(v17, "setObject:forKeyedSubscript:", v20, CFSTR("topBlockingProcess"));
  objc_msgSend(v17, "setObject:forKeyedSubscript:", v15, CFSTR("topBlockingTimeMS"));

  objc_msgSend(v17, "setObject:forKeyedSubscript:", 0, CFSTR("otherBlockingThreads"));
  objc_msgSend(v17, "setObject:forKeyedSubscript:", 0, CFSTR("nextTopBlockingThreadInfo"));

  if (v8)
    objc_storeStrong((id *)&self->_topBlockingPid, a6);
  -[NSMutableArray addObject:](self->_allBlockingThreadsArray, "addObject:", v21);

}

- (void)storeOtherBlockingThreadInfoInBlockingThreadInfo:(id)a3 sampleStore:(id)a4 mostBlockingTimeThreadId:(id)a5 sortedThreadsMaxCumlativeTime:(id)a6 blockingTimeByThread:(id)a7 tidToPidDict:(id)a8
{
  id v13;
  id v14;
  id v15;
  id v16;
  id v17;
  id v18;
  uint64_t v19;
  void *i;
  void *v21;
  void *v22;
  double v23;
  void *v24;
  id v25;
  void *v26;
  __CFString *v27;
  void *v28;
  void *v29;
  uint64_t v30;
  void *v31;
  id v32;
  id v33;
  id v34;
  id v36;
  id v37;
  id v38;
  __int128 v39;
  __int128 v40;
  __int128 v41;
  __int128 v42;
  _QWORD v43[3];
  _QWORD v44[3];
  _BYTE v45[128];

  v32 = a3;
  v38 = a4;
  v13 = a5;
  v14 = a6;
  v15 = a7;
  v37 = a8;
  v36 = objc_alloc_init((Class)NSMutableArray);
  v39 = 0u;
  v40 = 0u;
  v41 = 0u;
  v42 = 0u;
  v16 = v14;
  v17 = objc_msgSend(v16, "countByEnumeratingWithState:objects:count:", &v39, v45, 16);
  if (v17)
  {
    v18 = v17;
    v19 = *(_QWORD *)v40;
    v33 = v13;
    v34 = v16;
    do
    {
      for (i = 0; i != v18; i = (char *)i + 1)
      {
        if (*(_QWORD *)v40 != v19)
          objc_enumerationMutation(v16);
        v21 = *(void **)(*((_QWORD *)&v39 + 1) + 8 * (_QWORD)i);
        if ((objc_msgSend(v21, "isEqualToNumber:", v13) & 1) == 0)
        {
          v22 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v15, "objectForKeyedSubscript:", v21));
          v23 = sub_1000064D8((unint64_t)objc_msgSend(v22, "cumulativeTime"));

          if (v23 > 50.0)
          {
            v43[0] = CFSTR("threadId");
            v24 = (void *)objc_claimAutoreleasedReturnValue(+[NSString stringWithFormat:](NSString, "stringWithFormat:", CFSTR("%#llx"), objc_msgSend(v21, "unsignedLongLongValue")));
            v44[0] = v24;
            v43[1] = CFSTR("process");
            v25 = v15;
            v26 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v37, "objectForKeyedSubscript:", v21));
            v27 = sub_100012E38(v38, v26);
            v28 = (void *)objc_claimAutoreleasedReturnValue(v27);
            v44[1] = v28;
            v43[2] = CFSTR("blockingTimeMS");
            v29 = (void *)objc_claimAutoreleasedReturnValue(+[NSNumber numberWithDouble:](NSNumber, "numberWithDouble:", v23));
            v44[2] = v29;
            v30 = v19;
            v31 = (void *)objc_claimAutoreleasedReturnValue(+[NSDictionary dictionaryWithObjects:forKeys:count:](NSDictionary, "dictionaryWithObjects:forKeys:count:", v44, v43, 3));
            objc_msgSend(v36, "addObject:", v31);

            v19 = v30;
            v15 = v25;
            v13 = v33;
            v16 = v34;

            -[NSMutableArray addObject:](self->_allBlockingThreadsArray, "addObject:", v21);
          }
        }
      }
      v18 = objc_msgSend(v16, "countByEnumeratingWithState:objects:count:", &v39, v45, 16);
    }
    while (v18);
  }

  if (objc_msgSend(v36, "count"))
    objc_msgSend(v32, "setObject:forKeyedSubscript:", v36, CFSTR("otherBlockingThreads"));

}

- (int64_t)findBlockingThreadForTailspin:(id)a3 sampleStore:(id)a4 mainThread:(id)a5 hangStartTime:(unint64_t)a6 hangEndTime:(unint64_t)a7 hangDuration:(int)a8
{
  id v10;
  id v11;
  id v12;
  id v13;
  id v14;
  id v15;
  char v16;
  __int128 v17;
  NSDictionary *blockingThreadInfo;
  id v19;
  uint64_t v20;
  uint64_t v21;
  id v22;
  int v23;
  unint64_t v24;
  _BYTE *v25;
  int v26;
  int v27;
  dispatch_semaphore_t v28;
  NSObject *v29;
  qos_class_t v30;
  dispatch_queue_global_t global_queue;
  void *v32;
  int v33;
  dispatch_time_t v34;
  id v35;
  NSObject *v36;
  NSUInteger v37;
  id v38;
  id v39;
  NSDictionary *v40;
  void *v41;
  void *v42;
  id v43;
  id v44;
  uint64_t v45;
  void *v46;
  void *v47;
  SATimestamp *v48;
  void *v49;
  void *v50;
  void *v51;
  id v52;
  void *v53;
  _BOOL4 v54;
  id v55;
  NSObject *v56;
  id v57;
  id v58;
  id v59;
  void *v60;
  id v61;
  NSObject *v62;
  void *v63;
  id v64;
  unint64_t v65;
  char *v66;
  id v67;
  NSObject *v68;
  char *v69;
  id v70;
  id v71;
  id v72;
  void *v73;
  void *v74;
  BlockingThreadElement *v75;
  void *v76;
  void *v77;
  void *v78;
  unint64_t v79;
  char *v80;
  void *v81;
  void *v82;
  void *v83;
  void *v84;
  id v85;
  void *v86;
  void *v87;
  void *v88;
  void *v89;
  void *v90;
  void *v91;
  id v92;
  void *v93;
  id v94;
  id v95;
  id v96;
  const __CFString *v97;
  id v98;
  id v99;
  id v100;
  id v101;
  id v102;
  void *v103;
  void *v104;
  id v105;
  id v106;
  id v107;
  NSObject *v108;
  void *v109;
  void *v110;
  void *v111;
  void *v112;
  void *v113;
  NSNumber *v114;
  void *v115;
  void *v116;
  void *v117;
  id v118;
  void *v119;
  id v120;
  BOOL v121;
  unint64_t v122;
  HRMakeRunnableData *v123;
  id v124;
  NSObject *v125;
  id v126;
  void *v127;
  id v128;
  void *v129;
  void *v130;
  id v131;
  void *v132;
  _BYTE *v133;
  void *v134;
  _BYTE *v135;
  id v136;
  NSObject *v137;
  id v138;
  int v139;
  id v140;
  NSObject *v141;
  id v142;
  id v143;
  id v144;
  NSObject *v145;
  int v146;
  id v147;
  NSObject *v148;
  int v149;
  id v150;
  NSObject *v151;
  id v152;
  id v153;
  NSObject *v154;
  id v155;
  NSObject *v156;
  int64_t v157;
  id v158;
  NSObject *v159;
  NSObject *v160;
  id v161;
  NSObject *v162;
  NSObject *v163;
  NSDictionary *v164;
  __int128 v166;
  void *v167;
  void *v168;
  id v169;
  id v170;
  void *v172;
  NSDictionary *v173;
  int v174;
  void *v175;
  void *v176;
  void *v177;
  id v178;
  char *v179;
  id v180;
  char *v181;
  id v182;
  unint64_t v183;
  unint64_t v184;
  id v185;
  id v186;
  id v187;
  void *v188;
  void *v189;
  void *v190;
  void *v193;
  uint64_t v194;
  void *v195;
  void *v196;
  void *v197;
  id v198;
  _BYTE v199[24];
  void *v200;
  _BYTE v201[20];
  __int16 v202;
  unint64_t v203;
  __int16 v204;
  id v205;
  __int16 v206;
  const __CFString *v207;
  _BYTE buf[24];
  void *v209;
  __int128 v210;
  unint64_t v211;
  unint64_t v212;
  uint8_t v213[32];
  __int128 v214;
  __int128 v215;

  v10 = a3;
  v11 = a4;
  v12 = a5;
  v13 = objc_msgSend(v12, "threadId");
  v14 = v12;
  v172 = v11;
  v175 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v11, "tidToPidDict"));
  v15 = objc_alloc_init((Class)NSMutableDictionary);
  v174 = 0;
  v16 = 1;
  *(_QWORD *)&v17 = 134218240;
  v166 = v17;
  v168 = v15;
  v169 = v10;
  v170 = v13;
  v178 = v13;
  v167 = v14;
  v176 = v14;
  while (1)
  {
    v177 = v15;
    if ((v16 & 1) == 0)
      goto LABEL_110;
    if (v174 >= 5)
    {
      v143 = sub_10001D38C();
      blockingThreadInfo = (NSDictionary *)objc_claimAutoreleasedReturnValue(v143);
      if (os_log_type_enabled(&blockingThreadInfo->super, OS_LOG_TYPE_INFO))
      {
        *(_DWORD *)buf = 67109120;
        *(_DWORD *)&buf[4] = v174;
        _os_log_impl((void *)&_mh_execute_header, &blockingThreadInfo->super, OS_LOG_TYPE_INFO, "findBlockingThreadForTailspin:  currentNextIterationCount = %d is more than MAX_KTRACE_SESSION_COUNT", buf, 8u);
      }
      goto LABEL_109;
    }
    blockingThreadInfo = (NSDictionary *)objc_alloc_init((Class)NSMutableArray);
    v19 = v10;
    v20 = ktrace_session_create();
    if (!v20)
    {
      v144 = sub_10001D38C();
      v145 = objc_claimAutoreleasedReturnValue(v144);
      if (os_log_type_enabled(v145, OS_LOG_TYPE_DEFAULT))
      {
        *(_WORD *)v213 = 0;
        _os_log_impl((void *)&_mh_execute_header, v145, OS_LOG_TYPE_DEFAULT, "getMKRunnableDatafromKTraceforThreadId: ktrace_session_create failed", v213, 2u);
      }

      goto LABEL_80;
    }
    v21 = v20;
    v22 = objc_retainAutorelease(v19);
    v23 = ktrace_set_file(v21, objc_msgSend(v22, "UTF8String"));
    if (v23)
    {
      v146 = v23;
      v147 = sub_10001D38C();
      v148 = objc_claimAutoreleasedReturnValue(v147);
      if (os_log_type_enabled(v148, OS_LOG_TYPE_DEFAULT))
      {
        *(_DWORD *)v213 = 67109120;
        *(_DWORD *)&v213[4] = v146;
        _os_log_impl((void *)&_mh_execute_header, v148, OS_LOG_TYPE_DEFAULT, "getMKRunnableDatafromKTraceforThreadId: ktrace_set_file failed with error# = %i", v213, 8u);
      }

      ktrace_session_destroy(v21);
LABEL_80:

LABEL_94:
      v157 = 2;
      goto LABEL_111;
    }
    ktrace_session_set_event_names_enabled(v21, 0);
    ktrace_set_execnames_enabled(v21, 0);
    ktrace_set_jetsam_coalitions_enabled(v21, 0);
    ktrace_set_thread_groups_enabled(v21, 0);
    ktrace_set_vnode_paths_enabled(v21, 0);
    ktrace_set_thread_cputime_enabled(v21, 0);
    ktrace_set_uuid_map_enabled(v21, 0);
    ktrace_set_remotetime_conversion_enabled(v21, 0);
    *(_QWORD *)buf = _NSConcreteStackBlock;
    *(_QWORD *)&buf[8] = 3221225472;
    *(_QWORD *)&buf[16] = sub_100014ED8;
    v209 = &unk_100075480;
    v24 = a7;
    *((_QWORD *)&v210 + 1) = v178;
    v211 = a6;
    v212 = a7;
    blockingThreadInfo = blockingThreadInfo;
    *(_QWORD *)&v210 = blockingThreadInfo;
    v25 = objc_retainBlock(buf);
    v26 = ktrace_events_single(v21, 621346816, v25);
    if (v26)
    {
      v149 = v26;
      v150 = sub_10001D38C();
      v151 = objc_claimAutoreleasedReturnValue(v150);
      if (os_log_type_enabled(v151, OS_LOG_TYPE_DEFAULT))
        goto LABEL_84;
      goto LABEL_85;
    }
    v27 = ktrace_events_single(v21, 6, v25);
    if (v27)
    {
      v149 = v27;
      v152 = sub_10001D38C();
      v151 = objc_claimAutoreleasedReturnValue(v152);
      if (os_log_type_enabled(v151, OS_LOG_TYPE_DEFAULT))
      {
LABEL_84:
        *(_DWORD *)v213 = 67109376;
        *(_DWORD *)&v213[4] = v149;
        *(_WORD *)&v213[8] = 2048;
        *(_QWORD *)&v213[10] = v178;
        _os_log_impl((void *)&_mh_execute_header, v151, OS_LOG_TYPE_DEFAULT, "getMKRunnableDatafromKTraceforThreadId: ktrace_events_single failed with error# = %i for threadId= %llx", v213, 0x12u);
      }
LABEL_85:

      ktrace_session_destroy(v21);
LABEL_93:

      goto LABEL_94;
    }
    v28 = dispatch_semaphore_create(0);
    *(_QWORD *)v199 = _NSConcreteStackBlock;
    *(_QWORD *)&v199[8] = 3221225472;
    *(_QWORD *)&v199[16] = sub_100015098;
    v200 = &unk_1000754A8;
    *(_QWORD *)&v201[8] = v21;
    v29 = v28;
    *(_QWORD *)v201 = v29;
    ktrace_set_completion_handler(v21, v199);
    v30 = qos_class_self();
    global_queue = dispatch_get_global_queue(v30, 0);
    v32 = (void *)objc_claimAutoreleasedReturnValue(global_queue);
    v33 = ktrace_start(v21, v32);

    if (v33)
    {
      v153 = sub_10001D38C();
      v154 = objc_claimAutoreleasedReturnValue(v153);
      if (os_log_type_enabled(v154, OS_LOG_TYPE_DEFAULT))
      {
        *(_DWORD *)v213 = 67109376;
        *(_DWORD *)&v213[4] = v33;
        *(_WORD *)&v213[8] = 2048;
        *(_QWORD *)&v213[10] = v178;
        _os_log_impl((void *)&_mh_execute_header, v154, OS_LOG_TYPE_DEFAULT, "getMKRunnableDatafromKTraceforThreadId: ktrace_start failed with error# = %i for threadId= %llx", v213, 0x12u);
      }

      ktrace_session_destroy(v21);
      goto LABEL_92;
    }
    v34 = dispatch_time(0, 100000000000);
    if (dispatch_semaphore_wait(v29, v34))
    {
      v155 = sub_10001D38C();
      v156 = objc_claimAutoreleasedReturnValue(v155);
      if (os_log_type_enabled(v156, OS_LOG_TYPE_DEFAULT))
      {
        *(_DWORD *)v213 = 134217984;
        *(_QWORD *)&v213[4] = 100000000000;
        _os_log_impl((void *)&_mh_execute_header, v156, OS_LOG_TYPE_DEFAULT, "Timed out (%lld) parsing trace buffer", v213, 0xCu);
      }

      ktrace_end(v21, 1);
LABEL_92:

      goto LABEL_93;
    }

    if (!-[NSDictionary count](blockingThreadInfo, "count"))
      break;
    v35 = sub_10001D38C();
    v36 = objc_claimAutoreleasedReturnValue(v35);
    if (os_log_type_enabled(v36, OS_LOG_TYPE_INFO))
    {
      v37 = -[NSDictionary count](blockingThreadInfo, "count");
      *(_DWORD *)buf = 134217984;
      *(_QWORD *)&buf[4] = v37;
      _os_log_impl((void *)&_mh_execute_header, v36, OS_LOG_TYPE_INFO, "*** Size of makeRunnableData array %lx,***", buf, 0xCu);
    }

    v38 = objc_alloc_init((Class)NSMutableDictionary);
    v198 = v176;
    v39 = v172;
    v187 = v38;
    memset(v213, 0, sizeof(v213));
    v214 = 0u;
    v215 = 0u;
    v173 = blockingThreadInfo;
    v40 = blockingThreadInfo;
    v41 = v39;
    v42 = (void *)objc_claimAutoreleasedReturnValue(-[NSDictionary reverseObjectEnumerator](v40, "reverseObjectEnumerator"));
    v43 = objc_msgSend(v42, "countByEnumeratingWithState:objects:count:", v213, buf, 16);
    v193 = v39;
    if (v43)
    {
      v44 = v43;
      v45 = **(_QWORD **)&v213[16];
      v194 = **(_QWORD **)&v213[16];
      v196 = v42;
      do
      {
        v46 = 0;
        do
        {
          if (**(_QWORD **)&v213[16] != v45)
            objc_enumerationMutation(v42);
          v47 = *(void **)(*(_QWORD *)&v213[8] + 8 * (_QWORD)v46);
          if ((objc_msgSend(v47, "inInterrupt", v166) & 1) == 0
            && (unint64_t)objc_msgSend(v47, "timestamp") < v24)
          {
            v48 = +[SATimestamp timestampWithMachAbsTime:machContTime:wallTime:machTimebase:](SATimestamp, "timestampWithMachAbsTime:machContTime:wallTime:machTimebase:", objc_msgSend(v47, "timestamp"), 0, sub_1000065E0(), 0.0);
            v49 = (void *)objc_claimAutoreleasedReturnValue(v48);
            v50 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v41, "sampleTimestamps"));
            v51 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v198, "lastThreadStateOnOrBeforeTime:sampleIndex:", v49, (char *)objc_msgSend(v50, "count") - 1));

            if (v51)
            {
              v52 = objc_msgSend(v47, "timestamp");
              v53 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v51, "endTimestamp"));
              if (v52 <= objc_msgSend(v53, "machAbsTime"))
              {
                v59 = objc_msgSend(v47, "timestamp");
                v60 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v51, "startTimestamp"));
                v54 = v59 >= objc_msgSend(v60, "machAbsTime");

                v41 = v193;
              }
              else
              {
                v54 = 0;
              }

              v61 = sub_10001D38C();
              v62 = objc_claimAutoreleasedReturnValue(v61);
              if (os_log_type_enabled(v62, OS_LOG_TYPE_DEBUG))
              {
                v185 = objc_msgSend(v47, "timestamp");
                v182 = objc_msgSend(v47, "madeRunnableByThreadId");
                v189 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v51, "startTimestamp"));
                v180 = objc_msgSend(v189, "machAbsTime");
                v93 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v51, "endTimestamp"));
                v94 = objc_msgSend(v93, "machAbsTime");
                v95 = objc_msgSend(v51, "startSampleIndex");
                v96 = objc_msgSend(v51, "endSampleIndex");
                *(_DWORD *)v199 = 134219778;
                v97 = CFSTR("outside");
                if (v54)
                  v97 = CFSTR("inside");
                *(_QWORD *)&v199[4] = v185;
                *(_WORD *)&v199[12] = 2048;
                *(_QWORD *)&v199[14] = v178;
                *(_WORD *)&v199[22] = 2048;
                v200 = v182;
                *(_WORD *)v201 = 2048;
                *(_QWORD *)&v201[2] = v180;
                *(_WORD *)&v201[10] = 2048;
                *(_QWORD *)&v201[12] = v94;
                v41 = v193;
                v202 = 2048;
                v203 = (unint64_t)v95;
                v204 = 2048;
                v205 = v96;
                v206 = 2112;
                v207 = v97;
                _os_log_debug_impl((void *)&_mh_execute_header, v62, OS_LOG_TYPE_DEBUG, "iterateMkRunnableDataToFindBlockingThreadInfo: eachMadeRunnable: %llu - thread %llx by %llx mkRunnableTime, threadState time %llu-%llu (idx %lu - idx %lu) -> %@", v199, 0x52u);

                v24 = a7;
              }

              if (v54)
              {
                v63 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v51, "startTimestamp"));
                v64 = objc_msgSend(v63, "machAbsTime");

                if ((unint64_t)v64 <= a6)
                  v65 = a6;
                else
                  v65 = (unint64_t)v64;
                v66 = (char *)objc_msgSend(v47, "timestamp");
                v67 = sub_10001D38C();
                v68 = objc_claimAutoreleasedReturnValue(v67);
                if (os_log_type_enabled(v68, OS_LOG_TYPE_DEBUG))
                {
                  v98 = objc_msgSend(v47, "timestamp");
                  v99 = objc_msgSend(v47, "madeRunnableByThreadId");
                  *(_DWORD *)v199 = 134219264;
                  *(_QWORD *)&v199[4] = v98;
                  *(_WORD *)&v199[12] = 2048;
                  *(_QWORD *)&v199[14] = v178;
                  *(_WORD *)&v199[22] = 2048;
                  v200 = v99;
                  *(_WORD *)v201 = 2048;
                  *(_QWORD *)&v201[2] = &v66[-v65];
                  *(_WORD *)&v201[10] = 2048;
                  *(_QWORD *)&v201[12] = v66;
                  v202 = 2048;
                  v203 = v65;
                  _os_log_debug_impl((void *)&_mh_execute_header, v68, OS_LOG_TYPE_DEBUG, "iterateMkRunnableDataToFindBlockingThreadInfo: eachMadeRunnable: %llu - thread %llx by %llx -> blockedtime = %llu (= %llu - %llu)", v199, 0x3Eu);
                }

                v69 = &v66[-v65];
                if ((unint64_t)v66 >= v65)
                {
                  v188 = v49;
                  v181 = v66;
                  v184 = v65;
                  v73 = (void *)objc_claimAutoreleasedReturnValue(+[NSNumber numberWithUnsignedLongLong:](NSNumber, "numberWithUnsignedLongLong:", objc_msgSend(v47, "madeRunnableByThreadId")));
                  v74 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v187, "objectForKeyedSubscript:", v73));

                  if (!v74)
                  {
                    v75 = objc_alloc_init(BlockingThreadElement);
                    v76 = (void *)objc_claimAutoreleasedReturnValue(+[NSNumber numberWithUnsignedLongLong:](NSNumber, "numberWithUnsignedLongLong:", objc_msgSend(v47, "madeRunnableByThreadId")));
                    objc_msgSend(v187, "setObject:forKeyedSubscript:", v75, v76);

                  }
                  v77 = (void *)objc_claimAutoreleasedReturnValue(+[NSNumber numberWithUnsignedLongLong:](NSNumber, "numberWithUnsignedLongLong:", objc_msgSend(v47, "madeRunnableByThreadId")));
                  v78 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v187, "objectForKeyedSubscript:", v77));
                  v79 = (unint64_t)v69;
                  v80 = &v69[(_QWORD)objc_msgSend(v78, "cumulativeTime")];

                  v81 = (void *)objc_claimAutoreleasedReturnValue(+[NSNumber numberWithUnsignedLongLong:](NSNumber, "numberWithUnsignedLongLong:", objc_msgSend(v47, "madeRunnableByThreadId")));
                  v82 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v187, "objectForKeyedSubscript:", v81));
                  v179 = v80;
                  objc_msgSend(v82, "setCumulativeTime:", v80);

                  v83 = (void *)objc_claimAutoreleasedReturnValue(+[NSNumber numberWithUnsignedLongLong:](NSNumber, "numberWithUnsignedLongLong:", objc_msgSend(v47, "madeRunnableByThreadId")));
                  v84 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v187, "objectForKeyedSubscript:", v83));
                  v85 = objc_msgSend(v84, "maxBlockingTime");

                  if ((unint64_t)v85 < v79)
                  {
                    v86 = (void *)objc_claimAutoreleasedReturnValue(+[NSNumber numberWithUnsignedLongLong:](NSNumber, "numberWithUnsignedLongLong:", objc_msgSend(v47, "madeRunnableByThreadId")));
                    v87 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v187, "objectForKeyedSubscript:", v86));
                    objc_msgSend(v87, "setMaxBlockingTime:", v79);

                    v88 = (void *)objc_claimAutoreleasedReturnValue(+[NSNumber numberWithUnsignedLongLong:](NSNumber, "numberWithUnsignedLongLong:", objc_msgSend(v47, "madeRunnableByThreadId")));
                    v89 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v187, "objectForKeyedSubscript:", v88));
                    objc_msgSend(v89, "setStartThreadTime:", v184);

                    v90 = (void *)objc_claimAutoreleasedReturnValue(+[NSNumber numberWithUnsignedLongLong:](NSNumber, "numberWithUnsignedLongLong:", objc_msgSend(v47, "madeRunnableByThreadId")));
                    v91 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v187, "objectForKeyedSubscript:", v90));
                    objc_msgSend(v91, "setEndThreadTime:", v181);

                  }
                  v92 = sub_10001D38C();
                  v56 = objc_claimAutoreleasedReturnValue(v92);
                  v49 = v188;
                  if (os_log_type_enabled(v56, OS_LOG_TYPE_DEBUG))
                  {
                    v100 = objc_msgSend(v47, "timestamp");
                    v101 = objc_msgSend(v47, "madeRunnableByThreadId");
                    v102 = objc_msgSend(v47, "madeRunnableByThreadId");
                    v103 = (void *)objc_claimAutoreleasedReturnValue(+[NSNumber numberWithUnsignedLongLong:](NSNumber, "numberWithUnsignedLongLong:", objc_msgSend(v47, "madeRunnableByThreadId")));
                    v104 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v187, "objectForKeyedSubscript:", v103));
                    v105 = objc_msgSend(v104, "maxBlockingTime");
                    *(_DWORD *)v199 = 134219264;
                    *(_QWORD *)&v199[4] = v100;
                    *(_WORD *)&v199[12] = 2048;
                    *(_QWORD *)&v199[14] = v178;
                    *(_WORD *)&v199[22] = 2048;
                    v200 = v101;
                    *(_WORD *)v201 = 2048;
                    *(_QWORD *)&v201[2] = v102;
                    *(_WORD *)&v201[10] = 2048;
                    *(_QWORD *)&v201[12] = v179;
                    v202 = 2048;
                    v203 = (unint64_t)v105;
                    _os_log_debug_impl((void *)&_mh_execute_header, v56, OS_LOG_TYPE_DEBUG, "iterateMkRunnableDataToFindBlockingThreadInfo: eachMadeRunnable: %llu - thread %llx by %llx => thread %llu total time is up to %llu and max time %llu", v199, 0x3Eu);

                  }
                  v24 = a7;
                  v41 = v193;
                }
                else
                {
                  v70 = sub_10001D38C();
                  v56 = objc_claimAutoreleasedReturnValue(v70);
                  v24 = a7;
                  if (os_log_type_enabled(v56, OS_LOG_TYPE_FAULT))
                  {
                    v183 = v65;
                    v71 = objc_msgSend(v47, "timestamp");
                    v72 = objc_msgSend(v47, "madeRunnableByThreadId");
                    *(_DWORD *)v199 = 134219008;
                    *(_QWORD *)&v199[4] = v71;
                    *(_WORD *)&v199[12] = 2048;
                    *(_QWORD *)&v199[14] = v178;
                    *(_WORD *)&v199[22] = 2048;
                    v200 = v72;
                    *(_WORD *)v201 = 2048;
                    *(_QWORD *)&v201[2] = v66;
                    *(_WORD *)&v201[10] = 2048;
                    *(_QWORD *)&v201[12] = v183;
                    _os_log_fault_impl((void *)&_mh_execute_header, v56, OS_LOG_TYPE_FAULT, "iterateMkRunnableDataToFindBlockingThreadInfo: eachMadeRunnable: %llu - thread %llx by %llx -> NEGATIVE blocked time = %llu - %llu)", v199, 0x34u);
                  }
                }
                goto LABEL_43;
              }
            }
            else
            {
              v55 = sub_10001D38C();
              v56 = objc_claimAutoreleasedReturnValue(v55);
              if (os_log_type_enabled(v56, OS_LOG_TYPE_DEBUG))
              {
                v57 = objc_msgSend(v47, "timestamp");
                v58 = objc_msgSend(v47, "madeRunnableByThreadId");
                *(_DWORD *)v199 = 134218496;
                *(_QWORD *)&v199[4] = v57;
                *(_WORD *)&v199[12] = 2048;
                *(_QWORD *)&v199[14] = v178;
                *(_WORD *)&v199[22] = 2048;
                v200 = v58;
                _os_log_debug_impl((void *)&_mh_execute_header, v56, OS_LOG_TYPE_DEBUG, "iterateMkRunnableDataToFindBlockingThreadInfo: eachMadeRunnable: %llu - thread %llx by %llx mkRunnableTime, threadState is nil", v199, 0x20u);
              }
LABEL_43:

            }
            v45 = v194;
            v42 = v196;
          }
          v46 = (char *)v46 + 1;
        }
        while (v44 != v46);
        v106 = objc_msgSend(v42, "countByEnumeratingWithState:objects:count:", v213, buf, 16);
        v44 = v106;
      }
      while (v106);
    }

    v107 = sub_10001D38C();
    v108 = objc_claimAutoreleasedReturnValue(v107);
    if (os_log_type_enabled(v108, OS_LOG_TYPE_DEFAULT))
    {
      *(_DWORD *)buf = 138412290;
      *(_QWORD *)&buf[4] = v187;
      _os_log_impl((void *)&_mh_execute_header, v108, OS_LOG_TYPE_DEFAULT, "findBlockingThreadForTailspin: Cumulative Blocking Time By Thread: %@", buf, 0xCu);
    }

    v109 = (void *)objc_claimAutoreleasedReturnValue(+[NSNumber numberWithUnsignedLongLong:](NSNumber, "numberWithUnsignedLongLong:", v178));
    objc_msgSend(v187, "removeObjectForKey:", v109);

    if (!objc_msgSend(v187, "count"))
    {
      v161 = sub_10001D38C();
      v162 = objc_claimAutoreleasedReturnValue(v161);
      v163 = v162;
      if (v178 == v170)
      {
        v10 = v169;
        blockingThreadInfo = v173;
        if (os_log_type_enabled(v162, OS_LOG_TYPE_DEFAULT))
        {
          *(_WORD *)buf = 0;
          _os_log_impl((void *)&_mh_execute_header, v163, OS_LOG_TYPE_DEFAULT, "findBlockingThreadForTailspin: no thread found for hangAppMainThreadId ", buf, 2u);
        }

        v157 = 4;
        v176 = v198;
        goto LABEL_111;
      }
      v10 = v169;
      blockingThreadInfo = v173;
      if (os_log_type_enabled(v162, OS_LOG_TYPE_INFO))
      {
        *(_DWORD *)buf = 134217984;
        *(_QWORD *)&buf[4] = v178;
        _os_log_impl((void *)&_mh_execute_header, v163, OS_LOG_TYPE_INFO, "findBlockingThreadForTailspin: no thread found for currentNestedThreadId =%llx ", buf, 0xCu);
      }

LABEL_109:
LABEL_110:
      v164 = v168;
      blockingThreadInfo = self->_blockingThreadInfo;
      self->_blockingThreadInfo = v164;
      v157 = 5;
      goto LABEL_111;
    }
    v110 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v187, "keysSortedByValueUsingComparator:", &stru_100075438));
    v111 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v187, "keysSortedByValueUsingComparator:", &stru_100075458));
    v112 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v111, "objectAtIndexedSubscript:", 0));
    v113 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v187, "objectForKeyedSubscript:", v112));
    v114 = +[NSNumber numberWithDouble:](NSNumber, "numberWithDouble:", sub_1000064D8((unint64_t)objc_msgSend(v113, "cumulativeTime")));
    v115 = (void *)objc_claimAutoreleasedReturnValue(v114);

    v116 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v175, "objectForKeyedSubscript:", v112));
    v117 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v110, "objectAtIndexedSubscript:", 0));
    v118 = objc_msgSend(v117, "unsignedLongLongValue");
    v119 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v111, "objectAtIndexedSubscript:", 0));
    v120 = objc_msgSend(v119, "unsignedLongLongValue");

    v121 = v118 == v120;
    v122 = a7;
    v123 = self;
    if (!v121)
    {
      v124 = sub_10001D38C();
      v125 = objc_claimAutoreleasedReturnValue(v124);
      if (os_log_type_enabled(v125, OS_LOG_TYPE_DEFAULT))
      {
        v195 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v111, "objectAtIndexedSubscript:", 0));
        v186 = objc_msgSend(v195, "unsignedLongLongValue");
        v190 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v187, "objectForKeyedSubscript:", v112));
        v197 = v116;
        v126 = objc_msgSend(v190, "cumulativeTime");
        v127 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v110, "objectAtIndexedSubscript:", 0));
        v128 = objc_msgSend(v127, "unsignedLongLongValue");
        v129 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v110, "objectAtIndexedSubscript:", 0));
        v130 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v187, "objectForKeyedSubscript:", v129));
        v131 = objc_msgSend(v130, "cumulativeTime");
        *(_DWORD *)buf = 134218752;
        *(_QWORD *)&buf[4] = v186;
        *(_WORD *)&buf[12] = 2048;
        *(_QWORD *)&buf[14] = v126;
        v116 = v197;
        *(_WORD *)&buf[22] = 2048;
        v209 = v128;
        LOWORD(v210) = 2048;
        *(_QWORD *)((char *)&v210 + 2) = v131;
        _os_log_impl((void *)&_mh_execute_header, v125, OS_LOG_TYPE_DEFAULT, "findBlockingThreadForTailspin: max cumulative Thread id %llx, blocking time %llu, max block time thread id %llx, blocking time %llu ", buf, 0x2Au);

        v123 = self;
        v122 = a7;

      }
    }
    v15 = v177;
    -[HRMakeRunnableData storeTopBlockingThreadInfoInBlockingThreadInfo:sampleStore:mostBlockingTimeThreadId:pidMostBlockingTime:blockedTime:isHangMainThread:](v123, "storeTopBlockingThreadInfoInBlockingThreadInfo:sampleStore:mostBlockingTimeThreadId:pidMostBlockingTime:blockedTime:isHangMainThread:", v177, v193, v112, v116, v115, v178 == v170);
    if ((unint64_t)objc_msgSend(v115, "unsignedLongLongValue") < 0x33)
    {
      v139 = 0;
      v16 = 0;
      v176 = v198;
    }
    else
    {
      -[HRMakeRunnableData storeOtherBlockingThreadInfoInBlockingThreadInfo:sampleStore:mostBlockingTimeThreadId:sortedThreadsMaxCumlativeTime:blockingTimeByThread:tidToPidDict:](v123, "storeOtherBlockingThreadInfoInBlockingThreadInfo:sampleStore:mostBlockingTimeThreadId:sortedThreadsMaxCumlativeTime:blockingTimeByThread:tidToPidDict:", v177, v193, v112, v111, v187, v175);
      if (!v116)
      {
        v140 = sub_10001D38C();
        v141 = objc_claimAutoreleasedReturnValue(v140);
        if (os_log_type_enabled(v141, OS_LOG_TYPE_DEFAULT))
        {
          v142 = objc_msgSend(v112, "unsignedLongLongValue");
          *(_DWORD *)buf = 134217984;
          *(_QWORD *)&buf[4] = v142;
          _os_log_impl((void *)&_mh_execute_header, v141, OS_LOG_TYPE_DEFAULT, "findBlockingThreadForTailspin: pid is nil for Thread with most blocking time %llx ", buf, 0xCu);
        }

        v16 = 0;
        v139 = 3;
        v176 = v198;
        goto LABEL_69;
      }
      v132 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v187, "objectForKeyedSubscript:", v112));
      v133 = objc_msgSend(v132, "endThreadTime");

      v134 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v187, "objectForKeyedSubscript:", v112));
      v135 = objc_msgSend(v134, "startThreadTime");

      v136 = sub_10001D38C();
      v137 = objc_claimAutoreleasedReturnValue(v136);
      if (os_log_type_enabled(v137, OS_LOG_TYPE_INFO))
      {
        *(_DWORD *)buf = v166;
        *(_QWORD *)&buf[4] = v135;
        *(_WORD *)&buf[12] = 2048;
        *(_QWORD *)&buf[14] = v133;
        _os_log_impl((void *)&_mh_execute_header, v137, OS_LOG_TYPE_INFO, "findBlockingThreadForTailspin: new threadStartTime %llu endTime %llu ", buf, 0x16u);
      }

      if (v133 - v135 <= (v122 - a6) >> 1)
      {
        v139 = 0;
        v16 = 0;
        v176 = v198;
        a6 = (unint64_t)v135;
        a7 = (unint64_t)v133;
LABEL_69:
        v15 = v177;
        goto LABEL_70;
      }
      v178 = objc_msgSend(v112, "unsignedLongLongValue");
      v138 = sub_100014868(v193, v175, (uint64_t)v178);
      v176 = (void *)objc_claimAutoreleasedReturnValue(v138);

      v15 = objc_alloc_init((Class)NSMutableDictionary);
      objc_msgSend(v177, "setObject:forKeyedSubscript:", v15, CFSTR("nextTopBlockingThreadInfo"));

      v139 = 0;
      ++v174;
      v16 = 1;
      a6 = (unint64_t)v135;
      a7 = (unint64_t)v133;
    }
LABEL_70:

    v10 = v169;
    if (v139)
    {
      v177 = v15;
      goto LABEL_110;
    }
  }
  v158 = sub_10001D38C();
  v159 = objc_claimAutoreleasedReturnValue(v158);
  v160 = v159;
  if (v178 != v170)
  {
    if (os_log_type_enabled(v159, OS_LOG_TYPE_INFO))
    {
      *(_DWORD *)buf = 134217984;
      *(_QWORD *)&buf[4] = v178;
      _os_log_impl((void *)&_mh_execute_header, v160, OS_LOG_TYPE_INFO, "findBlockingThreadForTailspin: 0 mkrunnable tracepoints found for threadId = %llx", buf, 0xCu);
    }

    goto LABEL_109;
  }
  if (os_log_type_enabled(v159, OS_LOG_TYPE_DEFAULT))
  {
    *(_WORD *)buf = 0;
    _os_log_impl((void *)&_mh_execute_header, v160, OS_LOG_TYPE_DEFAULT, "findBlockingThreadForTailspin: 0 mkrunnable tracepoints found for hang main app thread", buf, 2u);
  }

  v157 = 3;
LABEL_111:

  return v157;
}

- (int64_t)findBlockingThreadFromSampleStore:(id)a3 mainThread:(id)a4 hangStartTime:(unint64_t)a5 hangEndTime:(unint64_t)a6
{
  id v8;
  id v9;
  id v10;
  id v11;
  id v12;
  id v13;
  void *v14;
  void *v15;
  void *v16;
  id v17;
  int64_t v18;
  id v19;
  void *v20;
  unsigned int v21;
  id v22;
  id v23;
  void *v24;
  void *v25;
  void *v26;
  void *v27;
  id v28;
  uint64_t v29;
  void *v30;
  void *v31;
  void *v32;
  void *v33;
  id v34;
  void *v35;
  void *v36;
  void *v37;
  unsigned __int8 v38;
  id obj;
  id v41;
  void *v42;
  id v43;
  void *v44;
  void *v45;
  void *v47;
  void *v48;

  v8 = a3;
  v9 = a4;
  v47 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v8, "tidToPidDict"));
  v10 = objc_msgSend(v9, "threadId");
  v11 = v9;
  v12 = objc_alloc_init((Class)NSMutableDictionary);
  v13 = v12;
  v14 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v11, "threadStates"));
  v15 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v14, "lastObject"));

  v16 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v15, "endTimestamp"));
  v17 = objc_msgSend(v16, "machAbsTime");

  if ((unint64_t)v17 > a6)
  {
    v18 = 4;
    v19 = v13;
    v20 = v11;
    goto LABEL_34;
  }
  obj = v12;
  v45 = v8;
  v43 = v10;
  v44 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v15, "endTimestamp"));
  v21 = -1;
  v22 = v10;
  v41 = v11;
  v42 = v13;
  v23 = v11;
  v24 = v15;
  v25 = v13;
  while (1)
  {
    v26 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v24, "turnstileInfo"));
    v27 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v24, "waitInfo"));
    v48 = v23;
    if (v26 && objc_msgSend(v26, "blockingTid"))
    {
      v28 = objc_msgSend(v26, "blockingTid");
LABEL_12:
      v29 = (uint64_t)objc_msgSend(v26, "blockingPid");
      if (!v27)
        goto LABEL_18;
      goto LABEL_16;
    }
    if (v27 && objc_msgSend(v27, "blockingTid"))
    {
      v28 = objc_msgSend(v27, "blockingTid");
      v29 = (uint64_t)objc_msgSend(v27, "blockingPid");
    }
    else
    {
      if (v26)
      {
        v28 = 0;
        if (objc_msgSend(v26, "blockingPid") != -1)
          goto LABEL_12;
      }
      else
      {
        v28 = 0;
      }
      v29 = 0xFFFFFFFFLL;
      if (!v27)
        goto LABEL_18;
    }
LABEL_16:
    if (objc_msgSend(v27, "blockingPid") != -1)
      v29 = (uint64_t)objc_msgSend(v27, "blockingPid");
LABEL_18:
    if (!v28 && (_DWORD)v29 == -1)
      goto LABEL_27;
    if ((_DWORD)v29 == -1)
    {
      v30 = (void *)objc_claimAutoreleasedReturnValue(+[NSNumber numberWithUnsignedLongLong:](NSNumber, "numberWithUnsignedLongLong:", v28));
      v31 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v47, "objectForKeyedSubscript:", v30));
      v29 = (uint64_t)objc_msgSend(v31, "intValue");

    }
    v32 = (void *)objc_claimAutoreleasedReturnValue(+[NSNumber numberWithUnsignedLongLong:](NSNumber, "numberWithUnsignedLongLong:", v28));
    v33 = (void *)objc_claimAutoreleasedReturnValue(+[NSNumber numberWithInt:](NSNumber, "numberWithInt:", v29));
    -[HRMakeRunnableData storeTopBlockingThreadInfoInBlockingThreadInfo:sampleStore:mostBlockingTimeThreadId:pidMostBlockingTime:blockedTime:isHangMainThread:](self, "storeTopBlockingThreadInfoInBlockingThreadInfo:sampleStore:mostBlockingTimeThreadId:pidMostBlockingTime:blockedTime:isHangMainThread:", v25, v45, v32, v33, &off_10007A680, v22 == v43);

    if (!v28)
    {
LABEL_27:
      v15 = v24;
      v20 = v48;
      goto LABEL_29;
    }
    v34 = sub_100014868(v45, v47, (uint64_t)v28);
    v20 = (void *)objc_claimAutoreleasedReturnValue(v34);

    v35 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v20, "threadStates"));
    v15 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v35, "lastObject"));

    v36 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v15, "startTimestamp"));
    if ((objc_msgSend(v36, "le:", v44) & 1) == 0)
      break;
    v37 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v15, "endTimestamp"));
    v38 = objc_msgSend(v37, "ge:", v44);

    if ((v38 & 1) == 0)
      goto LABEL_29;
    v19 = objc_alloc_init((Class)NSMutableDictionary);
    objc_msgSend(v25, "setObject:forKeyedSubscript:", v19, CFSTR("nextTopBlockingThreadInfo"));

    ++v21;
    v22 = v28;
    v23 = v20;
    v24 = v15;
    v25 = v19;
    if (v21 >= 0x1F)
      goto LABEL_30;
  }

LABEL_29:
  v19 = v25;
LABEL_30:
  v13 = v42;
  if (objc_msgSend(v42, "count"))
  {
    objc_storeStrong((id *)&self->_blockingThreadInfo, obj);
    v18 = 5;
  }
  else
  {
    v18 = 4;
  }
  v8 = v45;
  v11 = v41;

LABEL_34:
  return v18;
}

- (NSMutableArray)allBlockingThreadsArray
{
  return (NSMutableArray *)objc_getProperty(self, a2, 8, 1);
}

- (void)setAllBlockingThreadsArray:(id)a3
{
  objc_setProperty_atomic(self, a2, a3, 8);
}

- (NSNumber)topBlockingPid
{
  return (NSNumber *)objc_getProperty(self, a2, 16, 1);
}

- (void)setTopBlockingPid:(id)a3
{
  objc_setProperty_atomic(self, a2, a3, 16);
}

- (NSDictionary)blockingThreadInfo
{
  return (NSDictionary *)objc_getProperty(self, a2, 24, 1);
}

- (void)setBlockingThreadInfo:(id)a3
{
  objc_setProperty_atomic(self, a2, a3, 24);
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_blockingThreadInfo, 0);
  objc_storeStrong((id *)&self->_topBlockingPid, 0);
  objc_storeStrong((id *)&self->_allBlockingThreadsArray, 0);
}

@end
