@implementation CLStepDistanceEstimator

- (CLExtendedStepCountEntry)updateEntryDistanceAndPace:(SEL)a3
{
  double currentPace;
  _BOOL4 v8;
  double rawDistance;
  unsigned int count;
  unsigned int v11;
  unsigned int v12;
  NSObject *v13;
  unsigned int v14;
  unsigned int v15;
  double v16;
  double activeTime;
  double v18;
  double timestamp;
  double v20;
  double v21;
  BOOL v22;
  double v23;
  BOOL v24;
  double v25;
  double v26;
  double v27;
  double v28;
  double v29;
  double v30;
  SpeedToKValueTable *ptr;
  void *v32;
  void *v33;
  _BOOL4 v34;
  double v35;
  GPSRawSpeedToKValueTable *v36;
  void *v37;
  void *v38;
  double v39;
  double v40;
  double v41;
  double v42;
  double v43;
  double v44;
  double v45;
  unsigned __int8 v46;
  CMPedometerTableStepCadenceToStrideLength *v47;
  CMPedometerTableStepCadenceToStrideLength *v48;
  double currentCadence;
  double v50;
  double v51;
  double v52;
  unsigned int v53;
  BOOL v54;
  double v55;
  BOOL v56;
  unsigned int v57;
  uint64_t v58;
  double v59;
  double v60;
  unsigned __int8 v61;
  double calibrated;
  double v63;
  double totalCalibratedDistanceMobility;
  NSObject *v65;
  CLExtendedStepCountEntry *p_firstStepTime;
  double startTime;
  double v68;
  NSObject *v69;
  double v70;
  double v71;
  double distance;
  double v73;
  int pedometerArmConstrainedState;
  unsigned int pushCount;
  int v76;
  __int128 v77;
  __int128 v78;
  __int128 v79;
  __int128 v80;
  __int128 v81;
  double v82;
  double v84;
  double v85;
  double v86;
  double v87;
  int v88;
  unsigned int v89;
  int v90;
  char *v91;
  unsigned int v92;
  unsigned int v93;
  char *v94;
  char *v95;
  double v96;
  double v97;
  double v98;
  double v99;
  double v100;
  double v101;
  double v102;
  double v103;
  double v104;
  double v105;
  double v106;
  double v107;
  double v108;
  int v109;
  _BYTE v110[10];
  double v111;
  __int16 v112;
  double v113;
  __int16 v114;
  double v115;
  __int16 v116;
  unsigned int v117;
  __int16 v118;
  double v119;
  __int16 v120;
  double v121;
  __int16 v122;
  double v123;
  __int16 v124;
  double v125;
  __int16 v126;
  double v127;
  __int16 v128;
  double v129;
  __int16 v130;
  _BOOL4 v131;
  __int16 v132;
  double v133;
  __int16 v134;
  double v135;
  __int16 v136;
  double v137;
  __int16 v138;
  double v139;
  __int16 v140;
  double v141;
  __int16 v142;
  int v143;
  __int16 v144;
  double v145;
  __int16 v146;
  int v147;
  __int16 v148;
  unsigned int v149;
  __int16 v150;
  int v151;
  __int16 v152;
  double v153;
  __int16 v154;
  double v155;
  _BYTE buf[14];
  double v157;
  __int16 v158;
  double v159;
  __int16 v160;
  double v161;
  __int16 v162;
  unsigned int v163;
  __int16 v164;
  double v165;
  __int16 v166;
  double v167;
  __int16 v168;
  double v169;
  __int16 v170;
  double v171;
  __int16 v172;
  double v173;
  __int16 v174;
  double v175;
  __int16 v176;
  _BOOL4 v177;
  __int16 v178;
  double v179;
  __int16 v180;
  double v181;
  __int16 v182;
  double v183;
  __int16 v184;
  double v185;
  __int16 v186;
  double v187;
  __int16 v188;
  int v189;
  __int16 v190;
  double v191;
  __int16 v192;
  int v193;
  __int16 v194;
  unsigned int v195;
  __int16 v196;
  int v197;
  __int16 v198;
  double v199;
  __int16 v200;
  double v201;

  currentPace = a4->currentPace;
  v8 = currentPace == 0.0
    || self->_lastEntry.base.timestamp == 1.79769313e308
    || vabdd_f64(currentPace, self->_lastEntry.addition.rawPace) > self->_lastEntry.addition.rawPace * 0.15;
  rawDistance = a4->rawDistance;
  count = self->_lastEntry.base.count;
  v11 = a4->count;
  v12 = v11 - count;
  if (v11 >= count)
  {
    activeTime = a4->activeTime;
    v18 = self->_lastEntry.base.activeTime;
    if (activeTime <= v18)
      v16 = 0.0;
    else
      v16 = activeTime - v18;
    v106 = v16;
    if (v16 <= 0.0)
    {
      timestamp = self->_lastEntry.base.timestamp;
      if (a4->timestamp > timestamp)
        v16 = a4->timestamp - timestamp;
      else
        v16 = 0.0;
    }
  }
  else
  {
    if (qword_10229FCD0 != -1)
      dispatch_once(&qword_10229FCD0, &stru_102179CF0);
    v13 = qword_10229FCD8;
    if (os_log_type_enabled((os_log_t)qword_10229FCD8, OS_LOG_TYPE_INFO))
    {
      v14 = self->_lastEntry.base.count;
      v15 = a4->count;
      *(_DWORD *)buf = 67109376;
      *(_DWORD *)&buf[4] = v14;
      *(_WORD *)&buf[8] = 1024;
      *(_DWORD *)&buf[10] = v15;
      _os_log_impl((void *)&_mh_execute_header, v13, OS_LOG_TYPE_INFO, "#Warning Step count went backwards (%u -> %u). locationd starting? Motion Co-processor reboot?", buf, 0xEu);
    }
    v16 = 0.0;
    if (sub_1001BFF7C(115, 2))
    {
      bzero(buf, 0x65CuLL);
      if (qword_10229FCD0 != -1)
        dispatch_once(&qword_10229FCD0, &stru_102179CF0);
      v92 = self->_lastEntry.base.count;
      v93 = a4->count;
      v109 = 67109376;
      *(_DWORD *)v110 = v92;
      *(_WORD *)&v110[4] = 1024;
      *(_DWORD *)&v110[6] = v93;
      v94 = (char *)_os_log_send_and_compose_impl(2, 0, buf, 1628, &_mh_execute_header, qword_10229FCD8, 1, "#Warning Step count went backwards (%u -> %u). locationd starting? Motion Co-processor reboot?", &v109, 14);
      sub_100512490("Generic", 1, 0, 2, "-[CLStepDistanceEstimator updateEntryDistanceAndPace:]", "%s\n", v94);
      if (v94 != buf)
        free(v94);
    }
    v12 = 0;
    v106 = 0.0;
  }
  v20 = (double)v12;
  v21 = rawDistance * (double)v12;
  a4->rawDistance = v21;
  v102 = rawDistance;
  v22 = rawDistance <= 0.0 || v12 == 0;
  v23 = 0.0;
  v24 = v22 || v16 <= 0.0;
  v25 = v16 / v21;
  if (v24)
    v25 = 0.0;
  v101 = v25;
  if (currentPace <= 0.0)
    v26 = v25;
  else
    v26 = currentPace;
  v27 = 1.0;
  v28 = 1.0;
  v29 = 1.0;
  if (v26 > 0.0)
  {
    -[CMPedometerTableRawSpeedToKValue kValueForRawSpeed:](+[CMPedometerTableRawSpeedToKValue sharedInstance](CMPedometerTableRawSpeedToKValue, "sharedInstance"), "kValueForRawSpeed:", 1.0 / v26);
    v28 = v30;
    ptr = self->_mobilitySpeedToKValueTable.__ptr_;
    if (ptr)
    {
      *(double *)buf = 1.0 / v26;
      v32 = (void *)(**(uint64_t (***)(SpeedToKValueTable *, _BYTE *))ptr)(ptr, buf);
      v33 = v32;
      v34 = v32 != 0;
      if (v32)
      {
        objc_msgSend(v32, "mean");
        v27 = v35;
      }
      v36 = self->_gpsSpeedToKValueTable.__ptr_;
      if (!v36)
      {
        if (!v33)
          goto LABEL_47;
        goto LABEL_46;
      }
    }
    else
    {
      v36 = self->_gpsSpeedToKValueTable.__ptr_;
      if (!v36)
      {
LABEL_47:
        v29 = 1.0;
        goto LABEL_48;
      }
      v34 = 0;
      v33 = 0;
    }
    *(double *)buf = 1.0 / v26;
    v37 = (void *)(**(uint64_t (***)(GPSRawSpeedToKValueTable *, _BYTE *))v36)(v36, buf);
    if (v37)
    {
      v38 = v37;
      objc_msgSend(v37, "mean");
      v107 = v39;
      objc_msgSend(v38, "variance");
      v29 = 1.0;
      if (!v34)
        goto LABEL_48;
      v41 = v40;
      objc_msgSend(v33, "variance");
      v104 = v42;
      objc_msgSend(v38, "variance");
      if (v43 > 0.0)
      {
        objc_msgSend(v33, "variance");
        if (v44 > 0.0)
        {
          v29 = (v27 * (1.0 / v104) + 1.0 / v41 * v107) / (1.0 / v41 + 1.0 / v104);
          goto LABEL_48;
        }
      }
      goto LABEL_47;
    }
    v29 = 1.0;
    if (!v34)
      goto LABEL_48;
LABEL_46:
    objc_msgSend(v33, "variance");
    goto LABEL_47;
  }
LABEL_48:
  v45 = a4->rawDistance;
  v99 = v29;
  v100 = v27;
  v108 = v28 * v45;
  a4->distance = v28 * v45;
  a4->distanceMobility = v27 * v45;
  a4->distanceFused = v29 * v45;
  a4->currentPace = currentPace / v28;
  v103 = 0.000001;
  v105 = fabs(v28 + -1.0);
  if (v105 <= 0.000001)
    v46 = 3;
  else
    v46 = 2;
  *(&a4->falseStepDetectorState.data + 2) = v46;
  v47 = +[CMPedometerTableStepCadenceToStrideLength sharedInstance](CMPedometerTableStepCadenceToStrideLength, "sharedInstance");
  v48 = v47;
  currentCadence = a4->currentCadence;
  v50 = v20 / v16;
  if (v16 <= 0.0)
    v50 = 0.0;
  v98 = v50;
  if (currentCadence <= 0.0)
    v51 = v50;
  else
    v51 = a4->currentCadence;
  if (v51 > 0.0)
  {
    -[CMPedometerTableStepCadenceToStrideLength strideLengthForStepCadence:](v47, "strideLengthForStepCadence:", v51);
    v23 = v52;
  }
  v53 = -[CMPedometerTableStepCadenceToStrideLength isCalibrationAvailableForStepCadence:](v48, "isCalibrationAvailableForStepCadence:", v51);
  v54 = v53;
  v55 = v23 * v20;
  if (v12)
    v56 = a4->pedometerArmConstrainedState == 0;
  else
    v56 = 1;
  v57 = !v56;
  if (v23 > 0.0)
    v58 = v57;
  else
    v58 = 0;
  v59 = v106;
  if ((_DWORD)v58 == 1)
  {
    a4->distance = v55;
    v60 = 0.0;
    if (v51 > 0.0)
      v60 = 1.0 / (v51 * v23);
    a4->currentPace = v60;
    if (v53)
      v61 = 4;
    else
      v61 = 5;
    *(&a4->falseStepDetectorState.data + 2) = v61;
  }
  else
  {
    v60 = a4->currentPace;
  }
  a4->accelerometerPace.calibrated = v60;
  if (v60 != 0.0)
  {
    -[CLStepDistanceEstimator computeWalkRunSigma:](self, "computeWalkRunSigma:", 1.0 / v60 * 2.23693991);
    calibrated = a4->accelerometerPace.calibrated;
    a4->accelerometerPace.lowerBound = calibrated / (v63 + 1.0);
    a4->accelerometerPace.upperBound = calibrated / (1.0 - v63);
  }
  totalCalibratedDistanceMobility = self->_totalCalibratedDistanceMobility;
  self->_totalCalibratedDistance = a4->distance + self->_totalCalibratedDistance;
  self->_totalCalibratedDistanceMobility = a4->distanceMobility + totalCalibratedDistanceMobility;
  self->_totalCalibratedDistanceFused = a4->distanceFused + self->_totalCalibratedDistanceFused;
  if (-[CLStepDistanceEstimator checkCoreAnalyticsPermissions:rawPaceForLUT:](self, "checkCoreAnalyticsPermissions:rawPaceForLUT:", v58, v26))
  {
    if (qword_10229FCD0 != -1)
      dispatch_once(&qword_10229FCD0, &stru_102179CF0);
    v65 = qword_10229FCD8;
    if (os_log_type_enabled((os_log_t)qword_10229FCD8, OS_LOG_TYPE_INFO))
    {
      *(_WORD *)buf = 0;
      _os_log_impl((void *)&_mh_execute_header, v65, OS_LOG_TYPE_INFO, "Distance Estimate, not in arm constrain and looking to send core analytics.", buf, 2u);
    }
    if (sub_1001BFF7C(115, 2))
    {
      bzero(buf, 0x65CuLL);
      if (qword_10229FCD0 != -1)
        dispatch_once(&qword_10229FCD0, &stru_102179CF0);
      LOWORD(v109) = 0;
      LODWORD(v96) = 2;
      v95 = (char *)_os_log_send_and_compose_impl(2, 0, buf, 1628, &_mh_execute_header, qword_10229FCD8, 1, "Distance Estimate, not in arm constrain and looking to send core analytics.", &v109, *(_QWORD *)&v96);
      sub_100512490("Generic", 1, 0, 2, "-[CLStepDistanceEstimator updateEntryDistanceAndPace:]", "%s\n", v95);
      if (v95 != buf)
        free(v95);
    }
    -[CLStepDistanceEstimator checkToSendDistancePercentageCoreAnalytics:mobilityDistance:rawSpeed:rawDist:](self, "checkToSendDistancePercentageCoreAnalytics:mobilityDistance:rawSpeed:rawDist:", self->_totalCalibratedDistance, self->_totalCalibratedDistanceMobility, 1.0 / v26, a4->rawDistance);
  }
  if (self->_supportsFirstStepTime)
    p_firstStepTime = (CLExtendedStepCountEntry *)&a4->firstStepTime;
  else
    p_firstStepTime = &self->_lastEntry;
  startTime = p_firstStepTime->startTime;
  if (self->_supportsFirstStepTime)
    v68 = v106 + a4->firstStepTime;
  else
    v68 = a4->startTime;
  if (qword_10229FCD0 != -1)
    dispatch_once(&qword_10229FCD0, &stru_102179CF0);
  v69 = qword_10229FCD8;
  if (os_log_type_enabled((os_log_t)qword_10229FCD8, OS_LOG_TYPE_INFO))
  {
    v71 = a4->timestamp;
    v70 = a4->startTime;
    distance = a4->distance;
    v73 = a4->currentPace;
    pedometerArmConstrainedState = a4->pedometerArmConstrainedState;
    pushCount = a4->pushCount;
    v76 = *((unsigned __int8 *)&a4->falseStepDetectorState.falseStepDetectorState + 1);
    *(_DWORD *)buf = 134223872;
    *(double *)&buf[4] = v70;
    *(_WORD *)&buf[12] = 2048;
    v157 = v71;
    v158 = 2048;
    v159 = startTime;
    v160 = 2048;
    v161 = v68;
    v162 = 1024;
    v163 = v12;
    v164 = 2048;
    v165 = distance;
    v166 = 2048;
    v167 = v73;
    v168 = 2048;
    v169 = v102;
    v170 = 2048;
    v171 = v106;
    v172 = 2048;
    v173 = currentPace;
    v174 = 2048;
    v175 = v101;
    v176 = 1024;
    v177 = v8;
    v178 = 2048;
    v179 = currentCadence;
    v180 = 2048;
    v181 = v98;
    v182 = 2048;
    v183 = v28;
    v184 = 2048;
    v185 = v100;
    v186 = 2048;
    v187 = v99;
    v188 = 1024;
    v189 = pedometerArmConstrainedState;
    v190 = 2048;
    v191 = v23;
    v192 = 1024;
    v193 = v58;
    v194 = 1024;
    v195 = pushCount;
    v196 = 1024;
    v197 = v76;
    v198 = 2048;
    v199 = v55;
    v200 = 2048;
    v201 = v108;
    _os_log_impl((void *)&_mh_execute_header, v69, OS_LOG_TYPE_INFO, "startTime,%f,timestamp,%f,firstStepTime,%f,lastStepTime,%f,stepsDelta,%u,calibratedDistanceDelta,%f,calibratedPace,%f,rawStrideLength,%f,activeTimeDelta,%f,rawPaceCurrent,%f,rawPaceActive,%f,rawPaceDidJump,%d,stepCadenceCurrent,%f,stepCadenceActive,%f,kValue,%f,kValueMobility,%f,KValueFused,%f,pedometerArmConstrainedState,%d,strideLengthFromStepCadence,%f,useStrideLengthFromStepCadence,%d,pushCount,%u,falseStepsSuppressed,%d,stepCadenceDeltaDistance,%.3f,energyDeltaDistance,%.3f,", buf, 0xDAu);
  }
  if (sub_1001BFF7C(115, 2))
  {
    bzero(buf, 0x65CuLL);
    if (qword_10229FCD0 != -1)
      dispatch_once(&qword_10229FCD0, &stru_102179CF0);
    v85 = a4->timestamp;
    v84 = a4->startTime;
    v86 = a4->distance;
    v87 = a4->currentPace;
    v88 = a4->pedometerArmConstrainedState;
    v89 = a4->pushCount;
    v90 = *((unsigned __int8 *)&a4->falseStepDetectorState.falseStepDetectorState + 1);
    v109 = 134223872;
    *(double *)v110 = v84;
    *(_WORD *)&v110[8] = 2048;
    v111 = v85;
    v112 = 2048;
    v113 = startTime;
    v114 = 2048;
    v115 = v68;
    v116 = 1024;
    v117 = v12;
    v118 = 2048;
    v119 = v86;
    v120 = 2048;
    v121 = v87;
    v122 = 2048;
    v123 = v102;
    v124 = 2048;
    v125 = v106;
    v126 = 2048;
    v127 = currentPace;
    v128 = 2048;
    v129 = v101;
    v130 = 1024;
    v131 = v8;
    v132 = 2048;
    v133 = currentCadence;
    v134 = 2048;
    v135 = v98;
    v136 = 2048;
    v137 = v28;
    v138 = 2048;
    v139 = v100;
    v140 = 2048;
    v141 = v99;
    v142 = 1024;
    v143 = v88;
    v144 = 2048;
    v145 = v23;
    v146 = 1024;
    v147 = v58;
    v148 = 1024;
    v149 = v89;
    v150 = 1024;
    v151 = v90;
    v152 = 2048;
    v153 = v55;
    v154 = 2048;
    v155 = v108;
    LODWORD(v96) = 218;
    v91 = (char *)_os_log_send_and_compose_impl(2, 0, buf, 1628, &_mh_execute_header, qword_10229FCD8, 1, "startTime,%f,timestamp,%f,firstStepTime,%f,lastStepTime,%f,stepsDelta,%u,calibratedDistanceDelta,%f,calibratedPace,%f,rawStrideLength,%f,activeTimeDelta,%f,rawPaceCurrent,%f,rawPaceActive,%f,rawPaceDidJump,%d,stepCadenceCurrent,%f,stepCadenceActive,%f,kValue,%f,kValueMobility,%f,KValueFused,%f,pedometerArmConstrainedState,%d,strideLengthFromStepCadence,%f,useStrideLengthFromStepCadence,%d,pushCount,%u,falseStepsSuppressed,%d,stepCadenceDeltaDistance,%.3f,energyDeltaDistance,%.3f,", COERCE_DOUBLE(&v109), v96, v97, v98, LODWORD(v99), v100, v101,
                    v102,
                    0.000001,
                    v105,
                    v106,
                    LODWORD(v108));
    sub_100512490("Generic", 1, 0, 2, "-[CLStepDistanceEstimator updateEntryDistanceAndPace:]", "%s\n", v91);
    if (v91 != buf)
      free(v91);
  }
  *(_OWORD *)&retstr->addition.rawPaceDidJump = 0u;
  *(_OWORD *)&retstr->addition.lastStepTime = 0u;
  *(_OWORD *)&retstr->addition.incrementalSteps = 0u;
  *(_OWORD *)&retstr->addition.stepCadenceDeltaDistance = 0u;
  *(_OWORD *)&retstr->addition.energyDeltaDistance = 0u;
  v77 = *(_OWORD *)&a4->accelerometerPace.lowerBound;
  *(_OWORD *)&retstr->base.isOdometerDistance = *(_OWORD *)&a4->isOdometerDistance;
  *(_OWORD *)&retstr->base.accelerometerPace.lowerBound = v77;
  v78 = *(_OWORD *)&a4->elevationDescended;
  *(_OWORD *)&retstr->base.pushCount = *(_OWORD *)&a4->pushCount;
  *(_OWORD *)&retstr->base.elevationDescended = v78;
  v79 = *(_OWORD *)&a4->floorsAscended;
  *(_OWORD *)&retstr->base.distanceMobility = *(_OWORD *)&a4->distanceMobility;
  *(_OWORD *)&retstr->base.floorsAscended = v79;
  v80 = *(_OWORD *)&a4->recordId;
  *(_OWORD *)&retstr->base.currentCadence = *(_OWORD *)&a4->currentCadence;
  *(_OWORD *)&retstr->base.recordId = v80;
  *(_OWORD *)&retstr->base.timestamp = *(_OWORD *)&a4->timestamp;
  v81 = *(_OWORD *)&a4->distance;
  *(_OWORD *)&retstr->base.firstStepTime = *(_OWORD *)&a4->firstStepTime;
  v82 = a4->startTime;
  retstr->startTime = v82;
  *(_OWORD *)&retstr->base.distance = v81;
  *(_OWORD *)&retstr->addition.totalCalibratedDistance = *(_OWORD *)&self->_totalCalibratedDistance;
  retstr->addition.totalCalibratedDistanceFused = self->_totalCalibratedDistanceFused;
  retstr->addition.rawPace = currentPace;
  retstr->addition.incrementalSteps = v12;
  if (!self->_supportsFirstStepTime)
    v59 = v82 - self->_lastEntry.startTime;
  retstr->addition.incrementalActiveTime = v59;
  retstr->addition.lastStepTime = v68;
  retstr->addition.odometerSpeed = -1.0;
  retstr->addition.rawPaceDidJump = v8;
  retstr->addition.calibratedDistance = a4->distance;
  retstr->addition.stepCadenceDeltaDistance = v55;
  retstr->addition.stepCadenceIsCalibrated = v54;
  retstr->addition.energyDeltaDistance = v108;
  retstr->addition.energyIsCalibrated = v105 > v103;
  retstr->addition.timestampOfFirstStep = 0;
  retstr->addition.timestampOfLastStepStrict = 0;
  retstr->addition.firstStepTime = startTime;
  return (CLExtendedStepCountEntry *)memcpy(&self->_lastEntry, retstr, sizeof(self->_lastEntry));
}

- (CLStepDistanceEstimator)init
{
  CLStepDistanceEstimator *v2;
  CLStepDistanceEstimator *v3;
  std::__shared_weak_count *v4;
  unint64_t *v5;
  unint64_t v6;
  std::__shared_weak_count *v7;
  unint64_t *v8;
  unint64_t v9;
  __int128 v11;
  objc_super v12;

  v12.receiver = self;
  v12.super_class = (Class)CLStepDistanceEstimator;
  v2 = -[CLStepDistanceEstimator init](&v12, "init");
  v3 = v2;
  if (v2)
  {
    v2->_lastEntry.base.timestamp = 1.79769313e308;
    v2->_lastEntry.base.count = -1;
    v2->_totalCalibratedDistanceMobility = 0.0;
    v2->_totalCalibratedDistanceFused = 0.0;
    v2->_totalCalibratedDistance = 0.0;
    v11 = 0uLL;
    sub_1002B7674((uint64_t)&v2->_mobilitySpeedToKValueTable, &v11);
    v4 = (std::__shared_weak_count *)*((_QWORD *)&v11 + 1);
    if (*((_QWORD *)&v11 + 1))
    {
      v5 = (unint64_t *)(*((_QWORD *)&v11 + 1) + 8);
      do
        v6 = __ldaxr(v5);
      while (__stlxr(v6 - 1, v5));
      if (!v6)
      {
        ((void (*)(std::__shared_weak_count *))v4->__on_zero_shared)(v4);
        std::__shared_weak_count::__release_weak(v4);
      }
    }
    v11 = 0uLL;
    sub_1002B7674((uint64_t)&v3->_gpsSpeedToKValueTable, &v11);
    v7 = (std::__shared_weak_count *)*((_QWORD *)&v11 + 1);
    if (*((_QWORD *)&v11 + 1))
    {
      v8 = (unint64_t *)(*((_QWORD *)&v11 + 1) + 8);
      do
        v9 = __ldaxr(v8);
      while (__stlxr(v9 - 1, v8));
      if (!v9)
      {
        ((void (*)(std::__shared_weak_count *))v7->__on_zero_shared)(v7);
        std::__shared_weak_count::__release_weak(v7);
      }
    }
    bzero(v3->_percentErrorCountsPerSpeedBin, 0xA84uLL);
    v3->_supportsFirstStepTime = (sub_1001B7910() & 2) != 0;
  }
  return v3;
}

- (void)setMobilityKValueTable:(shared_ptr<CMMobilityCal::SpeedToKValueTable>)a3
{
  sub_100349198(&self->_mobilitySpeedToKValueTable.__ptr_, (uint64_t *)a3.__ptr_);
}

- (void)setGPSKValueTable:(shared_ptr<CMMobilityCal::GPSRawSpeedToKValueTable>)a3
{
  sub_100349198(&self->_gpsSpeedToKValueTable.__ptr_, (uint64_t *)a3.__ptr_);
}

- (void)feedBodyMetrics:(CLBodyMetrics *)a3
{
  __int128 v3;
  __int128 v4;
  __int128 v5;

  v3 = *(_OWORD *)&a3->gender;
  v4 = *(_OWORD *)&a3->vo2max;
  v5 = *(_OWORD *)&a3->hronset;
  *(_OWORD *)&self->_bodyMetrics.runVo2max = *(_OWORD *)&a3->runVo2max;
  *(_OWORD *)&self->_bodyMetrics.vo2max = v4;
  *(_OWORD *)&self->_bodyMetrics.hronset = v5;
  *(_OWORD *)&self->_bodyMetrics.gender = v3;
}

- (double)computeWalkRunSigma:(double)a3
{
  if (a3 <= 4.0)
    return 0.08;
  if (a3 >= 5.0)
    return 0.21;
  return (a3 + -4.0) * 0.13 + 0.08;
}

- (BOOL)checkCoreAnalyticsPermissions:(BOOL)a3 rawPaceForLUT:(double)a4
{
  _BOOL4 v6;
  NSObject *v7;
  const char *v8;
  uint8_t *v9;
  _WORD v11[8];
  uint8_t buf[1640];

  if (objc_opt_class(MCProfileConnection, a2)
    && (objc_msgSend(+[MCProfileConnection sharedConnection](MCProfileConnection, "sharedConnection"), "isHealthDataSubmissionAllowed") & 1) != 0)
  {
    LOBYTE(v6) = a4 > 0.0 && !a3;
  }
  else
  {
    if (qword_10229FCD0 != -1)
      dispatch_once(&qword_10229FCD0, &stru_102179CF0);
    v7 = qword_10229FCD8;
    if (os_log_type_enabled((os_log_t)qword_10229FCD8, OS_LOG_TYPE_DEBUG))
    {
      *(_WORD *)buf = 0;
      _os_log_impl((void *)&_mh_execute_header, v7, OS_LOG_TYPE_DEBUG, "Not sending distance estimate analytics, no IHA permission", buf, 2u);
    }
    v6 = sub_1001BFF7C(115, 2);
    if (v6)
    {
      bzero(buf, 0x65CuLL);
      if (qword_10229FCD0 != -1)
        dispatch_once(&qword_10229FCD0, &stru_102179CF0);
      v11[0] = 0;
      _os_log_send_and_compose_impl(2, 0, buf, 1628, &_mh_execute_header, qword_10229FCD8, 2, "Not sending distance estimate analytics, no IHA permission", v11, 2);
      v9 = (uint8_t *)v8;
      sub_100512490("Generic", 1, 0, 2, "-[CLStepDistanceEstimator checkCoreAnalyticsPermissions:rawPaceForLUT:]", "%s\n", v8);
      if (v9 != buf)
        free(v9);
      LOBYTE(v6) = 0;
    }
  }
  return v6;
}

- (void)checkToSendDistancePercentageCoreAnalytics:(double)a3 mobilityDistance:(double)a4 rawSpeed:(double)a5 rawDist:(double)a6
{
  double v8;
  double v9;
  double v10;
  double v11;
  uint64_t v12;
  unint64_t v13;
  array<double, 3UL> (*percentErrorCountsPerSpeedBin)[14];
  _BYTE *v15;
  _BYTE *v16;
  uint64_t v17;
  unint64_t v18;
  uint64_t v19;
  unint64_t v20;
  _BYTE *v21;
  _BYTE *v22;
  uint64_t v23;
  unint64_t v24;
  uint64_t v25;
  uint64_t v26;
  unint64_t v27;
  int v28;
  _BYTE *v29;
  _BYTE *v30;
  uint64_t v31;
  unint64_t v32;
  uint64_t v33;
  int entryCount;
  NSObject *v35;
  int v36;
  int v37;
  const char *v38;
  uint8_t *v39;
  double v40;
  _BYTE *v41;
  _BYTE *v42;
  uint64_t v43;
  void *v44;
  _BYTE *v45;
  uint64_t v46;
  _BYTE *v47;
  _BYTE *v48;
  uint64_t v49;
  void *v50;
  _BYTE *v51;
  uint64_t v52;
  _BYTE *v53;
  _BYTE *v54;
  uint64_t v55;
  void *__p;
  _BYTE *v57;
  uint64_t v58;
  _DWORD v59[2];
  __int16 v60;
  double v61;
  uint8_t buf[4];
  int v63;
  __int16 v64;
  double v65;

  v8 = 0.0;
  if (a3 != 0.0)
    v8 = (a4 - a3) * 100.0 / a3;
  v9 = a3 / a6;
  if (a6 == 0.0)
    v10 = 0.0;
  else
    v10 = v9;
  if (a6 == 0.0)
    v11 = 0.0;
  else
    v11 = a4 / a6;
  __p = 0;
  v57 = 0;
  v58 = 0;
  sub_10025EA00(&__p, (const void *)qword_1023072E0, qword_1023072E8, (qword_1023072E8 - qword_1023072E0) >> 3);
  v12 = 0;
  if (v57 != __p)
  {
    v13 = (v57 - (_BYTE *)__p) >> 3;
    if (v13 <= 1)
      v13 = 1;
    while (*((double *)__p + v12) < a5)
    {
      if (v13 == ++v12)
      {
        LODWORD(v12) = v13;
        break;
      }
    }
  }
  v53 = 0;
  v54 = 0;
  v55 = 0;
  sub_10025EA00(&v53, (const void *)qword_1023072F8, qword_102307300, (qword_102307300 - qword_1023072F8) >> 3);
  percentErrorCountsPerSpeedBin = self->_percentErrorCountsPerSpeedBin;
  v15 = v53;
  v16 = v54;
  if (v54 == v53)
  {
    percentErrorCountsPerSpeedBin[(int)v12][0].__elems_[0] = percentErrorCountsPerSpeedBin[(int)v12][0].__elems_[0]
                                                           + 1.0;
    if (!v16)
      goto LABEL_24;
  }
  else
  {
    v17 = 0;
    v18 = (v54 - v53) >> 3;
    if (v18 <= 1)
      v18 = 1;
    while (*(double *)&v53[8 * v17] < v8)
    {
      if (v18 == ++v17)
      {
        LODWORD(v17) = v18;
        break;
      }
    }
    percentErrorCountsPerSpeedBin[(int)v12][(int)v17].__elems_[0] = percentErrorCountsPerSpeedBin[(int)v12][(int)v17].__elems_[0]
                                                                  + 1.0;
  }
  v54 = v15;
  operator delete(v15);
LABEL_24:
  if (__p)
  {
    v57 = __p;
    operator delete(__p);
  }
  v50 = 0;
  v51 = 0;
  v52 = 0;
  sub_10025EA00(&v50, (const void *)qword_1023072E0, qword_1023072E8, (qword_1023072E8 - qword_1023072E0) >> 3);
  v19 = 0;
  if (v51 != v50)
  {
    v20 = (v51 - (_BYTE *)v50) >> 3;
    if (v20 <= 1)
      v20 = 1;
    while (*((double *)v50 + v19) < a5)
    {
      if (v20 == ++v19)
      {
        LODWORD(v19) = v20;
        break;
      }
    }
  }
  v47 = 0;
  v48 = 0;
  v49 = 0;
  sub_10025EA00(&v47, (const void *)qword_1023072F8, qword_102307300, (qword_102307300 - qword_1023072F8) >> 3);
  v21 = v47;
  v22 = v48;
  if (v48 == v47)
  {
    percentErrorCountsPerSpeedBin[(int)v19][0].__elems_[1] = v10
                                                           + percentErrorCountsPerSpeedBin[(int)v19][0].__elems_[1];
    if (!v22)
      goto LABEL_41;
  }
  else
  {
    v23 = 0;
    v24 = (v48 - v47) >> 3;
    if (v24 <= 1)
      v24 = 1;
    while (*(double *)&v47[8 * v23] < v8)
    {
      if (v24 == ++v23)
      {
        LODWORD(v23) = v24;
        break;
      }
    }
    v25 = (uint64_t)&percentErrorCountsPerSpeedBin[(int)v19][(int)v23];
    *(double *)(v25 + 8) = v10 + *(double *)(v25 + 8);
  }
  v48 = v21;
  operator delete(v21);
LABEL_41:
  if (v50)
  {
    v51 = v50;
    operator delete(v50);
  }
  v44 = 0;
  v45 = 0;
  v46 = 0;
  sub_10025EA00(&v44, (const void *)qword_1023072E0, qword_1023072E8, (qword_1023072E8 - qword_1023072E0) >> 3);
  if (v45 == v44)
  {
    v28 = 0;
  }
  else
  {
    v26 = 0;
    v27 = (v45 - (_BYTE *)v44) >> 3;
    if (v27 <= 1)
      v27 = 1;
    while (*((double *)v44 + v26) < a5)
    {
      if (v27 == ++v26)
      {
        LODWORD(v26) = v27;
        break;
      }
    }
    v28 = v26;
  }
  v41 = 0;
  v42 = 0;
  v43 = 0;
  sub_10025EA00(&v41, (const void *)qword_1023072F8, qword_102307300, (qword_102307300 - qword_1023072F8) >> 3);
  v29 = v41;
  v30 = v42;
  if (v42 == v41)
  {
    percentErrorCountsPerSpeedBin[v28][0].__elems_[2] = v11 + percentErrorCountsPerSpeedBin[v28][0].__elems_[2];
    if (!v30)
      goto LABEL_60;
  }
  else
  {
    v31 = 0;
    v32 = (v42 - v41) >> 3;
    if (v32 <= 1)
      v32 = 1;
    while (*(double *)&v41[8 * v31] < v8)
    {
      if (v32 == ++v31)
      {
        LODWORD(v31) = v32;
        break;
      }
    }
    v33 = (uint64_t)&percentErrorCountsPerSpeedBin[v28][(int)v31];
    *(double *)(v33 + 16) = v11 + *(double *)(v33 + 16);
  }
  v42 = v29;
  operator delete(v29);
LABEL_60:
  if (v44)
  {
    v45 = v44;
    operator delete(v44);
  }
  entryCount = self->_entryCount;
  self->_entryCount = entryCount + 1;
  if (entryCount >= 100)
  {
    self->_entryCount = 0;
    -[CLStepDistanceEstimator sendDistancePercentageCoreAnalytics](self, "sendDistancePercentageCoreAnalytics");
    bzero(self->_percentErrorCountsPerSpeedBin, 0xA80uLL);
  }
  if (qword_10229FCD0 != -1)
    dispatch_once(&qword_10229FCD0, &stru_102179CF0);
  v35 = qword_10229FCD8;
  if (os_log_type_enabled((os_log_t)qword_10229FCD8, OS_LOG_TYPE_INFO))
  {
    v36 = self->_entryCount;
    *(_DWORD *)buf = 67109376;
    v63 = v36;
    v64 = 2048;
    v65 = v8;
    _os_log_impl((void *)&_mh_execute_header, v35, OS_LOG_TYPE_INFO, "Distance Estimate, checked to send Core Analytics event. Entry Count:%d, seen error: %f", buf, 0x12u);
  }
  if (sub_1001BFF7C(115, 2))
  {
    bzero(buf, 0x65CuLL);
    if (qword_10229FCD0 != -1)
      dispatch_once(&qword_10229FCD0, &stru_102179CF0);
    v37 = self->_entryCount;
    v59[0] = 67109376;
    v59[1] = v37;
    v60 = 2048;
    v61 = v8;
    LODWORD(v40) = 18;
    _os_log_send_and_compose_impl(2, 0, buf, 1628, &_mh_execute_header, qword_10229FCD8, 1, "Distance Estimate, checked to send Core Analytics event. Entry Count:%d, seen error: %f", v59, v40);
    v39 = (uint8_t *)v38;
    sub_100512490("Generic", 1, 0, 2, "-[CLStepDistanceEstimator checkToSendDistancePercentageCoreAnalytics:mobilityDistance:rawSpeed:rawDist:]", "%s\n", v38);
    if (v39 != buf)
      free(v39);
  }
}

- (void)sendDistancePercentageCoreAnalytics
{
  CLBodyMetrics *p_bodyMetrics;
  __int128 v4;
  int v5;
  __int128 v6;
  int v7;
  __int128 v8;
  int v9;
  __int128 v10;
  int v11;
  NSObject *v12;
  __int128 v13;
  uint64_t v14;
  __shared_weak_count **v15;
  uint64_t v16;
  NSObject *v17;
  double v18;
  uint64_t v19;
  Class v20;
  double v21;
  uint64_t v22;
  Class v23;
  const char *v24;
  uint8_t *v25;
  const char *v26;
  uint8_t *v27;
  int v28;
  int v29;
  __shared_weak_count **v30;
  __int128 v31;
  double v32;
  CLStepDistanceEstimator *v33;
  double v34[5];
  int v35;
  int v36;
  int v37;
  int v38;
  int v39;
  int v40;
  _OWORD v41[2];
  _OWORD v42[2];
  _OWORD v43[2];
  _OWORD v44[2];
  _OWORD v45[2];
  _OWORD v46[2];
  _OWORD v47[2];
  _OWORD v48[2];
  int v49;
  int v50;
  __int16 v51;
  int v52;
  __int16 v53;
  int v54;
  __int16 v55;
  int v56;
  __int16 v57;
  int v58;
  __int16 v59;
  int v60;
  __int16 v61;
  double v62;
  __int16 v63;
  uint64_t v64;
  __int16 v65;
  Class v66;
  uint8_t buf[4];
  int v68;
  __int16 v69;
  int v70;
  __int16 v71;
  int v72;
  __int16 v73;
  int v74;
  __int16 v75;
  int v76;
  __int16 v77;
  int v78;
  __int16 v79;
  double v80;
  __int16 v81;
  uint64_t v82;
  __int16 v83;
  Class v84;

  p_bodyMetrics = &self->_bodyMetrics;
  v4 = *(_OWORD *)&self->_bodyMetrics.vo2max;
  v47[0] = *(_OWORD *)&self->_bodyMetrics.gender;
  v47[1] = v4;
  v48[0] = *(_OWORD *)&self->_bodyMetrics.hronset;
  *(_OWORD *)((char *)v48 + 12) = *(_OWORD *)&self->_bodyMetrics.runVo2max;
  v5 = sub_101384E7C((uint64_t)v47);
  v6 = *(_OWORD *)&p_bodyMetrics->vo2max;
  v45[0] = *(_OWORD *)&p_bodyMetrics->gender;
  v45[1] = v6;
  v46[0] = *(_OWORD *)&p_bodyMetrics->hronset;
  *(_OWORD *)((char *)v46 + 12) = *(_OWORD *)&self->_bodyMetrics.runVo2max;
  v7 = sub_100217A98((unsigned int *)v45);
  v8 = *(_OWORD *)&p_bodyMetrics->vo2max;
  v43[0] = *(_OWORD *)&p_bodyMetrics->gender;
  v43[1] = v8;
  v44[0] = *(_OWORD *)&p_bodyMetrics->hronset;
  *(_OWORD *)((char *)v44 + 12) = *(_OWORD *)&self->_bodyMetrics.runVo2max;
  v9 = sub_101384F24((uint64_t)v43);
  v10 = *(_OWORD *)&p_bodyMetrics->vo2max;
  v41[0] = *(_OWORD *)&p_bodyMetrics->gender;
  v41[1] = v10;
  v42[0] = *(_OWORD *)&p_bodyMetrics->hronset;
  v33 = self;
  *(_OWORD *)((char *)v42 + 12) = *(_OWORD *)&self->_bodyMetrics.runVo2max;
  v11 = sub_101384FE4((uint64_t)v41);
  if (qword_10229FCD0 != -1)
    dispatch_once(&qword_10229FCD0, &stru_102179CF0);
  v12 = qword_10229FCD8;
  if (os_log_type_enabled((os_log_t)qword_10229FCD8, OS_LOG_TYPE_INFO))
  {
    *(_DWORD *)buf = 67109888;
    v68 = v5;
    v69 = 1024;
    v70 = v7;
    v71 = 1024;
    v72 = v9;
    v73 = 1024;
    v74 = v11;
    _os_log_impl((void *)&_mh_execute_header, v12, OS_LOG_TYPE_INFO, "Distance Estimate, age: %d, gender: %d, bmi: %d, userheight: %d.", buf, 0x1Au);
  }
  if (sub_1001BFF7C(115, 2))
  {
    bzero(buf, 0x65CuLL);
    if (qword_10229FCD0 != -1)
      dispatch_once(&qword_10229FCD0, &stru_102179CF0);
    v49 = 67109888;
    v50 = v5;
    v51 = 1024;
    v52 = v7;
    v53 = 1024;
    v54 = v9;
    v55 = 1024;
    v56 = v11;
    _os_log_send_and_compose_impl(2, 0, buf, 1628, &_mh_execute_header, qword_10229FCD8, 1, "Distance Estimate, age: %d, gender: %d, bmi: %d, userheight: %d.", &v49, 26, v28, v29);
    v27 = (uint8_t *)v26;
    sub_100512490("Generic", 1, 0, 2, "-[CLStepDistanceEstimator sendDistancePercentageCoreAnalytics]", "%s\n", v26);
    if (v27 != buf)
      free(v27);
  }
  v14 = 0;
  v15 = (__shared_weak_count **)&v33->_percentErrorCountsPerSpeedBin[0][0].__elems_[2];
  *(_QWORD *)&v13 = 67111168;
  v31 = v13;
  do
  {
    v16 = 0;
    v30 = v15;
    do
    {
      *(_QWORD *)&v34[0] = _NSConcreteStackBlock;
      *(_QWORD *)&v34[1] = 3221225472;
      *(_QWORD *)&v34[2] = sub_100C09D98;
      *(_QWORD *)&v34[3] = &unk_102179CD0;
      v35 = v5;
      v36 = v16;
      v37 = v7;
      v38 = v14;
      v39 = v9;
      v40 = v11;
      *(_QWORD *)&v34[4] = v33;
      AnalyticsSendEventLazy(CFSTR("com.apple.com.apple.CoreMotion.Pedometer.MobilityBasedCalibrationDaily"), v34);
      if (qword_10229FCD0 != -1)
        dispatch_once(&qword_10229FCD0, &stru_102179CF0);
      v17 = qword_10229FCD8;
      if (os_log_type_enabled((os_log_t)qword_10229FCD8, OS_LOG_TYPE_INFO))
      {
        v18 = *((double *)v15 - 2);
        v19 = (uint64_t)*(v15 - 1);
        v20 = (Class)*v15;
        *(_DWORD *)buf = v31;
        v68 = v5;
        v69 = 1024;
        v70 = v16;
        v71 = 1024;
        v72 = v7;
        v73 = 1024;
        v74 = v14;
        v75 = 1024;
        v76 = v9;
        v77 = 1024;
        v78 = v11;
        v79 = 2048;
        v80 = v18;
        v81 = 2048;
        v82 = v19;
        v83 = 2048;
        v84 = v20;
        _os_log_impl((void *)&_mh_execute_header, v17, OS_LOG_TYPE_INFO, "Distance Estimate, sent Core Analytics event. speedLB: - ageGroup %d | distancePercentageErrorBin: %d | gender: %d | speedBin: %d | userBmiBin: %d | userHeightBin: %d | countPerBin: %f | sumRatioGPStoRawDist: %f | sumRatioMobilitytoRawDist: %f", buf, 0x44u);
      }
      if (sub_1001BFF7C(115, 2))
      {
        bzero(buf, 0x65CuLL);
        if (qword_10229FCD0 != -1)
          dispatch_once(&qword_10229FCD0, &stru_102179CF0);
        v21 = *((double *)v15 - 2);
        v22 = (uint64_t)*(v15 - 1);
        v23 = (Class)*v15;
        v49 = v31;
        v50 = v5;
        v51 = 1024;
        v52 = v16;
        v53 = 1024;
        v54 = v7;
        v55 = 1024;
        v56 = v14;
        v57 = 1024;
        v58 = v9;
        v59 = 1024;
        v60 = v11;
        v61 = 2048;
        v62 = v21;
        v63 = 2048;
        v64 = v22;
        v65 = 2048;
        v66 = v23;
        _os_log_send_and_compose_impl(2, 0, buf, 1628, &_mh_execute_header, qword_10229FCD8, 1, "Distance Estimate, sent Core Analytics event. speedLB: - ageGroup %d | distancePercentageErrorBin: %d | gender: %d | speedBin: %d | userBmiBin: %d | userHeightBin: %d | countPerBin: %f | sumRatioGPStoRawDist: %f | sumRatioMobilitytoRawDist: %f", &v49, 68, v28, (_DWORD)v30, (_DWORD)v31, DWORD2(v31), v32, *(double *)&v33, v34[0]);
        v25 = (uint8_t *)v24;
        sub_100512490("Generic", 1, 0, 2, "-[CLStepDistanceEstimator sendDistancePercentageCoreAnalytics]", "%s\n", v24);
        if (v25 != buf)
          free(v25);
      }
      ++v16;
      v15 += 3;
    }
    while (v16 != 14);
    ++v14;
    v15 = v30 + 42;
  }
  while (v14 != 8);
}

- (void).cxx_destruct
{
  sub_100261F44((uint64_t)&self->_gpsSpeedToKValueTable);
  sub_100261F44((uint64_t)&self->_mobilitySpeedToKValueTable);
}

- (id).cxx_construct
{
  *(_OWORD *)((char *)self + 328) = 0u;
  *(_OWORD *)((char *)self + 344) = 0u;
  return self;
}

@end
