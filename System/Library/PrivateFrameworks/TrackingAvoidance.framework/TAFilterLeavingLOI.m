@implementation TAFilterLeavingLOI

+ (id)filterSuspiciousDeviceWithStore:(id)a3 leavingLOISettings:(id)a4 andAppendOutgoingRequestsTo:(id)a5
{
  id v6;
  TAFilterLeavingLOISettings *v7;
  void *v8;
  void *v9;
  uint64_t v10;
  void *v11;
  void *v12;
  void *v13;
  void *v14;
  uint64_t v15;
  void *v16;
  void *v17;
  void *v18;
  uint64_t v19;
  void *v20;
  void *v21;
  void *v22;
  void *v23;
  NSObject *v24;
  uint64_t i;
  void *v26;
  void *v27;
  void *v28;
  uint64_t v29;
  void *v30;
  double v31;
  double v32;
  void *v33;
  double v34;
  double v35;
  void *v36;
  void *v37;
  void *v38;
  void *v39;
  void *v40;
  void *v41;
  double v42;
  double v43;
  void *v44;
  double v45;
  double v46;
  void *v47;
  void *v48;
  double v49;
  double v50;
  double v51;
  double v52;
  double v53;
  double v54;
  double v55;
  double v56;
  int v57;
  int v58;
  void *v59;
  void *v60;
  uint64_t v61;
  objc_class *v62;
  void *v63;
  void *v64;
  void *v65;
  void *v66;
  void *v67;
  void *v68;
  void *v69;
  void *v70;
  void *v71;
  uint64_t v72;
  void *v73;
  void *v74;
  void *v75;
  void *v76;
  void *v77;
  void *v78;
  uint64_t v79;
  void *v80;
  void *v81;
  void *v82;
  void *v83;
  void *v84;
  int v85;
  NSObject *v86;
  void *v87;
  unint64_t v88;
  TAMetricsDetection *v89;
  TASuspiciousDevice *v90;
  void *v91;
  void *v92;
  void *v93;
  void *v94;
  TASuspiciousDevice *v95;
  void *v97;
  void *v98;
  id v99;
  void *v100;
  unint64_t v101;
  TASingleVisitDetectionMetrics *v102;
  void *v103;
  TAFilterLeavingLOISettings *v104;
  void *v105;
  void *v106;
  void *v107;
  id obj;
  void *v109;
  void *v110;
  uint64_t v111;
  uint64_t v112;
  void *v113;
  __int128 v114;
  __int128 v115;
  __int128 v116;
  __int128 v117;
  uint8_t buf[4];
  uint64_t v119;
  __int16 v120;
  _BOOL4 v121;
  __int16 v122;
  _BOOL4 v123;
  __int16 v124;
  int v125;
  __int16 v126;
  _BOOL4 v127;
  _QWORD v128[5];
  _QWORD v129[5];
  _BYTE v130[16];
  _BYTE v131[16];
  _BYTE v132[16];
  _BYTE v133[128];
  uint64_t v134;

  v134 = *MEMORY[0x24BDAC8D0];
  v6 = a3;
  v7 = (TAFilterLeavingLOISettings *)a4;
  v99 = objc_alloc_init(MEMORY[0x24BDBCEB8]);
  if (+[TAFilterLeavingLOI shouldDetectWithStore:filterLeavingLOISettings:](TAFilterLeavingLOI, "shouldDetectWithStore:filterLeavingLOISettings:", v6, v7))
  {
    if (!v7)
      v7 = -[TAFilterLeavingLOISettings initWithDefaults]([TAFilterLeavingLOISettings alloc], "initWithDefaults");
    objc_msgSend(v6, "visitState");
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v8, "visitSnapshotBuffer");
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v9, "lastObject");
    v10 = objc_claimAutoreleasedReturnValue();

    v106 = v6;
    objc_msgSend(v6, "visitState");
    v11 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v11, "interVisitMetricSnapshotBuffer");
    v12 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v12, "lastObject");
    v13 = (void *)objc_claimAutoreleasedReturnValue();

    -[TAFilterLeavingLOISettings visitsSettings](v7, "visitsSettings");
    v14 = (void *)objc_claimAutoreleasedReturnValue();
    v107 = (void *)v10;
    +[TAFilterVisits getExitAddressSetInTAVisitSnapshot:usingSettings:](TAFilterVisits, "getExitAddressSetInTAVisitSnapshot:usingSettings:", v10, v14);
    v15 = objc_claimAutoreleasedReturnValue();

    v16 = (void *)MEMORY[0x24BDBCF20];
    objc_msgSend(v13, "accumulatedDeviceMetrics");
    v17 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v17, "allKeys");
    v18 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v16, "setWithArray:", v18);
    v19 = objc_claimAutoreleasedReturnValue();

    v20 = (void *)TAStatusLog;
    if (os_log_type_enabled((os_log_t)TAStatusLog, OS_LOG_TYPE_DEBUG))
      +[TAFilterLeavingLOI filterSuspiciousDeviceWithStore:leavingLOISettings:andAppendOutgoingRequestsTo:].cold.5(v20);
    v21 = (void *)TAStatusLog;
    if (os_log_type_enabled((os_log_t)TAStatusLog, OS_LOG_TYPE_DEBUG))
      +[TAFilterLeavingLOI filterSuspiciousDeviceWithStore:leavingLOISettings:andAppendOutgoingRequestsTo:].cold.4(v21);
    v97 = (void *)v19;
    v98 = (void *)v15;
    +[TAFilterVisits getIntersectionOfFirstSet:andSecondSet:](TAFilterVisits, "getIntersectionOfFirstSet:andSecondSet:", v15, v19);
    v22 = (void *)objc_claimAutoreleasedReturnValue();
    v23 = (void *)TAStatusLog;
    if (os_log_type_enabled((os_log_t)TAStatusLog, OS_LOG_TYPE_DEFAULT))
    {
      v24 = v23;
      *(_DWORD *)buf = 134349056;
      v119 = objc_msgSend(v22, "count");
      _os_log_impl(&dword_217877000, v24, OS_LOG_TYPE_DEFAULT, "#TAFilterLeavingLOI identified %{public}lu suspicious candidates ...", buf, 0xCu);

    }
    v116 = 0u;
    v117 = 0u;
    v114 = 0u;
    v115 = 0u;
    obj = v22;
    v112 = objc_msgSend(obj, "countByEnumeratingWithState:objects:count:", &v114, v133, 16);
    if (v112)
    {
      v111 = *(_QWORD *)v115;
      v104 = v7;
      v100 = v13;
      do
      {
        for (i = 0; i != v112; ++i)
        {
          if (*(_QWORD *)v115 != v111)
            objc_enumerationMutation(obj);
          v26 = *(void **)(*((_QWORD *)&v114 + 1) + 8 * i);
          objc_msgSend(v13, "lastAdvPerDevice");
          v27 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v27, "objectForKey:", v26);
          v28 = (void *)objc_claimAutoreleasedReturnValue();

          if (v28)
          {
            objc_msgSend(v28, "getDate");
            v29 = objc_claimAutoreleasedReturnValue();
            objc_msgSend(v6, "clock");
            v30 = (void *)objc_claimAutoreleasedReturnValue();
            v113 = (void *)v29;
            objc_msgSend(v30, "timeIntervalSinceDate:", v29);
            v32 = v31;
            -[TAFilterLeavingLOISettings visitsSettings](v7, "visitsSettings");
            v33 = (void *)objc_claimAutoreleasedReturnValue();
            objc_msgSend(v33, "maxSuspiciousDuration");
            v35 = v34;

            if (v32 >= v35)
            {
              v81 = (void *)TAStatusLog;
              v82 = v113;
              if (os_log_type_enabled((os_log_t)TAStatusLog, OS_LOG_TYPE_DEBUG))
                +[TAFilterLeavingLOI filterSuspiciousDeviceWithStore:leavingLOISettings:andAppendOutgoingRequestsTo:].cold.3((uint64_t)v131, v81);
            }
            else
            {
              objc_msgSend(v107, "earliestUtAdvertisements");
              v36 = (void *)objc_claimAutoreleasedReturnValue();
              objc_msgSend(v36, "objectForKey:", v26);
              v37 = (void *)objc_claimAutoreleasedReturnValue();

              objc_msgSend(v107, "latestUtAdvertisements");
              v38 = (void *)objc_claimAutoreleasedReturnValue();
              objc_msgSend(v38, "objectForKey:", v26);
              v39 = (void *)objc_claimAutoreleasedReturnValue();

              v109 = v39;
              v110 = v37;
              if (v37 && v39)
              {
                objc_msgSend(v39, "getDate");
                v40 = (void *)objc_claimAutoreleasedReturnValue();
                objc_msgSend(v37, "getDate");
                v41 = (void *)objc_claimAutoreleasedReturnValue();
                objc_msgSend(v40, "timeIntervalSinceDate:", v41);
                v43 = v42;
                -[TAFilterLeavingLOISettings visitsSettings](v7, "visitsSettings");
                v44 = (void *)objc_claimAutoreleasedReturnValue();
                objc_msgSend(v44, "minObservationInterval");
                v46 = v45;

                objc_msgSend(v13, "accumulatedDeviceMetrics");
                v47 = (void *)objc_claimAutoreleasedReturnValue();
                objc_msgSend(v47, "objectForKey:", v26);
                v48 = (void *)objc_claimAutoreleasedReturnValue();

                objc_msgSend(v48, "distance");
                v50 = v49;
                -[TAFilterLeavingLOISettings thresholdOfSignificantDistance](v7, "thresholdOfSignificantDistance");
                v52 = v51;
                objc_msgSend(v48, "duration");
                v54 = v53;
                -[TAFilterLeavingLOISettings thresholdOfSignificantDuration](v7, "thresholdOfSignificantDuration");
                v56 = v55;
                v57 = objc_msgSend(v48, "segmentSpeedExceedsLimit");
                v58 = v57;
                if (v50 <= v52 || v54 <= v56 || (v57 & 1) != 0 || v43 <= v46)
                {
                  v84 = (void *)TAStatusLog;
                  if (os_log_type_enabled((os_log_t)TAStatusLog, OS_LOG_TYPE_DEFAULT))
                  {
                    v85 = v58 ^ 1;
                    v86 = v84;
                    objc_msgSend(v26, "hexString");
                    v87 = (void *)objc_claimAutoreleasedReturnValue();
                    *(_DWORD *)buf = 138478851;
                    v119 = (uint64_t)v87;
                    v120 = 1026;
                    v121 = v50 > v52;
                    v13 = v100;
                    v122 = 1026;
                    v123 = v54 > v56;
                    v124 = 1026;
                    v125 = v85;
                    v6 = v106;
                    v126 = 1026;
                    v127 = v43 > v46;
                    v7 = v104;
                    _os_log_impl(&dword_217877000, v86, OS_LOG_TYPE_DEFAULT, "#TAFilterLeavingLOI not adding %{private}@ because satisfy-length=%{public}d satisfy-duration=%{public}d satisfy-speed=%{public}d  satisfy-min-observation-duration=%{public}d", buf, 0x24u);

                  }
                }
                else
                {
                  objc_msgSend(v13, "lastAdvPerDevice");
                  v59 = (void *)objc_claimAutoreleasedReturnValue();
                  objc_msgSend(v59, "objectForKey:", v26);
                  v105 = v48;
                  v60 = (void *)objc_claimAutoreleasedReturnValue();

                  v61 = objc_msgSend(v107, "loiType");
                  v128[0] = CFSTR("DetectionAlgorithm");
                  v62 = (objc_class *)objc_opt_class();
                  NSStringFromClass(v62);
                  v63 = (void *)objc_claimAutoreleasedReturnValue();
                  v129[0] = v63;
                  v128[1] = CFSTR("LastObservation");
                  objc_msgSend(v60, "descriptionDictionary");
                  v64 = (void *)objc_claimAutoreleasedReturnValue();
                  v129[1] = v64;
                  v128[2] = CFSTR("LengthTraveled");
                  v65 = (void *)MEMORY[0x24BDD16E0];
                  objc_msgSend(v105, "distance");
                  objc_msgSend(v65, "numberWithDouble:");
                  v66 = (void *)objc_claimAutoreleasedReturnValue();
                  v129[2] = v66;
                  v128[3] = CFSTR("Duration");
                  v67 = (void *)MEMORY[0x24BDD16E0];
                  objc_msgSend(v105, "duration");
                  objc_msgSend(v67, "numberWithDouble:");
                  v68 = (void *)objc_claimAutoreleasedReturnValue();
                  v129[3] = v68;
                  v128[4] = CFSTR("LOIType");
                  objc_msgSend(MEMORY[0x24BDD16E0], "numberWithUnsignedInteger:", v61);
                  v69 = (void *)objc_claimAutoreleasedReturnValue();
                  v129[4] = v69;
                  objc_msgSend(MEMORY[0x24BDBCE70], "dictionaryWithObjects:forKeys:count:", v129, v128, 5);
                  v103 = (void *)objc_claimAutoreleasedReturnValue();

                  objc_msgSend(v106, "visitState");
                  v70 = (void *)objc_claimAutoreleasedReturnValue();
                  objc_msgSend(v70, "visitSnapshotBuffer");
                  v71 = (void *)objc_claimAutoreleasedReturnValue();
                  v72 = objc_msgSend(v71, "count") - 2;

                  objc_msgSend(v106, "visitState");
                  v73 = (void *)objc_claimAutoreleasedReturnValue();
                  objc_msgSend(v73, "visitSnapshotBuffer");
                  v74 = (void *)objc_claimAutoreleasedReturnValue();
                  objc_msgSend(v74, "getObjectAtIndex:", v72);
                  v75 = (void *)objc_claimAutoreleasedReturnValue();

                  if (v75)
                  {
                    objc_msgSend(v106, "visitState");
                    v76 = (void *)objc_claimAutoreleasedReturnValue();
                    objc_msgSend(v76, "visitSnapshotBuffer");
                    v77 = (void *)objc_claimAutoreleasedReturnValue();
                    objc_msgSend(v77, "getObjectAtIndex:", v72);
                    v78 = (void *)objc_claimAutoreleasedReturnValue();
                    v79 = objc_msgSend(v78, "loiType");

                  }
                  else
                  {
                    v79 = 0;
                  }
                  v88 = +[TAFilterLeavingLOI getLeavingLOIDetectionTypeForLOIType:](TAFilterLeavingLOI, "getLeavingLOIDetectionTypeForLOIType:", v61);
                  v101 = +[TAFilterLeavingLOI getLeavingLOINotificationImmediacyTypeForLOIType:leavingLOISettings:](TAFilterLeavingLOI, "getLeavingLOINotificationImmediacyTypeForLOIType:leavingLOISettings:", v61, v104);
                  v102 = -[TASingleVisitDetectionMetrics initWithInterVisitMetrics:loiType:previousVisitType:]([TASingleVisitDetectionMetrics alloc], "initWithInterVisitMetrics:loiType:previousVisitType:", v105, v61, v79);
                  v89 = -[TAMetricsDetection initWithDetectionType:visitDetectionMetrics:generalDetectionMetrics:singleVisitDetectionMetrics:latestAdvertisement:]([TAMetricsDetection alloc], "initWithDetectionType:visitDetectionMetrics:generalDetectionMetrics:singleVisitDetectionMetrics:latestAdvertisement:", v88, 0, 0, v102, v60);
                  v90 = [TASuspiciousDevice alloc];
                  objc_msgSend(v106, "clock");
                  v91 = (void *)objc_claimAutoreleasedReturnValue();
                  objc_msgSend(v105, "sampledObservedLocations");
                  v92 = (void *)objc_claimAutoreleasedReturnValue();
                  objc_msgSend(v106, "deviceRecord");
                  v93 = (void *)objc_claimAutoreleasedReturnValue();
                  objc_msgSend(v93, "getAccessoryInfo:", v26);
                  v94 = (void *)objc_claimAutoreleasedReturnValue();
                  v95 = -[TASuspiciousDevice initWithLatestAdv:detectionSummary:date:locHistory:detectionMetrics:detectionType:immediacyType:accessoryInfo:forceSurfaceReason:](v90, "initWithLatestAdv:detectionSummary:date:locHistory:detectionMetrics:detectionType:immediacyType:accessoryInfo:forceSurfaceReason:", v60, v103, v91, v92, v89, v88, v101, v94, 0);
                  objc_msgSend(v99, "addObject:", v95);

                  v6 = v106;
                  v7 = v104;

                  v48 = v105;
                  v13 = v100;
                }

                v82 = v113;
              }
              else
              {
                v83 = (void *)TAStatusLog;
                v82 = v113;
                if (os_log_type_enabled((os_log_t)TAStatusLog, OS_LOG_TYPE_FAULT))
                  +[TAFilterLeavingLOI filterSuspiciousDeviceWithStore:leavingLOISettings:andAppendOutgoingRequestsTo:].cold.1((uint64_t)v130, v83);
              }

            }
          }
          else
          {
            v80 = (void *)TAStatusLog;
            if (os_log_type_enabled((os_log_t)TAStatusLog, OS_LOG_TYPE_FAULT))
              +[TAFilterLeavingLOI filterSuspiciousDeviceWithStore:leavingLOISettings:andAppendOutgoingRequestsTo:].cold.1((uint64_t)v132, v80);
          }

        }
        v112 = objc_msgSend(obj, "countByEnumeratingWithState:objects:count:", &v114, v133, 16);
      }
      while (v112);
    }

  }
  return v99;
}

+ (unint64_t)getLeavingLOIDetectionTypeForLOIType:(unint64_t)a3
{
  if (a3 > 2)
    return 0;
  else
    return qword_2178C1B60[a3];
}

+ (unint64_t)getLeavingLOINotificationImmediacyTypeForLOIType:(unint64_t)a3 leavingLOISettings:(id)a4
{
  id v5;
  void *v6;
  uint64_t v7;
  unint64_t v8;

  v5 = a4;
  v6 = v5;
  if (a3 == 1)
  {
    v7 = objc_msgSend(v5, "leavingHomeImmediacyType");
  }
  else
  {
    if (a3 != 2)
    {
      v8 = 0;
      goto LABEL_7;
    }
    v7 = objc_msgSend(v5, "leavingWorkImmediacyType");
  }
  v8 = v7;
LABEL_7:

  return v8;
}

+ (BOOL)shouldDetectWithStore:(id)a3 filterLeavingLOISettings:(id)a4
{
  id v5;
  id v6;
  void *v7;
  void *v8;
  uint64_t v9;
  void *v10;
  void *v11;
  uint64_t v12;
  unint64_t v13;
  void *v14;
  void *v15;
  void *v16;
  void *v17;
  uint64_t v18;
  void *v19;
  void *v20;
  void *v21;
  int v22;
  void *v23;
  void *v24;
  void *v25;
  char v26;
  char v27;
  void *v28;

  v5 = a3;
  v6 = a4;
  if (!v5)
    goto LABEL_9;
  objc_msgSend(v5, "visitState");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v7, "visitSnapshotBuffer");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  v9 = objc_msgSend(v8, "count");

  if (!v9)
    goto LABEL_9;
  objc_msgSend(v5, "visitState");
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v10, "visitSnapshotBuffer");
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v11, "lastObject");
  v12 = objc_claimAutoreleasedReturnValue();
  v13 = objc_msgSend((id)v12, "loiType");

  objc_msgSend(v6, "enabledLoiTypes");
  v14 = (void *)objc_claimAutoreleasedReturnValue();
  v15 = (void *)objc_msgSend(objc_alloc(MEMORY[0x24BDD16E0]), "initWithUnsignedInteger:", v13);
  LOBYTE(v12) = objc_msgSend(v14, "containsObject:", v15);

  if ((v12 & 1) == 0)
  {
    v28 = (void *)TAStatusLog;
    if (os_log_type_enabled((os_log_t)TAStatusLog, OS_LOG_TYPE_DEBUG))
      +[TAFilterLeavingLOI shouldDetectWithStore:filterLeavingLOISettings:].cold.1(v28, v13, v6);
    goto LABEL_9;
  }
  objc_msgSend(v5, "visitState");
  v16 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v16, "interVisitMetricSnapshotBuffer");
  v17 = (void *)objc_claimAutoreleasedReturnValue();
  v18 = objc_msgSend(v17, "count");

  if (!v18)
    goto LABEL_9;
  objc_msgSend(v5, "visitState");
  v19 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v19, "visitSnapshotBuffer");
  v20 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v20, "lastObject");
  v21 = (void *)objc_claimAutoreleasedReturnValue();
  v22 = objc_msgSend(v21, "isClosed");

  if (!v22)
  {
LABEL_9:
    v27 = 0;
    goto LABEL_10;
  }
  objc_msgSend(v5, "visitState");
  v23 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v23, "interVisitMetricSnapshotBuffer");
  v24 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v24, "lastObject");
  v25 = (void *)objc_claimAutoreleasedReturnValue();
  v26 = objc_msgSend(v25, "isClosed");

  v27 = v26 ^ 1;
LABEL_10:

  return v27;
}

+ (void)filterSuspiciousDeviceWithStore:(uint64_t)a1 leavingLOISettings:(void *)a2 andAppendOutgoingRequestsTo:.cold.1(uint64_t a1, void *a2)
{
  _QWORD *v2;
  void *v3;
  _DWORD *v4;
  id v5;
  void *v6;
  uint64_t v7;
  uint64_t v8;

  v5 = OUTLINED_FUNCTION_1(a1, a2);
  objc_msgSend(v3, "hexString");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  *v4 = 138477827;
  *v2 = v6;
  OUTLINED_FUNCTION_3(&dword_217877000, v7, v8, "#TAFilterLeavingLOI some advertisements not present for %{private}@");

  OUTLINED_FUNCTION_2();
}

+ (void)filterSuspiciousDeviceWithStore:(uint64_t)a1 leavingLOISettings:(void *)a2 andAppendOutgoingRequestsTo:.cold.3(uint64_t a1, void *a2)
{
  _QWORD *v2;
  void *v3;
  uint8_t *v4;
  NSObject *v5;
  void *v6;

  v5 = OUTLINED_FUNCTION_1(a1, a2);
  objc_msgSend(v3, "hexString");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  *(_DWORD *)v4 = 138477827;
  *v2 = v6;
  _os_log_debug_impl(&dword_217877000, v5, OS_LOG_TYPE_DEBUG, "#TAFilterLeavingLOI does not satisfy recent observation requirement for %{private}@", v4, 0xCu);

  OUTLINED_FUNCTION_2();
}

+ (void)filterSuspiciousDeviceWithStore:(void *)a1 leavingLOISettings:andAppendOutgoingRequestsTo:.cold.4(void *a1)
{
  void *v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;

  OUTLINED_FUNCTION_6(a1);
  OUTLINED_FUNCTION_5();
  OUTLINED_FUNCTION_1_0(&dword_217877000, v2, v3, "#TAFilterLeavingLOI observed %{public}lu devices after last visit", v4, v5, v6, v7, 0);

  OUTLINED_FUNCTION_4();
}

+ (void)filterSuspiciousDeviceWithStore:(void *)a1 leavingLOISettings:andAppendOutgoingRequestsTo:.cold.5(void *a1)
{
  void *v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;

  OUTLINED_FUNCTION_6(a1);
  OUTLINED_FUNCTION_5();
  OUTLINED_FUNCTION_1_0(&dword_217877000, v2, v3, "#TAFilterLeavingLOI observed %{public}lu devices in last visit", v4, v5, v6, v7, 0);

  OUTLINED_FUNCTION_4();
}

+ (void)shouldDetectWithStore:(void *)a3 filterLeavingLOISettings:.cold.1(void *a1, unint64_t a2, void *a3)
{
  NSObject *v5;
  void *v6;
  void *v7;
  int v8;
  void *v9;
  __int16 v10;
  void *v11;

  v5 = OUTLINED_FUNCTION_6(a1);
  TALocationOfInterestTypeToString(a2);
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(a3, "enabledLoiTypesToString");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  v8 = 138478083;
  v9 = v6;
  v10 = 2113;
  v11 = v7;
  _os_log_debug_impl(&dword_217877000, v5, OS_LOG_TYPE_DEBUG, "#TAFilterLeavingLOI LOI type %{private}@ is not in the enabled list %{private}@", (uint8_t *)&v8, 0x16u);

}

@end
