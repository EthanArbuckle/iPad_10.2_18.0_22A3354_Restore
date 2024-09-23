@implementation TAFilterSingleVisit

+ (BOOL)shouldDetectWithStore:(id)a3 filterSingleVisitSettings:(id)a4
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
  char v22;
  void *v23;
  void *v24;
  void *v25;
  char v26;
  char v27;
  NSObject *v28;
  const char *v29;
  void *v30;
  int v32;
  int v33;
  __int16 v34;
  const char *v35;
  uint64_t v36;

  v36 = *MEMORY[0x24BDAC8D0];
  v5 = a3;
  v6 = a4;
  if (!v5)
    goto LABEL_16;
  objc_msgSend(v5, "visitState");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v7, "visitSnapshotBuffer");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  v9 = objc_msgSend(v8, "count");

  if (!v9)
  {
    v28 = TAStatusLog;
    if (!os_log_type_enabled((os_log_t)TAStatusLog, OS_LOG_TYPE_DEBUG))
      goto LABEL_16;
    v32 = 68289026;
    v33 = 0;
    v34 = 2082;
    v35 = "";
    v29 = "{\"msg%{public}.0s\":\"#TAFilterSingleVisit no snapshots\"}";
LABEL_15:
    _os_log_impl(&dword_217877000, v28, OS_LOG_TYPE_DEBUG, v29, (uint8_t *)&v32, 0x12u);
    goto LABEL_16;
  }
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
    v30 = (void *)TAStatusLog;
    if (os_log_type_enabled((os_log_t)TAStatusLog, OS_LOG_TYPE_DEBUG))
      +[TAFilterSingleVisit shouldDetectWithStore:filterSingleVisitSettings:].cold.1(v30, v13, v6);
    goto LABEL_16;
  }
  objc_msgSend(v5, "visitState");
  v16 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v16, "interVisitMetricSnapshotBuffer");
  v17 = (void *)objc_claimAutoreleasedReturnValue();
  v18 = objc_msgSend(v17, "count");

  if (!v18)
  {
    v28 = TAStatusLog;
    if (!os_log_type_enabled((os_log_t)TAStatusLog, OS_LOG_TYPE_DEBUG))
      goto LABEL_16;
    v32 = 68289026;
    v33 = 0;
    v34 = 2082;
    v35 = "";
    v29 = "{\"msg%{public}.0s\":\"#TAFilterSingleVisit no intervisit snapshots\"}";
    goto LABEL_15;
  }
  objc_msgSend(v5, "visitState");
  v19 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v19, "interVisitMetricSnapshotBuffer");
  v20 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v20, "lastObject");
  v21 = (void *)objc_claimAutoreleasedReturnValue();
  v22 = objc_msgSend(v21, "isClosed");

  if ((v22 & 1) == 0)
  {
    v28 = TAStatusLog;
    if (os_log_type_enabled((os_log_t)TAStatusLog, OS_LOG_TYPE_DEBUG))
    {
      v32 = 68289026;
      v33 = 0;
      v34 = 2082;
      v35 = "";
      v29 = "{\"msg%{public}.0s\":\"#TAFilterSingleVisit last snapshot not closed\"}";
      goto LABEL_15;
    }
LABEL_16:
    v27 = 0;
    goto LABEL_17;
  }
  objc_msgSend(v5, "visitState");
  v23 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v23, "visitSnapshotBuffer");
  v24 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v24, "lastObject");
  v25 = (void *)objc_claimAutoreleasedReturnValue();
  v26 = objc_msgSend(v25, "isClosed");

  v27 = v26 ^ 1;
LABEL_17:

  return v27;
}

+ (id)filterSuspiciousDeviceWithStore:(id)a3 singleVisitSettings:(id)a4 andAppendOutgoingRequestsTo:(id)a5
{
  id v6;
  TAFilterSingleVisitSettings *v7;
  void *v8;
  void *v9;
  void *v10;
  void *v11;
  TALocationLite *v12;
  void *v13;
  double v14;
  double v15;
  double v16;
  double v17;
  double v18;
  void *v19;
  void *v20;
  void *v21;
  void *v22;
  uint64_t v23;
  void *v24;
  void *v25;
  void *v26;
  uint64_t v27;
  void *v28;
  void *v29;
  void *v30;
  void *v31;
  NSObject *v32;
  id v33;
  uint64_t i;
  void *v35;
  void *v36;
  void *v37;
  void *v38;
  void *v39;
  double v40;
  double v41;
  void *v42;
  double v43;
  double v44;
  void *v45;
  void *v46;
  void *v47;
  void *v48;
  void *v49;
  void *v50;
  double v51;
  double v52;
  void *v53;
  double v54;
  double v55;
  void *v56;
  void *v57;
  double v58;
  double v59;
  double v60;
  double v61;
  double v62;
  double v63;
  double v64;
  double v65;
  int v66;
  int v67;
  void *v68;
  void *v69;
  void *v70;
  void *v71;
  void *v72;
  uint64_t v73;
  void *v74;
  void *v75;
  void *v76;
  void *v77;
  void *v78;
  void *v79;
  void *v80;
  void *v81;
  int v82;
  NSObject *v83;
  void *v84;
  objc_class *v85;
  void *v86;
  void *v87;
  void *v88;
  void *v89;
  void *v90;
  void *v91;
  void *v92;
  void *v93;
  unint64_t v94;
  unint64_t v95;
  TAMetricsDetection *v96;
  TASuspiciousDevice *v97;
  void *v98;
  void *v99;
  void *v100;
  unint64_t v101;
  TASuspiciousDevice *v102;
  void *v104;
  void *v105;
  void *v106;
  uint64_t v107;
  TALocationLite *v108;
  id v109;
  void *v110;
  uint64_t v111;
  TASingleVisitDetectionMetrics *v112;
  void *v113;
  id v114;
  void *v115;
  TAFilterSingleVisitSettings *v116;
  void *v117;
  void *v118;
  void *v119;
  void *v120;
  void *v121;
  uint64_t v122;
  uint64_t v123;
  void *v124;
  __int128 v125;
  __int128 v126;
  __int128 v127;
  __int128 v128;
  uint8_t buf[4];
  uint64_t v130;
  __int16 v131;
  _BOOL4 v132;
  __int16 v133;
  _BOOL4 v134;
  __int16 v135;
  int v136;
  __int16 v137;
  _BOOL4 v138;
  _QWORD v139[5];
  _QWORD v140[5];
  uint8_t v141[4];
  uint64_t v142;
  _BYTE v143[128];
  uint64_t v144;

  v144 = *MEMORY[0x24BDAC8D0];
  v6 = a3;
  v7 = (TAFilterSingleVisitSettings *)a4;
  v109 = objc_alloc_init(MEMORY[0x24BDBCEB8]);
  v124 = v6;
  if (+[TAFilterSingleVisit shouldDetectWithStore:filterSingleVisitSettings:](TAFilterSingleVisit, "shouldDetectWithStore:filterSingleVisitSettings:", v6, v7))
  {
    if (!v7)
      v7 = -[TAFilterSingleVisitSettings initWithDefaults]([TAFilterSingleVisitSettings alloc], "initWithDefaults");
    objc_msgSend(v6, "visitState");
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v8, "visitSnapshotBuffer");
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v9, "lastObject");
    v10 = (void *)objc_claimAutoreleasedReturnValue();

    v107 = objc_msgSend(v10, "loiType");
    objc_msgSend(v10, "representativeVisit");
    v11 = (void *)objc_claimAutoreleasedReturnValue();
    v12 = [TALocationLite alloc];
    objc_msgSend(v11, "arrivalDate");
    v13 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v11, "coordinate");
    v15 = v14;
    objc_msgSend(v11, "coordinate");
    v17 = v16;
    v106 = v11;
    objc_msgSend(v11, "horizontalAccuracy");
    v108 = -[TALocationLite initWithTimestamp:latitude:longitude:horizontalAccuracy:](v12, "initWithTimestamp:latitude:longitude:horizontalAccuracy:", v13, v15, v17, v18);

    objc_msgSend(v124, "visitState");
    v19 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v19, "interVisitMetricSnapshotBuffer");
    v20 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v20, "lastObject");
    v21 = (void *)objc_claimAutoreleasedReturnValue();

    -[TAFilterSingleVisitSettings visitsSettings](v7, "visitsSettings");
    v22 = (void *)objc_claimAutoreleasedReturnValue();
    +[TAFilterVisits getEntryAddressSetInTAVisitSnapshot:usingSettings:](TAFilterVisits, "getEntryAddressSetInTAVisitSnapshot:usingSettings:", v10, v22);
    v23 = objc_claimAutoreleasedReturnValue();

    v24 = (void *)MEMORY[0x24BDBCF20];
    v115 = v21;
    objc_msgSend(v21, "accumulatedDeviceMetrics");
    v25 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v25, "allKeys");
    v26 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v24, "setWithArray:", v26);
    v27 = objc_claimAutoreleasedReturnValue();

    v28 = (void *)TAStatusLog;
    if (os_log_type_enabled((os_log_t)TAStatusLog, OS_LOG_TYPE_DEBUG))
      +[TAFilterSingleVisit filterSuspiciousDeviceWithStore:singleVisitSettings:andAppendOutgoingRequestsTo:].cold.3(v28);
    v29 = (void *)TAStatusLog;
    if (os_log_type_enabled((os_log_t)TAStatusLog, OS_LOG_TYPE_DEBUG))
      +[TAFilterSingleVisit filterSuspiciousDeviceWithStore:singleVisitSettings:andAppendOutgoingRequestsTo:].cold.2(v29);
    v104 = (void *)v27;
    v105 = (void *)v23;
    +[TAFilterVisits getIntersectionOfFirstSet:andSecondSet:](TAFilterVisits, "getIntersectionOfFirstSet:andSecondSet:", v23, v27);
    v30 = (void *)objc_claimAutoreleasedReturnValue();
    v31 = (void *)TAStatusLog;
    if (os_log_type_enabled((os_log_t)TAStatusLog, OS_LOG_TYPE_DEFAULT))
    {
      v32 = v31;
      *(_DWORD *)buf = 134349056;
      v130 = objc_msgSend(v30, "count");
      _os_log_impl(&dword_217877000, v32, OS_LOG_TYPE_DEFAULT, "#TAFilterSingleVisit identified %{public}lu suspicious candidates ...", buf, 0xCu);

    }
    v127 = 0u;
    v128 = 0u;
    v125 = 0u;
    v126 = 0u;
    v33 = v30;
    v123 = objc_msgSend(v33, "countByEnumeratingWithState:objects:count:", &v125, v143, 16);
    if (v123)
    {
      v122 = *(_QWORD *)v126;
      v116 = v7;
      v119 = v10;
      v114 = v33;
      do
      {
        for (i = 0; i != v123; ++i)
        {
          if (*(_QWORD *)v126 != v122)
            objc_enumerationMutation(v33);
          v35 = *(void **)(*((_QWORD *)&v125 + 1) + 8 * i);
          objc_msgSend(v10, "latestUtAdvertisements");
          v36 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v36, "objectForKey:", v35);
          v37 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v37, "getDate");
          v38 = (void *)objc_claimAutoreleasedReturnValue();

          objc_msgSend(v124, "clock");
          v39 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v39, "timeIntervalSinceDate:", v38);
          v41 = v40;
          -[TAFilterSingleVisitSettings visitsSettings](v7, "visitsSettings");
          v42 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v42, "maxSuspiciousDuration");
          v44 = v43;

          if (v41 < v44)
          {
            objc_msgSend(v10, "earliestUtAdvertisements");
            v45 = (void *)objc_claimAutoreleasedReturnValue();
            objc_msgSend(v45, "objectForKey:", v35);
            v46 = (void *)objc_claimAutoreleasedReturnValue();

            objc_msgSend(v10, "latestUtAdvertisements");
            v47 = (void *)objc_claimAutoreleasedReturnValue();
            objc_msgSend(v47, "objectForKey:", v35);
            v48 = (void *)objc_claimAutoreleasedReturnValue();

            v121 = v48;
            if (v46 && v48)
            {
              objc_msgSend(v48, "getDate");
              v49 = (void *)objc_claimAutoreleasedReturnValue();
              v120 = v46;
              objc_msgSend(v46, "getDate");
              v50 = (void *)objc_claimAutoreleasedReturnValue();
              objc_msgSend(v49, "timeIntervalSinceDate:", v50);
              v52 = v51;
              -[TAFilterSingleVisitSettings visitsSettings](v7, "visitsSettings");
              v53 = (void *)objc_claimAutoreleasedReturnValue();
              objc_msgSend(v53, "minObservationInterval");
              v55 = v54;

              objc_msgSend(v115, "accumulatedDeviceMetrics");
              v56 = (void *)objc_claimAutoreleasedReturnValue();
              objc_msgSend(v56, "objectForKey:", v35);
              v57 = (void *)objc_claimAutoreleasedReturnValue();

              objc_msgSend(v57, "distance");
              v59 = v58;
              -[TAFilterSingleVisitSettings thresholdOfSignificantDistance](v7, "thresholdOfSignificantDistance");
              v61 = v60;
              objc_msgSend(v57, "duration");
              v63 = v62;
              -[TAFilterSingleVisitSettings thresholdOfSignificantDuration](v7, "thresholdOfSignificantDuration");
              v65 = v64;
              v66 = objc_msgSend(v57, "segmentSpeedExceedsLimit");
              v67 = v66;
              if (v59 <= v61 || v63 <= v65 || (v66 & 1) != 0 || v52 <= v55)
              {
                v81 = (void *)TAStatusLog;
                if (os_log_type_enabled((os_log_t)TAStatusLog, OS_LOG_TYPE_DEFAULT))
                {
                  v82 = v67 ^ 1;
                  v83 = v81;
                  objc_msgSend(v35, "hexString");
                  v84 = (void *)objc_claimAutoreleasedReturnValue();
                  *(_DWORD *)buf = 138478851;
                  v130 = (uint64_t)v84;
                  v131 = 1026;
                  v132 = v59 > v61;
                  v7 = v116;
                  v133 = 1026;
                  v134 = v63 > v65;
                  v135 = 1026;
                  v136 = v82;
                  v137 = 1026;
                  v138 = v52 > v55;
                  v10 = v119;
                  _os_log_impl(&dword_217877000, v83, OS_LOG_TYPE_DEFAULT, "#TAFilterSingleVisit not adding %{private}@ because satisfy-length=%{public}d satisfy-duration=%{public}d satisfy-speed=%{public}d  satisfy-min-observation-duration=%{public}d", buf, 0x24u);

                }
              }
              else
              {
                objc_msgSend(v10, "latestUtAdvertisements");
                v68 = (void *)objc_claimAutoreleasedReturnValue();
                objc_msgSend(v68, "objectForKey:", v35);
                v69 = (void *)objc_claimAutoreleasedReturnValue();

                objc_msgSend(v57, "sampledObservedLocations");
                v70 = (void *)objc_claimAutoreleasedReturnValue();
                objc_msgSend(v70, "arrayByAddingObject:", v108);
                v113 = (void *)objc_claimAutoreleasedReturnValue();

                objc_msgSend(v124, "visitState");
                v71 = (void *)objc_claimAutoreleasedReturnValue();
                objc_msgSend(v71, "visitSnapshotBuffer");
                v72 = (void *)objc_claimAutoreleasedReturnValue();
                v73 = objc_msgSend(v72, "count") - 2;

                objc_msgSend(v124, "visitState");
                v74 = (void *)objc_claimAutoreleasedReturnValue();
                objc_msgSend(v74, "visitSnapshotBuffer");
                v75 = (void *)objc_claimAutoreleasedReturnValue();
                objc_msgSend(v75, "getObjectAtIndex:", v73);
                v76 = (void *)objc_claimAutoreleasedReturnValue();

                if (v76)
                {
                  objc_msgSend(v124, "visitState");
                  v77 = (void *)objc_claimAutoreleasedReturnValue();
                  objc_msgSend(v77, "visitSnapshotBuffer");
                  v78 = (void *)objc_claimAutoreleasedReturnValue();
                  objc_msgSend(v78, "getObjectAtIndex:", v73);
                  v79 = (void *)objc_claimAutoreleasedReturnValue();
                  v111 = objc_msgSend(v79, "loiType");

                }
                else
                {
                  v111 = 0;
                }
                v139[0] = CFSTR("DetectionAlgorithm");
                v85 = (objc_class *)objc_opt_class();
                NSStringFromClass(v85);
                v86 = (void *)objc_claimAutoreleasedReturnValue();
                v140[0] = v86;
                v139[1] = CFSTR("CurrentVisit");
                objc_msgSend(v119, "representativeVisit");
                v87 = (void *)objc_claimAutoreleasedReturnValue();
                objc_msgSend(v87, "descriptionDictionary");
                v88 = (void *)objc_claimAutoreleasedReturnValue();
                v140[1] = v88;
                v139[2] = CFSTR("LastObservation");
                objc_msgSend(v69, "descriptionDictionary");
                v89 = (void *)objc_claimAutoreleasedReturnValue();
                v140[2] = v89;
                v139[3] = CFSTR("LengthTraveled");
                v117 = v69;
                v90 = (void *)MEMORY[0x24BDD16E0];
                objc_msgSend(v57, "distance");
                objc_msgSend(v90, "numberWithDouble:");
                v91 = (void *)objc_claimAutoreleasedReturnValue();
                v140[3] = v91;
                v139[4] = CFSTR("Duration");
                v92 = (void *)MEMORY[0x24BDD16E0];
                objc_msgSend(v57, "duration");
                objc_msgSend(v92, "numberWithDouble:");
                v93 = (void *)objc_claimAutoreleasedReturnValue();
                v140[4] = v93;
                objc_msgSend(MEMORY[0x24BDBCE70], "dictionaryWithObjects:forKeys:count:", v140, v139, 5);
                v110 = (void *)objc_claimAutoreleasedReturnValue();

                v118 = v57;
                v94 = +[TAFilterSingleVisit getSingleVisitDetectionTypeForLOIType:](TAFilterSingleVisit, "getSingleVisitDetectionTypeForLOIType:", v107);
                v95 = +[TAFilterSingleVisit getSingleVisitNotificationImmediacyTypeForLOIType:singleVisitSettings:](TAFilterSingleVisit, "getSingleVisitNotificationImmediacyTypeForLOIType:singleVisitSettings:", v107, v116);
                v112 = -[TASingleVisitDetectionMetrics initWithInterVisitMetrics:loiType:previousVisitType:]([TASingleVisitDetectionMetrics alloc], "initWithInterVisitMetrics:loiType:previousVisitType:", v118, objc_msgSend(v119, "loiType"), v111);
                v96 = -[TAMetricsDetection initWithDetectionType:visitDetectionMetrics:generalDetectionMetrics:singleVisitDetectionMetrics:latestAdvertisement:]([TAMetricsDetection alloc], "initWithDetectionType:visitDetectionMetrics:generalDetectionMetrics:singleVisitDetectionMetrics:latestAdvertisement:", v94, 0, 0, v112, v117);
                v97 = [TASuspiciousDevice alloc];
                objc_msgSend(v124, "clock");
                v98 = (void *)objc_claimAutoreleasedReturnValue();
                objc_msgSend(v124, "deviceRecord");
                v99 = (void *)objc_claimAutoreleasedReturnValue();
                objc_msgSend(v99, "getAccessoryInfo:", v35);
                v100 = (void *)objc_claimAutoreleasedReturnValue();
                v101 = v94;
                v57 = v118;
                v102 = -[TASuspiciousDevice initWithLatestAdv:detectionSummary:date:locHistory:detectionMetrics:detectionType:immediacyType:accessoryInfo:forceSurfaceReason:](v97, "initWithLatestAdv:detectionSummary:date:locHistory:detectionMetrics:detectionType:immediacyType:accessoryInfo:forceSurfaceReason:", v117, v110, v98, v113, v96, v101, v95, v100, 1);
                objc_msgSend(v109, "addObject:", v102);

                v7 = v116;
                v10 = v119;

              }
              v33 = v114;
              v46 = v120;
            }
            else
            {
              v80 = (void *)TAStatusLog;
              if (os_log_type_enabled((os_log_t)TAStatusLog, OS_LOG_TYPE_FAULT))
                +[TAFilterSingleVisit filterSuspiciousDeviceWithStore:singleVisitSettings:andAppendOutgoingRequestsTo:].cold.1(v141, v80, v35, &v142);
            }

          }
        }
        v123 = objc_msgSend(v33, "countByEnumeratingWithState:objects:count:", &v125, v143, 16);
      }
      while (v123);
    }

  }
  return v109;
}

+ (unint64_t)getSingleVisitDetectionTypeForLOIType:(unint64_t)a3
{
  if (a3 > 2)
    return 0;
  else
    return qword_2178C1BB8[a3];
}

+ (unint64_t)getSingleVisitNotificationImmediacyTypeForLOIType:(unint64_t)a3 singleVisitSettings:(id)a4
{
  id v5;
  void *v6;

  v5 = a4;
  v6 = v5;
  if (a3)
  {
    if (a3 == 1)
    {
      a3 = 2;
    }
    else if (a3 == 2)
    {
      a3 = objc_msgSend(v5, "arrivingWorkImmediacyType");
    }
    else
    {
      a3 = 0;
    }
  }

  return a3;
}

+ (void)filterSuspiciousDeviceWithStore:(void *)a3 singleVisitSettings:(_QWORD *)a4 andAppendOutgoingRequestsTo:.cold.1(uint8_t *a1, void *a2, void *a3, _QWORD *a4)
{
  NSObject *v7;
  void *v8;

  v7 = a2;
  objc_msgSend(a3, "hexString");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  *(_DWORD *)a1 = 138477827;
  *a4 = v8;
  _os_log_fault_impl(&dword_217877000, v7, OS_LOG_TYPE_FAULT, "#TAFilterSingleVisit some advertisements not present for %{private}@", a1, 0xCu);

}

+ (void)filterSuspiciousDeviceWithStore:(void *)a1 singleVisitSettings:andAppendOutgoingRequestsTo:.cold.2(void *a1)
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
  OUTLINED_FUNCTION_1_0(&dword_217877000, v2, v3, "#TAFilterSingleVisit observed %{public}lu devices before the current visit", v4, v5, v6, v7, 0);

  OUTLINED_FUNCTION_4();
}

+ (void)filterSuspiciousDeviceWithStore:(void *)a1 singleVisitSettings:andAppendOutgoingRequestsTo:.cold.3(void *a1)
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
  OUTLINED_FUNCTION_1_0(&dword_217877000, v2, v3, "#TAFilterSingleVisit observed %{public}lu devices in current visit", v4, v5, v6, v7, 0);

  OUTLINED_FUNCTION_4();
}

+ (void)shouldDetectWithStore:(void *)a3 filterSingleVisitSettings:.cold.1(void *a1, unint64_t a2, void *a3)
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
  _os_log_debug_impl(&dword_217877000, v5, OS_LOG_TYPE_DEBUG, "#TAFilterSingleVisit LOI type %{private}@ is not in the enabled list %{private}@", (uint8_t *)&v8, 0x16u);

}

@end
