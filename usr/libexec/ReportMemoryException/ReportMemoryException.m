void sub_10000294C(id a1)
{
  id v1;
  uint64_t v2;
  void *v3;

  CSSetForceSafeMachVMReads(1);
  v1 = sub_1000056D8(0);
  v2 = objc_claimAutoreleasedReturnValue(v1);
  v3 = (void *)qword_1000146A0;
  qword_1000146A0 = v2;

}

id sub_10000297C(void *a1, int a2, _QWORD *a3)
{
  id v5;
  id v6;
  id v7;
  void *v8;
  void *v9;
  float v10;
  int v11;
  char *v12;
  _BYTE *v13;
  void *v14;
  id v16;
  id v17;
  uint64_t v18;
  uint64_t v19;
  void *i;
  void *v21;
  void *v22;
  NSFileAttributeType v23;
  uint64_t v24;
  _QWORD *v25;
  id v26;
  id v27;
  __int128 v28;
  __int128 v29;
  __int128 v30;
  __int128 v31;
  uint8_t buf[4];
  uint64_t v33;
  __int16 v34;
  id v35;
  _BYTE v36[128];

  v5 = a1;
  v6 = objc_msgSend(objc_alloc((Class)RMECacheEnumerator), "initCacheEnumeratorWithVolume:", v5);
  v7 = sub_1000043F4(0, 0, v6);
  v8 = (void *)objc_claimAutoreleasedReturnValue(v7);
  v9 = (void *)objc_claimAutoreleasedReturnValue(+[NSFileManager defaultManager](NSFileManager, "defaultManager"));
  if (a3)
    *a3 = 0;
  if (!v8 || !objc_msgSend(v8, "count"))
    goto LABEL_8;
  v10 = 0.75;
  if ((a2 - 2) <= 2)
    v10 = flt_10000D7E0[a2 - 2];
  v11 = (int)(float)(v10 * (float)(unint64_t)objc_msgSend(v8, "count"));
  v12 = (char *)objc_msgSend(v8, "count");
  v13 = objc_msgSend(v8, "count");
  if (v12 != (char *)v11)
  {
    v25 = a3;
    v26 = v6;
    v27 = v5;
    v14 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v8, "subarrayWithRange:", v13 - &v12[-v11]));
    v28 = 0u;
    v29 = 0u;
    v30 = 0u;
    v31 = 0u;
    v16 = objc_msgSend(v14, "countByEnumeratingWithState:objects:count:", &v28, v36, 16);
    if (v16)
    {
      v17 = v16;
      v18 = 0;
      v19 = *(_QWORD *)v29;
      do
      {
        for (i = 0; i != v17; i = (char *)i + 1)
        {
          if (*(_QWORD *)v29 != v19)
            objc_enumerationMutation(v14);
          v21 = *(void **)(*((_QWORD *)&v28 + 1) + 8 * (_QWORD)i);
          v22 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v9, "attributesOfItemAtPath:error:", v21, 0));
          v23 = (NSFileAttributeType)objc_claimAutoreleasedReturnValue(objc_msgSend(v22, "fileType"));

          if (v23 == NSFileTypeDirectory)
            v24 = sub_100005EBC(v21);
          else
            v24 = (uint64_t)objc_msgSend(v22, "fileSize");
          v18 += v24;

        }
        v17 = objc_msgSend(v14, "countByEnumeratingWithState:objects:count:", &v28, v36, 16);
      }
      while (v17);
    }
    else
    {
      v18 = 0;
    }
    if (v25)
      *v25 = v18;
    v6 = v26;
    v5 = v27;
    if (os_log_type_enabled((os_log_t)&_os_log_default, OS_LOG_TYPE_DEFAULT))
    {
      *(_DWORD *)buf = 134218242;
      v33 = v18;
      v34 = 2112;
      v35 = v27;
      _os_log_impl((void *)&_mh_execute_header, (os_log_t)&_os_log_default, OS_LOG_TYPE_DEFAULT, "Can purge %lu from %@", buf, 0x16u);
    }
  }
  else
  {
LABEL_8:
    v14 = 0;
  }

  return v14;
}

void sub_100002C30(uint64_t a1)
{
  uint64_t v1;
  int v2;
  void *v3;
  void *v4;
  void *v5;
  void (**v6)(id, id);
  id v7;
  void *v8;
  id v9;
  id v10;
  id v11;
  id v12;
  id v13;
  id v14;
  id v15;
  id v16;
  int v17;
  int v18;
  int v19;
  void *v20;
  void *v21;
  void *v22;
  id v23;
  id v24;
  id v25;
  id v26;
  unsigned __int8 v27;
  void *v28;
  void *v29;
  void *v30;
  void *v31;
  id v32;
  id v33;
  uint64_t v34;
  id v35;
  uint64_t v36;
  id v37;
  uint64_t v38;
  id v39;
  uint64_t v40;
  id v41;
  uint64_t v42;
  BOOL v43;
  id v44;
  int v45;
  _BOOL4 v46;
  void *v47;
  void *v48;
  id v49;
  id v50;
  id v51;
  id v52;
  unsigned __int8 v53;
  char *v54;
  void *v55;
  int64_t v56;
  uint64_t v57;
  BOOL v58;
  char v59;
  BOOL v60;
  _BOOL4 v61;
  void *v62;
  id v63;
  void *v64;
  double v65;
  id v66;
  void *v67;
  unsigned int v68;
  uint64_t v69;
  uint64_t v70;
  void *v71;
  unsigned int v72;
  uint64_t v73;
  void *v74;
  id v75;
  char *v76;
  uint64_t v77;
  unsigned int v78;
  unsigned int v79;
  unsigned int v80;
  uint64_t v81;
  unint64_t v82;
  uint64_t v83;
  uint64_t v84;
  const char *v85;
  const char *v86;
  unsigned int v87;
  const __CFString *v88;
  id v89;
  unint64_t v90;
  id v91;
  double v92;
  void *v93;
  uint64_t v94;
  void *v95;
  dispatch_qos_class_t v96;
  uint64_t v97;
  void *v98;
  void *v99;
  id v100;
  id v101;
  id v102;
  id v103;
  id v104;
  void (**v105)(id, id);
  _BYTE *v106;
  dispatch_block_t v107;
  dispatch_time_t v108;
  unsigned int v109;
  uint64_t v110;
  uint64_t v111;
  uint64_t v112;
  char *v113;
  char *v114;
  id v115;
  id v116;
  char *v117;
  uint64_t v118;
  uint64_t v119;
  unsigned int v120;
  void *v121;
  void *v122;
  void *v123;
  void *v124;
  void *v125;
  uint64_t v126;
  uint64_t v127;
  uint64_t v128;
  uint64_t v129;
  uint64_t v130;
  uint64_t v131;
  uint64_t v132;
  id v133;
  uint64_t v134;
  id v135;
  unsigned int v136;
  id v137;
  id v138;
  id v139;
  id v140;
  uint64_t v141;
  id v142;
  void *v143;
  void *v144;
  int64_t v145;
  unsigned int v146;
  unsigned int v147;
  id v148;
  id v149;
  id v150;
  id v151;
  NSObject *loga;
  os_log_t log;
  void *v154;
  uint64_t v155;
  id v156;
  void *v157;
  void *v158;
  id v159;
  NSObject *v160;
  NSObject *queue;
  id v162;
  void *v163;
  id block[5];
  id v165;
  id v166[4];
  char v167;
  char v168;
  id from;
  id location;
  id v171[4];
  int v172;
  id v173;
  _BYTE buf[32];
  _BYTE v175[48];
  id v176;
  __int16 v177;
  id v178;
  __int16 v179;
  id v180;
  __int16 v181;
  id v182;
  __int16 v183;
  id v184;
  __int16 v185;
  id v186;
  __int16 v187;
  id v188;
  __int16 v189;
  id v190;
  __int16 v191;
  id v192;
  __int16 v193;
  id v194;
  __int16 v195;
  id v196;
  __int16 v197;
  id v198;

  v1 = *(unsigned int *)(a1 + 64);
  v2 = *(unsigned __int8 *)(a1 + 68);
  v3 = *(void **)(a1 + 40);
  v4 = *(void **)(a1 + 48);
  v5 = *(void **)(a1 + 56);
  v159 = *(id *)(a1 + 32);
  v160 = v3;
  queue = v4;
  v6 = v5;
  v173 = 0;
  v163 = (void *)objc_claimAutoreleasedReturnValue(+[MemoryResourceException resourceExceptionFromTask:error:](MemoryResourceException, "resourceExceptionFromTask:error:", v1, &v173));
  v162 = v173;
  mach_port_deallocate(mach_task_self_, v1);
  if (!v163 || v162 || objc_msgSend(v163, "exceptionType") == (id)7)
  {
    if (v6)
      v6[2](v6, v162);
    goto LABEL_187;
  }
  v7 = v163;
  if (qword_1000146B8 != -1)
    dispatch_once(&qword_1000146B8, &stru_1000105F0);
  v8 = (void *)qword_1000146B0;
  if (qword_1000146B0 && os_signpost_enabled((os_log_t)qword_1000146B0))
  {
    loga = v8;
    v157 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v7, "execName"));
    v154 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v7, "bundleID"));
    v9 = objc_msgSend(v7, "exceptionType");
    v150 = objc_msgSend(v7, "limitValue");
    v148 = objc_msgSend(v7, "upTime");
    v146 = objc_msgSend(v7, "pid");
    v144 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v7, "coalitionBundleID"));
    v142 = objc_msgSend(v7, "ledgerPhysFootprint");
    v140 = objc_msgSend(v7, "ledgerPhysFootprintPeak");
    v139 = objc_msgSend(v7, "ledgerInternal");
    v137 = objc_msgSend(v7, "ledgerInternalCompressed");
    v135 = objc_msgSend(v7, "ledgerAlternateAccounting");
    v133 = objc_msgSend(v7, "ledgerAlternateAccountingCompressed");
    v10 = objc_msgSend(v7, "ledgerIOKitMapped");
    v11 = objc_msgSend(v7, "ledgerPageTable");
    v12 = objc_msgSend(v7, "ledgerWiredMem");
    v13 = objc_msgSend(v7, "ledgerPurgeableNonvolatile");
    v14 = objc_msgSend(v7, "ledgerPurgeableNonvolatileCompressed");
    v15 = objc_msgSend(v7, "ledgerNetworkNonvolatile");
    v16 = objc_msgSend(v7, "ledgerNetworkNonvolatileCompressed");
    *(_DWORD *)buf = 138548226;
    *(_QWORD *)&buf[4] = v157;
    *(_WORD *)&buf[12] = 2114;
    *(_QWORD *)&buf[14] = v154;
    *(_WORD *)&buf[22] = 2050;
    *(_QWORD *)&buf[24] = v9;
    *(_WORD *)v175 = 2050;
    *(_QWORD *)&v175[2] = v150;
    *(_WORD *)&v175[10] = 2050;
    *(_QWORD *)&v175[12] = v148;
    *(_WORD *)&v175[20] = 1026;
    *(_DWORD *)&v175[22] = v146;
    *(_WORD *)&v175[26] = 2114;
    *(_QWORD *)&v175[28] = v144;
    *(_WORD *)&v175[36] = 2050;
    *(_QWORD *)&v175[38] = v142;
    *(_WORD *)&v175[46] = 2050;
    v176 = v140;
    v177 = 2050;
    v178 = v139;
    v179 = 2050;
    v180 = v137;
    v181 = 2050;
    v182 = v135;
    v183 = 2050;
    v184 = v133;
    v185 = 2050;
    v186 = v10;
    v187 = 2050;
    v188 = v11;
    v189 = 2050;
    v190 = v12;
    v191 = 2050;
    v192 = v13;
    v193 = 2050;
    v194 = v14;
    v195 = 2050;
    v196 = v15;
    v197 = 2050;
    v198 = v16;
    _os_signpost_emit_with_name_impl((void *)&_mh_execute_header, loga, OS_SIGNPOST_EVENT, 0xEEEEB0B5B2B2EEEELL, "CorpseReceived", "execName=%{public,signpost.description:attribute}@ bundleID=%{public,signpost.description:attribute}@ exceptionType=%{public,signpost.description:attribute}ld limitValue=%{public,signpost.description:attribute}llu upTime=%{public,signpost.description:attribute}lli pid=%{public,signpost.description:attribute}d coalitionBundleID=%{public,signpost.description:attribute}@ ledgerPhysFootprint=%{public,signpost.description:attribute}llu ledgerPhysFootprintPeak=%{public,signpost.description:attribute}llu ledgerInternal=%{public,signpost.description:attribute}llu ledgerInternalCompressed=%{public,signpost.description:attribute}llu ledgerAlternateAccounting=%{public,signpost.description:attribute}llu ledgerAlternateAccountingCompressed=%{public,signpost.description:attribute}llu ledgerIOKitMapped=%{public,signpost.description:attribute}llu ledgerPageTable=%{public,signpost.description:attribute}llu ledgerWiredMem=%{public,signpost.description:attribute}llu ledgerPurgeableNonvolatile=%{public,signpost.description:attribute}llu ledgerPurgeableNonvolatileCompressed=%{public,signpost.description:attribute}llu ledgerNetworkNonvolatile=%{public,signpost.description:attribute}llu ledgerNetworkNonvolatileCompressed=%{public,signpost.description:attribute}llu ", buf, 0xC6u);

  }
  v158 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v7, "execName"));
  if (qword_1000146C0 - qword_1000146C8 >= (unint64_t)sub_100007190(v158))
  {
    objc_msgSend(v7, "releaseAnalyzedTask");
    v21 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v7, "execName"));
    v22 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v7, "bundleID"));
    v23 = objc_msgSend(v7, "exceptionType");
    v24 = objc_msgSend(v7, "ledgerPhysFootprint");
    v25 = objc_msgSend(v7, "ledgerPhysFootprintPeak");
    v26 = objc_msgSend(v7, "limitValue");
    v27 = objc_msgSend(v7, "isMSLEnabled");
    BYTE1(v112) = objc_msgSend(v7, "gcoreCapture");
    LOBYTE(v112) = v27;
    LOBYTE(v111) = 0;
    LOBYTE(v110) = 0;
    +[RMETelemetry emitTelemetryForExecName:bundleID:exceptionType:footprint:footprintPeak:jetsamLimit:memgraphAttempted:memgraphSkippedReason:memgraphSucceeded:memgraphFailedReason:diagFilePath:isMSLEnabled:isGcoreCapture:](RMETelemetry, "emitTelemetryForExecName:bundleID:exceptionType:footprint:footprintPeak:jetsamLimit:memgraphAttempted:memgraphSkippedReason:memgraphSucceeded:memgraphFailedReason:diagFilePath:isMSLEnabled:isGcoreCapture:", v21, v22, v23, v24, v25, v26, v110, 4, v111, 0, 0, v112);

    if (v6)
    {
      v28 = (void *)objc_claimAutoreleasedReturnValue(+[NSError errorWithDomain:code:userInfo:](NSError, "errorWithDomain:code:userInfo:", MREErrorDomain[0], 14, 0));
      v6[2](v6, v28);

    }
    goto LABEL_186;
  }
  v147 = objc_msgSend(v7, "pid");
  if ((objc_msgSend(v7, "isFirstParty") & 1) == 0 && (sub_10000A8B4() & 1) == 0)
  {
    v47 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v7, "execName"));
    v48 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v7, "bundleID"));
    v49 = objc_msgSend(v7, "exceptionType");
    v50 = objc_msgSend(v7, "ledgerPhysFootprint");
    v51 = objc_msgSend(v7, "ledgerPhysFootprintPeak");
    v52 = objc_msgSend(v7, "limitValue");
    v53 = objc_msgSend(v7, "isMSLEnabled");
    BYTE1(v112) = objc_msgSend(v7, "gcoreCapture");
    LOBYTE(v112) = v53;
    LOBYTE(v111) = 0;
    LOBYTE(v110) = 0;
    +[RMETelemetry emitTelemetryForExecName:bundleID:exceptionType:footprint:footprintPeak:jetsamLimit:memgraphAttempted:memgraphSkippedReason:memgraphSucceeded:memgraphFailedReason:diagFilePath:isMSLEnabled:isGcoreCapture:](RMETelemetry, "emitTelemetryForExecName:bundleID:exceptionType:footprint:footprintPeak:jetsamLimit:memgraphAttempted:memgraphSkippedReason:memgraphSucceeded:memgraphFailedReason:diagFilePath:isMSLEnabled:isGcoreCapture:", v47, v48, v49, v50, v51, v52, v110, 7, v111, 0, 0, v112);

    objc_msgSend(v7, "releaseAnalyzedTask");
    if (v6)
      v6[2](v6, 0);
    goto LABEL_186;
  }
  if (v2)
  {
    v155 = 0;
    LOBYTE(v17) = 0;
    v18 = 1;
    v19 = 1;
    v20 = v158;
    goto LABEL_170;
  }
  log = (os_log_t)v7;
  v120 = -[NSObject pid](log, "pid");
  v29 = (void *)objc_claimAutoreleasedReturnValue(-[NSObject execName](log, "execName"));
  v30 = (void *)objc_claimAutoreleasedReturnValue(-[NSObject currentTime](log, "currentTime"));
  v136 = -[NSObject isMSLEnabled](log, "isMSLEnabled");
  v31 = (void *)qword_1000146A0;
  v138 = -[NSObject exceptionType](log, "exceptionType");
  v151 = v31;
  v32 = v29;
  v156 = v30;
  LOBYTE(from) = 0;
  v143 = v32;
  if (!v32 || !v156 || !v151)
  {
    if (os_log_type_enabled((os_log_t)&_os_log_default, OS_LOG_TYPE_ERROR))
    {
      *(_DWORD *)buf = 138543874;
      *(_QWORD *)&buf[4] = v32;
      *(_WORD *)&buf[12] = 1024;
      *(_DWORD *)&buf[14] = v120;
      *(_WORD *)&buf[18] = 2112;
      *(_QWORD *)&buf[20] = v156;
      _os_log_error_impl((void *)&_mh_execute_header, (os_log_t)&_os_log_default, OS_LOG_TYPE_ERROR, "Insufficient data available to evaluation the available file quota. execname: %{public}@ [%d], date: %@", buf, 0x1Cu);
    }
    v44 = 0;
    v45 = 0;
    v17 = 0;
    v46 = 0;
    goto LABEL_155;
  }
  LOBYTE(location) = 0;
  v145 = sub_10000A920(v151, (uint64_t)v138, v32, &location, &from);
  v125 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v151, "objectForKeyedSubscript:", off_1000145F8[0]));
  v124 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v151, "objectForKeyedSubscript:", off_100014600[0]));
  v123 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v151, "objectForKeyedSubscript:", off_100014608[0]));
  v121 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v151, "objectForKeyedSubscript:", off_100014618[0]));
  v122 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v151, "objectForKeyedSubscript:", off_100014610[0]));
  v119 = sub_10000AE4C((uint64_t)v151);
  v33 = objc_msgSend(v125, "integerValue");
  if ((unint64_t)v33 >= 0x7FFFFFFFFFFFFFFFLL)
    v34 = 0x7FFFFFFFFFFFFFFFLL;
  else
    v34 = (uint64_t)v33;
  v134 = v34;
  v35 = objc_msgSend(v124, "integerValue");
  if ((unint64_t)v35 >= 0x7FFFFFFFFFFFFFFFLL)
    v36 = 0x7FFFFFFFFFFFFFFFLL;
  else
    v36 = (uint64_t)v35;
  v130 = v36;
  v37 = objc_msgSend(v123, "integerValue");
  if ((unint64_t)v37 >= 0x7FFFFFFFFFFFFFFFLL)
    v38 = 0x7FFFFFFFFFFFFFFFLL;
  else
    v38 = (uint64_t)v37;
  v132 = v38;
  v39 = objc_msgSend(v122, "integerValue");
  if ((unint64_t)v39 >= 0x7FFFFFFFFFFFFFFFLL)
    v40 = 0x7FFFFFFFFFFFFFFFLL;
  else
    v40 = (uint64_t)v39;
  v129 = v40;
  v41 = objc_msgSend(v121, "integerValue");
  v42 = 0x7FFFFFFFFFFFFFFFLL;
  if ((unint64_t)v41 < 0x7FFFFFFFFFFFFFFFLL)
    v42 = (uint64_t)v41;
  v131 = v42;
  if (!v134 && !v130 && !v42)
  {
    v43 = !v145 || location == 0;
    if (v43 && !v129)
    {
      if (os_log_type_enabled((os_log_t)&_os_log_default, OS_LOG_TYPE_DEFAULT))
      {
        *(_WORD *)buf = 0;
        _os_log_impl((void *)&_mh_execute_header, (os_log_t)&_os_log_default, OS_LOG_TYPE_DEFAULT, "File limit set to 0. Skipping.", buf, 2u);
      }
      v44 = 0;
      v45 = 0;
      v17 = 0;
      v46 = 0;
      goto LABEL_154;
    }
  }
  v54 = (char *)objc_msgSend(CFSTR(".memgraph"), "length");
  v149 = objc_msgSend(objc_alloc((Class)RMECacheEnumerator), "initCacheEnumerator");
  v55 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v149, "nextValidURL"));
  if (!v55)
  {
    v57 = 0;
    v128 = 0;
    v141 = 0;
    v126 = 0;
    v84 = 0;
    v118 = 0;
    v56 = 0;
LABEL_116:
    if (v84 >= v131)
    {
      v45 = 0;
      if (!os_log_type_enabled((os_log_t)&_os_log_default, OS_LOG_TYPE_DEFAULT))
        goto LABEL_124;
      *(_DWORD *)buf = 134218498;
      *(_QWORD *)&buf[4] = v131;
      *(_WORD *)&buf[12] = 2114;
      *(_QWORD *)&buf[14] = v143;
      *(_WORD *)&buf[22] = 1024;
      *(_DWORD *)&buf[24] = v120;
      v85 = "The total lite diagnostic log limit of %ld has been exceeded in the last 24 hours. Skipping %{public}@ [%d]";
    }
    else
    {
      if (v118 < v119)
      {
        v45 = 1;
LABEL_124:
        if (v136 && os_log_type_enabled((os_log_t)&_os_log_default, OS_LOG_TYPE_INFO))
        {
          *(_DWORD *)buf = 134218240;
          *(_QWORD *)&buf[4] = v134;
          *(_WORD *)&buf[12] = 2048;
          *(_QWORD *)&buf[14] = v57;
          _os_log_impl((void *)&_mh_execute_header, (os_log_t)&_os_log_default, OS_LOG_TYPE_INFO, "MSL Enabled in Process: daily MSL memgraph limit = %ld, in the last 24 hours %li MSL memgraphs have been saved.", buf, 0x16u);
        }
        if (v138 == (id)6)
        {
          if (v128 >= v129)
          {
            v44 = (id)objc_claimAutoreleasedReturnValue(+[NSString stringWithFormat:](NSString, "stringWithFormat:", CFSTR("memgraph %@ limit of %ld has already been exceeded in the last 24 hours"), CFSTR("global"), v130));
            if (os_log_type_enabled((os_log_t)&_os_log_default, OS_LOG_TYPE_DEFAULT))
            {
              *(_DWORD *)buf = 134218498;
              *(_QWORD *)&buf[4] = v129;
              *(_WORD *)&buf[12] = 2114;
              *(_QWORD *)&buf[14] = v143;
              *(_WORD *)&buf[22] = 1024;
              *(_DWORD *)&buf[24] = v120;
              v86 = "The total diagnostic threshold memgraph limit of %ld has been exceeded in the last 24 hours. Skippin"
                    "g %{public}@ [%d]";
LABEL_150:
              _os_log_impl((void *)&_mh_execute_header, (os_log_t)&_os_log_default, OS_LOG_TYPE_DEFAULT, v86, buf, 0x1Cu);
              goto LABEL_151;
            }
            goto LABEL_151;
          }
        }
        else
        {
          v87 = v136;
          if (v57 >= v134)
            v87 = 0;
          if (v87 == 1)
          {
            if (os_log_type_enabled((os_log_t)&_os_log_default, OS_LOG_TYPE_DEFAULT))
            {
              *(_WORD *)buf = 0;
              _os_log_impl((void *)&_mh_execute_header, (os_log_t)&_os_log_default, OS_LOG_TYPE_DEFAULT, "The MSL memgraph limit has NOT exceeded in the last 24 hours", buf, 2u);
            }
          }
          else
          {
            if (!(_BYTE)location && v126 >= v130)
            {
              v44 = (id)objc_claimAutoreleasedReturnValue(+[NSString stringWithFormat:](NSString, "stringWithFormat:", CFSTR("memgraph %@ limit of %ld has already been exceeded in the last 24 hours"), CFSTR("global"), v130));
              if (os_log_type_enabled((os_log_t)&_os_log_default, OS_LOG_TYPE_DEFAULT))
              {
                *(_DWORD *)buf = 134218498;
                *(_QWORD *)&buf[4] = v130;
                *(_WORD *)&buf[12] = 2114;
                *(_QWORD *)&buf[14] = v143;
                *(_WORD *)&buf[22] = 1024;
                *(_DWORD *)&buf[24] = v120;
                v86 = "The total full diagnostic log limit of %ld has been exceeded in the last 24 hours. Skipping %{public}@ [%d]";
                goto LABEL_150;
              }
LABEL_151:
              v17 = 0;
              goto LABEL_152;
            }
            if (v56 >= v145)
            {
              if ((_BYTE)location)
                v88 = CFSTR("critical per process");
              else
                v88 = CFSTR("per process");
              v44 = (id)objc_claimAutoreleasedReturnValue(+[NSString stringWithFormat:](NSString, "stringWithFormat:", CFSTR("memgraph %@ limit of %ld has already been exceeded in the last 24 hours"), v88, v145));
              if (!os_log_type_enabled((os_log_t)&_os_log_default, OS_LOG_TYPE_DEFAULT))
                goto LABEL_151;
              *(_DWORD *)buf = 134218498;
              *(_QWORD *)&buf[4] = v145;
              *(_WORD *)&buf[12] = 2114;
              *(_QWORD *)&buf[14] = v143;
              *(_WORD *)&buf[22] = 1024;
              *(_DWORD *)&buf[24] = v120;
              v86 = "The per process full diagnostic log limit of %ld has already been exceeded in the last 24 hours. Ski"
                    "pping %{public}@ [%d]";
              goto LABEL_150;
            }
          }
        }
        v44 = 0;
        v17 = 1;
LABEL_152:
        v46 = v141 < v132;
        goto LABEL_153;
      }
      v45 = 0;
      if (!os_log_type_enabled((os_log_t)&_os_log_default, OS_LOG_TYPE_DEFAULT))
        goto LABEL_124;
      *(_DWORD *)buf = 134218498;
      *(_QWORD *)&buf[4] = v119;
      *(_WORD *)&buf[12] = 2114;
      *(_QWORD *)&buf[14] = v143;
      *(_WORD *)&buf[22] = 1024;
      *(_DWORD *)&buf[24] = v120;
      v85 = "The per process lite diagnostic log limit of %ld has been exceeded in the last 24 hours. Skipping %{public}@ [%d]";
    }
    _os_log_impl((void *)&_mh_execute_header, (os_log_t)&_os_log_default, OS_LOG_TYPE_DEFAULT, v85, buf, 0x1Cu);
    v45 = 0;
    goto LABEL_124;
  }
  v56 = 0;
  v118 = 0;
  v126 = 0;
  v127 = 0;
  v141 = 0;
  v128 = 0;
  v57 = 0;
  v117 = v54 + 25;
  while (1)
  {
    if ((_BYTE)location)
      v58 = v56 < v145;
    else
      v58 = 0;
    if (!v58)
    {
      v59 = v57 < v134 ? v136 : 0;
      v60 = v138 == (id)6 && v128 < v129;
      v61 = v60;
      if ((v59 & 1) == 0 && v126 >= v130 && v141 >= v132 && v127 >= v131 && !v61)
      {
LABEL_114:
        v84 = v127;
        goto LABEL_116;
      }
    }
    v62 = objc_autoreleasePoolPush();
    block[0] = 0;
    objc_msgSend(v55, "getResourceValue:forKey:error:", block, NSURLCreationDateKey, 0);
    v63 = block[0];
    v64 = v63;
    if (!v63)
      goto LABEL_113;
    if (objc_msgSend(v63, "compare:", v156) == (id)1)
      break;
    objc_msgSend(v156, "timeIntervalSinceDate:", v64);
    if (v65 <= 86400.0)
    {
      v171[0] = 0;
      objc_msgSend(v55, "getResourceValue:forKey:error:", v171, NSURLNameKey, 0);
      v66 = v171[0];
      if (v66)
      {
        v67 = v66;
        v68 = objc_msgSend(v66, "containsString:", off_100014640);
        if (v141 < v132)
          v69 = v68;
        else
          v69 = 0;
        v141 += v69;
        if (objc_msgSend(v67, "hasSuffix:", CFSTR(".memgraph")))
        {
          v70 = MREExceptionTypeToString(6);
          v71 = (void *)objc_claimAutoreleasedReturnValue(v70);
          v72 = objc_msgSend(v67, "hasPrefix:", v71);

          if (v72)
          {
            ++v128;
LABEL_112:

            goto LABEL_113;
          }
          v78 = objc_msgSend(v67, "containsString:", off_100014638[0]);
          v79 = v78;
          if (v57 < v134)
            v80 = v78;
          else
            v80 = 0;
          if (v80 == 1)
          {
            ++v57;
            goto LABEL_112;
          }
          if (!(_BYTE)location)
          {
            if (v126 >= v130)
              goto LABEL_112;
            ++v126;
          }
          if (v145 == 0x7FFFFFFFFFFFFFFFLL || v56 >= v145)
            goto LABEL_112;
          v81 = MREExceptionTypeToString(v138);
          v74 = (void *)objc_claimAutoreleasedReturnValue(v81);
          if (objc_msgSend(v67, "hasPrefix:", v74))
          {
            v116 = objc_msgSend(objc_alloc((Class)NSString), "initWithFormat:", CFSTR("%@_%@"), v74, v143);
            v114 = (char *)objc_msgSend(v116, "length");
            if (v79)
              v82 = (unint64_t)-[__CFString length](off_100014638[0], "length");
            else
              v82 = 0;
            if (objc_msgSend(v67, "hasPrefix:", v116)
              && objc_msgSend(v67, "length") == &v114[(_QWORD)v117 + v82])
            {
              ++v56;
            }

          }
        }
        else
        {
          if (v127 >= v131)
            goto LABEL_112;
          ++v127;
          if (v119 == 0x7FFFFFFFFFFFFFFFLL || v118 >= v119)
            goto LABEL_112;
          v115 = objc_msgSend(CFSTR(".lite_diag"), "length");
          v73 = MREExceptionTypeToString(v138);
          v74 = (void *)objc_claimAutoreleasedReturnValue(v73);
          if (objc_msgSend(v67, "hasPrefix:", v74))
          {
            v75 = objc_msgSend(objc_alloc((Class)NSString), "initWithFormat:", CFSTR("%@_%@"), v74, v143);
            v113 = (char *)objc_msgSend(v75, "length");
            if (objc_msgSend(v67, "hasPrefix:", v75))
            {
              v76 = (char *)objc_msgSend(v67, "length");
              v77 = v118;
              if (v76 == &v113[(_QWORD)v115 + 25])
                v77 = v118 + 1;
              v118 = v77;
            }

          }
        }

        goto LABEL_112;
      }
      v67 = 0;
      goto LABEL_112;
    }
LABEL_113:

    objc_autoreleasePoolPop(v62);
    v83 = objc_claimAutoreleasedReturnValue(objc_msgSend(v149, "nextValidURL"));

    v55 = (void *)v83;
    if (!v83)
      goto LABEL_114;
  }
  if (os_log_type_enabled((os_log_t)&_os_log_default, OS_LOG_TYPE_DEFAULT))
  {
    *(_DWORD *)buf = 138543618;
    *(_QWORD *)&buf[4] = v143;
    *(_WORD *)&buf[12] = 1024;
    *(_DWORD *)&buf[14] = v120;
    _os_log_impl((void *)&_mh_execute_header, (os_log_t)&_os_log_default, OS_LOG_TYPE_DEFAULT, "The system clock may be out of sync, and prevents us from determining available quota for a memgraph for %{public}@ [%d]", buf, 0x12u);
  }

  objc_autoreleasePoolPop(v62);
  v44 = 0;
  v45 = 0;
  v17 = 0;
  v46 = 0;
LABEL_153:

LABEL_154:
LABEL_155:

  v89 = v44;
  if (v89)
    -[NSObject setMemgraphError:](log, "setMemgraphError:", v89);

  if (!v17)
  {
    v18 = 0;
    v94 = 2;
    goto LABEL_167;
  }
  if (qword_1000146D0 != -1)
    dispatch_once(&qword_1000146D0, &stru_100010660);
  v90 = dword_100014694;
  if (!dword_100014694
    || (v91 = -[NSObject limitValue](log, "limitValue"), v92 = (double)v90 * 0.75, v92 >= (double)(unint64_t)v91))
  {
    v155 = 0;
    LOBYTE(v17) = 0;
    v18 = 1;
    goto LABEL_168;
  }
  if (from | v46)
  {
    v20 = v158;
    v19 = v45;
    if (os_log_type_enabled((os_log_t)&_os_log_default, OS_LOG_TYPE_DEFAULT))
    {
      *(_DWORD *)buf = 138543618;
      *(_QWORD *)&buf[4] = v158;
      *(_WORD *)&buf[12] = 1024;
      *(_DWORD *)&buf[14] = v147;
      _os_log_impl((void *)&_mh_execute_header, (os_log_t)&_os_log_default, OS_LOG_TYPE_DEFAULT, "Attempting memgraph generation for large process %{public}@ [%d].", buf, 0x12u);
    }
    if (v46)
    {
      if (os_log_type_enabled((os_log_t)&_os_log_default, OS_LOG_TYPE_DEFAULT))
      {
        *(_DWORD *)buf = 138543618;
        *(_QWORD *)&buf[4] = v158;
        *(_WORD *)&buf[12] = 1024;
        *(_DWORD *)&buf[14] = v147;
        _os_log_impl((void *)&_mh_execute_header, (os_log_t)&_os_log_default, OS_LOG_TYPE_DEFAULT, "Will use gcore for large process collection %{public}@ [%d].", buf, 0x12u);
      }
      v155 = 0;
      v18 = 1;
      LOBYTE(v17) = 1;
    }
    else
    {
      v155 = 0;
      LOBYTE(v17) = 0;
      v18 = 1;
    }
  }
  else
  {
    v93 = (void *)objc_claimAutoreleasedReturnValue(+[NSString stringWithFormat:](NSString, "stringWithFormat:", CFSTR("memgraph is larger than its limit of %dMB to generate"), (int)v92));
    -[NSObject setMemgraphError:](log, "setMemgraphError:", v93);

    if (os_log_type_enabled((os_log_t)&_os_log_default, OS_LOG_TYPE_DEFAULT))
    {
      *(_DWORD *)buf = 138543874;
      v20 = v158;
      *(_QWORD *)&buf[4] = v158;
      *(_WORD *)&buf[12] = 1024;
      *(_DWORD *)&buf[14] = v147;
      *(_WORD *)&buf[18] = 1024;
      *(_DWORD *)&buf[20] = 0;
      _os_log_impl((void *)&_mh_execute_header, (os_log_t)&_os_log_default, OS_LOG_TYPE_DEFAULT, "Skipping memgraph generation for %{public}@ [%d] because it is too large. (gcoreDiagAllowed=%{BOOL}i)", buf, 0x18u);
      v18 = 0;
      LOBYTE(v17) = 0;
      v155 = 3;
      goto LABEL_169;
    }
    v18 = 0;
    LOBYTE(v17) = 0;
    v94 = 3;
LABEL_167:
    v155 = v94;
LABEL_168:
    v20 = v158;
LABEL_169:
    v19 = v45;
  }
LABEL_170:
  if (v19 | v18)
  {
    v171[0] = 0;
    v171[1] = v171;
    v171[2] = (id)0x2810000000;
    v171[3] = &unk_10000FDD3;
    v172 = 0;
    v95 = (void *)++qword_1000146C0;
    if (v6)
      v96 = QOS_CLASS_UTILITY;
    else
      v96 = QOS_CLASS_BACKGROUND;
    if ((v17 & 1) != 0)
    {
      v97 = 300;
      goto LABEL_181;
    }
    if (v20 && (sub_100009FB4(v20) & 1) != 0)
    {
      v97 = 120;
LABEL_181:
      qword_100014688 += v97;
    }
    else
    {
      v97 = 60;
    }
    if (os_log_type_enabled((os_log_t)&_os_log_default, OS_LOG_TYPE_DEFAULT))
    {
      *(_DWORD *)buf = 134218498;
      *(_QWORD *)&buf[4] = v97;
      *(_WORD *)&buf[12] = 2112;
      *(_QWORD *)&buf[14] = v20;
      *(_WORD *)&buf[22] = 1024;
      *(_DWORD *)&buf[24] = v147;
      _os_log_impl((void *)&_mh_execute_header, (os_log_t)&_os_log_default, OS_LOG_TYPE_DEFAULT, "Using timeout of %llu seconds for process %@ [%d]", buf, 0x1Cu);
    }
    *(_QWORD *)buf = _NSConcreteStackBlock;
    *(_QWORD *)&buf[8] = 3221225472;
    *(_QWORD *)&buf[16] = sub_100007270;
    *(_QWORD *)&buf[24] = &unk_100010618;
    v104 = v7;
    *(_QWORD *)v175 = v104;
    *(_QWORD *)&v175[24] = v171;
    LOBYTE(v176) = v19;
    BYTE1(v176) = v18;
    BYTE2(v176) = v17;
    *(_QWORD *)&v175[32] = v97;
    *(_QWORD *)&v175[40] = v155;
    v105 = v6;
    *(_QWORD *)&v175[16] = v105;
    *(_QWORD *)&v175[8] = v159;
    v106 = objc_retainBlock(buf);
    v107 = dispatch_block_create_with_qos_class((dispatch_block_flags_t)0, v96, 0, v106);

    dispatch_async(queue, v107);
    objc_initWeak(&location, v104);
    objc_initWeak(&from, v105);
    v108 = dispatch_time(0, 1000000000 * v97);
    block[0] = _NSConcreteStackBlock;
    block[1] = (id)3221225472;
    block[2] = sub_1000081A8;
    block[3] = &unk_100010640;
    v166[1] = v95;
    objc_copyWeak(&v165, &location);
    objc_copyWeak(v166, &from);
    v167 = v19;
    v168 = v18;
    block[4] = v171;
    v166[2] = (id)v97;
    v166[3] = (id)v155;
    dispatch_after(v108, v160, block);
    objc_destroyWeak(v166);
    objc_destroyWeak(&v165);
    objc_destroyWeak(&from);
    objc_destroyWeak(&location);

    _Block_object_dispose(v171, 8);
  }
  else
  {
    v98 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v7, "execName"));
    v99 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v7, "bundleID"));
    v100 = objc_msgSend(v7, "exceptionType");
    v101 = objc_msgSend(v7, "ledgerPhysFootprint");
    v102 = objc_msgSend(v7, "ledgerPhysFootprintPeak");
    v103 = objc_msgSend(v7, "limitValue");
    BYTE1(v112) = v155 == 3;
    LOBYTE(v112) = objc_msgSend(v7, "isMSLEnabled");
    LOBYTE(v111) = 0;
    LOBYTE(v110) = 0;
    +[RMETelemetry emitTelemetryForExecName:bundleID:exceptionType:footprint:footprintPeak:jetsamLimit:memgraphAttempted:memgraphSkippedReason:memgraphSucceeded:memgraphFailedReason:diagFilePath:isMSLEnabled:isGcoreCapture:](RMETelemetry, "emitTelemetryForExecName:bundleID:exceptionType:footprint:footprintPeak:jetsamLimit:memgraphAttempted:memgraphSkippedReason:memgraphSucceeded:memgraphFailedReason:diagFilePath:isMSLEnabled:isGcoreCapture:", v98, v99, v100, v101, v102, v103, v110, v155, v111, 0, 0, v112);

    objc_msgSend(v7, "releaseAnalyzedTask");
    if (v6)
      v6[2](v6, 0);
  }
LABEL_186:

LABEL_187:
  do
    v109 = __ldaxr(&dword_100014690);
  while (__stlxr(v109 - 1, &dword_100014690));
}

void sub_1000043D4(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, uint64_t a13, uint64_t a14, uint64_t a15, uint64_t a16, uint64_t a17, uint64_t a18, uint64_t a19, uint64_t a20,uint64_t a21,uint64_t a22,uint64_t a23,uint64_t a24,uint64_t a25,uint64_t a26,uint64_t a27,uint64_t a28,uint64_t a29,uint64_t a30,uint64_t a31,uint64_t a32,uint64_t a33,uint64_t a34,uint64_t a35,uint64_t a36,uint64_t a37,uint64_t a38,uint64_t a39,uint64_t a40,uint64_t a41,uint64_t a42,uint64_t a43,uint64_t a44,uint64_t a45,uint64_t a46,uint64_t a47,uint64_t a48,uint64_t a49,uint64_t a50,uint64_t a51,uint64_t a52,uint64_t a53,uint64_t a54,uint64_t a55,uint64_t a56,uint64_t a57,uint64_t a58,uint64_t a59,uint64_t a60,uint64_t a61,uint64_t a62,uint64_t a63)
{
  char a65;

  _Block_object_dispose(&a65, 8);
  _Unwind_Resume(a1);
}

id sub_1000043F4(char a1, void *a2, void *a3)
{
  id v4;
  id v5;
  void *v6;
  uint64_t v7;
  id v8;
  uint64_t v9;
  void *v10;
  void *v11;
  id v12;
  id v13;
  id v14;
  id v15;
  void *v16;
  unsigned __int8 v17;
  uint64_t v18;
  id v19;
  void *v20;
  unsigned int v21;
  uint64_t v22;
  uint64_t v23;
  char *v24;
  BOOL v25;
  char *v26;
  uint64_t v27;
  void *v28;
  id v29;
  void *v30;
  void *v31;
  void *v32;
  uint64_t v33;
  void *v34;
  void *v35;
  id v36;
  void *v37;
  id v38;
  void *v39;
  id v40;
  id v41;
  uint64_t v42;
  void *i;
  void *v44;
  void *v45;
  id v46;
  id v47;
  id v48;
  uint64_t v49;
  void *j;
  void *v51;
  void *v53;
  unsigned int v54;
  void *v55;
  id v56;
  id v57;
  void *v58;
  void *v59;
  void *v60;
  id v61;
  __int128 v63;
  __int128 v64;
  __int128 v65;
  __int128 v66;
  __int128 v67;
  __int128 v68;
  __int128 v69;
  __int128 v70;
  id v71;
  id v72;
  id v73;
  id v74;
  _BYTE v75[128];
  _BYTE v76[128];

  v4 = a2;
  v5 = a3;
  v6 = (void *)objc_claimAutoreleasedReturnValue(+[NSMutableArray array](NSMutableArray, "array"));
  v7 = objc_claimAutoreleasedReturnValue(+[NSDate dateWithTimeIntervalSinceNow:](NSDate, "dateWithTimeIntervalSinceNow:", -3600.0));
  v8 = objc_alloc_init((Class)NSMutableDictionary);
  v61 = objc_alloc_init((Class)NSMutableArray);
  v9 = objc_claimAutoreleasedReturnValue(objc_msgSend(v5, "nextValidURL"));
  v59 = v5;
  v60 = (void *)v7;
  if (v9)
  {
    v10 = (void *)v9;
    v58 = v4;
    while (1)
    {
      v11 = objc_autoreleasePoolPush();
      v74 = 0;
      objc_msgSend(v10, "getResourceValue:forKey:error:", &v74, NSURLCreationDateKey, 0);
      v12 = v74;
      if (v12)
        break;
LABEL_26:

      objc_autoreleasePoolPop(v11);
      v33 = objc_claimAutoreleasedReturnValue(objc_msgSend(v5, "nextValidURL"));

      v10 = (void *)v33;
      if (!v33)
        goto LABEL_37;
    }
    v73 = 0;
    objc_msgSend(v10, "getResourceValue:forKey:error:", &v73, NSURLNameKey, 0);
    v13 = v73;
    if (!v13 || (a1 & 1) == 0 && objc_msgSend(v12, "compare:", v7) != (id)-1 && objc_msgSend(v12, "compare:", v7))
    {
LABEL_25:

      goto LABEL_26;
    }
    if (!v4 || objc_msgSend(v13, "hasSuffix:", CFSTR(".lite_diag")))
    {
      objc_msgSend(v61, "addObject:", v10);
      goto LABEL_25;
    }
    v14 = v13;
    v15 = objc_msgSend(v14, "rangeOfString:", CFSTR("_"));
    if (v15 == (id)0x7FFFFFFFFFFFFFFFLL)
      goto LABEL_23;
    v56 = v15;
    v16 = (void *)objc_claimAutoreleasedReturnValue(+[NSString stringWithUTF8String:](NSString, "stringWithUTF8String:", ".memgraph"));
    v17 = objc_msgSend(v14, "hasSuffix:", v16);

    if ((v17 & 1) != 0)
    {
      v18 = 34;
      v19 = v56;
    }
    else
    {
      v20 = (void *)objc_claimAutoreleasedReturnValue(+[NSString stringWithUTF8String:](NSString, "stringWithUTF8String:", ".lite_diag"));
      v21 = objc_msgSend(v14, "hasSuffix:", v20);

      v5 = v59;
      v19 = v56;
      if (!v21)
        goto LABEL_23;
      v18 = 35;
    }
    v22 = (uint64_t)v19 + 1;
    if (objc_msgSend(v14, "containsString:", off_100014638[0]))
      v22 += (uint64_t)-[__CFString length](off_100014638[0], "length");
    v23 = v22 + v18;
    v24 = (char *)objc_msgSend(v14, "length");
    v26 = &v24[-v23];
    v25 = (uint64_t)v24 <= v23;
    v5 = v59;
    if (!v25)
    {
      v27 = objc_claimAutoreleasedReturnValue(objc_msgSend(v14, "substringWithRange:", v22, v26));

      v28 = (void *)v27;
      v4 = v58;
      v7 = (uint64_t)v60;
      if (!v28)
        goto LABEL_25;
      v57 = v28;
      v29 = v58;
      v30 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v29, "objectForKeyedSubscript:", CFSTR("AllowAllProcessesInSysdiagnose")));
      v31 = v30;
      if (v30 && objc_msgSend(v30, "BOOLValue"))
      {

        v32 = v57;
      }
      else
      {
        v34 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v29, "objectForKeyedSubscript:", CFSTR("ProcessesAllowedInSysdiagnose")));
        v54 = objc_msgSend(v34, "containsObject:", v57);

        v5 = v59;
        v32 = v57;

        if (!v54)
        {
LABEL_36:

          goto LABEL_24;
        }
      }
      v35 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v8, "objectForKeyedSubscript:", v32));
      if (v35)
      {
        v72 = 0;
        objc_msgSend(v10, "getResourceValue:forKey:error:", &v72, NSURLCreationDateKey, 0);
        v36 = v72;
        v37 = v35;
        v38 = v36;
        v71 = 0;
        v53 = v37;
        objc_msgSend(v37, "getResourceValue:forKey:error:", &v71, NSURLCreationDateKey, 0);
        v55 = v38;
        if (objc_msgSend(v71, "compare:", v38) == (id)-1)
        {
          v35 = v53;
          objc_msgSend(v61, "addObject:", v53);
          v32 = v57;
          objc_msgSend(v8, "setObject:forKeyedSubscript:", v10, v57);
        }
        else
        {
          objc_msgSend(v61, "addObject:", v10);
          v32 = v57;
          v35 = v53;
        }

      }
      else
      {
        objc_msgSend(v8, "setObject:forKeyedSubscript:", v10, v32);
      }

      goto LABEL_36;
    }
LABEL_23:

LABEL_24:
    v4 = v58;
    v7 = (uint64_t)v60;
    goto LABEL_25;
  }
LABEL_37:
  objc_msgSend(v61, "sortUsingComparator:", &stru_100010818);
  v39 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v8, "keysSortedByValueUsingComparator:", &stru_100010818));
  v67 = 0u;
  v68 = 0u;
  v69 = 0u;
  v70 = 0u;
  v40 = objc_msgSend(v39, "countByEnumeratingWithState:objects:count:", &v67, v76, 16);
  if (v40)
  {
    v41 = v40;
    v42 = *(_QWORD *)v68;
    do
    {
      for (i = 0; i != v41; i = (char *)i + 1)
      {
        if (*(_QWORD *)v68 != v42)
          objc_enumerationMutation(v39);
        v44 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v8, "objectForKeyedSubscript:", *(_QWORD *)(*((_QWORD *)&v67 + 1) + 8 * (_QWORD)i)));
        v45 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v44, "path"));
        objc_msgSend(v6, "addObject:", v45);

      }
      v41 = objc_msgSend(v39, "countByEnumeratingWithState:objects:count:", &v67, v76, 16);
    }
    while (v41);
  }
  v65 = 0u;
  v66 = 0u;
  v63 = 0u;
  v64 = 0u;
  v46 = v61;
  v47 = objc_msgSend(v46, "countByEnumeratingWithState:objects:count:", &v63, v75, 16);
  if (v47)
  {
    v48 = v47;
    v49 = *(_QWORD *)v64;
    do
    {
      for (j = 0; j != v48; j = (char *)j + 1)
      {
        if (*(_QWORD *)v64 != v49)
          objc_enumerationMutation(v46);
        v51 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(*(id *)(*((_QWORD *)&v63 + 1) + 8 * (_QWORD)j), "path"));
        objc_msgSend(v6, "addObject:", v51);

      }
      v48 = objc_msgSend(v46, "countByEnumeratingWithState:objects:count:", &v63, v75, 16);
    }
    while (v48);
  }

  return v6;
}

void sub_100004A00()
{
  _QWORD v0[5];
  _QWORD v1[5];
  _QWORD v2[5];
  _QWORD v3[5];
  RMECacheDeleter *v4;

  objc_opt_self();
  v3[0] = 0;
  v3[1] = v3;
  v3[2] = 0x3032000000;
  v3[3] = sub_100005E24;
  v3[4] = sub_10000603C;
  v4 = objc_alloc_init(RMECacheDeleter);
  v1[4] = v3;
  v2[0] = _NSConcreteStackBlock;
  v2[1] = 3221225472;
  v2[2] = sub_100005E34;
  v2[3] = &unk_1000104D8;
  v2[4] = v3;
  v0[4] = v3;
  v1[0] = _NSConcreteStackBlock;
  v1[1] = 3221225472;
  v1[2] = sub_100006044;
  v1[3] = &unk_1000104D8;
  v0[0] = _NSConcreteStackBlock;
  v0[1] = 3221225472;
  v0[2] = sub_1000061C4;
  v0[3] = &unk_1000104D8;
  CacheDeleteRegisterInfoCallbacks(CFSTR("com.apple.ReportMemoryException.CacheDelete"), v2, v1, &stru_100010518, v0);
  _Block_object_dispose(v3, 8);

}

void sub_100004AE8(_Unwind_Exception *a1)
{
  uint64_t v1;

  _Block_object_dispose((const void *)(v1 - 64), 8);
  _Unwind_Resume(a1);
}

void sub_100004B00(uint64_t a1, void *a2)
{
  id v3;
  const char *v4;
  uint32_t v5;
  _QWORD v6[4];
  id v7;
  id v8;
  uint8_t buf[4];
  const char *string;

  v3 = a2;
  if (xpc_get_type(v3) == (xpc_type_t)&_xpc_type_error)
  {
    if (os_log_type_enabled((os_log_t)&_os_log_default, OS_LOG_TYPE_ERROR))
    {
      *(_DWORD *)buf = 136315138;
      string = xpc_dictionary_get_string(v3, _xpc_error_key_description);
      v4 = "Got xpc error for peer: %s";
      v5 = 12;
      goto LABEL_7;
    }
  }
  else
  {
    if (xpc_get_type(v3) == (xpc_type_t)&_xpc_type_connection)
    {
      xpc_connection_set_target_queue((xpc_connection_t)v3, *(dispatch_queue_t *)(a1 + 32));
      v6[0] = _NSConcreteStackBlock;
      v6[1] = 3221225472;
      v6[2] = sub_100004FC4;
      v6[3] = &unk_100010840;
      v7 = *(id *)(a1 + 40);
      v8 = *(id *)(a1 + 48);
      xpc_connection_set_event_handler((xpc_connection_t)v3, v6);
      xpc_connection_resume((xpc_connection_t)v3);

      goto LABEL_9;
    }
    if (os_log_type_enabled((os_log_t)&_os_log_default, OS_LOG_TYPE_ERROR))
    {
      *(_WORD *)buf = 0;
      v4 = "Unexpected XPC event";
      v5 = 2;
LABEL_7:
      _os_log_error_impl((void *)&_mh_execute_header, (os_log_t)&_os_log_default, OS_LOG_TYPE_ERROR, v4, buf, v5);
    }
  }
LABEL_9:

}

void sub_100004D48(uint64_t a1, char a2, void *a3, void *a4, void *a5)
{
  id v9;
  id v10;
  void (**v11)(id, void *);
  int v12;
  void *v13;
  id v14;
  id v15;
  unsigned int v16;
  void *v17;
  unsigned int v18;
  uint64_t v19;
  uint64_t v20;
  uint64_t v21;
  _QWORD block[4];
  id v23;
  dispatch_queue_t v24;
  id v25;
  void (**v26)(id, void *);
  int v27;
  char v28;
  id v29;
  id v30;

  v9 = a3;
  v10 = a4;
  v11 = a5;
  if (qword_100014698 != -1)
    dispatch_once(&qword_100014698, &stru_100010560);
  do
    v12 = __ldaxr(&dword_100014690);
  while (__stlxr(v12 + 1, &dword_100014690));
  if (v12 >= 2)
  {
    if (v11)
    {
      v13 = (void *)objc_claimAutoreleasedReturnValue(+[NSError errorWithDomain:code:userInfo:](NSError, "errorWithDomain:code:userInfo:", MREErrorDomain[0], 13, 0));
      v11[2](v11, v13);

    }
    v29 = 0;
    v30 = 0;
    +[MemoryResourceException extractExecNameAndBundleIDMinimal:execNameOut:bundleIDOut:](MemoryResourceException, "extractExecNameAndBundleIDMinimal:execNameOut:bundleIDOut:", a1, &v30, &v29);
    v14 = v30;
    v15 = v29;
    LOWORD(v21) = 0;
    LOBYTE(v20) = 0;
    LOBYTE(v19) = 0;
    +[RMETelemetry emitTelemetryForExecName:bundleID:exceptionType:footprint:footprintPeak:jetsamLimit:memgraphAttempted:memgraphSkippedReason:memgraphSucceeded:memgraphFailedReason:diagFilePath:isMSLEnabled:isGcoreCapture:](RMETelemetry, "emitTelemetryForExecName:bundleID:exceptionType:footprint:footprintPeak:jetsamLimit:memgraphAttempted:memgraphSkippedReason:memgraphSucceeded:memgraphFailedReason:diagFilePath:isMSLEnabled:isGcoreCapture:", v14, v15, 7, 0, 0, 0, v19, 5, v20, 0, 0, v21);
    do
      v16 = __ldaxr(&dword_100014690);
    while (__stlxr(v16 - 1, &dword_100014690));
    goto LABEL_15;
  }
  if (!mach_port_mod_refs(mach_task_self_, a1, 0, 1))
  {
    block[0] = _NSConcreteStackBlock;
    block[1] = 3221225472;
    block[2] = sub_100002C30;
    block[3] = &unk_100010588;
    v27 = a1;
    v28 = a2;
    v23 = (id)os_transaction_create("com.apple.ReportMemoryException");
    v24 = (dispatch_queue_t)v9;
    v25 = v10;
    v26 = v11;
    v14 = v23;
    dispatch_async(v24, block);

    v15 = v23;
LABEL_15:

    goto LABEL_16;
  }
  v17 = (void *)objc_claimAutoreleasedReturnValue(+[NSError errorWithDomain:code:userInfo:](NSError, "errorWithDomain:code:userInfo:", MREErrorDomain[0], 3, 0));
  v11[2](v11, v17);

  do
    v18 = __ldaxr(&dword_100014690);
  while (__stlxr(v18 - 1, &dword_100014690));
LABEL_16:

}

void sub_100004FC4(uint64_t a1, void *a2)
{
  id v3;
  void *v4;
  void *v5;
  id v6;
  id v7;
  id v8;
  int64_t int64;
  xpc_connection_t remote_connection;
  void *v11;
  xpc_object_t reply;
  void *v13;
  _OWORD *v14;
  int64_t v15;
  mach_port_name_t v16;
  const char *v17;
  uint32_t v18;
  uint64_t v19;
  const char *v20;
  uint32_t v21;
  mach_port_name_t v22;
  int v23;
  int v24;
  BOOL v25;
  int v26;
  unsigned int v27;
  unsigned int v28;
  uint64_t v29;
  id v30;
  uint64_t v31;
  uint64_t v32;
  char v33;
  void *v34;
  int v35;
  int v36;
  uint8_t v37[4];
  const char *string;
  __int128 buf;
  void (*v40)(uint64_t, void *);
  void *v41;
  id v42;
  id v43;

  v3 = a2;
  if (xpc_get_type(v3) == (xpc_type_t)&_xpc_type_error)
  {
    if (os_log_type_enabled((os_log_t)&_os_log_default, OS_LOG_TYPE_ERROR))
    {
      LODWORD(buf) = 136315138;
      *(_QWORD *)((char *)&buf + 4) = xpc_dictionary_get_string(v3, _xpc_error_key_description);
      _os_log_error_impl((void *)&_mh_execute_header, (os_log_t)&_os_log_default, OS_LOG_TYPE_ERROR, "Got xpc error message in ReportMemoryException client connection: %s", (uint8_t *)&buf, 0xCu);
    }
  }
  else if (xpc_get_type(v3) == (xpc_type_t)&_xpc_type_dictionary)
  {
    v4 = *(void **)(a1 + 32);
    v5 = *(void **)(a1 + 40);
    v6 = v3;
    v7 = v4;
    v8 = v5;
    int64 = xpc_dictionary_get_int64(v6, "MessageType");
    remote_connection = xpc_dictionary_get_remote_connection(v6);
    v11 = (void *)objc_claimAutoreleasedReturnValue(remote_connection);
    reply = xpc_dictionary_create_reply(v6);
    v13 = reply;
    v14 = 0;
    if (v11 && reply)
    {
      *(_QWORD *)&buf = _NSConcreteStackBlock;
      *((_QWORD *)&buf + 1) = 3221225472;
      v40 = sub_10000B5E0;
      v41 = &unk_1000108B8;
      v42 = v6;
      v43 = v13;
      v14 = objc_retainBlock(&buf);

    }
    if (int64 != 3)
    {
      if (int64 == 2)
      {
        v19 = xpc_dictionary_copy_mach_send(v6, "TaskPort");
        if ((v19 + 1) > 1)
        {
          v32 = v19;
          v33 = xpc_dictionary_get_BOOL(v6, "WithMemgraph");
          sub_100004D48(v32, v33, v7, v8, v14);
          mach_port_deallocate(mach_task_self_, v32);
          goto LABEL_46;
        }
        if (!os_log_type_enabled((os_log_t)&_os_log_default, OS_LOG_TYPE_ERROR))
        {
LABEL_46:

          goto LABEL_47;
        }
        *(_WORD *)v37 = 0;
        v20 = "Unable to get port for memory analysis";
      }
      else
      {
        if (int64 != 1)
        {
          if (!os_log_type_enabled((os_log_t)&_os_log_default, OS_LOG_TYPE_ERROR))
            goto LABEL_46;
          *(_DWORD *)v37 = 136315138;
          string = xpc_dictionary_get_string(v6, _xpc_error_key_description);
          v20 = "Unexpected message from ReportMemoryException client: %s";
          v21 = 12;
LABEL_26:
          _os_log_error_impl((void *)&_mh_execute_header, (os_log_t)&_os_log_default, OS_LOG_TYPE_ERROR, v20, v37, v21);
          goto LABEL_46;
        }
        v15 = xpc_dictionary_get_int64(v6, "AuthToken");
        if (v11 && v13)
        {
          xpc_dictionary_set_int64(v13, "AuthToken", ~v15);
          xpc_connection_send_message((xpc_connection_t)v11, v13);
          goto LABEL_46;
        }
        if (!os_log_type_enabled((os_log_t)&_os_log_default, OS_LOG_TYPE_ERROR))
          goto LABEL_46;
        *(_WORD *)v37 = 0;
        v20 = "Received an auth request without a reply context!";
      }
      v21 = 2;
      goto LABEL_26;
    }
    v16 = xpc_dictionary_copy_mach_send(v6, "TaskPort");
    if (v16 + 1 > 1)
    {
      v22 = v16;
      v23 = xpc_dictionary_get_int64(v6, "TimeoutSeconds");
      v24 = v23;
      if (v23)
        v25 = v23 <= 60;
      else
        v25 = 0;
      v26 = !v25;
      v36 = v26;
      v27 = xpc_dictionary_get_int64(v6, "ContentLevel");
      v28 = v27;
      if (v27 >= 3)
      {
        if (!os_log_type_enabled((os_log_t)&_os_log_default, OS_LOG_TYPE_ERROR))
          goto LABEL_44;
        *(_DWORD *)v37 = 67109120;
        LODWORD(string) = v28;
        v17 = "Invalid content level for memgraph request: %d";
        v18 = 8;
LABEL_42:
        _os_log_error_impl((void *)&_mh_execute_header, (os_log_t)&_os_log_default, OS_LOG_TYPE_ERROR, v17, v37, v18);
LABEL_44:
        if (v14)
        {
          v34 = (void *)objc_claimAutoreleasedReturnValue(+[NSError errorWithDomain:code:userInfo:](NSError, "errorWithDomain:code:userInfo:", MREErrorDomain[0], 16, 0));
          (*((void (**)(_OWORD *, void *))v14 + 2))(v14, v34);

        }
        goto LABEL_46;
      }
      v35 = v27;
      v29 = xpc_dictionary_dup_fd(v6, "MemgraphFileDescriptor");
      if ((_DWORD)v29 != -1)
      {
        v30 = objc_msgSend(objc_alloc((Class)NSFileHandle), "initWithFileDescriptor:closeOnDealloc:", v29, 1);
        if (v36)
          v31 = 60;
        else
          v31 = v24;
        sub_100006A88(v22, v30, v35, v31, v7, v8, v14);
        mach_port_deallocate(mach_task_self_, v22);

        goto LABEL_46;
      }
      if (!os_log_type_enabled((os_log_t)&_os_log_default, OS_LOG_TYPE_ERROR))
        goto LABEL_44;
      *(_WORD *)v37 = 0;
      v17 = "Unable to get file descriptor to write out memgraph";
    }
    else
    {
      if (!os_log_type_enabled((os_log_t)&_os_log_default, OS_LOG_TYPE_ERROR))
        goto LABEL_44;
      *(_WORD *)v37 = 0;
      v17 = "Unable to get port for memory analysis";
    }
    v18 = 2;
    goto LABEL_42;
  }
LABEL_47:

}

void start()
{
  dispatch_queue_attr_t v0;
  NSObject *v1;
  NSObject *v2;
  dispatch_queue_attr_t v3;
  NSObject *v4;
  dispatch_queue_t v5;
  dispatch_queue_t v6;
  _xpc_connection_s *mach_service;
  void *v8;
  NSObject *v9;
  dispatch_time_t v10;
  _QWORD v11[4];
  dispatch_queue_t v12;
  _QWORD handler[4];
  NSObject *v14;
  NSObject *v15;
  NSObject *v16;

  if (getppid() == 1)
  {
    v0 = dispatch_queue_attr_make_with_qos_class(0, QOS_CLASS_USER_INITIATED, 0);
    v1 = objc_claimAutoreleasedReturnValue(v0);
    v2 = dispatch_queue_create("com.apple.ReportMemoryException.listener", v1);
    v3 = dispatch_queue_attr_make_with_qos_class(0, QOS_CLASS_UTILITY, 0);
    v4 = objc_claimAutoreleasedReturnValue(v3);

    v5 = dispatch_queue_create("com.apple.ReportMemoryException.analysis", v4);
    v6 = dispatch_queue_create("com.apple.ReportMemoryException.bulkAnalysis", 0);
    mach_service = xpc_connection_create_mach_service("com.apple.ReportMemoryException", v2, 1uLL);
    v8 = objc_autoreleasePoolPush();
    handler[0] = _NSConcreteStackBlock;
    handler[1] = 3221225472;
    handler[2] = sub_100004B00;
    handler[3] = &unk_100010868;
    v9 = v2;
    v14 = v9;
    v15 = v5;
    v16 = v6;
    xpc_connection_set_event_handler(mach_service, handler);
    xpc_connection_resume(mach_service);
    sub_100004A00();
    v10 = dispatch_time(0, 60000000000);
    v11[0] = _NSConcreteStackBlock;
    v11[1] = 3221225472;
    v11[2] = sub_10000B178;
    v11[3] = &unk_100010890;
    v12 = v9;
    dispatch_after(v10, v12, v11);
    sub_10000B290();

    objc_autoreleasePoolPop(v8);
    dispatch_main();
  }
  fwrite("Error: This service may only be launched by launchd.\n", 0x35uLL, 1uLL, __stderrp);
  _exit(-1);
}

id sub_1000056D8(__CFString *a1)
{
  __CFString *v1;
  __CFString *v2;
  void *v3;
  unsigned int v4;
  __CFString *v5;
  __CFString *v6;
  void *v7;
  uint64_t v8;
  void *v9;
  void *v10;
  void *v11;
  id v12;
  id v13;
  int has_internal_diagnostics;
  uint64_t v15;
  _BOOL8 v16;
  uint64_t v17;
  uint64_t v18;
  uint64_t v19;
  uint64_t v20;
  uint64_t v21;
  void *v22;
  void *v23;
  void *v24;
  void *v25;
  void *v26;
  void *v27;
  void *v28;
  void *v29;
  void *v30;
  void *v31;
  id v32;
  id v33;
  void *v34;
  void *v35;
  void *v36;
  void *v37;
  id v38;
  id v39;
  id v40;
  uint64_t v41;
  void *v42;
  id v43;
  id v44;
  id v45;
  uint64_t v46;
  void *v47;
  id v48;
  id v49;
  id v50;
  uint64_t v51;
  void *v52;
  id v53;
  id v54;
  id v55;
  uint64_t v56;
  void *v57;
  id v58;
  id v59;
  id v60;
  uint64_t v61;
  void *v62;
  id v63;
  id v64;
  id v65;
  uint64_t v66;
  void *v67;
  id v68;
  id v69;
  id v70;
  uint64_t v71;
  void *v72;
  void *v74;
  id v75;
  __CFString *v76;
  id v77;

  v1 = CFSTR("/Library/Managed Preferences/mobile/com.apple.ReportMemoryException.plist");
  if (a1)
    v1 = a1;
  v2 = v1;
  v3 = (void *)objc_claimAutoreleasedReturnValue(+[NSFileManager defaultManager](NSFileManager, "defaultManager"));
  v4 = objc_msgSend(v3, "fileExistsAtPath:", v2);
  if (v4)
    v5 = v2;
  else
    v5 = 0;
  v6 = v5;

  v7 = 0;
  if (v4)
    v7 = (void *)objc_claimAutoreleasedReturnValue(+[NSDictionary dictionaryWithContentsOfFile:](NSDictionary, "dictionaryWithContentsOfFile:", v2));
  v8 = objc_claimAutoreleasedReturnValue(+[RMECacheEnumerator getEPLProfilePath](RMECacheEnumerator, "getEPLProfilePath"));
  v76 = v6;
  if (v8)
  {
    v9 = (void *)v8;
    v10 = (void *)objc_claimAutoreleasedReturnValue(+[NSFileManager defaultManager](NSFileManager, "defaultManager"));
    if (objc_msgSend(v10, "fileExistsAtPath:", v9))
      v11 = v9;
    else
      v11 = 0;
    v12 = v11;

    if (v12)
    {
      v74 = v9;
      v12 = (id)objc_claimAutoreleasedReturnValue(+[NSDictionary dictionaryWithContentsOfFile:](NSDictionary, "dictionaryWithContentsOfFile:", v12));
    }
    else
    {
      v74 = 0;
    }
  }
  else
  {
    v74 = 0;
    v12 = 0;
  }
  v75 = v7;
  v77 = v12;
  v13 = objc_alloc_init((Class)NSMutableDictionary);
  has_internal_diagnostics = os_variant_has_internal_diagnostics("com.apple.ReportMemoryException");
  if ((has_internal_diagnostics & 1) != 0)
    v15 = 30;
  else
    v15 = 0;
  v16 = (has_internal_diagnostics & 1) != 0;
  if ((has_internal_diagnostics & 1) != 0)
    v17 = 120;
  else
    v17 = 0;
  if ((has_internal_diagnostics & 1) != 0)
    v18 = 2;
  else
    v18 = 0;
  if ((has_internal_diagnostics & 1) != 0)
    v19 = 10;
  else
    v19 = 0;
  if ((has_internal_diagnostics & 1) != 0)
    v20 = 12;
  else
    v20 = 0;
  v21 = has_internal_diagnostics ^ 1u;
  v22 = (void *)objc_claimAutoreleasedReturnValue(+[NSNumber numberWithInteger:](NSNumber, "numberWithInteger:", v15));
  objc_msgSend(v13, "setObject:forKeyedSubscript:", v22, off_100014600[0]);

  v23 = (void *)objc_claimAutoreleasedReturnValue(+[NSNumber numberWithInteger:](NSNumber, "numberWithInteger:", v16));
  objc_msgSend(v13, "setObject:forKeyedSubscript:", v23, off_100014608[0]);

  v24 = (void *)objc_claimAutoreleasedReturnValue(+[NSNumber numberWithInteger:](NSNumber, "numberWithInteger:", v17));
  objc_msgSend(v13, "setObject:forKeyedSubscript:", v24, off_100014618[0]);

  v25 = (void *)objc_claimAutoreleasedReturnValue(+[NSNumber numberWithInteger:](NSNumber, "numberWithInteger:", v16));
  objc_msgSend(v13, "setObject:forKeyedSubscript:", v25, CFSTR("PerProcessLimit"));

  v26 = (void *)objc_claimAutoreleasedReturnValue(+[NSNumber numberWithInteger:](NSNumber, "numberWithInteger:", v20));
  objc_msgSend(v13, "setObject:forKeyedSubscript:", v26, CFSTR("LitePerProcessLimit"));

  v27 = (void *)objc_claimAutoreleasedReturnValue(+[NSNumber numberWithInteger:](NSNumber, "numberWithInteger:", v18));
  objc_msgSend(v13, "setObject:forKeyedSubscript:", v27, CFSTR("PerCriticalProcessLimit"));

  v28 = (void *)objc_claimAutoreleasedReturnValue(+[NSNumber numberWithInteger:](NSNumber, "numberWithInteger:", v19));
  objc_msgSend(v13, "setObject:forKeyedSubscript:", v28, off_1000145F8[0]);

  v29 = (void *)objc_claimAutoreleasedReturnValue(+[NSNumber numberWithInteger:](NSNumber, "numberWithInteger:", v19));
  objc_msgSend(v13, "setObject:forKeyedSubscript:", v29, off_100014610[0]);

  v30 = (void *)objc_claimAutoreleasedReturnValue(+[NSMutableDictionary dictionary](NSMutableDictionary, "dictionary"));
  objc_msgSend(v13, "setObject:forKeyedSubscript:", v30, CFSTR("ProcessSpecificFullDiagQuotas"));

  v31 = (void *)objc_claimAutoreleasedReturnValue(+[NSNumber numberWithBool:](NSNumber, "numberWithBool:", v21));
  objc_msgSend(v13, "setObject:forKeyedSubscript:", v31, CFSTR("AllowAllProcessesInSysdiagnose"));

  v32 = objc_msgSend(objc_alloc((Class)NSMutableSet), "initWithArray:", &off_100011368);
  if (objc_msgSend(v32, "count"))
    v33 = objc_msgSend(v32, "mutableCopy");
  else
    v33 = objc_alloc_init((Class)NSMutableSet);
  v34 = v33;
  objc_msgSend(v13, "setObject:forKeyedSubscript:", v33, CFSTR("ProcessesAllowedInSysdiagnose"));

  v35 = (void *)objc_claimAutoreleasedReturnValue(+[NSMutableSet set](NSMutableSet, "set"));
  if (os_variant_has_internal_diagnostics("com.apple.ReportMemoryException"))
  {
    objc_msgSend(v35, "addObject:", CFSTR("mediaserverd"));
    objc_msgSend(v35, "addObject:", CFSTR("cameracaptured"));
  }
  if (os_variant_has_internal_diagnostics("com.apple.ReportMemoryException"))
    objc_msgSend(v35, "addObject:", CFSTR("backboardd"));
  objc_msgSend(v13, "setObject:forKeyedSubscript:", v35, CFSTR("LargeExemptedProcesses"));

  objc_msgSend(v13, "setObject:forKeyedSubscript:", v32, off_100014620[0]);
  v36 = (void *)objc_claimAutoreleasedReturnValue(+[NSNumber numberWithBool:](NSNumber, "numberWithBool:", 0));
  objc_msgSend(v13, "setObject:forKeyedSubscript:", v36, off_100014628[0]);

  v37 = (void *)objc_claimAutoreleasedReturnValue(+[NSMutableArray array](NSMutableArray, "array"));
  objc_msgSend(v13, "setObject:forKeyedSubscript:", v37, off_100014630[0]);

  v38 = objc_alloc((Class)NSMutableDictionary);
  v39 = objc_alloc_init((Class)NSMutableDictionary);
  v40 = objc_msgSend(v38, "initWithObjectsAndKeys:", v39, CFSTR("ExecNameList"), 0);
  v41 = MREExceptionTypeToString(2);
  v42 = (void *)objc_claimAutoreleasedReturnValue(v41);
  objc_msgSend(v13, "setObject:forKeyedSubscript:", v40, v42);

  v43 = objc_alloc((Class)NSMutableDictionary);
  v44 = objc_alloc_init((Class)NSMutableDictionary);
  v45 = objc_msgSend(v43, "initWithObjectsAndKeys:", v44, CFSTR("ExecNameList"), 0);
  v46 = MREExceptionTypeToString(3);
  v47 = (void *)objc_claimAutoreleasedReturnValue(v46);
  objc_msgSend(v13, "setObject:forKeyedSubscript:", v45, v47);

  v48 = objc_alloc((Class)NSMutableDictionary);
  v49 = objc_alloc_init((Class)NSMutableDictionary);
  v50 = objc_msgSend(v48, "initWithObjectsAndKeys:", v49, CFSTR("ExecNameList"), 0);
  v51 = MREExceptionTypeToString(4);
  v52 = (void *)objc_claimAutoreleasedReturnValue(v51);
  objc_msgSend(v13, "setObject:forKeyedSubscript:", v50, v52);

  v53 = objc_alloc((Class)NSMutableDictionary);
  v54 = objc_alloc_init((Class)NSMutableDictionary);
  v55 = objc_msgSend(v53, "initWithObjectsAndKeys:", v54, CFSTR("ExecNameList"), 0);
  v56 = MREExceptionTypeToString(5);
  v57 = (void *)objc_claimAutoreleasedReturnValue(v56);
  objc_msgSend(v13, "setObject:forKeyedSubscript:", v55, v57);

  v58 = objc_alloc((Class)NSMutableDictionary);
  v59 = objc_alloc_init((Class)NSMutableDictionary);
  v60 = objc_msgSend(v58, "initWithObjectsAndKeys:", v59, CFSTR("ExecNameList"), 0);
  v61 = MREExceptionTypeToString(1);
  v62 = (void *)objc_claimAutoreleasedReturnValue(v61);
  objc_msgSend(v13, "setObject:forKeyedSubscript:", v60, v62);

  v63 = objc_alloc((Class)NSMutableDictionary);
  v64 = objc_alloc_init((Class)NSMutableDictionary);
  v65 = objc_msgSend(v63, "initWithObjectsAndKeys:", v64, CFSTR("ExecNameList"), 0);
  v66 = MREExceptionTypeToString(6);
  v67 = (void *)objc_claimAutoreleasedReturnValue(v66);
  objc_msgSend(v13, "setObject:forKeyedSubscript:", v65, v67);

  v68 = objc_alloc((Class)NSMutableDictionary);
  v69 = objc_alloc_init((Class)NSMutableDictionary);
  v70 = objc_msgSend(v68, "initWithObjectsAndKeys:", v69, CFSTR("ExecNameList"), 0);
  v71 = MREExceptionTypeToString(0);
  v72 = (void *)objc_claimAutoreleasedReturnValue(v71);
  objc_msgSend(v13, "setObject:forKeyedSubscript:", v70, v72);

  if (v77)
    sub_10000A000(v13, v77);
  if (v75)
    sub_10000A000(v13, v75);

  return v13;
}

uint64_t sub_100005E24(uint64_t result, uint64_t a2)
{
  *(_QWORD *)(result + 40) = *(_QWORD *)(a2 + 40);
  *(_QWORD *)(a2 + 40) = 0;
  return result;
}

CFTypeRef sub_100005E34(uint64_t a1, int a2, void *a3)
{
  void *v4;
  id v5;
  CFTypeRef v6;
  uint64_t v8;

  if (!*(_QWORD *)(*(_QWORD *)(*(_QWORD *)(a1 + 32) + 8) + 40))
    return 0;
  v4 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(a3, "objectForKeyedSubscript:", CFSTR("CACHE_DELETE_VOLUME")));
  v8 = 0;
  v5 = sub_10000297C(v4, a2, &v8);
  v6 = sub_100005FA4(v4, v8);

  return v6;
}

uint64_t sub_100005EBC(void *a1)
{
  id v1;
  uint64_t v2;
  int *v4;
  char *v5;
  _QWORD v6[2];
  uint8_t buf[4];
  id v8;
  __int16 v9;
  char *v10;

  v6[0] = 0;
  v6[1] = 0;
  v1 = objc_retainAutorelease(a1);
  if ((dirstat_np(objc_msgSend(v1, "fileSystemRepresentation"), 0, v6, 16) & 0x80000000) != 0
    && os_log_type_enabled((os_log_t)&_os_log_default, OS_LOG_TYPE_ERROR))
  {
    v4 = __error();
    v5 = strerror(*v4);
    *(_DWORD *)buf = 138412546;
    v8 = v1;
    v9 = 2080;
    v10 = v5;
    _os_log_error_impl((void *)&_mh_execute_header, (os_log_t)&_os_log_default, OS_LOG_TYPE_ERROR, "Directory sizing for %@ failed with error %s", buf, 0x16u);
  }
  v2 = v6[0];

  return v2;
}

CFTypeRef sub_100005FA4(void *a1, uint64_t a2)
{
  id v3;
  id v4;
  void *v5;
  CFTypeRef v6;

  v3 = a1;
  v4 = objc_alloc_init((Class)NSMutableDictionary);
  objc_msgSend(v4, "setObject:forKeyedSubscript:", v3, CFSTR("CACHE_DELETE_VOLUME"));

  v5 = (void *)objc_claimAutoreleasedReturnValue(+[NSNumber numberWithUnsignedInteger:](NSNumber, "numberWithUnsignedInteger:", a2));
  objc_msgSend(v4, "setObject:forKeyedSubscript:", v5, CFSTR("CACHE_DELETE_AMOUNT"));

  v6 = CFRetain(v4);
  return v6;
}

void sub_10000603C(uint64_t a1)
{

}

CFTypeRef sub_100006044(uint64_t a1, int a2, void *a3)
{
  void *v4;
  id v5;
  void *v6;
  void *v7;
  id v8;
  id v9;
  id v10;
  uint64_t v11;
  void *v12;
  CFTypeRef v13;
  __int128 v15;
  __int128 v16;
  __int128 v17;
  __int128 v18;
  uint64_t v19;
  _BYTE v20[128];

  if (!*(_QWORD *)(*(_QWORD *)(*(_QWORD *)(a1 + 32) + 8) + 40))
    return 0;
  v4 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(a3, "objectForKeyedSubscript:", CFSTR("CACHE_DELETE_VOLUME")));
  v19 = 0;
  v5 = sub_10000297C(v4, a2, &v19);
  v6 = (void *)objc_claimAutoreleasedReturnValue(v5);
  if (v6)
  {
    v7 = (void *)objc_claimAutoreleasedReturnValue(+[NSFileManager defaultManager](NSFileManager, "defaultManager"));
    v15 = 0u;
    v16 = 0u;
    v17 = 0u;
    v18 = 0u;
    v8 = v6;
    v9 = objc_msgSend(v8, "countByEnumeratingWithState:objects:count:", &v15, v20, 16);
    if (v9)
    {
      v10 = v9;
      v11 = *(_QWORD *)v16;
      do
      {
        v12 = 0;
        do
        {
          if (*(_QWORD *)v16 != v11)
            objc_enumerationMutation(v8);
          objc_msgSend(v7, "removeItemAtPath:error:", *(_QWORD *)(*((_QWORD *)&v15 + 1) + 8 * (_QWORD)v12), 0, (_QWORD)v15);
          v12 = (char *)v12 + 1;
        }
        while (v10 != v12);
        v10 = objc_msgSend(v8, "countByEnumeratingWithState:objects:count:", &v15, v20, 16);
      }
      while (v10);
    }

  }
  v13 = sub_100005FA4(v4, v19);

  return v13;
}

CFTypeRef sub_1000061C4(uint64_t a1, uint64_t a2, void *a3)
{
  id v3;
  void *v4;
  void *v5;
  void *v6;
  id v7;
  id v8;
  uint64_t v9;
  uint64_t v10;
  void *i;
  void *v12;
  void *v13;
  void *v14;
  void *v15;
  id v16;
  NSFileAttributeType v17;
  uint64_t v18;
  id v19;
  id v20;
  id v21;
  uint64_t v22;
  void *j;
  CFTypeRef v24;
  void *v26;
  id v27;
  void *v28;
  id obj;
  void *v30;
  void *v31;
  __int128 v32;
  __int128 v33;
  __int128 v34;
  __int128 v35;
  __int128 v36;
  __int128 v37;
  __int128 v38;
  __int128 v39;
  uint8_t v40[128];
  uint8_t buf[4];
  void *v42;

  if (!*(_QWORD *)(*(_QWORD *)(*(_QWORD *)(a1 + 32) + 8) + 40))
    return 0;
  v28 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(a3, "objectForKeyedSubscript:", CFSTR("CACHE_DELETE_VOLUME")));
  v27 = objc_msgSend(objc_alloc((Class)RMECacheEnumerator), "initCacheEnumeratorWithVolume:", v28);
  v3 = sub_1000043F4(0, 0, v27);
  v4 = (void *)objc_claimAutoreleasedReturnValue(v3);
  v5 = (void *)objc_claimAutoreleasedReturnValue(+[NSFileManager defaultManager](NSFileManager, "defaultManager"));
  v31 = (void *)objc_claimAutoreleasedReturnValue(+[NSDate dateWithTimeIntervalSinceNow:](NSDate, "dateWithTimeIntervalSinceNow:", -345600.0));
  if (os_log_type_enabled((os_log_t)&_os_log_default, OS_LOG_TYPE_DEFAULT))
  {
    *(_DWORD *)buf = 138543362;
    v42 = v31;
    _os_log_impl((void *)&_mh_execute_header, (os_log_t)&_os_log_default, OS_LOG_TYPE_DEFAULT, "Removing applicable files older than %{public}@", buf, 0xCu);
  }
  v6 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v4, "reverseObjectEnumerator", v4));
  v30 = (void *)objc_claimAutoreleasedReturnValue(+[NSMutableArray array](NSMutableArray, "array"));
  v36 = 0u;
  v37 = 0u;
  v38 = 0u;
  v39 = 0u;
  obj = v6;
  v7 = objc_msgSend(obj, "countByEnumeratingWithState:objects:count:", &v36, buf, 16);
  if (v7)
  {
    v8 = v7;
    v9 = 0;
    v10 = *(_QWORD *)v37;
    while (2)
    {
      for (i = 0; i != v8; i = (char *)i + 1)
      {
        if (*(_QWORD *)v37 != v10)
          objc_enumerationMutation(obj);
        v12 = *(void **)(*((_QWORD *)&v36 + 1) + 8 * (_QWORD)i);
        v13 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v5, "attributesOfItemAtPath:error:", v12, 0));
        v14 = v13;
        if (v13)
        {
          v15 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v13, "fileCreationDate"));
          v16 = objc_msgSend(v31, "compare:", v15);

          if (v16 == (id)-1)
          {

            goto LABEL_20;
          }
          objc_msgSend(v30, "addObject:", v12);
          v17 = (NSFileAttributeType)objc_claimAutoreleasedReturnValue(objc_msgSend(v14, "fileType"));

          if (v17 == NSFileTypeDirectory)
            v18 = sub_100005EBC(v12);
          else
            v18 = (uint64_t)objc_msgSend(v14, "fileSize");
          v9 += v18;
        }

      }
      v8 = objc_msgSend(obj, "countByEnumeratingWithState:objects:count:", &v36, buf, 16);
      if (v8)
        continue;
      break;
    }
  }
  else
  {
    v9 = 0;
  }
LABEL_20:

  v34 = 0u;
  v35 = 0u;
  v32 = 0u;
  v33 = 0u;
  v19 = v30;
  v20 = objc_msgSend(v19, "countByEnumeratingWithState:objects:count:", &v32, v40, 16);
  if (v20)
  {
    v21 = v20;
    v22 = *(_QWORD *)v33;
    do
    {
      for (j = 0; j != v21; j = (char *)j + 1)
      {
        if (*(_QWORD *)v33 != v22)
          objc_enumerationMutation(v19);
        objc_msgSend(v5, "removeItemAtPath:error:", *(_QWORD *)(*((_QWORD *)&v32 + 1) + 8 * (_QWORD)j), 0);
      }
      v21 = objc_msgSend(v19, "countByEnumeratingWithState:objects:count:", &v32, v40, 16);
    }
    while (v21);
  }

  v24 = sub_100005FA4(v28, v9);
  return v24;
}

id sub_10000668C(uint64_t a1)
{
  void *v2;
  id v3;
  void *v4;
  void *v5;
  id v6;
  _BOOL8 v7;
  void *v8;
  id v9;
  uint64_t v10;
  uint64_t v11;
  void *v12;
  void *v13;
  void *v14;
  void *v15;
  void *v16;
  void *v17;
  void *v18;
  void *v19;
  void *v20;
  void *v21;
  void *v23;
  void *v24;
  void *v25;
  void *v26;
  uint64_t v27;
  void *v28;
  uint64_t v29;
  id v30;
  _QWORD v31[14];
  _QWORD v32[14];
  uint8_t buf[4];
  id v34;
  __int16 v35;
  void *v36;

  v2 = *(void **)(a1 + 32);
  if (v2)
  {
    v3 = v2;
    v4 = (void *)objc_claimAutoreleasedReturnValue(+[NSFileManager defaultManager](NSFileManager, "defaultManager"));
    v30 = 0;
    v5 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v4, "attributesOfItemAtPath:error:", v3, &v30));
    v6 = v30;

    v7 = v6 == 0;
    if (v6)
    {
      if (os_log_type_enabled((os_log_t)&_os_log_default, OS_LOG_TYPE_DEFAULT))
      {
        v8 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v6, "description"));
        *(_DWORD *)buf = 138412546;
        v34 = v3;
        v35 = 2112;
        v36 = v8;
        _os_log_impl((void *)&_mh_execute_header, (os_log_t)&_os_log_default, OS_LOG_TYPE_DEFAULT, "Failed to retrieve file size for \"%@\" with error: %@", buf, 0x16u);

      }
      v9 = 0;
    }
    else
    {
      v9 = objc_msgSend(v5, "fileSize");
    }

  }
  else
  {
    v9 = 0;
    v7 = 0;
  }
  v31[0] = CFSTR("execName");
  v10 = *(_QWORD *)(a1 + 40);
  v29 = v10;
  if (!v10)
    v10 = objc_claimAutoreleasedReturnValue(+[NSNull null](NSNull, "null"));
  v28 = (void *)v10;
  v32[0] = v10;
  v31[1] = CFSTR("bundleID");
  v11 = *(_QWORD *)(a1 + 48);
  v27 = v11;
  if (!v11)
    v11 = objc_claimAutoreleasedReturnValue(+[NSNull null](NSNull, "null"));
  v32[1] = v11;
  v31[2] = CFSTR("exceptionType");
  v26 = (void *)objc_claimAutoreleasedReturnValue(+[NSNumber numberWithInteger:](NSNumber, "numberWithInteger:", *(_QWORD *)(a1 + 56), v11));
  v32[2] = v26;
  v31[3] = CFSTR("footprint");
  v25 = (void *)objc_claimAutoreleasedReturnValue(+[NSNumber numberWithUnsignedLongLong:](NSNumber, "numberWithUnsignedLongLong:", *(_QWORD *)(a1 + 64)));
  v32[3] = v25;
  v31[4] = CFSTR("footprintPeak");
  v24 = (void *)objc_claimAutoreleasedReturnValue(+[NSNumber numberWithUnsignedLongLong:](NSNumber, "numberWithUnsignedLongLong:", *(_QWORD *)(a1 + 72)));
  v32[4] = v24;
  v31[5] = CFSTR("jetsamLimit");
  v12 = (void *)objc_claimAutoreleasedReturnValue(+[NSNumber numberWithUnsignedLongLong:](NSNumber, "numberWithUnsignedLongLong:", *(_QWORD *)(a1 + 80)));
  v32[5] = v12;
  v31[6] = CFSTR("memgraphAttempted");
  v13 = (void *)objc_claimAutoreleasedReturnValue(+[NSNumber numberWithBool:](NSNumber, "numberWithBool:", *(unsigned __int8 *)(a1 + 104)));
  v32[6] = v13;
  v31[7] = CFSTR("reasonMemgraphSkipped");
  v14 = (void *)objc_claimAutoreleasedReturnValue(+[NSNumber numberWithInteger:](NSNumber, "numberWithInteger:", *(_QWORD *)(a1 + 88)));
  v32[7] = v14;
  v31[8] = CFSTR("memgraphSucceeded");
  v15 = (void *)objc_claimAutoreleasedReturnValue(+[NSNumber numberWithBool:](NSNumber, "numberWithBool:", *(unsigned __int8 *)(a1 + 105)));
  v32[8] = v15;
  v31[9] = CFSTR("reasonMemgraphFailed");
  v16 = (void *)objc_claimAutoreleasedReturnValue(+[NSNumber numberWithInteger:](NSNumber, "numberWithInteger:", *(_QWORD *)(a1 + 96)));
  v32[9] = v16;
  v31[10] = CFSTR("diagFileSizeSucceeded");
  v17 = (void *)objc_claimAutoreleasedReturnValue(+[NSNumber numberWithBool:](NSNumber, "numberWithBool:", v7));
  v32[10] = v17;
  v31[11] = CFSTR("diagFileSize");
  v18 = (void *)objc_claimAutoreleasedReturnValue(+[NSNumber numberWithUnsignedLongLong:](NSNumber, "numberWithUnsignedLongLong:", v9));
  v32[11] = v18;
  v31[12] = CFSTR("isMSLEnabled");
  v19 = (void *)objc_claimAutoreleasedReturnValue(+[NSNumber numberWithBool:](NSNumber, "numberWithBool:", *(unsigned __int8 *)(a1 + 106)));
  v32[12] = v19;
  v31[13] = CFSTR("isGcoreCapture");
  v20 = (void *)objc_claimAutoreleasedReturnValue(+[NSNumber numberWithBool:](NSNumber, "numberWithBool:", *(unsigned __int8 *)(a1 + 107)));
  v32[13] = v20;
  v21 = (void *)objc_claimAutoreleasedReturnValue(+[NSDictionary dictionaryWithObjects:forKeys:count:](NSDictionary, "dictionaryWithObjects:forKeys:count:", v32, v31, 14));

  if (!v27)
  if (!v29)

  return v21;
}

void sub_100006A88(mach_port_name_t a1, void *a2, int a3, uint64_t a4, void *a5, void *a6, void *a7)
{
  id v13;
  id v14;
  id v15;
  void (**v16)(id, void *);
  int v17;
  void *v18;
  unsigned int v19;
  void *v20;
  unsigned int v21;
  void *v22;
  id v23;
  _QWORD block[4];
  id v25;
  id v26;
  dispatch_queue_t v27;
  id v28;
  void (**v29)(id, void *);
  uint64_t v30;
  mach_port_name_t v31;
  int v32;

  v13 = a2;
  v14 = a5;
  v15 = a6;
  v16 = a7;
  if (qword_1000146A8 != -1)
    dispatch_once(&qword_1000146A8, &stru_1000105A8);
  do
    v17 = __ldaxr(&dword_100014690);
  while (__stlxr(v17 + 1, &dword_100014690));
  if (v17 < 2)
  {
    if (mach_port_mod_refs(mach_task_self_, a1, 0, 1))
    {
      v20 = (void *)objc_claimAutoreleasedReturnValue(+[NSError errorWithDomain:code:userInfo:](NSError, "errorWithDomain:code:userInfo:", MREErrorDomain[0], 3, 0));
      v16[2](v16, v20);

      do
        v21 = __ldaxr(&dword_100014690);
      while (__stlxr(v21 - 1, &dword_100014690));
    }
    else
    {
      v22 = (void *)os_transaction_create("com.apple.ReportMemoryException");
      block[0] = _NSConcreteStackBlock;
      block[1] = 3221225472;
      block[2] = sub_100006CF0;
      block[3] = &unk_1000105D0;
      v31 = a1;
      v32 = a3;
      v30 = a4;
      v25 = v13;
      v26 = v22;
      v27 = (dispatch_queue_t)v14;
      v28 = v15;
      v29 = v16;
      v23 = v22;
      dispatch_async(v27, block);

    }
  }
  else
  {
    if (v16)
    {
      v18 = (void *)objc_claimAutoreleasedReturnValue(+[NSError errorWithDomain:code:userInfo:](NSError, "errorWithDomain:code:userInfo:", MREErrorDomain[0], 13, 0));
      v16[2](v16, v18);

    }
    do
      v19 = __ldaxr(&dword_100014690);
    while (__stlxr(v19 - 1, &dword_100014690));
  }

}

void sub_100006CC0(id a1)
{
  id v1;
  uint64_t v2;
  void *v3;

  CSSetForceSafeMachVMReads(1);
  v1 = sub_1000056D8(0);
  v2 = objc_claimAutoreleasedReturnValue(v1);
  v3 = (void *)qword_1000146A0;
  qword_1000146A0 = v2;

}

void sub_100006CF0(uint64_t a1)
{
  uint64_t v1;
  int v2;
  void *v3;
  void *v4;
  void *v5;
  void *v6;
  void *v7;
  id v8;
  id v9;
  NSObject *v10;
  NSObject *v11;
  void (**v12)(id, id);
  void *v13;
  id v14;
  void *v15;
  unsigned int v16;
  int v17;
  id v18;
  void (**v19)(id, id);
  _QWORD *v20;
  dispatch_block_t v21;
  void *v22;
  void *v23;
  unsigned int v24;
  dispatch_time_t when;
  id v26;
  dispatch_qos_class_t qos_class;
  dispatch_qos_class_t qos_classa[2];
  void *v29;
  void *v30;
  void *v31;
  id from;
  id location;
  _QWORD v34[4];
  id v35;
  id v36;
  id v37;
  void (**v38)(id, id);
  _QWORD *v39;
  int v40;
  _QWORD v41[3];
  char v42;
  id v43;
  _BYTE buf[24];
  void *v45;
  id v46;
  _QWORD *v47;
  id v48;
  id v49[4];

  v1 = *(unsigned int *)(a1 + 80);
  v2 = *(_DWORD *)(a1 + 84);
  v3 = *(void **)(a1 + 40);
  v4 = *(void **)(a1 + 48);
  v5 = *(void **)(a1 + 56);
  v6 = *(void **)(a1 + 64);
  v7 = *(void **)(a1 + 72);
  v8 = *(id *)(a1 + 32);
  v9 = v3;
  v10 = v4;
  v11 = v5;
  v12 = v6;
  if (qword_100014708 != -1)
    dispatch_once(&qword_100014708, &stru_100010720);
  v43 = 0;
  v13 = (void *)objc_claimAutoreleasedReturnValue(+[MemoryResourceException resourceExceptionFromTask:error:](MemoryResourceException, "resourceExceptionFromTask:error:", v1, &v43));
  v14 = v43;
  mach_port_deallocate(mach_task_self_, v1);
  if (!v13 || v14 || objc_msgSend(v13, "exceptionType") == (id)7)
  {
    if (v12)
      v12[2](v12, v14);
  }
  else
  {
    v15 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v13, "execName"));
    if (qword_1000146C0 - qword_1000146C8 >= (unint64_t)sub_100007190(v15))
    {
      objc_msgSend(v13, "releaseAnalyzedTask");
      if (v12)
      {
        v23 = (void *)objc_claimAutoreleasedReturnValue(+[NSError errorWithDomain:code:userInfo:](NSError, "errorWithDomain:code:userInfo:", MREErrorDomain[0], 14, 0));
        v12[2](v12, v23);

      }
    }
    else
    {
      v31 = v7;
      v16 = objc_msgSend(v13, "pid");
      v29 = (void *)++qword_1000146C0;
      if (v12)
        v17 = 17;
      else
        v17 = 9;
      qos_class = v17;
      if (os_log_type_enabled((os_log_t)&_os_log_default, OS_LOG_TYPE_DEFAULT))
      {
        *(_DWORD *)buf = 136315906;
        *(_QWORD *)&buf[4] = "liteAnalysisMemgraphOnly";
        *(_WORD *)&buf[12] = 2048;
        *(_QWORD *)&buf[14] = v31;
        *(_WORD *)&buf[22] = 2112;
        v45 = v15;
        LOWORD(v46) = 1024;
        *(_DWORD *)((char *)&v46 + 2) = v16;
        _os_log_impl((void *)&_mh_execute_header, (os_log_t)&_os_log_default, OS_LOG_TYPE_DEFAULT, "%s: Using timeout of %llu seconds for process %@ [%d]", buf, 0x26u);
      }
      v41[0] = 0;
      v41[1] = v41;
      v41[2] = 0x2020000000;
      v42 = 0;
      v34[0] = _NSConcreteStackBlock;
      v34[1] = 3221225472;
      v34[2] = sub_1000097BC;
      v34[3] = &unk_100010770;
      v30 = v15;
      v18 = v13;
      v40 = v2;
      v35 = v18;
      v39 = v41;
      v26 = v8;
      v36 = v26;
      v19 = v12;
      v38 = v19;
      v37 = v9;
      v20 = objc_retainBlock(v34);
      v21 = dispatch_block_create_with_qos_class((dispatch_block_flags_t)0, qos_class, 0, v20);
      *(_QWORD *)qos_classa = v8;
      v22 = v21;

      dispatch_async(v11, v22);
      objc_initWeak(&location, v18);
      objc_initWeak(&from, v19);
      when = dispatch_time(0, 1000000000 * (_QWORD)v31);
      *(_QWORD *)buf = _NSConcreteStackBlock;
      *(_QWORD *)&buf[8] = 3221225472;
      *(_QWORD *)&buf[16] = sub_100009B38;
      v45 = &unk_100010798;
      v49[1] = v29;
      v47 = v41;
      objc_copyWeak(&v48, &location);
      objc_copyWeak(v49, &from);
      v46 = v26;
      v49[2] = v31;
      v15 = v30;
      dispatch_after(when, v10, buf);

      objc_destroyWeak(v49);
      objc_destroyWeak(&v48);
      objc_destroyWeak(&from);
      objc_destroyWeak(&location);

      v8 = *(id *)qos_classa;
      _Block_object_dispose(v41, 8);
    }

  }
  do
    v24 = __ldaxr(&dword_100014690);
  while (__stlxr(v24 - 1, &dword_100014690));
}

void sub_100007160(id a1)
{
  os_log_t v1;
  void *v2;

  v1 = os_log_create("com.apple.ReportMemoryException", "MemoryResourceException");
  v2 = (void *)qword_1000146B0;
  qword_1000146B0 = (uint64_t)v1;

}

uint64_t sub_100007190(void *a1)
{
  id v1;
  void *v2;
  uint64_t v3;
  _DWORD v5[2];
  __int16 v6;
  int v7;
  __int16 v8;
  void *v9;

  v1 = a1;
  v2 = v1;
  if (v1 && sub_100009FB4(v1))
  {
    v3 = 2;
    if (os_log_type_enabled((os_log_t)&_os_log_default, OS_LOG_TYPE_DEFAULT))
    {
      v5[0] = 67109634;
      v5[1] = 1;
      v6 = 1024;
      v7 = 2;
      v8 = 2114;
      v9 = v2;
      _os_log_impl((void *)&_mh_execute_header, (os_log_t)&_os_log_default, OS_LOG_TYPE_DEFAULT, "Bumping max bulk requests in flight from %d to %d for critical process %{public}@.", (uint8_t *)v5, 0x18u);
    }
  }
  else
  {
    v3 = 1;
  }

  return v3;
}

void sub_100007270(uint64_t a1)
{
  void *v1;
  os_unfair_lock_s *v2;
  int v3;
  int v4;
  int v5;
  uint64_t v6;
  id v7;
  void *v8;
  uint64_t v9;
  void *v10;
  unsigned int v11;
  id v12;
  void *v13;
  id v14;
  void *v15;
  uint64_t v16;
  uint64_t v17;
  void *v18;
  void *v19;
  void *v20;
  unsigned int v21;
  void *v22;
  unsigned int v23;
  id v24;
  void *v25;
  void *v26;
  id v27;
  void *v28;
  id v29;
  void *v30;
  id v31;
  void *v32;
  id v33;
  id v34;
  id v35;
  uint64_t (*v36)(id);
  int v37;
  void *v38;
  unsigned int v39;
  void *v40;
  unsigned int v41;
  id v42;
  void *v43;
  unsigned int v44;
  id v45;
  uint64_t v46;
  id v47;
  _BOOL4 v48;
  void *v49;
  unsigned int v50;
  int v51;
  id v52;
  id v53;
  id v54;
  uint64_t v55;
  void *v56;
  const __CFString *v57;
  void *v58;
  id v59;
  void *v60;
  void *v61;
  void *v62;
  void *v63;
  void *v64;
  unsigned int v65;
  void *v66;
  id v67;
  void *v68;
  void *v69;
  void *v70;
  id v71;
  id v72;
  uint64_t v73;
  void *v74;
  void *v75;
  uint64_t v76;
  BOOL v77;
  unsigned __int8 v78;
  void *v79;
  unsigned int v80;
  void *v81;
  void *v82;
  char *v83;
  uint64_t v84;
  uint64_t v85;
  uint64_t v86;
  void *v87;
  id v88;
  void *v89;
  id v90;
  void *v91;
  uint64_t v92;
  void *v93;
  void (**v94)(id, void *);
  void *v95;
  void *v96;
  id v97;
  id v98;
  unint64_t v99;
  id v100;
  _QWORD v101[4];
  _BYTE buf[32];
  void *v103;
  id v104;
  uint64_t v105;
  void *v106;

  v1 = *(void **)(a1 + 48);
  v2 = *(os_unfair_lock_s **)(*(_QWORD *)(a1 + 56) + 8);
  v3 = *(unsigned __int8 *)(a1 + 80);
  v4 = *(unsigned __int8 *)(a1 + 81);
  v5 = *(unsigned __int8 *)(a1 + 82);
  v6 = *(_QWORD *)(a1 + 64);
  v92 = *(_QWORD *)(a1 + 72);
  v7 = *(id *)(a1 + 32);
  v94 = v1;
  if (os_log_type_enabled((os_log_t)&_os_log_default, OS_LOG_TYPE_DEFAULT))
  {
    v8 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v7, "execName"));
    *(_DWORD *)buf = 138543618;
    *(_QWORD *)&buf[4] = v8;
    *(_WORD *)&buf[12] = 1024;
    *(_DWORD *)&buf[14] = objc_msgSend(v7, "pid");
    _os_log_impl((void *)&_mh_execute_header, (os_log_t)&_os_log_default, OS_LOG_TYPE_DEFAULT, "Begin analysis for %{public}@ [%d]", buf, 0x12u);

  }
  sub_100008640(v7);
  v93 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend((id)qword_1000146A0, "objectForKeyedSubscript:", off_100014628[0]));
  if (objc_msgSend(v93, "BOOLValue"))
    v9 = 2;
  else
    v9 = 0;
  objc_msgSend(v7, "_populateAddtionalMetadataWithOptions:timeoutSecs:", v9, v6);
  v96 = v7;
  if (!v5 && v3 && v4)
  {
    if (os_log_type_enabled((os_log_t)&_os_log_default, OS_LOG_TYPE_DEFAULT))
    {
      v10 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v7, "execName"));
      v11 = objc_msgSend(v7, "pid");
      *(_DWORD *)buf = 138412546;
      *(_QWORD *)&buf[4] = v10;
      *(_WORD *)&buf[12] = 1024;
      *(_DWORD *)&buf[14] = v11;
      _os_log_impl((void *)&_mh_execute_header, (os_log_t)&_os_log_default, OS_LOG_TYPE_DEFAULT, "Attempting to save lite diagnostic before generating a memgraph for process %@ [%d]", buf, 0x12u);

    }
    v100 = 0;
    v12 = sub_100008870(v7, 1, 0, &v100);
    v13 = (void *)objc_claimAutoreleasedReturnValue(v12);
    v14 = v100;
    if (v13)
    {
      if (os_log_type_enabled((os_log_t)&_os_log_default, OS_LOG_TYPE_DEFAULT))
      {
        v15 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v96, "execName"));
        *(_DWORD *)buf = 138412546;
        *(_QWORD *)&buf[4] = v15;
        *(_WORD *)&buf[12] = 2112;
        *(_QWORD *)&buf[14] = v13;
        _os_log_impl((void *)&_mh_execute_header, (os_log_t)&_os_log_default, OS_LOG_TYPE_DEFAULT, "Successfully saved initial lite diagnostic for process %@ at %@", buf, 0x16u);

      }
      objc_msgSend(v96, "setLiteDiagFilePath:", v13);
    }
    else if (os_log_type_enabled((os_log_t)&_os_log_default, OS_LOG_TYPE_ERROR))
    {
      v81 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v96, "execName"));
      v82 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v14, "localizedDescription"));
      *(_DWORD *)buf = 138412546;
      *(_QWORD *)&buf[4] = v81;
      *(_WORD *)&buf[12] = 2114;
      *(_QWORD *)&buf[14] = v82;
      _os_log_error_impl((void *)&_mh_execute_header, (os_log_t)&_os_log_default, OS_LOG_TYPE_ERROR, "Failed to save initial lite diagnostic for process %@: %{public}@", buf, 0x16u);

    }
    v7 = v96;
  }
  v99 = 0;
  v16 = objc_claimAutoreleasedReturnValue(objc_msgSend(v7, "execName"));
  v17 = 2;
  if (v16)
  {
    v18 = (void *)v16;
    v19 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend((id)qword_1000146A0, "objectForKeyedSubscript:", off_100014630[0]));
    v20 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v7, "execName"));
    v21 = objc_msgSend(v19, "containsObject:", v20);

    if (v21)
      v17 = 3;
    else
      v17 = 2;
  }
  if (v5)
  {
    if (os_log_type_enabled((os_log_t)&_os_log_default, OS_LOG_TYPE_DEFAULT))
    {
      v22 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v96, "execName"));
      v23 = objc_msgSend(v96, "pid");
      *(_DWORD *)buf = 138412546;
      *(_QWORD *)&buf[4] = v22;
      *(_WORD *)&buf[12] = 1024;
      *(_DWORD *)&buf[14] = v23;
      _os_log_impl((void *)&_mh_execute_header, (os_log_t)&_os_log_default, OS_LOG_TYPE_DEFAULT, "Attempting to create a gcore for process %@ [%d]", buf, 0x12u);

    }
    v98 = 0;
    v24 = v96;
    v25 = (void *)objc_claimAutoreleasedReturnValue(+[RMECacheEnumerator getGcoreSpoolWithCreateIfNecessary:](RMECacheEnumerator, "getGcoreSpoolWithCreateIfNecessary:", 1));
    v26 = v25;
    if (v25)
    {
      v27 = sub_100009138(v25, &v98, CFSTR(".core"), v24);
      v28 = (void *)objc_claimAutoreleasedReturnValue(v27);
      if (v28)
      {
        v29 = v28;
        v30 = v29;
      }
      else
      {
        if (os_log_type_enabled((os_log_t)&_os_log_default, OS_LOG_TYPE_ERROR))
        {
          *(_WORD *)buf = 0;
          _os_log_error_impl((void *)&_mh_execute_header, (os_log_t)&_os_log_default, OS_LOG_TYPE_ERROR, "Failed to get gcore spool file path", buf, 2u);
        }
        v29 = 0;
        v30 = 0;
      }
    }
    else
    {
      if (os_log_type_enabled((os_log_t)&_os_log_default, OS_LOG_TYPE_ERROR))
      {
        *(_WORD *)buf = 0;
        _os_log_error_impl((void *)&_mh_execute_header, (os_log_t)&_os_log_default, OS_LOG_TYPE_ERROR, "Failed to get gcore spool directory", buf, 2u);
      }
      v101[0] = NSLocalizedDescriptionKey;
      *(_QWORD *)buf = CFSTR("Failed to get gcore spool directory");
      v29 = (id)objc_claimAutoreleasedReturnValue(+[NSDictionary dictionaryWithObjects:forKeys:count:](NSDictionary, "dictionaryWithObjects:forKeys:count:", buf, v101, 1));
      v30 = 0;
      v98 = (id)objc_claimAutoreleasedReturnValue(+[NSError errorWithDomain:code:userInfo:](NSError, "errorWithDomain:code:userInfo:", CFSTR("ReportMemoryExceptionError"), 1, v29));
    }

    v31 = v98;
    if (!v30)
    {
      v32 = v96;
      if (os_log_type_enabled((os_log_t)&_os_log_default, OS_LOG_TYPE_ERROR))
      {
        v79 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v24, "execName"));
        v80 = objc_msgSend(v24, "pid");
        *(_DWORD *)buf = 138412802;
        *(_QWORD *)&buf[4] = v79;
        *(_WORD *)&buf[12] = 1024;
        *(_DWORD *)&buf[14] = v80;
        *(_WORD *)&buf[18] = 2112;
        *(_QWORD *)&buf[20] = v31;
        _os_log_error_impl((void *)&_mh_execute_header, (os_log_t)&_os_log_default, OS_LOG_TYPE_ERROR, "Failed to get filepath to save the gcore for  %@ [%d]: %@", buf, 0x1Cu);

      }
      goto LABEL_57;
    }
    if (!qword_1000146F0)
    {
      *(_OWORD *)buf = off_1000106A0;
      *(_QWORD *)&buf[16] = 0;
      qword_1000146F0 = _sl_dlopen(buf, 0);
    }
    if (qword_1000146F0 && sub_1000094A0())
    {
      v33 = objc_alloc_init((Class)NSMutableDictionary);
      v34 = objc_msgSend(objc_alloc((Class)NSNumber), "initWithInt:", objc_msgSend(v24, "task"));
      objc_msgSend(v33, "setObject:forKeyedSubscript:", v34, CFSTR("port"));

      objc_msgSend(v33, "setObject:forKeyedSubscript:", &off_100011320, CFSTR("pid"));
      objc_msgSend(v33, "setObject:forKeyedSubscript:", &__kCFBooleanTrue, CFSTR("annotations"));
      objc_msgSend(v33, "setObject:forKeyedSubscript:", v30, CFSTR("filename"));
      v35 = v33;
      v36 = (uint64_t (*)(id))sub_1000094A0();
      if (!v36)
      {
        v83 = dlerror();
        abort_report_np("%s", v83);
      }
      v37 = v36(v35);

      objc_msgSend(v24, "releaseAnalyzedTask");
      if (!v37)
      {
        if (os_log_type_enabled((os_log_t)&_os_log_default, OS_LOG_TYPE_DEFAULT))
        {
          v38 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v24, "execName"));
          v39 = objc_msgSend(v24, "pid");
          *(_DWORD *)buf = 138543874;
          *(_QWORD *)&buf[4] = v38;
          *(_WORD *)&buf[12] = 1024;
          *(_DWORD *)&buf[14] = v39;
          *(_WORD *)&buf[18] = 2112;
          *(_QWORD *)&buf[20] = v30;
          _os_log_impl((void *)&_mh_execute_header, (os_log_t)&_os_log_default, OS_LOG_TYPE_DEFAULT, "Successfully created a gcore for %{public}@ [%d] at %@", buf, 0x1Cu);

        }
        objc_msgSend(v24, "setGcoreCapture:", 1);
        objc_msgSend(v24, "setGcoreFilePath:", v30);
        objc_msgSend(v24, "_generateMemgraphWithContentLevel:timeoutSecs:memgraphFailedReasonOut:", v17, v6, &v99);
LABEL_53:
        v32 = v96;
        v42 = objc_retainAutorelease(v30);
        unlink((const char *)objc_msgSend(v42, "UTF8String"));
        if (os_log_type_enabled((os_log_t)&_os_log_default, OS_LOG_TYPE_DEFAULT))
        {
          *(_DWORD *)buf = 138412290;
          *(_QWORD *)&buf[4] = v42;
          _os_log_impl((void *)&_mh_execute_header, (os_log_t)&_os_log_default, OS_LOG_TYPE_DEFAULT, "Deleted gcore at %@", buf, 0xCu);
        }
LABEL_57:

        goto LABEL_58;
      }
    }
    else
    {
      if (os_log_type_enabled((os_log_t)&_os_log_default, OS_LOG_TYPE_DEFAULT))
      {
        *(_WORD *)buf = 0;
        _os_log_impl((void *)&_mh_execute_header, (os_log_t)&_os_log_default, OS_LOG_TYPE_DEFAULT, "GCoreFramework is not available, will not collect gcore", buf, 2u);
      }
      objc_msgSend(v24, "releaseAnalyzedTask");
    }
    if (os_log_type_enabled((os_log_t)&_os_log_default, OS_LOG_TYPE_DEFAULT))
    {
      v40 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v24, "execName"));
      v41 = objc_msgSend(v24, "pid");
      *(_DWORD *)buf = 138543618;
      *(_QWORD *)&buf[4] = v40;
      *(_WORD *)&buf[12] = 1024;
      *(_DWORD *)&buf[14] = v41;
      _os_log_impl((void *)&_mh_execute_header, (os_log_t)&_os_log_default, OS_LOG_TYPE_DEFAULT, "Cannot create a gcore for %{public}@ [%d] ", buf, 0x12u);

    }
    v99 = 4;
    goto LABEL_53;
  }
  if (v4)
    objc_msgSend(v96, "_generateMemgraphWithContentLevel:timeoutSecs:memgraphFailedReasonOut:", v17, v6, &v99);
  objc_msgSend(v96, "releaseAnalyzedTask");
  v31 = 0;
  v32 = v96;
LABEL_58:
  if (os_log_type_enabled((os_log_t)&_os_log_default, OS_LOG_TYPE_DEFAULT))
  {
    v43 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v32, "execName"));
    v44 = objc_msgSend(v32, "pid");
    *(_DWORD *)buf = 138543618;
    *(_QWORD *)&buf[4] = v43;
    *(_WORD *)&buf[12] = 1024;
    *(_DWORD *)&buf[14] = v44;
    _os_log_impl((void *)&_mh_execute_header, (os_log_t)&_os_log_default, OS_LOG_TYPE_DEFAULT, "Saving log file for %{public}@ [%d]", buf, 0x12u);

  }
  os_unfair_lock_lock(v2 + 8);
  v97 = v31;
  v45 = sub_100008870(v32, v3 != 0, v4 != 0, &v97);
  v46 = objc_claimAutoreleasedReturnValue(v45);
  v47 = v97;

  os_unfair_lock_unlock(v2 + 8);
  v48 = os_log_type_enabled((os_log_t)&_os_log_default, OS_LOG_TYPE_DEFAULT);
  v95 = (void *)v46;
  v91 = v47;
  if (v46)
  {
    if (v48)
    {
      v49 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v32, "execName"));
      v50 = objc_msgSend(v32, "pid");
      *(_DWORD *)buf = 138543874;
      *(_QWORD *)&buf[4] = v49;
      *(_WORD *)&buf[12] = 1024;
      *(_DWORD *)&buf[14] = v50;
      *(_WORD *)&buf[18] = 2114;
      *(_QWORD *)&buf[20] = v95;
      _os_log_impl((void *)&_mh_execute_header, (os_log_t)&_os_log_default, OS_LOG_TYPE_DEFAULT, "Memory Resource Exception log for %{public}@ [%d] saved at %{public}@", buf, 0x1Cu);

    }
    v51 = sub_10000A83C();
    if (v4 && v51)
    {
      v52 = v32;
      v53 = v95;
      v54 = objc_alloc_init((Class)SDRDiagnosticReporter);
      v55 = MREExceptionTypeToString(objc_msgSend(v52, "exceptionType"));
      v56 = (void *)objc_claimAutoreleasedReturnValue(v55);
      if (objc_msgSend(v52, "isMSLEnabled"))
        v57 = CFSTR("MallocStackLogging Enabled");
      else
        v57 = &stru_100010E00;
      v58 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v52, "execName"));
      v59 = objc_msgSend(objc_alloc((Class)NSString), "initWithFormat:", CFSTR("%llu"), objc_msgSend(v52, "limitValue"));
      v60 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v54, "signatureWithDomain:type:subType:subtypeContext:detectedProcess:triggerThresholdValues:", CFSTR("Performance"), CFSTR("MemoryResourceException"), v56, v57, v58, v59));

      if (os_log_type_enabled((os_log_t)&_os_log_default, OS_LOG_TYPE_DEBUG))
      {
        *(_DWORD *)buf = 138412290;
        *(_QWORD *)&buf[4] = v60;
        _os_log_debug_impl((void *)&_mh_execute_header, (os_log_t)&_os_log_default, OS_LOG_TYPE_DEBUG, "Symptoms Diagnostic Reporter signature created: %@", buf, 0xCu);
      }
      v61 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v52, "memoryGraph"));

      if (v61)
      {
        v104 = v53;
        v105 = kSymptomDiagnosticKeyPayloadPath;
        v62 = (void *)objc_claimAutoreleasedReturnValue(+[NSArray arrayWithObjects:count:](NSArray, "arrayWithObjects:count:", &v104, 1));
        v106 = v62;
        v63 = (void *)objc_claimAutoreleasedReturnValue(+[NSDictionary dictionaryWithObjects:forKeys:count:](NSDictionary, "dictionaryWithObjects:forKeys:count:", &v106, &v105, 1));

      }
      else
      {
        v63 = 0;
      }
      v32 = v96;
      v66 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v52, "cachedMetaDataDict"));

      if (!v66)
        v67 = objc_msgSend(v52, "createMetaDataDict");
      v68 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v52, "cachedMetaDataDict"));

      if (v68)
      {
        v69 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v52, "cachedMetaDataDict"));
        v103 = v69;
        v68 = (void *)objc_claimAutoreleasedReturnValue(+[NSArray arrayWithObjects:count:](NSArray, "arrayWithObjects:count:", &v103, 1));

      }
      v101[0] = kSymptomDiagnosticActionLogArchive;
      v101[1] = kSymptomDiagnosticActionGetNetworkInfo;
      *(_QWORD *)buf = &__kCFBooleanFalse;
      *(_QWORD *)&buf[8] = &__kCFBooleanFalse;
      v101[2] = kSymptomDiagnosticActionCrashAndSpinLogs;
      v101[3] = kSymptomDiagnosticActionDiagnosticExtensions;
      *(_QWORD *)&buf[16] = &__kCFBooleanFalse;
      *(_QWORD *)&buf[24] = &__kCFBooleanFalse;
      v70 = (void *)objc_claimAutoreleasedReturnValue(+[NSDictionary dictionaryWithObjects:forKeys:count:](NSDictionary, "dictionaryWithObjects:forKeys:count:", buf, v101, 4));
      objc_msgSend(v54, "snapshotWithSignature:duration:events:payload:actions:reply:", v60, v68, v63, v70, &stru_100010700, 0.0);

    }
  }
  else
  {
    if (v48)
    {
      v64 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v32, "execName"));
      v65 = objc_msgSend(v32, "pid");
      *(_DWORD *)buf = 138543874;
      *(_QWORD *)&buf[4] = v64;
      *(_WORD *)&buf[12] = 1024;
      *(_DWORD *)&buf[14] = v65;
      *(_WORD *)&buf[18] = 2112;
      *(_QWORD *)&buf[20] = v47;
      _os_log_impl((void *)&_mh_execute_header, (os_log_t)&_os_log_default, OS_LOG_TYPE_DEFAULT, "Memory Resource Exception log for %{public}@ [%d] could not be saved due to error: %@", buf, 0x1Cu);

    }
    sub_10000A83C();
  }
  v89 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v32, "execName"));
  v87 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v32, "bundleID"));
  v90 = objc_msgSend(v32, "exceptionType");
  v88 = objc_msgSend(v32, "ledgerPhysFootprint");
  v71 = objc_msgSend(v32, "ledgerPhysFootprintPeak");
  v72 = objc_msgSend(v32, "limitValue");
  if (v4)
    v73 = 0;
  else
    v73 = v92;
  v74 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v32, "memoryGraph"));
  v75 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v32, "memoryGraph"));
  v76 = 0;
  if (!v75)
  {
    if (v99 > 6)
      v76 = 3;
    else
      v76 = qword_10000D860[v99];
    v32 = v96;
  }
  v77 = v4 != 0;
  v78 = objc_msgSend(v32, "isMSLEnabled");
  BYTE1(v86) = objc_msgSend(v32, "gcoreCapture");
  LOBYTE(v86) = v78;
  LOBYTE(v85) = v74 != 0;
  LOBYTE(v84) = v77;
  +[RMETelemetry emitTelemetryForExecName:bundleID:exceptionType:footprint:footprintPeak:jetsamLimit:memgraphAttempted:memgraphSkippedReason:memgraphSucceeded:memgraphFailedReason:diagFilePath:isMSLEnabled:isGcoreCapture:](RMETelemetry, "emitTelemetryForExecName:bundleID:exceptionType:footprint:footprintPeak:jetsamLimit:memgraphAttempted:memgraphSkippedReason:memgraphSucceeded:memgraphFailedReason:diagFilePath:isMSLEnabled:isGcoreCapture:", v89, v87, v90, v88, v71, v72, v84, v73, v85, v76, v95, v86);

  free((void *)qword_1000146D8);
  qword_1000146D8 = 0;
  qword_100014650 = (uint64_t)"Bulk analysis completed.";
  if (v94)
    v94[2](v94, v91);

  ++qword_1000146C8;
}

void sub_1000081A8(uint64_t a1)
{
  id WeakRetained;
  id v3;
  os_unfair_lock_s *v4;
  int v5;
  int v6;
  uint64_t v7;
  void *v8;
  void (**v9)(id, void *);
  os_unfair_lock_s *v10;
  id v11;
  void *v12;
  void (**v13)(id, void *);
  void *v14;
  void *v15;
  id v16;
  id v17;
  void *v18;
  _BOOL4 v19;
  void *v20;
  unsigned int v21;
  void *v22;
  unsigned int v23;
  void *v24;
  void *v25;
  id v26;
  id v27;
  id v28;
  id v29;
  unsigned __int8 v30;
  uint64_t v31;
  uint64_t v32;
  uint64_t v33;
  uint64_t v34;
  id v35;
  id v36;
  uint8_t buf[4];
  void *v38;
  __int16 v39;
  unsigned int v40;
  __int16 v41;
  uint64_t v42;

  if ((unint64_t)qword_1000146C8 < *(_QWORD *)(a1 + 56))
  {
    WeakRetained = objc_loadWeakRetained((id *)(a1 + 40));
    v3 = objc_loadWeakRetained((id *)(a1 + 48));
    v4 = *(os_unfair_lock_s **)(*(_QWORD *)(a1 + 32) + 8);
    v5 = *(unsigned __int8 *)(a1 + 80);
    v6 = *(unsigned __int8 *)(a1 + 81);
    v8 = *(void **)(a1 + 64);
    v7 = *(_QWORD *)(a1 + 72);
    v35 = WeakRetained;
    v9 = (void (**)(id, void *))v3;
    if (v35)
    {
      v10 = v4 + 8;
      os_unfair_lock_lock(v4 + 8);
      v11 = objc_msgSend(v35, "copy");
      v12 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v11, "memoryGraph"));

      if (!v12)
      {
        v13 = v9;
        v14 = (void *)objc_claimAutoreleasedReturnValue(+[NSString stringWithFormat:](NSString, "stringWithFormat:", CFSTR("memgraph analysis has timed out (timeout: %llu secs)"), v8));
        objc_msgSend(v11, "setMemgraphError:", v14);

        if (os_log_type_enabled((os_log_t)&_os_log_default, OS_LOG_TYPE_DEFAULT))
        {
          v15 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v11, "execName"));
          *(_DWORD *)buf = 138543874;
          v38 = v15;
          v39 = 1024;
          v40 = objc_msgSend(v11, "pid");
          v41 = 2048;
          v42 = (uint64_t)v8;
          _os_log_impl((void *)&_mh_execute_header, (os_log_t)&_os_log_default, OS_LOG_TYPE_DEFAULT, "Begin timeout operations for %{public}@ [%d] (timeout: %llu secs)", buf, 0x1Cu);

        }
        if (v6 | v5)
        {
          v36 = 0;
          v17 = sub_100008870(v11, v5 != 0, v6 != 0, &v36);
          v34 = objc_claimAutoreleasedReturnValue(v17);
          v16 = v36;
        }
        else
        {
          v34 = 0;
          v16 = 0;
        }
        if (v13)
        {
          v18 = (void *)objc_claimAutoreleasedReturnValue(+[NSError errorWithDomain:code:userInfo:](NSError, "errorWithDomain:code:userInfo:", MREErrorDomain[0], 8, 0));
          v13[2](v13, v18);

        }
        v19 = os_log_type_enabled((os_log_t)&_os_log_default, OS_LOG_TYPE_ERROR);
        if (v34)
        {
          if (v19)
          {
            v22 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v11, "execName"));
            v23 = objc_msgSend(v11, "pid");
            *(_DWORD *)buf = 138543874;
            v38 = v22;
            v39 = 1024;
            v40 = v23;
            v41 = 2114;
            v42 = v34;
            _os_log_error_impl((void *)&_mh_execute_header, (os_log_t)&_os_log_default, OS_LOG_TYPE_ERROR, "Analysis of %{public}@ [%d] timed out. Saved out lite_diag: %{public}@. Self-destructing.", buf, 0x1Cu);

          }
        }
        else if (v19)
        {
          v20 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v11, "execName"));
          v21 = objc_msgSend(v11, "pid");
          *(_DWORD *)buf = 138543874;
          v38 = v20;
          v39 = 1024;
          v40 = v21;
          v41 = 2112;
          v42 = (uint64_t)v16;
          _os_log_error_impl((void *)&_mh_execute_header, (os_log_t)&_os_log_default, OS_LOG_TYPE_ERROR, "Analysis of %{public}@ [%d] timed out. Failed to save out lite_diag due to error: %@", buf, 0x1Cu);

        }
        v24 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v11, "execName"));
        v25 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v11, "bundleID"));
        v26 = objc_msgSend(v11, "exceptionType");
        v27 = objc_msgSend(v11, "ledgerPhysFootprint");
        v28 = objc_msgSend(v11, "ledgerPhysFootprintPeak");
        v29 = objc_msgSend(v11, "limitValue");
        v30 = objc_msgSend(v11, "isMSLEnabled");
        BYTE1(v33) = objc_msgSend(v35, "gcoreCapture");
        LOBYTE(v33) = v30;
        LOBYTE(v32) = 0;
        LOBYTE(v31) = v7 == 0;
        +[RMETelemetry emitTelemetryForExecName:bundleID:exceptionType:footprint:footprintPeak:jetsamLimit:memgraphAttempted:memgraphSkippedReason:memgraphSucceeded:memgraphFailedReason:diagFilePath:isMSLEnabled:isGcoreCapture:](RMETelemetry, "emitTelemetryForExecName:bundleID:exceptionType:footprint:footprintPeak:jetsamLimit:memgraphAttempted:memgraphSkippedReason:memgraphSucceeded:memgraphFailedReason:diagFilePath:isMSLEnabled:isGcoreCapture:", v24, v25, v26, v27, v28, v29, v31, v7, v32, 2, v34, v33);

        _exit(-1);
      }
      os_unfair_lock_unlock(v10);

    }
  }
}

void sub_1000085F4(id a1)
{
  size_t v1;

  v1 = 4;
  if (sysctlbyname("kern.max_task_pmem", &dword_100014694, &v1, 0, 0))
    dword_100014694 = 0;
}

void sub_100008640(void *a1)
{
  id v1;
  void *v2;
  id v3;
  id v4;
  id v5;
  id v6;
  id v7;
  id v8;
  id v9;
  id v10;
  id v11;
  id v12;
  const char *v13;
  const char *v14;
  char *v15;
  int v16;
  id v17;
  id v18;
  id v19;
  void *v20;
  id v21;
  uint8_t buf[4];
  int v23;

  v1 = a1;
  v21 = objc_alloc((Class)NSString);
  v20 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v1, "execName"));
  v2 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v1, "bundleID"));
  v19 = objc_msgSend(v1, "exceptionType");
  v18 = objc_msgSend(v1, "ledgerPhysFootprint");
  v17 = objc_msgSend(v1, "ledgerInternal");
  v3 = objc_msgSend(v1, "ledgerInternalCompressed");
  v4 = objc_msgSend(v1, "ledgerAlternateAccounting");
  v5 = objc_msgSend(v1, "ledgerAlternateAccountingCompressed");
  v6 = objc_msgSend(v1, "ledgerIOKitMapped");
  v7 = objc_msgSend(v1, "ledgerPageTable");
  v8 = objc_msgSend(v1, "ledgerWiredMem");
  v9 = objc_msgSend(v1, "ledgerPurgeableNonvolatile");
  v10 = objc_msgSend(v1, "ledgerPurgeableNonvolatileCompressed");

  v11 = objc_msgSend(v21, "initWithFormat:", CFSTR("execName=%@, bundleId=%@, excType=%ld, physFootprint=%llu, internal=%llu, internalComp=%llu, alt=%llu, altComp=%llu, iokit=%llu, pageTable=%llu, wired=%llu, purgNonvol=%llu, purgNonvolComp=%llu"), v20, v2, v19, v18, v17, v3, v4, v5, v6, v7, v8, v9, v10);
  v12 = objc_retainAutorelease(v11);
  v13 = (const char *)objc_msgSend(v12, "UTF8String");
  if (v13)
  {
    v14 = v13;
    free((void *)qword_1000146D8);
    v15 = strdup(v14);
    qword_1000146D8 = (uint64_t)v15;
    if (v15)
    {
      qword_100014650 = (uint64_t)v15;
    }
    else
    {
      v16 = *__error();
      qword_100014650 = (uint64_t)"Bulk analysis in flight. Unable to format corpse info.";
      if (os_log_type_enabled((os_log_t)&_os_log_default, OS_LOG_TYPE_ERROR))
      {
        *(_DWORD *)buf = 67109120;
        v23 = v16;
        _os_log_error_impl((void *)&_mh_execute_header, (os_log_t)&_os_log_default, OS_LOG_TYPE_ERROR, "Failed to copy string for CrashReporterInfo: %{darwin.errno}d", buf, 8u);
      }
    }
  }
  else
  {
    qword_100014650 = (uint64_t)"Bulk analysis in flight. Unable to format corpse info.";
  }

}

id sub_100008870(void *a1, char a2, int a3, _QWORD *a4)
{
  id v7;
  __CFString *v8;
  void *v9;
  id v10;
  void *v11;
  void *v12;
  id v13;
  id v14;
  char *v15;
  char *v16;
  uint64_t v17;
  uint64_t v18;
  id v19;
  void *v20;
  void *v21;
  void *v22;
  void *v23;
  id v24;
  id v25;
  _BOOL4 v26;
  void *v27;
  void *v28;
  unsigned __int8 v29;
  void *v30;
  void *v31;
  void *v32;
  void *v33;
  void *v34;
  id v35;
  void *v37;
  void *v38;
  id v39;
  id v40;
  _BYTE buf[12];
  __int16 v42;
  void *v43;
  NSErrorUserInfoKey v44;
  void *v45;
  NSErrorUserInfoKey v46;
  const __CFString *v47;
  NSErrorUserInfoKey v48;

  v7 = a1;
  if (a3)
    v8 = CFSTR(".memgraph");
  else
    v8 = CFSTR(".lite_diag");
  if ((a2 & 1) != 0 || (a3 & 1) != 0)
  {
    v11 = (void *)objc_claimAutoreleasedReturnValue(+[RMECacheEnumerator getLogContainer:](RMECacheEnumerator, "getLogContainer:", 1));
    v12 = v11;
    if (!v11)
    {
      if (!a4)
      {
        v17 = 0;
        v9 = 0;
        goto LABEL_30;
      }
      v48 = NSLocalizedDescriptionKey;
      *(_QWORD *)buf = CFSTR("Failed to get log container");
      v19 = (id)objc_claimAutoreleasedReturnValue(+[NSDictionary dictionaryWithObjects:forKeys:count:](NSDictionary, "dictionaryWithObjects:forKeys:count:", buf, &v48, 1));
      v17 = 0;
      v9 = 0;
      *a4 = (id)objc_claimAutoreleasedReturnValue(+[NSError errorWithDomain:code:userInfo:](NSError, "errorWithDomain:code:userInfo:", CFSTR("ReportMemoryExceptionError"), 1, v19));
LABEL_29:

LABEL_30:
      v24 = objc_msgSend(objc_alloc((Class)NSFileHandle), "initWithFileDescriptor:", v17);
      if (v24)
      {
        v25 = objc_msgSend(v7, "_saveLogFileWithHandle:error:", v24, a4);
        objc_msgSend(v24, "closeFile");
        if (v25 != (id)2)
        {
          if (v25 == (id)1 && -[__CFString isEqualToString:](v8, "isEqualToString:", CFSTR(".memgraph")))
          {
            v26 = os_log_type_enabled((os_log_t)&_os_log_default, OS_LOG_TYPE_DEFAULT);
            if ((a2 & 1) == 0)
            {
              if (v26)
              {
                *(_DWORD *)buf = 138543362;
                *(_QWORD *)&buf[4] = v9;
                _os_log_impl((void *)&_mh_execute_header, (os_log_t)&_os_log_default, OS_LOG_TYPE_DEFAULT, "Attempted to save out memgraph, but no memgraph data could be written to file. Now attempting to delete invalid memgraph, since we don't have quota remaining for lite diags: %{public}@", buf, 0xCu);
              }
              if (sub_100008FDC(v9))
                v37 = 0;
              else
                v37 = v9;
              v35 = v37;
              goto LABEL_51;
            }
            if (v26)
            {
              *(_DWORD *)buf = 138543362;
              *(_QWORD *)&buf[4] = v9;
              _os_log_impl((void *)&_mh_execute_header, (os_log_t)&_os_log_default, OS_LOG_TYPE_DEFAULT, "Attempted to save out memgraph, but no memgraph data could be written to file. Changing to lite diag: %{public}@", buf, 0xCu);
            }
            v27 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v9, "stringByReplacingOccurrencesOfString:withString:", CFSTR(".memgraph"), CFSTR(".lite_diag")));
            v28 = (void *)objc_claimAutoreleasedReturnValue(+[NSFileManager defaultManager](NSFileManager, "defaultManager"));
            v29 = objc_msgSend(v28, "moveItemAtPath:toPath:error:", v9, v27, 0);

            if ((v29 & 1) == 0)
            {
              if (os_log_type_enabled((os_log_t)&_os_log_default, OS_LOG_TYPE_ERROR))
              {
                *(_DWORD *)buf = 138543362;
                *(_QWORD *)&buf[4] = v9;
                _os_log_error_impl((void *)&_mh_execute_header, (os_log_t)&_os_log_default, OS_LOG_TYPE_ERROR, "Could not rename invalid memgraph to lite_diag. Attempting to delete: %{public}@", buf, 0xCu);
              }
              if (sub_100008FDC(v9))
                v38 = 0;
              else
                v38 = v9;
              v10 = v38;

              goto LABEL_52;
            }
            if (os_log_type_enabled((os_log_t)&_os_log_default, OS_LOG_TYPE_DEFAULT))
            {
              *(_DWORD *)buf = 138543618;
              *(_QWORD *)&buf[4] = v9;
              v42 = 2114;
              v43 = v27;
              _os_log_impl((void *)&_mh_execute_header, (os_log_t)&_os_log_default, OS_LOG_TYPE_DEFAULT, "Successfully renamed invalid memgraph to lite_diag. %{public}@ -> %{public}@", buf, 0x16u);
            }

          }
          else
          {
            v27 = v9;
          }
          v32 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v7, "liteDiagFilePath"));

          if (v32 && a3)
          {
            if (os_log_type_enabled((os_log_t)&_os_log_default, OS_LOG_TYPE_DEFAULT))
            {
              v33 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v7, "liteDiagFilePath"));
              *(_DWORD *)buf = 138543362;
              *(_QWORD *)&buf[4] = v33;
              _os_log_impl((void *)&_mh_execute_header, (os_log_t)&_os_log_default, OS_LOG_TYPE_DEFAULT, "Deleting initial lite diagnostic so we don't have 2 diagnostics on-device: %{public}@", buf, 0xCu);

            }
            v34 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v7, "liteDiagFilePath"));
            sub_100008FDC(v34);

            objc_msgSend(v7, "setLiteDiagFilePath:", 0);
          }
          v35 = v27;
          v9 = v35;
LABEL_51:
          v10 = v35;
          goto LABEL_52;
        }
      }
      else
      {
        close(v17);
        if (a4)
        {
          v30 = (void *)objc_claimAutoreleasedReturnValue(+[NSString stringWithFormat:](NSString, "stringWithFormat:", CFSTR("Failed to create file handle from fd: %d"), v17));
          v44 = NSLocalizedDescriptionKey;
          v45 = v30;
          v31 = (void *)objc_claimAutoreleasedReturnValue(+[NSDictionary dictionaryWithObjects:forKeys:count:](NSDictionary, "dictionaryWithObjects:forKeys:count:", &v45, &v44, 1));
          *a4 = (id)objc_claimAutoreleasedReturnValue(+[NSError errorWithDomain:code:userInfo:](NSError, "errorWithDomain:code:userInfo:", CFSTR("ReportMemoryExceptionError"), 1, v31));

        }
      }
      v10 = 0;
LABEL_52:

      goto LABEL_53;
    }
    v13 = sub_100009138(v11, a4, v8, v7);
    v14 = objc_retainAutorelease((id)objc_claimAutoreleasedReturnValue(v13));
    v15 = strdup((const char *)objc_msgSend(v14, "UTF8String"));
    if (v15)
    {
      v16 = v15;
      v39 = v14;
      v40 = v7;
      v17 = mkstemps(v15, (int)-[__CFString length](v8, "length"));
      v18 = *__error();
      v19 = objc_msgSend(objc_alloc((Class)NSString), "initWithUTF8String:", v16);
      free(v16);
      if ((_DWORD)v17 == -1)
      {
        if (a4)
        {
          v21 = (void *)objc_claimAutoreleasedReturnValue(+[NSString stringWithFormat:](NSString, "stringWithFormat:", CFSTR("Failed to create file (errno: %d)"), v18));
          v48 = NSLocalizedDescriptionKey;
          *(_QWORD *)buf = v21;
          v22 = (void *)objc_claimAutoreleasedReturnValue(+[NSDictionary dictionaryWithObjects:forKeys:count:](NSDictionary, "dictionaryWithObjects:forKeys:count:", buf, &v48, 1));
          *a4 = (id)objc_claimAutoreleasedReturnValue(+[NSError errorWithDomain:code:userInfo:](NSError, "errorWithDomain:code:userInfo:", CFSTR("ReportMemoryExceptionError"), 1, v22));

        }
        v17 = 0;
        v9 = 0;
        goto LABEL_22;
      }
      if ((sub_100009E94(v19, v17, (uint64_t)a4) & 1) != 0)
      {
        v19 = v19;
        v9 = v19;
LABEL_22:
        v14 = v39;
        v7 = v40;
LABEL_28:

        goto LABEL_29;
      }
      close(v17);
      v14 = v39;
      if (a4)
      {
        v48 = NSLocalizedDescriptionKey;
        *(_QWORD *)buf = CFSTR("Failed to set proper permissions");
        v23 = (void *)objc_claimAutoreleasedReturnValue(+[NSDictionary dictionaryWithObjects:forKeys:count:](NSDictionary, "dictionaryWithObjects:forKeys:count:", buf, &v48, 1));
        *a4 = (id)objc_claimAutoreleasedReturnValue(+[NSError errorWithDomain:code:userInfo:](NSError, "errorWithDomain:code:userInfo:", CFSTR("ReportMemoryExceptionError"), 1, v23));

      }
      v17 = 0;
    }
    else
    {
      if (a4)
      {
        v48 = NSLocalizedDescriptionKey;
        *(_QWORD *)buf = CFSTR("Failed to create file name C string");
        v20 = (void *)objc_claimAutoreleasedReturnValue(+[NSDictionary dictionaryWithObjects:forKeys:count:](NSDictionary, "dictionaryWithObjects:forKeys:count:", buf, &v48, 1));
        *a4 = (id)objc_claimAutoreleasedReturnValue(+[NSError errorWithDomain:code:userInfo:](NSError, "errorWithDomain:code:userInfo:", CFSTR("ReportMemoryExceptionError"), 1, v20));

      }
      v17 = 0;
      v19 = 0;
    }
    v9 = 0;
    goto LABEL_28;
  }
  if (a4)
  {
    v46 = NSLocalizedDescriptionKey;
    v47 = CFSTR("Quotas for both lite and full diags unavailable");
    v9 = (void *)objc_claimAutoreleasedReturnValue(+[NSDictionary dictionaryWithObjects:forKeys:count:](NSDictionary, "dictionaryWithObjects:forKeys:count:", &v47, &v46, 1));
    v10 = 0;
    *a4 = (id)objc_claimAutoreleasedReturnValue(+[NSError errorWithDomain:code:userInfo:](NSError, "errorWithDomain:code:userInfo:", CFSTR("ReportMemoryExceptionError"), 1, v9));
LABEL_53:

    goto LABEL_54;
  }
  v10 = 0;
LABEL_54:

  return v10;
}

id sub_100008FDC(void *a1)
{
  id v1;
  void *v2;
  id v3;
  id v4;
  void *v6;
  id v7;
  uint8_t buf[4];
  id v9;
  __int16 v10;
  void *v11;

  v1 = a1;
  v2 = (void *)objc_claimAutoreleasedReturnValue(+[NSFileManager defaultManager](NSFileManager, "defaultManager"));
  v7 = 0;
  v3 = objc_msgSend(v2, "removeItemAtPath:error:", v1, &v7);
  v4 = v7;

  if ((v3 & 1) != 0)
  {
    if (os_log_type_enabled((os_log_t)&_os_log_default, OS_LOG_TYPE_DEFAULT))
    {
      *(_DWORD *)buf = 138543362;
      v9 = v1;
      _os_log_impl((void *)&_mh_execute_header, (os_log_t)&_os_log_default, OS_LOG_TYPE_DEFAULT, "Successfully deleted %{public}@", buf, 0xCu);
    }
  }
  else if (os_log_type_enabled((os_log_t)&_os_log_default, OS_LOG_TYPE_ERROR))
  {
    v6 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v4, "localizedDescription"));
    *(_DWORD *)buf = 138543618;
    v9 = v1;
    v10 = 2112;
    v11 = v6;
    _os_log_error_impl((void *)&_mh_execute_header, (os_log_t)&_os_log_default, OS_LOG_TYPE_ERROR, "Failed to delete %{public}@ due to error %@", buf, 0x16u);

  }
  return v3;
}

id sub_100009138(void *a1, _QWORD *a2, void *a3, void *a4)
{
  id v6;
  id v7;
  void *v8;
  __CFString *v9;
  void *v10;
  void *v11;
  uint64_t v12;
  void *v13;
  unsigned int v14;
  __CFString *v15;
  __CFString *v16;
  unsigned int v17;
  __CFString *v18;
  __CFString *v19;
  id v20;
  __CFString *v21;
  id v22;
  id v23;
  void *v24;
  void *v25;
  id v28;
  NSErrorUserInfoKey v29;
  const __CFString *v30;

  v6 = a1;
  v28 = a3;
  v7 = a4;
  v8 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v7, "execName"));

  if (v8)
    v9 = (__CFString *)objc_claimAutoreleasedReturnValue(objc_msgSend(v7, "execName"));
  else
    v9 = CFSTR("UNKNOWN_PROCESS");
  v10 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v7, "currentTime"));
  if (v10 || (v10 = (void *)objc_claimAutoreleasedReturnValue(+[NSDate date](NSDate, "date"))) != 0)
  {
    if (qword_1000146E8 != -1)
      dispatch_once(&qword_1000146E8, &stru_100010680);
    v11 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend((id)qword_1000146E0, "components:fromDate:", 252, v10));
  }
  else
  {
    v11 = 0;
  }
  v12 = MREExceptionTypeToString(objc_msgSend(v7, "exceptionType"));
  v13 = (void *)objc_claimAutoreleasedReturnValue(v12);
  v14 = objc_msgSend(v7, "isMSLEnabled");
  v15 = off_100014638[0];
  if (!v14)
    v15 = &stru_100010E00;
  v16 = v15;
  v17 = objc_msgSend(v7, "gcoreCapture");
  v18 = off_100014640;
  if (!v17)
    v18 = &stru_100010E00;
  v19 = v18;
  v20 = objc_alloc((Class)NSString);
  if (v11)
  {
    v21 = v16;
    v22 = objc_msgSend(v20, "initWithFormat:", CFSTR("%@/%@%@%@_%@_%04ld-%02ld-%02ld_%02ld%02ld%02ld.XXXXXX%@"), v6, v13, v19, v16, v9, objc_msgSend(v11, "year"), objc_msgSend(v11, "month"), objc_msgSend(v11, "day"), objc_msgSend(v11, "hour"), objc_msgSend(v11, "minute"), objc_msgSend(v11, "second"), v28);
    if (v22)
    {
LABEL_15:
      v23 = v22;
      v24 = v7;
      goto LABEL_19;
    }
  }
  else
  {
    v22 = objc_msgSend(v20, "initWithFormat:", CFSTR("%@/%@%@%@_%@.XXXXXX%@"), v6, v13, v19, v16, v9, v28);
    v21 = v16;
    if (v22)
      goto LABEL_15;
  }
  v24 = v7;
  if (a2)
  {
    v29 = NSLocalizedDescriptionKey;
    v30 = CFSTR("Failed to create file name NSString");
    v25 = (void *)objc_claimAutoreleasedReturnValue(+[NSDictionary dictionaryWithObjects:forKeys:count:](NSDictionary, "dictionaryWithObjects:forKeys:count:", &v30, &v29, 1));
    *a2 = (id)objc_claimAutoreleasedReturnValue(+[NSError errorWithDomain:code:userInfo:](NSError, "errorWithDomain:code:userInfo:", CFSTR("ReportMemoryExceptionError"), 1, v25));

  }
LABEL_19:

  return v22;
}

void sub_100009468(id a1)
{
  id v1;
  void *v2;

  v1 = objc_msgSend(objc_alloc((Class)NSCalendar), "initWithCalendarIdentifier:", NSCalendarIdentifierGregorian);
  v2 = (void *)qword_1000146E0;
  qword_1000146E0 = (uint64_t)v1;

}

uint64_t sub_1000094A0()
{
  uint64_t v0;
  _QWORD v2[5];
  uint64_t v3;
  uint64_t *v4;
  uint64_t v5;
  uint64_t v6;

  v3 = 0;
  v4 = &v3;
  v5 = 0x2020000000;
  v0 = qword_1000146F8;
  v6 = qword_1000146F8;
  if (!qword_1000146F8)
  {
    v2[0] = _NSConcreteStackBlock;
    v2[1] = 3221225472;
    v2[2] = sub_100009550;
    v2[3] = &unk_1000106C0;
    v2[4] = &v3;
    sub_100009550((uint64_t)v2);
    v0 = v4[3];
  }
  _Block_object_dispose(&v3, 8);
  return v0;
}

void sub_100009538(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, ...)
{
  va_list va;

  va_start(va, a7);
  _Block_object_dispose(va, 8);
  _Unwind_Resume(a1);
}

void *sub_100009550(uint64_t a1)
{
  void *v2;
  char *v3;
  void *result;
  char *v5;
  __int128 v6;
  uint64_t v7;

  v5 = 0;
  if (!qword_1000146F0)
  {
    v6 = off_1000106A0;
    v7 = 0;
    qword_1000146F0 = _sl_dlopen(&v6, &v5);
    v3 = v5;
    v2 = (void *)qword_1000146F0;
    if (qword_1000146F0)
    {
      if (!v5)
        goto LABEL_5;
    }
    else
    {
      v3 = (char *)abort_report_np("%s", v5);
    }
    free(v3);
    goto LABEL_5;
  }
  v2 = (void *)qword_1000146F0;
LABEL_5:
  result = dlsym(v2, "create_gcore_with_options");
  *(_QWORD *)(*(_QWORD *)(*(_QWORD *)(a1 + 32) + 8) + 24) = result;
  qword_1000146F8 = *(_QWORD *)(*(_QWORD *)(*(_QWORD *)(a1 + 32) + 8) + 24);
  return result;
}

void sub_100009640(id a1, NSDictionary *a2)
{
  NSDictionary *v2;
  void *v3;
  unsigned int v4;
  void *v5;
  const char *v6;
  int v7;
  void *v8;

  v2 = a2;
  v3 = (void *)objc_claimAutoreleasedReturnValue(-[NSDictionary objectForKeyedSubscript:](v2, "objectForKeyedSubscript:", kSymptomDiagnosticReplySuccess));
  v4 = objc_msgSend(v3, "BOOLValue");

  if (v4)
  {
    v5 = (void *)objc_claimAutoreleasedReturnValue(-[NSDictionary objectForKeyedSubscript:](v2, "objectForKeyedSubscript:", kSymptomDiagnosticReplySessionID));
    if (!os_log_type_enabled((os_log_t)&_os_log_default, OS_LOG_TYPE_DEFAULT))
    {
LABEL_7:

      goto LABEL_8;
    }
    v7 = 138412290;
    v8 = v5;
    v6 = "Symptoms Diagnostic Reporter accepted the memory resource exception. SessionID: %@";
LABEL_6:
    _os_log_impl((void *)&_mh_execute_header, (os_log_t)&_os_log_default, OS_LOG_TYPE_DEFAULT, v6, (uint8_t *)&v7, 0xCu);
    goto LABEL_7;
  }
  if (os_log_type_enabled((os_log_t)&_os_log_default, OS_LOG_TYPE_DEFAULT))
  {
    v5 = (void *)objc_claimAutoreleasedReturnValue(-[NSDictionary objectForKeyedSubscript:](v2, "objectForKeyedSubscript:", kSymptomDiagnosticReplyReason));
    v7 = 138412290;
    v8 = v5;
    v6 = "Symptoms Diagnostic Reporter rejected the memory resource exception with reason %@.";
    goto LABEL_6;
  }
LABEL_8:

}

void sub_100009790(id a1)
{
  dispatch_queue_t v1;
  void *v2;

  v1 = dispatch_queue_create("com.apple.ReportMemoryException.saveMemgraph", 0);
  v2 = (void *)qword_100014700;
  qword_100014700 = (uint64_t)v1;

}

void sub_1000097BC(uint64_t a1)
{
  uint64_t v2;
  id v3;
  void *v4;
  unsigned __int8 v5;
  NSObject *v6;
  _QWORD block[4];
  id v8;
  id v9;
  id v10;
  uint64_t v11;
  unsigned __int8 v12;
  uint8_t buf[4];
  const char *v14;
  __int16 v15;
  void *v16;
  __int16 v17;
  unsigned int v18;

  v2 = *(unsigned int *)(a1 + 72);
  v3 = *(id *)(a1 + 32);
  if (os_log_type_enabled((os_log_t)&_os_log_default, OS_LOG_TYPE_DEFAULT))
  {
    v4 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v3, "execName"));
    *(_DWORD *)buf = 136315650;
    v14 = "bulkAnalysisMemgraphOnly";
    v15 = 2114;
    v16 = v4;
    v17 = 1024;
    v18 = objc_msgSend(v3, "pid");
    _os_log_impl((void *)&_mh_execute_header, (os_log_t)&_os_log_default, OS_LOG_TYPE_DEFAULT, "%s: Begin analysis for %{public}@ [%d]", buf, 0x1Cu);

  }
  sub_100008640(v3);
  v5 = objc_msgSend(v3, "generateMemoryGraphWithContentLevel:memgraphFailedReasonOut:", v2, 0);
  objc_msgSend(v3, "releaseAnalyzedTask");
  free((void *)qword_1000146D8);
  qword_1000146D8 = 0;
  qword_100014650 = (uint64_t)"Bulk analysis completed.";

  ++qword_1000146C8;
  v6 = qword_100014700;
  block[0] = _NSConcreteStackBlock;
  block[1] = 3221225472;
  block[2] = sub_100009988;
  block[3] = &unk_100010748;
  v11 = *(_QWORD *)(a1 + 64);
  v8 = *(id *)(a1 + 32);
  v12 = v5;
  v9 = *(id *)(a1 + 40);
  v10 = *(id *)(a1 + 56);
  dispatch_sync(v6, block);

}

void sub_100009988(uint64_t a1)
{
  int v1;
  void *v2;
  void *v3;
  id v4;
  id v5;
  void (**v6)(id, void *);
  void *v7;
  id v8;
  void *v9;
  _BYTE v10[12];
  __int16 v11;
  void *v12;
  __int16 v13;
  unsigned int v14;

  if (!*(_BYTE *)(*(_QWORD *)(*(_QWORD *)(a1 + 56) + 8) + 24))
  {
    v1 = *(unsigned __int8 *)(a1 + 64);
    v2 = *(void **)(a1 + 40);
    v3 = *(void **)(a1 + 48);
    v4 = *(id *)(a1 + 32);
    v5 = v2;
    v6 = v3;
    if (os_log_type_enabled((os_log_t)&_os_log_default, OS_LOG_TYPE_DEFAULT))
    {
      v7 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v4, "execName"));
      *(_DWORD *)v10 = 136315650;
      *(_QWORD *)&v10[4] = "saveMemgraphOnly";
      v11 = 2114;
      v12 = v7;
      v13 = 1024;
      v14 = objc_msgSend(v4, "pid");
      _os_log_impl((void *)&_mh_execute_header, (os_log_t)&_os_log_default, OS_LOG_TYPE_DEFAULT, "%s: Saving log file for %{public}@ [%d]", v10, 0x1Cu);

    }
    sub_100008640(v4);
    if (v1)
    {
      *(_QWORD *)v10 = 0;
      objc_msgSend(v4, "_saveLogFileWithHandle:error:", v5, v10);
      v8 = *(id *)v10;
    }
    else
    {
      v8 = (id)objc_claimAutoreleasedReturnValue(+[NSError errorWithDomain:code:userInfo:](NSError, "errorWithDomain:code:userInfo:", MREErrorDomain[0], 4, 0));
    }
    v9 = v8;
    free((void *)qword_1000146D8);
    qword_1000146D8 = 0;
    qword_100014650 = (uint64_t)"Bulk analysis completed.";
    if (v6)
      v6[2](v6, v9);

  }
}

void sub_100009B38(uint64_t a1)
{
  NSObject *v2;
  uint64_t v3;
  id v4;
  void *v5;
  _QWORD v6[4];
  id v7;
  uint64_t v8;
  id v9;
  id v10[3];

  v2 = qword_100014700;
  v6[0] = _NSConcreteStackBlock;
  v6[1] = 3221225472;
  v6[2] = sub_100009C04;
  v6[3] = &unk_100010798;
  v3 = *(_QWORD *)(a1 + 40);
  v10[1] = *(id *)(a1 + 64);
  v8 = v3;
  objc_copyWeak(&v9, (id *)(a1 + 48));
  objc_copyWeak(v10, (id *)(a1 + 56));
  v4 = *(id *)(a1 + 32);
  v5 = *(void **)(a1 + 72);
  v7 = v4;
  v10[2] = v5;
  dispatch_sync(v2, v6);

  objc_destroyWeak(v10);
  objc_destroyWeak(&v9);
}

void sub_100009C04(uint64_t a1)
{
  id WeakRetained;
  id v3;
  void *v4;
  uint64_t v5;
  id v6;
  id v7;
  void (**v8)(id, void *);
  id v9;
  void *v10;
  void *v11;
  void *v12;
  void *v13;
  void *v14;
  unsigned int v15;
  uint8_t buf[4];
  const char *v17;
  __int16 v18;
  void *v19;
  __int16 v20;
  unsigned int v21;
  __int16 v22;
  uint64_t v23;

  if ((unint64_t)qword_1000146C8 < *(_QWORD *)(a1 + 64))
  {
    *(_BYTE *)(*(_QWORD *)(*(_QWORD *)(a1 + 40) + 8) + 24) = 1;
    WeakRetained = objc_loadWeakRetained((id *)(a1 + 48));
    v3 = objc_loadWeakRetained((id *)(a1 + 56));
    v4 = *(void **)(a1 + 32);
    v5 = *(_QWORD *)(a1 + 72);
    v6 = WeakRetained;
    v7 = v4;
    v8 = (void (**)(id, void *))v3;
    if (v6)
    {
      v9 = objc_msgSend(v6, "copy");
      v10 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v9, "memoryGraph"));

      if (!v10)
      {
        v11 = (void *)objc_claimAutoreleasedReturnValue(+[NSString stringWithFormat:](NSString, "stringWithFormat:", CFSTR("memgraph-only analysis has timed out (timeout: %llu secs)"), v5));
        objc_msgSend(v6, "setMemgraphError:", v11);

        if (os_log_type_enabled((os_log_t)&_os_log_default, OS_LOG_TYPE_DEFAULT))
        {
          v12 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v6, "execName"));
          *(_DWORD *)buf = 136315906;
          v17 = "bulkAnalysisMemgraphOnlyTimeout";
          v18 = 2114;
          v19 = v12;
          v20 = 1024;
          v21 = objc_msgSend(v6, "pid");
          v22 = 2048;
          v23 = v5;
          _os_log_impl((void *)&_mh_execute_header, (os_log_t)&_os_log_default, OS_LOG_TYPE_DEFAULT, "%s: Begin timeout memgraph-only operations for %{public}@ [%d] (timeout: %llu secs)", buf, 0x26u);

        }
        objc_msgSend(v7, "closeFile");
        if (v8)
        {
          v13 = (void *)objc_claimAutoreleasedReturnValue(+[NSError errorWithDomain:code:userInfo:](NSError, "errorWithDomain:code:userInfo:", MREErrorDomain[0], 8, 0));
          v8[2](v8, v13);

        }
        if (os_log_type_enabled((os_log_t)&_os_log_default, OS_LOG_TYPE_ERROR))
        {
          v14 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v9, "execName"));
          v15 = objc_msgSend(v9, "pid");
          *(_DWORD *)buf = 136315650;
          v17 = "bulkAnalysisMemgraphOnlyTimeout";
          v18 = 2114;
          v19 = v14;
          v20 = 1024;
          v21 = v15;
          _os_log_error_impl((void *)&_mh_execute_header, (os_log_t)&_os_log_default, OS_LOG_TYPE_ERROR, "%s: Memgraph-only analysis of %{public}@ [%d] timed out.", buf, 0x1Cu);

        }
      }

    }
  }
}

id sub_100009E94(void *a1, uint64_t a2, uint64_t a3)
{
  id v4;
  void *v5;
  void *v6;
  id v7;
  NSFileAttributeKey v9;
  NSFileProtectionType v10;

  v9 = NSFileProtectionKey;
  v10 = NSFileProtectionNone;
  v4 = a1;
  v5 = (void *)objc_claimAutoreleasedReturnValue(+[NSDictionary dictionaryWithObjects:forKeys:count:](NSDictionary, "dictionaryWithObjects:forKeys:count:", &v10, &v9, 1));
  v6 = (void *)objc_claimAutoreleasedReturnValue(+[NSFileManager defaultManager](NSFileManager, "defaultManager"));
  v7 = objc_msgSend(v6, "setAttributes:ofItemAtPath:error:", v5, v4, a3);

  return v7;
}

id sub_100009F70()
{
  id v0;
  void *v1;
  void *v2;

  v0 = sub_1000056D8(0);
  v1 = (void *)objc_claimAutoreleasedReturnValue(v0);
  v2 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v1, "objectForKeyedSubscript:", off_100014620[0]));

  return v2;
}

id sub_100009FB4(void *a1)
{
  id v1;
  id v2;
  void *v3;
  id v4;

  v1 = a1;
  v2 = sub_100009F70();
  v3 = (void *)objc_claimAutoreleasedReturnValue(v2);
  v4 = objc_msgSend(v3, "containsObject:", v1);

  return v4;
}

void sub_10000A000(void *a1, void *a2)
{
  id v3;
  id v4;
  _UNKNOWN **v5;
  uint64_t v6;
  void *v7;
  uint64_t v8;
  void *v9;
  id v10;
  void *v11;
  id v12;
  id v13;
  uint64_t v14;
  void *v15;
  void *v16;
  id v17;
  uint64_t v18;
  uint64_t v19;
  void *v20;
  void *v21;
  _UNKNOWN **v22;
  void *v23;
  uint64_t v24;
  id v25;
  id v26;
  void *i;
  void *v28;
  uint64_t v29;
  void *v30;
  void *v31;
  uint64_t v32;
  id v33;
  id v34;
  uint64_t v35;
  void *j;
  uint64_t v37;
  uint64_t v38;
  void *v39;
  _UNKNOWN **v40;
  unsigned int v41;
  uint64_t v42;
  uint64_t v43;
  void *v44;
  void *v45;
  uint64_t v46;
  void *v47;
  void *v48;
  id v49;
  const char *v50;
  void *v51;
  void *v52;
  void *v53;
  uint64_t v54;
  __int128 v55;
  __int128 v56;
  __int128 v57;
  __int128 v58;
  __int128 v59;
  __int128 v60;
  __int128 v61;
  __int128 v62;
  __int128 v63;
  __int128 v64;
  __int128 v65;
  __int128 v66;
  uint8_t v67[128];
  uint8_t buf[4];
  void *v69;
  __int16 v70;
  __CFString *v71;
  _BYTE v72[128];
  _BYTE v73[128];

  v3 = a1;
  v4 = a2;
  v5 = &AnalyticsSendEventLazy_ptr;
  v6 = objc_opt_class(NSDictionary);
  if ((objc_opt_isKindOfClass(v4, v6) & 1) != 0)
  {
    v7 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v4, "objectForKeyedSubscript:", CFSTR("ExpirationDate")));
    if (!v7)
    {
LABEL_5:
      v65 = 0u;
      v66 = 0u;
      v63 = 0u;
      v64 = 0u;
      v11 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v3, "allKeys"));
      v12 = objc_msgSend(v11, "countByEnumeratingWithState:objects:count:", &v63, v73, 16);
      if (!v12)
        goto LABEL_77;
      v13 = v12;
      v14 = *(_QWORD *)v64;
      v53 = v3;
      while (1)
      {
        v15 = 0;
        do
        {
          if (*(_QWORD *)v64 != v14)
            objc_enumerationMutation(v11);
          v16 = *(void **)(*((_QWORD *)&v63 + 1) + 8 * (_QWORD)v15);
          if ((objc_msgSend(v16, "isEqualToString:", off_100014600[0], v51) & 1) != 0
            || (objc_msgSend(v16, "isEqualToString:", off_100014608[0]) & 1) != 0
            || (objc_msgSend(v16, "isEqualToString:", off_1000145F8[0]) & 1) != 0
            || (objc_msgSend(v16, "isEqualToString:", off_100014610[0]) & 1) != 0
            || (objc_msgSend(v16, "isEqualToString:", off_100014618[0]) & 1) != 0
            || (objc_msgSend(v16, "isEqualToString:", CFSTR("PerProcessLimit")) & 1) != 0
            || (objc_msgSend(v16, "isEqualToString:", CFSTR("LitePerProcessLimit")) & 1) != 0
            || (objc_msgSend(v16, "isEqualToString:", CFSTR("PerCriticalProcessLimit")) & 1) != 0
            || objc_msgSend(v16, "isEqualToString:", CFSTR("AllowAllProcessesInSysdiagnose")))
          {
            v17 = (id)objc_claimAutoreleasedReturnValue(objc_msgSend(v4, "objectForKeyedSubscript:", v16));
            if (v17)
            {
              v18 = objc_opt_class(NSNumber);
              if ((objc_opt_isKindOfClass(v17, v18) & 1) != 0
                && (unint64_t)objc_msgSend(v17, "integerValue") + 1 <= 0x2711)
              {
                objc_msgSend(v3, "setObject:forKeyedSubscript:", v17, v16);
              }
            }
          }
          else if (objc_msgSend(v16, "isEqualToString:", CFSTR("ProcessSpecificFullDiagQuotas")))
          {
            v17 = (id)objc_claimAutoreleasedReturnValue(objc_msgSend(v4, "objectForKeyedSubscript:", v16));
            if (v17)
            {
              v19 = objc_opt_class(v5[17]);
              if ((objc_opt_isKindOfClass(v17, v19) & 1) != 0)
              {
                v20 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v3, "objectForKeyedSubscript:", v16));
                v21 = v11;
                v22 = v5;
                v23 = v20;
                sub_10000AFC4(v20, v17);

                v5 = v22;
                v11 = v21;
              }
            }
          }
          else if ((objc_msgSend(v16, "isEqualToString:", CFSTR("LargeExemptedProcesses")) & 1) != 0
                 || (objc_msgSend(v16, "isEqualToString:", off_100014630[0]) & 1) != 0
                 || objc_msgSend(v16, "isEqualToString:", off_100014620[0]))
          {
            v17 = (id)objc_claimAutoreleasedReturnValue(objc_msgSend(v4, "objectForKeyedSubscript:", v16));
            if (v17)
            {
              v24 = objc_opt_class(NSArray);
              if ((objc_opt_isKindOfClass(v17, v24) & 1) != 0)
              {
                v51 = v7;
                v52 = v11;
                v61 = 0u;
                v62 = 0u;
                v59 = 0u;
                v60 = 0u;
                v17 = v17;
                v25 = objc_msgSend(v17, "countByEnumeratingWithState:objects:count:", &v59, v72, 16);
                if (v25)
                {
                  v26 = v25;
                  v54 = *(_QWORD *)v60;
                  do
                  {
                    for (i = 0; i != v26; i = (char *)i + 1)
                    {
                      if (*(_QWORD *)v60 != v54)
                        objc_enumerationMutation(v17);
                      v28 = *(void **)(*((_QWORD *)&v59 + 1) + 8 * (_QWORD)i);
                      v29 = objc_opt_class(NSString);
                      if ((objc_opt_isKindOfClass(v28, v29) & 1) != 0)
                      {
                        if (!objc_msgSend(v16, "isEqualToString:", off_100014630[0])
                          || os_variant_has_internal_diagnostics("com.apple.ReportMemoryException")
                          && (objc_msgSend(v28, "isEqualToString:", CFSTR("mediaserverd")) & 1) != 0)
                        {
                          v30 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v3, "objectForKeyedSubscript:", v16, v51));
                          objc_msgSend(v30, "addObject:", v28);

                          v3 = v53;
                          if (objc_msgSend(v16, "isEqualToString:", off_100014620[0]))
                          {
                            v31 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v53, "objectForKeyedSubscript:", CFSTR("ProcessesAllowedInSysdiagnose")));
                            objc_msgSend(v31, "addObject:", v28);

                            v3 = v53;
                          }
                        }
                        else if (os_log_type_enabled((os_log_t)&_os_log_default, OS_LOG_TYPE_DEFAULT))
                        {
                          *(_DWORD *)buf = 138412546;
                          v69 = v28;
                          v70 = 2112;
                          v71 = off_100014630[0];
                          _os_log_impl((void *)&_mh_execute_header, (os_log_t)&_os_log_default, OS_LOG_TYPE_DEFAULT, "Ignoring process \"%@\" for \"%@\" key, since it isn't know to have received privacy approval for collecting fullContent memgraphs for this OS configuration.", buf, 0x16u);
                        }
                      }
                    }
                    v26 = objc_msgSend(v17, "countByEnumeratingWithState:objects:count:", &v59, v72, 16);
                  }
                  while (v26);
                }

                goto LABEL_50;
              }
            }
          }
          else
          {
            if (!objc_msgSend(v16, "isEqualToString:", CFSTR("ProcessesAllowedInSysdiagnose")))
            {
              v52 = v11;
              v40 = v5;
              v41 = objc_msgSend(v16, "isEqualToString:", off_100014628[0]);
              v42 = objc_claimAutoreleasedReturnValue(objc_msgSend(v4, "objectForKeyedSubscript:", v16));
              v17 = (id)v42;
              if (v41)
              {
                v43 = objc_opt_class(NSNumber);
                v5 = v40;
                if ((objc_opt_isKindOfClass(v17, v43) & 1) != 0)
                  objc_msgSend(v3, "setObject:forKeyedSubscript:", v17, off_100014628[0]);
                goto LABEL_51;
              }
              if (v42)
              {
                v51 = v7;
                v44 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v3, "objectForKeyedSubscript:", v16));
                v45 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v17, "objectForKeyedSubscript:", CFSTR("PerProcessLimit")));
                if (v45 && (v46 = objc_opt_class(NSNumber), (objc_opt_isKindOfClass(v45, v46) & 1) != 0))
                {
                  if ((unint64_t)objc_msgSend(v45, "integerValue") + 1 <= 0x2711)
                  {
                    objc_msgSend(v44, "setObject:forKeyedSubscript:", v45, CFSTR("PerProcessLimit"));
                    goto LABEL_73;
                  }
                }
                else
                {
LABEL_73:
                  v47 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v44, "objectForKeyedSubscript:", CFSTR("ExecNameList")));
                  v48 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v17, "objectForKeyedSubscript:", CFSTR("ExecNameList")));
                  sub_10000AFC4(v47, v48);

                  v3 = v53;
                }

                v7 = v51;
              }
              v5 = v40;
              goto LABEL_51;
            }
            v17 = (id)objc_claimAutoreleasedReturnValue(objc_msgSend(v4, "objectForKeyedSubscript:", v16));
            if (v17)
            {
              v32 = objc_opt_class(NSArray);
              if ((objc_opt_isKindOfClass(v17, v32) & 1) != 0)
              {
                v51 = v7;
                v52 = v11;
                v57 = 0u;
                v58 = 0u;
                v55 = 0u;
                v56 = 0u;
                v17 = v17;
                v33 = objc_msgSend(v17, "countByEnumeratingWithState:objects:count:", &v55, v67, 16);
                if (v33)
                {
                  v34 = v33;
                  v35 = *(_QWORD *)v56;
                  do
                  {
                    for (j = 0; j != v34; j = (char *)j + 1)
                    {
                      if (*(_QWORD *)v56 != v35)
                        objc_enumerationMutation(v17);
                      v37 = *(_QWORD *)(*((_QWORD *)&v55 + 1) + 8 * (_QWORD)j);
                      v38 = objc_opt_class(NSString);
                      if ((objc_opt_isKindOfClass(v37, v38) & 1) != 0)
                      {
                        v39 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v53, "objectForKeyedSubscript:", CFSTR("ProcessesAllowedInSysdiagnose")));
                        objc_msgSend(v39, "addObject:", v37);

                      }
                    }
                    v34 = objc_msgSend(v17, "countByEnumeratingWithState:objects:count:", &v55, v67, 16);
                  }
                  while (v34);
                }

                v3 = v53;
LABEL_50:
                v7 = v51;
                v5 = &AnalyticsSendEventLazy_ptr;
LABEL_51:
                v11 = v52;
              }
            }
          }

          v15 = (char *)v15 + 1;
        }
        while (v15 != v13);
        v49 = objc_msgSend(v11, "countByEnumeratingWithState:objects:count:", &v63, v73, 16);
        v13 = v49;
        if (!v49)
        {
LABEL_77:

          goto LABEL_81;
        }
      }
    }
    v8 = objc_opt_class(NSDate);
    if ((objc_opt_isKindOfClass(v7, v8) & 1) != 0)
    {
      v9 = (void *)objc_claimAutoreleasedReturnValue(+[NSDate date](NSDate, "date"));
      v10 = objc_msgSend(v7, "compare:", v9);

      if (v10 != (id)-1)
        goto LABEL_5;
      if (!os_log_type_enabled((os_log_t)&_os_log_default, OS_LOG_TYPE_ERROR))
        goto LABEL_81;
      *(_WORD *)buf = 0;
      v50 = "The input preferences have expired. Skipping.";
    }
    else
    {
      if (!os_log_type_enabled((os_log_t)&_os_log_default, OS_LOG_TYPE_ERROR))
      {
LABEL_81:

        goto LABEL_82;
      }
      *(_WORD *)buf = 0;
      v50 = "The input preferences are malformed. Skipping.";
    }
    _os_log_error_impl((void *)&_mh_execute_header, (os_log_t)&_os_log_default, OS_LOG_TYPE_ERROR, v50, buf, 2u);
    goto LABEL_81;
  }
LABEL_82:

}

uint64_t sub_10000A83C()
{
  if (qword_100014718 != -1)
    dispatch_once(&qword_100014718, &stru_1000107B8);
  return byte_100014710;
}

void sub_10000A87C(id a1)
{
  char v1;

  v1 = DiagnosticLogSubmissionEnabled(a1);
  byte_100014710 = os_variant_has_internal_diagnostics("com.apple.ReportMemoryException") & v1;
}

uint64_t sub_10000A8B4()
{
  if (qword_100014720 != -1)
    dispatch_once(&qword_100014720, &stru_1000107D8);
  return byte_100014711;
}

void sub_10000A8F4(id a1)
{
  if (os_variant_has_internal_diagnostics("com.apple.ReportMemoryException"))
    byte_100014711 = 1;
}

unint64_t sub_10000A920(void *a1, uint64_t a2, void *a3, _BYTE *a4, _BYTE *a5)
{
  id v9;
  id v10;
  void *v11;
  void *v12;
  id v13;
  unint64_t v14;
  void *v15;
  void *v16;
  id v17;
  void *v18;
  void *v19;
  void *v20;
  uint64_t v21;
  void *v22;
  void *v23;
  void *v24;
  void *v25;
  void *v26;
  void *v27;
  void *v28;
  void *v29;
  unint64_t v30;
  unint64_t v31;
  int v33;
  int v34;
  id v35;
  id v36;
  int v37;
  const char *v38;
  __int16 v39;
  _QWORD v40[3];

  v9 = a1;
  v10 = a3;
  v11 = v10;
  if (v9)
  {
    if (sub_100009FB4(v10))
    {
      v12 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v9, "objectForKeyedSubscript:", CFSTR("PerCriticalProcessLimit")));
      v13 = objc_msgSend(v12, "integerValue");

      *a4 = 1;
    }
    else
    {
      v13 = 0;
    }
    if (os_log_type_enabled((os_log_t)&_os_log_default, OS_LOG_TYPE_DEBUG))
    {
      v33 = *a4;
      v37 = 136315650;
      v38 = "RMEGetMemgraphLimitForExecName";
      v39 = 1024;
      LODWORD(v40[0]) = v33;
      WORD2(v40[0]) = 2048;
      *(_QWORD *)((char *)v40 + 6) = v13;
      _os_log_debug_impl((void *)&_mh_execute_header, (os_log_t)&_os_log_default, OS_LOG_TYPE_DEBUG, "%s - isCriticalProcess: %d, dailyCriticalProcessLimit: %ld", (uint8_t *)&v37, 0x1Cu);
    }
    v15 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v9, "objectForKeyedSubscript:", CFSTR("LargeExemptedProcesses")));
    if (objc_msgSend(v15, "containsObject:", v11))
      *a5 = 1;
    if (os_log_type_enabled((os_log_t)&_os_log_default, OS_LOG_TYPE_DEBUG))
    {
      v34 = *a5;
      v37 = 136315394;
      v38 = "RMEGetMemgraphLimitForExecName";
      v39 = 1024;
      LODWORD(v40[0]) = v34;
      _os_log_debug_impl((void *)&_mh_execute_header, (os_log_t)&_os_log_default, OS_LOG_TYPE_DEBUG, "%s - isLargeExemptProcess: %d", (uint8_t *)&v37, 0x12u);
    }
    v16 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v9, "objectForKeyedSubscript:", CFSTR("PerProcessLimit")));
    v17 = objc_msgSend(v16, "integerValue");

    if (os_log_type_enabled((os_log_t)&_os_log_default, OS_LOG_TYPE_DEBUG))
    {
      v37 = 136315394;
      v38 = "RMEGetMemgraphLimitForExecName";
      v39 = 2048;
      v40[0] = v17;
      _os_log_debug_impl((void *)&_mh_execute_header, (os_log_t)&_os_log_default, OS_LOG_TYPE_DEBUG, "%s - fullDiagPerProcessLimit: %ld", (uint8_t *)&v37, 0x16u);
    }
    v18 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v9, "objectForKeyedSubscript:", CFSTR("ProcessSpecificFullDiagQuotas")));
    v19 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v18, "objectForKeyedSubscript:", v11));

    if (v19)
    {
      v20 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v18, "objectForKeyedSubscript:", v11));
      v17 = objc_msgSend(v20, "integerValue");
      if (os_log_type_enabled((os_log_t)&_os_log_default, OS_LOG_TYPE_DEBUG))
      {
        v37 = 136315394;
        v38 = "RMEGetMemgraphLimitForExecName";
        v39 = 2048;
        v40[0] = v17;
        _os_log_debug_impl((void *)&_mh_execute_header, (os_log_t)&_os_log_default, OS_LOG_TYPE_DEBUG, "%s - specificLimit: %ld", (uint8_t *)&v37, 0x16u);
      }

    }
    v21 = MREExceptionTypeToString(a2);
    v22 = (void *)objc_claimAutoreleasedReturnValue(v21);
    v23 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v9, "objectForKeyedSubscript:", v22));

    if (v23)
    {
      v24 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v23, "objectForKeyedSubscript:", CFSTR("PerProcessLimit")));
      v25 = v24;
      if (v24)
        v17 = objc_msgSend(v24, "integerValue");
      if (os_log_type_enabled((os_log_t)&_os_log_default, OS_LOG_TYPE_DEBUG))
      {
        v35 = objc_msgSend(v25, "integerValue");
        v37 = 136315394;
        v38 = "RMEGetMemgraphLimitForExecName";
        v39 = 2048;
        v40[0] = v35;
        _os_log_debug_impl((void *)&_mh_execute_header, (os_log_t)&_os_log_default, OS_LOG_TYPE_DEBUG, "%s - typeLimit: %ld", (uint8_t *)&v37, 0x16u);
      }
      v26 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v23, "objectForKeyedSubscript:", CFSTR("ExecNameList")));
      v27 = v26;
      if (v26)
      {
        v28 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v26, "objectForKeyedSubscript:", v11));
        v29 = v28;
        if (v28)
          v17 = objc_msgSend(v28, "integerValue");
        if (os_log_type_enabled((os_log_t)&_os_log_default, OS_LOG_TYPE_DEBUG))
        {
          v36 = objc_msgSend(v29, "integerValue");
          v37 = 136315394;
          v38 = "RMEGetMemgraphLimitForExecName";
          v39 = 2048;
          v40[0] = v36;
          _os_log_debug_impl((void *)&_mh_execute_header, (os_log_t)&_os_log_default, OS_LOG_TYPE_DEBUG, "%s - exceptionSpecificLimit: %ld", (uint8_t *)&v37, 0x16u);
        }

      }
    }
    v30 = 0x7FFFFFFFFFFFFFFFLL;
    if ((unint64_t)v17 >= 0x7FFFFFFFFFFFFFFFLL)
      v31 = 0x7FFFFFFFFFFFFFFFLL;
    else
      v31 = (unint64_t)v17;
    if ((unint64_t)v13 < 0x7FFFFFFFFFFFFFFFLL)
      v30 = (unint64_t)v13;
    if (v30 <= v31)
      v14 = v31;
    else
      v14 = v30;
    if (os_log_type_enabled((os_log_t)&_os_log_default, OS_LOG_TYPE_DEBUG))
    {
      v37 = 136315394;
      v38 = "RMEGetMemgraphLimitForExecName";
      v39 = 2048;
      v40[0] = v14;
      _os_log_debug_impl((void *)&_mh_execute_header, (os_log_t)&_os_log_default, OS_LOG_TYPE_DEBUG, "%s - final limit: %ld", (uint8_t *)&v37, 0x16u);
    }

  }
  else
  {
    v14 = 0;
  }

  return v14;
}

uint64_t sub_10000AE4C(uint64_t result)
{
  void *v1;
  id v2;
  int v3;
  const char *v4;
  __int16 v5;
  id v6;

  if (result)
  {
    v1 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend((id)result, "objectForKeyedSubscript:", CFSTR("LitePerProcessLimit")));
    v2 = objc_msgSend(v1, "integerValue");

    if (os_log_type_enabled((os_log_t)&_os_log_default, OS_LOG_TYPE_DEBUG))
    {
      v3 = 136315394;
      v4 = "RMEGetLiteLimitForExecName";
      v5 = 2048;
      v6 = v2;
      _os_log_debug_impl((void *)&_mh_execute_header, (os_log_t)&_os_log_default, OS_LOG_TYPE_DEBUG, "%s - liteDiagPerProcessLimit: %ld", (uint8_t *)&v3, 0x16u);
    }
    if ((unint64_t)v2 >= 0x7FFFFFFFFFFFFFFFLL)
      return 0x7FFFFFFFFFFFFFFFLL;
    else
      return (uint64_t)v2;
  }
  return result;
}

int64_t sub_10000AF2C(id a1, NSURL *a2, NSURL *a3)
{
  NSURL *v4;
  id v5;
  id v6;
  id v8;
  id v9;

  v9 = 0;
  v4 = a3;
  -[NSURL getResourceValue:forKey:error:](a2, "getResourceValue:forKey:error:", &v9, NSURLCreationDateKey, 0);
  v8 = 0;
  v5 = v9;
  -[NSURL getResourceValue:forKey:error:](v4, "getResourceValue:forKey:error:", &v8, NSURLCreationDateKey, 0);

  v6 = objc_msgSend(v8, "compare:", v5);
  return (int64_t)v6;
}

void sub_10000AFC4(void *a1, void *a2)
{
  id v3;
  uint64_t v4;
  void *v5;
  id v6;
  id v7;
  uint64_t v8;
  void *v9;
  uint64_t v10;
  uint64_t v11;
  void *v12;
  uint64_t v13;
  id v14;
  __int128 v15;
  __int128 v16;
  __int128 v17;
  __int128 v18;
  _BYTE v19[128];

  v14 = a1;
  v3 = a2;
  if (v3)
  {
    v4 = objc_opt_class(NSDictionary);
    if ((objc_opt_isKindOfClass(v3, v4) & 1) != 0)
    {
      v17 = 0u;
      v18 = 0u;
      v15 = 0u;
      v16 = 0u;
      v5 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v3, "allKeys"));
      v6 = objc_msgSend(v5, "countByEnumeratingWithState:objects:count:", &v15, v19, 16);
      if (v6)
      {
        v7 = v6;
        v8 = *(_QWORD *)v16;
        do
        {
          v9 = 0;
          do
          {
            if (*(_QWORD *)v16 != v8)
              objc_enumerationMutation(v5);
            v10 = *(_QWORD *)(*((_QWORD *)&v15 + 1) + 8 * (_QWORD)v9);
            v11 = objc_opt_class(NSString);
            if ((objc_opt_isKindOfClass(v10, v11) & 1) != 0)
            {
              v12 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v3, "objectForKeyedSubscript:", v10));
              if (v12)
              {
                v13 = objc_opt_class(NSNumber);
                if ((objc_opt_isKindOfClass(v12, v13) & 1) != 0
                  && (unint64_t)objc_msgSend(v12, "integerValue") + 1 <= 0x2711)
                {
                  objc_msgSend(v14, "setObject:forKeyedSubscript:", v12, v10);
                }
              }

            }
            v9 = (char *)v9 + 1;
          }
          while (v7 != v9);
          v7 = objc_msgSend(v5, "countByEnumeratingWithState:objects:count:", &v15, v19, 16);
        }
        while (v7);
      }

    }
  }

}

void sub_10000B178(uint64_t a1)
{
  uint8_t v2[16];

  if (os_log_type_enabled((os_log_t)&_os_log_default, OS_LOG_TYPE_DEBUG))
  {
    *(_WORD *)v2 = 0;
    _os_log_debug_impl((void *)&_mh_execute_header, (os_log_t)&_os_log_default, OS_LOG_TYPE_DEBUG, "Calling xpc_transaction_exit_clean() and scheduling force exit.", v2, 2u);
  }
  xpc_transaction_exit_clean();
  sub_10000B1F0(*(void **)(a1 + 32), 60);
}

void sub_10000B1F0(void *a1, uint64_t a2)
{
  id v3;
  dispatch_time_t v4;
  NSObject *v5;
  _QWORD v6[4];
  id v7;
  uint64_t v8;

  v3 = a1;
  v4 = dispatch_time(0, 1000000000 * a2);
  v6[0] = _NSConcreteStackBlock;
  v6[1] = 3221225472;
  v6[2] = sub_10000B6B0;
  v6[3] = &unk_1000108E0;
  v7 = v3;
  v8 = a2;
  v5 = v3;
  dispatch_after(v4, v5, v6);

}

void sub_10000B290()
{
  void *v0;
  void *v1;
  unsigned __int8 v2;
  void *v3;
  void *v4;
  id v5;
  id v6;
  uint64_t v7;
  void *i;
  uint64_t v9;
  void *v10;
  void *v11;
  id v12;
  const char *v13;
  id obj;
  id v15;
  __int128 v16;
  __int128 v17;
  __int128 v18;
  __int128 v19;
  char v20;
  uint8_t buf[4];
  uint64_t v22;
  __int16 v23;
  void *v24;
  __int16 v25;
  id v26;
  _BYTE v27[128];

  v0 = (void *)objc_claimAutoreleasedReturnValue(+[RMECacheEnumerator getGcoreSpoolWithCreateIfNecessary:](RMECacheEnumerator, "getGcoreSpoolWithCreateIfNecessary:", 0));
  if (!v0)
  {
    if (!os_log_type_enabled((os_log_t)&_os_log_default, OS_LOG_TYPE_DEBUG))
      goto LABEL_24;
    *(_WORD *)buf = 0;
    v13 = "Unable to get RME gcore spool path, the container may not exist";
LABEL_21:
    _os_log_debug_impl((void *)&_mh_execute_header, (os_log_t)&_os_log_default, OS_LOG_TYPE_DEBUG, v13, buf, 2u);
    goto LABEL_24;
  }
  v20 = 0;
  v1 = (void *)objc_claimAutoreleasedReturnValue(+[NSFileManager defaultManager](NSFileManager, "defaultManager"));
  v2 = objc_msgSend(v1, "fileExistsAtPath:isDirectory:", v0, &v20);

  if ((v2 & 1) == 0)
  {
    if (!os_log_type_enabled((os_log_t)&_os_log_default, OS_LOG_TYPE_DEBUG))
      goto LABEL_24;
    *(_WORD *)buf = 0;
    v13 = "RME gcore spool directory has not been created";
    goto LABEL_21;
  }
  if (v20)
  {
    v18 = 0u;
    v19 = 0u;
    v16 = 0u;
    v17 = 0u;
    v3 = (void *)objc_claimAutoreleasedReturnValue(+[NSFileManager defaultManager](NSFileManager, "defaultManager"));
    v4 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v3, "enumeratorAtPath:", v0));

    obj = v4;
    v5 = objc_msgSend(v4, "countByEnumeratingWithState:objects:count:", &v16, v27, 16);
    if (v5)
    {
      v6 = v5;
      v7 = *(_QWORD *)v17;
      do
      {
        for (i = 0; i != v6; i = (char *)i + 1)
        {
          if (*(_QWORD *)v17 != v7)
            objc_enumerationMutation(obj);
          v9 = *(_QWORD *)(*((_QWORD *)&v16 + 1) + 8 * (_QWORD)i);
          v10 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v0, "stringByAppendingFormat:", CFSTR("/%@"), v9));
          if (os_log_type_enabled((os_log_t)&_os_log_default, OS_LOG_TYPE_DEFAULT))
          {
            *(_DWORD *)buf = 138412290;
            v22 = v9;
            _os_log_impl((void *)&_mh_execute_header, (os_log_t)&_os_log_default, OS_LOG_TYPE_DEFAULT, "Delete remaining gcore spool files: delete %@", buf, 0xCu);
          }
          v11 = (void *)objc_claimAutoreleasedReturnValue(+[NSFileManager defaultManager](NSFileManager, "defaultManager"));
          v15 = 0;
          objc_msgSend(v11, "removeItemAtPath:error:", v10, &v15);
          v12 = v15;

          if (v12 && os_log_type_enabled((os_log_t)&_os_log_default, OS_LOG_TYPE_ERROR))
          {
            *(_DWORD *)buf = 138412802;
            v22 = v9;
            v23 = 2112;
            v24 = v10;
            v25 = 2112;
            v26 = v12;
            _os_log_error_impl((void *)&_mh_execute_header, (os_log_t)&_os_log_default, OS_LOG_TYPE_ERROR, "Error deleting gcore file %@ (path=%@): %@", buf, 0x20u);
          }

        }
        v6 = objc_msgSend(obj, "countByEnumeratingWithState:objects:count:", &v16, v27, 16);
      }
      while (v6);
    }

  }
  else if (os_log_type_enabled((os_log_t)&_os_log_default, OS_LOG_TYPE_ERROR))
  {
    *(_WORD *)buf = 0;
    _os_log_error_impl((void *)&_mh_execute_header, (os_log_t)&_os_log_default, OS_LOG_TYPE_ERROR, "Error getting the RME container gcore spool directory", buf, 2u);
  }
LABEL_24:

}

void sub_10000B5E0(uint64_t a1, void *a2)
{
  id v3;
  xpc_connection_t remote_connection;
  _xpc_connection_s *v5;
  void *v6;
  id v7;
  id v8;

  v8 = a2;
  v3 = *(id *)(a1 + 32);
  remote_connection = xpc_dictionary_get_remote_connection(v3);
  v5 = (_xpc_connection_s *)objc_claimAutoreleasedReturnValue(remote_connection);
  if (v5)
  {
    v6 = *(void **)(a1 + 40);
    if (v6)
    {
      if (v8)
      {
        v7 = objc_retainAutorelease((id)objc_claimAutoreleasedReturnValue(objc_msgSend(v8, "domain")));
        xpc_dictionary_set_string(v6, "ErrorDomain", (const char *)objc_msgSend(v7, "UTF8String"));

        xpc_dictionary_set_int64(*(xpc_object_t *)(a1 + 40), "ErrorCode", (int64_t)objc_msgSend(v8, "code"));
        v6 = *(void **)(a1 + 40);
      }
      xpc_connection_send_message(v5, v6);
    }
  }

}

void sub_10000B6B0(uint64_t a1)
{
  uint64_t v1;
  id v2;
  void *v3;
  int v4;
  uint64_t v5;

  v1 = *(_QWORD *)(a1 + 40);
  v2 = *(id *)(a1 + 32);
  if (qword_100014728 >= (unint64_t)qword_100014688)
  {
    if (os_log_type_enabled((os_log_t)&_os_log_default, OS_LOG_TYPE_ERROR))
    {
      LOWORD(v4) = 0;
      _os_log_error_impl((void *)&_mh_execute_header, (os_log_t)&_os_log_default, OS_LOG_TYPE_ERROR, "ReportMemoryException still alive after xpc_transaction_exit_clean() and has waited out timeouts for critical analysis requests. Exiting at risk of data loss.\n", (uint8_t *)&v4, 2u);
    }
    _exit(-1);
  }
  v3 = v2;
  if (os_log_type_enabled((os_log_t)&_os_log_default, OS_LOG_TYPE_DEFAULT))
  {
    v4 = 134217984;
    v5 = v1;
    _os_log_impl((void *)&_mh_execute_header, (os_log_t)&_os_log_default, OS_LOG_TYPE_DEFAULT, "ReportMemoryException potentially still has pending critical bulk analysis requests. Checking again in %lld seconds.", (uint8_t *)&v4, 0xCu);
  }
  sub_10000B1F0(v3, v1);
  qword_100014728 += v1;

}

id objc_msgSend_UTF8String(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "UTF8String");
}

id objc_msgSend__generateMemgraphWithContentLevel_timeoutSecs_memgraphFailedReasonOut_(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "_generateMemgraphWithContentLevel:timeoutSecs:memgraphFailedReasonOut:");
}

id objc_msgSend__populateAddtionalMetadataWithOptions_timeoutSecs_(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "_populateAddtionalMetadataWithOptions:timeoutSecs:");
}

id objc_msgSend__saveLogFileWithHandle_error_(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "_saveLogFileWithHandle:error:");
}

id objc_msgSend_addObject_(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "addObject:");
}

id objc_msgSend_allKeys(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "allKeys");
}

id objc_msgSend_array(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "array");
}

id objc_msgSend_arrayWithObjects_count_(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "arrayWithObjects:count:");
}

id objc_msgSend_attributesOfItemAtPath_error_(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "attributesOfItemAtPath:error:");
}

id objc_msgSend_BOOLValue(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "BOOLValue");
}

id objc_msgSend_bundleID(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "bundleID");
}

id objc_msgSend_cachedMetaDataDict(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "cachedMetaDataDict");
}

id objc_msgSend_closeFile(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "closeFile");
}

id objc_msgSend_coalitionBundleID(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "coalitionBundleID");
}

id objc_msgSend_code(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "code");
}

id objc_msgSend_compare_(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "compare:");
}

id objc_msgSend_components_fromDate_(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "components:fromDate:");
}

id objc_msgSend_containsObject_(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "containsObject:");
}

id objc_msgSend_containsString_(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "containsString:");
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

id objc_msgSend_createMetaDataDict(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "createMetaDataDict");
}

id objc_msgSend_currentTime(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "currentTime");
}

id objc_msgSend_date(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "date");
}

id objc_msgSend_dateWithTimeIntervalSinceNow_(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "dateWithTimeIntervalSinceNow:");
}

id objc_msgSend_day(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "day");
}

id objc_msgSend_defaultManager(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "defaultManager");
}

id objc_msgSend_description(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "description");
}

id objc_msgSend_dictionary(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "dictionary");
}

id objc_msgSend_dictionaryWithContentsOfFile_(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "dictionaryWithContentsOfFile:");
}

id objc_msgSend_dictionaryWithObjects_forKeys_count_(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "dictionaryWithObjects:forKeys:count:");
}

id objc_msgSend_domain(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "domain");
}

id objc_msgSend_emitTelemetryForExecName_bundleID_exceptionType_footprint_footprintPeak_jetsamLimit_memgraphAttempted_memgraphSkippedReason_memgraphSucceeded_memgraphFailedReason_diagFilePath_isMSLEnabled_isGcoreCapture_(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "emitTelemetryForExecName:bundleID:exceptionType:footprint:footprintPeak:jetsamLimit:memgraphAttempted:memgraphSkippedReason:memgraphSucceeded:memgraphFailedReason:diagFilePath:isMSLEnabled:isGcoreCapture:");
}

id objc_msgSend_enumeratorAtPath_(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "enumeratorAtPath:");
}

id objc_msgSend_errorWithDomain_code_userInfo_(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "errorWithDomain:code:userInfo:");
}

id objc_msgSend_exceptionType(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "exceptionType");
}

id objc_msgSend_execName(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "execName");
}

id objc_msgSend_extractExecNameAndBundleIDMinimal_execNameOut_bundleIDOut_(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "extractExecNameAndBundleIDMinimal:execNameOut:bundleIDOut:");
}

id objc_msgSend_fileCreationDate(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "fileCreationDate");
}

id objc_msgSend_fileExistsAtPath_(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "fileExistsAtPath:");
}

id objc_msgSend_fileExistsAtPath_isDirectory_(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "fileExistsAtPath:isDirectory:");
}

id objc_msgSend_fileSize(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "fileSize");
}

id objc_msgSend_fileSystemRepresentation(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "fileSystemRepresentation");
}

id objc_msgSend_fileType(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "fileType");
}

id objc_msgSend_gcoreCapture(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "gcoreCapture");
}

id objc_msgSend_generateMemoryGraphWithContentLevel_memgraphFailedReasonOut_(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "generateMemoryGraphWithContentLevel:memgraphFailedReasonOut:");
}

id objc_msgSend_getEPLProfilePath(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "getEPLProfilePath");
}

id objc_msgSend_getGcoreSpoolWithCreateIfNecessary_(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "getGcoreSpoolWithCreateIfNecessary:");
}

id objc_msgSend_getLogContainer_(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "getLogContainer:");
}

id objc_msgSend_getResourceValue_forKey_error_(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "getResourceValue:forKey:error:");
}

id objc_msgSend_hasPrefix_(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "hasPrefix:");
}

id objc_msgSend_hasSuffix_(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "hasSuffix:");
}

id objc_msgSend_hour(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "hour");
}

id objc_msgSend_initCacheEnumerator(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "initCacheEnumerator");
}

id objc_msgSend_initCacheEnumeratorWithVolume_(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "initCacheEnumeratorWithVolume:");
}

id objc_msgSend_initWithArray_(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "initWithArray:");
}

id objc_msgSend_initWithCalendarIdentifier_(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "initWithCalendarIdentifier:");
}

id objc_msgSend_initWithFileDescriptor_(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "initWithFileDescriptor:");
}

id objc_msgSend_initWithFileDescriptor_closeOnDealloc_(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "initWithFileDescriptor:closeOnDealloc:");
}

id objc_msgSend_initWithFormat_(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "initWithFormat:");
}

id objc_msgSend_initWithInt_(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "initWithInt:");
}

id objc_msgSend_initWithObjectsAndKeys_(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "initWithObjectsAndKeys:");
}

id objc_msgSend_initWithUTF8String_(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "initWithUTF8String:");
}

id objc_msgSend_integerValue(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "integerValue");
}

id objc_msgSend_isEqualToString_(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "isEqualToString:");
}

id objc_msgSend_isFirstParty(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "isFirstParty");
}

id objc_msgSend_isMSLEnabled(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "isMSLEnabled");
}

id objc_msgSend_keysSortedByValueUsingComparator_(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "keysSortedByValueUsingComparator:");
}

id objc_msgSend_ledgerAlternateAccounting(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "ledgerAlternateAccounting");
}

id objc_msgSend_ledgerAlternateAccountingCompressed(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "ledgerAlternateAccountingCompressed");
}

id objc_msgSend_ledgerIOKitMapped(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "ledgerIOKitMapped");
}

id objc_msgSend_ledgerInternal(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "ledgerInternal");
}

id objc_msgSend_ledgerInternalCompressed(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "ledgerInternalCompressed");
}

id objc_msgSend_ledgerNetworkNonvolatile(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "ledgerNetworkNonvolatile");
}

id objc_msgSend_ledgerNetworkNonvolatileCompressed(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "ledgerNetworkNonvolatileCompressed");
}

id objc_msgSend_ledgerPageTable(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "ledgerPageTable");
}

id objc_msgSend_ledgerPhysFootprint(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "ledgerPhysFootprint");
}

id objc_msgSend_ledgerPhysFootprintPeak(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "ledgerPhysFootprintPeak");
}

id objc_msgSend_ledgerPurgeableNonvolatile(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "ledgerPurgeableNonvolatile");
}

id objc_msgSend_ledgerPurgeableNonvolatileCompressed(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "ledgerPurgeableNonvolatileCompressed");
}

id objc_msgSend_ledgerWiredMem(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "ledgerWiredMem");
}

id objc_msgSend_length(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "length");
}

id objc_msgSend_limitValue(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "limitValue");
}

id objc_msgSend_liteDiagFilePath(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "liteDiagFilePath");
}

id objc_msgSend_localizedDescription(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "localizedDescription");
}

id objc_msgSend_memoryGraph(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "memoryGraph");
}

id objc_msgSend_minute(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "minute");
}

id objc_msgSend_month(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "month");
}

id objc_msgSend_moveItemAtPath_toPath_error_(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "moveItemAtPath:toPath:error:");
}

id objc_msgSend_mutableCopy(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "mutableCopy");
}

id objc_msgSend_nextValidURL(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "nextValidURL");
}

id objc_msgSend_null(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "null");
}

id objc_msgSend_numberWithBool_(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "numberWithBool:");
}

id objc_msgSend_numberWithInteger_(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "numberWithInteger:");
}

id objc_msgSend_numberWithUnsignedInteger_(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "numberWithUnsignedInteger:");
}

id objc_msgSend_numberWithUnsignedLongLong_(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "numberWithUnsignedLongLong:");
}

id objc_msgSend_objectForKeyedSubscript_(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "objectForKeyedSubscript:");
}

id objc_msgSend_path(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "path");
}

id objc_msgSend_pid(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "pid");
}

id objc_msgSend_rangeOfString_(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "rangeOfString:");
}

id objc_msgSend_releaseAnalyzedTask(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "releaseAnalyzedTask");
}

id objc_msgSend_removeItemAtPath_error_(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "removeItemAtPath:error:");
}

id objc_msgSend_resourceExceptionFromTask_error_(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "resourceExceptionFromTask:error:");
}

id objc_msgSend_reverseObjectEnumerator(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "reverseObjectEnumerator");
}

id objc_msgSend_second(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "second");
}

id objc_msgSend_set(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "set");
}

id objc_msgSend_setAttributes_ofItemAtPath_error_(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "setAttributes:ofItemAtPath:error:");
}

id objc_msgSend_setGcoreCapture_(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "setGcoreCapture:");
}

id objc_msgSend_setGcoreFilePath_(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "setGcoreFilePath:");
}

id objc_msgSend_setLiteDiagFilePath_(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "setLiteDiagFilePath:");
}

id objc_msgSend_setMemgraphError_(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "setMemgraphError:");
}

id objc_msgSend_setObject_forKeyedSubscript_(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "setObject:forKeyedSubscript:");
}

id objc_msgSend_signatureWithDomain_type_subType_subtypeContext_detectedProcess_triggerThresholdValues_(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "signatureWithDomain:type:subType:subtypeContext:detectedProcess:triggerThresholdValues:");
}

id objc_msgSend_snapshotWithSignature_duration_events_payload_actions_reply_(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "snapshotWithSignature:duration:events:payload:actions:reply:");
}

id objc_msgSend_sortUsingComparator_(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "sortUsingComparator:");
}

id objc_msgSend_stringByAppendingFormat_(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "stringByAppendingFormat:");
}

id objc_msgSend_stringByReplacingOccurrencesOfString_withString_(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "stringByReplacingOccurrencesOfString:withString:");
}

id objc_msgSend_stringWithFormat_(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "stringWithFormat:");
}

id objc_msgSend_stringWithUTF8String_(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "stringWithUTF8String:");
}

id objc_msgSend_subarrayWithRange_(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "subarrayWithRange:");
}

id objc_msgSend_substringWithRange_(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "substringWithRange:");
}

id objc_msgSend_task(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "task");
}

id objc_msgSend_timeIntervalSinceDate_(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "timeIntervalSinceDate:");
}

id objc_msgSend_upTime(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "upTime");
}

id objc_msgSend_year(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "year");
}
