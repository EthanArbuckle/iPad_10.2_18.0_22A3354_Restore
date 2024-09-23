@implementation TAFilterVisits

+ (BOOL)shouldDetectWithStore:(id)a3 settings:(id)a4
{
  id v5;
  id v6;
  void *v7;
  void *v8;
  unint64_t v9;
  char v10;
  void *v11;
  void *v12;
  void *v13;
  char v14;

  v5 = a3;
  v6 = a4;
  if (v5
    && (objc_msgSend(v5, "visitState"),
        v7 = (void *)objc_claimAutoreleasedReturnValue(),
        objc_msgSend(v7, "visitSnapshotBuffer"),
        v8 = (void *)objc_claimAutoreleasedReturnValue(),
        v9 = objc_msgSend(v8, "count"),
        v8,
        v7,
        v9 >= 2))
  {
    objc_msgSend(v5, "visitState");
    v11 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v11, "visitSnapshotBuffer");
    v12 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v12, "lastObject");
    v13 = (void *)objc_claimAutoreleasedReturnValue();
    v14 = objc_msgSend(v13, "isClosed");

    v10 = v14 ^ 1;
  }
  else
  {
    v10 = 0;
  }

  return v10;
}

+ (id)filterSuspiciousDeviceWithStore:(id)a3 settings:(id)a4 andAppendOutgoingRequestsTo:(id)a5
{
  id v7;
  TAFilterVisitsSettings *v8;
  id v9;
  id v10;
  void *v11;
  void *v12;
  void *v13;
  void *v14;
  void *v15;
  void *v16;
  uint64_t v17;
  void *v18;
  void *v19;
  void *v20;
  void *v21;
  void *v22;
  void *v23;
  void *v24;
  TALocationLite *v25;
  void *v26;
  double v27;
  double v28;
  double v29;
  double v30;
  double v31;
  TALocationLite *v32;
  TALocationLite *v33;
  void *v34;
  double v35;
  double v36;
  double v37;
  double v38;
  double v39;
  uint64_t v40;
  uint64_t v41;
  uint64_t v42;
  NSObject *v43;
  id v44;
  id v45;
  void *v46;
  void *v47;
  void *v48;
  void *v49;
  unint64_t v50;
  void *v51;
  void *v52;
  uint64_t v53;
  void *v54;
  void *v55;
  void *v56;
  void *v57;
  void *v58;
  TALocationLite *v59;
  void *v60;
  double v61;
  double v62;
  double v63;
  double v64;
  double v65;
  TALocationLite *v66;
  uint64_t v67;
  uint64_t v68;
  uint64_t v69;
  void *v70;
  void *v71;
  id v72;
  uint64_t v73;
  uint64_t v74;
  uint64_t v75;
  uint64_t i;
  void *v77;
  TAVisitDetectionMetrics *v78;
  double v79;
  double v80;
  double v81;
  unint64_t v82;
  uint64_t v83;
  unint64_t v84;
  void *v85;
  void *v86;
  void *v87;
  void *v88;
  void *v89;
  uint64_t v90;
  void *v91;
  id v92;
  void *v93;
  void *v94;
  void *v95;
  void *v96;
  void *v97;
  void *v98;
  void *v99;
  uint64_t v100;
  TASuspiciousDevice *v101;
  void *v102;
  void *v103;
  void *v104;
  unint64_t v105;
  void *v106;
  void *v107;
  TASuspiciousDevice *v108;
  void *v109;
  void *v110;
  void *v111;
  void *v112;
  void *v113;
  void *v114;
  uint64_t v115;
  const __CFString *v116;
  uint64_t v117;
  void *v118;
  id v119;
  void *v120;
  void *v121;
  unint64_t v122;
  void *v123;
  void *v124;
  uint64_t v125;
  void *v126;
  void *v127;
  void *v128;
  void *v129;
  void *v130;
  void *v131;
  void *v132;
  void *v133;
  void *v134;
  NSObject *v135;
  TASuspiciousDevice *v136;
  void *v137;
  void *v138;
  uint64_t v139;
  void *v140;
  void *v141;
  void *v142;
  TASuspiciousDevice *v143;
  id v144;
  void *v146;
  void *v147;
  id v148;
  void *v149;
  TAFilterVisitsSettings *v150;
  void *v151;
  void *v152;
  id obj;
  __CFString *v154;
  void *v155;
  void *v156;
  void *v157;
  uint64_t v158;
  uint64_t v159;
  _BOOL8 v160;
  unint64_t v161;
  void *v162;
  void *v163;
  TALocationLite *v164;
  uint64_t v165;
  id v166;
  TAVisitDetectionMetrics *v167;
  void *v168;
  void *v169;
  void *v170;
  void *v171;
  id v172;
  void *v173;
  uint64_t v174;
  __int128 v175;
  __int128 v176;
  __int128 v177;
  __int128 v178;
  __int128 v179;
  __int128 v180;
  __int128 v181;
  __int128 v182;
  _QWORD v183[4];
  _QWORD v184[4];
  _BYTE v185[128];
  _QWORD v186[3];
  _QWORD v187[3];
  _BYTE v188[128];
  uint64_t buf;
  __int16 v190;
  const char *v191;
  uint64_t v192;

  v192 = *MEMORY[0x24BDAC8D0];
  v7 = a3;
  v8 = (TAFilterVisitsSettings *)a4;
  v9 = a5;
  v10 = objc_alloc_init(MEMORY[0x24BDBCEB8]);
  if (!v8)
    v8 = -[TAFilterVisitsSettings initWithDefaults]([TAFilterVisitsSettings alloc], "initWithDefaults");
  if (+[TAFilterVisits shouldDetectWithStore:settings:](TAFilterVisits, "shouldDetectWithStore:settings:", v7, v8))
  {
    v148 = v9;
    v168 = v10;
    objc_msgSend(v7, "visitState");
    v11 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v11, "visitSnapshotBuffer");
    v12 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v12, "lastObject");
    v13 = (void *)objc_claimAutoreleasedReturnValue();

    objc_msgSend(v7, "visitState");
    v14 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v14, "visitSnapshotBuffer");
    v15 = (void *)objc_claimAutoreleasedReturnValue();
    v16 = v7;
    v17 = objc_msgSend(v15, "count") - 2;

    objc_msgSend(v16, "visitState");
    v18 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v18, "visitSnapshotBuffer");
    v19 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v19, "bufferCopy");
    v20 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v20, "objectAtIndex:", v17);
    v21 = (void *)objc_claimAutoreleasedReturnValue();

    v22 = v13;
    objc_msgSend(v21, "representativeVisit");
    v23 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v13, "representativeVisit");
    v24 = (void *)objc_claimAutoreleasedReturnValue();
    v25 = [TALocationLite alloc];
    objc_msgSend(v23, "departureDate");
    v26 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v23, "coordinate");
    v28 = v27;
    objc_msgSend(v23, "coordinate");
    v30 = v29;
    v147 = v23;
    objc_msgSend(v23, "horizontalAccuracy");
    v32 = -[TALocationLite initWithTimestamp:latitude:longitude:horizontalAccuracy:](v25, "initWithTimestamp:latitude:longitude:horizontalAccuracy:", v26, v28, v30, v31);

    v33 = [TALocationLite alloc];
    objc_msgSend(v24, "arrivalDate");
    v34 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v24, "coordinate");
    v36 = v35;
    objc_msgSend(v24, "coordinate");
    v38 = v37;
    v146 = v24;
    objc_msgSend(v24, "horizontalAccuracy");
    v40 = -[TALocationLite initWithTimestamp:latitude:longitude:horizontalAccuracy:](v33, "initWithTimestamp:latitude:longitude:horizontalAccuracy:", v34, v36, v38, v39);

    v41 = objc_msgSend(v21, "loiType");
    v42 = objc_msgSend(v22, "loiType");
    v163 = (void *)v40;
    v164 = v32;
    -[TALocationLite distanceFromLocation:](v32, "distanceFromLocation:", v40);
    v169 = v16;
    if (+[TAFilterVisits sensitiveVisitsTooCloseBetweenFromLOIType:toLOIType:distance:settings:](TAFilterVisits, "sensitiveVisitsTooCloseBetweenFromLOIType:toLOIType:distance:settings:", v41, v42, v8))
    {
      v43 = TAStatusLog;
      if (os_log_type_enabled((os_log_t)TAStatusLog, OS_LOG_TYPE_DEFAULT))
      {
        buf = 68289026;
        v190 = 2082;
        v191 = "";
        _os_log_impl(&dword_217877000, v43, OS_LOG_TYPE_DEFAULT, "{\"msg%{public}.0s\":\"#TAFilterVisit two sensitive visits too close, abort detection\"}", (uint8_t *)&buf, 0x12u);
      }
      v10 = v168;
      v44 = v168;
      v7 = v16;
      v9 = v148;
    }
    else
    {
      objc_msgSend(v16, "clock");
      v46 = (void *)objc_claimAutoreleasedReturnValue();
      v151 = v22;
      +[TAFilterVisits getSuspiciousDeviceAdvertisementsFromVisitSnapshot:toVisitSnapshot:settings:currentClockTime:](TAFilterVisits, "getSuspiciousDeviceAdvertisementsFromVisitSnapshot:toVisitSnapshot:settings:currentClockTime:", v21, v22, v8, v46);
      v47 = (void *)objc_claimAutoreleasedReturnValue();

      v166 = objc_alloc_init(MEMORY[0x24BDBCEF0]);
      objc_msgSend(v16, "visitState");
      v48 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v48, "visitSnapshotBuffer");
      v49 = (void *)objc_claimAutoreleasedReturnValue();
      v50 = objc_msgSend(v49, "count");

      v150 = v8;
      v152 = v21;
      if (v50 < 3)
      {
        v149 = 0;
      }
      else
      {
        objc_msgSend(v16, "visitState");
        v51 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v51, "visitSnapshotBuffer");
        v52 = (void *)objc_claimAutoreleasedReturnValue();
        v53 = objc_msgSend(v52, "count") - 3;

        objc_msgSend(v16, "visitState");
        v54 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v54, "visitSnapshotBuffer");
        v55 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v55, "bufferCopy");
        v56 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v56, "objectAtIndex:", v53);
        v57 = (void *)objc_claimAutoreleasedReturnValue();

        objc_msgSend(v57, "representativeVisit");
        v58 = (void *)objc_claimAutoreleasedReturnValue();
        v59 = [TALocationLite alloc];
        objc_msgSend(v58, "departureDate");
        v60 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v58, "coordinate");
        v62 = v61;
        objc_msgSend(v58, "coordinate");
        v64 = v63;
        objc_msgSend(v58, "horizontalAccuracy");
        v66 = -[TALocationLite initWithTimestamp:latitude:longitude:horizontalAccuracy:](v59, "initWithTimestamp:latitude:longitude:horizontalAccuracy:", v60, v62, v64, v65);

        v149 = v57;
        v67 = objc_msgSend(v57, "loiType");
        v68 = objc_msgSend(v21, "loiType");
        -[TALocationLite distanceFromLocation:](v66, "distanceFromLocation:", v32);
        v69 = v68;
        v8 = v150;
        if (!+[TAFilterVisits sensitiveVisitsTooCloseBetweenFromLOIType:toLOIType:distance:settings:](TAFilterVisits, "sensitiveVisitsTooCloseBetweenFromLOIType:toLOIType:distance:settings:", v67, v69, v150))
        {
          objc_msgSend(v169, "clock");
          v70 = (void *)objc_claimAutoreleasedReturnValue();
          +[TAFilterVisits getSuspiciousDeviceAdvertisementsFromVisitSnapshot:toVisitSnapshot:settings:currentClockTime:skipFreshObservationCheck:](TAFilterVisits, "getSuspiciousDeviceAdvertisementsFromVisitSnapshot:toVisitSnapshot:settings:currentClockTime:skipFreshObservationCheck:", v149, v21, v150, v70, 1);
          v71 = (void *)objc_claimAutoreleasedReturnValue();

          v181 = 0u;
          v182 = 0u;
          v179 = 0u;
          v180 = 0u;
          v72 = v71;
          v73 = objc_msgSend(v72, "countByEnumeratingWithState:objects:count:", &v179, v188, 16);
          if (v73)
          {
            v74 = v73;
            v75 = *(_QWORD *)v180;
            do
            {
              for (i = 0; i != v74; ++i)
              {
                if (*(_QWORD *)v180 != v75)
                  objc_enumerationMutation(v72);
                objc_msgSend(*(id *)(*((_QWORD *)&v179 + 1) + 8 * i), "address");
                v77 = (void *)objc_claimAutoreleasedReturnValue();
                objc_msgSend(v166, "addObject:", v77);

              }
              v74 = objc_msgSend(v72, "countByEnumeratingWithState:objects:count:", &v179, v188, 16);
            }
            while (v74);
          }

          v8 = v150;
        }

      }
      v78 = [TAVisitDetectionMetrics alloc];
      objc_msgSend(v163, "distanceFromLocation:", v32);
      v80 = v79;
      +[TALocationLite residualDistanceFromLocation:toLocation:nSigma:](TALocationLite, "residualDistanceFromLocation:toLocation:nSigma:", v32, v163, -[TAFilterVisitsSettings minNSigmaBetweenVisits](v8, "minNSigmaBetweenVisits"));
      v167 = -[TAVisitDetectionMetrics initWithDistance:residualDistance:nSigma:](v78, "initWithDistance:residualDistance:nSigma:", -[TAFilterVisitsSettings minNSigmaBetweenVisits](v8, "minNSigmaBetweenVisits"), v80, v81);
      v82 = +[TAFilterVisits identifyDetectionTypeWithStore:settings:](TAFilterVisits, "identifyDetectionTypeWithStore:settings:", v169, v8);
      v160 = v82 == 5;
      v161 = v82;
      v83 = 1;
      if (v82 == 5)
        v83 = 2;
      v159 = v83;
      v186[0] = CFSTR("DetectionAlgorithm");
      v84 = 0x24D814000uLL;
      +[TAMetricsDetection convertTADetectionTypeToString:](TAMetricsDetection, "convertTADetectionTypeToString:", v82);
      v85 = (void *)objc_claimAutoreleasedReturnValue();
      v187[0] = v85;
      v186[1] = CFSTR("LastVisit");
      objc_msgSend(v152, "representativeVisit");
      v86 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v86, "descriptionDictionary");
      v87 = (void *)objc_claimAutoreleasedReturnValue();
      v187[1] = v87;
      v186[2] = CFSTR("CurrentVisit");
      objc_msgSend(v151, "representativeVisit");
      v88 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v88, "descriptionDictionary");
      v89 = (void *)objc_claimAutoreleasedReturnValue();
      v187[2] = v89;
      objc_msgSend(MEMORY[0x24BDBCE70], "dictionaryWithObjects:forKeys:count:", v187, v186, 3);
      v162 = (void *)objc_claimAutoreleasedReturnValue();

      v7 = v169;
      v177 = 0u;
      v178 = 0u;
      v175 = 0u;
      v176 = 0u;
      obj = v47;
      v165 = objc_msgSend(obj, "countByEnumeratingWithState:objects:count:", &v175, v185, 16);
      if (v165)
      {
        v158 = *(_QWORD *)v176;
        do
        {
          v90 = 0;
          do
          {
            if (*(_QWORD *)v176 != v158)
              objc_enumerationMutation(obj);
            v91 = *(void **)(*((_QWORD *)&v175 + 1) + 8 * v90);
            v92 = objc_alloc_init(MEMORY[0x24BDBCEB8]);
            objc_msgSend(v92, "addObject:", v164);
            objc_msgSend(v7, "visitState");
            v93 = (void *)objc_claimAutoreleasedReturnValue();
            objc_msgSend(v93, "interVisitMetricSnapshotBuffer");
            v94 = (void *)objc_claimAutoreleasedReturnValue();
            objc_msgSend(v94, "lastObject");
            v95 = (void *)objc_claimAutoreleasedReturnValue();

            if (v95)
            {
              objc_msgSend(v95, "accumulatedDeviceMetrics");
              v96 = (void *)objc_claimAutoreleasedReturnValue();
              objc_msgSend(v91, "address");
              v97 = (void *)objc_claimAutoreleasedReturnValue();
              objc_msgSend(v96, "objectForKey:", v97);
              v98 = (void *)objc_claimAutoreleasedReturnValue();

              if (v98)
              {
                objc_msgSend(v98, "sampledObservedLocations");
                v99 = (void *)objc_claimAutoreleasedReturnValue();
                objc_msgSend(v92, "addObjectsFromArray:", v99);

              }
            }
            v171 = v95;
            v174 = v90;
            objc_msgSend(v92, "addObject:", v163);
            v100 = objc_msgSend(objc_alloc(*(Class *)(v84 + 2904)), "initWithDetectionType:visitDetectionMetrics:generalDetectionMetrics:singleVisitDetectionMetrics:latestAdvertisement:", v161, v167, 0, 0, v91);
            v101 = [TASuspiciousDevice alloc];
            objc_msgSend(v7, "clock");
            v102 = (void *)objc_claimAutoreleasedReturnValue();
            v172 = v92;
            v103 = (void *)objc_msgSend(v92, "copy");
            objc_msgSend(v7, "deviceRecord");
            v104 = (void *)objc_claimAutoreleasedReturnValue();
            objc_msgSend(v91, "address");
            v105 = v84;
            v106 = (void *)objc_claimAutoreleasedReturnValue();
            objc_msgSend(v104, "getAccessoryInfo:", v106);
            v107 = (void *)objc_claimAutoreleasedReturnValue();
            v170 = (void *)v100;
            v108 = -[TASuspiciousDevice initWithLatestAdv:detectionSummary:date:locHistory:detectionMetrics:detectionType:immediacyType:accessoryInfo:forceSurfaceReason:](v101, "initWithLatestAdv:detectionSummary:date:locHistory:detectionMetrics:detectionType:immediacyType:accessoryInfo:forceSurfaceReason:", v91, v162, v102, v103, v100, v161, v159, v107, v160);
            objc_msgSend(v168, "addObject:", v108);

            objc_msgSend(v91, "address");
            v109 = (void *)objc_claimAutoreleasedReturnValue();
            LODWORD(v102) = objc_msgSend(v166, "containsObject:", v109);

            if ((_DWORD)v102)
            {
              v183[0] = CFSTR("DetectionAlgorithm");
              objc_msgSend(*(id *)(v105 + 2904), "convertTADetectionTypeToString:", 16);
              v110 = (void *)objc_claimAutoreleasedReturnValue();
              v184[0] = v110;
              v183[1] = CFSTR("LastVisit");
              objc_msgSend(v152, "representativeVisit");
              v111 = (void *)objc_claimAutoreleasedReturnValue();
              objc_msgSend(v111, "descriptionDictionary");
              v112 = (void *)objc_claimAutoreleasedReturnValue();
              v184[1] = v112;
              v183[2] = CFSTR("CurrentVisit");
              objc_msgSend(v151, "representativeVisit");
              v113 = (void *)objc_claimAutoreleasedReturnValue();
              objc_msgSend(v113, "descriptionDictionary");
              v114 = (void *)objc_claimAutoreleasedReturnValue();
              v184[2] = v114;
              v183[3] = CFSTR("PastTwoVisit");
              v115 = v105;
              if (v149)
              {
                objc_msgSend(v149, "representativeVisit");
                v155 = (void *)objc_claimAutoreleasedReturnValue();
                objc_msgSend(v155, "descriptionDictionary");
                v154 = (__CFString *)objc_claimAutoreleasedReturnValue();
                v116 = v154;
              }
              else
              {
                v116 = &stru_24D815B48;
              }
              v184[3] = v116;
              objc_msgSend(MEMORY[0x24BDBCE70], "dictionaryWithObjects:forKeys:count:", v184, v183, 4);
              v157 = (void *)objc_claimAutoreleasedReturnValue();
              v117 = v174;
              if (v149)
              {

              }
              v119 = objc_alloc_init(MEMORY[0x24BDBCEB8]);
              objc_msgSend(v169, "visitState");
              v120 = (void *)objc_claimAutoreleasedReturnValue();
              objc_msgSend(v120, "interVisitMetricSnapshotBuffer");
              v121 = (void *)objc_claimAutoreleasedReturnValue();
              v122 = objc_msgSend(v121, "count");

              if (v122 < 2)
              {
                v135 = TAStatusLog;
                v130 = v172;
                if (os_log_type_enabled((os_log_t)TAStatusLog, OS_LOG_TYPE_DEBUG))
                {
                  buf = 68289026;
                  v190 = 2082;
                  v191 = "";
                  _os_log_impl(&dword_217877000, v135, OS_LOG_TYPE_DEBUG, "{\"msg%{public}.0s\":\"#TAFilterVisits missing intervisit metrics\"}", (uint8_t *)&buf, 0x12u);
                }
              }
              else
              {
                objc_msgSend(v169, "visitState");
                v123 = (void *)objc_claimAutoreleasedReturnValue();
                objc_msgSend(v123, "interVisitMetricSnapshotBuffer");
                v124 = (void *)objc_claimAutoreleasedReturnValue();
                v125 = objc_msgSend(v124, "count") - 2;

                objc_msgSend(v169, "visitState");
                v126 = (void *)objc_claimAutoreleasedReturnValue();
                objc_msgSend(v126, "interVisitMetricSnapshotBuffer");
                v127 = (void *)objc_claimAutoreleasedReturnValue();
                objc_msgSend(v127, "bufferCopy");
                v128 = (void *)objc_claimAutoreleasedReturnValue();
                objc_msgSend(v128, "objectAtIndex:", v125);
                v129 = (void *)objc_claimAutoreleasedReturnValue();

                v115 = 0x24D814000;
                v130 = v172;
                if (v129)
                {
                  objc_msgSend(v129, "accumulatedDeviceMetrics");
                  v131 = (void *)objc_claimAutoreleasedReturnValue();
                  objc_msgSend(v91, "address");
                  v132 = (void *)objc_claimAutoreleasedReturnValue();
                  objc_msgSend(v131, "objectForKey:", v132);
                  v133 = (void *)objc_claimAutoreleasedReturnValue();

                  if (v133)
                  {
                    objc_msgSend(v133, "sampledObservedLocations");
                    v134 = (void *)objc_claimAutoreleasedReturnValue();
                    objc_msgSend(v119, "addObjectsFromArray:", v134);

                  }
                }

              }
              objc_msgSend(v119, "addObjectsFromArray:", v130);
              v156 = (void *)objc_msgSend(objc_alloc(*(Class *)(v115 + 2904)), "initWithDetectionType:visitDetectionMetrics:generalDetectionMetrics:singleVisitDetectionMetrics:latestAdvertisement:", 16, v167, 0, 0, v91);
              v136 = [TASuspiciousDevice alloc];
              objc_msgSend(v169, "clock");
              v137 = (void *)objc_claimAutoreleasedReturnValue();
              v138 = (void *)objc_msgSend(v119, "copy");
              v139 = -[TAFilterVisitsSettings threeVisitImmediacyType](v150, "threeVisitImmediacyType");
              objc_msgSend(v169, "deviceRecord");
              v173 = v119;
              v140 = (void *)objc_claimAutoreleasedReturnValue();
              objc_msgSend(v91, "address");
              v141 = (void *)objc_claimAutoreleasedReturnValue();
              objc_msgSend(v140, "getAccessoryInfo:", v141);
              v118 = v130;
              v142 = (void *)objc_claimAutoreleasedReturnValue();
              v143 = -[TASuspiciousDevice initWithLatestAdv:detectionSummary:date:locHistory:detectionMetrics:detectionType:immediacyType:accessoryInfo:forceSurfaceReason:](v136, "initWithLatestAdv:detectionSummary:date:locHistory:detectionMetrics:detectionType:immediacyType:accessoryInfo:forceSurfaceReason:", v91, v157, v137, v138, v156, 16, v139, v142, 0);
              objc_msgSend(v168, "addObject:", v143);

              v7 = v169;
            }
            else
            {
              v7 = v169;
              v118 = v172;
              v117 = v174;
            }

            v90 = v117 + 1;
            v84 = 0x24D814000;
          }
          while (v165 != v90);
          v165 = objc_msgSend(obj, "countByEnumeratingWithState:objects:count:", &v175, v185, 16);
        }
        while (v165);
      }

      v10 = v168;
      v144 = v168;

      v9 = v148;
      v8 = v150;
      v22 = v151;
      v21 = v152;
    }

  }
  else
  {
    v45 = v10;
  }

  return v10;
}

+ (id)filterSuspiciousDeviceWithStore:(id)a3 andAppendOutgoingRequestsTo:(id)a4
{
  id v5;
  id v6;
  TAFilterVisitsSettings *v7;
  void *v8;

  v5 = a4;
  v6 = a3;
  v7 = -[TAFilterVisitsSettings initWithDefaults]([TAFilterVisitsSettings alloc], "initWithDefaults");
  +[TAFilterVisits filterSuspiciousDeviceWithStore:settings:andAppendOutgoingRequestsTo:](TAFilterVisits, "filterSuspiciousDeviceWithStore:settings:andAppendOutgoingRequestsTo:", v6, v7, v5);
  v8 = (void *)objc_claimAutoreleasedReturnValue();

  return v8;
}

+ (id)getSuspiciousDeviceAdvertisementsFromVisitSnapshot:(id)a3 toVisitSnapshot:(id)a4 settings:(id)a5 currentClockTime:(id)a6
{
  return +[TAFilterVisits getSuspiciousDeviceAdvertisementsFromVisitSnapshot:toVisitSnapshot:settings:currentClockTime:skipFreshObservationCheck:](TAFilterVisits, "getSuspiciousDeviceAdvertisementsFromVisitSnapshot:toVisitSnapshot:settings:currentClockTime:skipFreshObservationCheck:", a3, a4, a5, a6, 0);
}

+ (id)getSuspiciousDeviceAdvertisementsFromVisitSnapshot:(id)a3 toVisitSnapshot:(id)a4 settings:(id)a5 currentClockTime:(id)a6 skipFreshObservationCheck:(BOOL)a7
{
  id v11;
  id v12;
  id v13;
  void *v14;
  void *v15;
  TALocationLite *v16;
  void *v17;
  double v18;
  double v19;
  double v20;
  double v21;
  double v22;
  TALocationLite *v23;
  void *v24;
  double v25;
  double v26;
  double v27;
  double v28;
  double v29;
  uint64_t v30;
  void *v31;
  void *v32;
  double v33;
  double v34;
  void *v35;
  char *__ptr32 *v36;
  objc_class *v37;
  id v38;
  void *v39;
  void *v40;
  void *v41;
  void *v42;
  void *v43;
  void *v44;
  void *v45;
  void *v46;
  os_log_t v47;
  void *v48;
  void *v49;
  void *v50;
  uint64_t v51;
  _BOOL4 v52;
  double v53;
  double v54;
  double v55;
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
  double v66;
  double v67;
  double v68;
  double v69;
  void *v70;
  void *v71;
  double v72;
  double v73;
  double v74;
  double v75;
  void *v76;
  NSObject *v77;
  void *v78;
  _BOOL4 v79;
  void *v80;
  void *v81;
  NSObject *v82;
  NSObject *v83;
  NSObject *v84;
  void *v86;
  void *v87;
  void *v88;
  void *v89;
  void *v90;
  uint64_t v91;
  uint64_t v92;
  int v93;
  void *v94;
  BOOL v95;
  void *v96;
  id v97;
  id obj;
  void *v99;
  uint64_t v100;
  void *v101;
  id v102;
  NSObject *loga;
  os_log_t log;
  void *v105;
  _BOOL4 v106;
  void *v107;
  void *v108;
  __int128 v109;
  __int128 v110;
  __int128 v111;
  __int128 v112;
  uint8_t v113[4];
  uint64_t v114;
  uint8_t v115[128];
  uint8_t buf[4];
  void *v117;
  __int16 v118;
  _BYTE v119[10];
  void *v120;
  __int16 v121;
  void *v122;
  uint64_t v123;

  v123 = *MEMORY[0x24BDAC8D0];
  v11 = a3;
  v12 = a4;
  v102 = a5;
  v97 = a6;
  v13 = objc_alloc_init(MEMORY[0x24BDBCEB8]);
  v101 = v11;
  objc_msgSend(v11, "representativeVisit");
  v14 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v12, "representativeVisit");
  v15 = (void *)objc_claimAutoreleasedReturnValue();
  v16 = [TALocationLite alloc];
  objc_msgSend(v14, "departureDate");
  v17 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v14, "coordinate");
  v19 = v18;
  objc_msgSend(v14, "coordinate");
  v21 = v20;
  objc_msgSend(v14, "horizontalAccuracy");
  v91 = -[TALocationLite initWithTimestamp:latitude:longitude:horizontalAccuracy:](v16, "initWithTimestamp:latitude:longitude:horizontalAccuracy:", v17, v19, v21, v22);

  v23 = [TALocationLite alloc];
  objc_msgSend(v15, "arrivalDate");
  v24 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v15, "coordinate");
  v26 = v25;
  objc_msgSend(v15, "coordinate");
  v28 = v27;
  v90 = v15;
  objc_msgSend(v15, "horizontalAccuracy");
  v92 = -[TALocationLite initWithTimestamp:latitude:longitude:horizontalAccuracy:](v23, "initWithTimestamp:latitude:longitude:horizontalAccuracy:", v24, v26, v28, v29);

  if (!a7 && (objc_msgSend(v12, "latestLocationInsideVisit") & 1) == 0)
  {
    v83 = TAStatusLog;
    if (os_log_type_enabled((os_log_t)TAStatusLog, OS_LOG_TYPE_DEFAULT))
    {
      *(_WORD *)buf = 0;
      _os_log_impl(&dword_217877000, v83, OS_LOG_TYPE_DEFAULT, "The latest location infers that we may be leaving the current visit; suppress visit-based detection logic",
        buf,
        2u);
    }
    v81 = (void *)objc_msgSend(v13, "copy");
    goto LABEL_38;
  }
  v30 = objc_msgSend(v102, "minNSigmaBetweenVisits");
  objc_msgSend(v102, "minInterVisitDistance");
  v31 = (void *)v91;
  v32 = (void *)v92;
  if (+[TALocationLite distanceFromLocation:toLocation:satisfyNSigma:satisfyMinDistance:](TALocationLite, "distanceFromLocation:toLocation:satisfyNSigma:satisfyMinDistance:", v91, v92, v30))
  {
    if (!+[TAFilterVisits isReasonableSpeedOfTravelFrom:to:](TAFilterVisits, "isReasonableSpeedOfTravelFrom:to:", v91, v92))
    {
      v84 = TAStatusLog;
      if (os_log_type_enabled((os_log_t)TAStatusLog, OS_LOG_TYPE_DEFAULT))
      {
        *(_WORD *)buf = 0;
        _os_log_impl(&dword_217877000, v84, OS_LOG_TYPE_DEFAULT, "#TAFilterVisits visit-to-visit speed exceeds threshold, not attempting to perform visit detection", buf, 2u);
      }
      v81 = (void *)objc_msgSend(v13, "copy");
      goto LABEL_42;
    }
    v86 = v14;
    v94 = v13;
    +[TAFilterVisits getEntryAddressSetInTAVisitSnapshot:usingSettings:](TAFilterVisits, "getEntryAddressSetInTAVisitSnapshot:usingSettings:", v12, v102);
    v89 = (void *)objc_claimAutoreleasedReturnValue();
    +[TAFilterVisits getExitAddressSetInTAVisitSnapshot:usingSettings:](TAFilterVisits, "getExitAddressSetInTAVisitSnapshot:usingSettings:", v101, v102);
    v88 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v102, "exitDisplayOnBudget");
    objc_msgSend(v101, "getDurationOfVisitExitConsideredWithDisplayOnBudget:");
    v34 = v33;
    objc_msgSend(v12, "getEntryIntervalEvaluatedUntil");
    v87 = (void *)objc_claimAutoreleasedReturnValue();
    v35 = (void *)TAStatusLog;
    v36 = &off_2178C1000;
    v96 = v12;
    v95 = a7;
    if (os_log_type_enabled((os_log_t)TAStatusLog, OS_LOG_TYPE_DEFAULT))
    {
      v37 = (objc_class *)MEMORY[0x24BDBCE60];
      loga = v35;
      v38 = [v37 alloc];
      objc_msgSend(v101, "representativeVisit");
      v107 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v107, "departureDate");
      v105 = (void *)objc_claimAutoreleasedReturnValue();
      v39 = (void *)objc_msgSend(v38, "initWithTimeInterval:sinceDate:", v105, -v34);
      objc_msgSend(v39, "getDateString");
      v99 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v101, "representativeVisit");
      v40 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v40, "departureDate");
      v41 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v41, "getDateString");
      v42 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v96, "representativeVisit");
      v43 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v43, "arrivalDate");
      v44 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v44, "getDateString");
      v45 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v87, "getDateString");
      v46 = (void *)objc_claimAutoreleasedReturnValue();
      *(_DWORD *)buf = 138478595;
      v117 = v99;
      v118 = 2113;
      *(_QWORD *)v119 = v42;
      *(_WORD *)&v119[8] = 2113;
      v120 = v45;
      v121 = 2113;
      v122 = v46;
      _os_log_impl(&dword_217877000, loga, OS_LOG_TYPE_DEFAULT, "#TAFilterVisits past visit window of consideration %{private}@/%{private}@ and current window of consideration %{private}@/%{private}@", buf, 0x2Au);

      v36 = &off_2178C1000;
      v12 = v96;

      a7 = v95;
    }
    +[TAFilterVisits getIntersectionOfFirstSet:andSecondSet:](TAFilterVisits, "getIntersectionOfFirstSet:andSecondSet:", v89, v88);
    v109 = 0u;
    v110 = 0u;
    v111 = 0u;
    v112 = 0u;
    obj = (id)objc_claimAutoreleasedReturnValue();
    log = (os_log_t)objc_msgSend(obj, "countByEnumeratingWithState:objects:count:", &v109, v115, 16);
    if (log)
    {
      v100 = *(_QWORD *)v110;
      v93 = *((_QWORD *)v36 + 378);
      do
      {
        v47 = 0;
        do
        {
          if (*(_QWORD *)v110 != v100)
            objc_enumerationMutation(obj);
          v48 = *(void **)(*((_QWORD *)&v109 + 1) + 8 * (_QWORD)v47);
          objc_msgSend(v12, "latestUtAdvertisements");
          v49 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v49, "objectForKey:", v48);
          v50 = (void *)objc_claimAutoreleasedReturnValue();

          objc_msgSend(v50, "getDate");
          v51 = objc_claimAutoreleasedReturnValue();
          v108 = (void *)v51;
          if (a7)
          {
            v52 = 1;
          }
          else
          {
            objc_msgSend(v97, "timeIntervalSinceDate:", v51);
            v54 = v53;
            objc_msgSend(v102, "maxSuspiciousDuration");
            v52 = v54 < v55;
          }
          v106 = v52;
          objc_msgSend(v101, "earliestUtAdvertisements");
          v56 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v56, "objectForKey:", v48);
          v57 = (void *)objc_claimAutoreleasedReturnValue();

          objc_msgSend(v101, "latestUtAdvertisements");
          v58 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v58, "objectForKey:", v48);
          v59 = (void *)objc_claimAutoreleasedReturnValue();

          objc_msgSend(v12, "earliestUtAdvertisements");
          v60 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v60, "objectForKey:", v48);
          v61 = (void *)objc_claimAutoreleasedReturnValue();

          objc_msgSend(v12, "latestUtAdvertisements");
          v62 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v62, "objectForKey:", v48);
          v63 = (void *)objc_claimAutoreleasedReturnValue();

          if (v57 && v59 && v61 && v63)
          {
            objc_msgSend(v59, "getDate");
            v64 = (void *)objc_claimAutoreleasedReturnValue();
            objc_msgSend(v57, "getDate");
            v65 = (void *)objc_claimAutoreleasedReturnValue();
            objc_msgSend(v64, "timeIntervalSinceDate:", v65);
            v67 = v66;
            objc_msgSend(v102, "minObservationInterval");
            v69 = v68;

            objc_msgSend(v63, "getDate");
            v70 = (void *)objc_claimAutoreleasedReturnValue();
            objc_msgSend(v61, "getDate");
            v71 = (void *)objc_claimAutoreleasedReturnValue();
            objc_msgSend(v70, "timeIntervalSinceDate:", v71);
            v73 = v72;
            objc_msgSend(v102, "minObservationInterval");
            v75 = v74;

            v76 = (void *)TAStatusLog;
            if (os_log_type_enabled((os_log_t)TAStatusLog, OS_LOG_TYPE_DEFAULT))
            {
              v77 = v76;
              objc_msgSend(v48, "hexString");
              v78 = (void *)objc_claimAutoreleasedReturnValue();
              *(_DWORD *)buf = v93;
              v117 = v78;
              v118 = 1025;
              *(_DWORD *)v119 = v106;
              *(_WORD *)&v119[4] = 1025;
              *(_DWORD *)&v119[6] = v67 > v69;
              LOWORD(v120) = 1025;
              *(_DWORD *)((char *)&v120 + 2) = v73 > v75;
              _os_log_impl(&dword_217877000, v77, OS_LOG_TYPE_DEFAULT, "#TAFilterVisits considering %{private}@ based on satisfyFreshObservation:%{private}d satisfyPastVisitObservationDuration:%{private}d satisfyCurrentVisitObservationDuration:%{private}d", buf, 0x1Eu);

            }
            v79 = v67 > v69 && v106;
            v12 = v96;
            a7 = v95;
            if (v79 && v73 > v75)
              objc_msgSend(v94, "addObject:", v50);
          }
          else
          {
            v80 = (void *)TAStatusLog;
            if (os_log_type_enabled((os_log_t)TAStatusLog, OS_LOG_TYPE_FAULT))
              +[TAFilterVisits getSuspiciousDeviceAdvertisementsFromVisitSnapshot:toVisitSnapshot:settings:currentClockTime:skipFreshObservationCheck:].cold.1(v113, v80, v48, &v114);
          }

          v47 = (os_log_t)((char *)v47 + 1);
        }
        while (log != v47);
        log = (os_log_t)objc_msgSend(obj, "countByEnumeratingWithState:objects:count:", &v109, v115, 16);
      }
      while (log);
    }
    v13 = v94;
    v81 = (void *)objc_msgSend(v94, "copy");

    v14 = v86;
LABEL_38:
    v31 = (void *)v91;
LABEL_42:
    v32 = (void *)v92;
    goto LABEL_43;
  }
  v82 = TAStatusLog;
  if (os_log_type_enabled((os_log_t)TAStatusLog, OS_LOG_TYPE_DEFAULT))
  {
    *(_WORD *)buf = 0;
    _os_log_impl(&dword_217877000, v82, OS_LOG_TYPE_DEFAULT, "Current and past visits are not far enough to be considered for UT", buf, 2u);
  }
  v81 = (void *)objc_msgSend(v13, "copy");
LABEL_43:

  return v81;
}

+ (id)getEntryAddressSetInTAVisitSnapshot:(id)a3 usingSettings:(id)a4
{
  id v5;
  void *v6;
  void *v7;
  void *v8;
  void *v9;

  v5 = a3;
  v6 = (void *)MEMORY[0x24BDBCF20];
  if (v5)
  {
    objc_msgSend(a4, "entryDisplayOnBudget");
    objc_msgSend(v5, "getEntryAdvertisementsWithDisplayOnBudget:");
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v7, "allKeys");
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v6, "setWithArray:", v8);
    v9 = (void *)objc_claimAutoreleasedReturnValue();

  }
  else
  {
    objc_msgSend(MEMORY[0x24BDBCF20], "set");
    v9 = (void *)objc_claimAutoreleasedReturnValue();
  }

  return v9;
}

+ (id)getExitAddressSetInTAVisitSnapshot:(id)a3 usingSettings:(id)a4
{
  id v5;
  void *v6;
  void *v7;
  void *v8;
  void *v9;

  v5 = a3;
  v6 = (void *)MEMORY[0x24BDBCF20];
  if (v5)
  {
    objc_msgSend(a4, "exitDisplayOnBudget");
    objc_msgSend(v5, "getExitAdvertisementsWithDisplayOnBudget:");
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v7, "allKeys");
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v6, "setWithArray:", v8);
    v9 = (void *)objc_claimAutoreleasedReturnValue();

  }
  else
  {
    objc_msgSend(MEMORY[0x24BDBCF20], "set");
    v9 = (void *)objc_claimAutoreleasedReturnValue();
  }

  return v9;
}

+ (id)getAddressSetInTAVisitSnapshot:(id)a3
{
  void *v3;
  void *v4;
  void *v5;
  void *v6;

  v3 = (void *)MEMORY[0x24BDBCF20];
  if (a3)
  {
    objc_msgSend(a3, "latestUtAdvertisements");
    v4 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v4, "allKeys");
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v3, "setWithArray:", v5);
    v6 = (void *)objc_claimAutoreleasedReturnValue();

  }
  else
  {
    objc_msgSend(MEMORY[0x24BDBCF20], "set");
    v6 = (void *)objc_claimAutoreleasedReturnValue();
  }
  return v6;
}

+ (id)getIntersectionOfFirstSet:(id)a3 andSecondSet:(id)a4
{
  id v5;
  void *v6;
  void *v7;

  v5 = a4;
  v6 = v5;
  if (a3 && v5)
  {
    objc_msgSend(MEMORY[0x24BDBCEF0], "setWithSet:", a3);
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v7, "intersectSet:", v6);
  }
  else
  {
    objc_msgSend(MEMORY[0x24BDBCF20], "set");
    v7 = (void *)objc_claimAutoreleasedReturnValue();
  }

  return v7;
}

+ (BOOL)isReasonableSpeedOfTravelFrom:(id)a3 to:(id)a4
{
  double v4;

  +[TALocationLite estimateSpeedFrom:to:](TALocationLite, "estimateSpeedFrom:to:", a3, a4);
  return v4 < 50.0 && v4 >= 0.0;
}

+ (unint64_t)identifyDetectionTypeWithStore:(id)a3 settings:(id)a4
{
  id v5;
  void *v6;
  void *v7;
  void *v8;
  unint64_t v9;
  void *v10;
  void *v11;
  void *v12;
  int v13;
  unint64_t v14;

  v5 = a4;
  objc_msgSend(a3, "visitState");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v6, "visitSnapshotBuffer");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v7, "lastObject");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  v9 = objc_msgSend(v8, "loiType");

  v10 = (void *)TAStatusLog;
  if (os_log_type_enabled((os_log_t)TAStatusLog, OS_LOG_TYPE_DEBUG))
    +[TAFilterVisits identifyDetectionTypeWithStore:settings:].cold.1(v10, v9, v5);
  objc_msgSend(v5, "sensitiveLOITypes");
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  v12 = (void *)objc_msgSend(objc_alloc(MEMORY[0x24BDD16E0]), "initWithUnsignedInteger:", v9);
  v13 = objc_msgSend(v11, "containsObject:", v12);

  if (v13)
    v14 = 5;
  else
    v14 = 4;

  return v14;
}

+ (BOOL)sensitiveVisitsTooCloseBetweenFromLOIType:(unint64_t)a3 toLOIType:(unint64_t)a4 distance:(double)a5 settings:(id)a6
{
  id v9;
  void *v10;
  void *v11;
  int v12;
  void *v13;
  void *v14;
  int v15;
  int v16;
  NSObject *v17;
  _DWORD v19[2];
  __int16 v20;
  const char *v21;
  __int16 v22;
  int v23;
  __int16 v24;
  int v25;
  __int16 v26;
  _BOOL4 v27;
  __int16 v28;
  int v29;
  uint64_t v30;

  v30 = *MEMORY[0x24BDAC8D0];
  if (a6)
  {
    v9 = a6;
    objc_msgSend(v9, "sensitiveLOITypes");
    v10 = (void *)objc_claimAutoreleasedReturnValue();
    v11 = (void *)objc_msgSend(objc_alloc(MEMORY[0x24BDD16E0]), "initWithUnsignedInteger:", a3);
    v12 = objc_msgSend(v10, "containsObject:", v11);

    objc_msgSend(v9, "sensitiveLOITypes");
    v13 = (void *)objc_claimAutoreleasedReturnValue();

    v14 = (void *)objc_msgSend(objc_alloc(MEMORY[0x24BDD16E0]), "initWithUnsignedInteger:", a4);
    v15 = objc_msgSend(v13, "containsObject:", v14);

    if (250.0 + 250.0 > a5)
      v16 = v12 & v15;
    else
      v16 = 0;
    v17 = TAStatusLog;
    if (os_log_type_enabled((os_log_t)TAStatusLog, OS_LOG_TYPE_DEFAULT))
    {
      v19[0] = 68290051;
      v19[1] = 0;
      v20 = 2082;
      v21 = "";
      v22 = 1025;
      v23 = v12;
      v24 = 1025;
      v25 = v15;
      v26 = 1025;
      v27 = 250.0 + 250.0 > a5;
      v28 = 1025;
      v29 = v16;
      _os_log_impl(&dword_217877000, v17, OS_LOG_TYPE_DEFAULT, "{\"msg%{public}.0s\":\"#TAFilterVisits shouldDetectWithPastLOIType:currentLOIType:distance:settings:\", \"pastIsSensitiveVisit\":%{private}hhd, \"currentIsSensitiveVisit\":%{private}hhd, \"pastAndCurrentTooClose\":%{private}hhd, \"sensitiveVisitTooClose\":%{private}hhd}", (uint8_t *)v19, 0x2Au);
    }
  }
  else
  {
    LOBYTE(v16) = 0;
  }
  return v16;
}

+ (void)getSuspiciousDeviceAdvertisementsFromVisitSnapshot:(void *)a3 toVisitSnapshot:(_QWORD *)a4 settings:currentClockTime:skipFreshObservationCheck:.cold.1(uint8_t *a1, void *a2, void *a3, _QWORD *a4)
{
  NSObject *v7;
  void *v8;

  v7 = a2;
  objc_msgSend(a3, "hexString");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  *(_DWORD *)a1 = 138477827;
  *a4 = v8;
  _os_log_fault_impl(&dword_217877000, v7, OS_LOG_TYPE_FAULT, "#TAFilterVisits some advertisements not present for %{private}@", a1, 0xCu);

}

+ (void)identifyDetectionTypeWithStore:(void *)a3 settings:.cold.1(void *a1, unint64_t a2, void *a3)
{
  NSObject *v5;
  void *v6;
  void *v7;
  int v8;
  void *v9;
  __int16 v10;
  void *v11;
  uint64_t v12;

  v12 = *MEMORY[0x24BDAC8D0];
  v5 = a1;
  TALocationOfInterestTypeToString(a2);
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(a3, "sensitiveLOITypesToString");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  v8 = 138478083;
  v9 = v6;
  v10 = 2113;
  v11 = v7;
  _os_log_debug_impl(&dword_217877000, v5, OS_LOG_TYPE_DEBUG, "#TAFilterVisits LOI type is %{private}@ and sensitive LOI list contains %{private}@", (uint8_t *)&v8, 0x16u);

}

@end
