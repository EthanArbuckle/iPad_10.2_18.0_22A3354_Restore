@implementation TASettings

- (TAFilterVisitsSettings)filterVisitsSettings
{
  return self->_filterVisitsSettings;
}

- (TAFilterSingleVisitSettings)filterSingleVisitSettings
{
  return self->_filterSingleVisitSettings;
}

- (TASettings)init
{
  return -[TASettings initWithSettings:](self, "initWithSettings:", MEMORY[0x24BDBD1B8]);
}

- (TASettings)initWithSettings:(id)a3
{
  id v4;
  TASettings *v5;
  TASettings *v6;
  TASettings *v7;
  objc_super v9;

  v4 = a3;
  v9.receiver = self;
  v9.super_class = (Class)TASettings;
  v5 = -[TASettings init](&v9, sel_init);
  v6 = v5;
  if (v5)
  {
    -[TASettings setSettings:](v5, "setSettings:", v4);
    v7 = v6;
  }

  return v6;
}

- (void)setSettings:(id)a3
{
  void *v3;
  char v4;
  void *v5;
  void *v6;
  unint64_t v7;
  void *v8;
  unint64_t v9;
  void *v10;
  unint64_t v11;
  void *v12;
  double v13;
  void *v14;
  unsigned int v15;
  void *v16;
  char v17;
  TAFilterGeneralSettings *v18;
  void *v19;
  void *v20;
  void *v21;
  void *v22;
  void *v23;
  TAFilterGeneralSettings *v24;
  TAFilterGeneralSettings *filterGeneralSettings;
  TAFilterVisitsSettings *v26;
  void *v27;
  void *v28;
  void *v29;
  void *v30;
  void *v31;
  void *v32;
  void *v33;
  TAFilterVisitsSettings *v34;
  TAFilterVisitsSettings *filterVisitsSettings;
  TAFilterSingleVisitSettings *v36;
  void *v37;
  void *v38;
  TAFilterVisitsSettings *v39;
  void *v40;
  TAFilterSingleVisitSettings *v41;
  TAFilterSingleVisitSettings *filterSingleVisitSettings;
  TAFilterLeavingLOISettings *v43;
  void *v44;
  void *v45;
  TAFilterVisitsSettings *v46;
  void *v47;
  void *v48;
  TAFilterLeavingLOISettings *v49;
  TAFilterLeavingLOISettings *filterLeavingLOISettings;
  TAEventBufferSettings *v51;
  void *v52;
  void *v53;
  TAEventBufferSettings *v54;
  TAEventBufferSettings *eventBufferSettings;
  TAVisitStateSettings *v56;
  void *v57;
  id v58;
  void *v59;
  void *v60;
  void *v61;
  void *v62;
  void *v63;
  void *v64;
  TAVisitStateSettings *v65;
  TAVisitStateSettings *visitStateSettings;
  TADeviceRecordSettings *v67;
  void *v68;
  void *v69;
  void *v70;
  TADeviceRecordSettings *v71;
  TADeviceRecordSettings *deviceRecordSettings;
  TAScanRequestSettings *v73;
  void *v74;
  void *v75;
  void *v76;
  void *v77;
  TAScanRequestSettings *v78;
  TAScanRequestSettings *scanRequestSettings;
  TATrackingAvoidanceServiceSettings *v80;
  void *v81;
  void *v82;
  void *v83;
  void *v84;
  void *v85;
  TATrackingAvoidanceServiceSettings *v86;
  TATrackingAvoidanceServiceSettings *serviceSettings;
  TAAnalyticsManagerSettings *v88;
  void *v89;
  TAAnalyticsManagerSettings *v90;
  TAAnalyticsManagerSettings *analyticsManagerSettings;
  void *v92;
  void *v93;
  void *v94;
  void *v95;
  TAPersistenceManagerSettings *v96;
  void *v97;
  TAPersistenceManagerSettings *v98;
  TAPersistenceManagerSettings *persistenceManagerSettings;
  void *v100;
  void *v101;
  void *v102;
  void *v103;
  void *v104;
  void *v105;
  void *v106;
  void *v107;
  void *v108;
  void *v109;
  void *v110;
  void *v111;
  void *v112;
  void *v113;
  void *v114;
  void *v115;
  void *v116;
  void *v117;
  void *v118;
  void *v119;
  void *v120;
  void *v121;
  void *v122;
  void *v123;
  void *v124;
  void *v125;
  void *v126;
  void *v127;
  void *v128;
  void *v129;
  void *v130;
  void *v131;
  void *v132;
  void *v133;
  void *v134;
  void *v135;
  void *v136;
  void *v137;
  void *v138;
  void *v139;
  id v141;

  v141 = a3;
  objc_msgSend(v141, "objectForKeyedSubscript:", CFSTR("TAEnable"));
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  v119 = v3;
  if (v3)
    v4 = objc_msgSend(v3, "BOOLValue");
  else
    v4 = 1;
  self->_trackingAvoidanceEnabled = v4;
  objc_msgSend(v141, "objectForKeyedSubscript:", CFSTR("TAEnablePD"));
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  v118 = v5;
  if (v5)
    LOBYTE(v5) = objc_msgSend(v5, "BOOLValue");
  self->_peopleDensityEnabled = (char)v5;
  objc_msgSend(v141, "objectForKeyedSubscript:", CFSTR("TAScanMaxDailyRequests"));
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  v117 = v6;
  if (v6)
    v7 = objc_msgSend(v6, "unsignedIntegerValue");
  else
    v7 = 50;
  self->_maximumDailyScans = v7;
  objc_msgSend(v141, "objectForKeyedSubscript:", CFSTR("TANotificationThrottleHours"));
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  v116 = v8;
  if (v8)
    v9 = objc_msgSend(v8, "unsignedIntegerValue");
  else
    v9 = 24;
  self->_notificationThrottleHours = v9;
  objc_msgSend(v141, "objectForKeyedSubscript:", CFSTR("TANotificationThrottleMax"));
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  v115 = v10;
  if (v10)
    v11 = objc_msgSend(v10, "unsignedIntegerValue");
  else
    v11 = -1;
  self->_notificationThrottleMaxPerPeriod = v11;
  objc_msgSend(v141, "objectForKeyedSubscript:", CFSTR("TAPersistenceInterval"));
  v12 = (void *)objc_claimAutoreleasedReturnValue();
  v114 = v12;
  if (v12)
    objc_msgSend(v12, "doubleValue");
  else
    v13 = 3600.0;
  self->_persistenceInterval = v13;
  objc_msgSend(v141, "objectForKeyedSubscript:", CFSTR("TASettingsVersion"));
  v14 = (void *)objc_claimAutoreleasedReturnValue();
  v113 = v14;
  if (v14)
    v15 = objc_msgSend(v14, "unsignedIntValue");
  else
    v15 = 1;
  self->_settingsVersion = v15;
  objc_msgSend(v141, "objectForKeyedSubscript:", CFSTR("TAAISFetchEnable"));
  v16 = (void *)objc_claimAutoreleasedReturnValue();
  v112 = v16;
  if (v16)
    v17 = objc_msgSend(v16, "BOOLValue");
  else
    v17 = 1;
  self->_aisFetchEnabled = v17;
  v18 = [TAFilterGeneralSettings alloc];
  objc_msgSend(v141, "objectForKeyedSubscript:", CFSTR("TAFilterGeneralDurationOfConsideration"));
  v138 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v141, "objectForKeyedSubscript:", CFSTR("TAFilterGeneralThresholdOfLocationRelevance"));
  v136 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v141, "objectForKeyedSubscript:", CFSTR("TAFilterGeneralThresholdOfSignificantDuration"));
  v134 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v141, "objectForKeyedSubscript:", CFSTR("TAFilterGeneralThresholdOfSignificantDistance"));
  v131 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v141, "objectForKeyedSubscript:", CFSTR("TAFilterGeneralCapOfReasonableWalkingSpeed"));
  v128 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v141, "objectForKeyedSubscript:", CFSTR("TAFilterGeneralAllowNavGeoAsPrivateVehicleHint"));
  v125 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v141, "objectForKeyedSubscript:", CFSTR("TAFilterGeneralVehicularImmediacyType"));
  v19 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v141, "objectForKeyedSubscript:", CFSTR("TAFilterGeneralBeepOnMoveVehicularImmediacyType"));
  v20 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v141, "objectForKeyedSubscript:", CFSTR("TAFilterGeneralBeepOnMovePedestrianImmediacyType"));
  v21 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v141, "objectForKeyedSubscript:", CFSTR("TAFilterGeneralNextPLOIVehicularImmediacyType"));
  v22 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v141, "objectForKeyedSubscript:", CFSTR("TAFilterGeneralNextPLOIPedestrianImmediacyType"));
  v122 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v141, "objectForKeyedSubscript:", CFSTR("TAFilterGeneralNextBeepOnMoveConsiderationTimeInterval"));
  v23 = (void *)objc_claimAutoreleasedReturnValue();
  v24 = -[TAFilterGeneralSettings initWithDurationOfConsiderationOrDefault:thresholdOfLocationRelevanceOrDefault:thresholdOfSignificantDurationOrDefault:thresholdOfSignificantDistanceOrDefault:capOfReasonableWalkingSpeedOrDefault:allowNavGeoHintAsPrivateVehicleHintOrDefault:vehicularImmediacyTypeOrDefault:beepOnMoveVehicularImmediacyTypeOrDefault:beepOnMovePedestrianImmediacyTypeOrDefault:nextPLOIVehicularImmediacyTypeOrDefault:nextPLOIPedestrianImmediacyTypeOrDefault:beepOnMoveConsiderationTimeIntervalOrDefault:](v18, "initWithDurationOfConsiderationOrDefault:thresholdOfLocationRelevanceOrDefault:thresholdOfSignificantDurationOrDefault:thresholdOfSignificantDistanceOrDefault:capOfReasonableWalkingSpeedOrDefault:allowNavGeoHintAsPrivateVehicleHintOrDefault:vehicularImmediacyTypeOrDefault:beepOnMoveVehicularImmediacyTypeOrDefault:beepOnMovePedestrianImmediacyTypeOrDefault:nextPLOIVehicularImmediacyTypeOrDefault:nextPLOIPedestrianImmediacyTypeOrDefault:beepOnMoveConsiderationTimeIntervalOrDefault:", v138, v136, v134, v131, v128, v125, v19, v20, v21, v22, v122, v23);
  filterGeneralSettings = self->_filterGeneralSettings;
  self->_filterGeneralSettings = v24;

  objc_msgSend(v141, "objectForKeyedSubscript:", CFSTR("TAFilterVisitsEnabledLoiTypes"));
  v111 = (void *)objc_claimAutoreleasedReturnValue();
  +[TASettings convertEnabledLoiTypesValueContentToNSNumberType:](TASettings, "convertEnabledLoiTypesValueContentToNSNumberType:", v111);
  v139 = (void *)objc_claimAutoreleasedReturnValue();
  v26 = [TAFilterVisitsSettings alloc];
  objc_msgSend(v141, "objectForKeyedSubscript:", CFSTR("TAFilterVisitsMaxDuration"));
  v27 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v141, "objectForKeyedSubscript:", CFSTR("TAFilterVisitsMinInterVisitDistance"));
  v28 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v141, "objectForKeyedSubscript:", CFSTR("TAFilterVisitsMinNSigma"));
  v29 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v141, "objectForKeyedSubscript:", CFSTR("TAFilterVisitsEntryDisplayOnBudget"));
  v30 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v141, "objectForKeyedSubscript:", CFSTR("TAFilterVisitsExitDisplayOnBudget"));
  v31 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v141, "objectForKeyedSubscript:", CFSTR("TAFilterVisitsMinObservationInterval"));
  v32 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v141, "objectForKeyedSubscript:", CFSTR("TAFilterVisitsThreeVisitImmediacyTypeKey"));
  v33 = (void *)objc_claimAutoreleasedReturnValue();
  v34 = -[TAFilterVisitsSettings initWithMaxSuspiciousDurationOrDefault:minInterVisitDistanceOrDefault:minNSigmaBetweenVisitsOrDefault:entryDisplayOnBudgetOrDefault:exitDisplayOnBudgetOrDefault:sensitiveLOITypesOrDefault:minObservationIntervalOrDefault:threeVisitImmediacyTypeOrDefault:](v26, "initWithMaxSuspiciousDurationOrDefault:minInterVisitDistanceOrDefault:minNSigmaBetweenVisitsOrDefault:entryDisplayOnBudgetOrDefault:exitDisplayOnBudgetOrDefault:sensitiveLOITypesOrDefault:minObservationIntervalOrDefault:threeVisitImmediacyTypeOrDefault:", v27, v28, v29, v30, v31, v139, v32, v33);
  filterVisitsSettings = self->_filterVisitsSettings;
  self->_filterVisitsSettings = v34;

  objc_msgSend(v141, "objectForKeyedSubscript:", CFSTR("TAFilterSingleVisitEnabledLoiTypes"));
  v110 = (void *)objc_claimAutoreleasedReturnValue();
  +[TASettings convertEnabledLoiTypesValueContentToNSNumberType:](TASettings, "convertEnabledLoiTypesValueContentToNSNumberType:", v110);
  v137 = (void *)objc_claimAutoreleasedReturnValue();
  v36 = [TAFilterSingleVisitSettings alloc];
  objc_msgSend(v141, "objectForKeyedSubscript:", CFSTR("TAFilterSingleVisitThresholdOfSignificantDuration"));
  v37 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v141, "objectForKeyedSubscript:", CFSTR("TAFilterSingleVisitThresholdOfSignificantDistance"));
  v38 = (void *)objc_claimAutoreleasedReturnValue();
  v39 = self->_filterVisitsSettings;
  objc_msgSend(v141, "objectForKeyedSubscript:", CFSTR("TAFilterArrivingWorkImmediacyType"));
  v40 = (void *)objc_claimAutoreleasedReturnValue();
  v41 = -[TAFilterSingleVisitSettings initWithThresholdOfSignificantDurationOrDefault:thresholdOfSignificantDistanceOrDefault:filterVisitsSettingsOrDefault:enabledLoiTypesOrDefault:arrivingWorkImmediacyTypeOrDefault:](v36, "initWithThresholdOfSignificantDurationOrDefault:thresholdOfSignificantDistanceOrDefault:filterVisitsSettingsOrDefault:enabledLoiTypesOrDefault:arrivingWorkImmediacyTypeOrDefault:", v37, v38, v39, v137, v40);
  filterSingleVisitSettings = self->_filterSingleVisitSettings;
  self->_filterSingleVisitSettings = v41;

  objc_msgSend(v141, "objectForKeyedSubscript:", CFSTR("TAFilterLeavingLOIEnabledLoiTypes"));
  v109 = (void *)objc_claimAutoreleasedReturnValue();
  +[TASettings convertEnabledLoiTypesValueContentToNSNumberType:](TASettings, "convertEnabledLoiTypesValueContentToNSNumberType:", v109);
  v135 = (void *)objc_claimAutoreleasedReturnValue();
  v43 = [TAFilterLeavingLOISettings alloc];
  objc_msgSend(v141, "objectForKeyedSubscript:", CFSTR("TAFilterLeavingLOIThresholdOfSignificantDuration"));
  v44 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v141, "objectForKeyedSubscript:", CFSTR("TAFilterLeavingLOIThresholdOfSignificantDistance"));
  v45 = (void *)objc_claimAutoreleasedReturnValue();
  v46 = self->_filterVisitsSettings;
  objc_msgSend(v141, "objectForKeyedSubscript:", CFSTR("TAFilterLeavingHomeImmediacyType"));
  v47 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v141, "objectForKeyedSubscript:", CFSTR("TAFilterLeavingWorkImmediacyType"));
  v48 = (void *)objc_claimAutoreleasedReturnValue();
  v49 = -[TAFilterLeavingLOISettings initWithThresholdOfSignificantDurationOrDefault:thresholdOfSignificantDistanceOrDefault:filterVisitsSettingsOrDefault:enabledLoiTypesOrDefault:leavingHomeImmediacyTypeOrDefault:leavingWorkImmediacyTypeOrDefault:](v43, "initWithThresholdOfSignificantDurationOrDefault:thresholdOfSignificantDistanceOrDefault:filterVisitsSettingsOrDefault:enabledLoiTypesOrDefault:leavingHomeImmediacyTypeOrDefault:leavingWorkImmediacyTypeOrDefault:", v44, v45, v46, v135, v47, v48);
  filterLeavingLOISettings = self->_filterLeavingLOISettings;
  self->_filterLeavingLOISettings = v49;

  v51 = [TAEventBufferSettings alloc];
  objc_msgSend(v141, "objectForKeyedSubscript:", CFSTR("TAEventBufferCapacity"));
  v52 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v141, "objectForKeyedSubscript:", CFSTR("TAEventBufferTimeIntervalOfRetention"));
  v53 = (void *)objc_claimAutoreleasedReturnValue();
  v54 = -[TAEventBufferSettings initWithBufferCapacityOrDefault:bufferTimeIntervalOfRetentionOrDefault:](v51, "initWithBufferCapacityOrDefault:bufferTimeIntervalOfRetentionOrDefault:", v52, v53);
  eventBufferSettings = self->_eventBufferSettings;
  self->_eventBufferSettings = v54;

  v56 = [TAVisitStateSettings alloc];
  objc_msgSend(v141, "objectForKeyedSubscript:", CFSTR("TAVisitStateVisitSnapshotCapacity"));
  v132 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v141, "objectForKeyedSubscript:", CFSTR("TAVisitStateVisitDisplayBufferCapacity"));
  v57 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v141, "objectForKeyedSubscript:", CFSTR("TAVisitStateInterVisitMetricSnapshotCapacity"));
  v129 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v141, "objectForKeyedSubscript:", CFSTR("TAVisitStateInterVisitSnapshotUpdateInterval"));
  v126 = (void *)objc_claimAutoreleasedReturnValue();
  v58 = objc_alloc(MEMORY[0x24BDD16E0]);
  -[TAFilterGeneralSettings thresholdOfLocationRelevance](self->_filterGeneralSettings, "thresholdOfLocationRelevance");
  v123 = (void *)objc_msgSend(v58, "initWithDouble:");
  objc_msgSend(v141, "objectForKeyedSubscript:", CFSTR("TAVisitStateSnapshotBufferTimeIntervalOfRetention"));
  v120 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v141, "objectForKeyedSubscript:", CFSTR("TAVisitStateLoiBufferPerTypeCapacity"));
  v59 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v141, "objectForKeyedSubscript:", CFSTR("TAVisitStateLoiBufferTimeIntervalOfRetention"));
  v60 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v141, "objectForKeyedSubscript:", CFSTR("TAVisitStateMaxNSigma"));
  v61 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v141, "objectForKeyedSubscript:", CFSTR("TAVisitStateQualitySnapshotDwellDuration"));
  v62 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v141, "objectForKeyedSubscript:", CFSTR("TAVisitStateQualitySnapshotDisplayOnDuration"));
  v63 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v141, "objectForKeyedSubscript:", CFSTR("TAVisitStateUniqueUTObservationCapPerVisit"));
  v64 = (void *)objc_claimAutoreleasedReturnValue();
  v65 = -[TAVisitStateSettings initWithVisitSnapshotCapacityOrDefault:visitDisplayBufferCapacityOrDefault:interVisitMetricSnapshotCapacityOrDefault:interVisitSnapshotUpdateIntervalOrDefault:thresholdOfLocationRelevanceOrDefault:snapshotBufferTimeIntervalOfRetentionOrDefault:loiBufferPerTypeCapacityOrDefault:loiBufferTimeIntervalOfRetentionOrDefault:maxNSigmaBetweenLastLocationAndVisitOrDefault:qualitySnapshotDwellDurationOrDefault:qualitySnapshotDisplayOnDurationOrDefault:uniqueUTObservationCapPerVisitOrDefault:sensitiveLOITypesOrDefault:](v56, "initWithVisitSnapshotCapacityOrDefault:visitDisplayBufferCapacityOrDefault:interVisitMetricSnapshotCapacityOrDefault:interVisitSnapshotUpdateIntervalOrDefault:thresholdOfLocationRelevanceOrDefault:snapshotBufferTimeIntervalOfRetentionOrDefault:loiBufferPerTypeCapacityOrDefault:loiBufferTimeIntervalOfRetentionOrDefault:maxNSigmaBetweenLastLocationAndVisitOrDefault:qualitySnapshotDwellDurationOrDefault:qualitySnapshotDisplayOnDurationOrDefault:uniqueUTObservationCapPerVisitOrDefault:sensitiveLOITypesOrDefault:", v132, v57, v129, v126, v123, v120, v59, v60, v61, v62, v63, v64, v139);
  visitStateSettings = self->_visitStateSettings;
  self->_visitStateSettings = v65;

  v67 = [TADeviceRecordSettings alloc];
  objc_msgSend(v141, "objectForKeyedSubscript:", CFSTR("TADeviceRecordExpiryTimeInterval"));
  v133 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v141, "objectForKeyedSubscript:", CFSTR("TADeviceRecordPurgeTimeInterval"));
  v130 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v141, "objectForKeyedSubscript:", CFSTR("TADeviceRecordKeepAliveInterval"));
  v127 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v141, "objectForKeyedSubscript:", CFSTR("TADeviceRecordMinimumStagingInterval"));
  v108 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v141, "objectForKeyedSubscript:", CFSTR("TADeviceRecordStagingBackstopHour"));
  v107 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v141, "objectForKeyedSubscript:", CFSTR("TADeviceRecordAssumedKeyRollHour"));
  v106 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v141, "objectForKeyedSubscript:", CFSTR("TADeviceRecordScanInterval"));
  v68 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v141, "objectForKeyedSubscript:", CFSTR("TADeviceRecordSurfaceImmediatelyBeepOnMove"));
  v124 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v141, "objectForKeyedSubscript:", CFSTR("TADeviceRecordsurfaceAfterHyperStagingIntervalBetweenBackstopAndKeyroll"));
  v121 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v141, "objectForKeyedSubscript:", CFSTR("TADeviceRecordMaxExpectedHELEWildInterval"));
  v105 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v141, "objectForKeyedSubscript:", CFSTR("TADeviceRecordMaxExpectedDurianWildInterval"));
  v104 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v141, "objectForKeyedSubscript:", CFSTR("TADeviceRecordShouldAlertHELEImmediatelyForImmediateTypes"));
  v69 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v141, "objectForKeyedSubscript:", CFSTR("TADeviceRecordMinimumHELEStagingInterval"));
  v103 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v141, "objectForKeyedSubscript:", CFSTR("TADeviceRecordStagingHELEBackstopHour"));
  v102 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v141, "objectForKeyedSubscript:", CFSTR("TADeviceRecordsurfaceHELEAfterHyperStagingIntervalBetweenBackstopAndKeyroll"));
  v101 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v141, "objectForKeyedSubscript:", CFSTR("TADeviceRecordHyperHELEStagingInterval"));
  v100 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v141, "objectForKeyedSubscript:", CFSTR("TADeviceRecordHyperStagingInterval"));
  v70 = (void *)objc_claimAutoreleasedReturnValue();
  v71 = -[TADeviceRecordSettings initWithExpiryTimeIntervalOrDefault:purgeTimeIntervalOrDefault:keepAliveIntervalOrDefault:minimumStagingIntervalOrDefault:stagingBackstopHourOrDefault:assumedKeyRollHourOrDefault:scanIntervalOrDefault:surfaceImmediatelyBeepOnMoveOrDefault:surfaceAfterHyperStagingIntervalBetweenBackstopAndKeyrollOrDefault:maxExpectedHELEWildIntervalOrDefault:maxExpectedDurianWildIntervalOrDefault:shouldAlertHELEImmediatelyForImmediateTypesOrDefault:minimumHELEStagingIntervalOrDefault:stagingHELEBackstopHourOrDefault:surfaceHELEAfterHyperStagingIntervalBetweenBackstopAndKeyrollOrDefault:hyperHELEStagingIntervalOrDefault:hyperStagingIntervalOrDefault:](v67, "initWithExpiryTimeIntervalOrDefault:purgeTimeIntervalOrDefault:keepAliveIntervalOrDefault:minimumStagingIntervalOrDefault:stagingBackstopHourOrDefault:assumedKeyRollHourOrDefault:scanIntervalOrDefault:surfaceImmediatelyBeepOnMoveOrDefault:surfaceAfterHyperStagingIntervalBetweenBackstopAndKeyrollOrDefault:maxExpectedHELEWildIntervalOrDefault:maxExpectedDurianWildIntervalOrDefault:shouldAlertHELEImmediatelyForImmediateTypesOrDefault:minimumHELEStagingIntervalOrDefault:stagingHELEBackstopHourOrDefault:surfaceHELEAfterHyperStagingIntervalBetweenBackstopAndKeyrollOrDefault:hyperHELEStagingIntervalOrDefault:hyperStagingIntervalOrDefault:", v133, v130, v127, v108, v107, v106, v68, v124, v121, v105, v104, v69,
          v103,
          v102,
          v101,
          v100,
          v70);
  deviceRecordSettings = self->_deviceRecordSettings;
  self->_deviceRecordSettings = v71;

  v73 = [TAScanRequestSettings alloc];
  objc_msgSend(v141, "objectForKeyedSubscript:", CFSTR("TAScanMinVisitEntryDisplayOnDuration"));
  v74 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v141, "objectForKeyedSubscript:", CFSTR("TAScanMinInterVisitDisplayOnDuration"));
  v75 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v141, "objectForKeyedSubscript:", CFSTR("TAScanInterVisitDelay"));
  v76 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v141, "objectForKeyedSubscript:", CFSTR("TAScanMaxInterVisitRequests"));
  v77 = (void *)objc_claimAutoreleasedReturnValue();
  v78 = -[TAScanRequestSettings initWithMinVisitEntryDisplayOnDurationOrDefault:minInterVisitDisplayOnDurationOrDefault:interVisitScanDelayOrDefault:maxInterVisitScanRequestsOrDefault:](v73, "initWithMinVisitEntryDisplayOnDurationOrDefault:minInterVisitDisplayOnDurationOrDefault:interVisitScanDelayOrDefault:maxInterVisitScanRequestsOrDefault:", v74, v75, v76, v77);
  scanRequestSettings = self->_scanRequestSettings;
  self->_scanRequestSettings = v78;

  v80 = [TATrackingAvoidanceServiceSettings alloc];
  objc_msgSend(v141, "objectForKeyedSubscript:", CFSTR("TAServiceEnableTAFilterGeneral"));
  v81 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v141, "objectForKeyedSubscript:", CFSTR("TAServiceEnableTAFilterVisits"));
  v82 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v141, "objectForKeyedSubscript:", CFSTR("TAServiceEnableTAFilterSingleVisit"));
  v83 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v141, "objectForKeyedSubscript:", CFSTR("TAServiceEnableTAFilterLeavingLOI"));
  v84 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v141, "objectForKeyedSubscript:", CFSTR("TAServiceClassificationTimeInterval"));
  v85 = (void *)objc_claimAutoreleasedReturnValue();
  v86 = -[TATrackingAvoidanceServiceSettings initWithEnableTAFilterGeneralOrDefault:enableTAFilterVisitsOrDefault:enableTAFilterSingleVisitOrDefault:enableTAFilterLeavingLOIOrDefault:classificationTimeIntervalOrDefault:](v80, "initWithEnableTAFilterGeneralOrDefault:enableTAFilterVisitsOrDefault:enableTAFilterSingleVisitOrDefault:enableTAFilterLeavingLOIOrDefault:classificationTimeIntervalOrDefault:", v81, v82, v83, v84, v85);
  serviceSettings = self->_serviceSettings;
  self->_serviceSettings = v86;

  v88 = [TAAnalyticsManagerSettings alloc];
  objc_msgSend(v141, "objectForKeyedSubscript:", CFSTR("TAAnalyticsManagerEnableSubmission"));
  v89 = (void *)objc_claimAutoreleasedReturnValue();
  v90 = -[TAAnalyticsManagerSettings initWithEnableSubmissionOrDefault:andSettingsVersion:](v88, "initWithEnableSubmissionOrDefault:andSettingsVersion:", v89, self->_settingsVersion);
  analyticsManagerSettings = self->_analyticsManagerSettings;
  self->_analyticsManagerSettings = v90;

  objc_msgSend(v141, "objectForKeyedSubscript:", CFSTR("TAPersistenceDirectory"));
  v92 = (void *)objc_claimAutoreleasedReturnValue();
  if (v92)
  {
    v93 = (void *)MEMORY[0x24BDBCF48];
    objc_msgSend(v141, "objectForKeyedSubscript:", CFSTR("TAPersistenceDirectory"));
    v94 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v93, "fileURLWithPath:", v94);
    v95 = (void *)objc_claimAutoreleasedReturnValue();

  }
  else
  {
    v95 = 0;
  }

  v96 = [TAPersistenceManagerSettings alloc];
  objc_msgSend(v141, "objectForKeyedSubscript:", CFSTR("TAPersistenceStoreFileName"));
  v97 = (void *)objc_claimAutoreleasedReturnValue();
  v98 = -[TAPersistenceManagerSettings initWithDirectoryURLOrDefault:storeFileNameOrDefault:](v96, "initWithDirectoryURLOrDefault:storeFileNameOrDefault:", v95, v97);
  persistenceManagerSettings = self->_persistenceManagerSettings;
  self->_persistenceManagerSettings = v98;

}

+ (id)convertEnabledLoiTypesValueContentToNSNumberType:(id)a3
{
  id v3;
  void *v4;
  id v5;
  id v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t i;
  void *v10;
  void *v11;
  __int128 v13;
  __int128 v14;
  __int128 v15;
  __int128 v16;
  _BYTE v17[128];
  uint64_t v18;

  v18 = *MEMORY[0x24BDAC8D0];
  v3 = a3;
  if (v3)
  {
    objc_msgSend(MEMORY[0x24BDBCEF0], "set");
    v4 = (void *)objc_claimAutoreleasedReturnValue();
  }
  else
  {
    v4 = 0;
  }
  v5 = objc_alloc_init(MEMORY[0x24BDD16F0]);
  objc_msgSend(v5, "setNumberStyle:", 1);
  v15 = 0u;
  v16 = 0u;
  v13 = 0u;
  v14 = 0u;
  v6 = v3;
  v7 = objc_msgSend(v6, "countByEnumeratingWithState:objects:count:", &v13, v17, 16);
  if (v7)
  {
    v8 = *(_QWORD *)v14;
    do
    {
      for (i = 0; i != v7; ++i)
      {
        if (*(_QWORD *)v14 != v8)
          objc_enumerationMutation(v6);
        v10 = *(void **)(*((_QWORD *)&v13 + 1) + 8 * i);
        objc_opt_class();
        if ((objc_opt_isKindOfClass() & 1) != 0)
        {
          v11 = (void *)objc_msgSend(v10, "copy");
          objc_msgSend(v4, "addObject:", v11);
        }
        else
        {
          objc_opt_class();
          if ((objc_opt_isKindOfClass() & 1) == 0)
            continue;
          objc_msgSend(v5, "numberFromString:", v10, (_QWORD)v13);
          v11 = (void *)objc_claimAutoreleasedReturnValue();
          if (v11)
            objc_msgSend(v4, "addObject:", v11);
        }

      }
      v7 = objc_msgSend(v6, "countByEnumeratingWithState:objects:count:", &v13, v17, 16);
    }
    while (v7);
  }

  return v4;
}

+ (id)getBooleanSettingsKeys
{
  _QWORD v3[14];

  v3[13] = *MEMORY[0x24BDAC8D0];
  v3[0] = CFSTR("TAEnable");
  v3[1] = CFSTR("TAEnablePD");
  v3[2] = CFSTR("TAFilterGeneralAllowNavGeoAsPrivateVehicleHint");
  v3[3] = CFSTR("TAServiceEnableTAFilterGeneral");
  v3[4] = CFSTR("TAServiceEnableTAFilterVisits");
  v3[5] = CFSTR("TAServiceEnableTAFilterSingleVisit");
  v3[6] = CFSTR("TAServiceEnableTAFilterLeavingLOI");
  v3[7] = CFSTR("TAAnalyticsManagerEnableSubmission");
  v3[8] = CFSTR("TADeviceRecordSurfaceImmediatelyBeepOnMove");
  v3[9] = CFSTR("TADeviceRecordShouldAlertHELEImmediatelyForImmediateTypes");
  v3[10] = CFSTR("TAAISFetchEnable");
  v3[11] = CFSTR("TADeviceRecordsurfaceAfterHyperStagingIntervalBetweenBackstopAndKeyroll");
  v3[12] = CFSTR("TADeviceRecordsurfaceHELEAfterHyperStagingIntervalBetweenBackstopAndKeyroll");
  objc_msgSend(MEMORY[0x24BDBCE30], "arrayWithObjects:count:", v3, 13);
  return (id)objc_claimAutoreleasedReturnValue();
}

+ (id)getIntegerSettingsKeys
{
  return (id)MEMORY[0x24BDBD1A8];
}

+ (id)getUnsignedIntegerSettingsKeys
{
  _QWORD v3[27];

  v3[26] = *MEMORY[0x24BDAC8D0];
  v3[0] = CFSTR("TAEventBufferCapacity");
  v3[1] = CFSTR("TAVisitStateVisitSnapshotCapacity");
  v3[2] = CFSTR("TAVisitStateInterVisitMetricSnapshotCapacity");
  v3[3] = CFSTR("TAFilterVisitsMinNSigma");
  v3[4] = CFSTR("TAVisitStateMaxNSigma");
  v3[5] = CFSTR("TAVisitStateLoiBufferPerTypeCapacity");
  v3[6] = CFSTR("TAVisitStateVisitDisplayBufferCapacity");
  v3[7] = CFSTR("TAVisitStateUniqueUTObservationCapPerVisit");
  v3[8] = CFSTR("TAScanMaxInterVisitRequests");
  v3[9] = CFSTR("TAScanMaxDailyRequests");
  v3[10] = CFSTR("TANotificationThrottleHours");
  v3[11] = CFSTR("TANotificationThrottleMax");
  v3[12] = CFSTR("TADeviceRecordStagingBackstopHour");
  v3[13] = CFSTR("TADeviceRecordAssumedKeyRollHour");
  v3[14] = CFSTR("TADeviceRecordStagingHELEBackstopHour");
  v3[15] = CFSTR("TAFilterGeneralVehicularImmediacyType");
  v3[16] = CFSTR("TASettingsVersion");
  v3[17] = CFSTR("TAFilterLeavingHomeImmediacyType");
  v3[18] = CFSTR("TAFilterLeavingWorkImmediacyType");
  v3[19] = CFSTR("TAFilterArrivingWorkImmediacyType");
  v3[20] = CFSTR("TAFilterGeneralBeepOnMoveVehicularImmediacyType");
  v3[21] = CFSTR("TAFilterGeneralBeepOnMovePedestrianImmediacyType");
  v3[22] = CFSTR("TAFilterGeneralNextPLOIVehicularImmediacyType");
  v3[23] = CFSTR("TAFilterGeneralNextPLOIPedestrianImmediacyType");
  v3[24] = CFSTR("TAFilterVisitsThreeVisitImmediacyTypeKey");
  v3[25] = CFSTR("TAFilterGeneralNextBeepOnMoveConsiderationTimeInterval");
  objc_msgSend(MEMORY[0x24BDBCE30], "arrayWithObjects:count:", v3, 26);
  return (id)objc_claimAutoreleasedReturnValue();
}

+ (id)getDoubleSettingsKeys
{
  _QWORD v3[36];

  v3[35] = *MEMORY[0x24BDAC8D0];
  v3[0] = CFSTR("TAFilterGeneralDurationOfConsideration");
  v3[1] = CFSTR("TAFilterGeneralThresholdOfLocationRelevance");
  v3[2] = CFSTR("TAFilterGeneralThresholdOfSignificantDuration");
  v3[3] = CFSTR("TAFilterGeneralThresholdOfSignificantDistance");
  v3[4] = CFSTR("TAFilterGeneralCapOfReasonableWalkingSpeed");
  v3[5] = CFSTR("TAFilterSingleVisitThresholdOfSignificantDistance");
  v3[6] = CFSTR("TAFilterSingleVisitThresholdOfSignificantDuration");
  v3[7] = CFSTR("TAFilterLeavingLOIThresholdOfSignificantDistance");
  v3[8] = CFSTR("TAFilterLeavingLOIThresholdOfSignificantDuration");
  v3[9] = CFSTR("TAFilterVisitsMaxDuration");
  v3[10] = CFSTR("TAFilterVisitsMinInterVisitDistance");
  v3[11] = CFSTR("TAFilterVisitsEntryDisplayOnBudget");
  v3[12] = CFSTR("TAFilterVisitsExitDisplayOnBudget");
  v3[13] = CFSTR("TAFilterVisitsMinObservationInterval");
  v3[14] = CFSTR("TAEventBufferTimeIntervalOfRetention");
  v3[15] = CFSTR("TAVisitStateInterVisitSnapshotUpdateInterval");
  v3[16] = CFSTR("TAVisitStateLoiBufferTimeIntervalOfRetention");
  v3[17] = CFSTR("TAVisitStateSnapshotBufferTimeIntervalOfRetention");
  v3[18] = CFSTR("TAVisitStateQualitySnapshotDwellDuration");
  v3[19] = CFSTR("TAVisitStateQualitySnapshotDisplayOnDuration");
  v3[20] = CFSTR("TADeviceRecordExpiryTimeInterval");
  v3[21] = CFSTR("TADeviceRecordPurgeTimeInterval");
  v3[22] = CFSTR("TADeviceRecordKeepAliveInterval");
  v3[23] = CFSTR("TADeviceRecordMinimumStagingInterval");
  v3[24] = CFSTR("TADeviceRecordScanInterval");
  v3[25] = CFSTR("TADeviceRecordMaxExpectedHELEWildInterval");
  v3[26] = CFSTR("TADeviceRecordMaxExpectedDurianWildInterval");
  v3[27] = CFSTR("TADeviceRecordMinimumHELEStagingInterval");
  v3[28] = CFSTR("TAScanMinVisitEntryDisplayOnDuration");
  v3[29] = CFSTR("TAScanMinInterVisitDisplayOnDuration");
  v3[30] = CFSTR("TAScanInterVisitDelay");
  v3[31] = CFSTR("TAServiceClassificationTimeInterval");
  v3[32] = CFSTR("TAPersistenceInterval");
  v3[33] = CFSTR("TADeviceRecordHyperHELEStagingInterval");
  v3[34] = CFSTR("TADeviceRecordHyperStagingInterval");
  objc_msgSend(MEMORY[0x24BDBCE30], "arrayWithObjects:count:", v3, 35);
  return (id)objc_claimAutoreleasedReturnValue();
}

+ (id)getStringSettingsKeys
{
  _QWORD v3[3];

  v3[2] = *MEMORY[0x24BDAC8D0];
  v3[0] = CFSTR("TAPersistenceDirectory");
  v3[1] = CFSTR("TAPersistenceStoreFileName");
  objc_msgSend(MEMORY[0x24BDBCE30], "arrayWithObjects:count:", v3, 2);
  return (id)objc_claimAutoreleasedReturnValue();
}

+ (id)getArraySettingsKeys
{
  _QWORD v3[4];

  v3[3] = *MEMORY[0x24BDAC8D0];
  v3[0] = CFSTR("TAFilterSingleVisitEnabledLoiTypes");
  v3[1] = CFSTR("TAFilterVisitsEnabledLoiTypes");
  v3[2] = CFSTR("TAFilterLeavingLOIEnabledLoiTypes");
  objc_msgSend(MEMORY[0x24BDBCE30], "arrayWithObjects:count:", v3, 3);
  return (id)objc_claimAutoreleasedReturnValue();
}

- (id)description
{
  void *v3;
  void *v4;
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
  void *v32;
  void *v33;
  void *v34;
  void *v35;
  void *v36;
  void *v37;
  void *v38;
  void *v39;
  void *v40;
  void *v41;
  void *v42;
  void *v43;
  void *v44;
  void *v45;
  void *v46;
  id v47;
  NSObject *v48;
  objc_class *v49;
  void *v50;
  id v51;
  void *v52;
  void *v54;
  void *v55;
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
  void *v76;
  void *v77;
  void *v78;
  void *v79;
  void *v80;
  void *v81;
  void *v82;
  void *v83;
  void *v84;
  void *v85;
  void *v86;
  void *v87;
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
  void *v99;
  void *v100;
  void *v101;
  void *v102;
  void *v103;
  void *v104;
  void *v105;
  void *v106;
  void *v107;
  void *v108;
  void *v109;
  void *v110;
  void *v111;
  void *v112;
  void *v113;
  void *v114;
  void *v115;
  void *v116;
  void *v117;
  void *v118;
  void *v119;
  void *v120;
  void *v121;
  void *v122;
  void *v123;
  id v124;
  uint8_t buf[32];
  _QWORD v126[76];
  _QWORD v127[78];

  v127[76] = *MEMORY[0x24BDAC8D0];
  v126[0] = CFSTR("TAEnable");
  objc_msgSend(MEMORY[0x24BDD16E0], "numberWithBool:", self->_trackingAvoidanceEnabled);
  v123 = (void *)objc_claimAutoreleasedReturnValue();
  v127[0] = v123;
  v126[1] = CFSTR("TAEnablePD");
  objc_msgSend(MEMORY[0x24BDD16E0], "numberWithBool:", self->_peopleDensityEnabled);
  v121 = (void *)objc_claimAutoreleasedReturnValue();
  v127[1] = v121;
  v126[2] = CFSTR("TAEventBufferCapacity");
  objc_msgSend(MEMORY[0x24BDD16E0], "numberWithUnsignedInteger:", -[TAEventBufferSettings bufferCapacity](self->_eventBufferSettings, "bufferCapacity"));
  v120 = (void *)objc_claimAutoreleasedReturnValue();
  v127[2] = v120;
  v126[3] = CFSTR("TAEventBufferTimeIntervalOfRetention");
  v3 = (void *)MEMORY[0x24BDD16E0];
  -[TAEventBufferSettings bufferTimeIntervalOfRetention](self->_eventBufferSettings, "bufferTimeIntervalOfRetention");
  objc_msgSend(v3, "numberWithDouble:");
  v119 = (void *)objc_claimAutoreleasedReturnValue();
  v127[3] = v119;
  v126[4] = CFSTR("TAVisitStateLoiBufferPerTypeCapacity");
  objc_msgSend(MEMORY[0x24BDD16E0], "numberWithUnsignedInteger:", -[TAVisitStateSettings loiBufferPerTypeCapacity](self->_visitStateSettings, "loiBufferPerTypeCapacity"));
  v118 = (void *)objc_claimAutoreleasedReturnValue();
  v127[4] = v118;
  v126[5] = CFSTR("TAVisitStateLoiBufferTimeIntervalOfRetention");
  v4 = (void *)MEMORY[0x24BDD16E0];
  -[TAVisitStateSettings loiBufferTimeIntervalOfRetention](self->_visitStateSettings, "loiBufferTimeIntervalOfRetention");
  objc_msgSend(v4, "numberWithDouble:");
  v117 = (void *)objc_claimAutoreleasedReturnValue();
  v127[5] = v117;
  v126[6] = CFSTR("TAVisitStateVisitSnapshotCapacity");
  objc_msgSend(MEMORY[0x24BDD16E0], "numberWithUnsignedInteger:", -[TAVisitStateSettings visitSnapshotCapacity](self->_visitStateSettings, "visitSnapshotCapacity"));
  v116 = (void *)objc_claimAutoreleasedReturnValue();
  v127[6] = v116;
  v126[7] = CFSTR("TAVisitStateVisitDisplayBufferCapacity");
  objc_msgSend(MEMORY[0x24BDD16E0], "numberWithUnsignedInteger:", -[TAVisitStateSettings visitDisplayBufferCapacity](self->_visitStateSettings, "visitDisplayBufferCapacity"));
  v115 = (void *)objc_claimAutoreleasedReturnValue();
  v127[7] = v115;
  v126[8] = CFSTR("TAVisitStateInterVisitMetricSnapshotCapacity");
  objc_msgSend(MEMORY[0x24BDD16E0], "numberWithUnsignedInteger:", -[TAVisitStateSettings interVisitMetricSnapshotCapacity](self->_visitStateSettings, "interVisitMetricSnapshotCapacity"));
  v114 = (void *)objc_claimAutoreleasedReturnValue();
  v127[8] = v114;
  v126[9] = CFSTR("TAVisitStateInterVisitSnapshotUpdateInterval");
  v5 = (void *)MEMORY[0x24BDD16E0];
  -[TAVisitStateSettings interVisitSnapshotUpdateInterval](self->_visitStateSettings, "interVisitSnapshotUpdateInterval");
  objc_msgSend(v5, "numberWithDouble:");
  v113 = (void *)objc_claimAutoreleasedReturnValue();
  v127[9] = v113;
  v126[10] = CFSTR("TAVisitStateSnapshotBufferTimeIntervalOfRetention");
  v6 = (void *)MEMORY[0x24BDD16E0];
  -[TAVisitStateSettings snapshotBufferTimeIntervalOfRetention](self->_visitStateSettings, "snapshotBufferTimeIntervalOfRetention");
  objc_msgSend(v6, "numberWithDouble:");
  v112 = (void *)objc_claimAutoreleasedReturnValue();
  v127[10] = v112;
  v126[11] = CFSTR("TAVisitStateMaxNSigma");
  objc_msgSend(MEMORY[0x24BDD16E0], "numberWithUnsignedInteger:", -[TAVisitStateSettings maxNSigmaBetweenLastLocationAndVisit](self->_visitStateSettings, "maxNSigmaBetweenLastLocationAndVisit"));
  v111 = (void *)objc_claimAutoreleasedReturnValue();
  v127[11] = v111;
  v126[12] = CFSTR("TAVisitStateQualitySnapshotDwellDuration");
  v7 = (void *)MEMORY[0x24BDD16E0];
  -[TAVisitStateSettings qualitySnapshotDwellDuration](self->_visitStateSettings, "qualitySnapshotDwellDuration");
  objc_msgSend(v7, "numberWithDouble:");
  v110 = (void *)objc_claimAutoreleasedReturnValue();
  v127[12] = v110;
  v126[13] = CFSTR("TAVisitStateQualitySnapshotDisplayOnDuration");
  v8 = (void *)MEMORY[0x24BDD16E0];
  -[TAVisitStateSettings qualitySnapshotDisplayOnDuration](self->_visitStateSettings, "qualitySnapshotDisplayOnDuration");
  objc_msgSend(v8, "numberWithDouble:");
  v109 = (void *)objc_claimAutoreleasedReturnValue();
  v127[13] = v109;
  v126[14] = CFSTR("TAVisitStateUniqueUTObservationCapPerVisit");
  objc_msgSend(MEMORY[0x24BDD16E0], "numberWithUnsignedInteger:", -[TAVisitStateSettings uniqueUTObservationCapPerVisit](self->_visitStateSettings, "uniqueUTObservationCapPerVisit"));
  v108 = (void *)objc_claimAutoreleasedReturnValue();
  v127[14] = v108;
  v126[15] = CFSTR("TADeviceRecordExpiryTimeInterval");
  v9 = (void *)MEMORY[0x24BDD16E0];
  -[TADeviceRecordSettings expiryTimeInterval](self->_deviceRecordSettings, "expiryTimeInterval");
  objc_msgSend(v9, "numberWithDouble:");
  v107 = (void *)objc_claimAutoreleasedReturnValue();
  v127[15] = v107;
  v126[16] = CFSTR("TADeviceRecordPurgeTimeInterval");
  v10 = (void *)MEMORY[0x24BDD16E0];
  -[TADeviceRecordSettings purgeTimeInterval](self->_deviceRecordSettings, "purgeTimeInterval");
  objc_msgSend(v10, "numberWithDouble:");
  v106 = (void *)objc_claimAutoreleasedReturnValue();
  v127[16] = v106;
  v126[17] = CFSTR("TADeviceRecordKeepAliveInterval");
  v11 = (void *)MEMORY[0x24BDD16E0];
  -[TADeviceRecordSettings keepAliveInterval](self->_deviceRecordSettings, "keepAliveInterval");
  objc_msgSend(v11, "numberWithDouble:");
  v105 = (void *)objc_claimAutoreleasedReturnValue();
  v127[17] = v105;
  v126[18] = CFSTR("TADeviceRecordMinimumStagingInterval");
  v12 = (void *)MEMORY[0x24BDD16E0];
  -[TADeviceRecordSettings minimumStagingInterval](self->_deviceRecordSettings, "minimumStagingInterval");
  objc_msgSend(v12, "numberWithDouble:");
  v104 = (void *)objc_claimAutoreleasedReturnValue();
  v127[18] = v104;
  v126[19] = CFSTR("TADeviceRecordStagingBackstopHour");
  objc_msgSend(MEMORY[0x24BDD16E0], "numberWithInteger:", -[TADeviceRecordSettings stagingBackstopHour](self->_deviceRecordSettings, "stagingBackstopHour"));
  v103 = (void *)objc_claimAutoreleasedReturnValue();
  v127[19] = v103;
  v126[20] = CFSTR("TADeviceRecordAssumedKeyRollHour");
  objc_msgSend(MEMORY[0x24BDD16E0], "numberWithInteger:", -[TADeviceRecordSettings assumedKeyRollHour](self->_deviceRecordSettings, "assumedKeyRollHour"));
  v102 = (void *)objc_claimAutoreleasedReturnValue();
  v127[20] = v102;
  v126[21] = CFSTR("TADeviceRecordScanInterval");
  v13 = (void *)MEMORY[0x24BDD16E0];
  -[TADeviceRecordSettings scanInterval](self->_deviceRecordSettings, "scanInterval");
  objc_msgSend(v13, "numberWithDouble:");
  v101 = (void *)objc_claimAutoreleasedReturnValue();
  v127[21] = v101;
  v126[22] = CFSTR("TADeviceRecordSurfaceImmediatelyBeepOnMove");
  objc_msgSend(MEMORY[0x24BDD16E0], "numberWithBool:", -[TADeviceRecordSettings surfaceImmediatelyBeepOnMove](self->_deviceRecordSettings, "surfaceImmediatelyBeepOnMove"));
  v100 = (void *)objc_claimAutoreleasedReturnValue();
  v127[22] = v100;
  v126[23] = CFSTR("TADeviceRecordsurfaceAfterHyperStagingIntervalBetweenBackstopAndKeyroll");
  objc_msgSend(MEMORY[0x24BDD16E0], "numberWithBool:", -[TADeviceRecordSettings surfaceAfterHyperStagingIntervalBetweenBackstopAndKeyroll](self->_deviceRecordSettings, "surfaceAfterHyperStagingIntervalBetweenBackstopAndKeyroll"));
  v99 = (void *)objc_claimAutoreleasedReturnValue();
  v127[23] = v99;
  v126[24] = CFSTR("TADeviceRecordMaxExpectedHELEWildInterval");
  v14 = (void *)MEMORY[0x24BDD16E0];
  -[TADeviceRecordSettings maxExpectedHELEWildInterval](self->_deviceRecordSettings, "maxExpectedHELEWildInterval");
  objc_msgSend(v14, "numberWithDouble:");
  v98 = (void *)objc_claimAutoreleasedReturnValue();
  v127[24] = v98;
  v126[25] = CFSTR("TADeviceRecordMaxExpectedDurianWildInterval");
  v15 = (void *)MEMORY[0x24BDD16E0];
  -[TADeviceRecordSettings maxExpectedDurianWildInterval](self->_deviceRecordSettings, "maxExpectedDurianWildInterval");
  objc_msgSend(v15, "numberWithDouble:");
  v97 = (void *)objc_claimAutoreleasedReturnValue();
  v127[25] = v97;
  v126[26] = CFSTR("TADeviceRecordShouldAlertHELEImmediatelyForImmediateTypes");
  objc_msgSend(MEMORY[0x24BDD16E0], "numberWithBool:", -[TADeviceRecordSettings shouldAlertHELEImmediatelyForImmediateTypes](self->_deviceRecordSettings, "shouldAlertHELEImmediatelyForImmediateTypes"));
  v96 = (void *)objc_claimAutoreleasedReturnValue();
  v127[26] = v96;
  v126[27] = CFSTR("TADeviceRecordMinimumHELEStagingInterval");
  v16 = (void *)MEMORY[0x24BDD16E0];
  -[TADeviceRecordSettings minimumHELEStagingInterval](self->_deviceRecordSettings, "minimumHELEStagingInterval");
  objc_msgSend(v16, "numberWithDouble:");
  v95 = (void *)objc_claimAutoreleasedReturnValue();
  v127[27] = v95;
  v126[28] = CFSTR("TADeviceRecordStagingHELEBackstopHour");
  objc_msgSend(MEMORY[0x24BDD16E0], "numberWithInteger:", -[TADeviceRecordSettings stagingHELEBackstopHour](self->_deviceRecordSettings, "stagingHELEBackstopHour"));
  v94 = (void *)objc_claimAutoreleasedReturnValue();
  v127[28] = v94;
  v126[29] = CFSTR("TADeviceRecordsurfaceHELEAfterHyperStagingIntervalBetweenBackstopAndKeyroll");
  objc_msgSend(MEMORY[0x24BDD16E0], "numberWithBool:", -[TADeviceRecordSettings surfaceHELEAfterHyperStagingIntervalBetweenBackstopAndKeyroll](self->_deviceRecordSettings, "surfaceHELEAfterHyperStagingIntervalBetweenBackstopAndKeyroll"));
  v93 = (void *)objc_claimAutoreleasedReturnValue();
  v127[29] = v93;
  v126[30] = CFSTR("TADeviceRecordHyperHELEStagingInterval");
  v17 = (void *)MEMORY[0x24BDD16E0];
  -[TADeviceRecordSettings hyperHELEStagingInterval](self->_deviceRecordSettings, "hyperHELEStagingInterval");
  objc_msgSend(v17, "numberWithDouble:");
  v92 = (void *)objc_claimAutoreleasedReturnValue();
  v127[30] = v92;
  v126[31] = CFSTR("TADeviceRecordHyperStagingInterval");
  v18 = (void *)MEMORY[0x24BDD16E0];
  -[TADeviceRecordSettings hyperStagingInterval](self->_deviceRecordSettings, "hyperStagingInterval");
  objc_msgSend(v18, "numberWithDouble:");
  v91 = (void *)objc_claimAutoreleasedReturnValue();
  v127[31] = v91;
  v126[32] = CFSTR("TAFilterGeneralThresholdOfSignificantDuration");
  v19 = (void *)MEMORY[0x24BDD16E0];
  -[TAFilterGeneralSettings thresholdOfSignificantDuration](self->_filterGeneralSettings, "thresholdOfSignificantDuration");
  objc_msgSend(v19, "numberWithDouble:");
  v90 = (void *)objc_claimAutoreleasedReturnValue();
  v127[32] = v90;
  v126[33] = CFSTR("TAFilterGeneralThresholdOfSignificantDistance");
  v20 = (void *)MEMORY[0x24BDD16E0];
  -[TAFilterGeneralSettings thresholdOfSignificantDistance](self->_filterGeneralSettings, "thresholdOfSignificantDistance");
  objc_msgSend(v20, "numberWithDouble:");
  v89 = (void *)objc_claimAutoreleasedReturnValue();
  v127[33] = v89;
  v126[34] = CFSTR("TAFilterGeneralThresholdOfLocationRelevance");
  v21 = (void *)MEMORY[0x24BDD16E0];
  -[TAFilterGeneralSettings thresholdOfLocationRelevance](self->_filterGeneralSettings, "thresholdOfLocationRelevance");
  objc_msgSend(v21, "numberWithDouble:");
  v88 = (void *)objc_claimAutoreleasedReturnValue();
  v127[34] = v88;
  v126[35] = CFSTR("TAFilterGeneralDurationOfConsideration");
  v22 = (void *)MEMORY[0x24BDD16E0];
  -[TAFilterGeneralSettings durationOfConsideration](self->_filterGeneralSettings, "durationOfConsideration");
  objc_msgSend(v22, "numberWithDouble:");
  v87 = (void *)objc_claimAutoreleasedReturnValue();
  v127[35] = v87;
  v126[36] = CFSTR("TAFilterGeneralCapOfReasonableWalkingSpeed");
  v23 = (void *)MEMORY[0x24BDD16E0];
  -[TAFilterGeneralSettings capOfReasonableWalkingSpeed](self->_filterGeneralSettings, "capOfReasonableWalkingSpeed");
  objc_msgSend(v23, "numberWithDouble:");
  v86 = (void *)objc_claimAutoreleasedReturnValue();
  v127[36] = v86;
  v126[37] = CFSTR("TAFilterGeneralNextBeepOnMoveConsiderationTimeInterval");
  objc_msgSend(MEMORY[0x24BDD16E0], "numberWithUnsignedInteger:", -[TAFilterGeneralSettings beepOnMoveConsiderationTimeInterval](self->_filterGeneralSettings, "beepOnMoveConsiderationTimeInterval"));
  v85 = (void *)objc_claimAutoreleasedReturnValue();
  v127[37] = v85;
  v126[38] = CFSTR("TAFilterVisitsMinInterVisitDistance");
  v24 = (void *)MEMORY[0x24BDD16E0];
  -[TAFilterVisitsSettings minInterVisitDistance](self->_filterVisitsSettings, "minInterVisitDistance");
  objc_msgSend(v24, "numberWithDouble:");
  v84 = (void *)objc_claimAutoreleasedReturnValue();
  v127[38] = v84;
  v126[39] = CFSTR("TAFilterVisitsMaxDuration");
  v25 = (void *)MEMORY[0x24BDD16E0];
  -[TAFilterVisitsSettings maxSuspiciousDuration](self->_filterVisitsSettings, "maxSuspiciousDuration");
  objc_msgSend(v25, "numberWithDouble:");
  v83 = (void *)objc_claimAutoreleasedReturnValue();
  v127[39] = v83;
  v126[40] = CFSTR("TAFilterVisitsMinNSigma");
  objc_msgSend(MEMORY[0x24BDD16E0], "numberWithUnsignedInteger:", -[TAFilterVisitsSettings minNSigmaBetweenVisits](self->_filterVisitsSettings, "minNSigmaBetweenVisits"));
  v82 = (void *)objc_claimAutoreleasedReturnValue();
  v127[40] = v82;
  v126[41] = CFSTR("TAFilterVisitsEntryDisplayOnBudget");
  v26 = (void *)MEMORY[0x24BDD16E0];
  -[TAFilterVisitsSettings entryDisplayOnBudget](self->_filterVisitsSettings, "entryDisplayOnBudget");
  objc_msgSend(v26, "numberWithDouble:");
  v81 = (void *)objc_claimAutoreleasedReturnValue();
  v127[41] = v81;
  v126[42] = CFSTR("TAFilterVisitsExitDisplayOnBudget");
  v27 = (void *)MEMORY[0x24BDD16E0];
  -[TAFilterVisitsSettings exitDisplayOnBudget](self->_filterVisitsSettings, "exitDisplayOnBudget");
  objc_msgSend(v27, "numberWithDouble:");
  v80 = (void *)objc_claimAutoreleasedReturnValue();
  v127[42] = v80;
  v126[43] = CFSTR("TAFilterVisitsMinObservationInterval");
  v28 = (void *)MEMORY[0x24BDD16E0];
  -[TAFilterVisitsSettings minObservationInterval](self->_filterVisitsSettings, "minObservationInterval");
  objc_msgSend(v28, "numberWithDouble:");
  v79 = (void *)objc_claimAutoreleasedReturnValue();
  v127[43] = v79;
  v126[44] = CFSTR("TAFilterVisitsThreeVisitImmediacyTypeKey");
  objc_msgSend(MEMORY[0x24BDD16E0], "numberWithUnsignedInteger:", -[TAFilterVisitsSettings threeVisitImmediacyType](self->_filterVisitsSettings, "threeVisitImmediacyType"));
  v78 = (void *)objc_claimAutoreleasedReturnValue();
  v127[44] = v78;
  v126[45] = CFSTR("TAScanMinVisitEntryDisplayOnDuration");
  v29 = (void *)MEMORY[0x24BDD16E0];
  -[TAScanRequestSettings minVisitEntryDisplayOnDuration](self->_scanRequestSettings, "minVisitEntryDisplayOnDuration");
  objc_msgSend(v29, "numberWithDouble:");
  v77 = (void *)objc_claimAutoreleasedReturnValue();
  v127[45] = v77;
  v126[46] = CFSTR("TAScanMinInterVisitDisplayOnDuration");
  v30 = (void *)MEMORY[0x24BDD16E0];
  -[TAScanRequestSettings minInterVisitDisplayOnDuration](self->_scanRequestSettings, "minInterVisitDisplayOnDuration");
  objc_msgSend(v30, "numberWithDouble:");
  v76 = (void *)objc_claimAutoreleasedReturnValue();
  v127[46] = v76;
  v126[47] = CFSTR("TAScanInterVisitDelay");
  v31 = (void *)MEMORY[0x24BDD16E0];
  -[TAScanRequestSettings interVisitScanDelay](self->_scanRequestSettings, "interVisitScanDelay");
  objc_msgSend(v31, "numberWithDouble:");
  v75 = (void *)objc_claimAutoreleasedReturnValue();
  v127[47] = v75;
  v126[48] = CFSTR("TAScanMaxInterVisitRequests");
  objc_msgSend(MEMORY[0x24BDD16E0], "numberWithUnsignedInteger:", -[TAScanRequestSettings maxInterVisitScanRequests](self->_scanRequestSettings, "maxInterVisitScanRequests"));
  v74 = (void *)objc_claimAutoreleasedReturnValue();
  v127[48] = v74;
  v126[49] = CFSTR("TAFilterSingleVisitThresholdOfSignificantDuration");
  v32 = (void *)MEMORY[0x24BDD16E0];
  -[TAFilterSingleVisitSettings thresholdOfSignificantDuration](self->_filterSingleVisitSettings, "thresholdOfSignificantDuration");
  objc_msgSend(v32, "numberWithDouble:");
  v73 = (void *)objc_claimAutoreleasedReturnValue();
  v127[49] = v73;
  v126[50] = CFSTR("TAFilterSingleVisitThresholdOfSignificantDistance");
  v33 = (void *)MEMORY[0x24BDD16E0];
  -[TAFilterSingleVisitSettings thresholdOfSignificantDistance](self->_filterSingleVisitSettings, "thresholdOfSignificantDistance");
  objc_msgSend(v33, "numberWithDouble:");
  v71 = (void *)objc_claimAutoreleasedReturnValue();
  v127[50] = v71;
  v126[51] = CFSTR("TAFilterSingleVisitEnabledLoiTypes");
  -[TAFilterSingleVisitSettings enabledLoiTypesToString](self->_filterSingleVisitSettings, "enabledLoiTypesToString");
  v72 = (void *)objc_claimAutoreleasedReturnValue();
  v127[51] = v72;
  v126[52] = CFSTR("TAFilterArrivingWorkImmediacyType");
  objc_msgSend(MEMORY[0x24BDD16E0], "numberWithUnsignedInteger:", -[TAFilterSingleVisitSettings arrivingWorkImmediacyType](self->_filterSingleVisitSettings, "arrivingWorkImmediacyType"));
  v70 = (void *)objc_claimAutoreleasedReturnValue();
  v127[52] = v70;
  v126[53] = CFSTR("TAFilterLeavingLOIThresholdOfSignificantDuration");
  v34 = (void *)MEMORY[0x24BDD16E0];
  -[TAFilterLeavingLOISettings thresholdOfSignificantDuration](self->_filterLeavingLOISettings, "thresholdOfSignificantDuration");
  objc_msgSend(v34, "numberWithDouble:");
  v69 = (void *)objc_claimAutoreleasedReturnValue();
  v127[53] = v69;
  v126[54] = CFSTR("TAFilterLeavingLOIThresholdOfSignificantDistance");
  v35 = (void *)MEMORY[0x24BDD16E0];
  -[TAFilterLeavingLOISettings thresholdOfSignificantDistance](self->_filterLeavingLOISettings, "thresholdOfSignificantDistance");
  objc_msgSend(v35, "numberWithDouble:");
  v67 = (void *)objc_claimAutoreleasedReturnValue();
  v127[54] = v67;
  v126[55] = CFSTR("TAFilterLeavingLOIEnabledLoiTypes");
  -[TAFilterLeavingLOISettings enabledLoiTypesToString](self->_filterLeavingLOISettings, "enabledLoiTypesToString");
  v68 = (void *)objc_claimAutoreleasedReturnValue();
  v127[55] = v68;
  v126[56] = CFSTR("TAFilterLeavingHomeImmediacyType");
  objc_msgSend(MEMORY[0x24BDD16E0], "numberWithUnsignedInteger:", -[TAFilterLeavingLOISettings leavingHomeImmediacyType](self->_filterLeavingLOISettings, "leavingHomeImmediacyType"));
  v66 = (void *)objc_claimAutoreleasedReturnValue();
  v127[56] = v66;
  v126[57] = CFSTR("TAFilterLeavingWorkImmediacyType");
  objc_msgSend(MEMORY[0x24BDD16E0], "numberWithUnsignedInteger:", -[TAFilterLeavingLOISettings leavingWorkImmediacyType](self->_filterLeavingLOISettings, "leavingWorkImmediacyType"));
  v65 = (void *)objc_claimAutoreleasedReturnValue();
  v127[57] = v65;
  v126[58] = CFSTR("TAFilterGeneralAllowNavGeoAsPrivateVehicleHint");
  objc_msgSend(MEMORY[0x24BDD16E0], "numberWithBool:", -[TAFilterGeneralSettings allowNavGeoHintAsPrivateVehicleHint](self->_filterGeneralSettings, "allowNavGeoHintAsPrivateVehicleHint"));
  v64 = (void *)objc_claimAutoreleasedReturnValue();
  v127[58] = v64;
  v126[59] = CFSTR("TAFilterGeneralVehicularImmediacyType");
  objc_msgSend(MEMORY[0x24BDD16E0], "numberWithUnsignedInteger:", -[TAFilterGeneralSettings vehicularImmediacyType](self->_filterGeneralSettings, "vehicularImmediacyType"));
  v63 = (void *)objc_claimAutoreleasedReturnValue();
  v127[59] = v63;
  v126[60] = CFSTR("TAFilterGeneralBeepOnMoveVehicularImmediacyType");
  objc_msgSend(MEMORY[0x24BDD16E0], "numberWithUnsignedInteger:", -[TAFilterGeneralSettings beepOnMoveVehicularImmediacyType](self->_filterGeneralSettings, "beepOnMoveVehicularImmediacyType"));
  v62 = (void *)objc_claimAutoreleasedReturnValue();
  v127[60] = v62;
  v126[61] = CFSTR("TAFilterGeneralBeepOnMovePedestrianImmediacyType");
  objc_msgSend(MEMORY[0x24BDD16E0], "numberWithUnsignedInteger:", -[TAFilterGeneralSettings beepOnMovePedestrianImmediacyType](self->_filterGeneralSettings, "beepOnMovePedestrianImmediacyType"));
  v61 = (void *)objc_claimAutoreleasedReturnValue();
  v127[61] = v61;
  v126[62] = CFSTR("TAFilterGeneralNextPLOIVehicularImmediacyType");
  objc_msgSend(MEMORY[0x24BDD16E0], "numberWithUnsignedInteger:", -[TAFilterGeneralSettings nextPLOIVehicularImmediacyType](self->_filterGeneralSettings, "nextPLOIVehicularImmediacyType"));
  v60 = (void *)objc_claimAutoreleasedReturnValue();
  v127[62] = v60;
  v126[63] = CFSTR("TAFilterGeneralNextPLOIPedestrianImmediacyType");
  objc_msgSend(MEMORY[0x24BDD16E0], "numberWithUnsignedInteger:", -[TAFilterGeneralSettings nextPLOIPedestrianImmediacyType](self->_filterGeneralSettings, "nextPLOIPedestrianImmediacyType"));
  v59 = (void *)objc_claimAutoreleasedReturnValue();
  v127[63] = v59;
  v126[64] = CFSTR("TAServiceEnableTAFilterGeneral");
  objc_msgSend(MEMORY[0x24BDD16E0], "numberWithBool:", -[TATrackingAvoidanceServiceSettings enableTAFilterGeneral](self->_serviceSettings, "enableTAFilterGeneral"));
  v58 = (void *)objc_claimAutoreleasedReturnValue();
  v127[64] = v58;
  v126[65] = CFSTR("TAServiceEnableTAFilterVisits");
  objc_msgSend(MEMORY[0x24BDD16E0], "numberWithBool:", -[TATrackingAvoidanceServiceSettings enableTAFilterVisits](self->_serviceSettings, "enableTAFilterVisits"));
  v57 = (void *)objc_claimAutoreleasedReturnValue();
  v127[65] = v57;
  v126[66] = CFSTR("TAServiceEnableTAFilterSingleVisit");
  objc_msgSend(MEMORY[0x24BDD16E0], "numberWithBool:", -[TATrackingAvoidanceServiceSettings enableTAFilterSingleVisit](self->_serviceSettings, "enableTAFilterSingleVisit"));
  v56 = (void *)objc_claimAutoreleasedReturnValue();
  v127[66] = v56;
  v126[67] = CFSTR("TAServiceEnableTAFilterLeavingLOI");
  objc_msgSend(MEMORY[0x24BDD16E0], "numberWithBool:", -[TATrackingAvoidanceServiceSettings enableTAFilterLeavingLOI](self->_serviceSettings, "enableTAFilterLeavingLOI"));
  v55 = (void *)objc_claimAutoreleasedReturnValue();
  v127[67] = v55;
  v126[68] = CFSTR("TAServiceClassificationTimeInterval");
  v36 = (void *)MEMORY[0x24BDD16E0];
  -[TATrackingAvoidanceServiceSettings classificationTimeInterval](self->_serviceSettings, "classificationTimeInterval");
  objc_msgSend(v36, "numberWithDouble:");
  v54 = (void *)objc_claimAutoreleasedReturnValue();
  v127[68] = v54;
  v126[69] = CFSTR("TAFilterVisitsEnabledLoiTypes");
  -[TAFilterVisitsSettings sensitiveLOITypesToString](self->_filterVisitsSettings, "sensitiveLOITypesToString");
  v37 = (void *)objc_claimAutoreleasedReturnValue();
  v127[69] = v37;
  v126[70] = CFSTR("TAPersistenceInterval");
  objc_msgSend(MEMORY[0x24BDD16E0], "numberWithDouble:", self->_persistenceInterval);
  v38 = (void *)objc_claimAutoreleasedReturnValue();
  v127[70] = v38;
  v126[71] = CFSTR("TAPersistenceDirectory");
  -[TAPersistenceManagerSettings persistenceDirectoryURL](self->_persistenceManagerSettings, "persistenceDirectoryURL");
  v39 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v39, "description");
  v40 = (void *)objc_claimAutoreleasedReturnValue();
  v127[71] = v40;
  v126[72] = CFSTR("TAPersistenceStoreFileName");
  -[TAPersistenceManagerSettings persistenceStoreFileName](self->_persistenceManagerSettings, "persistenceStoreFileName");
  v41 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v41, "description");
  v42 = (void *)objc_claimAutoreleasedReturnValue();
  v127[72] = v42;
  v126[73] = CFSTR("TAAnalyticsManagerEnableSubmission");
  objc_msgSend(MEMORY[0x24BDD16E0], "numberWithBool:", -[TAAnalyticsManagerSettings enableSubmission](self->_analyticsManagerSettings, "enableSubmission"));
  v43 = (void *)objc_claimAutoreleasedReturnValue();
  v127[73] = v43;
  v126[74] = CFSTR("TASettingsVersion");
  objc_msgSend(MEMORY[0x24BDD16E0], "numberWithUnsignedInteger:", self->_settingsVersion);
  v44 = (void *)objc_claimAutoreleasedReturnValue();
  v127[74] = v44;
  v126[75] = CFSTR("TAAISFetchEnable");
  objc_msgSend(MEMORY[0x24BDD16E0], "numberWithBool:", self->_aisFetchEnabled);
  v45 = (void *)objc_claimAutoreleasedReturnValue();
  v127[75] = v45;
  objc_msgSend(MEMORY[0x24BDBCE70], "dictionaryWithObjects:forKeys:count:", v127, v126, 76);
  v122 = (void *)objc_claimAutoreleasedReturnValue();

  v124 = 0;
  objc_msgSend(MEMORY[0x24BDD1608], "JSONStringFromNSDictionary:error:", v122, &v124);
  v46 = (void *)objc_claimAutoreleasedReturnValue();
  v47 = v124;
  if (v47)
  {
    v48 = (id)TAStatusLog;
    if (os_log_type_enabled(v48, OS_LOG_TYPE_ERROR))
    {
      v49 = (objc_class *)objc_opt_class();
      NSStringFromClass(v49);
      v50 = (void *)objc_claimAutoreleasedReturnValue();
      -[TASettings description].cold.1(v50, (uint64_t)v47, buf, v48);
    }

    objc_msgSend(MEMORY[0x24BDD17C8], "string");
    v51 = (id)objc_claimAutoreleasedReturnValue();
  }
  else
  {
    v51 = v46;
  }
  v52 = v51;

  return v52;
}

- (BOOL)trackingAvoidanceEnabled
{
  return self->_trackingAvoidanceEnabled;
}

- (void)setTrackingAvoidanceEnabled:(BOOL)a3
{
  self->_trackingAvoidanceEnabled = a3;
}

- (BOOL)peopleDensityEnabled
{
  return self->_peopleDensityEnabled;
}

- (void)setPeopleDensityEnabled:(BOOL)a3
{
  self->_peopleDensityEnabled = a3;
}

- (unint64_t)maximumDailyScans
{
  return self->_maximumDailyScans;
}

- (void)setMaximumDailyScans:(unint64_t)a3
{
  self->_maximumDailyScans = a3;
}

- (unint64_t)notificationThrottleHours
{
  return self->_notificationThrottleHours;
}

- (void)setNotificationThrottleHours:(unint64_t)a3
{
  self->_notificationThrottleHours = a3;
}

- (unint64_t)notificationThrottleMaxPerPeriod
{
  return self->_notificationThrottleMaxPerPeriod;
}

- (void)setNotificationThrottleMaxPerPeriod:(unint64_t)a3
{
  self->_notificationThrottleMaxPerPeriod = a3;
}

- (double)persistenceInterval
{
  return self->_persistenceInterval;
}

- (void)setPersistenceInterval:(double)a3
{
  self->_persistenceInterval = a3;
}

- (BOOL)aisFetchEnabled
{
  return self->_aisFetchEnabled;
}

- (void)setAisFetchEnabled:(BOOL)a3
{
  self->_aisFetchEnabled = a3;
}

- (TAFilterGeneralSettings)filterGeneralSettings
{
  return self->_filterGeneralSettings;
}

- (void)setFilterGeneralSettings:(id)a3
{
  objc_storeStrong((id *)&self->_filterGeneralSettings, a3);
}

- (void)setFilterVisitsSettings:(id)a3
{
  objc_storeStrong((id *)&self->_filterVisitsSettings, a3);
}

- (void)setFilterSingleVisitSettings:(id)a3
{
  objc_storeStrong((id *)&self->_filterSingleVisitSettings, a3);
}

- (TAFilterLeavingLOISettings)filterLeavingLOISettings
{
  return self->_filterLeavingLOISettings;
}

- (void)setFilterLeavingLOISettings:(id)a3
{
  objc_storeStrong((id *)&self->_filterLeavingLOISettings, a3);
}

- (TAEventBufferSettings)eventBufferSettings
{
  return self->_eventBufferSettings;
}

- (void)setEventBufferSettings:(id)a3
{
  objc_storeStrong((id *)&self->_eventBufferSettings, a3);
}

- (TAVisitStateSettings)visitStateSettings
{
  return self->_visitStateSettings;
}

- (void)setVisitStateSettings:(id)a3
{
  objc_storeStrong((id *)&self->_visitStateSettings, a3);
}

- (TADeviceRecordSettings)deviceRecordSettings
{
  return self->_deviceRecordSettings;
}

- (void)setDeviceRecordSettings:(id)a3
{
  objc_storeStrong((id *)&self->_deviceRecordSettings, a3);
}

- (TAScanRequestSettings)scanRequestSettings
{
  return self->_scanRequestSettings;
}

- (void)setScanRequestSettings:(id)a3
{
  objc_storeStrong((id *)&self->_scanRequestSettings, a3);
}

- (TATrackingAvoidanceServiceSettings)serviceSettings
{
  return self->_serviceSettings;
}

- (void)setServiceSettings:(id)a3
{
  objc_storeStrong((id *)&self->_serviceSettings, a3);
}

- (TAPersistenceManagerSettings)persistenceManagerSettings
{
  return self->_persistenceManagerSettings;
}

- (void)setPersistenceManagerSettings:(id)a3
{
  objc_storeStrong((id *)&self->_persistenceManagerSettings, a3);
}

- (TAAnalyticsManagerSettings)analyticsManagerSettings
{
  return self->_analyticsManagerSettings;
}

- (void)setAnalyticsManagerSettings:(id)a3
{
  objc_storeStrong((id *)&self->_analyticsManagerSettings, a3);
}

- (unint64_t)settingsVersion
{
  return self->_settingsVersion;
}

- (void)setSettingsVersion:(unint64_t)a3
{
  self->_settingsVersion = a3;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_analyticsManagerSettings, 0);
  objc_storeStrong((id *)&self->_persistenceManagerSettings, 0);
  objc_storeStrong((id *)&self->_serviceSettings, 0);
  objc_storeStrong((id *)&self->_scanRequestSettings, 0);
  objc_storeStrong((id *)&self->_deviceRecordSettings, 0);
  objc_storeStrong((id *)&self->_visitStateSettings, 0);
  objc_storeStrong((id *)&self->_eventBufferSettings, 0);
  objc_storeStrong((id *)&self->_filterLeavingLOISettings, 0);
  objc_storeStrong((id *)&self->_filterSingleVisitSettings, 0);
  objc_storeStrong((id *)&self->_filterVisitsSettings, 0);
  objc_storeStrong((id *)&self->_filterGeneralSettings, 0);
}

- (void)description
{
  *(_DWORD *)buf = 138412546;
  *(_QWORD *)(buf + 4) = a1;
  *((_WORD *)buf + 6) = 2112;
  *(_QWORD *)(buf + 14) = a2;
  _os_log_error_impl(&dword_217877000, log, OS_LOG_TYPE_ERROR, "%@ instance failed to create description:%@", buf, 0x16u);

}

@end
