@implementation NIServerAnalyticsManager

- (NIServerAnalyticsManager)initWithBundleIdentifier:(id)a3
{
  id v5;
  NIServerAnalyticsManager *v6;
  NIServerAnalyticsManager *v7;
  NIServerAnalyticsManager *v8;
  NSString *bundleIdentifier;
  void **p_bundleIdAsStdString;
  uint64_t v11;
  double maxDistance;
  double minDistance;
  __int128 v19;
  __int128 v21;
  __int128 v22;
  __int128 v23;
  uint64_t v24;
  objc_super v25;

  v5 = a3;
  v25.receiver = self;
  v25.super_class = (Class)NIServerAnalyticsManager;
  v6 = -[NIServerAnalyticsManager init](&v25, "init");
  v7 = v6;
  v8 = v6;
  if (v6)
  {
    objc_storeStrong((id *)&v6->_bundleIdentifier, a3);
    bundleIdentifier = v8->_bundleIdentifier;
    if (bundleIdentifier)
    {
      sub_10000BF04(&v23, (char *)-[NSString UTF8String](bundleIdentifier, "UTF8String"));
      p_bundleIdAsStdString = (void **)&v7->_bundleIdAsStdString;
      if (*((char *)&v8->_bundleIdAsStdString.__r_.__value_.var0.var1 + 23) < 0)
        operator delete(*p_bundleIdAsStdString);
      v11 = v24;
      *(_OWORD *)p_bundleIdAsStdString = v23;
      *((_QWORD *)&v7->_bundleIdAsStdString.__r_.__value_.var0.var1 + 2) = v11;
    }
    else
    {
      std::string::assign((std::string *)&v7->_bundleIdAsStdString, "");
    }
    LOBYTE(v8->_bundleIdAsStdString.__r_.var0) = 0;
    v8->_bundleIdAsStdString.var0 = 0;
    v8->_isRunning = 1;
    *(_QWORD *)&v8->_isVisible = 0;
    v8->_visibilityUpdateTimestamp = 0.0;
    v8->_runTimestamp = 0.0;
    LOBYTE(v8->_timeSpentVisible) = 0;
    *(_OWORD *)&v8->_timeSpentNotVisible = 0u;
    *(_OWORD *)&v8->_firstDistance = 0u;
    maxDistance = v8->_maxDistance;
    *(_QWORD *)&v8->_maxDistance = CFSTR("None");

    minDistance = v8->_minDistance;
    *(_QWORD *)&v8->_minDistance = CFSTR("None");

    LODWORD(v8->_lifecycleTimeoutType) = 0;
    v8->_backgroundContinuationTimeoutType = 0;
    *(_QWORD *)((char *)&v8->_sessionType + 1) = 0;
    BYTE1(v8->_backgroundMode) = 0;
    *(_QWORD *)&v8->_hasHorizontallyConverged = 0;
    *(_QWORD *)&v8->_lastVIOPosition[6] = 0;
    *(_QWORD *)&v8->_isCameraAssistanceEnabled = 0;
    __asm { FMOV            V0.2D, #-1.0 }
    *(_OWORD *)&v8->_lastVIOPosition[14] = _Q0;
    *(_OWORD *)&v8->_distanceMovedToHorizontalConvergence = _Q0;
    v21 = _Q0;
    *(_OWORD *)&v8->_totalDistanceMoved = _Q0;
    v8->_rangeAtVerticalConvergence = -1.0;
    v8->_timeToHorizontalConvergence = 0.0;
    LODWORD(v8->_timeToVerticalConvergence) = 0;
    *(_QWORD *)&v8->_numberOfInvalidPose = 0xBFF0000000000000;
    v8->_timeAtLastLocationUpdate = -1.0;
    if (*((_BYTE *)&v8->_numberOfLostVerticalConvergence + 4))
      *((_BYTE *)&v8->_numberOfLostVerticalConvergence + 4) = 0;
    *(_OWORD *)&v7->_timeLocationFromLOIOverride = 0u;
    *(_OWORD *)&v7->_timeLocationFromPipeline = 0u;
    *(_OWORD *)&v7->_timeLocationFromCompensated = 0u;
    *(_OWORD *)&v7->_timeLocationFromGPSCoarse = 0u;
    *(_OWORD *)&v7->_lastLocationType.var0.__null_state_ = 0u;
    *(_OWORD *)&v7->_timeLocationFromAccessory = 0u;
    *(_QWORD *)&v19 = -1;
    *((_QWORD *)&v19 + 1) = -1;
    *(_OWORD *)&v7->_timeLocationFromWiFi = v19;
    *(_OWORD *)&v7->_numberOfPeerData = v19;
    *(_OWORD *)&v7->_numberOfLocationFromPeerData = v19;
    *(_QWORD *)&v8->_numberOfWalkingOrkUnknown = 0xBFF0000000000000;
    *(_QWORD *)&v8->_numberOfMissedRanges = 0xBFF0000000000000;
    if (BYTE4(v8->_timeAtFirstPeerData))
      BYTE4(v8->_timeAtFirstPeerData) = 0;
    *(_OWORD *)&v8->_timeAtLastBoundedDisplacementUpdate = 0u;
    *(_OWORD *)&v8->_timeFindeeWasSlowlyMoving = 0u;
    *(_OWORD *)&v8->_timeFindeeWasWalkingOrUnknown = xmmword_1004568E0;
    *(_OWORD *)&v8->_pdrTimeAtFirstPDRUpdate = xmmword_1004568E0;
    LOBYTE(v8->_pdrTimeAtLastPDRUpdate) = 0;
    v8->_timePeerLocationFromFindeeData = -1.0;
    *(_OWORD *)&v8->_timeAtLastLocationFromFindeeData = v21;
    *(_OWORD *)&v8->_timeAtFirstValidPose = v21;
    *(_OWORD *)&v8->_timeAtFirstOutputRange = v21;
    *(_OWORD *)&v8->_timeAtFirstFindeeData = v21;
    *(_OWORD *)&v8->_timeAtFirstSelfLocation = v21;
    *(_OWORD *)&v8->_timeAtFirstPeerLocationFromFindeeData = v21;
    *(_OWORD *)&v8->_timeAtFirstPDRFromFindeeData = v21;
    v8->_timeAtFirstDeltaVelocityFromFindeeData = -1.0;
    v8->_timeAtFirstStaticFromFindeeData = 0.0;
    LODWORD(v8->_timeAtEndOfSession) = 0;
    *(double *)((char *)&v7->_timeAtEndOfSession + 4) = NAN;
    *(_QWORD *)&v7->_firstOutputRangeAlgorithmSource = -1;
    *(_QWORD *)&v7->_numberOfArrowRevokes = -1;
    LOWORD(v8->_numberOfSolutions) = 0;
    BYTE2(v8->_numberOfSolutions) = 0;
    if (v8->_anon_3a8[56])
      v8->_anon_3a8[56] = 0;
    -[NIServerAnalyticsManager _onVIOReset](v8, "_onVIOReset", v21);
    if (v8->_anon_9d8[169])
      v8->_anon_9d8[169] = 0;
    if (v8->_anon_9d8[171])
      v8->_anon_9d8[171] = 0;
    *(_QWORD *)&v8->_anon_9d8[176] = 0;
    *(_QWORD *)&v8->_isFinderAPhone.var0.__null_state_ = 0xBFF0000000000000;
    *(_OWORD *)&v7->_timePDRAndVIOWasAvailable = 0u;
    if (v8->_anon_af8[56])
      v8->_anon_af8[56] = 0;
    *(_OWORD *)&v8->_anon_af8[72] = v22;
    *(_OWORD *)&v8->_pathLengthError = v22;
    *(_OWORD *)&v8->_radialDisplacementError = v22;
    *(_OWORD *)&v8->_stdSpeedFromVIO = 0uLL;
    *(_OWORD *)&v8->_timeSSFromVIO = 0uLL;
    *(_OWORD *)&v8->_timeSSFromIOAndSSFromVIO = v22;
    *(_OWORD *)&v8->_pdrSSDetectionTruePositiveRate = v22;
    *(_OWORD *)&v8->_percentTimeSSFromVIO = 0uLL;
    v8->_runningMeanSpeedFromVIO = NAN;
    v8->_m2 = -1.0;
    *(_OWORD *)&v8->_acquisitionReason = 0uLL;
    v8->_firstNBRSSI = -1.0;
    *(_OWORD *)&v7->_firstUWBRSSI = 0uLL;
    v8->_lastNBRSSI = -1.79769313e308;
    *(int64x2_t *)&v8->_lastUWBRSSI = vdupq_n_s64(0xFFEFFFFFFFFFFFFFLL);
    *(int64x2_t *)&v8->_maxNBRSSI = vdupq_n_s64(0x7FEFFFFFFFFFFFFFuLL);
    *(_OWORD *)&v8->_minDistance_finding = xmmword_1004568F0;
    *(_OWORD *)&v8->_minUWBRSSI = xmmword_1004568F0;
    v8->_minYCoordinateFinder = 1.79769313e308;
    LOWORD(v8->_maxYCoordinateFindee) = 0;
    if (LOBYTE(v8->_minYCoordinateFindee))
      LOBYTE(v8->_minYCoordinateFindee) = 0;
    *(_OWORD *)&v7->_didFinderChangeFloor = 0u;
    v8->_firstRawRangeValue = -1.79769313e308;
    *(_OWORD *)&v8->_currentRawRangeValue = xmmword_100456900;
    v8->_minRawRangeValue = -1.0;
    LODWORD(v8->_timeAtFirstIOPose.var0.__val_) = 0;
    v8->_deltaVSourceTime = 0.0;
    v7->_lastSolutionTime = 0u;
    *(_OWORD *)&v7->_vioAvailableTime = 0u;
  }

  return v8;
}

- (void)dealloc
{
  objc_super v3;

  -[NIServerAnalyticsManager _sessionStoppedWithTimestamp:](self, "_sessionStoppedWithTimestamp:", sub_10000883C());
  v3.receiver = self;
  v3.super_class = (Class)NIServerAnalyticsManager;
  -[NIServerAnalyticsManager dealloc](&v3, "dealloc");
}

- (void)sessionSuccessfullyRanWithConfig:(id)a3 withTimestamp:(double)a4
{
  id v7;
  NSObject *v8;
  NSString *bundleIdentifier;
  NSObject *v10;
  NSString *v11;
  double maxDistance;
  double minDistance;
  __int128 v19;
  uint64_t v20;
  NSString **p_lifecycleTimeoutType;
  NSString **p_backgroundContinuationTimeoutType;
  uint64_t v23;
  uint64_t v24;
  uint64_t v25;
  uint64_t v26;
  uint64_t v27;
  uint64_t v28;
  uint64_t v29;
  int v30;
  id v31;
  id v32;
  id v33;
  id v34;
  void *v35;
  id v36;
  _BYTE *v37;
  size_t v38;
  unsigned __int8 v39;
  _QWORD *v40;
  unsigned __int8 v41;
  unsigned __int8 *v42;
  unsigned __int8 v43;
  id v44;
  void *v45;
  void *v46;
  NSString *v47;
  void *v48;
  id v49;
  NSObject *v50;
  NSString *v51;
  void *v52;
  id v53;
  uint64_t v54;
  unsigned int v55;
  _BOOL4 v56;
  _BOOL4 v57;
  unsigned int v58;
  uint64_t v59;
  int v60;
  BOOL v61;
  int v62;
  int v63;
  int v64;
  char v65;
  void *v66;
  __int128 v67;
  _QWORD v68[4];
  id v69;
  _WORD *v70;
  _BYTE *v71;
  uint64_t v72;
  _BYTE buf[22];
  __int16 v74;
  double v75;
  unsigned __int8 v76;
  int v77;

  v7 = a3;
  if (!v7)
  {
    v66 = (void *)objc_claimAutoreleasedReturnValue(+[NSAssertionHandler currentHandler](NSAssertionHandler, "currentHandler"));
    objc_msgSend(v66, "handleFailureInMethod:object:file:lineNumber:description:", a2, self, CFSTR("NIServerAnalyticsManager.mm"), 620, CFSTR("Invalid parameter not satisfying: %@"), CFSTR("configuration"));

  }
  v8 = qword_10085F520;
  if (os_log_type_enabled((os_log_t)qword_10085F520, OS_LOG_TYPE_INFO))
  {
    bundleIdentifier = self->_bundleIdentifier;
    *(_DWORD *)buf = 138412802;
    *(_QWORD *)&buf[4] = bundleIdentifier;
    *(_WORD *)&buf[12] = 2112;
    *(_QWORD *)&buf[14] = v7;
    v74 = 2048;
    v75 = a4;
    _os_log_impl((void *)&_mh_execute_header, v8, OS_LOG_TYPE_INFO, "#ni-ca,[%@] sessionSuccessfullyRanWithConfig: %@ withTimestamp: %f [s]", buf, 0x20u);
  }
  if (LOBYTE(self->_bundleIdAsStdString.__r_.var0))
  {
    v10 = qword_10085F520;
    if (os_log_type_enabled((os_log_t)qword_10085F520, OS_LOG_TYPE_INFO))
    {
      v11 = self->_bundleIdentifier;
      *(_DWORD *)buf = 138412290;
      *(_QWORD *)&buf[4] = v11;
      _os_log_impl((void *)&_mh_execute_header, v10, OS_LOG_TYPE_INFO, "#ni-ca,[%@] Session is already running. Stop it first.", buf, 0xCu);
    }
    -[NIServerAnalyticsManager _sessionStoppedWithTimestamp:](self, "_sessionStoppedWithTimestamp:", a4);
    LOBYTE(self->_bundleIdAsStdString.__r_.var0) = 0;
  }
  LOBYTE(self->_bundleIdAsStdString.__r_.var0) = 1;
  *(double *)&self->_bundleIdAsStdString.var0 = a4;
  self->_runTimestamp = a4;
  *(_QWORD *)&self->_isVisible = 0;
  self->_visibilityUpdateTimestamp = 0.0;
  LOBYTE(self->_timeSpentVisible) = 0;
  *(_OWORD *)&self->_timeSpentNotVisible = 0u;
  *(_OWORD *)&self->_firstDistance = 0u;
  maxDistance = self->_maxDistance;
  *(_QWORD *)&self->_maxDistance = CFSTR("None");

  minDistance = self->_minDistance;
  *(_QWORD *)&self->_minDistance = CFSTR("None");

  *(int *)((char *)&self->_sessionType + 6) = 0;
  *(int *)((char *)&self->_sessionType + 3) = 0;
  *(_QWORD *)&self->_hasHorizontallyConverged = 0;
  *(_QWORD *)&self->_lastVIOPosition[6] = 0;
  *(_QWORD *)&self->_isCameraAssistanceEnabled = 0;
  __asm { FMOV            V0.2D, #-1.0 }
  *(_OWORD *)&self->_lastVIOPosition[14] = _Q0;
  *(_OWORD *)&self->_distanceMovedToHorizontalConvergence = _Q0;
  v67 = _Q0;
  *(_OWORD *)&self->_totalDistanceMoved = _Q0;
  self->_rangeAtVerticalConvergence = -1.0;
  self->_timeToHorizontalConvergence = 0.0;
  LODWORD(self->_timeToVerticalConvergence) = 0;
  *(_QWORD *)&self->_numberOfInvalidPose = 0xBFF0000000000000;
  self->_timeAtLastLocationUpdate = -1.0;
  if (*((_BYTE *)&self->_numberOfLostVerticalConvergence + 4))
    *((_BYTE *)&self->_numberOfLostVerticalConvergence + 4) = 0;
  *(_OWORD *)&self->_timeLocationFromLOIOverride = 0u;
  *(_OWORD *)&self->_timeLocationFromPipeline = 0u;
  *(_OWORD *)&self->_timeLocationFromCompensated = 0u;
  *(_OWORD *)&self->_timeLocationFromGPSCoarse = 0u;
  *(_OWORD *)&self->_lastLocationType.var0.__null_state_ = 0u;
  *(_OWORD *)&self->_timeLocationFromAccessory = 0u;
  *(_QWORD *)&v19 = -1;
  *((_QWORD *)&v19 + 1) = -1;
  *(_OWORD *)&self->_timeLocationFromWiFi = v19;
  *(_OWORD *)&self->_numberOfPeerData = v19;
  *(_OWORD *)&self->_numberOfLocationFromPeerData = v19;
  *(_QWORD *)&self->_numberOfWalkingOrkUnknown = 0xBFF0000000000000;
  *(_QWORD *)&self->_numberOfMissedRanges = 0xBFF0000000000000;
  if (BYTE4(self->_timeAtFirstPeerData))
    BYTE4(self->_timeAtFirstPeerData) = 0;
  *(_OWORD *)&self->_timeAtLastBoundedDisplacementUpdate = 0uLL;
  *(_OWORD *)&self->_timeFindeeWasSlowlyMoving = 0uLL;
  *(_OWORD *)&self->_timeFindeeWasWalkingOrUnknown = xmmword_1004568E0;
  *(_OWORD *)&self->_pdrTimeAtFirstPDRUpdate = xmmword_1004568E0;
  LOBYTE(self->_pdrTimeAtLastPDRUpdate) = 0;
  self->_timePeerLocationFromFindeeData = -1.0;
  *(_OWORD *)&self->_timeAtLastLocationFromFindeeData = _Q0;
  *(_OWORD *)&self->_timeAtFirstValidPose = _Q0;
  *(_OWORD *)&self->_timeAtFirstFindeeData = _Q0;
  *(_OWORD *)&self->_timeAtFirstSelfLocation = _Q0;
  *(_OWORD *)&self->_timeAtFirstPeerLocationFromFindeeData = _Q0;
  *(_OWORD *)&self->_timeAtFirstPDRFromFindeeData = _Q0;
  self->_timeAtFirstDeltaVelocityFromFindeeData = -1.0;
  self->_timeAtFirstStaticFromFindeeData = 0.0;
  LODWORD(self->_timeAtEndOfSession) = 0;
  *(double *)((char *)&self->_timeAtEndOfSession + 4) = NAN;
  *(_QWORD *)&self->_firstOutputRangeAlgorithmSource = -1;
  *(_QWORD *)&self->_numberOfArrowRevokes = -1;
  LOWORD(self->_numberOfSolutions) = 0;
  BYTE2(self->_numberOfSolutions) = 0;
  if (self->_anon_3a8[56])
    self->_anon_3a8[56] = 0;
  -[NIServerAnalyticsManager _onVIOReset](self, "_onVIOReset");
  if (self->_anon_9d8[169])
    self->_anon_9d8[169] = 0;
  if (self->_anon_9d8[171])
    self->_anon_9d8[171] = 0;
  *(_QWORD *)&self->_anon_9d8[176] = 0;
  *(_QWORD *)&self->_isFinderAPhone.var0.__null_state_ = 0xBFF0000000000000;
  *(_OWORD *)&self->_timePDRAndVIOWasAvailable = 0u;
  if (self->_anon_af8[56])
    self->_anon_af8[56] = 0;
  *(_OWORD *)&self->_anon_af8[72] = v67;
  *(_OWORD *)&self->_pathLengthError = v67;
  *(_OWORD *)&self->_radialDisplacementError = v67;
  *(_OWORD *)&self->_stdSpeedFromVIO = 0uLL;
  *(_OWORD *)&self->_timeSSFromVIO = 0uLL;
  *(_OWORD *)&self->_timeSSFromIOAndSSFromVIO = v67;
  *(_OWORD *)&self->_pdrSSDetectionTruePositiveRate = v67;
  *(_OWORD *)&self->_percentTimeSSFromVIO = 0uLL;
  self->_runningMeanSpeedFromVIO = NAN;
  self->_m2 = -1.0;
  *(_OWORD *)&self->_acquisitionReason = 0uLL;
  self->_firstNBRSSI = -1.0;
  *(_OWORD *)&self->_firstUWBRSSI = 0uLL;
  self->_lastNBRSSI = -1.79769313e308;
  *(int64x2_t *)&self->_lastUWBRSSI = vdupq_n_s64(0xFFEFFFFFFFFFFFFFLL);
  *(int64x2_t *)&self->_maxNBRSSI = vdupq_n_s64(0x7FEFFFFFFFFFFFFFuLL);
  *(_OWORD *)&self->_minDistance_finding = xmmword_1004568F0;
  *(_OWORD *)&self->_minUWBRSSI = xmmword_1004568F0;
  self->_minYCoordinateFinder = 1.79769313e308;
  LOWORD(self->_maxYCoordinateFindee) = 0;
  if (LOBYTE(self->_minYCoordinateFindee))
    LOBYTE(self->_minYCoordinateFindee) = 0;
  LODWORD(self->_lifecycleTimeoutType) = 0;
  p_lifecycleTimeoutType = &self->_lifecycleTimeoutType;
  *(_OWORD *)&self->_didFinderChangeFloor = 0u;
  self->_firstRawRangeValue = -1.79769313e308;
  *(_OWORD *)&self->_currentRawRangeValue = xmmword_100456900;
  self->_minRawRangeValue = -1.0;
  self->_backgroundContinuationTimeoutType = 0;
  p_backgroundContinuationTimeoutType = &self->_backgroundContinuationTimeoutType;
  *(_DWORD *)((char *)&self->_backgroundContinuationTimeoutType + 7) = 0;
  v23 = objc_opt_class(v7, v20);
  if (v23 == objc_opt_class(NINearbyPeerConfiguration, v24))
  {
    *(_DWORD *)p_lifecycleTimeoutType = 1;
    v31 = v7;
    *p_backgroundContinuationTimeoutType = (NSString *)objc_msgSend(v31, "backgroundMode");
    LOBYTE(self->_sessionType) = objc_msgSend(v31, "_internalIsCameraAssistanceEnabled");

    goto LABEL_35;
  }
  v26 = objc_opt_class(v7, v25);
  if (v26 == objc_opt_class(NINearbyAccessoryConfiguration, v27))
  {
    *(_DWORD *)p_lifecycleTimeoutType = 2;
    v32 = v7;
    *p_backgroundContinuationTimeoutType = (NSString *)objc_msgSend(v32, "backgroundMode");
    LOBYTE(self->_sessionType) = objc_msgSend(v32, "_internalIsCameraAssistanceEnabled");
    v33 = objc_retainAutorelease((id)objc_claimAutoreleasedReturnValue(objc_msgSend(v32, "accessoryConfigData")));
    v34 = objc_msgSend(v33, "bytes");

    v35 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v32, "accessoryConfigData"));
    v36 = objc_msgSend(v35, "length");
    v70 = 0;
    v71 = 0;
    v72 = 0;
    sub_10003A474(&v70, v34, (uint64_t)v36 + (_QWORD)v34, (size_t)v36);

    v37 = v70;
    v38 = v71 - (_BYTE *)v70;
    if ((unint64_t)(v71 - (_BYTE *)v70) >= 0x14)
    {
      v54 = 0;
      v55 = (unsigned __int16)*v70;
      v56 = !v70[1] && v55 == 1;
      v57 = v70[1] && v55 == 1;
      v58 = (unsigned __int16)v70[8];
      v59 = (unsigned __int16)v70[9];
      while (__PAIR64__(v59, v58) != __PAIR64__((unsigned __int16)word_1004569B0[v54 + 1], (unsigned __int16)word_1004569B0[v54]))
      {
        v54 += 2;
        if (v54 == 6)
        {
          v60 = 0;
          goto LABEL_64;
        }
      }
      v60 = 1;
LABEL_64:
      v61 = v58 == 1 && v59 > 2;
      v62 = v61;
      v63 = v58 <= 1 ? v62 : 1;
      v64 = v55 > 1 || v56;
      if ((v64 | v57) == 1 && v60 | v63)
      {
        if (v60)
        {
          if (v58 != 1 || v59 >= 3)
            __assert_rtn("UWBConfigDataTotalLengthBytes", "NIFiRaDefinitions.h", 375, "false");
          if (v38 != 2 * v59 + 35 || *((unsigned __int8 *)v70 + 15) != (2 * v59 + 19))
            goto LABEL_33;
        }
        else if (v63)
        {
          if (v38 < 0x27 || *((unsigned __int8 *)v70 + 15) < 0x17u)
            goto LABEL_33;
          v38 = 39;
        }
        else
        {
          v38 = 0;
        }
        *(_DWORD *)buf = 0;
        *(_DWORD *)&buf[16] = 0;
        v77 = 0;
        *(_QWORD *)&buf[5] = 0;
        *(_WORD *)&buf[13] = 0;
        memcpy(buf, v70, v38);
        v65 = buf[4];
        if (buf[4] <= 0x14u
          && ((1 << buf[4]) & 0x100401) != 0
          && v76 <= 1u
          && BYTE2(v77) <= 1u
          && HIBYTE(v77) <= 8u
          && ((1 << SHIBYTE(v77)) & 0x10D) != 0)
        {
          BYTE1(self->_sessionType) = 1;
          BYTE2(self->_sessionType) = v65;
        }
      }
    }
    if (!v37)
    {
LABEL_34:

      goto LABEL_35;
    }
LABEL_33:
    v71 = v37;
    operator delete(v37);
    goto LABEL_34;
  }
  v29 = objc_opt_class(NIFindingConfiguration, v28);
  if ((objc_opt_isKindOfClass(v7, v29) & 1) != 0)
  {
    if (objc_msgSend(v7, "isFinder"))
      v30 = 4;
    else
      v30 = 3;
    *(_DWORD *)p_lifecycleTimeoutType = v30;
  }
LABEL_35:
  std::mutex::lock(&stru_100850D30);
  v39 = ++byte_100853B78;
  *(_QWORD *)buf = &self->_lifecycleTimeoutType;
  v40 = sub_10003A568((uint64_t)&xmmword_100853B28, (int *)&self->_lifecycleTimeoutType, (uint64_t)&unk_100472CF8, (_DWORD **)buf);
  v41 = *((_BYTE *)v40 + 20) + 1;
  *((_BYTE *)v40 + 20) = v41;
  if (self->_bundleIdentifier)
  {
    if (*((char *)&self->_bundleIdAsStdString.__r_.__value_.var0.var1 + 23) < 0)
    {
      if (self->_bundleIdAsStdString.__r_.__value_.var0.var1.__size_)
        goto LABEL_38;
    }
    else if (*((_BYTE *)&self->_bundleIdAsStdString.__r_.__value_.var0.var1 + 23))
    {
LABEL_38:
      *(_QWORD *)buf = &self->_bundleIdAsStdString;
      v42 = sub_10003A788((uint64_t)&xmmword_100853B50, (unsigned __int8 *)&self->_bundleIdAsStdString, (uint64_t)&unk_100472CF8, (__int128 **)buf);
      v43 = v42[40] + 1;
      v42[40] = v43;
      goto LABEL_40;
    }
    __assert_rtn("-[NIServerAnalyticsManager sessionSuccessfullyRanWithConfig:withTimestamp:]", "NIServerAnalyticsManager.mm", 864, "!_bundleIdAsStdString.empty()");
  }
  v43 = 0;
LABEL_40:
  std::mutex::unlock(&stru_100850D30);
  v44 = objc_alloc_init((Class)NSMutableDictionary);
  v45 = (void *)objc_claimAutoreleasedReturnValue(+[NSNumber numberWithInt:](NSNumber, "numberWithInt:", v39));
  objc_msgSend(v44, "setObject:forKey:", v45, CFSTR("numSimultaneousSessions_All"));

  switch(*(_DWORD *)p_lifecycleTimeoutType)
  {
    case 1:
      v46 = (void *)objc_claimAutoreleasedReturnValue(+[NSNumber numberWithInt:](NSNumber, "numberWithInt:", v41));
      objc_msgSend(v44, "setObject:forKey:", v46, CFSTR("numSimultaneousSessions_Peer"));
      goto LABEL_47;
    case 2:
      v46 = (void *)objc_claimAutoreleasedReturnValue(+[NSNumber numberWithInt:](NSNumber, "numberWithInt:", v41));
      objc_msgSend(v44, "setObject:forKey:", v46, CFSTR("numSimultaneousSessions_Accessory"));
      goto LABEL_47;
    case 3:
      v46 = (void *)objc_claimAutoreleasedReturnValue(+[NSNumber numberWithInt:](NSNumber, "numberWithInt:", v41));
      objc_msgSend(v44, "setObject:forKey:", v46, CFSTR("com.apple.nearbyinteraction.peopleFindingSession.FindeeSummary"));
      goto LABEL_47;
    case 4:
      v46 = (void *)objc_claimAutoreleasedReturnValue(+[NSNumber numberWithInt:](NSNumber, "numberWithInt:", v41));
      objc_msgSend(v44, "setObject:forKey:", v46, CFSTR("com.apple.nearbyinteraction.peopleFindingSession.FinderSummary"));
LABEL_47:

      break;
    default:
      break;
  }
  v47 = self->_bundleIdentifier;
  if (v47)
  {
    objc_msgSend(v44, "setObject:forKey:", v47, CFSTR("appBundleID"));
    v48 = (void *)objc_claimAutoreleasedReturnValue(+[NSNumber numberWithInt:](NSNumber, "numberWithInt:", v43));
    objc_msgSend(v44, "setObject:forKey:", v48, CFSTR("numSimultaneousSessions_ThisApp"));

  }
  v49 = objc_msgSend(v44, "mutableCopy");
  v50 = (id)qword_10085F520;
  if (os_log_type_enabled(v50, OS_LOG_TYPE_INFO))
  {
    v51 = self->_bundleIdentifier;
    v52 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v49, "description"));
    *(_DWORD *)buf = 138412802;
    *(_QWORD *)&buf[4] = v51;
    *(_WORD *)&buf[12] = 2112;
    *(_QWORD *)&buf[14] = CFSTR("com.apple.nearbyinteractionv2.start");
    v74 = 2112;
    v75 = *(double *)&v52;
    _os_log_impl((void *)&_mh_execute_header, v50, OS_LOG_TYPE_INFO, "#ni-ca,[%@] send analytics event %@:\n%@\n", buf, 0x20u);

  }
  v68[0] = _NSConcreteStackBlock;
  v68[1] = 3221225472;
  v68[2] = sub_10003344C;
  v68[3] = &unk_1007FA568;
  v53 = v49;
  v69 = v53;
  AnalyticsSendEventLazy(CFSTR("com.apple.nearbyinteractionv2.start"), v68);

}

- (void)sessionPausedWithTimestamp:(double)a3
{
  NSObject *v5;
  NSString *bundleIdentifier;
  int v7;
  NSString *v8;
  __int16 v9;
  double v10;

  v5 = qword_10085F520;
  if (os_log_type_enabled((os_log_t)qword_10085F520, OS_LOG_TYPE_INFO))
  {
    bundleIdentifier = self->_bundleIdentifier;
    v7 = 138412546;
    v8 = bundleIdentifier;
    v9 = 2048;
    v10 = a3;
    _os_log_impl((void *)&_mh_execute_header, v5, OS_LOG_TYPE_INFO, "#ni-ca,[%@] sessionPausedWithTimestamp: %f [s]", (uint8_t *)&v7, 0x16u);
  }
  -[NIServerAnalyticsManager _sessionStoppedWithTimestamp:](self, "_sessionStoppedWithTimestamp:", a3);
}

- (void)sessionInterruptedWithTimestamp:(double)a3
{
  NSObject *v5;
  NSString *bundleIdentifier;
  int v7;
  NSString *v8;
  __int16 v9;
  double v10;

  v5 = qword_10085F520;
  if (os_log_type_enabled((os_log_t)qword_10085F520, OS_LOG_TYPE_INFO))
  {
    bundleIdentifier = self->_bundleIdentifier;
    v7 = 138412546;
    v8 = bundleIdentifier;
    v9 = 2048;
    v10 = a3;
    _os_log_impl((void *)&_mh_execute_header, v5, OS_LOG_TYPE_INFO, "#ni-ca,[%@] sessionInterruptedWithTimestamp: %f [s]", (uint8_t *)&v7, 0x16u);
  }
  -[NIServerAnalyticsManager _sessionStoppedWithTimestamp:](self, "_sessionStoppedWithTimestamp:", a3);
}

- (void)sessionInvalidatedWithTimestamp:(double)a3
{
  NSObject *v5;
  NSString *bundleIdentifier;
  int v7;
  NSString *v8;
  __int16 v9;
  double v10;

  v5 = qword_10085F520;
  if (os_log_type_enabled((os_log_t)qword_10085F520, OS_LOG_TYPE_INFO))
  {
    bundleIdentifier = self->_bundleIdentifier;
    v7 = 138412546;
    v8 = bundleIdentifier;
    v9 = 2048;
    v10 = a3;
    _os_log_impl((void *)&_mh_execute_header, v5, OS_LOG_TYPE_INFO, "#ni-ca,[%@] sessionInvalidatedWithTimestamp: %f [s]", (uint8_t *)&v7, 0x16u);
  }
  -[NIServerAnalyticsManager _sessionStoppedWithTimestamp:](self, "_sessionStoppedWithTimestamp:", a3);
}

- (void)appBecameVisibleWithTimestamp:(double)a3
{
  NSObject *v5;
  NSString *bundleIdentifier;
  NSObject *v7;
  NSString *v8;
  int v9;
  NSString *v10;
  __int16 v11;
  double v12;

  v5 = qword_10085F520;
  if (os_log_type_enabled((os_log_t)qword_10085F520, OS_LOG_TYPE_INFO))
  {
    bundleIdentifier = self->_bundleIdentifier;
    v9 = 138412546;
    v10 = bundleIdentifier;
    v11 = 2048;
    v12 = a3;
    _os_log_impl((void *)&_mh_execute_header, v5, OS_LOG_TYPE_INFO, "#ni-ca,[%@] appBecameVisibleWithTimestamp: %f [s]", (uint8_t *)&v9, 0x16u);
  }
  if (self->_isRunning)
  {
    v7 = qword_10085F520;
    if (os_log_type_enabled((os_log_t)qword_10085F520, OS_LOG_TYPE_INFO))
    {
      v8 = self->_bundleIdentifier;
      v9 = 138412290;
      v10 = v8;
      _os_log_impl((void *)&_mh_execute_header, v7, OS_LOG_TYPE_INFO, "#ni-ca,[%@] App already visible. Ignore duplicate call.", (uint8_t *)&v9, 0xCu);
    }
  }
  else
  {
    self->_visibilityUpdateTimestamp = self->_visibilityUpdateTimestamp + a3 - self->_runTimestamp;
    self->_runTimestamp = a3;
    self->_isRunning = 1;
  }
}

- (void)appBecameNotVisibleWithTimestamp:(double)a3
{
  NSObject *v5;
  NSString *bundleIdentifier;
  double v7;
  NSObject *v8;
  NSString *v9;
  int v10;
  NSString *v11;
  __int16 v12;
  double v13;

  v5 = qword_10085F520;
  if (os_log_type_enabled((os_log_t)qword_10085F520, OS_LOG_TYPE_INFO))
  {
    bundleIdentifier = self->_bundleIdentifier;
    v10 = 138412546;
    v11 = bundleIdentifier;
    v12 = 2048;
    v13 = a3;
    _os_log_impl((void *)&_mh_execute_header, v5, OS_LOG_TYPE_INFO, "#ni-ca,[%@] appBecameNotVisibleWithTimestamp: %f [s]", (uint8_t *)&v10, 0x16u);
  }
  if (self->_isRunning)
  {
    v7 = *(double *)&self->_isVisible + a3 - self->_runTimestamp;
    self->_runTimestamp = a3;
    *(double *)&self->_isVisible = v7;
    self->_isRunning = 0;
  }
  else
  {
    v8 = qword_10085F520;
    if (os_log_type_enabled((os_log_t)qword_10085F520, OS_LOG_TYPE_INFO))
    {
      v9 = self->_bundleIdentifier;
      v10 = 138412290;
      v11 = v9;
      _os_log_impl((void *)&_mh_execute_header, v8, OS_LOG_TYPE_INFO, "#ni-ca,[%@] App already not visible. Ignore duplicate call.", (uint8_t *)&v10, 0xCu);
    }
  }
}

- (void)updateWithRangeResult:(RangeResult *)a3
{
  if (LOBYTE(self->_sessionType))
  {
    if (!HIBYTE(self->_sessionType))
    {
      HIBYTE(self->_sessionType) = 1;
      *(double *)&self->_lastVIOPosition[6] = a3->var1;
    }
  }
}

- (void)updateWithVIOPose:(Pose *)a3
{
  optional<double> lightEstimate;
  float32x4_t v4;
  float32x4_t v5;

  if (LOBYTE(self->_sessionType))
  {
    if (a3[1].source.var0.__val_ == 2)
    {
      if (!*((_BYTE *)&self->_sessionType + 6))
        *((_BYTE *)&self->_sessionType + 6) = 1;
      lightEstimate = a3[1].lightEstimate;
      if (*((_BYTE *)&self->_sessionType + 7))
      {
        v4 = vsubq_f32(*(float32x4_t *)&self->_isCameraAssistanceEnabled, (float32x4_t)lightEstimate);
        v5 = vmulq_f32(v4, v4);
        self->_distanceMovedToHorizontalConvergence = self->_distanceMovedToHorizontalConvergence
                                                    + sqrtf(vaddq_f32((float32x4_t)vdupq_laneq_s32((int32x4_t)v5, 2), vaddq_f32(v5, (float32x4_t)vdupq_lane_s32(*(int32x2_t *)v5.f32, 1))).f32[0]);
      }
      else
      {
        *((_BYTE *)&self->_sessionType + 7) = 1;
        self->_distanceMovedToHorizontalConvergence = 0.0;
      }
    }
    else
    {
      if (!*((_BYTE *)&self->_sessionType + 6))
        return;
      ++LODWORD(self->_timeToHorizontalConvergence);
      *((_BYTE *)&self->_sessionType + 6) = 0;
      lightEstimate = (optional<double>)0;
    }
    *(optional<double> *)&self->_isCameraAssistanceEnabled = lightEstimate;
  }
}

- (void)updateWithSASolution:(Solution *)a3
{
  if (LOBYTE(self->_sessionType))
  {
    if (a3->var2.__engaged_)
    {
      if (!*((_BYTE *)&self->_sessionType + 4))
        *((_BYTE *)&self->_sessionType + 4) = 1;
      if (!LOBYTE(self->_backgroundMode))
      {
        LOBYTE(self->_backgroundMode) = 1;
        if (!a3->var1.var1)
          sub_1003CB9AC();
        self->_rangeAtHorizontalConvergence = a3->var1.var0.var1.var1 - *(double *)&self->_lastVIOPosition[6];
        self->_distanceMovedToVerticalConvergence = a3->var1.var0.var1.var2;
        *(double *)&self->_lastVIOPosition[14] = self->_distanceMovedToHorizontalConvergence;
      }
    }
    else if (*((_BYTE *)&self->_sessionType + 4))
    {
      *((_BYTE *)&self->_sessionType + 4) = 0;
      ++HIDWORD(self->_timeToHorizontalConvergence);
    }
    if (a3->var0.var0 == 1)
    {
      if (!*((_BYTE *)&self->_sessionType + 5))
        *((_BYTE *)&self->_sessionType + 5) = 1;
      if (!BYTE1(self->_backgroundMode))
      {
        BYTE1(self->_backgroundMode) = 1;
        if (!a3->var1.var1)
          sub_1003CB984();
        self->_rangeAtVerticalConvergence = a3->var1.var0.var1.var1 - *(double *)&self->_lastVIOPosition[6];
        self->_totalDistanceMoved = a3->var1.var0.var1.var2;
        self->_firstRangeMeasurementTime = self->_distanceMovedToHorizontalConvergence;
      }
    }
    else if (*((_BYTE *)&self->_sessionType + 5))
    {
      *((_BYTE *)&self->_sessionType + 5) = 0;
      ++LODWORD(self->_timeToVerticalConvergence);
    }
  }
}

- (void)updateWithPeerDeviceType:(BOOL)a3
{
  int lifecycleTimeoutType;
  uint64_t v4;

  lifecycleTimeoutType = (int)self->_lifecycleTimeoutType;
  if (lifecycleTimeoutType == 4)
  {
    v4 = 2706;
  }
  else
  {
    if (lifecycleTimeoutType != 3)
      return;
    v4 = 2704;
  }
  *(_WORD *)((char *)&self->super.isa + v4) = a3 | 0x100;
}

- (void)updateWithFindeePeerData:(const void *)a3
{
  int timeLocationFromWiFi_low;
  BOOL v6;
  int v7;
  int timeLocationFromWiFi_high;
  int v9;
  uint64_t v10;
  uint64_t v11;
  int v12;
  int v13;
  unsigned int timeAtFirstPeerData_low;
  uint64_t v15;
  uint64_t v16;
  int v17;
  int v18;
  int numberOfPeerData;
  int v20;
  int timeLocationFromWiFi2_high;
  int v22;

  if (LODWORD(self->_lifecycleTimeoutType) != 3)
    return;
  timeLocationFromWiFi_low = LODWORD(self->_timeLocationFromWiFi);
  v6 = __CFADD__(timeLocationFromWiFi_low, 1);
  v7 = timeLocationFromWiFi_low + 1;
  if (v6)
    v7 = 1;
  LODWORD(self->_timeLocationFromWiFi) = v7;
  if (*(double *)&self->_numberOfWalkingOrkUnknown == -1.0)
  {
    *(double *)&self->_numberOfWalkingOrkUnknown = sub_10000883C();
    if (!*((_BYTE *)a3 + 16))
      goto LABEL_40;
    LODWORD(self->_timeAtFirstPeerData) = *((_DWORD *)a3 + 2);
    BYTE4(self->_timeAtFirstPeerData) = 1;
    *(double *)&self->_numberOfMissedRanges = sub_10000883C();
    if (*((_BYTE *)a3 + 72))
    {
      HIDWORD(self->_maxYCoordinateFindee) = *((_DWORD *)a3 + 10);
      LOBYTE(self->_minYCoordinateFindee) = 1;
    }
  }
  if (*((_BYTE *)a3 + 16))
  {
    timeLocationFromWiFi_high = HIDWORD(self->_timeLocationFromWiFi);
    v6 = __CFADD__(timeLocationFromWiFi_high, 1);
    v9 = timeLocationFromWiFi_high + 1;
    if (v6)
      v9 = 1;
    HIDWORD(self->_timeLocationFromWiFi) = v9;
    v10 = *((int *)a3 + 2);
    if (v10 <= 2)
    {
      v11 = qword_1004569D8[v10];
      v12 = *(_DWORD *)((char *)&self->super.isa + v11);
      v6 = __CFADD__(v12, 1);
      v13 = v12 + 1;
      if (v6)
        v13 = 1;
      *(_DWORD *)((char *)&self->super.isa + v11) = v13;
    }
    if (BYTE4(self->_timeAtFirstPeerData))
    {
      timeAtFirstPeerData_low = LODWORD(self->_timeAtFirstPeerData);
      if (timeAtFirstPeerData_low <= 2)
      {
        v15 = qword_1004569C0[timeAtFirstPeerData_low];
        *(double *)((char *)&self->super.isa + v15) = *(double *)((char *)&self->super.isa + v15)
                                                    + sub_10000883C()
                                                    - *(double *)&self->_numberOfMissedRanges;
        LODWORD(self->_timeAtFirstPeerData) = timeAtFirstPeerData_low;
        BYTE4(self->_timeAtFirstPeerData) = 1;
      }
      *(double *)&self->_numberOfMissedRanges = sub_10000883C();
      goto LABEL_22;
    }
LABEL_40:
    sub_10000BA44();
  }
LABEL_22:
  if (*((_BYTE *)a3 + 72))
  {
    v16 = 412;
    if (*((_DWORD *)a3 + 10) == 1)
      v16 = 400;
    v17 = *(_DWORD *)((char *)&self->super.isa + v16);
    v6 = __CFADD__(v17, 1);
    v18 = v17 + 1;
    if (v6)
      v18 = 1;
    *(_DWORD *)((char *)&self->super.isa + v16) = v18;
  }
  if (*((_BYTE *)a3 + 112))
  {
    numberOfPeerData = self->_numberOfPeerData;
    v6 = __CFADD__(numberOfPeerData, 1);
    v20 = numberOfPeerData + 1;
    if (v6)
      v20 = 1;
    self->_numberOfPeerData = v20;
  }
  if (*((_BYTE *)a3 + 160))
  {
    timeLocationFromWiFi2_high = HIDWORD(self->_timeLocationFromWiFi2);
    v6 = __CFADD__(timeLocationFromWiFi2_high, 1);
    v22 = timeLocationFromWiFi2_high + 1;
    if (v6)
      v22 = 1;
    HIDWORD(self->_timeLocationFromWiFi2) = v22;
  }
}

- (void)updateWithMissedRange
{
  int numberOfSlowlyMoving;
  BOOL v3;
  int v4;

  if (LODWORD(self->_lifecycleTimeoutType) == 3)
  {
    numberOfSlowlyMoving = self->_numberOfSlowlyMoving;
    v3 = __CFADD__(numberOfSlowlyMoving, 1);
    v4 = numberOfSlowlyMoving + 1;
    if (v3)
      v4 = 1;
    self->_numberOfSlowlyMoving = v4;
  }
}

- (void)_calculateAndLogErrorsFromIODeltaP:(NIServerAnalyticsManager *)self vioDeltaP:(SEL)a2 vioPos:
{
  uint64_t v2;
  float32x4_t *v3;
  float32x4_t *v4;
  float32x4_t *v5;
  float32x4_t *v6;
  uint64_t v7;
  double v9;
  float v10;
  int v11;
  float v12;
  float *value;
  float *end;
  uint64_t v15;
  float *v16;
  float *begin;
  float *v18;
  uint64_t v19;
  uint64_t v20;
  uint64_t v21;
  unint64_t v22;
  char *v23;
  float *v24;
  float *v25;
  float *v26;
  uint64_t v27;
  float *v28;
  int v29;
  float *v30;
  float *v31;
  double val;
  uint64_t v33;
  unint64_t v34;
  unint64_t v35;
  unint64_t v36;
  char *v37;
  float *v38;
  float *v39;
  int v40;
  double deltaVSourceTime;
  float32x4_t v42;
  float32x4_t v43;
  float v44;
  float *v45;
  float *v46;
  float *v47;
  float *v48;
  uint64_t v49;
  unint64_t v50;
  unint64_t v51;
  unint64_t v52;
  char *v53;
  float *v54;
  float *v55;
  int v56;

  v5 = v4;
  v6 = v3;
  v7 = v2;
  v9 = sub_10000883C();
  v10 = atan2f(vmlas_n_f32((float)-COERCE_FLOAT(*(_QWORD *)(v7 + 8)) * COERCE_FLOAT(*v6), COERCE_FLOAT(v6->i64[1]), COERCE_FLOAT(*(_OWORD *)v7)), vmlas_n_f32(vmuls_lane_f32(COERCE_FLOAT(*(_QWORD *)(v7 + 8)), *v6, 2), COERCE_FLOAT(*v6), COERCE_FLOAT(*(_OWORD *)v7)))* 57.2957795;
  v11 = BYTE4(self->_pointToPointErrorHistory.__end_);
  if (BYTE4(self->_pointToPointErrorHistory.__end_))
    v12 = v10 - *(float *)&self->_pointToPointErrorHistory.__end_;
  else
    v12 = 0.0;
  *(float *)&self->_pointToPointErrorHistory.__end_ = v10;
  BYTE4(self->_pointToPointErrorHistory.__end_) = 1;
  value = self->_angleErrorHistory.__end_cap_.__value_;
  end = self->_angleErrorHistory.__end_;
  v15 = (char *)value - (char *)end;
  if ((unint64_t)((char *)value - (char *)end) <= 0x4AF)
  {
    v16 = *(float **)&self->_timeOfLastPDRUpdate.__engaged_;
    if ((unint64_t)v16 - *(_QWORD *)&self->_timeOfLastPDRUpdate.var0.__val_ <= 0x4AF
      && v9 - *(double *)&self->_pointToPointErrorHistory.__end_cap_.__value_ >= 0.5
      && (float *)((char *)self->_deltaAngleErrorHistory.__end_cap_.__value_
                 - (char *)self->_deltaAngleErrorHistory.__end_) <= (float *)0x4AF)
    {
      if (v11)
      {
        begin = self->_deltaAngleErrorHistory.__begin_;
        if (value >= begin)
        {
          v19 = v15 >> 2;
          v20 = (char *)begin - (char *)end;
          if (v20 >> 1 <= (unint64_t)((v15 >> 2) + 1))
            v21 = v19 + 1;
          else
            v21 = v20 >> 1;
          if ((unint64_t)v20 >= 0x7FFFFFFFFFFFFFFCLL)
            v22 = 0x3FFFFFFFFFFFFFFFLL;
          else
            v22 = v21;
          v23 = (char *)sub_10003B05C((uint64_t)&self->_deltaAngleErrorHistory, v22);
          v24 = self->_angleErrorHistory.__end_cap_.__value_;
          v25 = self->_angleErrorHistory.__end_;
          v26 = (float *)&v23[4 * v19];
          v28 = (float *)&v23[4 * v27];
          *v26 = v12;
          v18 = v26 + 1;
          while (v24 != v25)
          {
            v29 = *((_DWORD *)v24-- - 1);
            *((_DWORD *)v26-- - 1) = v29;
          }
          self->_angleErrorHistory.__end_ = v26;
          self->_angleErrorHistory.__end_cap_.__value_ = v18;
          self->_deltaAngleErrorHistory.__begin_ = v28;
          if (v25)
            operator delete(v25);
        }
        else
        {
          *value = v12;
          v18 = value + 1;
        }
        self->_angleErrorHistory.__end_cap_.__value_ = v18;
        v16 = *(float **)&self->_timeOfLastPDRUpdate.__engaged_;
      }
      v30 = self->_angleErrorHistory.__begin_;
      if (v16 >= v30)
      {
        val = self->_timeOfLastPDRUpdate.var0.__val_;
        v33 = ((uint64_t)v16 - *(_QWORD *)&val) >> 2;
        if ((unint64_t)(v33 + 1) >> 62)
          goto LABEL_59;
        v34 = (unint64_t)v30 - *(_QWORD *)&val;
        v35 = ((uint64_t)v30 - *(_QWORD *)&val) >> 1;
        if (v35 <= v33 + 1)
          v35 = v33 + 1;
        if (v34 >= 0x7FFFFFFFFFFFFFFCLL)
          v36 = 0x3FFFFFFFFFFFFFFFLL;
        else
          v36 = v35;
        if (v36)
        {
          v37 = (char *)sub_10003B05C((uint64_t)&self->_angleErrorHistory, v36);
          v16 = *(float **)&self->_timeOfLastPDRUpdate.__engaged_;
          val = self->_timeOfLastPDRUpdate.var0.__val_;
        }
        else
        {
          v37 = 0;
        }
        v38 = (float *)&v37[4 * v33];
        v39 = (float *)&v37[4 * v36];
        *v38 = v10;
        v31 = v38 + 1;
        while (v16 != *(float **)&val)
        {
          v40 = *((_DWORD *)v16-- - 1);
          *((_DWORD *)v38-- - 1) = v40;
        }
        *(_QWORD *)&self->_timeOfLastPDRUpdate.var0.__val_ = v38;
        *(_QWORD *)&self->_timeOfLastPDRUpdate.__engaged_ = v31;
        self->_angleErrorHistory.__begin_ = v39;
        if (val != 0.0)
          operator delete(*(void **)&val);
      }
      else
      {
        *v16 = v10;
        v31 = v16 + 1;
      }
      *(_QWORD *)&self->_timeOfLastPDRUpdate.__engaged_ = v31;
      deltaVSourceTime = self->_deltaVSourceTime;
      if (deltaVSourceTime <= 0.0)
      {
LABEL_57:
        *(double *)&self->_pointToPointErrorHistory.__end_cap_.__value_ = v9;
        return;
      }
      v42 = vsubq_f32(*(float32x4_t *)&self->_anon_dc8[56], *v5);
      v43 = vmulq_f32(v42, v42);
      v44 = sqrtf(vaddq_f32((float32x4_t)vdupq_laneq_s32((int32x4_t)v43, 2), vaddq_f32(v43, (float32x4_t)vdupq_lane_s32(*(int32x2_t *)v43.f32, 1))).f32[0])/ deltaVSourceTime;
      v45 = self->_deltaAngleErrorHistory.__end_cap_.__value_;
      v46 = self->_pointToPointErrorHistory.__begin_;
      if (v45 < v46)
      {
        *v45 = v44;
        v47 = v45 + 1;
LABEL_56:
        self->_deltaAngleErrorHistory.__end_cap_.__value_ = v47;
        goto LABEL_57;
      }
      v48 = self->_deltaAngleErrorHistory.__end_;
      v49 = v45 - v48;
      if (!((unint64_t)(v49 + 1) >> 62))
      {
        v50 = (char *)v46 - (char *)v48;
        v51 = ((char *)v46 - (char *)v48) >> 1;
        if (v51 <= v49 + 1)
          v51 = v49 + 1;
        if (v50 >= 0x7FFFFFFFFFFFFFFCLL)
          v52 = 0x3FFFFFFFFFFFFFFFLL;
        else
          v52 = v51;
        if (v52)
        {
          v53 = (char *)sub_10003B05C((uint64_t)&self->_pointToPointErrorHistory, v52);
          v45 = self->_deltaAngleErrorHistory.__end_cap_.__value_;
          v48 = self->_deltaAngleErrorHistory.__end_;
        }
        else
        {
          v53 = 0;
        }
        v54 = (float *)&v53[4 * v49];
        v55 = (float *)&v53[4 * v52];
        *v54 = v44;
        v47 = v54 + 1;
        while (v45 != v48)
        {
          v56 = *((_DWORD *)v45-- - 1);
          *((_DWORD *)v54-- - 1) = v56;
        }
        self->_deltaAngleErrorHistory.__end_ = v54;
        self->_deltaAngleErrorHistory.__end_cap_.__value_ = v47;
        self->_pointToPointErrorHistory.__begin_ = v55;
        if (v48)
          operator delete(v48);
        goto LABEL_56;
      }
LABEL_59:
      sub_100026E7C();
    }
  }
}

- (void)_updateAlignedPDRMetrics:(const void *)a3
{
  double v5;
  double v6;
  double v7;
  float64x2_t v9;
  int v10;
  __n128 v11;
  float32x4_t v12;
  int null_state;
  double v14;
  float32x4_t v15;
  double v16;
  float32x4_t v17;
  int v18;
  float32x4_t v19;
  float32x4_t v20;
  float32x4_t v21;
  char v22;
  float32x4_t v23;
  char v24;
  _BYTE v25[64];
  float32x4_t v26;
  char v27;
  float32x4_t v28;
  char v29;

  v5 = sub_10002D190();
  v6 = sub_10000883C();
  v7 = *(double *)a3 + v6 - v5;
  if (!LOBYTE(self->_vioPathLength) && *((_BYTE *)a3 + 32) && *((_BYTE *)a3 + 48) != 0)
  {
    v9 = *(float64x2_t *)((char *)a3 + 24);
    v9.f64[1] = *((float64_t *)a3 + 5);
    *(float32x2_t *)&v9.f64[0] = vcvt_f32_f64(v9);
    if (sqrtf(vaddv_f32(vmul_f32(*(float32x2_t *)&v9.f64[0], *(float32x2_t *)&v9.f64[0]))) / 0.1 > 0.15)
    {
      self->_noOdometryAvailableTime = v6;
      LOBYTE(self->_vioPathLength) = 1;
    }
  }
  sub_10034E750((uint64_t)&self->_rangeAtFirstArrow, (uint64_t)a3, (uint64_t)&v28, v7);
  v10 = sub_10034E338((uint64_t)&self->_rangeAtFirstArrow);
  v11.n128_f64[0] = v7;
  sub_10034E6E0(&self->_rangeAtFirstArrow, (uint64_t)v25, v11);
  if (v10 != 5)
  {
    LODWORD(self->_timeAtFirstIOPose.var0.__val_) = v10;
    return;
  }
  if (LODWORD(self->_timeAtFirstIOPose.var0.__val_) == 5)
  {
    v23.i8[0] = 0;
    v24 = 0;
    if (!v27)
      return;
LABEL_18:
    v12 = vsubq_f32(v26, *(float32x4_t *)self->_integratedPDRVIOFrame);
    v22 = 1;
    v21 = v12;
    null_state = self->_previousAdjustedRotatedVioPosition.var0.__null_state_;
    v14 = 0.0;
    if (self->_previousAdjustedRotatedVioPosition.var0.__null_state_)
    {
      null_state = self->_anon_e42[22];
      if (self->_anon_e42[22])
      {
        v15 = vsubq_f32(v12, *(float32x4_t *)&self->_previousVioIsNotAvailable);
        null_state = 1;
        v24 = 1;
        v23 = v15;
        v16 = v7 - *(double *)&self->_anon_e42[14];
        if (v16 <= 0.0)
        {
          v18 = 0;
          v14 = 0.0;
          goto LABEL_23;
        }
        v17 = vmulq_f32(v15, v15);
        *(double *)v17.i64 = sqrtf(vaddq_f32((float32x4_t)vdupq_laneq_s32((int32x4_t)v17, 2), vaddq_f32(v17, (float32x4_t)vdupq_lane_s32(*(int32x2_t *)v17.f32, 1))).f32[0]);
        v14 = *(double *)v17.i64 / v16;
        self->_deltaVSourceTime = self->_deltaVSourceTime + *(double *)v17.i64;
      }
    }
    *(float32x4_t *)&self->_previousVioIsNotAvailable = v21;
    self->_previousAdjustedRotatedVioPosition.var0.__null_state_ = v22;
    *(double *)&self->_anon_e42[14] = v7;
    self->_anon_e42[22] = 1;
    v18 = null_state;
LABEL_23:
    if (v29)
    {
      v19 = v28;
      *(float32x4_t *)&self->_anon_dc8[56] = vaddq_f32(v28, *(float32x4_t *)&self->_anon_dc8[56]);
      if (v18)
      {
        if (null_state)
        {
          v20 = vmulq_f32(v19, v19);
          if (sqrtf(vaddq_f32((float32x4_t)vdupq_laneq_s32((int32x4_t)v20, 2), vaddq_f32(v20, (float32x4_t)vdupq_lane_s32(*(int32x2_t *)v20.f32, 1))).f32[0])/ 0.1 > 0.15&& v14 > 0.15)
          {
            -[NIServerAnalyticsManager _calculateAndLogErrorsFromIODeltaP:vioDeltaP:vioPos:](self, "_calculateAndLogErrorsFromIODeltaP:vioDeltaP:vioPos:", &v28, &v23, &v21);
          }
        }
      }
    }
    return;
  }
  *(_OWORD *)&self->_anon_dc8[56] = 0u;
  self->_deltaVSourceTime = 0.0;
  if (self->_previousAdjustedRotatedVioPosition.var0.__null_state_)
    self->_previousAdjustedRotatedVioPosition.var0.__null_state_ = 0;
  if (v27)
  {
    *(float32x4_t *)self->_integratedPDRVIOFrame = v26;
    LODWORD(self->_timeAtFirstIOPose.var0.__val_) = 5;
    v23.i8[0] = 0;
    v24 = 0;
    goto LABEL_18;
  }
}

- (void)updateWithPDR:(const void *)a3
{
  int lifecycleTimeoutType;
  double v6;
  double v7;
  __int128 v8;
  __int128 v9;
  __int128 v10;
  __int128 v11;
  __int128 v12;
  double v13;
  double pdrSSDetectionFalsePositiveRate;
  double v15;
  double v16;
  __int128 v17;
  __int128 v18;
  __int128 v19;
  __int128 v20;
  __int128 v21;
  __int128 v22;
  __int128 v23;
  __int128 v24;
  double v25;
  double v26;
  double percentTimeSSFromVIO;
  double v28;
  double v29;
  _BOOL4 v30;
  int pdrTimeAtLastPDRUpdate_low;
  __int128 v32;
  __int128 v33;
  __int128 v34;
  __int128 v35;
  __int128 v36;
  double v37;
  double v38;
  __int128 v39;
  __int128 v40;
  __int128 v41;
  __int128 v42;
  __int128 v43;
  __int128 v44;
  __int128 v45;
  __int128 v46;
  unsigned int v47;
  uint64_t v48;
  __int128 v49;
  __int128 v50;
  __int128 v51;
  __int128 v52;
  _OWORD v53[10];
  _OWORD v54[10];
  _OWORD v55[9];
  _OWORD v56[9];
  _OWORD v57[9];
  _OWORD v58[9];

  lifecycleTimeoutType = (int)self->_lifecycleTimeoutType;
  if (lifecycleTimeoutType == 4)
  {
    -[NIServerAnalyticsManager _updateAlignedPDRMetrics:](self, "_updateAlignedPDRMetrics:", a3);
    v6 = *(double *)&self->_isFinderAPhone.var0.__null_state_;
    if (v6 == -1.0)
    {
      v6 = *(double *)a3;
      *(_QWORD *)&self->_isFinderAPhone.var0.__null_state_ = *(_QWORD *)a3;
    }
    v7 = *(double *)a3;
    v8 = *((_OWORD *)a3 + 7);
    v53[6] = *((_OWORD *)a3 + 6);
    v53[7] = v8;
    v9 = *((_OWORD *)a3 + 9);
    v53[8] = *((_OWORD *)a3 + 8);
    v53[9] = v9;
    v10 = *((_OWORD *)a3 + 3);
    v53[2] = *((_OWORD *)a3 + 2);
    v53[3] = v10;
    v11 = *((_OWORD *)a3 + 5);
    v53[4] = *((_OWORD *)a3 + 4);
    v53[5] = v11;
    v12 = *((_OWORD *)a3 + 1);
    v53[0] = *(_OWORD *)a3;
    v53[1] = v12;
    if (!-[NIServerAnalyticsManager _isPDRAvailable:](self, "_isPDRAvailable:", v53)
      || !BYTE2(self->_numberOfSolutions))
    {
      goto LABEL_33;
    }
    v13 = v7 - v6;
    *(double *)&self->_anon_9d8[176] = v13 + *(double *)&self->_anon_9d8[176];
    pdrSSDetectionFalsePositiveRate = self->_pdrSSDetectionFalsePositiveRate;
    if (pdrSSDetectionFalsePositiveRate == -1.0)
      v15 = 1.0;
    else
      v15 = pdrSSDetectionFalsePositiveRate + 1.0;
    self->_pdrSSDetectionFalsePositiveRate = v15;
    if (!*((_BYTE *)a3 + 32) || !*((_BYTE *)a3 + 48))
      goto LABEL_35;
    v16 = sqrt(*((double *)a3 + 5) * *((double *)a3 + 5) + *((double *)a3 + 3) * *((double *)a3 + 3));
    self->_timePDRAndVIOWasAvailable = self->_timePDRAndVIOWasAvailable + v16;
    v17 = *(_OWORD *)&self->_anon_3a8[40];
    v58[6] = *(_OWORD *)&self->_anon_3a8[24];
    v58[7] = v17;
    v58[8] = *(_OWORD *)&self->_anon_3a8[56];
    v18 = *(_OWORD *)&self->_lastPose.var0.__val_.source.var0.__null_state_;
    v58[2] = self->_lastPose.var0.__val_.lightEstimate;
    v58[3] = v18;
    v19 = *(_OWORD *)&self->_anon_3a8[8];
    v58[4] = *(_OWORD *)&self->_lastPose.__engaged_;
    v58[5] = v19;
    v20 = *(_OWORD *)&self->_lastPose.var0.__null_state_;
    v58[0] = *(_OWORD *)&self->_anon_318[72];
    v58[1] = v20;
    v21 = *(_OWORD *)&self->_anon_af8[8];
    v22 = *(_OWORD *)&self->_anon_af8[40];
    v57[6] = *(_OWORD *)&self->_anon_af8[24];
    v57[7] = v22;
    v57[8] = *(_OWORD *)&self->_anon_af8[56];
    v23 = *(_OWORD *)&self->_vioPoseAtLastPDRUpdate.var0.__null_state_;
    v24 = *(_OWORD *)&self->_vioPoseAtLastPDRUpdate.var0.__val_.source.var0.__null_state_;
    v57[2] = self->_vioPoseAtLastPDRUpdate.var0.__val_.lightEstimate;
    v57[3] = v24;
    v57[4] = *(_OWORD *)&self->_vioPoseAtLastPDRUpdate.__engaged_;
    v57[5] = v21;
    v57[0] = *(_OWORD *)&self->_vioPathLengthWhenPDRIsAvailable;
    v57[1] = v23;
    -[NIServerAnalyticsManager _deltaDistanceFromVIOPoses::](self, "_deltaDistanceFromVIOPoses::", v58, v57);
    self->_timeAtLastIOUpdate = v25 + self->_timeAtLastIOUpdate;
    if (v13 <= 0.0)
    {
      v30 = 0;
    }
    else
    {
      v26 = v25 / v13;
      percentTimeSSFromVIO = self->_percentTimeSSFromVIO;
      v28 = v26 - percentTimeSSFromVIO;
      v29 = percentTimeSSFromVIO + (v26 - percentTimeSSFromVIO) / self->_pdrSSDetectionFalsePositiveRate;
      self->_percentTimeSSFromVIO = v29;
      self->_numberOfPDRUpdates = self->_numberOfPDRUpdates + v28 * (v26 - v29);
      v30 = v16 / v13 == 0.0;
    }
    v39 = *(_OWORD *)&self->_anon_3a8[40];
    v56[6] = *(_OWORD *)&self->_anon_3a8[24];
    v56[7] = v39;
    v56[8] = *(_OWORD *)&self->_anon_3a8[56];
    v40 = *(_OWORD *)&self->_lastPose.var0.__val_.source.var0.__null_state_;
    v56[2] = self->_lastPose.var0.__val_.lightEstimate;
    v56[3] = v40;
    v41 = *(_OWORD *)&self->_anon_3a8[8];
    v56[4] = *(_OWORD *)&self->_lastPose.__engaged_;
    v56[5] = v41;
    v42 = *(_OWORD *)&self->_lastPose.var0.__null_state_;
    v56[0] = *(_OWORD *)&self->_anon_318[72];
    v56[1] = v42;
    v43 = *(_OWORD *)&self->_anon_af8[40];
    v55[6] = *(_OWORD *)&self->_anon_af8[24];
    v55[7] = v43;
    v55[8] = *(_OWORD *)&self->_anon_af8[56];
    v44 = *(_OWORD *)&self->_vioPoseAtLastPDRUpdate.var0.__val_.source.var0.__null_state_;
    v55[2] = self->_vioPoseAtLastPDRUpdate.var0.__val_.lightEstimate;
    v55[3] = v44;
    v45 = *(_OWORD *)&self->_anon_af8[8];
    v55[4] = *(_OWORD *)&self->_vioPoseAtLastPDRUpdate.__engaged_;
    v55[5] = v45;
    v46 = *(_OWORD *)&self->_vioPoseAtLastPDRUpdate.var0.__null_state_;
    v55[0] = *(_OWORD *)&self->_vioPathLengthWhenPDRIsAvailable;
    v55[1] = v46;
    v47 = -[NIServerAnalyticsManager _isSemiStaticFromVIO:::](self, "_isSemiStaticFromVIO:::", v56, v55, v13);
    if (v30)
    {
      if (v47)
      {
        self->_timeSSFromVIO = v13 + self->_timeSSFromVIO;
LABEL_29:
        v48 = 2944;
LABEL_32:
        *(double *)((char *)&self->super.isa + v48) = v13 + *(double *)((char *)&self->super.isa + v48);
LABEL_33:
        v49 = *(_OWORD *)&self->_lastPose.__engaged_;
        *(_OWORD *)&self->_anon_af8[8] = *(_OWORD *)&self->_anon_3a8[8];
        v50 = *(_OWORD *)&self->_anon_3a8[40];
        *(_OWORD *)&self->_anon_af8[24] = *(_OWORD *)&self->_anon_3a8[24];
        *(_OWORD *)&self->_anon_af8[40] = v50;
        v51 = *(_OWORD *)&self->_anon_318[72];
        *(_OWORD *)&self->_vioPoseAtLastPDRUpdate.var0.__null_state_ = *(_OWORD *)&self->_lastPose.var0.__null_state_;
        v52 = *(_OWORD *)&self->_lastPose.var0.__val_.source.var0.__null_state_;
        self->_vioPoseAtLastPDRUpdate.var0.__val_.lightEstimate = self->_lastPose.var0.__val_.lightEstimate;
        *(_OWORD *)&self->_vioPoseAtLastPDRUpdate.var0.__val_.source.var0.__null_state_ = v52;
        *(_OWORD *)&self->_vioPoseAtLastPDRUpdate.__engaged_ = v49;
        self->_anon_af8[56] = self->_anon_3a8[56];
        *(_OWORD *)&self->_vioPathLengthWhenPDRIsAvailable = v51;
        self->_pdrTimeAtFirstPDRUpdate = *(double *)a3;
        *(_QWORD *)&self->_isFinderAPhone.var0.__null_state_ = *(_QWORD *)a3;
        return;
      }
      self->_timeNotSSFromVIO = v13 + self->_timeNotSSFromVIO;
    }
    else if ((v47 & 1) != 0)
    {
      goto LABEL_29;
    }
    v48 = 2952;
    goto LABEL_32;
  }
  if (lifecycleTimeoutType == 3)
  {
    if (self->_timeFindeeWasWalkingOrUnknown == -1.0)
    {
      self->_timeFindeeWasWalkingOrUnknown = *(double *)a3;
LABEL_23:
      self->_pdrTimeAtFirstPDRUpdate = *(double *)a3;
      return;
    }
    pdrTimeAtLastPDRUpdate_low = LOBYTE(self->_pdrTimeAtLastPDRUpdate);
    v32 = *((_OWORD *)a3 + 7);
    v54[6] = *((_OWORD *)a3 + 6);
    v54[7] = v32;
    v33 = *((_OWORD *)a3 + 9);
    v54[8] = *((_OWORD *)a3 + 8);
    v54[9] = v33;
    v34 = *((_OWORD *)a3 + 3);
    v54[2] = *((_OWORD *)a3 + 2);
    v54[3] = v34;
    v35 = *((_OWORD *)a3 + 5);
    v54[4] = *((_OWORD *)a3 + 4);
    v54[5] = v35;
    v36 = *((_OWORD *)a3 + 1);
    v54[0] = *(_OWORD *)a3;
    v54[1] = v36;
    if (!-[NIServerAnalyticsManager _isPDRAvailable:](self, "_isPDRAvailable:", v54))
      goto LABEL_23;
    LOBYTE(self->_pdrTimeAtLastPDRUpdate) = 1;
    if (*((_BYTE *)a3 + 32) && *((_BYTE *)a3 + 48))
    {
      v37 = sqrt(*((double *)a3 + 5) * *((double *)a3 + 5) + *((double *)a3 + 3) * *((double *)a3 + 3));
      if (pdrTimeAtLastPDRUpdate_low)
      {
        v38 = *(double *)a3 - self->_pdrTimeAtFirstPDRUpdate;
        if (v37 / v38 < 0.1)
          self->_distanceTraveledFromPDR = v38 + self->_distanceTraveledFromPDR;
      }
      self->_timeToSessionEnd = v37 + self->_timeToSessionEnd;
      goto LABEL_23;
    }
LABEL_35:
    sub_10000BA44();
  }
}

- (void)updateWithSuccessfulRange:(double)a3 uwbRSSI:(double)a4 nbRSSI:(optional<double>)a5
{
  int lifecycleTimeoutType;
  int numberOfVIOFromPeerData;
  BOOL v8;
  int v9;
  int numberOfArrowAvailabilityAfterFirstArrow;
  int v11;

  lifecycleTimeoutType = (int)self->_lifecycleTimeoutType;
  if (lifecycleTimeoutType == 4)
  {
    -[NIServerAnalyticsManager _updateMinMaxRangeAndRSSI:uwbRSSI:nbRSSI:](self, "_updateMinMaxRangeAndRSSI:uwbRSSI:nbRSSI:", *(_QWORD *)&a5.var0.__val_, *(_QWORD *)&a5.__engaged_, a3, a4);
    if (self->_timeAtArmsLength == -1.0)
      self->_timeAtArmsLength = sub_10000883C();
    numberOfArrowAvailabilityAfterFirstArrow = self->_numberOfArrowAvailabilityAfterFirstArrow;
    v8 = __CFADD__(numberOfArrowAvailabilityAfterFirstArrow, 1);
    v11 = numberOfArrowAvailabilityAfterFirstArrow + 1;
    if (v8)
      v11 = 1;
    self->_numberOfArrowAvailabilityAfterFirstArrow = v11;
  }
  else if (lifecycleTimeoutType == 3)
  {
    numberOfVIOFromPeerData = self->_numberOfVIOFromPeerData;
    v8 = __CFADD__(numberOfVIOFromPeerData, 1);
    v9 = numberOfVIOFromPeerData + 1;
    if (v8)
      v9 = 1;
    self->_numberOfVIOFromPeerData = v9;
    -[NIServerAnalyticsManager _updateMinMaxRangeAndRSSI:uwbRSSI:nbRSSI:](self, "_updateMinMaxRangeAndRSSI:uwbRSSI:nbRSSI:", *(_QWORD *)&a5.var0.__val_, *(_QWORD *)&a5.__engaged_, a3, a4);
  }
}

- (void)updateWithSelfLocation:(const LocationInput *)a3
{
  int lifecycleTimeoutType;
  int var11;
  double timeAtLastLocationUpdate;
  double v7;
  double v8;
  double v9;
  double v10;
  NSObject *v11;
  double v12;
  double v13;
  double v14;
  double v15;
  double v16;
  double v17;
  double v18;
  double v19;

  lifecycleTimeoutType = (int)self->_lifecycleTimeoutType;
  if (lifecycleTimeoutType == 3)
  {
    var11 = a3->var11;
    timeAtLastLocationUpdate = self->_timeAtLastLocationUpdate;
    v7 = sub_10000883C();
    if (timeAtLastLocationUpdate == -1.0)
    {
      self->_timeAtLastLocationUpdate = v7;
    }
    else
    {
      if (!*((_BYTE *)&self->_numberOfLostVerticalConvergence + 4))
        sub_10000BA44();
      switch(self->_numberOfLostVerticalConvergence)
      {
        case 0:
          v9 = v7 - *(double *)&self->_numberOfInvalidPose;
          if (v9 > 10.0)
            v9 = 10.0;
          self->_timeLocationFromMCC = self->_timeLocationFromMCC + v9;
          break;
        case 1:
          v10 = v7 - *(double *)&self->_numberOfInvalidPose;
          if (v10 > 10.0)
            v10 = 10.0;
          self->_timeLocationFromCell = self->_timeLocationFromCell + v10;
          break;
        case 3:
          v12 = v7 - *(double *)&self->_numberOfInvalidPose;
          if (v12 > 10.0)
            v12 = 10.0;
          *(double *)&self->_lastLocationType = *(double *)&self->_lastLocationType + v12;
          break;
        case 4:
          v13 = v7 - *(double *)&self->_numberOfInvalidPose;
          if (v13 > 10.0)
            v13 = 10.0;
          self->_timeLocationFromPipeline = self->_timeLocationFromPipeline + v13;
          break;
        case 6:
        case 0xA:
          v8 = v7 - *(double *)&self->_numberOfInvalidPose;
          if (v8 > 10.0)
            v8 = 10.0;
          self->_timeAtFirstLocationUpdate = self->_timeAtFirstLocationUpdate + v8;
          break;
        case 7:
          v14 = v7 - *(double *)&self->_numberOfInvalidPose;
          if (v14 > 10.0)
            v14 = 10.0;
          self->_timeLocationFromGPS = self->_timeLocationFromGPS + v14;
          break;
        case 8:
          v15 = v7 - *(double *)&self->_numberOfInvalidPose;
          if (v15 > 10.0)
            v15 = 10.0;
          self->_timeLocationFromLAC = self->_timeLocationFromLAC + v15;
          break;
        case 9:
          v16 = v7 - *(double *)&self->_numberOfInvalidPose;
          if (v16 > 10.0)
            v16 = 10.0;
          self->_timeLocationFromCompensated = self->_timeLocationFromCompensated + v16;
          break;
        case 0xB:
          v17 = v7 - *(double *)&self->_numberOfInvalidPose;
          if (v17 > 10.0)
            v17 = 10.0;
          self->_timeLocationFromUnknown = self->_timeLocationFromUnknown + v17;
          break;
        case 0xC:
          v18 = v7 - *(double *)&self->_numberOfInvalidPose;
          if (v18 > 10.0)
            v18 = 10.0;
          self->_timeLocationFromAccessory = self->_timeLocationFromAccessory + v18;
          break;
        case 0xD:
          v19 = v7 - *(double *)&self->_numberOfInvalidPose;
          if (v19 > 10.0)
            v19 = 10.0;
          self->_timeLocationFromGPSCoarse = self->_timeLocationFromGPSCoarse + v19;
          break;
        default:
          v11 = qword_10085F520;
          if (os_log_type_enabled((os_log_t)qword_10085F520, OS_LOG_TYPE_ERROR))
            sub_1003CB9D4(v11);
          break;
      }
    }
    self->_numberOfLostVerticalConvergence = var11;
    *((_BYTE *)&self->_numberOfLostVerticalConvergence + 4) = 1;
    *(double *)&self->_numberOfInvalidPose = sub_10000883C();
  }
  else if (lifecycleTimeoutType == 4 && self->_timeAtFirstFindeeData == -1.0)
  {
    self->_timeAtFirstFindeeData = sub_10000883C();
  }
}

- (void)updateWithAcquisitionReason:(int)a3
{
  id v4;
  void *v5;
  id v6;
  NSObject *v7;
  NSString *bundleIdentifier;
  void *v9;
  id v10;
  _QWORD v11[4];
  id v12;
  uint8_t buf[4];
  NSString *v14;
  __int16 v15;
  const __CFString *v16;
  __int16 v17;
  void *v18;

  if ((LODWORD(self->_lifecycleTimeoutType) - 3) <= 1)
  {
    LODWORD(self->_runningMeanSpeedFromVIO) = a3;
    v4 = objc_alloc_init((Class)NSMutableDictionary);
    v5 = (void *)objc_claimAutoreleasedReturnValue(+[NSNumber numberWithInt:](NSNumber, "numberWithInt:", LODWORD(self->_runningMeanSpeedFromVIO)));
    objc_msgSend(v4, "setObject:forKey:", v5, CFSTR("AcquisitionReason"));

    v6 = objc_msgSend(v4, "mutableCopy");
    v7 = (id)qword_10085F520;
    if (os_log_type_enabled(v7, OS_LOG_TYPE_INFO))
    {
      bundleIdentifier = self->_bundleIdentifier;
      v9 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v6, "description"));
      *(_DWORD *)buf = 138412802;
      v14 = bundleIdentifier;
      v15 = 2112;
      v16 = CFSTR("com.apple.nearbyinteraction.findingsession.begin");
      v17 = 2112;
      v18 = v9;
      _os_log_impl((void *)&_mh_execute_header, v7, OS_LOG_TYPE_INFO, "#ni-ca,[%@] send analytics event %@:\n%@\n", buf, 0x20u);

    }
    v11[0] = _NSConcreteStackBlock;
    v11[1] = 3221225472;
    v11[2] = sub_100034B14;
    v11[3] = &unk_1007FA568;
    v10 = v6;
    v12 = v10;
    AnalyticsSendEventLazy(CFSTR("com.apple.nearbyinteraction.findingsession.begin"), v11);

  }
}

- (void)updateWithPose:(const void *)a3
{
  double v5;
  BOOL v6;
  double v7;
  __int128 v8;
  __int128 v9;
  __int128 v10;
  __int128 v11;
  double minUWBRSSI;
  double minNBRSSI;
  int *p_numberOfVIOResets;
  __int128 v15;
  __int128 v16;
  __int128 v17;
  __int128 v18;
  __int128 v19;
  __int128 v20;
  int armsReachAlgorithmSource;
  BOOL v22;
  int v23;
  __int128 v24;
  __int128 v25;
  __int128 v26;
  double *p_firstOutputRangeStraightLineDistance;
  __int128 v28;
  __int128 v29;
  __int128 v30;
  __int128 v31;
  __int128 v32;
  __int128 v33;
  __int128 v34;
  __int128 v35;
  __int128 v36;
  unsigned __int8 *v37;
  __int128 v38;
  __int128 v39;
  __int128 v40;
  __int128 v41;
  __int128 v42;
  __int128 v43;
  __int128 v44;
  __int128 v45;
  __int128 v46;
  unsigned __int8 *v47;
  __int128 v48;
  __int128 v49;
  __int128 v50;
  __int128 v51;
  __int128 v52;
  __int128 v53;
  __int128 v54;
  __int128 v55;
  __int128 v56;
  unsigned __int8 *v57;
  __int128 v58;
  __int128 v59;
  __int128 v60;
  __int128 v61;
  __int128 v62;
  __int128 v63;
  __int128 v64;
  __int128 v65;
  __int128 v66;
  unsigned __int8 *v67;
  __int128 v68;
  __int128 v69;
  __int128 v70;
  __int128 v71;
  __int128 v72;
  __int128 v73;
  __int128 v74;
  __int128 v75;
  __int128 v76;
  unsigned __int8 *v77;
  __int128 v78;
  __int128 v79;
  __int128 v80;
  __int128 v81;
  __int128 v82;
  __int128 v83;
  __int128 v84;
  __int128 v85;
  __int128 v86;
  unsigned __int8 *v87;
  __int128 v88;
  __int128 v89;
  __int128 v90;
  __int128 v91;
  __int128 v92;
  __int128 v93;
  __int128 v94;
  __int128 v95;
  __int128 v96;
  unsigned __int8 *v97;
  __int128 v98;
  __int128 v99;
  __int128 v100;
  __int128 v101;
  __int128 v102;
  __int128 v103;
  __int128 v104;
  __int128 v105;
  __int128 v106;
  unsigned __int8 *v107;
  __int128 v108;
  __int128 v109;
  __int128 v110;
  __int128 v111;
  __int128 v112;
  __int128 v113;
  __int128 v114;
  __int128 v115;
  __int128 v116;
  uint64_t v117;
  _OWORD v118[5];
  __int128 v119;
  __int128 v120;
  __int128 v121;

  if (LODWORD(self->_lifecycleTimeoutType) == 4)
  {
    v5 = sub_10000883C();
    if (BYTE2(self->_numberOfSolutions))
      v6 = *((_DWORD *)a3 + 20) == 2;
    else
      v6 = 1;
    if (v6)
    {
      v7 = v5;
      if (self->_timePeerLocationFromFindeeData == -1.0)
      {
        self->_timePeerLocationFromFindeeData = v5;
        self->_maxRawRangeValue = self->_firstNBRSSI;
      }
      v8 = *((_OWORD *)a3 + 5);
      v118[4] = *((_OWORD *)a3 + 4);
      v119 = v8;
      v9 = *((_OWORD *)a3 + 7);
      v120 = *((_OWORD *)a3 + 6);
      v121 = v9;
      v10 = *((_OWORD *)a3 + 1);
      v118[0] = *(_OWORD *)a3;
      v118[1] = v10;
      v11 = *((_OWORD *)a3 + 3);
      v118[2] = *((_OWORD *)a3 + 2);
      v118[3] = v11;
      if (BYTE1(self->_numberOfSolutions))
        LODWORD(v119) = 1;
      sub_10034F050((uint64_t)&self->_rangeAtFirstArrow, (uint64_t)v118, (uint64_t)&v117);
      if (*((_DWORD *)a3 + 20) == 2)
      {
        BYTE2(self->_numberOfSolutions) = 1;
        minUWBRSSI = *((float *)a3 + 17);
        minNBRSSI = self->_minNBRSSI;
        if (minNBRSSI <= minUWBRSSI)
          minNBRSSI = *((float *)a3 + 17);
        self->_minNBRSSI = minNBRSSI;
        if (self->_minUWBRSSI < minUWBRSSI)
          minUWBRSSI = self->_minUWBRSSI;
        self->_minUWBRSSI = minUWBRSSI;
        LOBYTE(self->_maxYCoordinateFindee) |= minNBRSSI - minUWBRSSI > 2.5;
        if (self->_timeAtLastLocationFromFindeeData == -1.0)
        {
          self->_timeAtLastLocationFromFindeeData = v7;
          p_numberOfVIOResets = &self->_numberOfVIOResets;
          v15 = *(_OWORD *)a3;
          v16 = *((_OWORD *)a3 + 1);
          v17 = *((_OWORD *)a3 + 3);
          if (self->_anon_318[56])
          {
            self->_firstPose.var0.__val_.lightEstimate = (optional<double>)*((_OWORD *)a3 + 2);
            *(_OWORD *)&self->_firstPose.var0.__val_.source.var0.__null_state_ = v17;
            *(_OWORD *)p_numberOfVIOResets = v15;
            *(_OWORD *)&self->_firstPose.var0.__null_state_ = v16;
            v18 = *((_OWORD *)a3 + 4);
            v19 = *((_OWORD *)a3 + 5);
            v20 = *((_OWORD *)a3 + 6);
            *(_QWORD *)&self->_anon_318[40] = *((_QWORD *)a3 + 14);
            *(_OWORD *)&self->_anon_318[8] = v19;
            *(_OWORD *)&self->_anon_318[24] = v20;
            *(_OWORD *)&self->_firstPose.__engaged_ = v18;
          }
          else
          {
            self->_firstPose.var0.__val_.lightEstimate = (optional<double>)*((_OWORD *)a3 + 2);
            *(_OWORD *)&self->_firstPose.var0.__val_.source.var0.__null_state_ = v17;
            *(_OWORD *)p_numberOfVIOResets = v15;
            *(_OWORD *)&self->_firstPose.var0.__null_state_ = v16;
            v24 = *((_OWORD *)a3 + 4);
            v25 = *((_OWORD *)a3 + 5);
            v26 = *((_OWORD *)a3 + 7);
            *(_OWORD *)&self->_anon_318[24] = *((_OWORD *)a3 + 6);
            *(_OWORD *)&self->_anon_318[40] = v26;
            *(_OWORD *)&self->_firstPose.__engaged_ = v24;
            *(_OWORD *)&self->_anon_318[8] = v25;
            self->_anon_318[56] = 1;
          }
          p_firstOutputRangeStraightLineDistance = &self->_firstOutputRangeStraightLineDistance;
          v28 = *(_OWORD *)a3;
          v29 = *((_OWORD *)a3 + 1);
          v30 = *((_OWORD *)a3 + 3);
          if (LOBYTE(self->_firstArrowUserMovedDistance.traveledDistance))
          {
            self->_firstArrowUserMovedDistance.previousPoseOfUser.var0.__val_.lightEstimate = (optional<double>)*((_OWORD *)a3 + 2);
            *(_OWORD *)&self->_firstArrowUserMovedDistance.previousPoseOfUser.var0.__val_.source.var0.__null_state_ = v30;
            *(_OWORD *)p_firstOutputRangeStraightLineDistance = v28;
            *(_OWORD *)&self->_firstArrowUserMovedDistance.previousPoseOfUser.var0.__null_state_ = v29;
            v31 = *((_OWORD *)a3 + 4);
            v32 = *((_OWORD *)a3 + 5);
            v33 = *((_OWORD *)a3 + 6);
            self->_firstArrowUserMovedDistance.oldPreviousPoseOfUser.var0.__val_.odometryAvailability = (optional<nearby::algorithms::common::OdometryAvailabilityState>)*((_QWORD *)a3 + 14);
            *(_OWORD *)&self->_firstArrowUserMovedDistance.oldPreviousPoseOfUser.var0.__val_.trackingState = v32;
            *(_OWORD *)&self->_firstArrowUserMovedDistance.oldPreviousPoseOfUser.var0.__val_.lightEstimate.__engaged_ = v33;
            *(_OWORD *)&self->_firstArrowUserMovedDistance.previousPoseOfUser.__engaged_ = v31;
          }
          else
          {
            self->_firstArrowUserMovedDistance.previousPoseOfUser.var0.__val_.lightEstimate = (optional<double>)*((_OWORD *)a3 + 2);
            *(_OWORD *)&self->_firstArrowUserMovedDistance.previousPoseOfUser.var0.__val_.source.var0.__null_state_ = v30;
            *(_OWORD *)p_firstOutputRangeStraightLineDistance = v28;
            *(_OWORD *)&self->_firstArrowUserMovedDistance.previousPoseOfUser.var0.__null_state_ = v29;
            v34 = *((_OWORD *)a3 + 4);
            v35 = *((_OWORD *)a3 + 5);
            v36 = *((_OWORD *)a3 + 7);
            *(_OWORD *)&self->_firstArrowUserMovedDistance.oldPreviousPoseOfUser.var0.__val_.lightEstimate.__engaged_ = *((_OWORD *)a3 + 6);
            *(_OWORD *)&self->_firstArrowUserMovedDistance.oldPreviousPoseOfUser.var0.__val_.odometryAvailability.var0.__null_state_ = v36;
            *(_OWORD *)&self->_firstArrowUserMovedDistance.previousPoseOfUser.__engaged_ = v34;
            *(_OWORD *)&self->_firstArrowUserMovedDistance.oldPreviousPoseOfUser.var0.__val_.trackingState = v35;
            LOBYTE(self->_firstArrowUserMovedDistance.traveledDistance) = 1;
          }
          v37 = &self->_anon_648[168];
          v38 = *(_OWORD *)a3;
          v39 = *((_OWORD *)a3 + 1);
          v40 = *((_OWORD *)a3 + 3);
          if (LOBYTE(self->_firstOutputRangeUserMovedDistance.traveledDistance))
          {
            self->_firstOutputRangeUserMovedDistance.previousPoseOfUser.var0.__val_.lightEstimate = (optional<double>)*((_OWORD *)a3 + 2);
            *(_OWORD *)&self->_firstOutputRangeUserMovedDistance.previousPoseOfUser.var0.__val_.source.var0.__null_state_ = v40;
            *(_OWORD *)v37 = v38;
            *(_OWORD *)&self->_firstOutputRangeUserMovedDistance.previousPoseOfUser.var0.__null_state_ = v39;
            v41 = *((_OWORD *)a3 + 4);
            v42 = *((_OWORD *)a3 + 5);
            v43 = *((_OWORD *)a3 + 6);
            self->_firstOutputRangeUserMovedDistance.oldPreviousPoseOfUser.var0.__val_.odometryAvailability = (optional<nearby::algorithms::common::OdometryAvailabilityState>)*((_QWORD *)a3 + 14);
            *(_OWORD *)&self->_firstOutputRangeUserMovedDistance.oldPreviousPoseOfUser.var0.__val_.trackingState = v42;
            *(_OWORD *)&self->_firstOutputRangeUserMovedDistance.oldPreviousPoseOfUser.var0.__val_.lightEstimate.__engaged_ = v43;
            *(_OWORD *)&self->_firstOutputRangeUserMovedDistance.previousPoseOfUser.__engaged_ = v41;
          }
          else
          {
            self->_firstOutputRangeUserMovedDistance.previousPoseOfUser.var0.__val_.lightEstimate = (optional<double>)*((_OWORD *)a3 + 2);
            *(_OWORD *)&self->_firstOutputRangeUserMovedDistance.previousPoseOfUser.var0.__val_.source.var0.__null_state_ = v40;
            *(_OWORD *)v37 = v38;
            *(_OWORD *)&self->_firstOutputRangeUserMovedDistance.previousPoseOfUser.var0.__null_state_ = v39;
            v44 = *((_OWORD *)a3 + 4);
            v45 = *((_OWORD *)a3 + 5);
            v46 = *((_OWORD *)a3 + 7);
            *(_OWORD *)&self->_firstOutputRangeUserMovedDistance.oldPreviousPoseOfUser.var0.__val_.lightEstimate.__engaged_ = *((_OWORD *)a3 + 6);
            *(_OWORD *)&self->_firstOutputRangeUserMovedDistance.oldPreviousPoseOfUser.var0.__val_.odometryAvailability.var0.__null_state_ = v46;
            *(_OWORD *)&self->_firstOutputRangeUserMovedDistance.previousPoseOfUser.__engaged_ = v44;
            *(_OWORD *)&self->_firstOutputRangeUserMovedDistance.oldPreviousPoseOfUser.var0.__val_.trackingState = v45;
            LOBYTE(self->_firstOutputRangeUserMovedDistance.traveledDistance) = 1;
          }
          v47 = &self->_anon_778[168];
          v48 = *(_OWORD *)a3;
          v49 = *((_OWORD *)a3 + 1);
          v50 = *((_OWORD *)a3 + 3);
          if (LOBYTE(self->_armsReachUserMovedDistance.traveledDistance))
          {
            self->_armsReachUserMovedDistance.previousPoseOfUser.var0.__val_.lightEstimate = (optional<double>)*((_OWORD *)a3 + 2);
            *(_OWORD *)&self->_armsReachUserMovedDistance.previousPoseOfUser.var0.__val_.source.var0.__null_state_ = v50;
            *(_OWORD *)v47 = v48;
            *(_OWORD *)&self->_armsReachUserMovedDistance.previousPoseOfUser.var0.__null_state_ = v49;
            v51 = *((_OWORD *)a3 + 4);
            v52 = *((_OWORD *)a3 + 5);
            v53 = *((_OWORD *)a3 + 6);
            self->_armsReachUserMovedDistance.oldPreviousPoseOfUser.var0.__val_.odometryAvailability = (optional<nearby::algorithms::common::OdometryAvailabilityState>)*((_QWORD *)a3 + 14);
            *(_OWORD *)&self->_armsReachUserMovedDistance.oldPreviousPoseOfUser.var0.__val_.trackingState = v52;
            *(_OWORD *)&self->_armsReachUserMovedDistance.oldPreviousPoseOfUser.var0.__val_.lightEstimate.__engaged_ = v53;
            *(_OWORD *)&self->_armsReachUserMovedDistance.previousPoseOfUser.__engaged_ = v51;
          }
          else
          {
            self->_armsReachUserMovedDistance.previousPoseOfUser.var0.__val_.lightEstimate = (optional<double>)*((_OWORD *)a3 + 2);
            *(_OWORD *)&self->_armsReachUserMovedDistance.previousPoseOfUser.var0.__val_.source.var0.__null_state_ = v50;
            *(_OWORD *)v47 = v48;
            *(_OWORD *)&self->_armsReachUserMovedDistance.previousPoseOfUser.var0.__null_state_ = v49;
            v54 = *((_OWORD *)a3 + 4);
            v55 = *((_OWORD *)a3 + 5);
            v56 = *((_OWORD *)a3 + 7);
            *(_OWORD *)&self->_armsReachUserMovedDistance.oldPreviousPoseOfUser.var0.__val_.lightEstimate.__engaged_ = *((_OWORD *)a3 + 6);
            *(_OWORD *)&self->_armsReachUserMovedDistance.oldPreviousPoseOfUser.var0.__val_.odometryAvailability.var0.__null_state_ = v56;
            *(_OWORD *)&self->_armsReachUserMovedDistance.previousPoseOfUser.__engaged_ = v54;
            *(_OWORD *)&self->_armsReachUserMovedDistance.oldPreviousPoseOfUser.var0.__val_.trackingState = v55;
            LOBYTE(self->_armsReachUserMovedDistance.traveledDistance) = 1;
          }
          v57 = &self->_anon_8a8[168];
          v58 = *(_OWORD *)a3;
          v59 = *((_OWORD *)a3 + 1);
          v60 = *((_OWORD *)a3 + 3);
          if (LOBYTE(self->_totalUserMovedDistance.traveledDistance))
          {
            self->_totalUserMovedDistance.previousPoseOfUser.var0.__val_.lightEstimate = (optional<double>)*((_OWORD *)a3 + 2);
            *(_OWORD *)&self->_totalUserMovedDistance.previousPoseOfUser.var0.__val_.source.var0.__null_state_ = v60;
            *(_OWORD *)v57 = v58;
            *(_OWORD *)&self->_totalUserMovedDistance.previousPoseOfUser.var0.__null_state_ = v59;
            v61 = *((_OWORD *)a3 + 4);
            v62 = *((_OWORD *)a3 + 5);
            v63 = *((_OWORD *)a3 + 6);
            self->_totalUserMovedDistance.oldPreviousPoseOfUser.var0.__val_.odometryAvailability = (optional<nearby::algorithms::common::OdometryAvailabilityState>)*((_QWORD *)a3 + 14);
            *(_OWORD *)&self->_totalUserMovedDistance.oldPreviousPoseOfUser.var0.__val_.trackingState = v62;
            *(_OWORD *)&self->_totalUserMovedDistance.oldPreviousPoseOfUser.var0.__val_.lightEstimate.__engaged_ = v63;
            *(_OWORD *)&self->_totalUserMovedDistance.previousPoseOfUser.__engaged_ = v61;
          }
          else
          {
            self->_totalUserMovedDistance.previousPoseOfUser.var0.__val_.lightEstimate = (optional<double>)*((_OWORD *)a3 + 2);
            *(_OWORD *)&self->_totalUserMovedDistance.previousPoseOfUser.var0.__val_.source.var0.__null_state_ = v60;
            *(_OWORD *)v57 = v58;
            *(_OWORD *)&self->_totalUserMovedDistance.previousPoseOfUser.var0.__null_state_ = v59;
            v64 = *((_OWORD *)a3 + 4);
            v65 = *((_OWORD *)a3 + 5);
            v66 = *((_OWORD *)a3 + 7);
            *(_OWORD *)&self->_totalUserMovedDistance.oldPreviousPoseOfUser.var0.__val_.lightEstimate.__engaged_ = *((_OWORD *)a3 + 6);
            *(_OWORD *)&self->_totalUserMovedDistance.oldPreviousPoseOfUser.var0.__val_.odometryAvailability.var0.__null_state_ = v66;
            *(_OWORD *)&self->_totalUserMovedDistance.previousPoseOfUser.__engaged_ = v64;
            *(_OWORD *)&self->_totalUserMovedDistance.oldPreviousPoseOfUser.var0.__val_.trackingState = v65;
            LOBYTE(self->_totalUserMovedDistance.traveledDistance) = 1;
          }
          v67 = &self->_anon_648[8];
          v68 = *(_OWORD *)a3;
          v69 = *((_OWORD *)a3 + 1);
          v70 = *((_OWORD *)a3 + 3);
          if (self->_anon_648[136])
          {
            *(_OWORD *)&self->_anon_648[40] = *((_OWORD *)a3 + 2);
            *(_OWORD *)&self->_anon_648[56] = v70;
            *(_OWORD *)v67 = v68;
            *(_OWORD *)&self->_anon_648[24] = v69;
            v71 = *((_OWORD *)a3 + 4);
            v72 = *((_OWORD *)a3 + 5);
            v73 = *((_OWORD *)a3 + 6);
            *(_QWORD *)&self->_anon_648[120] = *((_QWORD *)a3 + 14);
            *(_OWORD *)&self->_anon_648[88] = v72;
            *(_OWORD *)&self->_anon_648[104] = v73;
            *(_OWORD *)&self->_anon_648[72] = v71;
          }
          else
          {
            *(_OWORD *)&self->_anon_648[40] = *((_OWORD *)a3 + 2);
            *(_OWORD *)&self->_anon_648[56] = v70;
            *(_OWORD *)v67 = v68;
            *(_OWORD *)&self->_anon_648[24] = v69;
            v74 = *((_OWORD *)a3 + 4);
            v75 = *((_OWORD *)a3 + 5);
            v76 = *((_OWORD *)a3 + 7);
            *(_OWORD *)&self->_anon_648[104] = *((_OWORD *)a3 + 6);
            *(_OWORD *)&self->_anon_648[120] = v76;
            *(_OWORD *)&self->_anon_648[72] = v74;
            *(_OWORD *)&self->_anon_648[88] = v75;
            self->_anon_648[136] = 1;
          }
          v77 = &self->_anon_778[8];
          v78 = *(_OWORD *)a3;
          v79 = *((_OWORD *)a3 + 1);
          v80 = *((_OWORD *)a3 + 3);
          if (self->_anon_778[136])
          {
            *(_OWORD *)&self->_anon_778[40] = *((_OWORD *)a3 + 2);
            *(_OWORD *)&self->_anon_778[56] = v80;
            *(_OWORD *)v77 = v78;
            *(_OWORD *)&self->_anon_778[24] = v79;
            v81 = *((_OWORD *)a3 + 4);
            v82 = *((_OWORD *)a3 + 5);
            v83 = *((_OWORD *)a3 + 6);
            *(_QWORD *)&self->_anon_778[120] = *((_QWORD *)a3 + 14);
            *(_OWORD *)&self->_anon_778[88] = v82;
            *(_OWORD *)&self->_anon_778[104] = v83;
            *(_OWORD *)&self->_anon_778[72] = v81;
          }
          else
          {
            *(_OWORD *)&self->_anon_778[40] = *((_OWORD *)a3 + 2);
            *(_OWORD *)&self->_anon_778[56] = v80;
            *(_OWORD *)v77 = v78;
            *(_OWORD *)&self->_anon_778[24] = v79;
            v84 = *((_OWORD *)a3 + 4);
            v85 = *((_OWORD *)a3 + 5);
            v86 = *((_OWORD *)a3 + 7);
            *(_OWORD *)&self->_anon_778[104] = *((_OWORD *)a3 + 6);
            *(_OWORD *)&self->_anon_778[120] = v86;
            *(_OWORD *)&self->_anon_778[72] = v84;
            *(_OWORD *)&self->_anon_778[88] = v85;
            self->_anon_778[136] = 1;
          }
          v87 = &self->_anon_8a8[8];
          v88 = *(_OWORD *)a3;
          v89 = *((_OWORD *)a3 + 1);
          v90 = *((_OWORD *)a3 + 3);
          if (self->_anon_8a8[136])
          {
            *(_OWORD *)&self->_anon_8a8[40] = *((_OWORD *)a3 + 2);
            *(_OWORD *)&self->_anon_8a8[56] = v90;
            *(_OWORD *)v87 = v88;
            *(_OWORD *)&self->_anon_8a8[24] = v89;
            v91 = *((_OWORD *)a3 + 4);
            v92 = *((_OWORD *)a3 + 5);
            v93 = *((_OWORD *)a3 + 6);
            *(_QWORD *)&self->_anon_8a8[120] = *((_QWORD *)a3 + 14);
            *(_OWORD *)&self->_anon_8a8[88] = v92;
            *(_OWORD *)&self->_anon_8a8[104] = v93;
            *(_OWORD *)&self->_anon_8a8[72] = v91;
          }
          else
          {
            *(_OWORD *)&self->_anon_8a8[40] = *((_OWORD *)a3 + 2);
            *(_OWORD *)&self->_anon_8a8[56] = v90;
            *(_OWORD *)v87 = v88;
            *(_OWORD *)&self->_anon_8a8[24] = v89;
            v94 = *((_OWORD *)a3 + 4);
            v95 = *((_OWORD *)a3 + 5);
            v96 = *((_OWORD *)a3 + 7);
            *(_OWORD *)&self->_anon_8a8[104] = *((_OWORD *)a3 + 6);
            *(_OWORD *)&self->_anon_8a8[120] = v96;
            *(_OWORD *)&self->_anon_8a8[72] = v94;
            *(_OWORD *)&self->_anon_8a8[88] = v95;
            self->_anon_8a8[136] = 1;
          }
          v97 = &self->_anon_9d8[8];
          v98 = *(_OWORD *)a3;
          v99 = *((_OWORD *)a3 + 1);
          v100 = *((_OWORD *)a3 + 3);
          if (self->_anon_9d8[136])
          {
            *(_OWORD *)&self->_anon_9d8[40] = *((_OWORD *)a3 + 2);
            *(_OWORD *)&self->_anon_9d8[56] = v100;
            *(_OWORD *)v97 = v98;
            *(_OWORD *)&self->_anon_9d8[24] = v99;
            v101 = *((_OWORD *)a3 + 4);
            v102 = *((_OWORD *)a3 + 5);
            v103 = *((_OWORD *)a3 + 6);
            *(_QWORD *)&self->_anon_9d8[120] = *((_QWORD *)a3 + 14);
            *(_OWORD *)&self->_anon_9d8[88] = v102;
            *(_OWORD *)&self->_anon_9d8[104] = v103;
            *(_OWORD *)&self->_anon_9d8[72] = v101;
          }
          else
          {
            *(_OWORD *)&self->_anon_9d8[40] = *((_OWORD *)a3 + 2);
            *(_OWORD *)&self->_anon_9d8[56] = v100;
            *(_OWORD *)v97 = v98;
            *(_OWORD *)&self->_anon_9d8[24] = v99;
            v104 = *((_OWORD *)a3 + 4);
            v105 = *((_OWORD *)a3 + 5);
            v106 = *((_OWORD *)a3 + 7);
            *(_OWORD *)&self->_anon_9d8[104] = *((_OWORD *)a3 + 6);
            *(_OWORD *)&self->_anon_9d8[120] = v106;
            *(_OWORD *)&self->_anon_9d8[72] = v104;
            *(_OWORD *)&self->_anon_9d8[88] = v105;
            self->_anon_9d8[136] = 1;
          }
          *(_QWORD *)&self->_anon_648[152] = 0;
          *(_QWORD *)&self->_anon_778[152] = 0;
          *(_QWORD *)&self->_anon_8a8[152] = 0;
          *(_QWORD *)&self->_anon_9d8[152] = 0;
        }
        if (self->_timeAtFirstPose == -1.0)
          -[NIServerAnalyticsManager _updateUserMovedDistanceWithPose:lastPoseInfo:](self, "_updateUserMovedDistanceWithPose:lastPoseInfo:", a3, &self->_firstOutputRangeStraightLineDistance);
        if (self->_timeAtFirstValidPose == -1.0)
          -[NIServerAnalyticsManager _updateUserMovedDistanceWithPose:lastPoseInfo:](self, "_updateUserMovedDistanceWithPose:lastPoseInfo:", a3, &self->_anon_648[168]);
        if (self->_timeAtFirstArrow == -1.0)
          -[NIServerAnalyticsManager _updateUserMovedDistanceWithPose:lastPoseInfo:](self, "_updateUserMovedDistanceWithPose:lastPoseInfo:", a3, &self->_anon_778[168]);
        -[NIServerAnalyticsManager _updateUserMovedDistanceWithPose:lastPoseInfo:](self, "_updateUserMovedDistanceWithPose:lastPoseInfo:", a3, &self->_anon_8a8[168]);
      }
      v107 = &self->_anon_318[72];
      v108 = *(_OWORD *)a3;
      v109 = *((_OWORD *)a3 + 1);
      v110 = *((_OWORD *)a3 + 3);
      if (self->_anon_3a8[56])
      {
        self->_lastPose.var0.__val_.lightEstimate = (optional<double>)*((_OWORD *)a3 + 2);
        *(_OWORD *)&self->_lastPose.var0.__val_.source.var0.__null_state_ = v110;
        *(_OWORD *)v107 = v108;
        *(_OWORD *)&self->_lastPose.var0.__null_state_ = v109;
        v111 = *((_OWORD *)a3 + 4);
        v112 = *((_OWORD *)a3 + 5);
        v113 = *((_OWORD *)a3 + 6);
        *(_QWORD *)&self->_anon_3a8[40] = *((_QWORD *)a3 + 14);
        *(_OWORD *)&self->_anon_3a8[8] = v112;
        *(_OWORD *)&self->_anon_3a8[24] = v113;
        *(_OWORD *)&self->_lastPose.__engaged_ = v111;
      }
      else
      {
        self->_lastPose.var0.__val_.lightEstimate = (optional<double>)*((_OWORD *)a3 + 2);
        *(_OWORD *)&self->_lastPose.var0.__val_.source.var0.__null_state_ = v110;
        *(_OWORD *)v107 = v108;
        *(_OWORD *)&self->_lastPose.var0.__null_state_ = v109;
        v114 = *((_OWORD *)a3 + 4);
        v115 = *((_OWORD *)a3 + 5);
        v116 = *((_OWORD *)a3 + 7);
        *(_OWORD *)&self->_anon_3a8[24] = *((_OWORD *)a3 + 6);
        *(_OWORD *)&self->_anon_3a8[40] = v116;
        *(_OWORD *)&self->_lastPose.__engaged_ = v114;
        *(_OWORD *)&self->_anon_3a8[8] = v115;
        self->_anon_3a8[56] = 1;
      }
    }
    else
    {
      armsReachAlgorithmSource = self->_armsReachAlgorithmSource;
      v22 = __CFADD__(armsReachAlgorithmSource, 1);
      v23 = armsReachAlgorithmSource + 1;
      if (v22)
        v23 = 1;
      self->_armsReachAlgorithmSource = v23;
      -[NIServerAnalyticsManager _onVIOReset](self, "_onVIOReset", v5);
      BYTE2(self->_numberOfSolutions) = 0;
      self->_maxYCoordinateFinder = -1.79769313e308;
      self->_minYCoordinateFinder = 1.79769313e308;
    }
  }
}

- (void)_updateUserMovedDistanceWithPose:(const void *)a3 lastPoseInfo:(void *)a4
{
  float32x4_t v4;
  float32x4_t v5;
  float32x4_t v6;
  float v7;
  float32x4_t v8;
  float32x4_t v9;
  float v10;
  __int128 v12;
  __int128 v13;
  __int128 v14;
  __int128 v15;
  __int128 v16;
  __int128 v17;
  __int128 v18;
  __int128 v19;
  __int128 v20;
  __int128 v21;

  if (*((_BYTE *)a4 + 128) && *((_BYTE *)a4 + 272))
  {
    v4 = *((float32x4_t *)a3 + 4);
    v5 = vsubq_f32(*((float32x4_t *)a4 + 4), v4);
    v6 = vmulq_f32(v5, v5);
    v7 = sqrtf(vaddq_f32((float32x4_t)vdupq_laneq_s32((int32x4_t)v6, 2), vaddq_f32(v6, (float32x4_t)vdupq_lane_s32(*(int32x2_t *)v6.f32, 1))).f32[0]);
    v8 = vsubq_f32(*((float32x4_t *)a4 + 13), v4);
    v9 = vmulq_f32(v8, v8);
    v10 = sqrtf(vaddq_f32((float32x4_t)vdupq_laneq_s32((int32x4_t)v9, 2), vaddq_f32(v9, (float32x4_t)vdupq_lane_s32(*(int32x2_t *)v9.f32, 1))).f32[0]);
    if (v7 > 0.5 && v10 > 0.5)
    {
      *((double *)a4 + 36) = *((double *)a4 + 36) + v7;
      v12 = *((_OWORD *)a4 + 3);
      *((_OWORD *)a4 + 11) = *((_OWORD *)a4 + 2);
      *((_OWORD *)a4 + 12) = v12;
      *((_BYTE *)a4 + 272) = *((_BYTE *)a4 + 128);
      v13 = *((_OWORD *)a4 + 7);
      *((_OWORD *)a4 + 15) = *((_OWORD *)a4 + 6);
      *((_OWORD *)a4 + 16) = v13;
      v14 = *((_OWORD *)a4 + 5);
      *((_OWORD *)a4 + 13) = *((_OWORD *)a4 + 4);
      *((_OWORD *)a4 + 14) = v14;
      v15 = *((_OWORD *)a4 + 1);
      *((_OWORD *)a4 + 9) = *(_OWORD *)a4;
      *((_OWORD *)a4 + 10) = v15;
      v16 = *(_OWORD *)a3;
      v17 = *((_OWORD *)a3 + 1);
      v18 = *((_OWORD *)a3 + 3);
      *((_OWORD *)a4 + 2) = *((_OWORD *)a3 + 2);
      *((_OWORD *)a4 + 3) = v18;
      *(_OWORD *)a4 = v16;
      *((_OWORD *)a4 + 1) = v17;
      v19 = *((_OWORD *)a3 + 4);
      v20 = *((_OWORD *)a3 + 5);
      v21 = *((_OWORD *)a3 + 6);
      *((_QWORD *)a4 + 14) = *((_QWORD *)a3 + 14);
      *((_OWORD *)a4 + 5) = v20;
      *((_OWORD *)a4 + 6) = v21;
      *((_OWORD *)a4 + 4) = v19;
    }
  }
}

- (void)updateWithFinderPeerData:(const void *)a3
{
  double v5;
  int v6;
  double *p_timeAtFirstPeerLocationFromFindeeData;
  double minYCoordinateFinder;
  double maxYCoordinateFinder;
  int numberOfArrowRevokes;
  BOOL v13;
  int v14;

  if (LODWORD(self->_lifecycleTimeoutType) != 4)
    return;
  v5 = sub_10000883C();
  if (*(double *)&self->_numberOfWalkingOrkUnknown == -1.0)
  {
    *(double *)&self->_numberOfWalkingOrkUnknown = v5;
    if (*((_BYTE *)a3 + 72))
    {
      HIDWORD(self->_maxYCoordinateFindee) = *((_DWORD *)a3 + 10);
      LOBYTE(self->_minYCoordinateFindee) = 1;
    }
  }
  if (*((_BYTE *)a3 + 72))
  {
    v6 = *((_DWORD *)a3 + 10);
    if (self->_timeAtFirstPeerLocationFromFindeeData == -1.0 && v6 == 1)
    {
      p_timeAtFirstPeerLocationFromFindeeData = &self->_timeAtFirstPeerLocationFromFindeeData;
    }
    else
    {
      if (self->_timeAtFirstPeerLocationFromFMF != -1.0 || v6 != 0)
        goto LABEL_19;
      p_timeAtFirstPeerLocationFromFindeeData = &self->_timeAtFirstPeerLocationFromFMF;
    }
    *p_timeAtFirstPeerLocationFromFindeeData = v5;
LABEL_19:
    if (LOBYTE(self->_minYCoordinateFindee) && HIDWORD(self->_maxYCoordinateFindee) == v6)
    {
      minYCoordinateFinder = *((double *)a3 + 8);
      maxYCoordinateFinder = self->_maxYCoordinateFinder;
      if (minYCoordinateFinder >= maxYCoordinateFinder)
        maxYCoordinateFinder = *((double *)a3 + 8);
      self->_maxYCoordinateFinder = maxYCoordinateFinder;
      if (self->_minYCoordinateFinder < minYCoordinateFinder)
        minYCoordinateFinder = self->_minYCoordinateFinder;
      self->_minYCoordinateFinder = minYCoordinateFinder;
      BYTE1(self->_maxYCoordinateFindee) |= vabdd_f64(maxYCoordinateFinder, minYCoordinateFinder) > 2.5;
      if (!*((_BYTE *)a3 + 72))
        sub_10000BA44();
    }
    else
    {
      self->_maxYCoordinateFinder = -1.79769313e308;
      self->_minYCoordinateFinder = 1.79769313e308;
    }
    HIDWORD(self->_maxYCoordinateFindee) = v6;
    LOBYTE(self->_minYCoordinateFindee) = 1;
    goto LABEL_29;
  }
  self->_maxYCoordinateFinder = -1.79769313e308;
  self->_minYCoordinateFinder = 1.79769313e308;
LABEL_29:
  if (*((_BYTE *)a3 + 112) && self->_timeAtFirstPDRFromFindeeData == -1.0)
    self->_timeAtFirstPDRFromFindeeData = v5;
  if (*((_BYTE *)a3 + 16) && !*((_DWORD *)a3 + 2) && self->_timeAtFirstVIOFromFindeeData == -1.0)
    self->_timeAtFirstVIOFromFindeeData = v5;
  if (*((_BYTE *)a3 + 160))
  {
    if (self->_timeAtFirstSelfLocation == -1.0)
      self->_timeAtFirstSelfLocation = v5;
    if (self->_timeAtFirstRawUWBRange == -1.0)
      self->_timeAtFirstRawUWBRange = v5;
  }
  numberOfArrowRevokes = self->_numberOfArrowRevokes;
  v13 = __CFADD__(numberOfArrowRevokes, 1);
  v14 = numberOfArrowRevokes + 1;
  if (v13)
    v14 = 1;
  self->_numberOfArrowRevokes = v14;
}

- (void)updateWithSolution:(const void *)a3
{
  double v5;
  uint64_t v6;
  int timeAtEndOfSession_high;
  BOOL v8;
  int v9;
  double timeAtFirstPose;
  int v11;
  float v12;
  __int128 v13;
  __int128 v14;
  __int128 v15;
  __int128 v16;
  unsigned __int8 v17;
  int firstArrowAlgorithmSource;
  int v19;
  int v20;
  __int128 v21;
  __int128 v22;
  __int128 v23;
  __int128 v24;
  int v25;
  __int128 v26;
  __int128 v27;
  __int128 v28;
  __int128 v29;
  int firstOutputRangeAlgorithmSource;
  int v31;

  if (LODWORD(self->_lifecycleTimeoutType) == 4)
  {
    v5 = sub_10000883C();
    if (*((_BYTE *)a3 + 360))
    {
      if (LOBYTE(self->_timeOfLastSplicedPoseErrorLogging))
      {
        v6 = *((int *)a3 + 89);
        if (v6 <= 5)
          *(double *)((char *)&self->super.isa + qword_1004569F0[v6]) = v5
                                                                      - *(double *)&self->_lastAngleError
                                                                      + *(double *)((char *)&self->super.isa
                                                                                  + qword_1004569F0[v6]);
      }
    }
    if (self->_timePeerLocationFromFindeeData != -1.0)
    {
      if (LOBYTE(self->_numberOfSolutions) && !*((_BYTE *)a3 + 208) && self->_timeAtFirstArrow == -1.0)
      {
        timeAtEndOfSession_high = HIDWORD(self->_timeAtEndOfSession);
        v8 = __CFADD__(timeAtEndOfSession_high, 1);
        v9 = timeAtEndOfSession_high + 1;
        if (v8)
          v9 = 1;
        HIDWORD(self->_timeAtEndOfSession) = v9;
      }
      BYTE1(self->_numberOfSolutions) = *((_BYTE *)a3 + 380);
      if (*((_BYTE *)a3 + 208))
      {
        LOBYTE(self->_numberOfSolutions) = 1;
        timeAtFirstPose = self->_timeAtFirstPose;
        if (timeAtFirstPose == -1.0)
        {
          self->_timeAtFirstPose = v5;
          if (*((_BYTE *)a3 + 368))
            v11 = *((_DWORD *)a3 + 91);
          else
            v11 = 0;
          LODWORD(self->_timeAtFirstStaticFromFindeeData) = v11;
          if (*((_BYTE *)a3 + 192))
          {
            v12 = *((float *)a3 + 6);
            if (v12 != 1.1755e-38)
              self->_minRawRangeValue = v12;
          }
          timeAtFirstPose = v5;
          if (self->_timeAtLastLocationFromFindeeData != -1.0)
          {
            v13 = *(_OWORD *)&self->_lastPose.__engaged_;
            *(_OWORD *)&self->_anon_438[8] = *(_OWORD *)&self->_anon_3a8[8];
            v14 = *(_OWORD *)&self->_anon_3a8[40];
            *(_OWORD *)&self->_anon_438[24] = *(_OWORD *)&self->_anon_3a8[24];
            *(_OWORD *)&self->_anon_438[40] = v14;
            v15 = *(_OWORD *)&self->_anon_318[72];
            *(_OWORD *)&self->_firstArrowPose.var0.__null_state_ = *(_OWORD *)&self->_lastPose.var0.__null_state_;
            v16 = *(_OWORD *)&self->_lastPose.var0.__val_.source.var0.__null_state_;
            self->_firstArrowPose.var0.__val_.lightEstimate = self->_lastPose.var0.__val_.lightEstimate;
            *(_OWORD *)&self->_firstArrowPose.var0.__val_.source.var0.__null_state_ = v16;
            *(_OWORD *)&self->_firstArrowPose.__engaged_ = v13;
            v17 = self->_anon_3a8[56];
            *(_OWORD *)&self->_anon_3a8[72] = v15;
            timeAtFirstPose = v5;
            self->_anon_438[56] = v17;
          }
        }
        if (timeAtFirstPose != -1.0 && self->_timeAtFirstArrow == -1.0)
        {
          firstArrowAlgorithmSource = self->_firstArrowAlgorithmSource;
          v8 = __CFADD__(firstArrowAlgorithmSource, 1);
          v19 = firstArrowAlgorithmSource + 1;
          if (v8)
            v19 = 1;
          self->_firstArrowAlgorithmSource = v19;
        }
      }
      else
      {
        LOBYTE(self->_numberOfSolutions) = 0;
      }
      if (*((_BYTE *)a3 + 192) && *((float *)a3 + 6) != 1.1755e-38)
      {
        if (self->_timeAtFirstValidPose == -1.0)
        {
          self->_timeAtFirstValidPose = v5;
          v20 = *((_BYTE *)a3 + 368) ? *((_DWORD *)a3 + 91) : 0;
          HIDWORD(self->_timeAtFirstStaticFromFindeeData) = v20;
          if (self->_timeAtLastLocationFromFindeeData != -1.0)
          {
            v21 = *(_OWORD *)&self->_lastPose.__engaged_;
            *(_OWORD *)&self->_anon_558[8] = *(_OWORD *)&self->_anon_3a8[8];
            v22 = *(_OWORD *)&self->_anon_3a8[40];
            *(_OWORD *)&self->_anon_558[24] = *(_OWORD *)&self->_anon_3a8[24];
            *(_OWORD *)&self->_anon_558[40] = v22;
            v23 = *(_OWORD *)&self->_anon_318[72];
            *(_OWORD *)&self->_firstOutputRangePose.var0.__null_state_ = *(_OWORD *)&self->_lastPose.var0.__null_state_;
            v24 = *(_OWORD *)&self->_lastPose.var0.__val_.source.var0.__null_state_;
            self->_firstOutputRangePose.var0.__val_.lightEstimate = self->_lastPose.var0.__val_.lightEstimate;
            *(_OWORD *)&self->_firstOutputRangePose.var0.__val_.source.var0.__null_state_ = v24;
            *(_OWORD *)&self->_firstOutputRangePose.__engaged_ = v21;
            self->_anon_558[56] = self->_anon_3a8[56];
            *(_OWORD *)&self->_anon_4c8[72] = v23;
          }
        }
        if (self->_timeAtFirstArrow == -1.0)
        {
          if (!*((_BYTE *)a3 + 192))
            sub_10000BA44();
          if (*((float *)a3 + 6) <= 2.0)
          {
            self->_timeAtFirstArrow = v5;
            v25 = *((_BYTE *)a3 + 368) ? *((_DWORD *)a3 + 91) : 0;
            LODWORD(self->_timeAtEndOfSession) = v25;
            if (self->_timeAtLastLocationFromFindeeData != -1.0)
            {
              v26 = *(_OWORD *)&self->_lastPose.__engaged_;
              *(_OWORD *)&self->_anon_4c8[8] = *(_OWORD *)&self->_anon_3a8[8];
              v27 = *(_OWORD *)&self->_anon_3a8[40];
              *(_OWORD *)&self->_anon_4c8[24] = *(_OWORD *)&self->_anon_3a8[24];
              *(_OWORD *)&self->_anon_4c8[40] = v27;
              v28 = *(_OWORD *)&self->_anon_318[72];
              *(_OWORD *)&self->_armsReachPose.var0.__null_state_ = *(_OWORD *)&self->_lastPose.var0.__null_state_;
              v29 = *(_OWORD *)&self->_lastPose.var0.__val_.source.var0.__null_state_;
              self->_armsReachPose.var0.__val_.lightEstimate = self->_lastPose.var0.__val_.lightEstimate;
              *(_OWORD *)&self->_armsReachPose.var0.__val_.source.var0.__null_state_ = v29;
              *(_OWORD *)&self->_armsReachPose.__engaged_ = v26;
              self->_anon_4c8[56] = self->_anon_3a8[56];
              *(_OWORD *)&self->_anon_438[72] = v28;
            }
          }
        }
      }
      if (self->_timeAtFirstPose != -1.0 && self->_timeAtFirstArrow == -1.0)
      {
        firstOutputRangeAlgorithmSource = self->_firstOutputRangeAlgorithmSource;
        v8 = __CFADD__(firstOutputRangeAlgorithmSource, 1);
        v31 = firstOutputRangeAlgorithmSource + 1;
        if (v8)
          v31 = 1;
        self->_firstOutputRangeAlgorithmSource = v31;
      }
    }
    *(double *)&self->_lastAngleError = v5;
    LOBYTE(self->_timeOfLastSplicedPoseErrorLogging) = 1;
  }
}

- (void)updateWithPeerLocationFromFMF
{
  double v3;

  if (LODWORD(self->_lifecycleTimeoutType) == 4)
  {
    v3 = sub_10000883C();
    if (self->_timeAtFirstRawUWBRange == -1.0)
      self->_timeAtFirstRawUWBRange = v3;
    if (self->_timeAtFirstPeerLocation == -1.0)
      self->_timeAtFirstPeerLocation = v3;
  }
}

- (void)nearbyObjectUpdated:(id)a3
{
  id v4;
  NSObject *v5;
  NSString *bundleIdentifier;
  float v7;
  NSObject *v8;
  NSString *v9;
  float v10;
  double v11;
  double firstDistance;
  double lastDistance;
  int v14;
  NSString *v15;
  __int16 v16;
  id v17;

  v4 = a3;
  v5 = qword_10085F520;
  if (os_log_type_enabled((os_log_t)qword_10085F520, OS_LOG_TYPE_INFO))
  {
    bundleIdentifier = self->_bundleIdentifier;
    v14 = 138412546;
    v15 = bundleIdentifier;
    v16 = 2112;
    v17 = v4;
    _os_log_impl((void *)&_mh_execute_header, v5, OS_LOG_TYPE_INFO, "#ni-ca,[%@] nearbyObjectUpdated: %@", (uint8_t *)&v14, 0x16u);
  }
  objc_msgSend(v4, "distance");
  if (v7 == NINearbyObjectDistanceNotAvailable)
  {
    v8 = qword_10085F520;
    if (os_log_type_enabled((os_log_t)qword_10085F520, OS_LOG_TYPE_INFO))
    {
      v9 = self->_bundleIdentifier;
      v14 = 138412290;
      v15 = v9;
      _os_log_impl((void *)&_mh_execute_header, v8, OS_LOG_TYPE_INFO, "#ni-ca,[%@] nearby object does not contain distance", (uint8_t *)&v14, 0xCu);
    }
  }
  else
  {
    objc_msgSend(v4, "distance");
    v11 = v10;
    if (LOBYTE(self->_timeSpentVisible))
    {
      firstDistance = self->_firstDistance;
      lastDistance = self->_lastDistance;
      if (firstDistance <= v11)
        firstDistance = v11;
      *(double *)&self->_receivedDistance = v11;
      self->_firstDistance = firstDistance;
      if (lastDistance < v11)
        v11 = lastDistance;
      self->_lastDistance = v11;
    }
    else
    {
      self->_timeSpentNotVisible = v11;
      *(double *)&self->_receivedDistance = v11;
      self->_firstDistance = v11;
      self->_lastDistance = v11;
      LOBYTE(self->_timeSpentVisible) = 1;
    }
  }

}

- (void)lifecycleTimeoutBeforeTrackingForDiscoveryToken:(id)a3
{
  id v4;
  NSObject *v5;
  NSString *bundleIdentifier;
  double maxDistance;
  int v8;
  NSString *v9;
  __int16 v10;
  id v11;

  v4 = a3;
  v5 = qword_10085F520;
  if (os_log_type_enabled((os_log_t)qword_10085F520, OS_LOG_TYPE_INFO))
  {
    bundleIdentifier = self->_bundleIdentifier;
    v8 = 138412546;
    v9 = bundleIdentifier;
    v10 = 2112;
    v11 = v4;
    _os_log_impl((void *)&_mh_execute_header, v5, OS_LOG_TYPE_INFO, "#ni-ca,[%@] lifecycleTimeoutBeforeTrackingForDiscoveryToken: %@", (uint8_t *)&v8, 0x16u);
  }
  maxDistance = self->_maxDistance;
  *(_QWORD *)&self->_maxDistance = CFSTR("Before Tracking");

}

- (void)lifecycleTimeoutAfterTrackingForDiscoveryToken:(id)a3
{
  id v4;
  NSObject *v5;
  NSString *bundleIdentifier;
  double maxDistance;
  int v8;
  NSString *v9;
  __int16 v10;
  id v11;

  v4 = a3;
  v5 = qword_10085F520;
  if (os_log_type_enabled((os_log_t)qword_10085F520, OS_LOG_TYPE_INFO))
  {
    bundleIdentifier = self->_bundleIdentifier;
    v8 = 138412546;
    v9 = bundleIdentifier;
    v10 = 2112;
    v11 = v4;
    _os_log_impl((void *)&_mh_execute_header, v5, OS_LOG_TYPE_INFO, "#ni-ca,[%@] lifecycleTimeoutAfterTrackingForDiscoveryToken: %@", (uint8_t *)&v8, 0x16u);
  }
  maxDistance = self->_maxDistance;
  *(_QWORD *)&self->_maxDistance = CFSTR("After Tracking");

}

- (void)backgroundContinuationDiscoveryTimeout
{
  NSObject *v3;
  NSString *bundleIdentifier;
  double minDistance;
  int v6;
  NSString *v7;

  v3 = qword_10085F520;
  if (os_log_type_enabled((os_log_t)qword_10085F520, OS_LOG_TYPE_INFO))
  {
    bundleIdentifier = self->_bundleIdentifier;
    v6 = 138412290;
    v7 = bundleIdentifier;
    _os_log_impl((void *)&_mh_execute_header, v3, OS_LOG_TYPE_INFO, "#ni-ca,[%@] backgroundContinuationDiscoveryTimeout", (uint8_t *)&v6, 0xCu);
  }
  minDistance = self->_minDistance;
  *(_QWORD *)&self->_minDistance = CFSTR("Discovery");

}

- (void)backgroundContinuationInteractionTimeout
{
  NSObject *v3;
  NSString *bundleIdentifier;
  double minDistance;
  int v6;
  NSString *v7;

  v3 = qword_10085F520;
  if (os_log_type_enabled((os_log_t)qword_10085F520, OS_LOG_TYPE_INFO))
  {
    bundleIdentifier = self->_bundleIdentifier;
    v6 = 138412290;
    v7 = bundleIdentifier;
    _os_log_impl((void *)&_mh_execute_header, v3, OS_LOG_TYPE_INFO, "#ni-ca,[%@] backgroundContinuationInteractionTimeout", (uint8_t *)&v6, 0xCu);
  }
  minDistance = self->_minDistance;
  *(_QWORD *)&self->_minDistance = CFSTR("Interaction");

}

- (void)_updateMinMaxRangeAndRSSI:(double)a3 uwbRSSI:(double)a4 nbRSSI:(optional<double>)a5
{
  double lastNBRSSI;
  double minDistance_finding;
  int8x16_t v8;
  float64x2_t v9;
  float64x2_t v10;
  int8x16_t v11;
  double val;
  double maxUWBRSSI;

  if (self->_m2 == -1.0)
  {
    self->_m2 = a3;
    self->_firstDistance_finding = a4;
  }
  if (self->_firstUWBRSSI == 0.0 && a5.__engaged_)
  {
    *(double *)&self->_acquisitionReason = a5.var0.__val_;
    self->_firstUWBRSSI = a5.var0.__val_;
  }
  self->_firstNBRSSI = a3;
  lastNBRSSI = self->_lastNBRSSI;
  if (lastNBRSSI <= a3)
    lastNBRSSI = a3;
  self->_lastNBRSSI = lastNBRSSI;
  minDistance_finding = self->_minDistance_finding;
  if (minDistance_finding >= a4)
    minDistance_finding = a4;
  self->_minDistance_finding = minDistance_finding;
  v8 = *(int8x16_t *)&self->_maxDistance_finding;
  v9.f64[0] = self->_maxDistance_finding;
  v9.f64[1] = a3;
  v10.f64[1] = self->_maxNBRSSI;
  v10.f64[0] = a4;
  self->_lastDistance_finding = a4;
  v11 = (int8x16_t)vcgtq_f64(v9, v10);
  v9.f64[0] = a4;
  *(int8x16_t *)&self->_maxDistance_finding = vbslq_s8(v11, v8, (int8x16_t)v9);
  if (a5.__engaged_)
  {
    val = a5.var0.__val_;
    self->_firstUWBRSSI = a5.var0.__val_;
    maxUWBRSSI = self->_maxUWBRSSI;
    if (maxUWBRSSI >= a5.var0.__val_)
      maxUWBRSSI = a5.var0.__val_;
    self->_maxUWBRSSI = maxUWBRSSI;
    if (self->_lastUWBRSSI > a5.var0.__val_)
      val = self->_lastUWBRSSI;
    self->_lastUWBRSSI = val;
  }
}

- (double)_finderTimeFromFirstPoseTo:(double)a3
{
  double v3;
  double timePeerLocationFromFindeeData;

  v3 = -1.0;
  if (a3 != -1.0)
  {
    timePeerLocationFromFindeeData = self->_timePeerLocationFromFindeeData;
    if (timePeerLocationFromFindeeData != -1.0)
      return a3 - timePeerLocationFromFindeeData;
  }
  return v3;
}

- (id)_algorithmSourceToString:(int)a3
{
  if (a3 > 7)
    return CFSTR("None");
  else
    return off_1007FAD58[a3];
}

- (void)_calculateStraightLineDistance
{
  float32x4_t v2;
  float32x4_t v3;
  float32x4_t v4;
  float32x4_t v5;
  float32x4_t v6;
  float32x4_t v7;
  float32x4_t v8;
  float32x4_t v9;
  NSObject *v10;
  uint8_t v11[16];

  if (self->_anon_318[56])
  {
    v2 = *(float32x4_t *)&self->_firstPose.__engaged_;
    if (self->_anon_438[56])
    {
      v3 = vsubq_f32(v2, *(float32x4_t *)&self->_firstArrowPose.__engaged_);
      v4 = vmulq_f32(v3, v3);
      *(double *)&self->_anon_558[72] = sqrtf(vaddq_f32((float32x4_t)vdupq_laneq_s32((int32x4_t)v4, 2), vaddq_f32(v4, (float32x4_t)vdupq_lane_s32(*(int32x2_t *)v4.f32, 1))).f32[0]);
    }
    if (self->_anon_558[56])
    {
      v5 = vsubq_f32(v2, *(float32x4_t *)&self->_firstOutputRangePose.__engaged_);
      v6 = vmulq_f32(v5, v5);
      self->_firstArrowStraightLineDistance = sqrtf(vaddq_f32((float32x4_t)vdupq_laneq_s32((int32x4_t)v6, 2), vaddq_f32(v6, (float32x4_t)vdupq_lane_s32(*(int32x2_t *)v6.f32, 1))).f32[0]);
    }
    if (self->_anon_4c8[56])
    {
      v7 = vsubq_f32(v2, *(float32x4_t *)&self->_armsReachPose.__engaged_);
      v8 = vmulq_f32(v7, v7);
      *(double *)&self->_anon_558[80] = sqrtf(vaddq_f32((float32x4_t)vdupq_laneq_s32((int32x4_t)v8, 2), vaddq_f32(v8, (float32x4_t)vdupq_lane_s32(*(int32x2_t *)v8.f32, 1))).f32[0]);
    }
    if (self->_anon_3a8[56])
    {
      v9 = vsubq_f32(*(float32x4_t *)&self->_firstPose.var0.__val_.source.var0.__null_state_, *(float32x4_t *)&self->_lastPose.var0.__val_.source.var0.__null_state_);
      *(double *)&self->_anon_af8[80] = sqrtf(vaddv_f32((float32x2_t)*(_OWORD *)&vmulq_f32(v9, v9)));
    }
  }
  else
  {
    v10 = qword_10085F520;
    if (os_log_type_enabled((os_log_t)qword_10085F520, OS_LOG_TYPE_INFO))
    {
      *(_WORD *)v11 = 0;
      _os_log_impl((void *)&_mh_execute_header, v10, OS_LOG_TYPE_INFO, "#ni-ca,Unable to calculate straight line distance between finder and findee (first pose doesn't have value)", v11, 2u);
    }
  }
}

- (void)_onVIOReset
{
  if (self->_anon_648[136])
    self->_anon_648[136] = 0;
  if (LOBYTE(self->_firstArrowUserMovedDistance.traveledDistance))
    LOBYTE(self->_firstArrowUserMovedDistance.traveledDistance) = 0;
  if (self->_anon_778[136])
    self->_anon_778[136] = 0;
  if (LOBYTE(self->_firstOutputRangeUserMovedDistance.traveledDistance))
    LOBYTE(self->_firstOutputRangeUserMovedDistance.traveledDistance) = 0;
  *(_QWORD *)&self->_anon_648[152] = 0xBFF0000000000000;
  if (self->_anon_8a8[136])
    self->_anon_8a8[136] = 0;
  if (LOBYTE(self->_armsReachUserMovedDistance.traveledDistance))
    LOBYTE(self->_armsReachUserMovedDistance.traveledDistance) = 0;
  *(_QWORD *)&self->_anon_8a8[152] = 0xBFF0000000000000;
  if (self->_anon_9d8[136])
    self->_anon_9d8[136] = 0;
  if (LOBYTE(self->_totalUserMovedDistance.traveledDistance))
    LOBYTE(self->_totalUserMovedDistance.traveledDistance) = 0;
  *(_QWORD *)&self->_anon_9d8[152] = 0xBFF0000000000000;
  if (self->_anon_438[56])
    self->_anon_438[56] = 0;
  if (self->_anon_558[56])
    self->_anon_558[56] = 0;
  if (self->_anon_4c8[56])
    self->_anon_4c8[56] = 0;
  if (self->_anon_318[56])
    self->_anon_318[56] = 0;
  self->_firstArrowStraightLineDistance = -1.0;
  __asm { FMOV            V0.2D, #-1.0 }
  *(_OWORD *)&self->_anon_558[72] = _Q0;
  *(_QWORD *)&self->_anon_af8[80] = 0xBFF0000000000000;
  *(_OWORD *)&self->_anon_dc8[56] = 0u;
  self->_deltaVSourceTime = 0.0;
}

- (double)_deltaDistanceFromVIOPoses:(optional<nearby:(optional<nearby::algorithms::common::Pose> *)a4 :algorithms::common::Pose> *)a3 :
{
  double result;
  float32x4_t v5;
  float32x4_t v6;

  result = 0.0;
  if (a3[2].var0.__val_.lightEstimate.var0.__null_state_)
  {
    if (a4[2].var0.__val_.lightEstimate.var0.__null_state_)
    {
      v5 = vsubq_f32(*(float32x4_t *)&a4[1].var0.__val_.trackingState, *(float32x4_t *)&a3[1].var0.__val_.trackingState);
      v6 = vmulq_f32(v5, v5);
      return sqrtf(vaddq_f32((float32x4_t)vdupq_laneq_s32((int32x4_t)v6, 2), vaddq_f32(v6, (float32x4_t)vdupq_lane_s32(*(int32x2_t *)v6.f32, 1))).f32[0]);
    }
  }
  return result;
}

- (BOOL)_isSemiStaticFromVIO:(optional<nearby:(optional<nearby:(double)a5 :algorithms::common::Pose> *)a4 :algorithms::common::Pose> *)a3 ::
{
  __int128 v6;
  __int128 v7;
  __int128 v8;
  optional<double> lightEstimate;
  __int128 v10;
  __int128 v11;
  __int128 v12;
  optional<double> v13;
  double v14;
  _OWORD v16[9];
  _OWORD v17[9];

  if (!a3[2].var0.__val_.lightEstimate.var0.__null_state_)
    return 0;
  if (!a4[2].var0.__val_.lightEstimate.var0.__null_state_)
    return 0;
  v6 = *(_OWORD *)&a3[2].var0.__null_state_;
  v17[6] = *(_OWORD *)&a3[1].var0.__val_.odometryAvailability.var0.__null_state_;
  v17[7] = v6;
  v17[8] = a3[2].var0.__val_.lightEstimate;
  v7 = *(_OWORD *)&a3->__engaged_;
  v17[2] = *(_OWORD *)&a3->var0.__val_.source.var0.__null_state_;
  v17[3] = v7;
  v8 = *(_OWORD *)&a3[1].var0.__val_.lightEstimate.__engaged_;
  v17[4] = *(_OWORD *)&a3[1].var0.__val_.trackingState;
  v17[5] = v8;
  lightEstimate = a3->var0.__val_.lightEstimate;
  v17[0] = *(_OWORD *)&a3->var0.__null_state_;
  v17[1] = lightEstimate;
  v10 = *(_OWORD *)&a4[2].var0.__null_state_;
  v16[6] = *(_OWORD *)&a4[1].var0.__val_.odometryAvailability.var0.__null_state_;
  v16[7] = v10;
  v16[8] = a4[2].var0.__val_.lightEstimate;
  v11 = *(_OWORD *)&a4->__engaged_;
  v16[2] = *(_OWORD *)&a4->var0.__val_.source.var0.__null_state_;
  v16[3] = v11;
  v12 = *(_OWORD *)&a4[1].var0.__val_.lightEstimate.__engaged_;
  v16[4] = *(_OWORD *)&a4[1].var0.__val_.trackingState;
  v16[5] = v12;
  v13 = a4->var0.__val_.lightEstimate;
  v16[0] = *(_OWORD *)&a4->var0.__null_state_;
  v16[1] = v13;
  -[NIServerAnalyticsManager _deltaDistanceFromVIOPoses::](self, "_deltaDistanceFromVIOPoses::", v17, v16);
  return v14 / a5 < 0.15;
}

- (BOOL)_isPDRAvailable:(PDRInput *)a3
{
  return a3->deltaPosX.__engaged_ && a3->deltaPosY.__engaged_;
}

- (void)_calculateIOMetrics:(double)a3
{
  double timeAtLastIOUpdate;
  double v4;
  double stdSpeedFromVIO;
  double meanSpeedFromVIOError;
  double pdrSSDetectionFalsePositiveRate;

  timeAtLastIOUpdate = self->_timeAtLastIOUpdate;
  if (timeAtLastIOUpdate > 0.0)
    *(double *)&self->_anon_af8[72] = (self->_timePDRAndVIOWasAvailable - timeAtLastIOUpdate) / timeAtLastIOUpdate;
  v4 = *(double *)&self->_anon_9d8[176];
  if (v4 <= 0.0)
  {
    stdSpeedFromVIO = self->_stdSpeedFromVIO;
  }
  else
  {
    self->_radialDisplacementFromVIO = timeAtLastIOUpdate / v4;
    self->_meanSpeedFromVIO = (self->_timePDRAndVIOWasAvailable - timeAtLastIOUpdate) / v4;
    stdSpeedFromVIO = self->_stdSpeedFromVIO;
    self->_pdrSSDetectionTruePositiveRate = stdSpeedFromVIO / v4;
  }
  if (stdSpeedFromVIO > 0.0)
    self->_timeSSFromIOAndSSFromVIO = self->_timeSSFromVIO / stdSpeedFromVIO;
  meanSpeedFromVIOError = self->_meanSpeedFromVIOError;
  if (meanSpeedFromVIOError > 0.0)
    self->_timeSSFromIOAndNotSSFromVIO = self->_timeNotSSFromVIO / meanSpeedFromVIOError;
  pdrSSDetectionFalsePositiveRate = self->_pdrSSDetectionFalsePositiveRate;
  if (pdrSSDetectionFalsePositiveRate > 2.0)
    self->_radialDisplacementError = self->_numberOfPDRUpdates / pdrSSDetectionFalsePositiveRate;
}

- (VectorAggregateErrors)_calculateErrorStatsFromVector:(SEL)a3
{
  float *end;
  VectorAggregateErrors *result;
  float *v8;
  float *begin;
  uint64_t v10;
  unint64_t v11;
  unint64_t v12;
  float v13;
  float v14;
  float v15;
  float *v16;
  float v17;
  float v18;
  double v19;
  float v20;
  char v21;

  end = a4->__end_;
  if (end == a4->__begin_)
    sub_1003CBA14();
  result = (VectorAggregateErrors *)std::__sort<std::__less<float,float> &,float *>(a4->__begin_, end, &v21);
  begin = a4->__begin_;
  v8 = a4->__end_;
  v10 = (char *)v8 - (char *)a4->__begin_;
  v11 = v10 >> 2;
  v12 = (unint64_t)(v10 >> 2) >> 1;
  if ((v10 & 4) != 0)
    v13 = begin[v12];
  else
    v13 = (float)(begin[v12 - 1] + begin[v12]) * 0.5;
  v14 = begin[(int)((double)v11 * 0.95)];
  if (begin == v8)
  {
    v18 = 0.0 / (float)v11;
    v19 = 0.0;
  }
  else
  {
    v15 = 0.0;
    v16 = a4->__begin_;
    do
    {
      v17 = *v16++;
      v15 = v15 + v17;
    }
    while (v16 != v8);
    v18 = v15 / (float)v11;
    v19 = 0.0;
    do
    {
      v20 = *begin++;
      v19 = v19 + (float)(v20 * v20);
    }
    while (begin != v8);
  }
  retstr->var0 = v18;
  retstr->var1 = sqrt(v19 / (double)v11 - (float)(v18 * v18));
  retstr->var2 = v13;
  retstr->var3 = v14;
  retstr->var4 = v11;
  return result;
}

- (void)_calculatePoseSplicingMetrics
{
  uint64_t v3;
  double val;
  unint64_t v5;
  unint64_t v6;
  float v7;
  float v8;
  double v9;
  float v10;
  double v11;
  double v12;
  float v13;
  float v14;
  NSObject *v15;
  float v16;
  int v17;
  double v18;
  __int16 v19;
  double v20;
  __int16 v21;
  double v22;
  __int16 v23;
  double v24;

  std::__sort<std::__less<float,float> &,float *>(*(_QWORD *)&self->_timeOfLastPDRUpdate.var0.__val_, *(_QWORD *)&self->_timeOfLastPDRUpdate.__engaged_, &v17);
  v3 = *(_QWORD *)&self->_timeOfLastPDRUpdate.__engaged_;
  val = self->_timeOfLastPDRUpdate.var0.__val_;
  v5 = (v3 - *(_QWORD *)&val) >> 2;
  v6 = v5 >> 1;
  if ((((_DWORD)v3 - LODWORD(val)) & 4) != 0)
    v7 = *(float *)(*(_QWORD *)&val + 4 * v6);
  else
    v7 = (float)(*(float *)(*(_QWORD *)&val + 4 * v6 - 4) + *(float *)(*(_QWORD *)&val + 4 * v6)) * 0.5;
  if (*(_QWORD *)&val == v3)
  {
    v11 = 0.0;
    v8 = 0.0;
  }
  else
  {
    v8 = 0.0;
    v9 = self->_timeOfLastPDRUpdate.var0.__val_;
    do
    {
      v10 = **(float **)&v9;
      *(_QWORD *)&v9 += 4;
      v8 = v8 + v10;
    }
    while (*(_QWORD *)&v9 != v3);
    v11 = 0.0;
    v12 = self->_timeOfLastPDRUpdate.var0.__val_;
    do
    {
      v13 = **(float **)&v12;
      *(_QWORD *)&v12 += 4;
      v11 = v11 + (float)(v13 * v13);
    }
    while (*(_QWORD *)&v12 != v3);
  }
  v14 = *(float *)(*(_QWORD *)&val + 4 * (int)((double)v5 * 0.95));
  v15 = qword_10085F520;
  if (os_log_type_enabled((os_log_t)qword_10085F520, OS_LOG_TYPE_DEFAULT))
  {
    v16 = v8 / (float)v5;
    v17 = 134218752;
    v18 = v16;
    v19 = 2048;
    v20 = sqrt(v11 / (double)v5 - (float)(v16 * v16));
    v21 = 2048;
    v22 = v7;
    v23 = 2048;
    v24 = v14;
    _os_log_impl((void *)&_mh_execute_header, v15, OS_LOG_TYPE_DEFAULT, "#ni-ca,DoT error, mean: %f, std: %f, median: %f, 95th: %f", (uint8_t *)&v17, 0x2Au);
  }
}

- (void)_submitFindingSessionEndStats
{
  id v3;
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
  id v15;
  NSObject *v16;
  NSString *bundleIdentifier;
  void *v18;
  id v19;
  _QWORD v20[4];
  id v21;
  uint8_t buf[4];
  NSString *v23;
  __int16 v24;
  const __CFString *v25;
  __int16 v26;
  void *v27;

  v3 = objc_alloc_init((Class)NSMutableDictionary);
  v4 = (void *)objc_claimAutoreleasedReturnValue(+[NSNumber numberWithDouble:](NSNumber, "numberWithDouble:", self->_m2));
  objc_msgSend(v3, "setObject:forKey:", v4, CFSTR("FirstDistance"));

  v5 = (void *)objc_claimAutoreleasedReturnValue(+[NSNumber numberWithDouble:](NSNumber, "numberWithDouble:", self->_firstNBRSSI));
  objc_msgSend(v3, "setObject:forKey:", v5, CFSTR("LastDistance"));

  v6 = (void *)objc_claimAutoreleasedReturnValue(+[NSNumber numberWithDouble:](NSNumber, "numberWithDouble:", *(double *)&self->_acquisitionReason));
  objc_msgSend(v3, "setObject:forKey:", v6, CFSTR("FirstNBRSSI"));

  v7 = (void *)objc_claimAutoreleasedReturnValue(+[NSNumber numberWithDouble:](NSNumber, "numberWithDouble:", self->_firstUWBRSSI));
  objc_msgSend(v3, "setObject:forKey:", v7, CFSTR("LastNBRSSI"));

  v8 = (void *)objc_claimAutoreleasedReturnValue(+[NSNumber numberWithDouble:](NSNumber, "numberWithDouble:", self->_maxUWBRSSI));
  objc_msgSend(v3, "setObject:forKey:", v8, CFSTR("MinNBRSSI"));

  v9 = (void *)objc_claimAutoreleasedReturnValue(+[NSNumber numberWithDouble:](NSNumber, "numberWithDouble:", self->_lastUWBRSSI));
  objc_msgSend(v3, "setObject:forKey:", v9, CFSTR("MaxNBRSSI"));

  v10 = (void *)objc_claimAutoreleasedReturnValue(+[NSNumber numberWithDouble:](NSNumber, "numberWithDouble:", self->_firstDistance_finding));
  objc_msgSend(v3, "setObject:forKey:", v10, CFSTR("FirstUWBRSSI"));

  v11 = (void *)objc_claimAutoreleasedReturnValue(+[NSNumber numberWithDouble:](NSNumber, "numberWithDouble:", self->_lastDistance_finding));
  objc_msgSend(v3, "setObject:forKey:", v11, CFSTR("LastUWBRSSI"));

  v12 = (void *)objc_claimAutoreleasedReturnValue(+[NSNumber numberWithDouble:](NSNumber, "numberWithDouble:", self->_minDistance_finding));
  objc_msgSend(v3, "setObject:forKey:", v12, CFSTR("MinUWBRSSI"));

  v13 = (void *)objc_claimAutoreleasedReturnValue(+[NSNumber numberWithDouble:](NSNumber, "numberWithDouble:", self->_maxDistance_finding));
  objc_msgSend(v3, "setObject:forKey:", v13, CFSTR("MaxUWBRSSI"));

  if (LODWORD(self->_lifecycleTimeoutType) == 4)
    v14 = (void *)objc_claimAutoreleasedReturnValue(+[NSNumber numberWithInt:](NSNumber, "numberWithInt:", 1));
  else
    v14 = (void *)objc_claimAutoreleasedReturnValue(+[NSNumber numberWithInt:](NSNumber, "numberWithInt:", 2));
  objc_msgSend(v3, "setObject:forKey:", v14, CFSTR("RangingRole"));

  v15 = objc_msgSend(v3, "mutableCopy");
  v16 = (id)qword_10085F520;
  if (os_log_type_enabled(v16, OS_LOG_TYPE_INFO))
  {
    bundleIdentifier = self->_bundleIdentifier;
    v18 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v15, "description"));
    *(_DWORD *)buf = 138412802;
    v23 = bundleIdentifier;
    v24 = 2112;
    v25 = CFSTR("com.apple.nearbyinteraction.findingsession.end");
    v26 = 2112;
    v27 = v18;
    _os_log_impl((void *)&_mh_execute_header, v16, OS_LOG_TYPE_INFO, "#ni-ca,[%@] send analytics event %@:\n%@\n", buf, 0x20u);

  }
  v20[0] = _NSConcreteStackBlock;
  v20[1] = 3221225472;
  v20[2] = sub_100036698;
  v20[3] = &unk_1007FA568;
  v19 = v15;
  v21 = v19;
  AnalyticsSendEventLazy(CFSTR("com.apple.nearbyinteraction.findingsession.end"), v20);

}

- (void)_sessionStoppedWithTimestamp:(double)a3
{
  int64_t var0;
  double v6;
  uint64_t v7;
  double timeAtLastLocationUpdate;
  double pdrTimeAtFirstPDRUpdate;
  double timeFindeeWasWalkingOrUnknown;
  NSString **p_lifecycleTimeoutType;
  _QWORD *v12;
  unsigned __int8 *v13;
  id v14;
  void *v15;
  void *v16;
  void *v17;
  void *v18;
  void *v19;
  const __CFString *v20;
  NSObject *v21;
  NSString *bundleIdentifier;
  const char *v23;
  NSString *v24;
  NSString *v25;
  void *v26;
  void *v27;
  void *v28;
  void *v29;
  void *v30;
  NSObject *v31;
  NSString *v32;
  id v33;
  id v34;
  id v35;
  int v36;
  const __CFString *v37;
  void *v38;
  void *v39;
  void *v40;
  void *v41;
  void *v42;
  void *v43;
  void *v44;
  void *v45;
  void *v46;
  void *v47;
  id v48;
  NSObject *v49;
  NSString *v50;
  id v51;
  id v52;
  int v53;
  NSObject *v54;
  int timeLocationFromWiFi_high;
  float v56;
  int timeLocationFromWiFi_low;
  void *v58;
  int timeLocationFromWiFi2_low;
  float v60;
  int v61;
  void *v62;
  int numberOfBoundedDisplacementFromPeerData;
  float v64;
  int v65;
  void *v66;
  int numberOfPeerData;
  float v68;
  int v69;
  void *v70;
  int timeLocationFromWiFi2_high;
  float v72;
  int v73;
  void *v74;
  int numberOfLocationFromPeerData;
  float v76;
  int v77;
  void *v78;
  int numberOfPDRFromPeerData;
  float v80;
  int v81;
  void *v82;
  int numberOfDeltaVelocityFromPeerData;
  float v84;
  int v85;
  void *v86;
  double v87;
  double v88;
  float v89;
  float v90;
  float v91;
  void *v92;
  double timeAtFirstLocationUpdate;
  BOOL v94;
  float v95;
  float v96;
  float v97;
  void *v98;
  double timeLocationFromAccessory;
  BOOL v100;
  float v101;
  float v102;
  float v103;
  void *v104;
  double timeLocationFromCell;
  BOOL v106;
  float v107;
  float v108;
  float v109;
  void *v110;
  double timeLocationFromCompensated;
  BOOL v112;
  float v113;
  float v114;
  float v115;
  void *v116;
  double v117;
  BOOL v118;
  float v119;
  float v120;
  float v121;
  void *v122;
  double timeLocationFromGPS;
  BOOL v124;
  float v125;
  float v126;
  float v127;
  void *v128;
  double timeLocationFromGPSCoarse;
  BOOL v130;
  float v131;
  float v132;
  float v133;
  void *v134;
  double timeLocationFromLAC;
  BOOL v136;
  float v137;
  float v138;
  float v139;
  void *v140;
  double timeLocationFromLOIOverride;
  BOOL v142;
  float v143;
  float v144;
  float v145;
  void *v146;
  double timeLocationFromMCC;
  BOOL v148;
  float v149;
  float v150;
  float v151;
  void *v152;
  double timeLocationFromPipeline;
  BOOL v154;
  float v155;
  float v156;
  float v157;
  void *v158;
  double timeLocationFromUnknown;
  BOOL v160;
  float v161;
  float v162;
  float v163;
  void *v164;
  double distanceTraveledFromPDR;
  float v166;
  float v167;
  float v168;
  void *v169;
  void *v170;
  void *v171;
  void *v172;
  void *v173;
  void *v174;
  unsigned int numberOfSlowlyMoving;
  uint64_t v176;
  void *v177;
  unsigned int numberOfVIOFromPeerData;
  uint64_t v179;
  void *v180;
  int v181;
  float v182;
  int v183;
  void *v184;
  void *v185;
  id v186;
  NSObject *v187;
  NSString *v188;
  id v189;
  id v190;
  NSObject *v191;
  double v192;
  double v193;
  void *v194;
  void *v195;
  void *v196;
  void *v197;
  void *v198;
  void *v199;
  void *v200;
  void *v201;
  void *v202;
  void *v203;
  void *v204;
  void *v205;
  void *v206;
  void *v207;
  void *v208;
  void *v209;
  void *v210;
  void *v211;
  int firstArrowAlgorithmSource;
  float v213;
  int firstOutputRangeAlgorithmSource;
  void *v215;
  unsigned int timeAtEndOfSession_high;
  uint64_t v217;
  void *v218;
  unsigned int armsReachAlgorithmSource;
  uint64_t v220;
  void *v221;
  int numberOfArrowRevokes;
  float v223;
  int numberOfArrowAvailabilityAfterFirstArrow;
  void *v225;
  void *v226;
  void *v227;
  void *v228;
  void *v229;
  void *v230;
  void *v231;
  void *v232;
  void *v233;
  void *v234;
  NSObject *v235;
  void *v236;
  void *v237;
  void *v238;
  void *v239;
  void *v240;
  void *v241;
  void *v242;
  void *v243;
  void *v244;
  void *v245;
  void *v246;
  void *v247;
  void *v248;
  void *v249;
  void *v250;
  void *v251;
  NSObject *v252;
  uint64_t v253;
  uint64_t v254;
  const __CFString *v255;
  double val;
  double v257;
  double vioAvailableTime;
  double ioSourceTime;
  double v260;
  double v261;
  double v262;
  double v263;
  double v264;
  NSObject *v265;
  void *v266;
  void *v267;
  void *v268;
  void *v269;
  float *value;
  float *end;
  NSObject *v272;
  void *v273;
  void *v274;
  void *v275;
  void *v276;
  void *v277;
  float *v278;
  float *v279;
  NSObject *v280;
  void *v281;
  void *v282;
  void *v283;
  void *v284;
  void *v285;
  uint64_t v286;
  double v287;
  NSObject *v288;
  void *v289;
  void *v290;
  void *v291;
  void *v292;
  void *v293;
  void *v294;
  id v295;
  NSObject *v296;
  NSString *v297;
  id v298;
  id v299;
  id v300;
  _QWORD v301[4];
  id v302;
  void *v303;
  void *v304;
  uint64_t v305;
  void *v306;
  void *v307;
  uint64_t v308;
  void *__p;
  void *v310;
  uint64_t v311;
  __int128 v312;
  __int128 v313;
  unint64_t v314;
  _QWORD v315[4];
  id v316;
  _QWORD v317[4];
  id v318;
  _QWORD v319[4];
  id v320;
  _BYTE buf[12];
  __int16 v322;
  const __CFString *v323;
  __int16 v324;
  double v325;
  __int16 v326;
  double v327;
  __int16 v328;
  unint64_t v329;

  if (!LOBYTE(self->_bundleIdAsStdString.__r_.var0))
  {
    v21 = qword_10085F520;
    if (!os_log_type_enabled((os_log_t)qword_10085F520, OS_LOG_TYPE_INFO))
      return;
    bundleIdentifier = self->_bundleIdentifier;
    *(_DWORD *)buf = 138412290;
    *(_QWORD *)&buf[4] = bundleIdentifier;
    v23 = "#ni-ca,[%@] Session already stopped. Ignore duplicate call.";
    goto LABEL_20;
  }
  LOBYTE(self->_bundleIdAsStdString.__r_.var0) = 0;
  var0 = self->_bundleIdAsStdString.var0;
  v6 = a3 - self->_runTimestamp;
  v7 = 72;
  if (!self->_isRunning)
    v7 = 80;
  *(double *)((char *)&self->super.isa + v7) = *(double *)((char *)&self->super.isa + v7) + v6;
  timeAtLastLocationUpdate = self->_timeAtLastLocationUpdate;
  pdrTimeAtFirstPDRUpdate = self->_pdrTimeAtFirstPDRUpdate;
  timeFindeeWasWalkingOrUnknown = self->_timeFindeeWasWalkingOrUnknown;
  self->_timeFindeeWasStatic = a3 - *(double *)&self->_numberOfWalkingOrkUnknown;
  std::mutex::lock(&stru_100850D30);
  --byte_100853B78;
  p_lifecycleTimeoutType = &self->_lifecycleTimeoutType;
  *(_QWORD *)buf = &self->_lifecycleTimeoutType;
  v12 = sub_10003A568((uint64_t)&xmmword_100853B28, (int *)&self->_lifecycleTimeoutType, (uint64_t)&unk_100472CF8, (_DWORD **)buf);
  --*((_BYTE *)v12 + 20);
  if (self->_bundleIdentifier)
  {
    if (*((char *)&self->_bundleIdAsStdString.__r_.__value_.var0.var1 + 23) < 0)
    {
      if (self->_bundleIdAsStdString.__r_.__value_.var0.var1.__size_)
        goto LABEL_7;
    }
    else if (*((_BYTE *)&self->_bundleIdAsStdString.__r_.__value_.var0.var1 + 23))
    {
LABEL_7:
      *(_QWORD *)buf = &self->_bundleIdAsStdString;
      v13 = sub_10003A788((uint64_t)&xmmword_100853B50, (unsigned __int8 *)&self->_bundleIdAsStdString, (uint64_t)&unk_100472CF8, (__int128 **)buf);
      --v13[40];
      goto LABEL_8;
    }
    __assert_rtn("-[NIServerAnalyticsManager _sessionStoppedWithTimestamp:]", "NIServerAnalyticsManager.mm", 2075, "!_bundleIdAsStdString.empty()");
  }
LABEL_8:
  std::mutex::unlock(&stru_100850D30);
  if (!self->_bundleIdentifier)
  {
    v21 = qword_10085F520;
    if (!os_log_type_enabled((os_log_t)qword_10085F520, OS_LOG_TYPE_INFO))
      return;
    v24 = self->_bundleIdentifier;
    *(_DWORD *)buf = 138412290;
    *(_QWORD *)&buf[4] = v24;
    v23 = "#ni-ca,[%@] Not logging summary event without bundle identifier.";
    goto LABEL_20;
  }
  if (!*(_DWORD *)p_lifecycleTimeoutType)
  {
    v21 = qword_10085F520;
    if (!os_log_type_enabled((os_log_t)qword_10085F520, OS_LOG_TYPE_INFO))
      return;
    v25 = self->_bundleIdentifier;
    *(_DWORD *)buf = 138412290;
    *(_QWORD *)&buf[4] = v25;
    v23 = "#ni-ca,[%@] Not logging summary event for unspecified session types.";
LABEL_20:
    _os_log_impl((void *)&_mh_execute_header, v21, OS_LOG_TYPE_INFO, v23, buf, 0xCu);
    return;
  }
  v14 = objc_alloc_init((Class)NSMutableDictionary);
  objc_msgSend(v14, "setObject:forKey:", self->_bundleIdentifier, CFSTR("appBundleID"));
  v15 = (void *)objc_claimAutoreleasedReturnValue(+[NSNumber numberWithDouble:](NSNumber, "numberWithDouble:", a3 - *(double *)&var0));
  objc_msgSend(v14, "setObject:forKey:", v15, CFSTR("totalDuration"));

  v16 = (void *)objc_claimAutoreleasedReturnValue(+[NSNumber numberWithDouble:](NSNumber, "numberWithDouble:", self->_visibilityUpdateTimestamp));
  objc_msgSend(v14, "setObject:forKey:", v16, CFSTR("backgroundDuration"));

  v17 = (void *)objc_claimAutoreleasedReturnValue(+[NSNumber numberWithInt:](NSNumber, "numberWithInt:", 1));
  objc_msgSend(v14, "setObject:forKey:", v17, CFSTR("sessionCount"));

  v18 = (void *)objc_claimAutoreleasedReturnValue(+[NSNumber numberWithInt:](NSNumber, "numberWithInt:", LODWORD(self->_backgroundContinuationTimeoutType)));
  objc_msgSend(v14, "setObject:forKey:", v18, CFSTR("configuredBackgroundMode"));

  objc_msgSend(v14, "setObject:forKey:", *(_QWORD *)&self->_maxDistance, CFSTR("lifecycleTimeout"));
  v19 = (void *)objc_claimAutoreleasedReturnValue(+[NSNumber numberWithBool:](NSNumber, "numberWithBool:", LOBYTE(self->_sessionType)));
  objc_msgSend(v14, "setObject:forKey:", v19, CFSTR("isCameraAssistanceEnabled"));

  v20 = CFSTR("Accessory");
  switch(*(_DWORD *)p_lifecycleTimeoutType)
  {
    case 0:
      __assert_rtn("-[NIServerAnalyticsManager _sessionStoppedWithTimestamp:]", "NIServerAnalyticsManager.mm", 2118, "false");
    case 1:
      v20 = CFSTR("Peer");
      goto LABEL_23;
    case 2:
      goto LABEL_23;
    case 3:
      v20 = CFSTR("Findee");
      goto LABEL_23;
    case 4:
      v20 = CFSTR("Finder");
LABEL_23:
      objc_msgSend(v14, "setObject:forKey:", v20, CFSTR("configType"));
      break;
    default:
      break;
  }
  if (BYTE1(self->_sessionType))
  {
    v26 = (void *)objc_claimAutoreleasedReturnValue(+[NSNumber numberWithInt:](NSNumber, "numberWithInt:", BYTE2(self->_sessionType)));
    objc_msgSend(v14, "setObject:forKey:", v26, CFSTR("configuredAccessoryDataRate"));

  }
  if (LOBYTE(self->_timeSpentVisible))
  {
    v27 = (void *)objc_claimAutoreleasedReturnValue(+[NSNumber numberWithDouble:](NSNumber, "numberWithDouble:", v20, self->_timeSpentNotVisible));
    objc_msgSend(v14, "setObject:forKey:", v27, CFSTR("firstDistance"));

    v28 = (void *)objc_claimAutoreleasedReturnValue(+[NSNumber numberWithDouble:](NSNumber, "numberWithDouble:", *(double *)&self->_receivedDistance));
    objc_msgSend(v14, "setObject:forKey:", v28, CFSTR("lastDistance"));

    v29 = (void *)objc_claimAutoreleasedReturnValue(+[NSNumber numberWithDouble:](NSNumber, "numberWithDouble:", self->_lastDistance));
    objc_msgSend(v14, "setObject:forKey:", v29, CFSTR("minDistance"));

    v30 = (void *)objc_claimAutoreleasedReturnValue(+[NSNumber numberWithDouble:](NSNumber, "numberWithDouble:", self->_firstDistance));
    objc_msgSend(v14, "setObject:forKey:", v30, CFSTR("maxDistance"));

  }
  if (self->_backgroundContinuationTimeoutType == (NSString *)1)
    objc_msgSend(v14, "setObject:forKey:", *(_QWORD *)&self->_minDistance, CFSTR("sessionContinuationTimeout"));
  v300 = objc_msgSend(v14, "mutableCopy");
  v31 = (id)qword_10085F520;
  if (os_log_type_enabled(v31, OS_LOG_TYPE_INFO))
  {
    v32 = self->_bundleIdentifier;
    v33 = (id)objc_claimAutoreleasedReturnValue(objc_msgSend(v300, "description"));
    *(_DWORD *)buf = 138412802;
    *(_QWORD *)&buf[4] = v32;
    v322 = 2112;
    v323 = CFSTR("com.apple.nearbyinteraction.sessionV2.summary");
    v324 = 2112;
    v325 = *(double *)&v33;
    _os_log_impl((void *)&_mh_execute_header, v31, OS_LOG_TYPE_INFO, "#ni-ca,[%@] send analytics event %@:\n%@\n", buf, 0x20u);

  }
  v319[0] = _NSConcreteStackBlock;
  v319[1] = 3221225472;
  v319[2] = sub_1000394F4;
  v319[3] = &unk_1007FA568;
  v34 = v300;
  v320 = v34;
  AnalyticsSendEventLazy(CFSTR("com.apple.nearbyinteraction.sessionV2.summary"), v319);
  if (!LOBYTE(self->_sessionType))
    goto LABEL_43;
  v35 = objc_alloc_init((Class)NSMutableDictionary);
  objc_msgSend(v35, "setObject:forKey:", self->_bundleIdentifier, CFSTR("appBundleID"));
  v36 = *(_DWORD *)p_lifecycleTimeoutType;
  if (*(_DWORD *)p_lifecycleTimeoutType == 1)
  {
    v37 = CFSTR("Peer");
  }
  else
  {
    if (v36 != 2)
    {
      if (!v36)
        __assert_rtn("-[NIServerAnalyticsManager _sessionStoppedWithTimestamp:]", "NIServerAnalyticsManager.mm", 2163, "false");
      goto LABEL_40;
    }
    v37 = CFSTR("Accessory");
  }
  objc_msgSend(v35, "setObject:forKey:", v37, CFSTR("configType"));
LABEL_40:
  v38 = (void *)objc_claimAutoreleasedReturnValue(+[NSNumber numberWithDouble:](NSNumber, "numberWithDouble:", *(double *)&self->_lastVIOPosition[14]));
  objc_msgSend(v35, "setObject:forKey:", v38, CFSTR("DistanceMovedToHorizontalConvergence"));

  v39 = (void *)objc_claimAutoreleasedReturnValue(+[NSNumber numberWithDouble:](NSNumber, "numberWithDouble:", self->_firstRangeMeasurementTime));
  objc_msgSend(v35, "setObject:forKey:", v39, CFSTR("DistanceMovedToVerticalConvergence"));

  v40 = (void *)objc_claimAutoreleasedReturnValue(+[NSNumber numberWithInt:](NSNumber, "numberWithInt:", LODWORD(self->_timeToHorizontalConvergence)));
  objc_msgSend(v35, "setObject:forKey:", v40, CFSTR("NumberOfInvalidPoseEvents"));

  v41 = (void *)objc_claimAutoreleasedReturnValue(+[NSNumber numberWithInt:](NSNumber, "numberWithInt:", LODWORD(self->_timeToVerticalConvergence)));
  objc_msgSend(v35, "setObject:forKey:", v41, CFSTR("NumberOfLostConvergence"));

  v42 = (void *)objc_claimAutoreleasedReturnValue(+[NSNumber numberWithInt:](NSNumber, "numberWithInt:", HIDWORD(self->_timeToHorizontalConvergence)));
  objc_msgSend(v35, "setObject:forKey:", v42, CFSTR("NumberOfLostHorizontalConvergence"));

  v43 = (void *)objc_claimAutoreleasedReturnValue(+[NSNumber numberWithDouble:](NSNumber, "numberWithDouble:", self->_distanceMovedToVerticalConvergence));
  objc_msgSend(v35, "setObject:forKey:", v43, CFSTR("RangeAtHorizontalConvergence"));

  v44 = (void *)objc_claimAutoreleasedReturnValue(+[NSNumber numberWithDouble:](NSNumber, "numberWithDouble:", self->_totalDistanceMoved));
  objc_msgSend(v35, "setObject:forKey:", v44, CFSTR("RangeAtVerticalConvergence"));

  v45 = (void *)objc_claimAutoreleasedReturnValue(+[NSNumber numberWithDouble:](NSNumber, "numberWithDouble:", self->_rangeAtHorizontalConvergence));
  objc_msgSend(v35, "setObject:forKey:", v45, CFSTR("TimeToHorizontalConvergence"));

  v46 = (void *)objc_claimAutoreleasedReturnValue(+[NSNumber numberWithDouble:](NSNumber, "numberWithDouble:", self->_rangeAtVerticalConvergence));
  objc_msgSend(v35, "setObject:forKey:", v46, CFSTR("TimeToVerticalConvergence"));

  v47 = (void *)objc_claimAutoreleasedReturnValue(+[NSNumber numberWithDouble:](NSNumber, "numberWithDouble:", self->_distanceMovedToHorizontalConvergence));
  objc_msgSend(v35, "setObject:forKey:", v47, CFSTR("TotalDistanceMoved"));

  v48 = objc_msgSend(v35, "mutableCopy");
  v49 = (id)qword_10085F520;
  if (os_log_type_enabled(v49, OS_LOG_TYPE_INFO))
  {
    v50 = self->_bundleIdentifier;
    v51 = (id)objc_claimAutoreleasedReturnValue(objc_msgSend(v48, "description"));
    *(_DWORD *)buf = 138412802;
    *(_QWORD *)&buf[4] = v50;
    v322 = 2112;
    v323 = CFSTR("com.apple.nearbyinteraction.camereEnabledSession.summary");
    v324 = 2112;
    v325 = *(double *)&v51;
    _os_log_impl((void *)&_mh_execute_header, v49, OS_LOG_TYPE_INFO, "#ni-ca,[%@] send analytics event %@:\n%@\n", buf, 0x20u);

  }
  v317[0] = _NSConcreteStackBlock;
  v317[1] = 3221225472;
  v317[2] = sub_1000394FC;
  v317[3] = &unk_1007FA568;
  v52 = v48;
  v318 = v52;
  AnalyticsSendEventLazy(CFSTR("com.apple.nearbyinteraction.camereEnabledSession.summary"), v317);

LABEL_43:
  v53 = *(_DWORD *)p_lifecycleTimeoutType;
  if (*(_DWORD *)p_lifecycleTimeoutType == 3)
  {
    if (LODWORD(self->_timeLocationFromWiFi) == -1)
    {
      v54 = (id)qword_10085F520;
      if (os_log_type_enabled(v54, OS_LOG_TYPE_INFO))
      {
        *(_WORD *)buf = 0;
        _os_log_impl((void *)&_mh_execute_header, v54, OS_LOG_TYPE_INFO, "#ni-ca,Dummy findee CA event", buf, 2u);
      }
    }
    else
    {
      -[NIServerAnalyticsManager _submitFindingSessionEndStats](self, "_submitFindingSessionEndStats");
      v54 = objc_alloc_init((Class)NSMutableDictionary);
      -[NSObject setObject:forKey:](v54, "setObject:forKey:", self->_bundleIdentifier, CFSTR("appBundleID"));
      timeLocationFromWiFi_high = HIDWORD(self->_timeLocationFromWiFi);
      v56 = 0.0;
      if (timeLocationFromWiFi_high != -1)
      {
        timeLocationFromWiFi_low = LODWORD(self->_timeLocationFromWiFi);
        if (timeLocationFromWiFi_low)
          v56 = (float)timeLocationFromWiFi_high / (float)timeLocationFromWiFi_low;
      }
      v58 = (void *)objc_claimAutoreleasedReturnValue(+[NSNumber numberWithDouble:](NSNumber, "numberWithDouble:", v56));
      -[NSObject setObject:forKey:](v54, "setObject:forKey:", v58, CFSTR("SessionWithBoundedDisplacement_percentage"));

      timeLocationFromWiFi2_low = LODWORD(self->_timeLocationFromWiFi2);
      v60 = 0.0;
      if (timeLocationFromWiFi2_low != -1)
      {
        v61 = LODWORD(self->_timeLocationFromWiFi);
        if (v61)
          v60 = (float)timeLocationFromWiFi2_low / (float)v61;
      }
      v62 = (void *)objc_claimAutoreleasedReturnValue(+[NSNumber numberWithDouble:](NSNumber, "numberWithDouble:", v60));
      -[NSObject setObject:forKey:](v54, "setObject:forKey:", v62, CFSTR("SessionWithDeltaPositionPDR_percentage"));

      numberOfBoundedDisplacementFromPeerData = self->_numberOfBoundedDisplacementFromPeerData;
      v64 = 0.0;
      if (numberOfBoundedDisplacementFromPeerData != -1)
      {
        v65 = LODWORD(self->_timeLocationFromWiFi);
        if (v65)
          v64 = (float)numberOfBoundedDisplacementFromPeerData / (float)v65;
      }
      v66 = (void *)objc_claimAutoreleasedReturnValue(+[NSNumber numberWithDouble:](NSNumber, "numberWithDouble:", v64));
      -[NSObject setObject:forKey:](v54, "setObject:forKey:", v66, CFSTR("SessionWithVIO_percentage"));

      numberOfPeerData = self->_numberOfPeerData;
      v68 = 0.0;
      if (numberOfPeerData != -1)
      {
        v69 = LODWORD(self->_timeLocationFromWiFi);
        if (v69)
          v68 = (float)numberOfPeerData / (float)v69;
      }
      v70 = (void *)objc_claimAutoreleasedReturnValue(+[NSNumber numberWithDouble:](NSNumber, "numberWithDouble:", v68));
      -[NSObject setObject:forKey:](v54, "setObject:forKey:", v70, CFSTR("SessionWithDeltaVelocity_percentage"));

      timeLocationFromWiFi2_high = HIDWORD(self->_timeLocationFromWiFi2);
      v72 = 0.0;
      if (timeLocationFromWiFi2_high != -1)
      {
        v73 = LODWORD(self->_timeLocationFromWiFi);
        if (v73)
          v72 = (float)timeLocationFromWiFi2_high / (float)v73;
      }
      v74 = (void *)objc_claimAutoreleasedReturnValue(+[NSNumber numberWithDouble:](NSNumber, "numberWithDouble:", v72));
      -[NSObject setObject:forKey:](v54, "setObject:forKey:", v74, CFSTR("SessionWithLocation_percentage"));

      numberOfLocationFromPeerData = self->_numberOfLocationFromPeerData;
      v76 = 0.0;
      if (numberOfLocationFromPeerData != -1)
      {
        v77 = HIDWORD(self->_timeLocationFromWiFi);
        if (v77)
          v76 = (float)numberOfLocationFromPeerData / (float)v77;
      }
      v78 = (void *)objc_claimAutoreleasedReturnValue(+[NSNumber numberWithDouble:](NSNumber, "numberWithDouble:", v76));
      -[NSObject setObject:forKey:](v54, "setObject:forKey:", v78, CFSTR("Findee_Static_percentage"));

      numberOfPDRFromPeerData = self->_numberOfPDRFromPeerData;
      v80 = 0.0;
      if (numberOfPDRFromPeerData != -1)
      {
        v81 = HIDWORD(self->_timeLocationFromWiFi);
        if (v81)
          v80 = (float)numberOfPDRFromPeerData / (float)v81;
      }
      v82 = (void *)objc_claimAutoreleasedReturnValue(+[NSNumber numberWithDouble:](NSNumber, "numberWithDouble:", v80));
      -[NSObject setObject:forKey:](v54, "setObject:forKey:", v82, CFSTR("Findee_SlowlyMoving_percentage"));

      numberOfDeltaVelocityFromPeerData = self->_numberOfDeltaVelocityFromPeerData;
      v84 = 0.0;
      if (numberOfDeltaVelocityFromPeerData != -1)
      {
        v85 = HIDWORD(self->_timeLocationFromWiFi);
        if (v85)
          v84 = (float)numberOfDeltaVelocityFromPeerData / (float)v85;
      }
      v86 = (void *)objc_claimAutoreleasedReturnValue(+[NSNumber numberWithDouble:](NSNumber, "numberWithDouble:", v84));
      -[NSObject setObject:forKey:](v54, "setObject:forKey:", v86, CFSTR("Findee_WalkingOrUnknown_percentage"));

      if (self->_timeAtLastLocationUpdate != -1.0)
      {
        v87 = a3 - timeAtLastLocationUpdate;
        v88 = *(double *)&self->_lastLocationType;
        v89 = 0.0;
        if (v88 != -1.0 && v87 != 0.0)
        {
          v90 = v88;
          v91 = v87;
          v89 = v90 / v91;
        }
        v92 = (void *)objc_claimAutoreleasedReturnValue(+[NSNumber numberWithDouble:](NSNumber, "numberWithDouble:", v89));
        -[NSObject setObject:forKey:](v54, "setObject:forKey:", v92, CFSTR("LocationFromAccessory_percentage"));

        timeAtFirstLocationUpdate = self->_timeAtFirstLocationUpdate;
        v94 = timeAtFirstLocationUpdate == -1.0 || v87 == 0.0;
        v95 = 0.0;
        if (!v94)
        {
          v96 = timeAtFirstLocationUpdate;
          v97 = v87;
          v95 = v96 / v97;
        }
        v98 = (void *)objc_claimAutoreleasedReturnValue(+[NSNumber numberWithDouble:](NSNumber, "numberWithDouble:", v95));
        -[NSObject setObject:forKey:](v54, "setObject:forKey:", v98, CFSTR("LocationFromCell_percentage"));

        timeLocationFromAccessory = self->_timeLocationFromAccessory;
        v100 = timeLocationFromAccessory == -1.0 || v87 == 0.0;
        v101 = 0.0;
        if (!v100)
        {
          v102 = timeLocationFromAccessory;
          v103 = v87;
          v101 = v102 / v103;
        }
        v104 = (void *)objc_claimAutoreleasedReturnValue(+[NSNumber numberWithDouble:](NSNumber, "numberWithDouble:", v101));
        -[NSObject setObject:forKey:](v54, "setObject:forKey:", v104, CFSTR("LocationFromCompensated_percentage"));

        timeLocationFromCell = self->_timeLocationFromCell;
        v106 = timeLocationFromCell == -1.0 || v87 == 0.0;
        v107 = 0.0;
        if (!v106)
        {
          v108 = timeLocationFromCell;
          v109 = v87;
          v107 = v108 / v109;
        }
        v110 = (void *)objc_claimAutoreleasedReturnValue(+[NSNumber numberWithDouble:](NSNumber, "numberWithDouble:", v107));
        -[NSObject setObject:forKey:](v54, "setObject:forKey:", v110, CFSTR("LocationFromGPS_percentage"));

        timeLocationFromCompensated = self->_timeLocationFromCompensated;
        v112 = timeLocationFromCompensated == -1.0 || v87 == 0.0;
        v113 = 0.0;
        if (!v112)
        {
          v114 = timeLocationFromCompensated;
          v115 = v87;
          v113 = v114 / v115;
        }
        v116 = (void *)objc_claimAutoreleasedReturnValue(+[NSNumber numberWithDouble:](NSNumber, "numberWithDouble:", v113));
        -[NSObject setObject:forKey:](v54, "setObject:forKey:", v116, CFSTR("LocationFromGPSCoarse_percentage"));

        v117 = self->_timeAtFirstLocationUpdate;
        v118 = v117 == -1.0 || v87 == 0.0;
        v119 = 0.0;
        if (!v118)
        {
          v120 = v117;
          v121 = v87;
          v119 = v120 / v121;
        }
        v122 = (void *)objc_claimAutoreleasedReturnValue(+[NSNumber numberWithDouble:](NSNumber, "numberWithDouble:", v119));
        -[NSObject setObject:forKey:](v54, "setObject:forKey:", v122, CFSTR("LocationFromCell_percentage"));

        timeLocationFromGPS = self->_timeLocationFromGPS;
        v124 = timeLocationFromGPS == -1.0 || v87 == 0.0;
        v125 = 0.0;
        if (!v124)
        {
          v126 = timeLocationFromGPS;
          v127 = v87;
          v125 = v126 / v127;
        }
        v128 = (void *)objc_claimAutoreleasedReturnValue(+[NSNumber numberWithDouble:](NSNumber, "numberWithDouble:", v125));
        -[NSObject setObject:forKey:](v54, "setObject:forKey:", v128, CFSTR("LocationFromLAC_percentage"));

        timeLocationFromGPSCoarse = self->_timeLocationFromGPSCoarse;
        v130 = timeLocationFromGPSCoarse == -1.0 || v87 == 0.0;
        v131 = 0.0;
        if (!v130)
        {
          v132 = timeLocationFromGPSCoarse;
          v133 = v87;
          v131 = v132 / v133;
        }
        v134 = (void *)objc_claimAutoreleasedReturnValue(+[NSNumber numberWithDouble:](NSNumber, "numberWithDouble:", v131));
        -[NSObject setObject:forKey:](v54, "setObject:forKey:", v134, CFSTR("LocationFromLOIOverride_percentage"));

        timeLocationFromLAC = self->_timeLocationFromLAC;
        v136 = timeLocationFromLAC == -1.0 || v87 == 0.0;
        v137 = 0.0;
        if (!v136)
        {
          v138 = timeLocationFromLAC;
          v139 = v87;
          v137 = v138 / v139;
        }
        v140 = (void *)objc_claimAutoreleasedReturnValue(+[NSNumber numberWithDouble:](NSNumber, "numberWithDouble:", v137));
        -[NSObject setObject:forKey:](v54, "setObject:forKey:", v140, CFSTR("LocationFromMCC_percentage"));

        timeLocationFromLOIOverride = self->_timeLocationFromLOIOverride;
        v142 = timeLocationFromLOIOverride == -1.0 || v87 == 0.0;
        v143 = 0.0;
        if (!v142)
        {
          v144 = timeLocationFromLOIOverride;
          v145 = v87;
          v143 = v144 / v145;
        }
        v146 = (void *)objc_claimAutoreleasedReturnValue(+[NSNumber numberWithDouble:](NSNumber, "numberWithDouble:", v143));
        -[NSObject setObject:forKey:](v54, "setObject:forKey:", v146, CFSTR("LocationFromPipeline_percentage"));

        timeLocationFromMCC = self->_timeLocationFromMCC;
        v148 = timeLocationFromMCC == -1.0 || v87 == 0.0;
        v149 = 0.0;
        if (!v148)
        {
          v150 = timeLocationFromMCC;
          v151 = v87;
          v149 = v150 / v151;
        }
        v152 = (void *)objc_claimAutoreleasedReturnValue(+[NSNumber numberWithDouble:](NSNumber, "numberWithDouble:", v149));
        -[NSObject setObject:forKey:](v54, "setObject:forKey:", v152, CFSTR("LocationFromUnknown_percentage"));

        timeLocationFromPipeline = self->_timeLocationFromPipeline;
        v154 = timeLocationFromPipeline == -1.0 || v87 == 0.0;
        v155 = 0.0;
        if (!v154)
        {
          v156 = timeLocationFromPipeline;
          v157 = v87;
          v155 = v156 / v157;
        }
        v158 = (void *)objc_claimAutoreleasedReturnValue(+[NSNumber numberWithDouble:](NSNumber, "numberWithDouble:", v155));
        -[NSObject setObject:forKey:](v54, "setObject:forKey:", v158, CFSTR("LocationFromWiFi_percentage"));

        timeLocationFromUnknown = self->_timeLocationFromUnknown;
        v160 = timeLocationFromUnknown == -1.0 || v87 == 0.0;
        v161 = 0.0;
        if (!v160)
        {
          v162 = timeLocationFromUnknown;
          v163 = v87;
          v161 = v162 / v163;
        }
        v164 = (void *)objc_claimAutoreleasedReturnValue(+[NSNumber numberWithDouble:](NSNumber, "numberWithDouble:", v161));
        -[NSObject setObject:forKey:](v54, "setObject:forKey:", v164, CFSTR("LocationFromWiFi2_percentage"));

      }
      if (self->_timeFindeeWasWalkingOrUnknown != -1.0)
      {
        distanceTraveledFromPDR = self->_distanceTraveledFromPDR;
        v166 = 0.0;
        if (distanceTraveledFromPDR != -1.0 && pdrTimeAtFirstPDRUpdate - timeFindeeWasWalkingOrUnknown != 0.0)
        {
          v167 = distanceTraveledFromPDR;
          v168 = pdrTimeAtFirstPDRUpdate - timeFindeeWasWalkingOrUnknown;
          v166 = v167 / v168;
        }
        v169 = (void *)objc_claimAutoreleasedReturnValue(+[NSNumber numberWithDouble:](NSNumber, "numberWithDouble:", v166));
        -[NSObject setObject:forKey:](v54, "setObject:forKey:", v169, CFSTR("PDR_indicates_static_percentage"));

      }
      if (*(double *)&self->_numberOfWalkingOrkUnknown != -1.0)
      {
        v170 = (void *)objc_claimAutoreleasedReturnValue(+[NSNumber numberWithDouble:](NSNumber, "numberWithDouble:", *(double *)&self->_lastMotionCategory));
        -[NSObject setObject:forKey:](v54, "setObject:forKey:", v170, CFSTR("TimeFindeeWasStatic"));

        v171 = (void *)objc_claimAutoreleasedReturnValue(+[NSNumber numberWithDouble:](NSNumber, "numberWithDouble:", self->_timeAtLastBoundedDisplacementUpdate));
        -[NSObject setObject:forKey:](v54, "setObject:forKey:", v171, CFSTR("TimeFindeeWasSlowlyMoving"));

        v172 = (void *)objc_claimAutoreleasedReturnValue(+[NSNumber numberWithDouble:](NSNumber, "numberWithDouble:", self->_timeFindeeWasSlowlyMoving));
        -[NSObject setObject:forKey:](v54, "setObject:forKey:", v172, CFSTR("TimeFindeeWasWalkingOrUnknown"));

        v173 = (void *)objc_claimAutoreleasedReturnValue(+[NSNumber numberWithDouble:](NSNumber, "numberWithDouble:", self->_timeFindeeWasStatic));
        -[NSObject setObject:forKey:](v54, "setObject:forKey:", v173, CFSTR("TimeToSessionEnd"));

      }
      v174 = (void *)objc_claimAutoreleasedReturnValue(+[NSNumber numberWithDouble:](NSNumber, "numberWithDouble:", self->_timeToSessionEnd));
      -[NSObject setObject:forKey:](v54, "setObject:forKey:", v174, CFSTR("DistanceTraveledFromPDR"));

      numberOfSlowlyMoving = self->_numberOfSlowlyMoving;
      if (numberOfSlowlyMoving == -1)
        v176 = 0;
      else
        v176 = numberOfSlowlyMoving;
      v177 = (void *)objc_claimAutoreleasedReturnValue(+[NSNumber numberWithInt:](NSNumber, "numberWithInt:", v176));
      -[NSObject setObject:forKey:](v54, "setObject:forKey:", v177, CFSTR("NumberOfMissedRanges"));

      numberOfVIOFromPeerData = self->_numberOfVIOFromPeerData;
      if (numberOfVIOFromPeerData == -1)
        v179 = 0;
      else
        v179 = numberOfVIOFromPeerData;
      v180 = (void *)objc_claimAutoreleasedReturnValue(+[NSNumber numberWithInt:](NSNumber, "numberWithInt:", v179));
      -[NSObject setObject:forKey:](v54, "setObject:forKey:", v180, CFSTR("NumberOfSuccessfulRanges"));

      v181 = self->_numberOfVIOFromPeerData;
      v182 = 0.0;
      if (v181 != -1)
      {
        v183 = self->_numberOfSlowlyMoving + v181;
        if (v183)
          v182 = (float)v181 / (float)v183;
      }
      v184 = (void *)objc_claimAutoreleasedReturnValue(+[NSNumber numberWithDouble:](NSNumber, "numberWithDouble:", v182));
      -[NSObject setObject:forKey:](v54, "setObject:forKey:", v184, CFSTR("SuccesfulRangesToTotalRangingAttempts_percentage"));

      if (self->_anon_9d8[169])
      {
        v185 = (void *)objc_claimAutoreleasedReturnValue(+[NSNumber numberWithBool:](NSNumber, "numberWithBool:", self->_anon_9d8[168]));
        -[NSObject setObject:forKey:](v54, "setObject:forKey:", v185, CFSTR("FinderIsPhone"));

      }
      v186 = -[NSObject mutableCopy](v54, "mutableCopy");
      v187 = (id)qword_10085F520;
      if (os_log_type_enabled(v187, OS_LOG_TYPE_INFO))
      {
        v188 = self->_bundleIdentifier;
        v189 = (id)objc_claimAutoreleasedReturnValue(objc_msgSend(v186, "description"));
        *(_DWORD *)buf = 138412802;
        *(_QWORD *)&buf[4] = v188;
        v322 = 2112;
        v323 = CFSTR("com.apple.nearbyinteraction.peopleFindingSession.FindeeSummary");
        v324 = 2112;
        v325 = *(double *)&v189;
        _os_log_impl((void *)&_mh_execute_header, v187, OS_LOG_TYPE_INFO, "#ni-ca,[%@] send analytics event %@:\n%@\n", buf, 0x20u);

      }
      v315[0] = _NSConcreteStackBlock;
      v315[1] = 3221225472;
      v315[2] = sub_100039504;
      v315[3] = &unk_1007FA568;
      v190 = v186;
      v316 = v190;
      AnalyticsSendEventLazy(CFSTR("com.apple.nearbyinteraction.peopleFindingSession.FindeeSummary"), v315);

    }
    v53 = *(_DWORD *)p_lifecycleTimeoutType;
  }
  if (v53 == 4)
  {
    -[NIServerAnalyticsManager _submitFindingSessionEndStats](self, "_submitFindingSessionEndStats");
    if (self->_timePeerLocationFromFindeeData == -1.0)
    {
      v191 = (id)qword_10085F520;
      if (os_log_type_enabled(v191, OS_LOG_TYPE_INFO))
      {
        *(_WORD *)buf = 0;
        _os_log_impl((void *)&_mh_execute_header, v191, OS_LOG_TYPE_INFO, "#ni-ca,Dummy finder CA event", buf, 2u);
      }
    }
    else
    {
      v191 = objc_alloc_init((Class)NSMutableDictionary);
      -[NSObject setObject:forKey:](v191, "setObject:forKey:", self->_bundleIdentifier, CFSTR("appBundleID"));
      -[NIServerAnalyticsManager _finderTimeFromFirstPoseTo:](self, "_finderTimeFromFirstPoseTo:", a3);
      v193 = v192;
      if (self->_timeAtFirstValidPose != -1.0)
      {
        -[NIServerAnalyticsManager _finderTimeFromFirstPoseTo:](self, "_finderTimeFromFirstPoseTo:");
        v194 = (void *)objc_claimAutoreleasedReturnValue(+[NSNumber numberWithDouble:](NSNumber, "numberWithDouble:"));
        -[NSObject setObject:forKey:](v191, "setObject:forKey:", v194, CFSTR("TimeToFirstOutputRange"));

      }
      if (self->_timeAtFirstRawUWBRange != -1.0)
      {
        -[NIServerAnalyticsManager _finderTimeFromFirstPoseTo:](self, "_finderTimeFromFirstPoseTo:");
        v195 = (void *)objc_claimAutoreleasedReturnValue(+[NSNumber numberWithDouble:](NSNumber, "numberWithDouble:"));
        -[NSObject setObject:forKey:](v191, "setObject:forKey:", v195, CFSTR("TimeToFirstPeerLocation"));

      }
      if (self->_timeAtFirstPeerLocation != -1.0)
      {
        -[NIServerAnalyticsManager _finderTimeFromFirstPoseTo:](self, "_finderTimeFromFirstPoseTo:");
        v196 = (void *)objc_claimAutoreleasedReturnValue(+[NSNumber numberWithDouble:](NSNumber, "numberWithDouble:"));
        -[NSObject setObject:forKey:](v191, "setObject:forKey:", v196, CFSTR("TimeToFirstPeerLocationFromFMF"));

      }
      if (self->_timeAtFirstSelfLocation != -1.0)
      {
        -[NIServerAnalyticsManager _finderTimeFromFirstPoseTo:](self, "_finderTimeFromFirstPoseTo:");
        v197 = (void *)objc_claimAutoreleasedReturnValue(+[NSNumber numberWithDouble:](NSNumber, "numberWithDouble:"));
        -[NSObject setObject:forKey:](v191, "setObject:forKey:", v197, CFSTR("TimeToFirstPeerLocationFromFindeeData"));

      }
      if (self->_timeAtArmsLength != -1.0)
      {
        -[NIServerAnalyticsManager _finderTimeFromFirstPoseTo:](self, "_finderTimeFromFirstPoseTo:");
        v198 = (void *)objc_claimAutoreleasedReturnValue(+[NSNumber numberWithDouble:](NSNumber, "numberWithDouble:"));
        -[NSObject setObject:forKey:](v191, "setObject:forKey:", v198, CFSTR("TimeToFirstRawUWBRange"));

      }
      if (self->_timeAtFirstPose != -1.0)
      {
        -[NIServerAnalyticsManager _finderTimeFromFirstPoseTo:](self, "_finderTimeFromFirstPoseTo:");
        v199 = (void *)objc_claimAutoreleasedReturnValue(+[NSNumber numberWithDouble:](NSNumber, "numberWithDouble:"));
        -[NSObject setObject:forKey:](v191, "setObject:forKey:", v199, CFSTR("TimeToFirstArrow"));

      }
      if (self->_timeAtFirstArrow != -1.0)
      {
        -[NIServerAnalyticsManager _finderTimeFromFirstPoseTo:](self, "_finderTimeFromFirstPoseTo:");
        v200 = (void *)objc_claimAutoreleasedReturnValue(+[NSNumber numberWithDouble:](NSNumber, "numberWithDouble:"));
        -[NSObject setObject:forKey:](v191, "setObject:forKey:", v200, CFSTR("TimeToArmsReach"));

      }
      -[NIServerAnalyticsManager _finderTimeFromFirstPoseTo:](self, "_finderTimeFromFirstPoseTo:", self->_timeAtLastLocationFromFindeeData);
      v201 = (void *)objc_claimAutoreleasedReturnValue(+[NSNumber numberWithDouble:](NSNumber, "numberWithDouble:"));
      -[NSObject setObject:forKey:](v191, "setObject:forKey:", v201, CFSTR("TimeToFirstPose"));

      -[NIServerAnalyticsManager _finderTimeFromFirstPoseTo:](self, "_finderTimeFromFirstPoseTo:", *(double *)&self->_numberOfWalkingOrkUnknown);
      v202 = (void *)objc_claimAutoreleasedReturnValue(+[NSNumber numberWithDouble:](NSNumber, "numberWithDouble:"));
      -[NSObject setObject:forKey:](v191, "setObject:forKey:", v202, CFSTR("TimeToFirstFindeeData"));

      -[NIServerAnalyticsManager _finderTimeFromFirstPoseTo:](self, "_finderTimeFromFirstPoseTo:", self->_timeAtFirstFindeeData);
      v203 = (void *)objc_claimAutoreleasedReturnValue(+[NSNumber numberWithDouble:](NSNumber, "numberWithDouble:"));
      -[NSObject setObject:forKey:](v191, "setObject:forKey:", v203, CFSTR("TimeToFirstSelfLocation"));

      -[NIServerAnalyticsManager _finderTimeFromFirstPoseTo:](self, "_finderTimeFromFirstPoseTo:", self->_timeAtFirstPeerLocationFromFindeeData);
      v204 = (void *)objc_claimAutoreleasedReturnValue(+[NSNumber numberWithDouble:](NSNumber, "numberWithDouble:"));
      -[NSObject setObject:forKey:](v191, "setObject:forKey:", v204, CFSTR("TimeToFirstPDRFromFindeeData"));

      -[NIServerAnalyticsManager _finderTimeFromFirstPoseTo:](self, "_finderTimeFromFirstPoseTo:", self->_timeAtFirstPeerLocationFromFMF);
      v205 = (void *)objc_claimAutoreleasedReturnValue(+[NSNumber numberWithDouble:](NSNumber, "numberWithDouble:"));
      -[NSObject setObject:forKey:](v191, "setObject:forKey:", v205, CFSTR("TimeToFirstVIOFromFindeeData"));

      -[NIServerAnalyticsManager _finderTimeFromFirstPoseTo:](self, "_finderTimeFromFirstPoseTo:", self->_timeAtFirstPDRFromFindeeData);
      v206 = (void *)objc_claimAutoreleasedReturnValue(+[NSNumber numberWithDouble:](NSNumber, "numberWithDouble:"));
      -[NSObject setObject:forKey:](v191, "setObject:forKey:", v206, CFSTR("TimeToFirstDeltaVelocityFromFindeeData"));

      -[NIServerAnalyticsManager _finderTimeFromFirstPoseTo:](self, "_finderTimeFromFirstPoseTo:", self->_timeAtFirstVIOFromFindeeData);
      v207 = (void *)objc_claimAutoreleasedReturnValue(+[NSNumber numberWithDouble:](NSNumber, "numberWithDouble:"));
      -[NSObject setObject:forKey:](v191, "setObject:forKey:", v207, CFSTR("TimeToFirstStaticFromFindeeData"));

      v208 = (void *)objc_claimAutoreleasedReturnValue(+[NSNumber numberWithDouble:](NSNumber, "numberWithDouble:", v193));
      -[NSObject setObject:forKey:](v191, "setObject:forKey:", v208, CFSTR("TimeToEndSession"));

      v209 = (void *)objc_claimAutoreleasedReturnValue(-[NIServerAnalyticsManager _algorithmSourceToString:](self, "_algorithmSourceToString:", LODWORD(self->_timeAtFirstStaticFromFindeeData)));
      -[NSObject setObject:forKey:](v191, "setObject:forKey:", v209, CFSTR("FirstArrowAlgorithmSource"));

      v210 = (void *)objc_claimAutoreleasedReturnValue(-[NIServerAnalyticsManager _algorithmSourceToString:](self, "_algorithmSourceToString:", HIDWORD(self->_timeAtFirstStaticFromFindeeData)));
      -[NSObject setObject:forKey:](v191, "setObject:forKey:", v210, CFSTR("FirstOutputRangeAlgorithmSource"));

      v211 = (void *)objc_claimAutoreleasedReturnValue(-[NIServerAnalyticsManager _algorithmSourceToString:](self, "_algorithmSourceToString:", LODWORD(self->_timeAtEndOfSession)));
      -[NSObject setObject:forKey:](v191, "setObject:forKey:", v211, CFSTR("ArmsReachAlgorithmSource"));

      firstArrowAlgorithmSource = self->_firstArrowAlgorithmSource;
      v213 = 0.0;
      if (firstArrowAlgorithmSource != -1)
      {
        firstOutputRangeAlgorithmSource = self->_firstOutputRangeAlgorithmSource;
        if (firstOutputRangeAlgorithmSource)
          v213 = (float)firstArrowAlgorithmSource / (float)firstOutputRangeAlgorithmSource;
      }
      v215 = (void *)objc_claimAutoreleasedReturnValue(+[NSNumber numberWithDouble:](NSNumber, "numberWithDouble:", v213));
      -[NSObject setObject:forKey:](v191, "setObject:forKey:", v215, CFSTR("ArrowAvailabilityAfterFirstArrow"));

      timeAtEndOfSession_high = HIDWORD(self->_timeAtEndOfSession);
      if (timeAtEndOfSession_high == -1)
        v217 = 0;
      else
        v217 = timeAtEndOfSession_high;
      v218 = (void *)objc_claimAutoreleasedReturnValue(+[NSNumber numberWithInt:](NSNumber, "numberWithInt:", v217));
      -[NSObject setObject:forKey:](v191, "setObject:forKey:", v218, CFSTR("NumberOfArrowRevokes"));

      armsReachAlgorithmSource = self->_armsReachAlgorithmSource;
      if (armsReachAlgorithmSource == -1)
        v220 = 0;
      else
        v220 = armsReachAlgorithmSource;
      v221 = (void *)objc_claimAutoreleasedReturnValue(+[NSNumber numberWithInt:](NSNumber, "numberWithInt:", v220));
      -[NSObject setObject:forKey:](v191, "setObject:forKey:", v221, CFSTR("NumberOfVIOResets"));

      numberOfArrowRevokes = self->_numberOfArrowRevokes;
      v223 = 0.0;
      if (numberOfArrowRevokes != -1)
      {
        numberOfArrowAvailabilityAfterFirstArrow = self->_numberOfArrowAvailabilityAfterFirstArrow;
        if (numberOfArrowAvailabilityAfterFirstArrow)
          v223 = (float)numberOfArrowRevokes / (float)numberOfArrowAvailabilityAfterFirstArrow;
      }
      v225 = (void *)objc_claimAutoreleasedReturnValue(+[NSNumber numberWithDouble:](NSNumber, "numberWithDouble:", v223));
      -[NSObject setObject:forKey:](v191, "setObject:forKey:", v225, CFSTR("RatioOfSuccessfulPeerDataToTotalNumRange"));

      v226 = (void *)objc_claimAutoreleasedReturnValue(+[NSNumber numberWithBool:](NSNumber, "numberWithBool:", LOBYTE(self->_maxYCoordinateFindee)));
      -[NSObject setObject:forKey:](v191, "setObject:forKey:", v226, CFSTR("DidFinderChangeFloors"));

      v227 = (void *)objc_claimAutoreleasedReturnValue(+[NSNumber numberWithBool:](NSNumber, "numberWithBool:", BYTE1(self->_maxYCoordinateFindee)));
      -[NSObject setObject:forKey:](v191, "setObject:forKey:", v227, CFSTR("DidFindeeChangeFloors"));

      if (self->_numberOfArrowAvailabilityAfterFirstArrow >= 1)
      {
        v228 = (void *)objc_claimAutoreleasedReturnValue(+[NSNumber numberWithDouble:](NSNumber, "numberWithDouble:", self->_lastNBRSSI));
        -[NSObject setObject:forKey:](v191, "setObject:forKey:", v228, CFSTR("MaxRawRangeValueDuringSession"));

        v229 = (void *)objc_claimAutoreleasedReturnValue(+[NSNumber numberWithDouble:](NSNumber, "numberWithDouble:", self->_maxNBRSSI));
        -[NSObject setObject:forKey:](v191, "setObject:forKey:", v229, CFSTR("MinimumRange"));

        v230 = (void *)objc_claimAutoreleasedReturnValue(+[NSNumber numberWithDouble:](NSNumber, "numberWithDouble:", self->_m2));
        -[NSObject setObject:forKey:](v191, "setObject:forKey:", v230, CFSTR("FirstRawRangeValueDuringSession"));

        v231 = (void *)objc_claimAutoreleasedReturnValue(+[NSNumber numberWithDouble:](NSNumber, "numberWithDouble:", self->_firstNBRSSI));
        -[NSObject setObject:forKey:](v191, "setObject:forKey:", v231, CFSTR("LastRange"));

        v232 = (void *)objc_claimAutoreleasedReturnValue(+[NSNumber numberWithDouble:](NSNumber, "numberWithDouble:", self->_maxRawRangeValue));
        -[NSObject setObject:forKey:](v191, "setObject:forKey:", v232, CFSTR("RangeAtFirstPose"));

        v233 = (void *)objc_claimAutoreleasedReturnValue(+[NSNumber numberWithDouble:](NSNumber, "numberWithDouble:", self->_minRawRangeValue));
        -[NSObject setObject:forKey:](v191, "setObject:forKey:", v233, CFSTR("RangeAtFirstArrow"));

        v234 = (void *)objc_claimAutoreleasedReturnValue(+[NSNumber numberWithBool:](NSNumber, "numberWithBool:", vabdd_f64(self->_firstNBRSSI, self->_maxRawRangeValue) < 2.0));
        -[NSObject setObject:forKey:](v191, "setObject:forKey:", v234, CFSTR("SessionEndedWithNoRange"));

      }
      if (self->_armsReachAlgorithmSource == -1)
      {
        -[NIServerAnalyticsManager _calculateStraightLineDistance](self, "_calculateStraightLineDistance");
        v236 = (void *)objc_claimAutoreleasedReturnValue(+[NSNumber numberWithDouble:](NSNumber, "numberWithDouble:", *(double *)&self->_anon_558[72]));
        -[NSObject setObject:forKey:](v191, "setObject:forKey:", v236, CFSTR("StraightLineDistanceToFirstArrow"));

        v237 = (void *)objc_claimAutoreleasedReturnValue(+[NSNumber numberWithDouble:](NSNumber, "numberWithDouble:", self->_firstArrowStraightLineDistance));
        -[NSObject setObject:forKey:](v191, "setObject:forKey:", v237, CFSTR("StraightLineDistanceToFirstArrow"));

        v238 = (void *)objc_claimAutoreleasedReturnValue(+[NSNumber numberWithDouble:](NSNumber, "numberWithDouble:", *(double *)&self->_anon_558[80]));
        -[NSObject setObject:forKey:](v191, "setObject:forKey:", v238, CFSTR("StraightLineDistanceToArmsReach"));

        v239 = (void *)objc_claimAutoreleasedReturnValue(+[NSNumber numberWithDouble:](NSNumber, "numberWithDouble:", *(double *)&self->_anon_af8[80]));
        -[NSObject setObject:forKey:](v191, "setObject:forKey:", v239, CFSTR("RadialDisplacementVIO"));

        v240 = (void *)objc_claimAutoreleasedReturnValue(+[NSNumber numberWithDouble:](NSNumber, "numberWithDouble:", *(double *)&self->_anon_648[152]));
        -[NSObject setObject:forKey:](v191, "setObject:forKey:", v240, CFSTR("UserMovedDistanceToFirstArrow"));

        v241 = (void *)objc_claimAutoreleasedReturnValue(+[NSNumber numberWithDouble:](NSNumber, "numberWithDouble:", *(double *)&self->_anon_778[152]));
        -[NSObject setObject:forKey:](v191, "setObject:forKey:", v241, CFSTR("UserMovedDistanceToFirstOutputRange"));

        v242 = (void *)objc_claimAutoreleasedReturnValue(+[NSNumber numberWithDouble:](NSNumber, "numberWithDouble:", *(double *)&self->_anon_8a8[152]));
        -[NSObject setObject:forKey:](v191, "setObject:forKey:", v242, CFSTR("UserMovedDistanceToArmsReach"));

        v243 = (void *)objc_claimAutoreleasedReturnValue(+[NSNumber numberWithDouble:](NSNumber, "numberWithDouble:", *(double *)&self->_anon_9d8[152]));
        -[NSObject setObject:forKey:](v191, "setObject:forKey:", v243, CFSTR("TotalUserMovedDistance"));

        -[NIServerAnalyticsManager _calculateIOMetrics:](self, "_calculateIOMetrics:", v193);
        v244 = (void *)objc_claimAutoreleasedReturnValue(+[NSNumber numberWithDouble:](NSNumber, "numberWithDouble:", self->_radialDisplacementError));
        -[NSObject setObject:forKey:](v191, "setObject:forKey:", v244, CFSTR("PDRSpeedErrorStandardDeviation"));

        v245 = (void *)objc_claimAutoreleasedReturnValue(+[NSNumber numberWithDouble:](NSNumber, "numberWithDouble:", *(double *)&self->_anon_af8[72]));
        -[NSObject setObject:forKey:](v191, "setObject:forKey:", v245, CFSTR("PathLengthPDRVsVIOError"));

        v246 = (void *)objc_claimAutoreleasedReturnValue(+[NSNumber numberWithDouble:](NSNumber, "numberWithDouble:", self->_pathLengthError));
        -[NSObject setObject:forKey:](v191, "setObject:forKey:", v246, CFSTR("RadialDisplacementError"));

        v247 = (void *)objc_claimAutoreleasedReturnValue(+[NSNumber numberWithDouble:](NSNumber, "numberWithDouble:", self->_radialDisplacementFromVIO));
        -[NSObject setObject:forKey:](v191, "setObject:forKey:", v247, CFSTR("MeanSpeedFromVIO"));

        v248 = (void *)objc_claimAutoreleasedReturnValue(+[NSNumber numberWithDouble:](NSNumber, "numberWithDouble:", self->_meanSpeedFromVIO));
        -[NSObject setObject:forKey:](v191, "setObject:forKey:", v248, CFSTR("MeanSpeedFromVIOError"));

        v249 = (void *)objc_claimAutoreleasedReturnValue(+[NSNumber numberWithDouble:](NSNumber, "numberWithDouble:", self->_timeSSFromIOAndSSFromVIO));
        -[NSObject setObject:forKey:](v191, "setObject:forKey:", v249, CFSTR("PDRStationaryDetectionTruePositiveRate"));

        v250 = (void *)objc_claimAutoreleasedReturnValue(+[NSNumber numberWithDouble:](NSNumber, "numberWithDouble:", self->_timeSSFromIOAndNotSSFromVIO));
        -[NSObject setObject:forKey:](v191, "setObject:forKey:", v250, CFSTR("PDRStationaryDetectionTrueNegativeRate"));

        v235 = objc_claimAutoreleasedReturnValue(+[NSNumber numberWithDouble:](NSNumber, "numberWithDouble:", self->_pdrSSDetectionTruePositiveRate));
        -[NSObject setObject:forKey:](v191, "setObject:forKey:", v235, CFSTR("TimeSSFromVIO_percentage"));
      }
      else
      {
        v235 = (id)qword_10085F520;
        if (os_log_type_enabled(v235, OS_LOG_TYPE_INFO))
        {
          *(_WORD *)buf = 0;
          _os_log_impl((void *)&_mh_execute_header, v235, OS_LOG_TYPE_INFO, "#ni-ca,Unable to send user distances between finder and findee (we had VIO reset(s))", buf, 2u);
        }
      }

      if (LOBYTE(self->_vioPathLength))
      {
        -[NIServerAnalyticsManager _finderTimeFromFirstPoseTo:](self, "_finderTimeFromFirstPoseTo:", self->_noOdometryAvailableTime);
        v251 = (void *)objc_claimAutoreleasedReturnValue(+[NSNumber numberWithDouble:](NSNumber, "numberWithDouble:"));
        -[NSObject setObject:forKey:](v191, "setObject:forKey:", v251, CFSTR("TimeToFirstIOPoseAfterFindButtonPressed"));

        v252 = (id)qword_10085F520;
        if (os_log_type_enabled(v252, OS_LOG_TYPE_DEFAULT))
        {
          -[NIServerAnalyticsManager _finderTimeFromFirstPoseTo:](self, "_finderTimeFromFirstPoseTo:", self->_timeAtLastLocationFromFindeeData);
          if (!LOBYTE(self->_vioPathLength))
            sub_10000BA44();
          v254 = v253;
          -[NIServerAnalyticsManager _finderTimeFromFirstPoseTo:](self, "_finderTimeFromFirstPoseTo:", self->_noOdometryAvailableTime);
          *(_DWORD *)buf = 134218240;
          *(_QWORD *)&buf[4] = v254;
          v322 = 2048;
          v323 = v255;
          _os_log_impl((void *)&_mh_execute_header, v252, OS_LOG_TYPE_DEFAULT, "#ni-ca,pose times, vio: %f, io: %f", buf, 0x16u);
        }

      }
      val = self->_lastSolutionTime.var0.__val_;
      v257 = *(double *)&self->_lastSolutionTime.__engaged_;
      vioAvailableTime = self->_vioAvailableTime;
      ioSourceTime = self->_ioSourceTime;
      v260 = val + v257 + vioAvailableTime + ioSourceTime;
      v261 = val / v260;
      v262 = v257 / v260;
      v263 = vioAvailableTime / v260;
      v264 = ioSourceTime / v260;
      v265 = (id)qword_10085F520;
      if (os_log_type_enabled(v265, OS_LOG_TYPE_DEFAULT))
      {
        *(_DWORD *)buf = 134218752;
        *(double *)&buf[4] = v261;
        v322 = 2048;
        v323 = *(const __CFString **)&v262;
        v324 = 2048;
        v325 = v263;
        v326 = 2048;
        v327 = v264;
        _os_log_impl((void *)&_mh_execute_header, v265, OS_LOG_TYPE_DEFAULT, "#ni-ca,odometry source ratio, VIO: %f, IO: %f, DeltaV: %f, None: %f", buf, 0x2Au);
      }

      v266 = (void *)objc_claimAutoreleasedReturnValue(+[NSNumber numberWithDouble:](NSNumber, "numberWithDouble:", v261));
      -[NSObject setObject:forKey:](v191, "setObject:forKey:", v266, CFSTR("OdometrySourceVIO"));

      v267 = (void *)objc_claimAutoreleasedReturnValue(+[NSNumber numberWithDouble:](NSNumber, "numberWithDouble:", v262));
      -[NSObject setObject:forKey:](v191, "setObject:forKey:", v267, CFSTR("OdometrySourceIO"));

      v268 = (void *)objc_claimAutoreleasedReturnValue(+[NSNumber numberWithDouble:](NSNumber, "numberWithDouble:", v263));
      -[NSObject setObject:forKey:](v191, "setObject:forKey:", v268, CFSTR("OdometrySourceDeltaV"));

      v269 = (void *)objc_claimAutoreleasedReturnValue(+[NSNumber numberWithDouble:](NSNumber, "numberWithDouble:", v264));
      -[NSObject setObject:forKey:](v191, "setObject:forKey:", v269, CFSTR("OdometrySourceNone"));

      value = self->_deltaAngleErrorHistory.__end_cap_.__value_;
      end = self->_deltaAngleErrorHistory.__end_;
      if ((unint64_t)((char *)value - (char *)end) >= 0x29)
      {
        v314 = 0;
        v312 = 0u;
        v313 = 0u;
        v310 = 0;
        v311 = 0;
        __p = 0;
        sub_10003B090(&__p, end, (uint64_t)value, value - end);
        -[NIServerAnalyticsManager _calculateErrorStatsFromVector:](self, "_calculateErrorStatsFromVector:", &__p);
        if (__p)
        {
          v310 = __p;
          operator delete(__p);
        }
        v272 = (id)qword_10085F520;
        if (os_log_type_enabled(v272, OS_LOG_TYPE_DEFAULT))
        {
          *(_DWORD *)buf = 134219008;
          *(_QWORD *)&buf[4] = v312;
          v322 = 2048;
          v323 = (const __CFString *)*((_QWORD *)&v312 + 1);
          v324 = 2048;
          v325 = *(double *)&v313;
          v326 = 2048;
          v327 = *((double *)&v313 + 1);
          v328 = 2048;
          v329 = v314;
          _os_log_impl((void *)&_mh_execute_header, v272, OS_LOG_TYPE_DEFAULT, "#ni-ca,point errors mean: %f, std: %f, median: %f, 95th: %f, n: %zu", buf, 0x34u);
        }

        v273 = (void *)objc_claimAutoreleasedReturnValue(+[NSNumber numberWithDouble:](NSNumber, "numberWithDouble:", *(double *)&v312));
        -[NSObject setObject:forKey:](v191, "setObject:forKey:", v273, CFSTR("PointToPointErrorMean"));

        v274 = (void *)objc_claimAutoreleasedReturnValue(+[NSNumber numberWithDouble:](NSNumber, "numberWithDouble:", *((double *)&v312 + 1)));
        -[NSObject setObject:forKey:](v191, "setObject:forKey:", v274, CFSTR("PointToPointErrorStd"));

        v275 = (void *)objc_claimAutoreleasedReturnValue(+[NSNumber numberWithDouble:](NSNumber, "numberWithDouble:", *(double *)&v313));
        -[NSObject setObject:forKey:](v191, "setObject:forKey:", v275, CFSTR("PointToPointErrorMedian"));

        v276 = (void *)objc_claimAutoreleasedReturnValue(+[NSNumber numberWithDouble:](NSNumber, "numberWithDouble:", *((double *)&v313 + 1)));
        -[NSObject setObject:forKey:](v191, "setObject:forKey:", v276, CFSTR("PointToPointError95th"));

        v277 = (void *)objc_claimAutoreleasedReturnValue(+[NSNumber numberWithDouble:](NSNumber, "numberWithDouble:", (double)v314));
        -[NSObject setObject:forKey:](v191, "setObject:forKey:", v277, CFSTR("PointToPointErrorN"));

      }
      v278 = self->_angleErrorHistory.__end_cap_.__value_;
      v279 = self->_angleErrorHistory.__end_;
      if ((unint64_t)((char *)v278 - (char *)v279) >= 0x29)
      {
        v314 = 0;
        v312 = 0u;
        v313 = 0u;
        v307 = 0;
        v308 = 0;
        v306 = 0;
        sub_10003B090(&v306, v279, (uint64_t)v278, v278 - v279);
        -[NIServerAnalyticsManager _calculateErrorStatsFromVector:](self, "_calculateErrorStatsFromVector:", &v306);
        if (v306)
        {
          v307 = v306;
          operator delete(v306);
        }
        v280 = (id)qword_10085F520;
        if (os_log_type_enabled(v280, OS_LOG_TYPE_DEFAULT))
        {
          *(_DWORD *)buf = 134219008;
          *(_QWORD *)&buf[4] = v312;
          v322 = 2048;
          v323 = (const __CFString *)*((_QWORD *)&v312 + 1);
          v324 = 2048;
          v325 = *(double *)&v313;
          v326 = 2048;
          v327 = *((double *)&v313 + 1);
          v328 = 2048;
          v329 = v314;
          _os_log_impl((void *)&_mh_execute_header, v280, OS_LOG_TYPE_DEFAULT, "#ni-ca,delta dot errors mean: %f, std: %f, median: %f, 95th: %f, n: %zu", buf, 0x34u);
        }

        v281 = (void *)objc_claimAutoreleasedReturnValue(+[NSNumber numberWithDouble:](NSNumber, "numberWithDouble:", *(double *)&v312));
        -[NSObject setObject:forKey:](v191, "setObject:forKey:", v281, CFSTR("IODirectionOfTravelErrorDeltaDegreesMean"));

        v282 = (void *)objc_claimAutoreleasedReturnValue(+[NSNumber numberWithDouble:](NSNumber, "numberWithDouble:", *((double *)&v312 + 1)));
        -[NSObject setObject:forKey:](v191, "setObject:forKey:", v282, CFSTR("IODirectionOfTravelErrorDeltaDegreesStd"));

        v283 = (void *)objc_claimAutoreleasedReturnValue(+[NSNumber numberWithDouble:](NSNumber, "numberWithDouble:", *(double *)&v313));
        -[NSObject setObject:forKey:](v191, "setObject:forKey:", v283, CFSTR("IODirectionOfTravelErrorDeltaDegreesMedian"));

        v284 = (void *)objc_claimAutoreleasedReturnValue(+[NSNumber numberWithDouble:](NSNumber, "numberWithDouble:", *((double *)&v313 + 1)));
        -[NSObject setObject:forKey:](v191, "setObject:forKey:", v284, CFSTR("IODirectionOfTravelErrorDeltaDegrees95th"));

        v285 = (void *)objc_claimAutoreleasedReturnValue(+[NSNumber numberWithDouble:](NSNumber, "numberWithDouble:", (double)v314));
        -[NSObject setObject:forKey:](v191, "setObject:forKey:", v285, CFSTR("IODirectionOfTravelErrorDeltaDegreesN"));

      }
      v286 = *(_QWORD *)&self->_timeOfLastPDRUpdate.__engaged_;
      v287 = self->_timeOfLastPDRUpdate.var0.__val_;
      if ((unint64_t)(v286 - *(_QWORD *)&v287) >= 0x29)
      {
        v314 = 0;
        v312 = 0u;
        v313 = 0u;
        v304 = 0;
        v305 = 0;
        v303 = 0;
        sub_10003B090(&v303, *(const void **)&v287, v286, (v286 - *(_QWORD *)&v287) >> 2);
        -[NIServerAnalyticsManager _calculateErrorStatsFromVector:](self, "_calculateErrorStatsFromVector:", &v303);
        if (v303)
        {
          v304 = v303;
          operator delete(v303);
        }
        v288 = (id)qword_10085F520;
        if (os_log_type_enabled(v288, OS_LOG_TYPE_DEFAULT))
        {
          *(_DWORD *)buf = 134219008;
          *(_QWORD *)&buf[4] = v312;
          v322 = 2048;
          v323 = (const __CFString *)*((_QWORD *)&v312 + 1);
          v324 = 2048;
          v325 = *(double *)&v313;
          v326 = 2048;
          v327 = *((double *)&v313 + 1);
          v328 = 2048;
          v329 = v314;
          _os_log_impl((void *)&_mh_execute_header, v288, OS_LOG_TYPE_DEFAULT, "#ni-ca,dot errors mean: %f, std: %f, median: %f, 95th: %f, n: %zu", buf, 0x34u);
        }

        v289 = (void *)objc_claimAutoreleasedReturnValue(+[NSNumber numberWithDouble:](NSNumber, "numberWithDouble:", *(double *)&v312));
        -[NSObject setObject:forKey:](v191, "setObject:forKey:", v289, CFSTR("IODirectionOfTravelErrorDegreesMean"));

        v290 = (void *)objc_claimAutoreleasedReturnValue(+[NSNumber numberWithDouble:](NSNumber, "numberWithDouble:", *((double *)&v312 + 1)));
        -[NSObject setObject:forKey:](v191, "setObject:forKey:", v290, CFSTR("IODirectionOfTravelErrorDegreesStd"));

        v291 = (void *)objc_claimAutoreleasedReturnValue(+[NSNumber numberWithDouble:](NSNumber, "numberWithDouble:", *(double *)&v313));
        -[NSObject setObject:forKey:](v191, "setObject:forKey:", v291, CFSTR("IODirectionOfTravelErrorDegreesMedian"));

        v292 = (void *)objc_claimAutoreleasedReturnValue(+[NSNumber numberWithDouble:](NSNumber, "numberWithDouble:", *((double *)&v313 + 1)));
        -[NSObject setObject:forKey:](v191, "setObject:forKey:", v292, CFSTR("IODirectionOfTravelErrorDegrees95th"));

        v293 = (void *)objc_claimAutoreleasedReturnValue(+[NSNumber numberWithDouble:](NSNumber, "numberWithDouble:", (double)v314));
        -[NSObject setObject:forKey:](v191, "setObject:forKey:", v293, CFSTR("IODirectionOfTravelErrorDegreesN"));

      }
      if (self->_anon_9d8[171])
      {
        v294 = (void *)objc_claimAutoreleasedReturnValue(+[NSNumber numberWithBool:](NSNumber, "numberWithBool:", self->_anon_9d8[170]));
        -[NSObject setObject:forKey:](v191, "setObject:forKey:", v294, CFSTR("FindeeIsPhone"));

      }
      v295 = -[NSObject mutableCopy](v191, "mutableCopy");
      v296 = (id)qword_10085F520;
      if (os_log_type_enabled(v296, OS_LOG_TYPE_INFO))
      {
        v297 = self->_bundleIdentifier;
        v298 = (id)objc_claimAutoreleasedReturnValue(objc_msgSend(v295, "description"));
        *(_DWORD *)buf = 138412802;
        *(_QWORD *)&buf[4] = v297;
        v322 = 2112;
        v323 = CFSTR("com.apple.nearbyinteraction.peopleFindingSession.FinderSummary");
        v324 = 2112;
        v325 = *(double *)&v298;
        _os_log_impl((void *)&_mh_execute_header, v296, OS_LOG_TYPE_INFO, "#ni-ca,[%@] send analytics event %@:\n%@\n", buf, 0x20u);

      }
      v301[0] = _NSConcreteStackBlock;
      v301[1] = 3221225472;
      v301[2] = sub_10003950C;
      v301[3] = &unk_1007FA568;
      v299 = v295;
      v302 = v299;
      AnalyticsSendEventLazy(CFSTR("com.apple.nearbyinteraction.peopleFindingSession.FinderSummary"), v301);

    }
  }

}

- (void).cxx_destruct
{
  float *end;
  float *v4;
  double val;

  end = self->_deltaAngleErrorHistory.__end_;
  if (end)
  {
    self->_deltaAngleErrorHistory.__end_cap_.__value_ = end;
    operator delete(end);
  }
  v4 = self->_angleErrorHistory.__end_;
  if (v4)
  {
    self->_angleErrorHistory.__end_cap_.__value_ = v4;
    operator delete(v4);
  }
  val = self->_timeOfLastPDRUpdate.var0.__val_;
  if (val != 0.0)
  {
    *(double *)&self->_timeOfLastPDRUpdate.__engaged_ = val;
    operator delete(*(void **)&val);
  }
  sub_10003A394(&self->_pdrAligner._rotatedVioPoseHistory.__start_);
  sub_10003A394(&self->_pdrAligner._poseHistory.__start_);
  objc_storeStrong((id *)&self->_minDistance, 0);
  objc_storeStrong((id *)&self->_maxDistance, 0);
  if (*((char *)&self->_bundleIdAsStdString.__r_.__value_.var0.var1 + 23) < 0)
    operator delete(self->_bundleIdAsStdString.__r_.__value_.var0.var1.__data_);
  objc_storeStrong((id *)&self->_bundleIdentifier, 0);
}

- (id).cxx_construct
{
  *(_OWORD *)self->_bundleIdAsStdString.__r_.__value_.var0.var0.__data_ = 0uLL;
  *((_QWORD *)&self->_bundleIdAsStdString.__r_.__value_.var0.var1 + 2) = 0;
  LOBYTE(self->_numberOfLostVerticalConvergence) = 0;
  *((_BYTE *)&self->_numberOfLostVerticalConvergence + 4) = 0;
  LOBYTE(self->_timeAtFirstPeerData) = 0;
  BYTE4(self->_timeAtFirstPeerData) = 0;
  LOBYTE(self->_numberOfVIOResets) = 0;
  self->_anon_318[56] = 0;
  self->_anon_318[72] = 0;
  self->_anon_3a8[56] = 0;
  self->_anon_3a8[72] = 0;
  self->_anon_438[56] = 0;
  self->_anon_438[72] = 0;
  self->_anon_4c8[56] = 0;
  self->_anon_4c8[72] = 0;
  self->_anon_558[56] = 0;
  LOBYTE(self->_firstOutputRangeStraightLineDistance) = 0;
  LOBYTE(self->_firstArrowUserMovedDistance.traveledDistance) = 0;
  self->_anon_648[8] = 0;
  self->_anon_648[136] = 0;
  self->_anon_648[168] = 0;
  LOBYTE(self->_firstOutputRangeUserMovedDistance.traveledDistance) = 0;
  self->_anon_778[8] = 0;
  self->_anon_778[136] = 0;
  self->_anon_778[168] = 0;
  LOBYTE(self->_armsReachUserMovedDistance.traveledDistance) = 0;
  self->_anon_8a8[8] = 0;
  self->_anon_8a8[136] = 0;
  self->_anon_8a8[168] = 0;
  LOBYTE(self->_totalUserMovedDistance.traveledDistance) = 0;
  self->_anon_9d8[8] = 0;
  self->_anon_9d8[136] = 0;
  LOBYTE(self->_vioPathLengthWhenPDRIsAvailable) = 0;
  self->_anon_af8[56] = 0;
  BYTE4(self->_maxYCoordinateFindee) = 0;
  LOBYTE(self->_minYCoordinateFindee) = 0;
  *(_DWORD *)&self->_anon_9d8[168] = 0;
  sub_10034E340((uint64_t)&self->_rangeAtFirstArrow);
  self->_previousVioIsNotAvailable = 0;
  self->_previousAdjustedRotatedVioPosition.var0.__null_state_ = 0;
  self->_anon_e42[14] = 0;
  self->_anon_e42[22] = 0;
  BYTE4(self->_pointToPointErrorHistory.__end_) = 0;
  self->_lastAngleError.var0.__null_state_ = 0;
  LOBYTE(self->_timeOfLastSplicedPoseErrorLogging) = 0;
  LOBYTE(self->_noOdometryAvailableTime) = 0;
  LOBYTE(self->_vioPathLength) = 0;
  self->_timeOfLastPDRUpdate = 0u;
  *(_OWORD *)&self->_angleErrorHistory.__begin_ = 0u;
  *(_OWORD *)&self->_angleErrorHistory.__end_cap_.__value_ = 0u;
  *(_OWORD *)&self->_deltaAngleErrorHistory.__end_ = 0u;
  *(_OWORD *)((char *)&self->_deltaAngleErrorHistory.__end_cap_.__value_ + 1) = 0u;
  return self;
}

@end
