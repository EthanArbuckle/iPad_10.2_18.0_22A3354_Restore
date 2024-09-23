@implementation TAAnalyticsManager

- (TAAnalyticsManager)init
{
  TAAnalyticsManagerSettings *v3;
  TAAnalyticsManager *v4;

  v3 = objc_alloc_init(TAAnalyticsManagerSettings);
  v4 = -[TAAnalyticsManager initWithSettings:](self, "initWithSettings:", v3);

  return v4;
}

- (TAAnalyticsManager)initWithSettings:(id)a3
{
  id v5;
  TAAnalyticsManager *v6;
  TAAnalyticsManager *v7;
  objc_super v9;

  v5 = a3;
  v9.receiver = self;
  v9.super_class = (Class)TAAnalyticsManager;
  v6 = -[TAAnalyticsManager init](&v9, sel_init);
  v7 = v6;
  if (v6)
  {
    objc_storeStrong((id *)&v6->_settings, a3);
    -[TAAnalyticsManager _submitDefaultAISFetchCountEvent](v7, "_submitDefaultAISFetchCountEvent");
  }

  return v7;
}

- (void)_submitDefaultAISFetchCountEvent
{
  void *v3;
  _QWORD v4[2];
  _QWORD v5[3];

  v5[2] = *MEMORY[0x24BDAC8D0];
  v4[0] = CFSTR("numOfFetchesPerDay");
  v4[1] = CFSTR("accessoryType");
  v5[0] = &unk_24D824F98;
  v5[1] = CFSTR("Unknown");
  objc_msgSend(MEMORY[0x24BDBCE70], "dictionaryWithObjects:forKeys:count:", v5, v4, 2);
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  -[TAAnalyticsManager _submitEvent:content:](self, "_submitEvent:content:", CFSTR("com.apple.clx.ta.aisFetchCount"), v3);

}

+ (id)_convertScanRequest:(id)a3 service:(id)a4
{
  id v5;
  id v6;
  void *v7;
  void *v8;
  void *v9;
  int v10;
  void *v11;
  void *v12;
  void *v13;
  __CFString *v14;
  void *v15;
  void *v16;
  void *v17;
  void *v18;
  void *v19;
  void *v20;
  _QWORD v22[4];
  _QWORD v23[5];

  v23[4] = *MEMORY[0x24BDAC8D0];
  v5 = a3;
  v6 = a4;
  v7 = v6;
  v8 = 0;
  if (v5 && v6)
  {
    objc_msgSend(v5, "key");
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    v10 = objc_msgSend(v9, "isEqualToString:", CFSTR("RequestingAdditionalScans"));

    if (v10)
    {
      objc_msgSend(v5, "additionalInformation");
      v11 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v11, "objectForKey:", CFSTR("ScanRequestReason"));
      v12 = (void *)objc_claimAutoreleasedReturnValue();
      if (v12)
      {
        objc_msgSend(v5, "additionalInformation");
        v13 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v13, "objectForKey:", CFSTR("ScanRequestReason"));
        v14 = (__CFString *)objc_claimAutoreleasedReturnValue();

      }
      else
      {
        v14 = CFSTR("Unknown");
      }

      v23[0] = &unk_24D824FB0;
      v22[0] = CFSTR("scanRequests");
      v22[1] = CFSTR("maximumScanRequests");
      v15 = (void *)MEMORY[0x24BDD16E0];
      objc_msgSend(v7, "settings");
      v16 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v15, "numberWithUnsignedInteger:", objc_msgSend(v16, "maximumDailyScans"));
      v17 = (void *)objc_claimAutoreleasedReturnValue();
      v23[1] = v17;
      v23[2] = v14;
      v22[2] = CFSTR("reason");
      v22[3] = CFSTR("settingsVersion");
      v18 = (void *)MEMORY[0x24BDD16E0];
      objc_msgSend(v7, "settings");
      v19 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v18, "numberWithUnsignedInteger:", objc_msgSend(v19, "settingsVersion"));
      v20 = (void *)objc_claimAutoreleasedReturnValue();
      v23[3] = v20;
      objc_msgSend(MEMORY[0x24BDBCE70], "dictionaryWithObjects:forKeys:count:", v23, v22, 4);
      v8 = (void *)objc_claimAutoreleasedReturnValue();

    }
    else
    {
      v8 = 0;
    }
  }

  return v8;
}

+ (int64_t)getHour:(id)a3
{
  void *v3;
  id v4;
  void *v5;
  void *v6;
  int64_t v7;

  v3 = (void *)MEMORY[0x24BDBCE48];
  v4 = a3;
  objc_msgSend(v3, "currentCalendar");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "components:fromDate:", 32, v4);
  v6 = (void *)objc_claimAutoreleasedReturnValue();

  v7 = objc_msgSend(v6, "hour");
  return v7;
}

+ (id)_convertDetection:(id)a3 service:(id)a4
{
  id v5;
  id v6;
  void *v7;
  void *v8;
  void *v9;
  void *v10;
  uint64_t v11;
  void *v12;
  unint64_t v13;
  uint64_t v14;
  void *v15;
  void *v16;
  void *v17;
  void *v18;
  void *v19;
  void *v20;
  void *v21;
  unint64_t v22;
  unint64_t v23;
  void *v24;
  void *v25;
  void *v26;
  void *v27;
  id v28;
  void *v29;
  id v30;
  void *v31;
  unint64_t v32;
  NSObject *v33;
  void *v34;
  double v35;
  double v36;
  double v37;
  void *v38;
  uint64_t v39;
  void *v40;
  void *v41;
  void *v42;
  double v43;
  void *v44;
  void *v45;
  void *v46;
  uint64_t v47;
  void *v48;
  void *v49;
  void *v50;
  uint64_t v51;
  void *v52;
  void *v53;
  void *v54;
  void *v55;
  void *v56;
  uint64_t v57;
  void *v58;
  uint64_t v59;
  void *v60;
  void *v61;
  void *v62;
  void *v63;
  void *v64;
  void *v65;
  void *v66;
  void *v67;
  void *v68;
  void *v69;
  void *v70;
  void *v71;
  void *v72;
  void *v73;
  void *v74;
  void *v75;
  void *v77;
  void *v78;
  void *v79;
  unsigned int v80;
  void *v81;
  void *v82;
  _QWORD v83[10];
  _QWORD v84[10];
  uint64_t buf;
  __int16 v86;
  const char *v87;
  uint64_t v88;

  v88 = *MEMORY[0x24BDAC8D0];
  v5 = a3;
  v6 = a4;
  v7 = v6;
  if (v5 && v6)
  {
    objc_msgSend(v6, "store");
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v8, "deviceRecord");
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v5, "address");
    v10 = (void *)objc_claimAutoreleasedReturnValue();
    v11 = objc_msgSend(v9, "hasSurfacedNotificationFor:", v10);

    objc_msgSend(v5, "locationHistory");
    v12 = (void *)objc_claimAutoreleasedReturnValue();
    v13 = objc_msgSend(v12, "count");

    if (v13 < 2)
    {
      v35 = 0.0;
      v36 = -1.0;
    }
    else
    {
      v14 = v11;
      objc_msgSend(v5, "locationHistory");
      v15 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v15, "firstObject");
      v16 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v16, "getDate");
      v17 = (void *)objc_claimAutoreleasedReturnValue();

      objc_msgSend(v5, "locationHistory");
      v18 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v18, "firstObject");
      v19 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v19, "getDate");
      v20 = (void *)objc_claimAutoreleasedReturnValue();

      objc_msgSend(v5, "locationHistory");
      v21 = (void *)objc_claimAutoreleasedReturnValue();
      v22 = objc_msgSend(v21, "count");

      if (v22 < 2)
      {
        v30 = v20;
        v28 = v17;
      }
      else
      {
        v23 = 1;
        do
        {
          objc_msgSend(v5, "locationHistory");
          v24 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v24, "objectAtIndexedSubscript:", v23);
          v25 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v25, "getDate");
          v26 = (void *)objc_claimAutoreleasedReturnValue();

          if (objc_msgSend(v17, "compare:", v26) == 1)
            v27 = v26;
          else
            v27 = v17;
          v28 = v27;

          if (objc_msgSend(v20, "compare:", v26) == -1)
            v29 = v26;
          else
            v29 = v20;
          v30 = v29;

          ++v23;
          objc_msgSend(v5, "locationHistory");
          v31 = (void *)objc_claimAutoreleasedReturnValue();
          v32 = objc_msgSend(v31, "count");

          v17 = v28;
          v20 = v30;
        }
        while (v32 > v23);
      }
      objc_msgSend(v30, "timeIntervalSinceDate:", v28);
      v35 = v37;
      objc_msgSend(v7, "store");
      v38 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v38, "deviceRecord");
      v39 = objc_claimAutoreleasedReturnValue();
      objc_msgSend(v5, "address");
      v40 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend((id)v39, "getFirstStagedDetectionDate:", v40);
      v41 = (void *)objc_claimAutoreleasedReturnValue();

      objc_msgSend(MEMORY[0x24BDBCE60], "distantFuture");
      v42 = (void *)objc_claimAutoreleasedReturnValue();
      LOBYTE(v39) = objc_msgSend(v41, "isEqual:", v42);

      v36 = -1.0;
      if ((v39 & 1) == 0)
      {
        objc_msgSend(v41, "timeIntervalSinceDate:", v28);
        if (v43 >= -1.0)
          v36 = v43;
        else
          v36 = -1.0;
      }

      v11 = v14;
    }
    objc_msgSend(v7, "store");
    v44 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v44, "deviceRecord");
    v45 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v5, "address");
    v46 = (void *)objc_claimAutoreleasedReturnValue();
    v47 = objc_msgSend(v45, "getNumStagedDetections:", v46);

    objc_msgSend(v7, "store");
    v48 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v48, "deviceRecord");
    v49 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v5, "address");
    v50 = (void *)objc_claimAutoreleasedReturnValue();
    v51 = objc_msgSend(v49, "getNumOfAISFetch:", v50);

    objc_msgSend(v5, "latestAdvertisement");
    v52 = (void *)objc_claimAutoreleasedReturnValue();
    +[TASPAdvertisement TASPAdvertisementDeviceTypeToString:](TASPAdvertisement, "TASPAdvertisementDeviceTypeToString:", objc_msgSend(v52, "getDeviceType"));
    v53 = (void *)objc_claimAutoreleasedReturnValue();

    objc_msgSend(v5, "accessoryInfo");
    v54 = (void *)objc_claimAutoreleasedReturnValue();

    if (v54)
    {
      objc_msgSend(v5, "accessoryInfo");
      v55 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v5, "latestAdvertisement");
      v56 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v56, "getLatestAdvTypeToString:", 0);
      v57 = v47;
      v58 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v55, "accessoryTypeNameWithAdvTypeString:", v58);
      v59 = objc_claimAutoreleasedReturnValue();

      v47 = v57;
      v53 = v56;
    }
    else
    {
      objc_msgSend(v5, "latestAdvertisement");
      v55 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v55, "getLatestAdvTypeToString:", v53);
      v59 = objc_claimAutoreleasedReturnValue();
    }

    objc_msgSend(v7, "store");
    v60 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v60, "deviceRecord");
    v61 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v5, "address");
    v62 = (void *)objc_claimAutoreleasedReturnValue();
    v80 = objc_msgSend(v61, "isAISFetchSuccessful:", v62);

    v63 = (void *)MEMORY[0x24BDD17C8];
    +[TAMetricsDetection convertTADetectionTypeToString:](TAMetricsDetection, "convertTADetectionTypeToString:", objc_msgSend(v5, "detectionType"));
    v64 = (void *)objc_claimAutoreleasedReturnValue();
    +[TASuspiciousDevice convertTAForceSurfaceReasonToString:](TASuspiciousDevice, "convertTAForceSurfaceReasonToString:", objc_msgSend(v5, "forceSurfaceReason"));
    v65 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v63, "stringWithFormat:", CFSTR("%@.%@"), v64, v65);
    v81 = (void *)objc_claimAutoreleasedReturnValue();

    v84[0] = v81;
    v83[0] = CFSTR("type");
    v83[1] = CFSTR("hasSurfacedBefore");
    objc_msgSend(MEMORY[0x24BDD16E0], "numberWithBool:", v11);
    v79 = (void *)objc_claimAutoreleasedReturnValue();
    v84[1] = v79;
    v83[2] = CFSTR("secondsFromFirstSeen");
    objc_msgSend(MEMORY[0x24BDD16E0], "numberWithDouble:", v35);
    v77 = (void *)objc_claimAutoreleasedReturnValue();
    v78 = (void *)v59;
    v84[2] = v77;
    v84[3] = v59;
    v83[3] = CFSTR("productName");
    v83[4] = CFSTR("hourOfDay");
    v66 = (void *)MEMORY[0x24BDD16E0];
    objc_msgSend(v5, "date");
    v82 = v7;
    v67 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v66, "numberWithInteger:", +[TAAnalyticsManager getHour:](TAAnalyticsManager, "getHour:", v67));
    v68 = (void *)objc_claimAutoreleasedReturnValue();
    v84[4] = v68;
    v83[5] = CFSTR("numStagedDetections");
    objc_msgSend(MEMORY[0x24BDD16E0], "numberWithUnsignedInteger:", v47);
    v69 = (void *)objc_claimAutoreleasedReturnValue();
    v84[5] = v69;
    v83[6] = CFSTR("secondsUntilFirstStagedDetection");
    objc_msgSend(MEMORY[0x24BDD16E0], "numberWithDouble:", v36);
    v70 = (void *)objc_claimAutoreleasedReturnValue();
    v84[6] = v70;
    v83[7] = CFSTR("settingsVersion");
    v71 = (void *)MEMORY[0x24BDD16E0];
    objc_msgSend(v82, "settings");
    v72 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v71, "numberWithUnsignedInteger:", objc_msgSend(v72, "settingsVersion"));
    v73 = (void *)objc_claimAutoreleasedReturnValue();
    v84[7] = v73;
    v83[8] = CFSTR("numAISFetch");
    objc_msgSend(MEMORY[0x24BDD16E0], "numberWithUnsignedInteger:", v51);
    v74 = (void *)objc_claimAutoreleasedReturnValue();
    v84[8] = v74;
    v83[9] = CFSTR("fetchSucceed");
    objc_msgSend(MEMORY[0x24BDD16E0], "numberWithBool:", v80);
    v75 = (void *)objc_claimAutoreleasedReturnValue();
    v84[9] = v75;
    objc_msgSend(MEMORY[0x24BDBCE70], "dictionaryWithObjects:forKeys:count:", v84, v83, 10);
    v34 = (void *)objc_claimAutoreleasedReturnValue();

    v7 = v82;
  }
  else
  {
    v33 = TAStatusLog;
    if (os_log_type_enabled((os_log_t)TAStatusLog, OS_LOG_TYPE_FAULT))
    {
      buf = 68289026;
      v86 = 2082;
      v87 = "";
      _os_log_impl(&dword_217877000, v33, OS_LOG_TYPE_FAULT, "{\"msg%{public}.0s\":\"#TAAnalyticsManager nil device or service in conversion\"}", (uint8_t *)&buf, 0x12u);
    }
    v34 = 0;
  }

  return v34;
}

+ (id)_convertRecord:(id)a3 service:(id)a4
{
  id v5;
  void *v6;
  id v7;
  void *v8;
  void *v9;
  void *v10;
  void *v11;
  void *v12;
  uint64_t v13;
  id v14;
  void *v15;
  void *v16;
  void *v17;
  void *v18;
  void *v19;
  void *v20;
  void *v21;
  uint64_t v22;
  void *v23;
  void *v24;
  void *v25;
  char v26;
  void *v27;
  void *v28;
  void *v29;
  double v30;
  void *v31;
  void *v32;
  void *v33;
  uint64_t v34;
  void *v35;
  void *v36;
  void *v37;
  double v38;
  void *v39;
  void *v40;
  uint64_t v41;
  void *v42;
  void *v43;
  void *v44;
  double v45;
  void *v46;
  void *v47;
  uint64_t v48;
  void *v49;
  void *v50;
  void *v51;
  double v52;
  void *v53;
  void *v54;
  uint64_t v55;
  void *v56;
  void *v57;
  void *v58;
  double v59;
  void *v60;
  void *v61;
  uint64_t v62;
  void *v63;
  void *v64;
  void *v65;
  double v66;
  void *v67;
  void *v68;
  uint64_t v69;
  void *v70;
  void *v71;
  void *v72;
  double v73;
  void *v74;
  void *v75;
  uint64_t v76;
  void *v77;
  void *v78;
  void *v79;
  void *v80;
  double v81;
  void *v82;
  void *v83;
  uint64_t v84;
  void *v85;
  void *v86;
  void *v87;
  double v88;
  void *v89;
  void *v90;
  uint64_t v91;
  void *v92;
  void *v93;
  void *v94;
  double v95;
  void *v96;
  void *v97;
  void *v98;
  void *v99;
  void *v100;
  void *v101;
  uint64_t v102;
  void *v103;
  void *v104;
  void *v105;
  char v106;
  void *v107;
  void *v108;
  void *v109;
  double v110;
  void *v111;
  void *v113;
  void *v114;
  void *v115;
  void *v116;
  void *v117;
  void *v118;
  void *v119;

  v5 = a3;
  v6 = 0;
  if (v5 && a4)
  {
    v7 = a4;
    +[TASPAdvertisement TASPAdvertisementDeviceTypeToString:](TASPAdvertisement, "TASPAdvertisementDeviceTypeToString:", objc_msgSend(v5, "getDeviceType"));
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v5, "accessoryInfo");
    v9 = (void *)objc_claimAutoreleasedReturnValue();

    if (v9)
    {
      objc_msgSend(v5, "accessoryInfo");
      v10 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v5, "latestAdvertisement");
      v11 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v11, "getLatestAdvTypeToString:", 0);
      v12 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v10, "accessoryTypeNameWithAdvTypeString:", v12);
      v13 = objc_claimAutoreleasedReturnValue();

      v8 = v11;
    }
    else
    {
      objc_msgSend(v5, "latestAdvertisement");
      v10 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v10, "getLatestAdvTypeToString:", v8);
      v13 = objc_claimAutoreleasedReturnValue();
    }

    v14 = objc_alloc_init(MEMORY[0x24BDBCED8]);
    objc_msgSend(v14, "setObject:forKey:", &unk_24D824FC8, CFSTR("minuteOfFirstArrivingWork"));
    objc_msgSend(v14, "setObject:forKey:", &unk_24D824FC8, CFSTR("minuteOfFirstBeepOnMovePedestrian"));
    objc_msgSend(v14, "setObject:forKey:", &unk_24D824FC8, CFSTR("minuteOfFirstBeepOnMoveVehicular"));
    objc_msgSend(v14, "setObject:forKey:", &unk_24D824FC8, CFSTR("minuteOfFirstDetection"));
    objc_msgSend(v14, "setObject:forKey:", &unk_24D824FC8, CFSTR("minuteOfFirstLeavingHome"));
    objc_msgSend(v14, "setObject:forKey:", &unk_24D824FC8, CFSTR("minuteOfFirstLeavingWork"));
    objc_msgSend(v14, "setObject:forKey:", &unk_24D824FC8, CFSTR("minuteOfFirstObservation"));
    objc_msgSend(v14, "setObject:forKey:", &unk_24D824FC8, CFSTR("minuteOfFirstPLOIPedestrian"));
    objc_msgSend(v14, "setObject:forKey:", &unk_24D824FC8, CFSTR("minuteOfFirstPLOIVehicular"));
    objc_msgSend(v14, "setObject:forKey:", &unk_24D824FC8, CFSTR("minuteOfFirstStagedPLOIAnyVisit"));
    objc_msgSend(v14, "setObject:forKey:", &unk_24D824FC8, CFSTR("minuteOfFirstStagedPLOIPedestrian"));
    objc_msgSend(v14, "setObject:forKey:", &unk_24D824FC8, CFSTR("minuteOfFirstStagedPLOIVehicular"));
    objc_msgSend(v14, "setObject:forKey:", &unk_24D824FC8, CFSTR("minuteOfFirstThreeConsecutiveVisit"));
    objc_msgSend(v14, "setObject:forKey:", &unk_24D824FC8, CFSTR("minuteOfFirstVehicular"));
    objc_msgSend(v14, "setObject:forKey:", &unk_24D824FC8, CFSTR("minuteOfFirstBOM"));
    objc_msgSend(v14, "setObject:forKey:", &unk_24D824F98, CFSTR("numArrivingWork"));
    objc_msgSend(v14, "setObject:forKey:", &unk_24D824F98, CFSTR("numAttemptPlaySound"));
    objc_msgSend(v14, "setObject:forKey:", &unk_24D824F98, CFSTR("numBeepOnMovePedestrian"));
    objc_msgSend(v14, "setObject:forKey:", &unk_24D824F98, CFSTR("numBeepOnMoveVehicular"));
    objc_msgSend(v14, "setObject:forKey:", &unk_24D824F98, CFSTR("numFailurePlaySound"));
    objc_msgSend(v14, "setObject:forKey:", &unk_24D824F98, CFSTR("numLeavingHome"));
    objc_msgSend(v14, "setObject:forKey:", &unk_24D824F98, CFSTR("numLeavingWork"));
    objc_msgSend(v14, "setObject:forKey:", &unk_24D824F98, CFSTR("numPLOIPedestrian"));
    objc_msgSend(v14, "setObject:forKey:", &unk_24D824F98, CFSTR("numPLOIVehicular"));
    objc_msgSend(v14, "setObject:forKey:", &unk_24D824F98, CFSTR("numStagedPLOIAnyVisit"));
    objc_msgSend(v14, "setObject:forKey:", &unk_24D824F98, CFSTR("numStagedPLOIPedestrian"));
    objc_msgSend(v14, "setObject:forKey:", &unk_24D824F98, CFSTR("numStagedPLOIVehicular"));
    objc_msgSend(v14, "setObject:forKey:", &unk_24D824F98, CFSTR("numSuccessfulPlaySound"));
    objc_msgSend(v14, "setObject:forKey:", &unk_24D824F98, CFSTR("numSurfacedAlerts"));
    objc_msgSend(v14, "setObject:forKey:", &unk_24D824F98, CFSTR("numThreeConsecutive"));
    objc_msgSend(v14, "setObject:forKey:", &unk_24D824F98, CFSTR("numVehicular"));
    objc_msgSend(v14, "setObject:forKey:", &unk_24D824F98, CFSTR("numBOMCount"));
    v118 = (void *)v13;
    objc_msgSend(v14, "setObject:forKey:", v13, CFSTR("productName"));
    v15 = (void *)MEMORY[0x24BDD16E0];
    objc_msgSend(v7, "settings");
    v16 = (void *)objc_claimAutoreleasedReturnValue();

    objc_msgSend(v15, "numberWithUnsignedInteger:", objc_msgSend(v16, "settingsVersion"));
    v17 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v14, "setObject:forKey:", v17, CFSTR("settingsVersion"));

    objc_msgSend(v14, "setObject:forKey:", &unk_24D824FB0, CFSTR("submissionCount"));
    +[TADeviceInformation deviceTypeToString:](TADeviceInformation, "deviceTypeToString:", objc_msgSend(v5, "type"));
    v18 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v14, "setObject:forKey:", v18, CFSTR("deviceRelation"));

    objc_msgSend(v14, "setObject:forKey:", CFSTR("Unknown"), CFSTR("firstAlertType"));
    v19 = (void *)MEMORY[0x24BDD16E0];
    objc_msgSend(v5, "earliestObservationDate");
    v20 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v19, "numberWithInteger:", objc_msgSend(v20, "getMinutesSinceStartOfDay"));
    v21 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v14, "setObject:forKey:", v21, CFSTR("minuteOfFirstObservation"));

    objc_msgSend(v5, "firstSurfacedAlertDate");
    v22 = objc_claimAutoreleasedReturnValue();
    if (v22)
    {
      v23 = (void *)v22;
      objc_msgSend(v5, "firstSurfacedAlertDate");
      v24 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(MEMORY[0x24BDBCE60], "distantFuture");
      v25 = (void *)objc_claimAutoreleasedReturnValue();
      v26 = objc_msgSend(v24, "isEqual:", v25);

      if ((v26 & 1) == 0)
      {
        v27 = (void *)MEMORY[0x24BDD16E0];
        objc_msgSend(v5, "firstSurfacedAlertDate");
        v28 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v5, "earliestObservationDate");
        v29 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v28, "timeIntervalSinceDate:", v29);
        objc_msgSend(v27, "numberWithInt:", ((int)v30 / 60));
        v31 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v14, "setObject:forKey:", v31, CFSTR("minuteOfFirstDetection"));

      }
    }
    +[TAMetricsDetection convertTADetectionTypeToString:](TAMetricsDetection, "convertTADetectionTypeToString:", objc_msgSend(v5, "firstSurfacedAlertType"));
    v32 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v14, "setObject:forKey:", v32, CFSTR("firstAlertType"));

    objc_msgSend(MEMORY[0x24BDD16E0], "numberWithUnsignedInteger:", objc_msgSend(v5, "numSurfacedAlerts"));
    v33 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v14, "setObject:forKey:", v33, CFSTR("numSurfacedAlerts"));

    v34 = objc_msgSend(v5, "backgroundDetectionCountForDetectionType:", 11);
    objc_msgSend(v5, "firstDetectionDateForDetectionType:", 11);
    v35 = (void *)objc_claimAutoreleasedReturnValue();
    if (v35)
    {
      v36 = (void *)MEMORY[0x24BDD16E0];
      objc_msgSend(v5, "earliestObservationDate");
      v37 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v35, "timeIntervalSinceDate:", v37);
      objc_msgSend(v36, "numberWithInt:", ((int)v38 / 60));
      v39 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v14, "setObject:forKey:", v39, CFSTR("minuteOfFirstArrivingWork"));

    }
    objc_msgSend(MEMORY[0x24BDD16E0], "numberWithUnsignedInteger:", v34);
    v40 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v14, "setObject:forKey:", v40, CFSTR("numArrivingWork"));

    v41 = objc_msgSend(v5, "backgroundDetectionCountForDetectionType:", 13);
    objc_msgSend(v5, "firstDetectionDateForDetectionType:", 13);
    v42 = (void *)objc_claimAutoreleasedReturnValue();
    if (v42)
    {
      v43 = (void *)MEMORY[0x24BDD16E0];
      objc_msgSend(v5, "earliestObservationDate");
      v44 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v42, "timeIntervalSinceDate:", v44);
      objc_msgSend(v43, "numberWithInt:", ((int)v45 / 60));
      v46 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v14, "setObject:forKey:", v46, CFSTR("minuteOfFirstBeepOnMovePedestrian"));

    }
    objc_msgSend(MEMORY[0x24BDD16E0], "numberWithUnsignedInteger:", v41);
    v47 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v14, "setObject:forKey:", v47, CFSTR("numBeepOnMovePedestrian"));

    v48 = objc_msgSend(v5, "backgroundDetectionCountForDetectionType:", 12);
    objc_msgSend(v5, "firstDetectionDateForDetectionType:", 12);
    v49 = (void *)objc_claimAutoreleasedReturnValue();
    if (v49)
    {
      v50 = (void *)MEMORY[0x24BDD16E0];
      objc_msgSend(v5, "earliestObservationDate");
      v51 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v49, "timeIntervalSinceDate:", v51);
      objc_msgSend(v50, "numberWithInt:", ((int)v52 / 60));
      v53 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v14, "setObject:forKey:", v53, CFSTR("minuteOfFirstBeepOnMoveVehicular"));

    }
    objc_msgSend(MEMORY[0x24BDD16E0], "numberWithUnsignedInteger:", v48);
    v54 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v14, "setObject:forKey:", v54, CFSTR("numBeepOnMoveVehicular"));

    v55 = objc_msgSend(v5, "backgroundDetectionCountForDetectionType:", 6);
    objc_msgSend(v5, "firstDetectionDateForDetectionType:", 6);
    v56 = (void *)objc_claimAutoreleasedReturnValue();
    if (v56)
    {
      v57 = (void *)MEMORY[0x24BDD16E0];
      objc_msgSend(v5, "earliestObservationDate");
      v58 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v56, "timeIntervalSinceDate:", v58);
      objc_msgSend(v57, "numberWithInt:", ((int)v59 / 60));
      v60 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v14, "setObject:forKey:", v60, CFSTR("minuteOfFirstLeavingHome"));

    }
    v119 = v56;
    objc_msgSend(MEMORY[0x24BDD16E0], "numberWithUnsignedInteger:", v55);
    v61 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v14, "setObject:forKey:", v61, CFSTR("numLeavingHome"));

    v62 = objc_msgSend(v5, "backgroundDetectionCountForDetectionType:", 10);
    objc_msgSend(v5, "firstDetectionDateForDetectionType:", 10);
    v63 = (void *)objc_claimAutoreleasedReturnValue();
    if (v63)
    {
      v64 = (void *)MEMORY[0x24BDD16E0];
      objc_msgSend(v5, "earliestObservationDate");
      v65 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v63, "timeIntervalSinceDate:", v65);
      objc_msgSend(v64, "numberWithInt:", ((int)v66 / 60));
      v67 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v14, "setObject:forKey:", v67, CFSTR("minuteOfFirstLeavingWork"));

    }
    v115 = v49;
    v116 = v42;
    v117 = v35;
    objc_msgSend(MEMORY[0x24BDD16E0], "numberWithUnsignedInteger:", v62);
    v68 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v14, "setObject:forKey:", v68, CFSTR("numLeavingWork"));

    v69 = objc_msgSend(v5, "backgroundDetectionCountForDetectionType:", 15);
    objc_msgSend(v5, "firstDetectionDateForDetectionType:", 15);
    v70 = (void *)objc_claimAutoreleasedReturnValue();
    if (v70)
    {
      v71 = (void *)MEMORY[0x24BDD16E0];
      objc_msgSend(v5, "earliestObservationDate");
      v72 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v70, "timeIntervalSinceDate:", v72);
      objc_msgSend(v71, "numberWithInt:", ((int)v73 / 60));
      v74 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v14, "setObject:forKey:", v74, CFSTR("minuteOfFirstPLOIPedestrian"));

    }
    v113 = v70;
    objc_msgSend(MEMORY[0x24BDD16E0], "numberWithUnsignedInteger:", v69);
    v75 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v14, "setObject:forKey:", v75, CFSTR("numPLOIPedestrian"));

    v76 = objc_msgSend(v5, "backgroundDetectionCountForDetectionType:", 14);
    objc_msgSend(v5, "firstDetectionDateForDetectionType:", 14);
    v77 = (void *)objc_claimAutoreleasedReturnValue();
    v78 = v119;
    if (v77)
    {
      v79 = (void *)MEMORY[0x24BDD16E0];
      objc_msgSend(v5, "earliestObservationDate");
      v80 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v77, "timeIntervalSinceDate:", v80);
      objc_msgSend(v79, "numberWithInt:", ((int)v81 / 60));
      v82 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v14, "setObject:forKey:", v82, CFSTR("minuteOfFirstPLOIVehicular"));

    }
    v114 = v63;
    objc_msgSend(MEMORY[0x24BDD16E0], "numberWithUnsignedInteger:", v76);
    v83 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v14, "setObject:forKey:", v83, CFSTR("numPLOIVehicular"));

    v84 = objc_msgSend(v5, "backgroundDetectionCountForDetectionType:", 16);
    objc_msgSend(v5, "firstDetectionDateForDetectionType:", 16);
    v85 = (void *)objc_claimAutoreleasedReturnValue();
    if (v85)
    {
      v86 = (void *)MEMORY[0x24BDD16E0];
      objc_msgSend(v5, "earliestObservationDate");
      v87 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v85, "timeIntervalSinceDate:", v87);
      objc_msgSend(v86, "numberWithInt:", ((int)v88 / 60));
      v89 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v14, "setObject:forKey:", v89, CFSTR("minuteOfFirstThreeConsecutiveVisit"));

    }
    objc_msgSend(MEMORY[0x24BDD16E0], "numberWithUnsignedInteger:", v84);
    v90 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v14, "setObject:forKey:", v90, CFSTR("numThreeConsecutive"));

    v91 = objc_msgSend(v5, "backgroundDetectionCountForDetectionType:", 7);
    objc_msgSend(v5, "firstDetectionDateForDetectionType:", 7);
    v92 = (void *)objc_claimAutoreleasedReturnValue();
    if (v92)
    {
      v93 = (void *)MEMORY[0x24BDD16E0];
      objc_msgSend(v5, "earliestObservationDate");
      v94 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v92, "timeIntervalSinceDate:", v94);
      objc_msgSend(v93, "numberWithInt:", ((int)v95 / 60));
      v96 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v14, "setObject:forKey:", v96, CFSTR("minuteOfFirstVehicular"));

      v78 = v119;
    }
    objc_msgSend(MEMORY[0x24BDD16E0], "numberWithUnsignedInteger:", v91);
    v97 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v14, "setObject:forKey:", v97, CFSTR("numVehicular"));

    objc_msgSend(MEMORY[0x24BDD16E0], "numberWithUnsignedInteger:", objc_msgSend(v5, "playSoundAttemptCount"));
    v98 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v14, "setObject:forKey:", v98, CFSTR("numAttemptPlaySound"));

    objc_msgSend(MEMORY[0x24BDD16E0], "numberWithUnsignedInteger:", objc_msgSend(v5, "playSoundFailureCount"));
    v99 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v14, "setObject:forKey:", v99, CFSTR("numFailurePlaySound"));

    objc_msgSend(MEMORY[0x24BDD16E0], "numberWithUnsignedInteger:", objc_msgSend(v5, "playSoundSuccessCount"));
    v100 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v14, "setObject:forKey:", v100, CFSTR("numSuccessfulPlaySound"));

    objc_msgSend(MEMORY[0x24BDD16E0], "numberWithUnsignedInteger:", objc_msgSend(v5, "numBeepOnMove"));
    v101 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v14, "setObject:forKey:", v101, CFSTR("numBOMCount"));

    objc_msgSend(v5, "firstBeepOnMoveDate");
    v102 = objc_claimAutoreleasedReturnValue();
    if (v102)
    {
      v103 = (void *)v102;
      objc_msgSend(v5, "firstBeepOnMoveDate");
      v104 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(MEMORY[0x24BDBCE60], "distantFuture");
      v105 = (void *)objc_claimAutoreleasedReturnValue();
      v106 = objc_msgSend(v104, "isEqual:", v105);

      v78 = v119;
      if ((v106 & 1) == 0)
      {
        v107 = (void *)MEMORY[0x24BDD16E0];
        objc_msgSend(v5, "firstBeepOnMoveDate");
        v108 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v5, "earliestObservationDate");
        v109 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v108, "timeIntervalSinceDate:", v109);
        objc_msgSend(v107, "numberWithInt:", ((int)v110 / 60));
        v111 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v14, "setObject:forKey:", v111, CFSTR("minuteOfFirstBOM"));

        v78 = v119;
      }
    }
    v6 = (void *)objc_msgSend(v14, "copy");

  }
  return v6;
}

+ (id)_convertRecordForAISFetch:(id)a3 service:(id)a4
{
  id v5;
  void *v6;
  id v7;
  void *v8;
  void *v9;
  void *v10;
  void *v11;
  void *v12;
  void *v13;
  void *v14;
  void *v15;
  _BOOL8 v16;
  void *v17;

  v5 = a3;
  v6 = 0;
  if (v5 && a4)
  {
    v7 = objc_alloc_init(MEMORY[0x24BDBCED8]);
    +[TASPAdvertisement TASPAdvertisementDeviceTypeToString:](TASPAdvertisement, "TASPAdvertisementDeviceTypeToString:", objc_msgSend(v5, "getDeviceType"));
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v5, "accessoryInfo");
    v9 = (void *)objc_claimAutoreleasedReturnValue();

    if (v9)
    {
      objc_msgSend(v5, "accessoryInfo");
      v10 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v5, "latestAdvertisement");
      v11 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v11, "getLatestAdvTypeToString:", 0);
      v12 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v10, "accessoryTypeNameWithAdvTypeString:", v12);
      v13 = (void *)objc_claimAutoreleasedReturnValue();

      v8 = v11;
    }
    else
    {
      objc_msgSend(v5, "latestAdvertisement");
      v10 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v10, "getLatestAdvTypeToString:", v8);
      v13 = (void *)objc_claimAutoreleasedReturnValue();
    }

    objc_msgSend(v7, "setObject:forKey:", v13, CFSTR("accessoryType"));
    objc_msgSend(MEMORY[0x24BDD16E0], "numberWithUnsignedInteger:", objc_msgSend(v5, "AISFetchCount"));
    v14 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v7, "setObject:forKey:", v14, CFSTR("numOfFetches"));

    objc_msgSend(v5, "accessoryInfo");
    v15 = (void *)objc_claimAutoreleasedReturnValue();
    v16 = v15 != 0;

    objc_msgSend(MEMORY[0x24BDD16E0], "numberWithBool:", v16);
    v17 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v7, "setObject:forKey:", v17, CFSTR("isFetchSuccessful"));

    v6 = (void *)objc_msgSend(v7, "copy");
  }

  return v6;
}

+ (id)_convertBOMObservation:(id)a3
{
  id v3;
  id v4;
  void *v5;
  void *v6;
  double v7;
  void *v8;
  void *v9;
  void *v10;
  void *v11;

  v3 = a3;
  v4 = objc_alloc_init(MEMORY[0x24BDBCED8]);
  objc_msgSend(v3, "objectForKeyedSubscript:", CFSTR("timeSinceBOM"));
  v5 = (void *)objc_claimAutoreleasedReturnValue();

  if (v5)
  {
    objc_msgSend(v3, "objectForKeyedSubscript:", CFSTR("timeSinceBOM"));
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v6, "doubleValue");
    objc_msgSend(MEMORY[0x24BDD16E0], "numberWithInt:", ((int)v7 / 60));
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v4, "setObject:forKey:", v8, CFSTR("minutesSinceLastBOMBounded"));

  }
  objc_msgSend(v3, "objectForKeyedSubscript:", CFSTR("productInfo"));
  v9 = (void *)objc_claimAutoreleasedReturnValue();

  if (v9)
  {
    objc_msgSend(v3, "objectForKeyedSubscript:", CFSTR("productInfo"));
    v10 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v4, "setObject:forKey:", v10, CFSTR("productInfo"));

  }
  v11 = (void *)objc_msgSend(v4, "copy");

  return v11;
}

+ (id)_convertPlaySoundWithDetection:(id)a3
{
  id v3;
  id v4;
  void *v5;
  void *v6;
  void *v7;
  void *v8;
  void *v9;
  void *v10;
  void *v11;
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

  v3 = a3;
  v4 = objc_alloc_init(MEMORY[0x24BDBCED8]);
  objc_msgSend(v3, "objectForKeyedSubscript:", CFSTR("firstAlertMinutes"));
  v5 = (void *)objc_claimAutoreleasedReturnValue();

  if (v5)
  {
    objc_msgSend(v3, "objectForKeyedSubscript:", CFSTR("firstAlertMinutes"));
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v4, "setObject:forKey:", v6, CFSTR("firstAlertMinutes"));

  }
  objc_msgSend(v3, "objectForKeyedSubscript:", CFSTR("firstSeenMinutes"));
  v7 = (void *)objc_claimAutoreleasedReturnValue();

  if (v7)
  {
    objc_msgSend(v3, "objectForKeyedSubscript:", CFSTR("firstSeenMinutes"));
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v4, "setObject:forKey:", v8, CFSTR("firstSeenMinutes"));

  }
  objc_msgSend(v3, "objectForKeyedSubscript:", CFSTR("lastAlertMinutes"));
  v9 = (void *)objc_claimAutoreleasedReturnValue();

  if (v9)
  {
    objc_msgSend(v3, "objectForKeyedSubscript:", CFSTR("lastAlertMinutes"));
    v10 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v4, "setObject:forKey:", v10, CFSTR("lastAlertMinutes"));

  }
  objc_msgSend(v3, "objectForKeyedSubscript:", CFSTR("lastAttemptMinutes"));
  v11 = (void *)objc_claimAutoreleasedReturnValue();

  if (v11)
  {
    objc_msgSend(v3, "objectForKeyedSubscript:", CFSTR("lastAttemptMinutes"));
    v12 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v4, "setObject:forKey:", v12, CFSTR("lastAttemptMinutes"));

  }
  objc_msgSend(v3, "objectForKeyedSubscript:", CFSTR("productInfo"));
  v13 = (void *)objc_claimAutoreleasedReturnValue();

  if (v13)
  {
    objc_msgSend(v3, "objectForKeyedSubscript:", CFSTR("productInfo"));
    v14 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v4, "setObject:forKey:", v14, CFSTR("productInfo"));

  }
  objc_msgSend(v3, "objectForKeyedSubscript:", CFSTR("soundCount"));
  v15 = (void *)objc_claimAutoreleasedReturnValue();

  if (v15)
  {
    objc_msgSend(v3, "objectForKeyedSubscript:", CFSTR("soundCount"));
    v16 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v4, "setObject:forKey:", v16, CFSTR("soundCount"));

  }
  objc_msgSend(v3, "objectForKeyedSubscript:", CFSTR("soundMinutes"));
  v17 = (void *)objc_claimAutoreleasedReturnValue();

  if (v17)
  {
    objc_msgSend(v3, "objectForKeyedSubscript:", CFSTR("soundMinutes"));
    v18 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v4, "setObject:forKey:", v18, CFSTR("soundMinutes"));

  }
  objc_msgSend(v3, "objectForKeyedSubscript:", CFSTR("success"));
  v19 = (void *)objc_claimAutoreleasedReturnValue();

  if (v19)
  {
    objc_msgSend(v3, "objectForKeyedSubscript:", CFSTR("success"));
    v20 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v4, "setObject:forKey:", v20, CFSTR("success"));

  }
  v21 = (void *)objc_msgSend(v4, "copy");

  return v21;
}

+ (id)_convertAISFetch:(id)a3
{
  id v3;
  id v4;
  void *v5;
  void *v6;
  void *v7;
  void *v8;
  void *v9;
  void *v10;
  void *v11;
  void *v12;
  void *v13;
  void *v14;
  void *v15;

  v3 = a3;
  v4 = objc_alloc_init(MEMORY[0x24BDBCED8]);
  objc_msgSend(v3, "objectForKeyedSubscript:", CFSTR("firstSeenSeconds"));
  v5 = (void *)objc_claimAutoreleasedReturnValue();

  if (v5)
  {
    objc_msgSend(v3, "objectForKeyedSubscript:", CFSTR("firstSeenSeconds"));
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v4, "setObject:forKey:", v6, CFSTR("secondsFromFirstSeen"));

  }
  objc_msgSend(v3, "objectForKeyedSubscript:", CFSTR("success"));
  v7 = (void *)objc_claimAutoreleasedReturnValue();

  if (v7)
  {
    objc_msgSend(v3, "objectForKeyedSubscript:", CFSTR("success"));
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v4, "setObject:forKey:", v8, CFSTR("fetchSucceed"));

  }
  objc_msgSend(v3, "objectForKeyedSubscript:", CFSTR("deviceType"));
  v9 = (void *)objc_claimAutoreleasedReturnValue();

  if (v9)
  {
    objc_msgSend(v3, "objectForKeyedSubscript:", CFSTR("deviceType"));
    v10 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v4, "setObject:forKey:", v10, CFSTR("accessoryType"));

  }
  objc_msgSend(v3, "objectForKeyedSubscript:", CFSTR("fetchCount"));
  v11 = (void *)objc_claimAutoreleasedReturnValue();

  if (v11)
  {
    objc_msgSend(v3, "objectForKeyedSubscript:", CFSTR("fetchCount"));
    v12 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v4, "setObject:forKey:", v12, CFSTR("fetchCount"));

  }
  objc_msgSend(v3, "objectForKeyedSubscript:", CFSTR("lastAttemptMinutes"));
  v13 = (void *)objc_claimAutoreleasedReturnValue();

  if (v13)
  {
    objc_msgSend(v3, "objectForKeyedSubscript:", CFSTR("lastAttemptMinutes"));
    v14 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v4, "setObject:forKey:", v14, CFSTR("lastAttemptMinutes"));

  }
  v15 = (void *)objc_msgSend(v4, "copy");

  return v15;
}

+ (double)_getMotionDuration:(unint64_t)a3 motionDistribution:(id)a4
{
  id v5;
  void *v6;
  void *v7;
  void *v8;
  void *v9;
  double v10;
  double v11;

  v5 = a4;
  objc_msgSend(MEMORY[0x24BDD16E0], "numberWithUnsignedInteger:", a3);
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "objectForKey:", v6);
  v7 = (void *)objc_claimAutoreleasedReturnValue();

  if (v7)
  {
    objc_msgSend(MEMORY[0x24BDD16E0], "numberWithUnsignedInteger:", a3);
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v5, "objectForKeyedSubscript:", v8);
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v9, "doubleValue");
    v11 = v10;

  }
  else
  {
    v11 = 0.0;
  }

  return v11;
}

+ (id)_convertHomeDetection:(id)a3 service:(id)a4
{
  id v5;
  id v6;
  void *v7;
  id v8;
  void *v9;
  void *v10;
  void *v11;
  double v12;
  double v13;
  void *v14;
  void *v15;
  void *v16;
  void *v17;
  void *v18;
  void *v19;
  void *v20;
  void *v21;
  void *v22;
  void *v23;
  void *v24;
  void *v25;
  void *v26;
  NSObject *v27;
  void *v28;
  void *v29;
  void *v30;
  uint64_t v31;
  const __CFString *v32;
  void *v33;
  void *v34;
  uint64_t v35;
  void *v36;
  void *v37;
  void *v38;
  void *v39;
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
  void *v51;
  void *v52;
  void *v53;
  void *v54;
  void *v55;
  _DWORD v57[2];
  __int16 v58;
  const char *v59;
  uint64_t v60;

  v60 = *MEMORY[0x24BDAC8D0];
  v5 = a3;
  v6 = a4;
  v7 = v6;
  if (v5 && v6)
  {
    v8 = objc_alloc_init(MEMORY[0x24BDBCED8]);
    objc_msgSend(v5, "detectionMetrics");
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v9, "singleVisitDetectionMetrics");
    v10 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v10, "interVisitMetrics");
    v11 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v11, "duration");
    v13 = v12;

    objc_msgSend(MEMORY[0x24BDD16E0], "numberWithDouble:", v13 / 60.0);
    v14 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v8, "setObject:forKey:", v14, CFSTR("duration"));

    v15 = (void *)MEMORY[0x24BDD16E0];
    objc_msgSend(v5, "detectionMetrics");
    v16 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v16, "singleVisitDetectionMetrics");
    v17 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v17, "interVisitMetrics");
    v18 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v18, "distance");
    objc_msgSend(v15, "numberWithDouble:");
    v19 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v8, "setObject:forKey:", v19, CFSTR("distanceTraveled"));

    objc_msgSend(v5, "latestAdvertisement");
    v20 = (void *)objc_claimAutoreleasedReturnValue();
    +[TASPAdvertisement TASPAdvertisementDeviceTypeToString:](TASPAdvertisement, "TASPAdvertisementDeviceTypeToString:", objc_msgSend(v20, "getDeviceType"));
    v21 = (void *)objc_claimAutoreleasedReturnValue();

    objc_msgSend(v5, "accessoryInfo");
    v22 = (void *)objc_claimAutoreleasedReturnValue();

    if (v22)
    {
      objc_msgSend(v5, "accessoryInfo");
      v23 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v5, "latestAdvertisement");
      v24 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v24, "getLatestAdvTypeToString:", 0);
      v25 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v23, "accessoryTypeNameWithAdvTypeString:", v25);
      v26 = (void *)objc_claimAutoreleasedReturnValue();

      v21 = v24;
    }
    else
    {
      objc_msgSend(v5, "latestAdvertisement");
      v23 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v23, "getLatestAdvTypeToString:", v21);
      v26 = (void *)objc_claimAutoreleasedReturnValue();
    }

    objc_msgSend(v8, "setObject:forKey:", v26, CFSTR("deviceType"));
    objc_msgSend(v5, "detectionMetrics");
    v29 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v29, "singleVisitDetectionMetrics");
    v30 = (void *)objc_claimAutoreleasedReturnValue();
    v31 = objc_msgSend(v30, "previousVisitType");

    if (v31 == 1)
    {
      v32 = CFSTR("Home");
    }
    else
    {
      objc_msgSend(v5, "detectionMetrics");
      v33 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v33, "singleVisitDetectionMetrics");
      v34 = (void *)objc_claimAutoreleasedReturnValue();
      v35 = objc_msgSend(v34, "previousVisitType");

      if (v35)
        v32 = CFSTR("Non-Home");
      else
        v32 = CFSTR("Unknown");
    }
    objc_msgSend(v8, "setObject:forKey:", v32, CFSTR("lastVisitType"));
    objc_msgSend(v5, "detectionMetrics");
    v36 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v36, "singleVisitDetectionMetrics");
    v37 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v37, "interVisitMetrics");
    v38 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v38, "durationPerMotionState");
    v39 = (void *)objc_claimAutoreleasedReturnValue();

    +[TAAnalyticsManager _getMotionDuration:motionDistribution:](TAAnalyticsManager, "_getMotionDuration:motionDistribution:", 1, v39);
    v41 = v40;
    +[TAAnalyticsManager _getMotionDuration:motionDistribution:](TAAnalyticsManager, "_getMotionDuration:motionDistribution:", 2, v39);
    v43 = v42;
    +[TAAnalyticsManager _getMotionDuration:motionDistribution:](TAAnalyticsManager, "_getMotionDuration:motionDistribution:", 3, v39);
    v45 = v44;
    +[TAAnalyticsManager _getMotionDuration:motionDistribution:](TAAnalyticsManager, "_getMotionDuration:motionDistribution:", 4, v39);
    v47 = v46;
    +[TAAnalyticsManager _getMotionDuration:motionDistribution:](TAAnalyticsManager, "_getMotionDuration:motionDistribution:", 0, v39);
    v49 = v48;
    v50 = v41 + v43 + v45 + v47 + v48;
    if (fabs(v50) >= 0.0000001)
    {
      objc_msgSend(MEMORY[0x24BDD16E0], "numberWithDouble:", v41 / v50);
      v51 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v8, "setObject:forKey:", v51, CFSTR("staticRatio"));

      objc_msgSend(MEMORY[0x24BDD16E0], "numberWithDouble:", v43 / v50);
      v52 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v8, "setObject:forKey:", v52, CFSTR("pedestrianRatio"));

      objc_msgSend(MEMORY[0x24BDD16E0], "numberWithDouble:", v47 / v50);
      v53 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v8, "setObject:forKey:", v53, CFSTR("cyclingRatio"));

      objc_msgSend(MEMORY[0x24BDD16E0], "numberWithDouble:", v45 / v50);
      v54 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v8, "setObject:forKey:", v54, CFSTR("vehicularRatio"));

      objc_msgSend(MEMORY[0x24BDD16E0], "numberWithDouble:", v49 / v50);
      v55 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v8, "setObject:forKey:", v55, CFSTR("unknownRatio"));

    }
    else
    {
      objc_msgSend(v8, "setObject:forKey:", &unk_24D825110, CFSTR("staticRatio"));
      objc_msgSend(v8, "setObject:forKey:", &unk_24D825110, CFSTR("pedestrianRatio"));
      objc_msgSend(v8, "setObject:forKey:", &unk_24D825110, CFSTR("cyclingRatio"));
      objc_msgSend(v8, "setObject:forKey:", &unk_24D825110, CFSTR("vehicularRatio"));
      objc_msgSend(v8, "setObject:forKey:", &unk_24D825110, CFSTR("unknownRatio"));
    }
    v28 = (void *)objc_msgSend(v8, "copy");

  }
  else
  {
    v27 = TAStatusLog;
    if (os_log_type_enabled((os_log_t)TAStatusLog, OS_LOG_TYPE_FAULT))
    {
      v57[0] = 68289026;
      v57[1] = 0;
      v58 = 2082;
      v59 = "";
      _os_log_impl(&dword_217877000, v27, OS_LOG_TYPE_FAULT, "{\"msg%{public}.0s\":\"#TAAnalyticsManager nil device or service in conversion for home detection\"}", (uint8_t *)v57, 0x12u);
    }
    v28 = 0;
  }

  return v28;
}

- (void)_submitEvent:(id)a3 content:(id)a4
{
  id v6;
  id v7;
  _BOOL4 v8;
  NSObject *v9;
  _BOOL4 v10;
  id v11;
  uint8_t buf[4];
  int v13;
  __int16 v14;
  const char *v15;
  __int16 v16;
  id v17;
  __int16 v18;
  id v19;
  uint64_t v20;

  v20 = *MEMORY[0x24BDAC8D0];
  v6 = a3;
  v7 = a4;
  v8 = -[TAAnalyticsManagerSettings enableSubmission](self->_settings, "enableSubmission");
  v9 = TAStatusLog;
  v10 = os_log_type_enabled((os_log_t)TAStatusLog, OS_LOG_TYPE_DEFAULT);
  if (v8)
  {
    if (v10)
    {
      *(_DWORD *)buf = 68289539;
      v13 = 0;
      v14 = 2082;
      v15 = "";
      v16 = 2113;
      v17 = v6;
      v18 = 2113;
      v19 = v7;
      _os_log_impl(&dword_217877000, v9, OS_LOG_TYPE_DEFAULT, "{\"msg%{public}.0s\":\"#TAAnalyticsManager Submitting analytics event\", \"eventName\":\"%{private}@\", \"content\":\"%{private}@\"}", buf, 0x26u);
    }
    v11 = v7;
    AnalyticsSendEventLazy();

  }
  else if (v10)
  {
    *(_DWORD *)buf = 68289539;
    v13 = 0;
    v14 = 2082;
    v15 = "";
    v16 = 2113;
    v17 = v6;
    v18 = 2113;
    v19 = v7;
    _os_log_impl(&dword_217877000, v9, OS_LOG_TYPE_DEFAULT, "{\"msg%{public}.0s\":\"#TAAnalyticsManager Analytics submission not enabled\", \"eventName\":\"%{private}@\", \"content\":\"%{private}@\"}", buf, 0x26u);
  }

}

id __43__TAAnalyticsManager__submitEvent_content___block_invoke(uint64_t a1)
{
  return *(id *)(a1 + 32);
}

- (void)trackingAvoidanceService:(id)a3 didFindSuspiciousDevices:(id)a4
{
  id v6;
  id v7;
  uint64_t v8;
  uint64_t v9;
  uint64_t v10;
  uint64_t i;
  void *v12;
  void *v13;
  void *v14;
  __int128 v15;
  __int128 v16;
  __int128 v17;
  __int128 v18;
  _BYTE v19[128];
  uint64_t v20;

  v20 = *MEMORY[0x24BDAC8D0];
  v6 = a3;
  v7 = a4;
  v15 = 0u;
  v16 = 0u;
  v17 = 0u;
  v18 = 0u;
  v8 = objc_msgSend(v7, "countByEnumeratingWithState:objects:count:", &v15, v19, 16);
  if (v8)
  {
    v9 = v8;
    v10 = *(_QWORD *)v16;
    do
    {
      for (i = 0; i != v9; ++i)
      {
        if (*(_QWORD *)v16 != v10)
          objc_enumerationMutation(v7);
        v12 = *(void **)(*((_QWORD *)&v15 + 1) + 8 * i);
        +[TAAnalyticsManager _convertDetection:service:](TAAnalyticsManager, "_convertDetection:service:", v12, v6);
        v13 = (void *)objc_claimAutoreleasedReturnValue();
        -[TAAnalyticsManager _submitEvent:content:](self, "_submitEvent:content:", CFSTR("com.apple.clx.ta.notifyDetection"), v13);
        if (objc_msgSend(v12, "detectionType") == 3)
        {
          +[TAAnalyticsManager _convertHomeDetection:service:](TAAnalyticsManager, "_convertHomeDetection:service:", v12, v6);
          v14 = (void *)objc_claimAutoreleasedReturnValue();
          -[TAAnalyticsManager _submitEvent:content:](self, "_submitEvent:content:", CFSTR("com.apple.clx.ta.arrivalHomeVisit"), v14);

        }
      }
      v9 = objc_msgSend(v7, "countByEnumeratingWithState:objects:count:", &v15, v19, 16);
    }
    while (v9);
  }

}

- (void)trackingAvoidanceService:(id)a3 requestingAdditionalInformation:(id)a4
{
  id v6;
  id v7;
  uint64_t v8;
  uint64_t v9;
  uint64_t v10;
  uint64_t v11;
  void *v12;
  void *v13;
  int v14;
  void *v15;
  void *v16;
  int v17;
  uint64_t v18;
  uint64_t v19;
  uint64_t v20;
  uint64_t i;
  uint64_t v22;
  void *v23;
  void *v24;
  void *v25;
  void *v26;
  void *v27;
  int v28;
  void *v29;
  TAAnalyticsManager *v30;
  const __CFString *v31;
  void *v32;
  int v33;
  void *v34;
  void *v35;
  int v36;
  void *v37;
  void *v38;
  void *v39;
  void *v40;
  uint64_t v41;
  const __CFString *v42;
  uint64_t v43;
  id v44;
  uint64_t v45;
  uint64_t v46;
  __int128 v47;
  __int128 v48;
  __int128 v49;
  __int128 v50;
  __int128 v51;
  __int128 v52;
  __int128 v53;
  __int128 v54;
  _QWORD v55[2];
  _QWORD v56[2];
  _BYTE v57[128];
  _BYTE v58[128];
  uint64_t v59;

  v59 = *MEMORY[0x24BDAC8D0];
  v6 = a3;
  v7 = a4;
  v51 = 0u;
  v52 = 0u;
  v53 = 0u;
  v54 = 0u;
  v8 = objc_msgSend(v7, "countByEnumeratingWithState:objects:count:", &v51, v58, 16);
  if (v8)
  {
    v9 = v8;
    v10 = *(_QWORD *)v52;
    v42 = CFSTR("deviceType");
    v43 = *(_QWORD *)v52;
    v44 = v7;
    do
    {
      v11 = 0;
      v45 = v9;
      do
      {
        if (*(_QWORD *)v52 != v10)
          objc_enumerationMutation(v7);
        v12 = *(void **)(*((_QWORD *)&v51 + 1) + 8 * v11);
        objc_msgSend(v12, "key", v42);
        v13 = (void *)objc_claimAutoreleasedReturnValue();
        v14 = objc_msgSend(v13, "isEqualToString:", CFSTR("RequestingAdditionalScans"));

        v46 = v11;
        if (v14)
        {
          +[TAAnalyticsManager _convertScanRequest:service:](TAAnalyticsManager, "_convertScanRequest:service:", v12, v6);
          v15 = (void *)objc_claimAutoreleasedReturnValue();
          -[TAAnalyticsManager _submitEvent:content:](self, "_submitEvent:content:", CFSTR("com.apple.clx.ta.ScanRequests"), v15);
          goto LABEL_22;
        }
        objc_msgSend(v12, "key");
        v16 = (void *)objc_claimAutoreleasedReturnValue();
        v17 = objc_msgSend(v16, "isEqualToString:", CFSTR("ExpiringRecordMetrics"));

        if (v17)
        {
          v49 = 0u;
          v50 = 0u;
          v47 = 0u;
          v48 = 0u;
          objc_msgSend(v12, "additionalInformation");
          v15 = (void *)objc_claimAutoreleasedReturnValue();
          v18 = objc_msgSend(v15, "countByEnumeratingWithState:objects:count:", &v47, v57, 16);
          if (v18)
          {
            v19 = v18;
            v20 = *(_QWORD *)v48;
            do
            {
              for (i = 0; i != v19; ++i)
              {
                if (*(_QWORD *)v48 != v20)
                  objc_enumerationMutation(v15);
                v22 = *(_QWORD *)(*((_QWORD *)&v47 + 1) + 8 * i);
                objc_msgSend(v12, "additionalInformation");
                v23 = (void *)objc_claimAutoreleasedReturnValue();
                objc_msgSend(v23, "objectForKeyedSubscript:", v22);
                v24 = (void *)objc_claimAutoreleasedReturnValue();

                +[TAAnalyticsManager _convertRecord:service:](TAAnalyticsManager, "_convertRecord:service:", v24, v6);
                v25 = (void *)objc_claimAutoreleasedReturnValue();
                -[TAAnalyticsManager _submitEvent:content:](self, "_submitEvent:content:", CFSTR("com.apple.clx.ta.recordExpiry"), v25);
                +[TAAnalyticsManager _convertRecordForAISFetch:service:](TAAnalyticsManager, "_convertRecordForAISFetch:service:", v24, v6);
                v26 = (void *)objc_claimAutoreleasedReturnValue();
                -[TAAnalyticsManager _submitEvent:content:](self, "_submitEvent:content:", CFSTR("com.apple.clx.ta.aisFetch.recordExpiry"), v26);

              }
              v19 = objc_msgSend(v15, "countByEnumeratingWithState:objects:count:", &v47, v57, 16);
            }
            while (v19);
            v10 = v43;
            v7 = v44;
            v9 = v45;
          }
          goto LABEL_22;
        }
        objc_msgSend(v12, "key");
        v27 = (void *)objc_claimAutoreleasedReturnValue();
        v28 = objc_msgSend(v27, "isEqualToString:", CFSTR("BOMObservationMetrics"));

        if (v28)
        {
          objc_msgSend(v12, "additionalInformation");
          v29 = (void *)objc_claimAutoreleasedReturnValue();
          +[TAAnalyticsManager _convertBOMObservation:](TAAnalyticsManager, "_convertBOMObservation:", v29);
          v15 = (void *)objc_claimAutoreleasedReturnValue();

          v30 = self;
          v31 = CFSTR("com.apple.clx.ta.BOMObservations");
          goto LABEL_21;
        }
        objc_msgSend(v12, "key");
        v32 = (void *)objc_claimAutoreleasedReturnValue();
        v33 = objc_msgSend(v32, "isEqualToString:", CFSTR("PlaySoundWithDetectionMetrics"));

        if (v33)
        {
          objc_msgSend(v12, "additionalInformation");
          v34 = (void *)objc_claimAutoreleasedReturnValue();
          +[TAAnalyticsManager _convertPlaySoundWithDetection:](TAAnalyticsManager, "_convertPlaySoundWithDetection:", v34);
          v15 = (void *)objc_claimAutoreleasedReturnValue();

          v30 = self;
          v31 = CFSTR("com.apple.clx.ta.playsound");
LABEL_21:
          -[TAAnalyticsManager _submitEvent:content:](v30, "_submitEvent:content:", v31, v15);
LABEL_22:

          goto LABEL_23;
        }
        objc_msgSend(v12, "key");
        v35 = (void *)objc_claimAutoreleasedReturnValue();
        v36 = objc_msgSend(v35, "isEqualToString:", CFSTR("AISFetchMetrics"));

        if (v36)
        {
          objc_msgSend(v12, "additionalInformation");
          v37 = (void *)objc_claimAutoreleasedReturnValue();
          +[TAAnalyticsManager _convertAISFetch:](TAAnalyticsManager, "_convertAISFetch:", v37);
          v15 = (void *)objc_claimAutoreleasedReturnValue();

          -[TAAnalyticsManager _submitEvent:content:](self, "_submitEvent:content:", CFSTR("com.apple.clx.ta.aisFetch"), v15);
          v55[0] = CFSTR("numOfFetchesPerDay");
          v55[1] = CFSTR("accessoryType");
          v56[0] = &unk_24D824FB0;
          objc_msgSend(v12, "additionalInformation");
          v38 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v38, "objectForKeyedSubscript:", v42);
          v39 = (void *)objc_claimAutoreleasedReturnValue();
          v56[1] = v39;
          objc_msgSend(MEMORY[0x24BDBCE70], "dictionaryWithObjects:forKeys:count:", v56, v55, 2);
          v40 = (void *)objc_claimAutoreleasedReturnValue();
          -[TAAnalyticsManager _submitEvent:content:](self, "_submitEvent:content:", CFSTR("com.apple.clx.ta.aisFetchCount"), v40);

          v9 = v45;
          goto LABEL_22;
        }
LABEL_23:
        v11 = v46 + 1;
      }
      while (v46 + 1 != v9);
      v41 = objc_msgSend(v7, "countByEnumeratingWithState:objects:count:", &v51, v58, 16);
      v9 = v41;
    }
    while (v41);
  }

}

- (void)didWriteToURL:(id)a3 bytes:(unint64_t)a4
{
  void *v5;
  void *v6;
  void *v7;
  _QWORD v8[4];
  _QWORD v9[5];

  v9[4] = *MEMORY[0x24BDAC8D0];
  v8[0] = CFSTR("type");
  v8[1] = CFSTR("numOperations");
  v9[0] = CFSTR("write");
  v9[1] = &unk_24D824FB0;
  v8[2] = CFSTR("size");
  objc_msgSend(MEMORY[0x24BDD16E0], "numberWithUnsignedInteger:", a4);
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  v9[2] = v5;
  v8[3] = CFSTR("settingsVersion");
  objc_msgSend(MEMORY[0x24BDD16E0], "numberWithUnsignedInteger:", -[TAAnalyticsManagerSettings settingsVersion](self->_settings, "settingsVersion"));
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  v9[3] = v6;
  objc_msgSend(MEMORY[0x24BDBCE70], "dictionaryWithObjects:forKeys:count:", v9, v8, 4);
  v7 = (void *)objc_claimAutoreleasedReturnValue();

  -[TAAnalyticsManager _submitEvent:content:](self, "_submitEvent:content:", CFSTR("com.apple.clx.ta.persistence"), v7);
}

- (void)didReadFromURL:(id)a3 bytes:(unint64_t)a4
{
  void *v5;
  void *v6;
  void *v7;
  _QWORD v8[4];
  _QWORD v9[5];

  v9[4] = *MEMORY[0x24BDAC8D0];
  v8[0] = CFSTR("type");
  v8[1] = CFSTR("numOperations");
  v9[0] = CFSTR("read");
  v9[1] = &unk_24D824FB0;
  v8[2] = CFSTR("size");
  objc_msgSend(MEMORY[0x24BDD16E0], "numberWithUnsignedInteger:", a4);
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  v9[2] = v5;
  v8[3] = CFSTR("settingsVersion");
  objc_msgSend(MEMORY[0x24BDD16E0], "numberWithUnsignedInteger:", -[TAAnalyticsManagerSettings settingsVersion](self->_settings, "settingsVersion"));
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  v9[3] = v6;
  objc_msgSend(MEMORY[0x24BDBCE70], "dictionaryWithObjects:forKeys:count:", v9, v8, 4);
  v7 = (void *)objc_claimAutoreleasedReturnValue();

  -[TAAnalyticsManager _submitEvent:content:](self, "_submitEvent:content:", CFSTR("com.apple.clx.ta.persistence"), v7);
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_settings, 0);
}

@end
