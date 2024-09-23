@implementation PLTripProcessor

+ (id)processTripsWithItems:(id)a3 frequentLocations:(id)a4 lastHomeVisitDate:(id)a5 progressBlock:(id)a6
{
  id v9;
  id v10;
  id v11;
  id v12;
  NSObject *v13;
  os_signpost_id_t v14;
  NSObject *v15;
  NSObject *v16;
  void *v17;
  void *v18;
  id v19;
  uint64_t v20;
  uint64_t v21;
  uint64_t v22;
  uint64_t v23;
  void *v24;
  void *v25;
  void *v26;
  void *v27;
  void *v28;
  id v29;
  void *v30;
  void *v31;
  uint64_t v32;
  unint64_t v33;
  id v34;
  double v35;
  double v36;
  uint64_t v37;
  double v38;
  void (**v39)(_QWORD, _QWORD, double);
  void *v40;
  NSObject *v41;
  uint64_t v42;
  void *v43;
  void *v44;
  double latitude;
  double longitude;
  _BOOL4 v47;
  double v48;
  double v49;
  void *v50;
  void *v51;
  void *v52;
  void *v53;
  double v54;
  double v55;
  int v56;
  int v57;
  int v58;
  _BOOL4 v59;
  int v61;
  double v62;
  id v63;
  void *v64;
  uint64_t v65;
  uint64_t v66;
  uint64_t v67;
  double v68;
  uint64_t v69;
  uint64_t v70;
  void *v71;
  double v72;
  double v73;
  _BOOL4 v74;
  double v76;
  id v77;
  uint64_t v78;
  uint64_t v79;
  uint64_t v80;
  uint64_t v81;
  double v82;
  double v83;
  _BOOL4 v84;
  void *v85;
  uint64_t v86;
  uint64_t v87;
  uint64_t v88;
  uint64_t v89;
  uint64_t v90;
  uint64_t v91;
  double v92;
  double v93;
  _BOOL4 v94;
  uint64_t v96;
  double v97;
  uint64_t v98;
  void *v99;
  void *v100;
  NSObject *v101;
  uint64_t v102;
  uint32_t numer;
  uint32_t denom;
  NSObject *v105;
  NSObject *v106;
  uint64_t v107;
  uint64_t v108;
  float v109;
  void *v110;
  os_signpost_id_t spid;
  uint64_t v113;
  unint64_t v114;
  id v115;
  id v116;
  void *v117;
  NSObject *v118;
  void *v119;
  uint64_t v120;
  void *v121;
  void *v122;
  int v123;
  void *v125;
  void *v126;
  NSObject *obj;
  int v128;
  void *v129;
  int v130;
  uint64_t v131;
  uint64_t v132;
  void *v133;
  void *v134;
  __int128 v135;
  __int128 v136;
  __int128 v137;
  __int128 v138;
  uint64_t v139;
  uint64_t v140;
  __int128 v141;
  __int128 v142;
  __int128 v143;
  __int128 v144;
  __int128 v145;
  __int128 v146;
  __int128 v147;
  __int128 v148;
  __int128 v149;
  __int128 v150;
  __int128 v151;
  __int128 v152;
  mach_timebase_info info;
  _BYTE buf[22];
  __int16 v155;
  double v156;
  _BYTE v157[128];
  _BYTE v158[128];
  _BYTE v159[128];
  _BYTE v160[128];
  uint64_t v161;
  CLLocationCoordinate2D v162;
  CLLocationCoordinate2D v163;
  CLLocationCoordinate2D v164;

  v161 = *MEMORY[0x1E0C80C00];
  v9 = a3;
  v10 = a4;
  v11 = a5;
  v12 = a6;
  if (objc_msgSend(v10, "count") && objc_msgSend(v9, "count"))
  {
    v119 = v11;
    PLMomentGenerationGetLog();
    v13 = (id)objc_claimAutoreleasedReturnValue();
    v14 = os_signpost_id_generate(v13);
    info = 0;
    mach_timebase_info(&info);
    v15 = v13;
    v16 = v15;
    v114 = v14 - 1;
    if (v14 - 1 <= 0xFFFFFFFFFFFFFFFDLL && os_signpost_enabled(v15))
    {
      *(_WORD *)buf = 0;
      _os_signpost_emit_with_name_impl(&dword_199541000, v16, OS_SIGNPOST_INTERVAL_BEGIN, v14, "TripsProcessing", ", buf, 2u);
    }
    spid = v14;
    v118 = v16;

    v113 = mach_absolute_time();
    v116 = v12;
    v120 = MEMORY[0x19AEC174C](v12);
    objc_msgSend(MEMORY[0x1E0C99D68], "distantPast");
    v17 = (void *)objc_claimAutoreleasedReturnValue();
    v18 = (void *)objc_opt_new();
    v149 = 0u;
    v150 = 0u;
    v151 = 0u;
    v152 = 0u;
    v115 = v10;
    v19 = v10;
    v20 = objc_msgSend(v19, "countByEnumeratingWithState:objects:count:", &v149, v160, 16);
    if (v20)
    {
      v21 = v20;
      v22 = *(_QWORD *)v150;
      do
      {
        v23 = 0;
        v24 = v17;
        do
        {
          if (*(_QWORD *)v150 != v22)
            objc_enumerationMutation(v19);
          v25 = *(void **)(*((_QWORD *)&v149 + 1) + 8 * v23);
          objc_msgSend(v25, "sortedMoments");
          v26 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v18, "addObjectsFromArray:", v26);

          objc_msgSend(v25, "dateInterval");
          v27 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v27, "endDate");
          v28 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v24, "laterDate:", v28);
          v17 = (void *)objc_claimAutoreleasedReturnValue();

          ++v23;
          v24 = v17;
        }
        while (v21 != v23);
        v21 = objc_msgSend(v19, "countByEnumeratingWithState:objects:count:", &v149, v160, 16);
      }
      while (v21);
    }

    if (!v119 || objc_msgSend(v119, "compare:", v17) == -1)
    {
      v29 = v17;

      v119 = v29;
    }
    +[PLMediaMiningUtilities sortDescriptorsForSortingItemsByTime](PLMediaMiningUtilities, "sortDescriptorsForSortingItemsByTime");
    v30 = (void *)objc_claimAutoreleasedReturnValue();
    v117 = v9;
    objc_msgSend(v9, "sortedArrayUsingDescriptors:", v30);
    v31 = (void *)objc_claimAutoreleasedReturnValue();

    objc_msgSend(v31, "lastObject");
    v122 = (void *)objc_claimAutoreleasedReturnValue();
    v32 = objc_opt_new();
    v121 = (void *)objc_opt_new();
    v33 = objc_msgSend(v31, "count");
    v145 = 0u;
    v146 = 0u;
    v147 = 0u;
    v148 = 0u;
    obj = v31;
    v132 = -[NSObject countByEnumeratingWithState:objects:count:](obj, "countByEnumeratingWithState:objects:count:", &v145, v159, 16);
    v34 = 0;
    if (v132)
    {
      v35 = 1.0 / (double)v33;
      v131 = *(_QWORD *)v146;
      v36 = 0.0;
      *(double *)&v37 = 2500000.0;
      v38 = 172800.0;
      v39 = (void (**)(_QWORD, _QWORD, double))v120;
      v40 = (void *)v32;
      v41 = obj;
LABEL_18:
      v42 = 0;
      while (1)
      {
        if (*(_QWORD *)v146 != v131)
          objc_enumerationMutation(v41);
        v43 = *(void **)(*((_QWORD *)&v145 + 1) + 8 * v42);
        if (v39)
        {
          LOBYTE(v139) = 0;
          ((void (**)(_QWORD, uint64_t *, double))v39)[2](v39, &v139, v36);
          if ((_BYTE)v139)
          {
            v100 = v40;
            if (os_log_type_enabled(MEMORY[0x1E0C81028], OS_LOG_TYPE_INFO))
            {
              *(_DWORD *)buf = 67109120;
              *(_DWORD *)&buf[4] = 86;
              _os_log_impl(&dword_199541000, MEMORY[0x1E0C81028], OS_LOG_TYPE_INFO, "Cancelled at line %d", buf, 8u);
            }
            v99 = (void *)MEMORY[0x1E0C9AA60];
            v101 = v41;
            v10 = v115;
            goto LABEL_122;
          }
        }
        v44 = (void *)MEMORY[0x19AEC1554]();
        if ((objc_msgSend(v43, "pl_originatorState") & 8) != 0)
          goto LABEL_106;
        v134 = v44;
        objc_msgSend(v43, "pl_coordinate");
        latitude = v162.latitude;
        longitude = v162.longitude;
        v133 = v43;
        if (!CLLocationCoordinate2DIsValid(v162))
          goto LABEL_29;
        v47 = latitude != 0.0;
        if (longitude != 0.0)
          v47 = 1;
        if (v47)
        {
          v58 = objc_msgSend(v43, "pl_locationType");
          v59 = v58 == 10;
          if (latitude != 40.0 || longitude != -100.0)
          {
            v61 = v58;
            objc_msgSend(a1, "_timeIntervalBetweenItem:andItem:", v43, v34);
            v49 = v62;
            v63 = v43;

            v129 = v63;
            if (v61 == 10)
            {
              v59 = 1;
              v128 = 1;
              v43 = v133;
              goto LABEL_32;
            }
            if ((objc_msgSend(v18, "containsObject:", v63) & 1) != 0)
            {
              v57 = 0;
              v130 = 1;
              v128 = 1;
              v43 = v133;
LABEL_38:
              v41 = obj;
LABEL_76:
              v84 = (objc_msgSend(v43, "pl_originatorState") & 3) != 0 || objc_msgSend(v43, "pl_originatorState") == 0;
              v44 = v134;
              if (((v130 | ~v57) & v84 & 1) != 0 || v43 == v122)
              {
                v123 = v57;
                v137 = 0u;
                v138 = 0u;
                v135 = 0u;
                v136 = 0u;
                v126 = v40;
                objc_msgSend(v40, "reverseObjectEnumerator");
                v85 = (void *)objc_claimAutoreleasedReturnValue();
                v86 = objc_msgSend(v85, "countByEnumeratingWithState:objects:count:", &v135, v157, 16);
                if (v86)
                {
                  v87 = v86;
                  v88 = 0;
                  v89 = *(_QWORD *)v136;
                  do
                  {
                    v90 = 0;
                    v91 = v88 + v87;
                    do
                    {
                      if (*(_QWORD *)v136 != v89)
                        objc_enumerationMutation(v85);
                      objc_msgSend(*(id *)(*((_QWORD *)&v135 + 1) + 8 * v90), "pl_coordinate");
                      v92 = v164.latitude;
                      v93 = v164.longitude;
                      if (CLLocationCoordinate2DIsValid(v164))
                      {
                        v94 = v92 != 0.0;
                        if (v93 != 0.0)
                          v94 = 1;
                        if (v94 && (v92 != 40.0 || v93 != -100.0))
                        {
                          v91 = v88 + v90;
                          goto LABEL_98;
                        }
                      }
                      ++v90;
                    }
                    while (v87 != v90);
                    v87 = objc_msgSend(v85, "countByEnumeratingWithState:objects:count:", &v135, v157, 16);
                    v88 = v91;
                  }
                  while (v87);
LABEL_98:

                  v39 = (void (**)(_QWORD, _QWORD, double))v120;
                  v41 = obj;
                  v44 = v134;
                  if (v91)
                    objc_msgSend(v126, "removeObjectsInRange:", objc_msgSend(v126, "count") - v91, v91);
                }
                else
                {

                }
                v40 = v126;
                if (objc_msgSend(v126, "count"))
                {
                  objc_msgSend(v121, "addObject:", v126);
                  v96 = objc_opt_new();

                  v40 = (void *)v96;
                }

                if (((v130 | v123 | v128 ^ 1) & 1) != 0)
                {
                  v34 = 0;
                }
                else
                {
                  objc_msgSend(v40, "addObject:", v133);
                  v34 = v133;
                }
              }
              else
              {
                v34 = v129;
              }
              goto LABEL_106;
            }
            objc_msgSend(a1, "_minimumDistanceBetweenFrequentLocations:andItem:", v19, v63);
            v59 = 0;
            v57 = 0;
            v128 = 1;
            v130 = 1;
            v43 = v133;
            v41 = obj;
            if (v97 < 70000.0)
              goto LABEL_76;
LABEL_32:
            objc_msgSend(v40, "firstObject");
            v50 = v43;
            v51 = (void *)objc_claimAutoreleasedReturnValue();
            objc_msgSend(v51, "pl_startDate");
            v52 = (void *)objc_claimAutoreleasedReturnValue();
            objc_msgSend(v50, "pl_endDate");
            v53 = (void *)objc_claimAutoreleasedReturnValue();
            objc_msgSend(v52, "timeIntervalSinceDate:", v53);
            v55 = fabs(v54);

            if (v55 >= 86400.0)
            {
              v56 = v128 ^ 1;
              if (v49 > 518400.0)
                v56 = 1;
              if (((v56 | v59) & 1) != 0)
              {
                if (v49 <= 518400.0)
                  goto LABEL_37;
              }
              else
              {
                v143 = 0u;
                v144 = 0u;
                v141 = 0u;
                v142 = 0u;
                objc_msgSend(v40, "reverseObjectEnumerator");
                v64 = (void *)objc_claimAutoreleasedReturnValue();
                v65 = objc_msgSend(v64, "countByEnumeratingWithState:objects:count:", &v141, v158, 16);
                if (v65)
                {
                  v66 = v65;
                  v67 = v37;
                  v68 = v38;
                  v125 = v40;
                  v69 = *(_QWORD *)v142;
LABEL_48:
                  v70 = 0;
                  while (1)
                  {
                    if (*(_QWORD *)v142 != v69)
                      objc_enumerationMutation(v64);
                    v71 = *(void **)(*((_QWORD *)&v141 + 1) + 8 * v70);
                    objc_msgSend(v71, "pl_coordinate");
                    v72 = v163.latitude;
                    v73 = v163.longitude;
                    if (CLLocationCoordinate2DIsValid(v163))
                    {
                      v74 = v72 != 0.0;
                      if (v73 != 0.0)
                        v74 = 1;
                      if (v74 && (v72 != 40.0 || v73 != -100.0))
                        break;
                    }
                    if (v66 == ++v70)
                    {
                      v66 = objc_msgSend(v64, "countByEnumeratingWithState:objects:count:", &v141, v158, 16);
                      if (v66)
                        goto LABEL_48;
                      v76 = 1.79769313e308;
                      goto LABEL_66;
                    }
                  }
                  v77 = v71;

                  if (v77)
                  {
                    *(_QWORD *)&buf[8] = 0;
                    *(_QWORD *)buf = 0;
                    objc_msgSend(v133, "pl_coordinate");
                    *(_QWORD *)buf = v78;
                    *(_QWORD *)&buf[8] = v79;
                    v139 = 0;
                    v140 = 0;
                    objc_msgSend(v77, "pl_coordinate");
                    v139 = v80;
                    v140 = v81;
                    CLLocationCoordinate2DGetDistanceFrom();
                    v76 = v82;
                    v64 = v77;
LABEL_66:
                    v40 = v125;
                    v38 = v68;
                    v37 = v67;
                    goto LABEL_70;
                  }
                  v76 = 1.79769313e308;
                  v40 = v125;
                  v38 = v68;
                  v37 = v67;
                }
                else
                {
                  v76 = 1.79769313e308;
LABEL_70:

                }
                v83 = *(double *)&v37;
                if (v49 > v38)
                  v83 = v49 / 86400.0 * -375000.0 + 3250000.0;
                if (v76 < v83)
                  goto LABEL_37;
              }
              v130 = 0;
              v57 = 0;
              v41 = obj;
              v43 = v133;
              goto LABEL_76;
            }
LABEL_37:
            v43 = v133;
            objc_msgSend(v40, "addObject:", v133);
            v130 = 0;
            v57 = 1;
            goto LABEL_38;
          }
          v41 = obj;
        }
        else
        {
LABEL_29:
          v59 = objc_msgSend(v43, "pl_locationType") == 10;
        }
        if (objc_msgSend(v40, "count"))
        {
          objc_msgSend(a1, "_timeIntervalBetweenItem:andItem:", v43, v34);
          v49 = v48;
          v128 = 0;
          v129 = v34;
          goto LABEL_32;
        }
        v44 = v134;
LABEL_106:
        v36 = v35 + v36;
        objc_autoreleasePoolPop(v44);
        if (++v42 == v132)
        {
          v98 = -[NSObject countByEnumeratingWithState:objects:count:](v41, "countByEnumeratingWithState:objects:count:", &v145, v159, 16);
          v132 = v98;
          if (v98)
            goto LABEL_18;
          goto LABEL_117;
        }
      }
    }
    v39 = (void (**)(_QWORD, _QWORD, double))v120;
    v40 = (void *)v32;
    v41 = obj;
LABEL_117:
    v100 = v40;

    objc_msgSend(a1, "_generateTripFromTripsMoments:withLastHomeVisitDate:andLastItem:", v121, v119, v122);
    v99 = (void *)objc_claimAutoreleasedReturnValue();
    v102 = mach_absolute_time();
    numer = info.numer;
    denom = info.denom;
    v105 = v118;
    v106 = v105;
    if (v114 <= 0xFFFFFFFFFFFFFFFDLL && os_signpost_enabled(v105))
    {
      v107 = objc_msgSend(v117, "count");
      v108 = objc_msgSend(v99, "count");
      *(_DWORD *)buf = 134218240;
      *(_QWORD *)&buf[4] = v107;
      v41 = obj;
      *(_WORD *)&buf[12] = 2048;
      *(_QWORD *)&buf[14] = v108;
      _os_signpost_emit_with_name_impl(&dword_199541000, v106, OS_SIGNPOST_INTERVAL_END, spid, "TripsProcessing", "[HighlightsGeneration] Trips Processing for %lu moments, %lu trips", buf, 0x16u);
    }

    v101 = v106;
    v10 = v115;
    if (os_log_type_enabled(v101, OS_LOG_TYPE_INFO))
    {
      v109 = (float)((float)((float)(v102 - v113) * (float)numer) / (float)denom) / 1000000.0;
      v41 = obj;
      objc_msgSend(MEMORY[0x1E0CB3940], "stringWithFormat:", CFSTR("[HighlightsGeneration] Trips Processing for %lu moments, %lu trips"), objc_msgSend(v117, "count"), objc_msgSend(v99, "count"));
      v110 = (void *)objc_claimAutoreleasedReturnValue();
      *(_DWORD *)buf = 136315650;
      *(_QWORD *)&buf[4] = "TripsProcessing";
      *(_WORD *)&buf[12] = 2112;
      *(_QWORD *)&buf[14] = v110;
      v155 = 2048;
      v156 = v109;
      _os_log_impl(&dword_199541000, v101, OS_LOG_TYPE_INFO, "[Performance] %s - %@: %f ms", buf, 0x20u);

    }
LABEL_122:

    v9 = v117;
    v11 = v119;
    v12 = v116;
  }
  else
  {
    v99 = (void *)MEMORY[0x1E0C9AA60];
  }

  return v99;
}

+ (id)_generateTripFromTripsMoments:(id)a3 withLastHomeVisitDate:(id)a4 andLastItem:(id)a5
{
  id v7;
  id v8;
  uint64_t v9;
  uint64_t v10;
  id v11;
  uint64_t v12;
  uint64_t v13;
  void *v14;
  void *v15;
  void *v16;
  void *v17;
  void *v18;
  double v19;
  double v20;
  uint64_t v21;
  uint64_t v22;
  uint64_t v23;
  uint64_t v24;
  double v25;
  uint64_t v26;
  id v27;
  uint64_t v28;
  void *v29;
  id v30;
  uint64_t v31;
  uint64_t v32;
  unint64_t v33;
  uint64_t v34;
  double v35;
  uint64_t i;
  void *v37;
  void *v38;
  int v39;
  int v40;
  uint64_t v42;
  uint64_t v43;
  uint64_t v44;
  uint64_t v45;
  double v46;
  double v47;
  void *v48;
  void *v49;
  double v50;
  double v51;
  void *v52;
  void *v53;
  double v54;
  double v55;
  void *v56;
  id v57;
  uint64_t v58;
  uint64_t v59;
  uint64_t v60;
  uint64_t j;
  void *v62;
  id v63;
  uint64_t v64;
  id v65;
  uint64_t v66;
  uint64_t v67;
  uint64_t k;
  void *v69;
  void *v70;
  id v71;
  id v73;
  void *v74;
  void *v75;
  id obj;
  id v77;
  id v78;
  uint64_t v79;
  id v81;
  uint64_t v82;
  uint64_t v83;
  unint64_t v84;
  __int128 v85;
  __int128 v86;
  __int128 v87;
  __int128 v88;
  __int128 v89;
  __int128 v90;
  __int128 v91;
  __int128 v92;
  __int128 v93;
  __int128 v94;
  __int128 v95;
  __int128 v96;
  __int128 v97;
  __int128 v98;
  __int128 v99;
  __int128 v100;
  uint64_t v101;
  uint64_t v102;
  uint64_t v103;
  uint64_t v104;
  __int128 v105;
  __int128 v106;
  __int128 v107;
  __int128 v108;
  _BYTE v109[128];
  _BYTE v110[128];
  _BYTE v111[128];
  _BYTE v112[128];
  _BYTE v113[128];
  uint64_t v114;

  v114 = *MEMORY[0x1E0C80C00];
  v7 = a3;
  v73 = a4;
  v81 = a5;
  objc_msgSend(MEMORY[0x1E0C99DE8], "array");
  v78 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(MEMORY[0x1E0C99DE8], "array");
  v74 = (void *)objc_claimAutoreleasedReturnValue();
  v105 = 0u;
  v106 = 0u;
  v107 = 0u;
  v108 = 0u;
  v8 = v7;
  v9 = objc_msgSend(v8, "countByEnumeratingWithState:objects:count:", &v105, v113, 16);
  if (!v9)
  {
    v11 = 0;
    goto LABEL_17;
  }
  v10 = v9;
  v11 = 0;
  v12 = *(_QWORD *)v106;
  do
  {
    v13 = 0;
    do
    {
      if (*(_QWORD *)v106 != v12)
        objc_enumerationMutation(v8);
      v14 = *(void **)(*((_QWORD *)&v105 + 1) + 8 * v13);
      if (!v11)
        goto LABEL_10;
      objc_msgSend(*(id *)(*((_QWORD *)&v105 + 1) + 8 * v13), "firstObject");
      v15 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v11, "lastObject");
      v16 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v16, "pl_endDate");
      v17 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v15, "pl_startDate");
      v18 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v17, "timeIntervalSinceDate:", v18);
      v20 = fabs(v19);

      if (v20 > 172800.0
        || (objc_msgSend(v15, "pl_coordinate"),
            v103 = v21,
            v104 = v22,
            objc_msgSend(v16, "pl_coordinate"),
            v101 = v23,
            v102 = v24,
            CLLocationCoordinate2DGetDistanceFrom(),
            v25 > 70000.0))
      {

LABEL_10:
        v15 = v11;
        v11 = v14;
        goto LABEL_11;
      }
      objc_msgSend(v11, "addObjectsFromArray:", v14);
      objc_msgSend(v74, "addObject:", v14);

LABEL_11:
      ++v13;
    }
    while (v10 != v13);
    v26 = objc_msgSend(v8, "countByEnumeratingWithState:objects:count:", &v105, v113, 16);
    v10 = v26;
  }
  while (v26);
LABEL_17:

  objc_msgSend(v8, "removeObjectsInArray:", v74);
  objc_msgSend(MEMORY[0x1E0C99DE8], "array");
  v75 = (void *)objc_claimAutoreleasedReturnValue();
  v97 = 0u;
  v98 = 0u;
  v99 = 0u;
  v100 = 0u;
  obj = v8;
  v82 = objc_msgSend(obj, "countByEnumeratingWithState:objects:count:", &v97, v112, 16);
  v27 = 0;
  if (!v82)
    goto LABEL_55;
  v79 = *(_QWORD *)v98;
  v77 = v11;
  while (2)
  {
    v28 = 0;
    while (2)
    {
      if (*(_QWORD *)v98 != v79)
        objc_enumerationMutation(obj);
      v29 = *(void **)(*((_QWORD *)&v97 + 1) + 8 * v28);
      v93 = 0u;
      v94 = 0u;
      v95 = 0u;
      v96 = 0u;
      v30 = v29;
      v31 = objc_msgSend(v30, "countByEnumeratingWithState:objects:count:", &v93, v111, 16);
      if (!v31)
      {
        v56 = v30;
        goto LABEL_50;
      }
      v32 = v31;
      v83 = v28;
      v33 = 0;
      v34 = *(_QWORD *)v94;
      v35 = 0.0;
      do
      {
        for (i = 0; i != v32; ++i)
        {
          v37 = v27;
          if (*(_QWORD *)v94 != v34)
            objc_enumerationMutation(v30);
          v38 = *(void **)(*((_QWORD *)&v93 + 1) + 8 * i);
          if (v37)
          {
            v39 = objc_msgSend(*(id *)(*((_QWORD *)&v93 + 1) + 8 * i), "pl_originatorState");
            v40 = objc_msgSend(v37, "pl_originatorState");
            if (v39 != v40 && (v39 == 4 || v40 == 4))
            {
              v103 = 0;
              v104 = 0;
              objc_msgSend(v38, "pl_coordinate");
              v103 = v42;
              v104 = v43;
              v101 = 0;
              v102 = 0;
              objc_msgSend(v37, "pl_coordinate");
              v101 = v44;
              v102 = v45;
              CLLocationCoordinate2DGetDistanceFrom();
              v47 = v46;
              objc_msgSend(v38, "pl_startDate");
              v84 = v33;
              v48 = (void *)objc_claimAutoreleasedReturnValue();
              objc_msgSend(v37, "pl_endDate");
              v49 = (void *)objc_claimAutoreleasedReturnValue();
              objc_msgSend(v48, "timeIntervalSinceDate:", v49);
              v51 = fabs(v50);
              objc_msgSend(v38, "pl_endDate");
              v52 = (void *)objc_claimAutoreleasedReturnValue();
              objc_msgSend(v37, "pl_startDate");
              v53 = (void *)objc_claimAutoreleasedReturnValue();
              objc_msgSend(v52, "timeIntervalSinceDate:", v53);
              v55 = fmin(v51, fabs(v54));

              v35 = v35 + fmax(v47, 1.0) / fmax(v55, 1.0);
              v33 = v84 + 1;
            }
          }
          v27 = v38;

        }
        v32 = objc_msgSend(v30, "countByEnumeratingWithState:objects:count:", &v93, v111, 16);
      }
      while (v32);

      if (!v33)
      {
        v11 = v77;
        goto LABEL_52;
      }
      v11 = v77;
      if (v35 / (double)v33 <= 60.0)
      {
LABEL_52:
        v28 = v83;
        goto LABEL_53;
      }
      objc_msgSend(MEMORY[0x1E0C99DE8], "array");
      v56 = (void *)objc_claimAutoreleasedReturnValue();
      v89 = 0u;
      v90 = 0u;
      v91 = 0u;
      v92 = 0u;
      v57 = v30;
      v58 = objc_msgSend(v57, "countByEnumeratingWithState:objects:count:", &v89, v110, 16);
      if (v58)
      {
        v59 = v58;
        v60 = *(_QWORD *)v90;
        do
        {
          for (j = 0; j != v59; ++j)
          {
            if (*(_QWORD *)v90 != v60)
              objc_enumerationMutation(v57);
            v62 = *(void **)(*((_QWORD *)&v89 + 1) + 8 * j);
            if (objc_msgSend(v62, "pl_originatorState", v73) == 4)
              objc_msgSend(v56, "addObject:", v62);
          }
          v59 = objc_msgSend(v57, "countByEnumeratingWithState:objects:count:", &v89, v110, 16);
        }
        while (v59);
      }

      objc_msgSend(v57, "removeObjectsInArray:", v56);
      objc_msgSend(v75, "addObject:", v56);
      v28 = v83;
LABEL_50:

LABEL_53:
      if (++v28 != v82)
        continue;
      break;
    }
    v82 = objc_msgSend(obj, "countByEnumeratingWithState:objects:count:", &v97, v112, 16);
    if (v82)
      continue;
    break;
  }
LABEL_55:

  objc_msgSend(obj, "addObjectsFromArray:", v75);
  v87 = 0u;
  v88 = 0u;
  v85 = 0u;
  v86 = 0u;
  v63 = obj;
  v64 = objc_msgSend(v63, "countByEnumeratingWithState:objects:count:", &v85, v109, 16);
  v65 = v73;
  if (v64)
  {
    v66 = v64;
    v67 = *(_QWORD *)v86;
    do
    {
      for (k = 0; k != v66; ++k)
      {
        if (*(_QWORD *)v86 != v67)
          objc_enumerationMutation(v63);
        objc_msgSend(a1, "_tripFromTripMoments:withLastHomeVisitDate:andLastItem:", *(_QWORD *)(*((_QWORD *)&v85 + 1) + 8 * k), v65, v81, v73);
        v69 = (void *)objc_claimAutoreleasedReturnValue();
        if (v69)
          objc_msgSend(v78, "addObject:", v69);

      }
      v66 = objc_msgSend(v63, "countByEnumeratingWithState:objects:count:", &v85, v109, 16);
    }
    while (v66);
  }

  v70 = v65;
  v71 = v78;

  return v71;
}

+ (id)_tripFromTripMoments:(id)a3 withLastHomeVisitDate:(id)a4 andLastItem:(id)a5
{
  id v8;
  id v9;
  id v10;
  void *v11;
  void *v12;
  double v13;
  double v14;
  PLTrip *v15;
  id v17;
  uint64_t v18;
  uint64_t v19;
  uint64_t v20;
  uint64_t v21;
  uint64_t v22;
  uint64_t v23;
  uint64_t v24;
  uint64_t v25;
  uint64_t v26;
  uint64_t v27;
  void *v28;
  void *v29;
  double v30;
  void *v31;
  uint64_t v32;
  __int128 v33;
  __int128 v34;
  __int128 v35;
  __int128 v36;
  __int128 v37;
  __int128 v38;
  __int128 v39;
  __int128 v40;
  _BYTE v41[128];
  _BYTE v42[128];
  uint64_t v43;

  v43 = *MEMORY[0x1E0C80C00];
  v8 = a3;
  v9 = a4;
  v10 = a5;
  if ((unint64_t)objc_msgSend(v8, "count") < 2)
    goto LABEL_4;
  objc_msgSend(v8, "firstObject");
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v8, "lastObject");
  v12 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(a1, "_timeIntervalBetweenItem:andItem:", v11, v12);
  v14 = v13;

  if (v14 < 28800.0 || (unint64_t)objc_msgSend(a1, "_numberOfAssetsInItems:", v8) < 8)
  {
LABEL_4:
    v15 = 0;
    goto LABEL_5;
  }
  v39 = 0u;
  v40 = 0u;
  v37 = 0u;
  v38 = 0u;
  v17 = v8;
  v18 = objc_msgSend(v17, "countByEnumeratingWithState:objects:count:", &v37, v42, 16);
  if (v18)
  {
    v19 = v18;
    v20 = *(_QWORD *)v38;
LABEL_8:
    v21 = 0;
    while (1)
    {
      if (*(_QWORD *)v38 != v20)
        objc_enumerationMutation(v17);
      if ((objc_msgSend(*(id *)(*((_QWORD *)&v37 + 1) + 8 * v21), "pl_originatorState") & 4) == 0)
        break;
      if (v19 == ++v21)
      {
        v19 = objc_msgSend(v17, "countByEnumeratingWithState:objects:count:", &v37, v42, 16);
        if (v19)
          goto LABEL_8;
LABEL_23:
        v15 = 0;
        goto LABEL_33;
      }
    }
  }

  v35 = 0u;
  v36 = 0u;
  v33 = 0u;
  v34 = 0u;
  v17 = v17;
  v22 = objc_msgSend(v17, "countByEnumeratingWithState:objects:count:", &v33, v41, 16);
  if (v22)
  {
    v23 = v22;
    v24 = *(_QWORD *)v34;
LABEL_17:
    v25 = 0;
    while (1)
    {
      if (*(_QWORD *)v34 != v24)
        objc_enumerationMutation(v17);
      if (objc_msgSend(*(id *)(*((_QWORD *)&v33 + 1) + 8 * v25), "pl_locationType", (_QWORD)v33) != 10)
        break;
      if (v23 == ++v25)
      {
        v23 = objc_msgSend(v17, "countByEnumeratingWithState:objects:count:", &v33, v41, 16);
        if (v23)
          goto LABEL_17;
        goto LABEL_23;
      }
    }
  }

  v26 = v14 >= 345600.0;
  objc_msgSend(v17, "lastObject");
  v27 = objc_claimAutoreleasedReturnValue();
  if ((id)v27 == v10)
  {
    objc_msgSend(MEMORY[0x1E0C99D68], "date");
    v28 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v10, "pl_endDate");
    v29 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v28, "timeIntervalSinceDate:", v29);
    if (v30 > 518400.0)
    {

      goto LABEL_32;
    }
    if (v9)
    {
      objc_msgSend(v10, "pl_endDate");
      v31 = (void *)objc_claimAutoreleasedReturnValue();
      v32 = objc_msgSend(v31, "compare:", v9);

      if (v32 != 1)
        goto LABEL_32;
    }
    else
    {

    }
    v26 = 2;
  }
LABEL_32:
  v15 = -[PLTrip initWithItems:type:]([PLTrip alloc], "initWithItems:type:", v17, v26);
  v17 = (id)v27;
LABEL_33:

LABEL_5:
  return v15;
}

+ (double)_timeIntervalBetweenItem:(id)a3 andItem:(id)a4
{
  id v5;
  void *v6;
  double v7;
  double v8;
  void *v9;
  double v10;
  double v11;

  if (a3 == a4 || !a3 || !a4)
    return 0.0;
  v5 = a4;
  objc_msgSend(a3, "pl_startDate");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v6, "timeIntervalSinceReferenceDate");
  v8 = v7;
  objc_msgSend(v5, "pl_startDate");
  v9 = (void *)objc_claimAutoreleasedReturnValue();

  objc_msgSend(v9, "timeIntervalSinceReferenceDate");
  v11 = vabdd_f64(v8, v10);

  return v11;
}

+ (unint64_t)_numberOfAssetsInItems:(id)a3
{
  id v3;
  uint64_t v4;
  uint64_t v5;
  unint64_t v6;
  uint64_t v7;
  uint64_t i;
  __int128 v10;
  __int128 v11;
  __int128 v12;
  __int128 v13;
  _BYTE v14[128];
  uint64_t v15;

  v15 = *MEMORY[0x1E0C80C00];
  v3 = a3;
  v10 = 0u;
  v11 = 0u;
  v12 = 0u;
  v13 = 0u;
  v4 = objc_msgSend(v3, "countByEnumeratingWithState:objects:count:", &v10, v14, 16);
  if (v4)
  {
    v5 = v4;
    v6 = 0;
    v7 = *(_QWORD *)v11;
    do
    {
      for (i = 0; i != v5; ++i)
      {
        if (*(_QWORD *)v11 != v7)
          objc_enumerationMutation(v3);
        v6 += objc_msgSend(*(id *)(*((_QWORD *)&v10 + 1) + 8 * i), "pl_numberOfAssets");
      }
      v5 = objc_msgSend(v3, "countByEnumeratingWithState:objects:count:", &v10, v14, 16);
    }
    while (v5);
  }
  else
  {
    v6 = 0;
  }

  return v6;
}

+ (double)_minimumDistanceBetweenFrequentLocations:(id)a3 andItem:(id)a4
{
  id v6;
  id v7;
  double latitude;
  double longitude;
  _BOOL4 v10;
  double v11;
  uint64_t v13;
  uint64_t v14;
  void *v15;
  double v16;
  double v17;
  void *v18;
  double v19;
  double v20;
  double v21;
  void *v22;
  void *v23;
  void *v24;
  void *v25;
  id v26;
  NSObject *v27;
  void *v28;
  void *v29;
  id v30;
  void *v31;
  void *v32;
  unint64_t v33;
  id v34;
  uint64_t v35;
  uint64_t v36;
  double v37;
  uint64_t v38;
  uint64_t i;
  void *v40;
  void *v41;
  double v42;
  NSObject *v43;
  NSObject *v44;
  uint64_t v45;
  uint64_t v46;
  id v47;
  uint64_t v48;
  uint64_t v49;
  uint64_t v50;
  uint64_t j;
  void *v52;
  uint64_t v53;
  uint64_t v54;
  double v55;
  void *v56;
  void *v57;
  void *v58;
  id v59;
  id v60;
  void *v61;
  void *v62;
  __int128 v63;
  __int128 v64;
  __int128 v65;
  __int128 v66;
  __int128 v67;
  __int128 v68;
  __int128 v69;
  __int128 v70;
  uint64_t v71;
  uint64_t v72;
  uint8_t v73[128];
  _BYTE buf[22];
  __int16 v75;
  double v76;
  _BYTE v77[128];
  uint64_t v78;
  CLLocationCoordinate2D v79;

  v78 = *MEMORY[0x1E0C80C00];
  v6 = a3;
  v7 = a4;
  if (!objc_msgSend(v6, "count"))
    goto LABEL_8;
  objc_msgSend(v7, "pl_coordinate");
  latitude = v79.latitude;
  longitude = v79.longitude;
  if (!CLLocationCoordinate2DIsValid(v79))
    goto LABEL_8;
  v10 = latitude != 0.0;
  if (longitude != 0.0)
    v10 = 1;
  v11 = 1.79769313e308;
  if (v10)
  {
    if (latitude == 40.0 && longitude == -100.0)
    {
LABEL_8:
      v11 = 1.79769313e308;
      goto LABEL_9;
    }
    objc_msgSend(v7, "pl_coordinate");
    v71 = v13;
    v72 = v14;
    objc_msgSend(v7, "pl_startDate");
    v15 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v15, "timeIntervalSinceReferenceDate");
    v17 = v16;

    objc_msgSend(v7, "pl_endDate");
    v18 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v18, "timeIntervalSinceReferenceDate");
    v20 = v19;

    if (v17 >= v20)
      v21 = v20;
    else
      v21 = v17;
    if (v17 < v20)
      v17 = v20;
    objc_msgSend(MEMORY[0x1E0C99D68], "dateWithTimeIntervalSinceReferenceDate:", v21 + -2592000.0);
    v22 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(MEMORY[0x1E0C99D68], "dateWithTimeIntervalSinceReferenceDate:", v17 + 2592000.0);
    v23 = (void *)objc_claimAutoreleasedReturnValue();
    v24 = (void *)objc_msgSend(objc_alloc(MEMORY[0x1E0CB3588]), "initWithStartDate:endDate:", v22, v23);
    objc_msgSend(a1, "_filterFrequentLocations:forDateInterval:", v6, v24);
    v25 = (void *)objc_claimAutoreleasedReturnValue();
    if (!objc_msgSend(v25, "count"))
    {
      v26 = v6;

      v25 = v26;
    }
    v61 = (void *)objc_msgSend(objc_alloc(MEMORY[0x1E0C99EA0]), "initWithSuiteName:", CFSTR("com.apple.mobileslideshow"));
    v62 = v25;
    if (objc_msgSend(v61, "BOOLForKey:", CFSTR("PLOnlyUsePrimaryLocationsForTrip")))
    {
      v56 = v24;
      v57 = v23;
      v58 = v22;
      v60 = v6;
      PLMomentsGetLog();
      v27 = objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v27, OS_LOG_TYPE_DEBUG))
      {
        *(_DWORD *)buf = 138412290;
        *(_QWORD *)&buf[4] = v7;
        _os_log_impl(&dword_199541000, v27, OS_LOG_TYPE_DEBUG, "Finding primary frequent locations for %@", buf, 0xCu);
      }
      v59 = v7;

      objc_msgSend(v25, "allObjects");
      v28 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v28, "sortedArrayUsingComparator:", &__block_literal_global_60015);
      v29 = (void *)objc_claimAutoreleasedReturnValue();

      v30 = objc_alloc_init(MEMORY[0x1E0C99E20]);
      objc_msgSend(v29, "objectAtIndexedSubscript:", 0);
      v31 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v31, "sortedMoments");
      v32 = (void *)objc_claimAutoreleasedReturnValue();
      v33 = objc_msgSend(v32, "count");

      v69 = 0u;
      v70 = 0u;
      v67 = 0u;
      v68 = 0u;
      v34 = v29;
      v35 = objc_msgSend(v34, "countByEnumeratingWithState:objects:count:", &v67, v77, 16);
      if (v35)
      {
        v36 = v35;
        v37 = (double)v33;
        v38 = *(_QWORD *)v68;
        do
        {
          for (i = 0; i != v36; ++i)
          {
            if (*(_QWORD *)v68 != v38)
              objc_enumerationMutation(v34);
            v40 = *(void **)(*((_QWORD *)&v67 + 1) + 8 * i);
            objc_msgSend(v40, "sortedMoments");
            v41 = (void *)objc_claimAutoreleasedReturnValue();
            v42 = (double)(unint64_t)objc_msgSend(v41, "count");

            if (v37 * 0.8 >= v42)
            {
              PLMomentsGetLog();
              v43 = objc_claimAutoreleasedReturnValue();
              if (os_log_type_enabled(v43, OS_LOG_TYPE_DEBUG))
              {
                *(_DWORD *)buf = 134218498;
                *(double *)&buf[4] = v42;
                *(_WORD *)&buf[12] = 2112;
                *(_QWORD *)&buf[14] = v40;
                v75 = 2048;
                v76 = v37 * 0.8;
                _os_log_impl(&dword_199541000, v43, OS_LOG_TYPE_DEBUG, "[Reject] Current score: %f for %@ (below threshold of %f)", buf, 0x20u);
              }
            }
            else
            {
              objc_msgSend(v30, "addObject:", v40);
              PLMomentsGetLog();
              v43 = objc_claimAutoreleasedReturnValue();
              if (os_log_type_enabled(v43, OS_LOG_TYPE_DEBUG))
              {
                *(_DWORD *)buf = 134218242;
                *(double *)&buf[4] = v42;
                *(_WORD *)&buf[12] = 2112;
                *(_QWORD *)&buf[14] = v40;
                _os_log_impl(&dword_199541000, v43, OS_LOG_TYPE_DEBUG, "Current score: %f for %@", buf, 0x16u);
              }
              v37 = v42;
            }

          }
          v36 = objc_msgSend(v34, "countByEnumeratingWithState:objects:count:", &v67, v77, 16);
        }
        while (v36);
      }

      PLMomentsGetLog();
      v44 = objc_claimAutoreleasedReturnValue();
      v24 = v56;
      if (os_log_type_enabled(v44, OS_LOG_TYPE_DEBUG))
      {
        v45 = objc_msgSend(v30, "count");
        v46 = objc_msgSend(v62, "count");
        *(_DWORD *)buf = 134218240;
        *(_QWORD *)&buf[4] = v45;
        *(_WORD *)&buf[12] = 2048;
        *(_QWORD *)&buf[14] = v46;
        _os_log_impl(&dword_199541000, v44, OS_LOG_TYPE_DEBUG, "Found (%lu/%lu) primary frequent locations for trip generation", buf, 0x16u);
      }

      v7 = v59;
      v6 = v60;
      v23 = v57;
      v22 = v58;
    }
    else
    {
      v30 = v25;
    }
    v65 = 0u;
    v66 = 0u;
    v63 = 0u;
    v64 = 0u;
    v47 = v30;
    v48 = objc_msgSend(v47, "countByEnumeratingWithState:objects:count:", &v63, v73, 16);
    if (v48)
    {
      v49 = v48;
      v50 = *(_QWORD *)v64;
      v11 = 1.79769313e308;
      do
      {
        for (j = 0; j != v49; ++j)
        {
          if (*(_QWORD *)v64 != v50)
            objc_enumerationMutation(v47);
          v52 = *(void **)(*((_QWORD *)&v63 + 1) + 8 * j);
          *(_QWORD *)buf = 0;
          *(_QWORD *)&buf[8] = 0;
          objc_msgSend(v52, "coordinate");
          *(_QWORD *)buf = v53;
          *(_QWORD *)&buf[8] = v54;
          CLLocationCoordinate2DGetDistanceFrom();
          if (v11 >= v55)
            v11 = v55;
        }
        v49 = objc_msgSend(v47, "countByEnumeratingWithState:objects:count:", &v63, v73, 16);
      }
      while (v49);
    }
    else
    {
      v11 = 1.79769313e308;
    }

  }
LABEL_9:

  return v11;
}

+ (id)_filterFrequentLocations:(id)a3 forDateInterval:(id)a4
{
  id v5;
  id v6;
  void *v7;
  id v8;
  uint64_t v9;
  uint64_t v10;
  uint64_t v11;
  uint64_t i;
  void *v13;
  void *v14;
  int v15;
  __int128 v17;
  __int128 v18;
  __int128 v19;
  __int128 v20;
  _BYTE v21[128];
  uint64_t v22;

  v22 = *MEMORY[0x1E0C80C00];
  v5 = a3;
  v6 = a4;
  v7 = (void *)objc_opt_new();
  v17 = 0u;
  v18 = 0u;
  v19 = 0u;
  v20 = 0u;
  v8 = v5;
  v9 = objc_msgSend(v8, "countByEnumeratingWithState:objects:count:", &v17, v21, 16);
  if (v9)
  {
    v10 = v9;
    v11 = *(_QWORD *)v18;
    do
    {
      for (i = 0; i != v10; ++i)
      {
        if (*(_QWORD *)v18 != v11)
          objc_enumerationMutation(v8);
        v13 = *(void **)(*((_QWORD *)&v17 + 1) + 8 * i);
        objc_msgSend(v13, "dateInterval", (_QWORD)v17);
        v14 = (void *)objc_claimAutoreleasedReturnValue();
        v15 = objc_msgSend(v14, "intersectsDateInterval:", v6);

        if (v15)
          objc_msgSend(v7, "addObject:", v13);
      }
      v10 = objc_msgSend(v8, "countByEnumeratingWithState:objects:count:", &v17, v21, 16);
    }
    while (v10);
  }

  return v7;
}

BOOL __68__PLTripProcessor__minimumDistanceBetweenFrequentLocations_andItem___block_invoke(uint64_t a1, void *a2, void *a3)
{
  id v4;
  void *v5;
  unint64_t v6;
  void *v7;
  _BOOL8 v8;

  v4 = a3;
  objc_msgSend(a2, "sortedMoments");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  v6 = objc_msgSend(v5, "count");
  objc_msgSend(v4, "sortedMoments");
  v7 = (void *)objc_claimAutoreleasedReturnValue();

  v8 = v6 < objc_msgSend(v7, "count");
  return v8;
}

@end
