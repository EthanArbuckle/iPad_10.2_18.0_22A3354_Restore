@implementation CLFenceStateChangeAnalytics

- (CLFenceStateChangeAnalytics)initWithUniverse:(id)a3 fenceAnalyticsManager:(id)a4
{
  CLFenceStateChangeAnalytics *v6;
  CLFenceStateChangeAnalytics *v7;
  objc_super v9;

  v9.receiver = self;
  v9.super_class = (Class)CLFenceStateChangeAnalytics;
  v6 = -[CLFenceStateChangeAnalytics init](&v9, "init");
  v7 = v6;
  if (v6)
  {
    -[CLFenceStateChangeAnalytics setUniverse:](v6, "setUniverse:", a3);
    -[CLFenceStateChangeAnalytics setFenceAnalyticsManager:](v7, "setFenceAnalyticsManager:", a4);
    v7->_binsForDistances = (NSArray *)&off_1022208E8;
    v7->_binsForFenceRadius = (NSArray *)&off_102220900;
    v7->_binsForSteps = (NSArray *)&off_102220918;
    v7->_binsForTimeIntervals = (NSArray *)&off_102220930;
  }
  return v7;
}

- (void)dealloc
{
  objc_super v3;

  v3.receiver = self;
  v3.super_class = (Class)CLFenceStateChangeAnalytics;
  -[CLFenceStateChangeAnalytics dealloc](&v3, "dealloc");
}

- (unint64_t)binForDistance:(double)a3
{
  return (unint64_t)objc_msgSend(+[CLFenceBinner binForNumber:bins:](CLFenceBinner, "binForNumber:bins:", +[NSNumber numberWithDouble:](NSNumber, "numberWithDouble:", a3), self->_binsForDistances), "unsignedIntegerValue");
}

- (unint64_t)binForFenceRadius:(double)a3
{
  return (unint64_t)objc_msgSend(+[CLFenceBinner binForNumber:bins:](CLFenceBinner, "binForNumber:bins:", +[NSNumber numberWithDouble:](NSNumber, "numberWithDouble:", a3), self->_binsForFenceRadius), "unsignedIntegerValue");
}

- (unint64_t)binForSteps:(int)a3
{
  return (unint64_t)objc_msgSend(+[CLFenceBinner binForNumber:bins:](CLFenceBinner, "binForNumber:bins:", +[NSNumber numberWithInt:](NSNumber, "numberWithInt:", *(_QWORD *)&a3), self->_binsForSteps), "unsignedIntegerValue");
}

- (unint64_t)binForTimeInterval:(double)a3
{
  return (unint64_t)objc_msgSend(+[CLFenceBinner binForNumber:bins:](CLFenceBinner, "binForNumber:bins:", +[NSNumber numberWithDouble:](NSNumber, "numberWithDouble:", a3), self->_binsForTimeIntervals), "unsignedIntegerValue");
}

- (void)extractAnalyticsFromNotification:(uint64_t)a3 isInternal:(int)a4 handler:(uint64_t)a5
{
  NSObject *v8;
  NSObject *v9;
  __int128 v10;
  __int128 v11;
  __int128 v12;
  CLFenceStateChangeMetrics *v13;
  NSDate *v14;
  unsigned __int8 v15;
  double v16;
  void *v17;
  void *v18;
  id v19;
  void *v20;
  id v21;
  void *v22;
  id v23;
  NSObject *v24;
  const char *v25;
  uint8_t *v26;
  id v27;
  void *v28;
  uint64_t v29;
  id v30;
  void *v31;
  id v32;
  void *v33;
  NSObject *v34;
  const char *v35;
  id v36;
  void *v37;
  uint64_t v38;
  id v39;
  void *v40;
  unsigned int v41;
  double v42;
  unsigned int v43;
  double v44;
  void **v45;
  void *v46;
  const char *v47;
  uint8_t *v48;
  uint64_t v49;
  id v50;
  int v52;
  uint64_t v53;
  _QWORD block[8];
  int v55;
  _QWORD v56[7];
  void *v57;
  char v58;
  void *v59;
  char v60;
  void *v61;
  char v62;
  void *v63;
  char v64;
  id v65;
  void *v66;
  void *v67;
  int v68;
  void *v69[2];
  char v70;
  void *v71;
  char v72;
  void *v73;
  char v74;
  void *v75;
  char v76;
  id v77;
  void *v78;
  void *v79;
  void *v80[2];
  char v81;
  void *v82;
  char v83;
  void *v84;
  char v85;
  void *v86;
  char v87;
  id v88;
  void *v89;
  void *v90;
  void *v91[2];
  char v92;
  void *v93;
  char v94;
  void *v95;
  char v96;
  void *v97;
  char v98;
  id v99;
  void *v100;
  void *v101;
  _QWORD v102[7];
  int v103;
  _QWORD v104[7];
  int v105;
  _QWORD v106[7];
  int v107;
  _QWORD v108[7];
  int v109;
  _OWORD v110[8];
  uint64_t v111;
  _OWORD v112[8];
  uint64_t v113;
  _QWORD v114[9];
  __int128 v115;
  __int128 v116;
  __int128 v117;
  __int128 v118;
  __int128 v119;
  __int128 v120;
  __int128 v121;
  uint64_t v122;
  int v123;
  void *v124[2];
  char v125;
  void *v126;
  char v127;
  void *v128;
  char v129;
  void *v130;
  char v131;
  id v132;
  void *v133;
  void *v134;
  void *v135[2];
  char v136;
  void *v137;
  char v138;
  void *v139;
  char v140;
  void *v141;
  char v142;
  id v143;
  void *__p;
  void *v145;
  void *v146[2];
  char v147;
  void *v148;
  char v149;
  void *v150;
  char v151;
  double v152;
  double v153;
  unint64_t v154;
  unsigned __int8 v155;
  unsigned __int8 v156;
  void *v157;
  char v158;
  id v159;
  void *v160;
  void *v161;
  _OWORD __dst[59];
  __int128 v163;
  __int128 v164;
  __int128 v165;
  __int128 v166;
  __int128 v167;
  __int128 v168;
  __int128 v169;
  uint64_t v170;
  int v171;
  id v172;
  __int16 v173;
  NSDate *v174;
  _DWORD v175[8];
  __int128 v176;
  uint64_t v177;
  uint8_t buf[32];
  __int128 v179;
  __int128 v180;
  __int128 v181;
  __int128 v182;
  __int128 v183;
  __int128 v184;
  _BYTE v185[28];

  v53 = mach_continuous_time();
  if (qword_1022A0060 != -1)
    dispatch_once(&qword_1022A0060, &stru_102198880);
  v8 = qword_1022A0068;
  if (os_log_type_enabled((os_log_t)qword_1022A0068, OS_LOG_TYPE_DEFAULT))
  {
    *(_WORD *)buf = 0;
    _os_log_impl((void *)&_mh_execute_header, v8, OS_LOG_TYPE_DEFAULT, "#FenceMetrics Extracting and submitting state change analytics", buf, 2u);
  }
  if (sub_1001BFF7C(115, 2))
  {
    bzero(buf, 0x65CuLL);
    if (qword_1022A0060 != -1)
      dispatch_once(&qword_1022A0060, &stru_102198880);
    LOWORD(__dst[0]) = 0;
    _os_log_send_and_compose_impl(2, 0, buf, 1628, &_mh_execute_header, qword_1022A0068, 0, "#FenceMetrics Extracting and submitting state change analytics", __dst, 2);
    v48 = (uint8_t *)v47;
    sub_100512490("Generic", 1, 0, 2, "-[CLFenceStateChangeAnalytics extractAnalyticsFromNotification:isInternal:handler:]", "%s\n", v47);
    if (v48 != buf)
      free(v48);
  }
  v9 = dispatch_group_create();
  v52 = *(_DWORD *)(a1 + 8);
  *(_DWORD *)(a1 + 8) = v52 + 1;
  v10 = *(_OWORD *)(a3 + 752);
  v167 = *(_OWORD *)(a3 + 736);
  v168 = v10;
  v169 = *(_OWORD *)(a3 + 768);
  v170 = *(_QWORD *)(a3 + 784);
  v11 = *(_OWORD *)(a3 + 688);
  v163 = *(_OWORD *)(a3 + 672);
  v164 = v11;
  v12 = *(_OWORD *)(a3 + 720);
  v165 = *(_OWORD *)(a3 + 704);
  v166 = v12;
  v13 = objc_alloc_init(CLFenceStateChangeMetrics);
  memcpy(__dst, (const void *)(a3 + 664), sizeof(__dst));
  sub_1004E5748((char *)v146, (__int128 *)a3);
  v14 = +[NSDate dateWithTimeIntervalSinceReferenceDate:](NSDate, "dateWithTimeIntervalSinceReferenceDate:", *(double *)&__dst[8]);
  v15 = atomic_load((unsigned __int8 *)&qword_10230B9A8);
  if ((v15 & 1) == 0 && __cxa_guard_acquire(&qword_10230B9A8))
  {
    sub_1002433B8((uint64_t)dbl_10230B980);
    __cxa_guard_release(&qword_10230B9A8);
  }
  -[CLFenceStateChangeMetrics setAdjustedDistance:](v13, "setAdjustedDistance:", (unint64_t)*(double *)&__dst[39]);
  -[CLFenceStateChangeMetrics setDistanceToFenceBoundary:](v13, "setDistanceToFenceBoundary:", objc_msgSend((id)a1, "binForDistance:", *((double *)&__dst[38] + 1) - sub_10016F694((uint64_t)v146)));
  -[CLFenceStateChangeMetrics setAdjustedDistanceToFenceBoundary:](v13, "setAdjustedDistanceToFenceBoundary:", objc_msgSend((id)a1, "binForDistance:", *(double *)&__dst[39] - sub_10016F694((uint64_t)v146)));
  -[CLFenceStateChangeMetrics setEntryRadius:](v13, "setEntryRadius:", objc_msgSend((id)a1, "binForDistance:", *(double *)&__dst[40]));
  v16 = -1.0;
  if (v153 > 0.0)
    v16 = *(double *)&__dst[8] - v153;
  -[CLFenceStateChangeMetrics setEventLatency:](v13, "setEventLatency:", objc_msgSend((id)a1, "binForTimeInterval:", v16));
  v17 = *(void **)(a1 + 56);
  sub_1004E5748((char *)v135, (__int128 *)v146);
  objc_msgSend(v17, "updateTimeToInitialStateChangeForFence:previousStatus:timeOfStateChange:", v135, LODWORD(__dst[38]), *(double *)&__dst[8]);
  if (__p)
  {
    v145 = __p;
    operator delete(__p);
  }

  if (v142 < 0)
    operator delete(v141);
  if (v140 < 0)
    operator delete(v139);
  if (v138 < 0)
    operator delete(v137);
  if (v136 < 0)
    operator delete(v135[0]);
  v18 = *(void **)(a1 + 56);
  sub_1004E5748((char *)v124, (__int128 *)v146);
  v19 = objc_msgSend(v18, "historicalFenceStateForFence:", v124);
  if (v133)
  {
    v134 = v133;
    operator delete(v133);
  }

  if (v131 < 0)
    operator delete(v130);
  if (v129 < 0)
    operator delete(v128);
  if (v127 < 0)
    operator delete(v126);
  if (v125 < 0)
    operator delete(v124[0]);
  objc_msgSend(v19, "timeToInitialStateChange");
  -[CLFenceStateChangeMetrics setTimeToInitialStateChange:](v13, "setTimeToInitialStateChange:", (int)objc_msgSend(+[CLFenceBinner binForNumber:bins:](CLFenceBinner, "binForNumber:bins:", +[NSNumber numberWithDouble:](NSNumber, "numberWithDouble:"), *(_QWORD *)(a1 + 40)), "intValue"));
  -[CLFenceStateChangeMetrics setCurrentState:](v13, "setCurrentState:", SLODWORD(__dst[0]));
  -[CLFenceStateChangeMetrics setEventType:](v13, "setEventType:", +[CLFenceAnalyticsCommon fenceEventType:](CLFenceAnalyticsCommon, "fenceEventType:", HIDWORD(__dst[37])));
  -[CLFenceStateChangeMetrics setExitRadius:](v13, "setExitRadius:", objc_msgSend((id)a1, "binForDistance:", *((double *)&__dst[40] + 1)));
  -[CLFenceStateChangeMetrics setLocationAccuracy:](v13, "setLocationAccuracy:", objc_msgSend((id)a1, "binForDistance:", *(double *)((char *)&__dst[9] + 12)));
  -[CLFenceStateChangeMetrics setLocationProvider:](v13, "setLocationProvider:", DWORD2(__dst[14]));
  -[CLFenceStateChangeMetrics setPreviousLocationAccuracy:](v13, "setPreviousLocationAccuracy:", objc_msgSend((id)a1, "binForDistance:", *(double *)((char *)&__dst[29] + 4)));
  -[NSDate timeIntervalSinceDate:](v14, "timeIntervalSinceDate:", +[NSDate dateWithTimeIntervalSinceReferenceDate:](NSDate, "dateWithTimeIntervalSinceReferenceDate:", *(double *)((char *)&__dst[32] + 12)));
  -[CLFenceStateChangeMetrics setPreviousLocationAge:](v13, "setPreviousLocationAge:", (int)objc_msgSend(+[CLFenceBinner binForNumber:bins:](CLFenceBinner, "binForNumber:bins:", +[NSNumber numberWithDouble:](NSNumber, "numberWithDouble:"), *(_QWORD *)(a1 + 40)), "intValue"));
  -[CLFenceStateChangeMetrics setPreviousLocationProvider:](v13, "setPreviousLocationProvider:", LODWORD(__dst[34]));
  -[NSDate timeIntervalSinceDate:](v14, "timeIntervalSinceDate:", +[NSDate dateWithTimeIntervalSinceReferenceDate:](NSDate, "dateWithTimeIntervalSinceReferenceDate:", *(double *)&__dst[23]));
  -[CLFenceStateChangeMetrics setLastHandledLocationAge:](v13, "setLastHandledLocationAge:", objc_msgSend((id)a1, "binForTimeInterval:"));
  -[CLFenceStateChangeMetrics setLastHandledLocationProvider:](v13, "setLastHandledLocationProvider:", DWORD1(__dst[24]));
  -[CLFenceStateChangeMetrics setLastHandledLocationAccuracy:](v13, "setLastHandledLocationAccuracy:", objc_msgSend((id)a1, "binForDistance:", *((double *)&__dst[19] + 1)));
  -[CLFenceStateChangeMetrics setSignalEnvironmentType:](v13, "setSignalEnvironmentType:", DWORD1(__dst[17]));
  -[CLFenceStateChangeMetrics setSignificantFence:](v13, "setSignificantFence:", (v154 >> 7) & 1);
  -[CLFenceStateChangeMetrics setSettledState:](v13, "setSettledState:", DWORD1(__dst[38]));
  dispatch_group_enter(v9);
  v20 = *(void **)(a1 + 56);
  v114[0] = _NSConcreteStackBlock;
  v119 = v167;
  v120 = v168;
  v121 = v169;
  v115 = v163;
  v116 = v164;
  v117 = v165;
  v114[1] = 3221225472;
  v114[2] = sub_100FEE530;
  v114[3] = &unk_102198730;
  v123 = v52;
  v114[8] = v53;
  v122 = v170;
  v118 = v166;
  v114[4] = v13;
  v114[5] = a1;
  v114[6] = v14;
  v114[7] = v9;
  objc_msgSend(v20, "fetchLocationSystemStateWithHandler:", v114);
  v112[6] = __dst[48];
  v112[7] = __dst[49];
  v113 = *(_QWORD *)&__dst[50];
  v112[2] = __dst[44];
  v112[3] = __dst[45];
  v112[4] = __dst[46];
  v112[5] = __dst[47];
  v112[0] = __dst[42];
  v112[1] = __dst[43];
  -[CLFenceStateChangeMetrics setMotionState:](v13, "setMotionState:", +[CLFenceAnalyticsCommon motionTypeFromCLMotionActivity:](CLFenceAnalyticsCommon, "motionTypeFromCLMotionActivity:", v112));
  v111 = *((_QWORD *)&__dst[58] + 1);
  v110[6] = *(_OWORD *)((char *)&__dst[56] + 8);
  v110[7] = *(_OWORD *)((char *)&__dst[57] + 8);
  v110[2] = *(_OWORD *)((char *)&__dst[52] + 8);
  v110[3] = *(_OWORD *)((char *)&__dst[53] + 8);
  v110[4] = *(_OWORD *)((char *)&__dst[54] + 8);
  v110[5] = *(_OWORD *)((char *)&__dst[55] + 8);
  v110[0] = *(_OWORD *)((char *)&__dst[50] + 8);
  v110[1] = *(_OWORD *)((char *)&__dst[51] + 8);
  -[CLFenceStateChangeMetrics setDominantMotionState:](v13, "setDominantMotionState:", +[CLFenceAnalyticsCommon motionTypeFromCLMotionActivity:](CLFenceAnalyticsCommon, "motionTypeFromCLMotionActivity:", v110));
  v21 = objc_msgSend(objc_alloc((Class)NSDateInterval), "initWithStartDate:endDate:", -[NSDate dateByAddingTimeInterval:](v14, "dateByAddingTimeInterval:", -600.0), v14);
  dispatch_group_enter(v9);
  v22 = *(void **)(a1 + 56);
  v108[0] = _NSConcreteStackBlock;
  v108[1] = 3221225472;
  v108[2] = sub_100FEE7AC;
  v108[3] = &unk_102198758;
  v109 = v52;
  v108[6] = v53;
  v108[4] = v13;
  v108[5] = v9;
  objc_msgSend(v22, "fetchDominantMotionActivityInInterval:handler:", v21, v108);
  if (!v19 || !objc_msgSend(v19, "timeOfNMinusOneStateChange"))
    goto LABEL_59;
  objc_msgSend(v19, "nMinusOneStateChangeLocation");
  sub_10011E258(dbl_10230B980, (uint64_t)&__dst[8] + 8, (uint64_t)buf);
  -[CLFenceStateChangeMetrics setDistanceFromNMinusOneStateChange:](v13, "setDistanceFromNMinusOneStateChange:", objc_msgSend((id)a1, "binForDistance:"));
  v23 = objc_msgSend(v19, "timeOfNMinusOneStateChange");
  -[NSDate timeIntervalSinceDate:](v14, "timeIntervalSinceDate:", v23);
  -[CLFenceStateChangeMetrics setTimeSinceNMinusOneStateChange:](v13, "setTimeSinceNMinusOneStateChange:", objc_msgSend((id)a1, "binForTimeInterval:"));
  if (objc_msgSend(v23, "compare:", v14) == (id)1)
  {
    if (qword_1022A0060 != -1)
      dispatch_once(&qword_1022A0060, &stru_102198880);
    v24 = qword_1022A0068;
    if (os_log_type_enabled((os_log_t)qword_1022A0068, OS_LOG_TYPE_ERROR))
    {
      *(_DWORD *)buf = 138412546;
      *(_QWORD *)&buf[4] = v23;
      *(_WORD *)&buf[12] = 2112;
      *(_QWORD *)&buf[14] = v14;
      _os_log_impl((void *)&_mh_execute_header, v24, OS_LOG_TYPE_ERROR, "#FenceMetrics dateOfNMinusOneStateChange %@ comes after locationReceivedDate %@", buf, 0x16u);
    }
    if (sub_1001BFF7C(115, 0))
    {
      bzero(buf, 0x65CuLL);
      if (qword_1022A0060 != -1)
        dispatch_once(&qword_1022A0060, &stru_102198880);
      v175[0] = 138412546;
      *(_QWORD *)&v175[1] = v23;
      LOWORD(v175[3]) = 2112;
      *(_QWORD *)((char *)&v175[3] + 2) = v14;
      LODWORD(v49) = 22;
      _os_log_send_and_compose_impl(2, 0, buf, 1628, &_mh_execute_header, qword_1022A0068, 16, "#FenceMetrics dateOfNMinusOneStateChange %@ comes after locationReceivedDate %@", v175, v49);
      v26 = (uint8_t *)v25;
      sub_100512490("Generic", 1, 0, 0, "-[CLFenceStateChangeAnalytics extractAnalyticsFromNotification:isInternal:handler:]", "%s\n", v25);
LABEL_53:
      if (v26 != buf)
        free(v26);
      goto LABEL_121;
    }
    goto LABEL_121;
  }
  v27 = objc_msgSend(objc_alloc((Class)NSDateInterval), "initWithStartDate:endDate:", v23, v14);
  v177 = 0;
  v176 = 0u;
  memset(v175, 0, sizeof(v175));
  v28 = *(void **)(a1 + 56);
  if (v28)
  {
    objc_msgSend(v28, "fetchStepCountInInterval:", v27);
    v29 = v175[0];
  }
  else
  {
    v29 = 0;
  }
  -[CLFenceStateChangeMetrics setStepsSinceNMinusOneStateChange:](v13, "setStepsSinceNMinusOneStateChange:", objc_msgSend((id)a1, "binForSteps:", v29));
  dispatch_group_enter(v9);
  v30 = objc_msgSend(objc_alloc((Class)NSDateInterval), "initWithStartDate:endDate:", v23, -[NSDate earlierDate:](v14, "earlierDate:", objc_msgSend(v23, "dateByAddingTimeInterval:", 600.0)));
  v31 = *(void **)(a1 + 56);
  v106[0] = _NSConcreteStackBlock;
  v106[1] = 3221225472;
  v106[2] = sub_100FEE9B8;
  v106[3] = &unk_102198758;
  v107 = v52;
  v106[6] = v53;
  v106[4] = v13;
  v106[5] = v9;
  objc_msgSend(v31, "fetchDominantMotionActivityInInterval:handler:", v30, v106);
  dispatch_group_enter(v9);
  v32 = objc_msgSend(objc_alloc((Class)NSDateInterval), "initWithStartDate:endDate:", objc_msgSend(v23, "dateByAddingTimeInterval:", -600.0), v23);
  v33 = *(void **)(a1 + 56);
  v104[0] = _NSConcreteStackBlock;
  v104[1] = 3221225472;
  v104[2] = sub_100FEEBC4;
  v104[3] = &unk_102198758;
  v105 = v52;
  v104[6] = v53;
  v104[4] = v13;
  v104[5] = v9;
  objc_msgSend(v33, "fetchDominantMotionActivityInInterval:handler:", v32, v104);
  if (!objc_msgSend(v19, "timeOfNMinusTwoStateChange"))
  {
LABEL_59:
    -[NSDate timeIntervalSinceDate:](v14, "timeIntervalSinceDate:", +[NSDate dateWithTimeIntervalSinceReferenceDate:](NSDate, "dateWithTimeIntervalSinceReferenceDate:", *((double *)&__dst[44] + 1)));
    -[CLFenceStateChangeMetrics setTimeSinceDominantActivityChange:](v13, "setTimeSinceDominantActivityChange:", (int)objc_msgSend(+[CLFenceBinner binForNumber:bins:](CLFenceBinner, "binForNumber:bins:", +[NSNumber numberWithDouble:](NSNumber, "numberWithDouble:"), *(_QWORD *)(a1 + 40)), "intValue"));
    -[NSDate timeIntervalSinceDate:](v14, "timeIntervalSinceDate:", +[NSDate dateWithTimeIntervalSinceReferenceDate:](NSDate, "dateWithTimeIntervalSinceReferenceDate:", *(double *)&__dst[53]));
    -[CLFenceStateChangeMetrics setTimeSinceMotionActivityChange:](v13, "setTimeSinceMotionActivityChange:", (int)objc_msgSend(+[CLFenceBinner binForNumber:bins:](CLFenceBinner, "binForNumber:bins:", +[NSNumber numberWithDouble:](NSNumber, "numberWithDouble:"), *(_QWORD *)(a1 + 40)), "intValue"));
    -[CLFenceStateChangeMetrics setNMinusOneState:](v13, "setNMinusOneState:", (int)objc_msgSend(v19, "nMinusOneState"));
    -[CLFenceStateChangeMetrics setNMinusTwoState:](v13, "setNMinusTwoState:", (int)objc_msgSend(v19, "nMinusTwoState"));
    -[CLFenceStateChangeMetrics setNMinusThreeState:](v13, "setNMinusThreeState:", (int)objc_msgSend(v19, "nMinusThreeState"));
    -[CLFenceStateChangeMetrics setEventTypeNMinusOneStateChange:](v13, "setEventTypeNMinusOneStateChange:", +[CLFenceAnalyticsCommon fenceEventType:](CLFenceAnalyticsCommon, "fenceEventType:", objc_msgSend(v19, "nMinusOneState")));
    if (v19)
    {
      objc_msgSend(v19, "nMinusOneStateChangeLocation");
      if (sub_10013E570((uint64_t)buf, (uint64_t)&xmmword_101C17478))
        goto LABEL_68;
      objc_msgSend(v19, "nMinusOneStateChangeLocation");
      v41 = v183;
    }
    else
    {
      v184 = 0u;
      memset(v185, 0, sizeof(v185));
      v182 = 0u;
      v183 = 0u;
      v180 = 0u;
      v181 = 0u;
      v179 = 0u;
      memset(buf, 0, sizeof(buf));
      if (sub_10013E570((uint64_t)buf, (uint64_t)&xmmword_101C17478))
        goto LABEL_70;
      v41 = 0;
      v184 = 0u;
      memset(v185, 0, sizeof(v185));
      v182 = 0u;
      v183 = 0u;
      v180 = 0u;
      v181 = 0u;
      v179 = 0u;
      memset(buf, 0, sizeof(buf));
    }
    -[CLFenceStateChangeMetrics setNMinusOneStateChangeLocationProvider:](v13, "setNMinusOneStateChangeLocationProvider:", v41);
    if (v19)
    {
      objc_msgSend(v19, "nMinusOneStateChangeLocation");
      v42 = *(double *)&buf[20];
    }
    else
    {
      v184 = 0u;
      memset(v185, 0, sizeof(v185));
      v182 = 0u;
      v183 = 0u;
      v180 = 0u;
      v181 = 0u;
      v179 = 0u;
      v42 = 0.0;
      memset(buf, 0, sizeof(buf));
    }
    -[CLFenceStateChangeMetrics setNMinusOneStateChangeLocationAccuracy:](v13, "setNMinusOneStateChangeLocationAccuracy:", objc_msgSend((id)a1, "binForDistance:", v42));
    if (v19)
    {
LABEL_68:
      objc_msgSend(v19, "nMinusTwoStateChangeLocation");
      if (!sub_10013E570((uint64_t)buf, (uint64_t)&xmmword_101C17478))
      {
        objc_msgSend(v19, "nMinusTwoStateChangeLocation");
        v43 = v183;
LABEL_72:
        -[CLFenceStateChangeMetrics setNMinusTwoStateChangeLocationProvider:](v13, "setNMinusTwoStateChangeLocationProvider:", v43);
        if (v19)
        {
          objc_msgSend(v19, "nMinusTwoStateChangeLocation");
          v44 = *(double *)&buf[20];
        }
        else
        {
          v184 = 0u;
          memset(v185, 0, sizeof(v185));
          v182 = 0u;
          v183 = 0u;
          v180 = 0u;
          v181 = 0u;
          v179 = 0u;
          v44 = 0.0;
          memset(buf, 0, sizeof(buf));
        }
        -[CLFenceStateChangeMetrics setNMinusTwoStateChangeLocationAccuracy:](v13, "setNMinusTwoStateChangeLocationAccuracy:", objc_msgSend((id)a1, "binForDistance:", v44));
        goto LABEL_76;
      }
      goto LABEL_76;
    }
LABEL_70:
    v184 = 0u;
    memset(v185, 0, sizeof(v185));
    v182 = 0u;
    v183 = 0u;
    v180 = 0u;
    v181 = 0u;
    v179 = 0u;
    memset(buf, 0, sizeof(buf));
    if (!sub_10013E570((uint64_t)buf, (uint64_t)&xmmword_101C17478))
    {
      v43 = 0;
      v184 = 0u;
      memset(v185, 0, sizeof(v185));
      v182 = 0u;
      v183 = 0u;
      v180 = 0u;
      v181 = 0u;
      v179 = 0u;
      memset(buf, 0, sizeof(buf));
      goto LABEL_72;
    }
LABEL_76:
    -[CLFenceStateChangeMetrics setEffectiveRadius:](v13, "setEffectiveRadius:", objc_msgSend((id)a1, "binForFenceRadius:", sub_10016F694((uint64_t)v146)));
    sub_1004E5748((char *)v91, (__int128 *)v146);
    -[CLFenceStateChangeMetrics setFenceCategoryType:](v13, "setFenceCategoryType:", +[CLFenceAnalyticsCommon fenceCategoryForFence:](CLFenceAnalyticsCommon, "fenceCategoryForFence:", v91));
    if (v100)
    {
      v101 = v100;
      operator delete(v100);
    }

    if (v98 < 0)
      operator delete(v97);
    if (v96 < 0)
      operator delete(v95);
    if (v94 < 0)
      operator delete(v93);
    if (v92 < 0)
      operator delete(v91[0]);
    -[CLFenceStateChangeMetrics setFenceRadius:](v13, "setFenceRadius:", objc_msgSend((id)a1, "binForFenceRadius:", v152));
    sub_1004E5748((char *)v80, (__int128 *)v146);
    -[CLFenceStateChangeMetrics setFenceType:](v13, "setFenceType:", +[CLFenceAnalyticsCommon fenceSizeForFence:](CLFenceAnalyticsCommon, "fenceSizeForFence:", v80));
    if (v89)
    {
      v90 = v89;
      operator delete(v89);
    }

    if (v87 < 0)
      operator delete(v86);
    if (v85 < 0)
      operator delete(v84);
    if (v83 < 0)
      operator delete(v82);
    if (v81 < 0)
      operator delete(v80[0]);
    -[CLFenceStateChangeMetrics setIsConservativeEntry:](v13, "setIsConservativeEntry:", (~(_DWORD)v154 & 5) == 0);
    -[CLFenceStateChangeMetrics setIsEmergencyFence:](v13, "setIsEmergencyFence:", (v154 >> 4) & 1);
    -[CLFenceStateChangeMetrics setIsHelperFence:](v13, "setIsHelperFence:", v155);
    -[CLFenceStateChangeMetrics setIsLowPower:](v13, "setIsLowPower:", (v154 >> 5) & 1);
    -[CLFenceStateChangeMetrics setIsThrottledFence:](v13, "setIsThrottledFence:", v156);
    if (a4)
    {
      if (v147 >= 0)
        v45 = v146;
      else
        v45 = (void **)v146[0];
      -[CLFenceStateChangeMetrics setBundleId:](v13, "setBundleId:", +[CLFenceAnalyticsCommon masqueradeBundleId:](CLFenceAnalyticsCommon, "masqueradeBundleId:", +[NSString stringWithCString:encoding:](NSString, "stringWithCString:encoding:", v45, 4)));
      dispatch_group_enter(v9);
      v46 = *(void **)(a1 + 56);
      sub_1004E5748((char *)v69, (__int128 *)v146);
      v56[0] = _NSConcreteStackBlock;
      v56[1] = 3321888768;
      v56[2] = sub_100FEEFDC;
      v56[3] = &unk_102198780;
      v68 = v52;
      v56[6] = v53;
      v56[4] = v13;
      sub_1004E5748((char *)&v57, (__int128 *)v146);
      v56[5] = v9;
      objc_msgSend(v46, "fetchLocationOfInterestForFence:handler:", v69, v56);
      if (v78)
      {
        v79 = v78;
        operator delete(v78);
      }

      if (v76 < 0)
        operator delete(v75);
      if (v74 < 0)
        operator delete(v73);
      if (v72 < 0)
        operator delete(v71);
      if (v70 < 0)
        operator delete(v69[0]);
      if (v66)
      {
        v67 = v66;
        operator delete(v66);
      }

      if (v64 < 0)
        operator delete(v63);
      if (v62 < 0)
        operator delete(v61);
      if (v60 < 0)
        operator delete(v59);
      if (v58 < 0)
        operator delete(v57);
    }
    block[0] = _NSConcreteStackBlock;
    block[1] = 3221225472;
    block[2] = sub_100FEF3DC;
    block[3] = &unk_1021987B8;
    v55 = v52;
    block[6] = a5;
    block[7] = v53;
    block[4] = v13;
    block[5] = v9;
    dispatch_group_notify(v9, (dispatch_queue_t)objc_msgSend(objc_msgSend(objc_msgSend((id)a1, "universe"), "silo"), "queue"), block);
    goto LABEL_121;
  }
  v50 = objc_msgSend(v19, "timeOfNMinusTwoStateChange");
  objc_msgSend(v19, "nMinusTwoStateChangeLocation");
  sub_10011E258(dbl_10230B980, (uint64_t)&__dst[8] + 8, (uint64_t)buf);
  -[CLFenceStateChangeMetrics setDistanceFromNMinusTwoStateChange:](v13, "setDistanceFromNMinusTwoStateChange:", (int)objc_msgSend(+[CLFenceBinner binForNumber:bins:](CLFenceBinner, "binForNumber:bins:", +[NSNumber numberWithDouble:](NSNumber, "numberWithDouble:"), *(_QWORD *)(a1 + 16)), "intValue"));
  if (objc_msgSend(v50, "compare:", v14) != (id)1)
  {
    v36 = objc_msgSend(objc_alloc((Class)NSDateInterval), "initWithStartDate:endDate:", v50, v14);
    v37 = *(void **)(a1 + 56);
    if (v37)
    {
      objc_msgSend(v37, "fetchStepCountInInterval:", v36);
      v38 = *(unsigned int *)buf;
    }
    else
    {
      v38 = 0;
      *(_QWORD *)&v180 = 0;
      v179 = 0u;
      memset(buf, 0, sizeof(buf));
    }
    -[CLFenceStateChangeMetrics setStepsSinceNMinusTwoStateChange:](v13, "setStepsSinceNMinusTwoStateChange:", (int)objc_msgSend(+[CLFenceBinner binForNumber:bins:](CLFenceBinner, "binForNumber:bins:", +[NSNumber numberWithInt:](NSNumber, "numberWithInt:", v38), *(_QWORD *)(a1 + 32)), "intValue"));
    -[NSDate timeIntervalSinceDate:](v14, "timeIntervalSinceDate:", v50);
    -[CLFenceStateChangeMetrics setTimeSinceNMinusTwoStateChange:](v13, "setTimeSinceNMinusTwoStateChange:", (int)objc_msgSend(+[CLFenceBinner binForNumber:bins:](CLFenceBinner, "binForNumber:bins:", +[NSNumber numberWithDouble:](NSNumber, "numberWithDouble:"), *(_QWORD *)(a1 + 40)), "intValue"));
    dispatch_group_enter(v9);
    v39 = objc_msgSend(objc_alloc((Class)NSDateInterval), "initWithStartDate:endDate:", v50, objc_msgSend(v23, "earlierDate:", objc_msgSend(v50, "dateByAddingTimeInterval:", 600.0)));
    v40 = *(void **)(a1 + 56);
    v102[0] = _NSConcreteStackBlock;
    v102[1] = 3221225472;
    v102[2] = sub_100FEEDD0;
    v102[3] = &unk_102198758;
    v103 = v52;
    v102[6] = v53;
    v102[4] = v13;
    v102[5] = v9;
    objc_msgSend(v40, "fetchDominantMotionActivityInInterval:handler:", v39, v102);
    -[CLFenceStateChangeMetrics setEventTypeNMinusTwoStateChange:](v13, "setEventTypeNMinusTwoStateChange:", +[CLFenceAnalyticsCommon fenceEventType:](CLFenceAnalyticsCommon, "fenceEventType:", objc_msgSend(v19, "nMinusTwoState")));
    goto LABEL_59;
  }
  if (qword_1022A0060 != -1)
    dispatch_once(&qword_1022A0060, &stru_102198880);
  v34 = qword_1022A0068;
  if (os_log_type_enabled((os_log_t)qword_1022A0068, OS_LOG_TYPE_ERROR))
  {
    *(_DWORD *)buf = 138412546;
    *(_QWORD *)&buf[4] = v50;
    *(_WORD *)&buf[12] = 2112;
    *(_QWORD *)&buf[14] = v14;
    _os_log_impl((void *)&_mh_execute_header, v34, OS_LOG_TYPE_ERROR, "#FenceMetrics dateOfNMinusTwoStateChange %@ comes after locationReceivedDate %@", buf, 0x16u);
  }
  if (sub_1001BFF7C(115, 0))
  {
    bzero(buf, 0x65CuLL);
    if (qword_1022A0060 != -1)
      dispatch_once(&qword_1022A0060, &stru_102198880);
    v171 = 138412546;
    v172 = v50;
    v173 = 2112;
    v174 = v14;
    LODWORD(v49) = 22;
    _os_log_send_and_compose_impl(2, 0, buf, 1628, &_mh_execute_header, qword_1022A0068, 16, "#FenceMetrics dateOfNMinusTwoStateChange %@ comes after locationReceivedDate %@", &v171, v49);
    v26 = (uint8_t *)v35;
    sub_100512490("Generic", 1, 0, 0, "-[CLFenceStateChangeAnalytics extractAnalyticsFromNotification:isInternal:handler:]", "%s\n", v35);
    goto LABEL_53;
  }
LABEL_121:
  if (v160)
  {
    v161 = v160;
    operator delete(v160);
  }

  if (v158 < 0)
    operator delete(v157);
  if (v151 < 0)
    operator delete(v150);
  if (v149 < 0)
    operator delete(v148);
  if (v147 < 0)
    operator delete(v146[0]);
}

- (id)createMetricsDict:(id)a3 isInternal:(BOOL)a4
{
  _BOOL4 v4;
  id v6;
  _QWORD v8[3];
  _QWORD v9[3];
  _QWORD v10[62];
  _QWORD v11[62];

  v4 = a4;
  v6 = objc_alloc_init((Class)NSMutableDictionary);
  v10[0] = CFSTR("adjustedDistance");
  v11[0] = +[NSNumber numberWithUnsignedInteger:](NSNumber, "numberWithUnsignedInteger:", objc_msgSend(a3, "adjustedDistance"));
  v10[1] = CFSTR("airplaneMode");
  v11[1] = +[NSNumber numberWithBool:](NSNumber, "numberWithBool:", objc_msgSend(a3, "airplaneMode"));
  v10[2] = CFSTR("cellAvailable");
  v11[2] = +[NSNumber numberWithBool:](NSNumber, "numberWithBool:", objc_msgSend(a3, "cellAvailable"));
  v10[3] = CFSTR("distanceFromNMinusOneStateChange");
  v11[3] = +[NSNumber numberWithUnsignedInteger:](NSNumber, "numberWithUnsignedInteger:", objc_msgSend(a3, "distanceFromNMinusOneStateChange"));
  v10[4] = CFSTR("distanceFromNMinusTwoStateChange");
  v11[4] = +[NSNumber numberWithUnsignedInteger:](NSNumber, "numberWithUnsignedInteger:", objc_msgSend(a3, "distanceFromNMinusTwoStateChange"));
  v10[5] = CFSTR("distanceToFenceBoundary");
  v11[5] = +[NSNumber numberWithUnsignedInteger:](NSNumber, "numberWithUnsignedInteger:", objc_msgSend(a3, "distanceToFenceBoundary"));
  v10[6] = CFSTR("adjustedDistanceToFenceBoundary");
  v11[6] = +[NSNumber numberWithUnsignedInteger:](NSNumber, "numberWithUnsignedInteger:", objc_msgSend(a3, "adjustedDistanceToFenceBoundary"));
  v10[7] = CFSTR("dominantMotionState");
  v11[7] = +[NSNumber numberWithUnsignedInteger:](NSNumber, "numberWithUnsignedInteger:", objc_msgSend(a3, "dominantMotionState"));
  v10[8] = CFSTR("effectiveRadius");
  v11[8] = +[NSNumber numberWithUnsignedInteger:](NSNumber, "numberWithUnsignedInteger:", objc_msgSend(a3, "effectiveRadius"));
  v10[9] = CFSTR("entryRadius");
  v11[9] = +[NSNumber numberWithUnsignedInteger:](NSNumber, "numberWithUnsignedInteger:", objc_msgSend(a3, "entryRadius"));
  v10[10] = CFSTR("eventLatency");
  v11[10] = +[NSNumber numberWithUnsignedInteger:](NSNumber, "numberWithUnsignedInteger:", objc_msgSend(a3, "eventLatency"));
  v10[11] = CFSTR("timeToInitialStateChange");
  v11[11] = +[NSNumber numberWithUnsignedInteger:](NSNumber, "numberWithUnsignedInteger:", objc_msgSend(a3, "timeToInitialStateChange"));
  v10[12] = CFSTR("currentState");
  v11[12] = +[NSNumber numberWithUnsignedInteger:](NSNumber, "numberWithUnsignedInteger:", objc_msgSend(a3, "currentState"));
  v10[13] = CFSTR("nMinusOneState");
  v11[13] = +[NSNumber numberWithUnsignedInteger:](NSNumber, "numberWithUnsignedInteger:", objc_msgSend(a3, "nMinusOneState"));
  v10[14] = CFSTR("nMinusTwoState");
  v11[14] = +[NSNumber numberWithUnsignedInteger:](NSNumber, "numberWithUnsignedInteger:", objc_msgSend(a3, "nMinusTwoState"));
  v10[15] = CFSTR("nMinusThreeState");
  v11[15] = +[NSNumber numberWithUnsignedInteger:](NSNumber, "numberWithUnsignedInteger:", objc_msgSend(a3, "nMinusThreeState"));
  v10[16] = CFSTR("nMinusOneStateChangeLocationAccuracy");
  v11[16] = +[NSNumber numberWithUnsignedInteger:](NSNumber, "numberWithUnsignedInteger:", objc_msgSend(a3, "nMinusOneStateChangeLocationAccuracy"));
  v10[17] = CFSTR("nMinusTwoStateChangeLocationAccuracy");
  v11[17] = +[NSNumber numberWithUnsignedInteger:](NSNumber, "numberWithUnsignedInteger:", objc_msgSend(a3, "nMinusTwoStateChangeLocationAccuracy"));
  v10[18] = CFSTR("nMinusOneStateChangeLocationProvider");
  v11[18] = +[NSNumber numberWithUnsignedInteger:](NSNumber, "numberWithUnsignedInteger:", objc_msgSend(a3, "nMinusOneStateChangeLocationProvider"));
  v10[19] = CFSTR("nMinusTwoStateChangeLocationProvider");
  v11[19] = +[NSNumber numberWithUnsignedInteger:](NSNumber, "numberWithUnsignedInteger:", objc_msgSend(a3, "nMinusTwoStateChangeLocationProvider"));
  v10[20] = CFSTR("eventType");
  v11[20] = +[NSNumber numberWithUnsignedInteger:](NSNumber, "numberWithUnsignedInteger:", objc_msgSend(a3, "eventType"));
  v10[21] = CFSTR("eventTypeNMinusOneStateChange");
  v11[21] = +[NSNumber numberWithUnsignedInteger:](NSNumber, "numberWithUnsignedInteger:", objc_msgSend(a3, "eventTypeNMinusOneStateChange"));
  v10[22] = CFSTR("eventTypeNMinusTwoStateChange");
  v11[22] = +[NSNumber numberWithUnsignedInteger:](NSNumber, "numberWithUnsignedInteger:", objc_msgSend(a3, "eventTypeNMinusTwoStateChange"));
  v10[23] = CFSTR("exitRadius");
  v11[23] = +[NSNumber numberWithUnsignedInteger:](NSNumber, "numberWithUnsignedInteger:", objc_msgSend(a3, "exitRadius"));
  v10[24] = CFSTR("fenceCategoryType");
  v11[24] = +[NSNumber numberWithUnsignedInteger:](NSNumber, "numberWithUnsignedInteger:", objc_msgSend(a3, "fenceCategoryType"));
  v10[25] = CFSTR("fenceRadius");
  v11[25] = +[NSNumber numberWithUnsignedInteger:](NSNumber, "numberWithUnsignedInteger:", objc_msgSend(a3, "fenceRadius"));
  v10[26] = CFSTR("fenceType");
  v11[26] = +[NSNumber numberWithUnsignedInteger:](NSNumber, "numberWithUnsignedInteger:", objc_msgSend(a3, "fenceType"));
  v10[27] = CFSTR("hasSignificantPrior");
  v11[27] = +[NSNumber numberWithBool:](NSNumber, "numberWithBool:", objc_msgSend(a3, "hasSignificantPrior"));
  v10[28] = CFSTR("isConservativeEntry");
  v11[28] = +[NSNumber numberWithBool:](NSNumber, "numberWithBool:", objc_msgSend(a3, "isConservativeEntry"));
  v10[29] = CFSTR("isEmergencyFence");
  v11[29] = +[NSNumber numberWithBool:](NSNumber, "numberWithBool:", objc_msgSend(a3, "isEmergencyFence"));
  v10[30] = CFSTR("isFreeWake");
  v11[30] = +[NSNumber numberWithBool:](NSNumber, "numberWithBool:", objc_msgSend(a3, "isFreeWake"));
  v10[31] = CFSTR("isHelperFence");
  v11[31] = +[NSNumber numberWithBool:](NSNumber, "numberWithBool:", objc_msgSend(a3, "isHelperFence"));
  v10[32] = CFSTR("isLowPower");
  v11[32] = +[NSNumber numberWithBool:](NSNumber, "numberWithBool:", objc_msgSend(a3, "isLowPower"));
  v10[33] = CFSTR("isThrottledFence");
  v11[33] = +[NSNumber numberWithBool:](NSNumber, "numberWithBool:", objc_msgSend(a3, "isThrottledFence"));
  v10[34] = CFSTR("locationAccuracy");
  v11[34] = +[NSNumber numberWithUnsignedInteger:](NSNumber, "numberWithUnsignedInteger:", objc_msgSend(a3, "locationAccuracy"));
  v10[35] = CFSTR("locationProvider");
  v11[35] = +[NSNumber numberWithUnsignedInteger:](NSNumber, "numberWithUnsignedInteger:", objc_msgSend(a3, "locationProvider"));
  v10[36] = CFSTR("loiDistance");
  objc_msgSend(a3, "loiDistance");
  v11[36] = +[NSNumber numberWithDouble:](NSNumber, "numberWithDouble:");
  v10[37] = CFSTR("loiRadius");
  objc_msgSend(a3, "loiRadius");
  v11[37] = +[NSNumber numberWithDouble:](NSNumber, "numberWithDouble:");
  v10[38] = CFSTR("motionStateBeforeNMinusOneStateChange");
  v11[38] = +[NSNumber numberWithUnsignedInteger:](NSNumber, "numberWithUnsignedInteger:", objc_msgSend(a3, "motionStateBeforeNMinusOneStateChange"));
  v10[39] = CFSTR("motionState");
  v11[39] = +[NSNumber numberWithUnsignedInteger:](NSNumber, "numberWithUnsignedInteger:", objc_msgSend(a3, "motionState"));
  v10[40] = CFSTR("motionStateAfterNMinusOneStateChange");
  v11[40] = +[NSNumber numberWithUnsignedInteger:](NSNumber, "numberWithUnsignedInteger:", objc_msgSend(a3, "motionStateAfterNMinusOneStateChange"));
  v10[41] = CFSTR("motionStateAfterNMinusTwoStateChange");
  v11[41] = +[NSNumber numberWithUnsignedInteger:](NSNumber, "numberWithUnsignedInteger:", objc_msgSend(a3, "motionStateAfterNMinusTwoStateChange"));
  v10[42] = CFSTR("motionStateBeforeStateChange");
  v11[42] = +[NSNumber numberWithUnsignedInteger:](NSNumber, "numberWithUnsignedInteger:", objc_msgSend(a3, "motionStateBeforeStateChange"));
  v10[43] = CFSTR("previousLocationAccuracy");
  v11[43] = +[NSNumber numberWithUnsignedInteger:](NSNumber, "numberWithUnsignedInteger:", objc_msgSend(a3, "previousLocationAccuracy"));
  v10[44] = CFSTR("passcodeLocked");
  v11[44] = +[NSNumber numberWithBool:](NSNumber, "numberWithBool:", objc_msgSend(a3, "passcodeLocked"));
  v10[45] = CFSTR("previousLocationAge");
  v11[45] = +[NSNumber numberWithUnsignedInteger:](NSNumber, "numberWithUnsignedInteger:", objc_msgSend(a3, "previousLocationAge"));
  v10[46] = CFSTR("previousLocationProvider");
  v11[46] = +[NSNumber numberWithUnsignedInteger:](NSNumber, "numberWithUnsignedInteger:", objc_msgSend(a3, "previousLocationProvider"));
  v10[47] = CFSTR("lastHandledLocationAccuracy");
  v11[47] = +[NSNumber numberWithUnsignedInteger:](NSNumber, "numberWithUnsignedInteger:", objc_msgSend(a3, "lastHandledLocationAccuracy"));
  v10[48] = CFSTR("lastHandledLocationAge");
  v11[48] = +[NSNumber numberWithUnsignedInteger:](NSNumber, "numberWithUnsignedInteger:", objc_msgSend(a3, "lastHandledLocationAge"));
  v10[49] = CFSTR("lastHandledLocationProvider");
  v11[49] = +[NSNumber numberWithUnsignedInteger:](NSNumber, "numberWithUnsignedInteger:", objc_msgSend(a3, "lastHandledLocationProvider"));
  v10[50] = CFSTR("reachabilityStatus");
  v11[50] = +[NSNumber numberWithUnsignedInteger:](NSNumber, "numberWithUnsignedInteger:", objc_msgSend(a3, "reachabilityStatus"));
  v10[51] = CFSTR("settledState");
  v11[51] = +[NSNumber numberWithUnsignedInteger:](NSNumber, "numberWithUnsignedInteger:", objc_msgSend(a3, "settledState"));
  v10[52] = CFSTR("signalEnvironmentType");
  v11[52] = +[NSNumber numberWithUnsignedInteger:](NSNumber, "numberWithUnsignedInteger:", objc_msgSend(a3, "signalEnvironmentType"));
  v10[53] = CFSTR("significantFence");
  v11[53] = +[NSNumber numberWithBool:](NSNumber, "numberWithBool:", objc_msgSend(a3, "significantFence"));
  v10[54] = CFSTR("stepsSinceNMinusOneStateChange");
  v11[54] = +[NSNumber numberWithUnsignedInteger:](NSNumber, "numberWithUnsignedInteger:", objc_msgSend(a3, "stepsSinceNMinusOneStateChange"));
  v10[55] = CFSTR("stepsSinceNMinusTwoStateChange");
  v11[55] = +[NSNumber numberWithUnsignedInteger:](NSNumber, "numberWithUnsignedInteger:", objc_msgSend(a3, "stepsSinceNMinusTwoStateChange"));
  v10[56] = CFSTR("timeSinceDominantActivityChange");
  v11[56] = +[NSNumber numberWithUnsignedInteger:](NSNumber, "numberWithUnsignedInteger:", objc_msgSend(a3, "timeSinceDominantActivityChange"));
  v10[57] = CFSTR("timeSinceMotionActivityChange");
  v11[57] = +[NSNumber numberWithUnsignedInteger:](NSNumber, "numberWithUnsignedInteger:", objc_msgSend(a3, "timeSinceMotionActivityChange"));
  v10[58] = CFSTR("timeSinceNMinusOneStateChange");
  v11[58] = +[NSNumber numberWithUnsignedInteger:](NSNumber, "numberWithUnsignedInteger:", objc_msgSend(a3, "timeSinceNMinusOneStateChange"));
  v10[59] = CFSTR("timeSinceNMinusTwoStateChange");
  v11[59] = +[NSNumber numberWithUnsignedInteger:](NSNumber, "numberWithUnsignedInteger:", objc_msgSend(a3, "timeSinceNMinusTwoStateChange"));
  v10[60] = CFSTR("timeSinceWifiRoam");
  v11[60] = +[NSNumber numberWithUnsignedInteger:](NSNumber, "numberWithUnsignedInteger:", objc_msgSend(a3, "timeSinceWifiRoam"));
  v10[61] = CFSTR("wifiAvailable");
  v11[61] = +[NSNumber numberWithBool:](NSNumber, "numberWithBool:", objc_msgSend(a3, "wifiAvailable"));
  objc_msgSend(v6, "addEntriesFromDictionary:", +[NSDictionary dictionaryWithObjects:forKeys:count:](NSDictionary, "dictionaryWithObjects:forKeys:count:", v11, v10, 62));
  if (v4)
  {
    v8[0] = CFSTR("bundleId");
    v9[0] = objc_msgSend(a3, "bundleId");
    v8[1] = CFSTR("loiType");
    v9[1] = +[NSNumber numberWithInteger:](NSNumber, "numberWithInteger:", objc_msgSend(a3, "loiType"));
    v8[2] = CFSTR("hasLoiAtFence");
    v9[2] = +[NSNumber numberWithBool:](NSNumber, "numberWithBool:", objc_msgSend(a3, "hasLoiAtFence"));
    objc_msgSend(v6, "addEntriesFromDictionary:", +[NSDictionary dictionaryWithObjects:forKeys:count:](NSDictionary, "dictionaryWithObjects:forKeys:count:", v9, v8, 3));
  }
  return v6;
}

- (void)promptPossibleFalseExitDetectionUI
{
  int v2;
  int v3;
  std::__shared_weak_count *v4;
  unint64_t *p_shared_owners;
  unint64_t v6;
  NSObject *v7;
  NSDateFormatter *v8;
  NSMutableDictionary *v9;
  __CFUserNotification *v10;
  __CFRunLoopSource *RunLoopSource;
  __CFRunLoop *v12;
  NSObject *v13;
  const char *v14;
  uint8_t *v15;
  const char *v16;
  uint8_t *v17;
  uint64_t v18;
  _DWORD v19[4];
  uint8_t buf[8];
  std::__shared_weak_count *v21;

  sub_100197040();
  if (!sub_10075D288())
    return;
  HIBYTE(v18) = 0;
  sub_1001E4804(buf);
  v2 = sub_1001E4874(*(uint64_t *)buf, "promptPossibleFalseExitDetectionUI", (BOOL *)&v18 + 7);
  v3 = v2;
  v4 = v21;
  if (!v21)
    goto LABEL_6;
  p_shared_owners = (unint64_t *)&v21->__shared_owners_;
  do
    v6 = __ldaxr(p_shared_owners);
  while (__stlxr(v6 - 1, p_shared_owners));
  if (v6)
  {
LABEL_6:
    if (v2)
      goto LABEL_7;
LABEL_15:
    v8 = objc_opt_new(NSDateFormatter);
    -[NSDateFormatter setLocale:](v8, "setLocale:", +[NSLocale autoupdatingCurrentLocale](NSLocale, "autoupdatingCurrentLocale"));
    -[NSDateFormatter setDateStyle:](v8, "setDateStyle:", 1);
    -[NSDateFormatter setTimeStyle:](v8, "setTimeStyle:", 1);
    v9 = objc_opt_new(NSMutableDictionary);
    -[NSMutableDictionary setObject:forKeyedSubscript:](v9, "setObject:forKeyedSubscript:", CFSTR("Detected Possible False Exit"), kCFUserNotificationAlertHeaderKey);
    -[NSMutableDictionary setObject:forKeyedSubscript:](v9, "setObject:forKeyedSubscript:", +[NSString stringWithFormat:](NSString, "stringWithFormat:", CFSTR("Please file a radar if you did not intentionally exit and reenter home @ %@"), -[NSDateFormatter stringFromDate:](v8, "stringFromDate:", +[NSDate date](NSDate, "date"))), kCFUserNotificationAlertMessageKey);
    -[NSMutableDictionary setObject:forKeyedSubscript:](v9, "setObject:forKeyedSubscript:", CFSTR("Tap-to-Radar"), kCFUserNotificationAlternateButtonTitleKey);
    -[NSMutableDictionary setObject:forKeyedSubscript:](v9, "setObject:forKeyedSubscript:", CFSTR("Dismiss"), kCFUserNotificationDefaultButtonTitleKey);
    v10 = CFUserNotificationCreate(kCFAllocatorDefault, 0.0, 0, 0, (CFDictionaryRef)v9);
    if (v10)
    {
      RunLoopSource = CFUserNotificationCreateRunLoopSource(kCFAllocatorDefault, v10, (CFUserNotificationCallBack)sub_100FF059C, 0);
      if (RunLoopSource)
      {
        v12 = (__CFRunLoop *)sub_100193530();
        CFRunLoopAddSource(v12, RunLoopSource, kCFRunLoopCommonModes);
        if (qword_1022A0060 != -1)
          dispatch_once(&qword_1022A0060, &stru_102198880);
        v13 = qword_1022A0068;
        if (os_log_type_enabled((os_log_t)qword_1022A0068, OS_LOG_TYPE_DEFAULT))
        {
          *(_WORD *)buf = 0;
          _os_log_impl((void *)&_mh_execute_header, v13, OS_LOG_TYPE_DEFAULT, "#FenceMetrics, promptPossibleFalseExitDetectionUI", buf, 2u);
        }
        if (sub_1001BFF7C(115, 2))
        {
          bzero(buf, 0x65CuLL);
          if (qword_1022A0060 != -1)
            dispatch_once(&qword_1022A0060, &stru_102198880);
          LOWORD(v19[0]) = 0;
          LODWORD(v18) = 2;
          _os_log_send_and_compose_impl(2, 0, buf, 1628, &_mh_execute_header, qword_1022A0068, 0, "#FenceMetrics, promptPossibleFalseExitDetectionUI", v19, v18);
          v17 = (uint8_t *)v16;
          sub_100512490("Generic", 1, 0, 2, "-[CLFenceStateChangeAnalytics promptPossibleFalseExitDetectionUI]", "%s\n", v16);
          if (v17 != buf)
            free(v17);
        }
        v10 = RunLoopSource;
      }
      CFRelease(v10);
    }
    return;
  }
  ((void (*)(std::__shared_weak_count *))v4->__on_zero_shared)(v4);
  std::__shared_weak_count::__release_weak(v4);
  if (!v3)
    goto LABEL_15;
LABEL_7:
  if (qword_1022A0060 != -1)
    dispatch_once(&qword_1022A0060, &stru_102198880);
  v7 = qword_1022A0068;
  if (os_log_type_enabled((os_log_t)qword_1022A0068, OS_LOG_TYPE_DEFAULT))
  {
    *(_DWORD *)buf = 67109120;
    *(_DWORD *)&buf[4] = HIBYTE(v18);
    _os_log_impl((void *)&_mh_execute_header, v7, OS_LOG_TYPE_DEFAULT, "#FenceMetrics, promptPossibleFalseExitDetectionUI, override, %d", buf, 8u);
  }
  if (sub_1001BFF7C(115, 2))
  {
    bzero(buf, 0x65CuLL);
    if (qword_1022A0060 != -1)
      dispatch_once(&qword_1022A0060, &stru_102198880);
    v19[0] = 67109120;
    v19[1] = HIBYTE(v18);
    _os_log_send_and_compose_impl(2, 0, buf, 1628, &_mh_execute_header, qword_1022A0068, 0, "#FenceMetrics, promptPossibleFalseExitDetectionUI, override, %d", v19);
    v15 = (uint8_t *)v14;
    sub_100512490("Generic", 1, 0, 2, "-[CLFenceStateChangeAnalytics promptPossibleFalseExitDetectionUI]", "%s\n", v14);
    if (v15 != buf)
      free(v15);
  }
  if (HIBYTE(v18))
    goto LABEL_15;
}

- (void)conditionsSatisfiedForFalseExitFromNotification:(__int128 *)a3 handler:(uint64_t)a4
{
  id v7;
  void *v8;
  id v9;
  double v10;
  double v11;
  double v12;
  NSDateComponents *v13;
  id v14;
  void *v15;
  _QWORD v16[5];
  char v17[248];
  void *__dst[2];
  char v19;
  void *v20;
  char v21;
  void *v22;
  char v23;
  void *v24;
  char v25;
  id v26;
  void *__p;
  void *v28;

  sub_100197040();
  if ((sub_10075D288() & 1) != 0 && (sub_100197040(), (sub_1000C4240() & 1) != 0))
  {
    sub_1004E5748((char *)__dst, a3);
    v7 = objc_alloc((Class)NSString);
    if (v21 >= 0)
      v8 = &v20;
    else
      v8 = v20;
    v9 = objc_msgSend(*(id *)(a1 + 56), "historicalFenceStateForFenceName:", objc_msgSend(v7, "initWithCString:encoding:", v8, 4));
    if (objc_msgSend(v9, "currentState")
      || objc_msgSend(v9, "nMinusOneState") != 1
      || objc_msgSend(v9, "nMinusTwoState")
      || (objc_msgSend(objc_msgSend(v9, "timeOfNMinusOneStateChange"), "timeIntervalSinceDate:", objc_msgSend(v9, "timeOfNMinusTwoStateChange")), v11 = v10, objc_msgSend(objc_msgSend(v9, "timeOfCurrentStateChange"), "timeIntervalSinceDate:", objc_msgSend(v9, "timeOfNMinusOneStateChange")), v11 <= 7200.0)|| v12 > 240.0|| (v13 = -[NSCalendar components:fromDate:](+[NSCalendar currentCalendar](NSCalendar, "currentCalendar"), "components:fromDate:", 32, objc_msgSend(v9, "timeOfCurrentStateChange")), -[NSDateComponents hour](v13, "hour") >= 5)&& -[NSDateComponents hour](v13, "hour") <= 22)
    {
      (*(void (**)(uint64_t, _QWORD, _QWORD))(a4 + 16))(a4, 0, 0);
    }
    else
    {
      sub_1004E5748(v17, (__int128 *)__dst);
      v14 = +[CLFenceAnalyticsManager regionForFence:](CLFenceAnalyticsManager, "regionForFence:", v17);
      sub_1004E2BD0((uint64_t)v17);
      v15 = *(void **)(a1 + 56);
      v16[0] = _NSConcreteStackBlock;
      v16[1] = 3221225472;
      v16[2] = sub_100FF0AE4;
      v16[3] = &unk_1021987E0;
      v16[4] = a4;
      objc_msgSend(v15, "fetchLocationOfInterestForRegion:handler:", v14, v16);
    }
    if (__p)
    {
      v28 = __p;
      operator delete(__p);
    }

    if (v25 < 0)
      operator delete(v24);
    if (v23 < 0)
      operator delete(v22);
    if (v21 < 0)
      operator delete(v20);
    if (v19 < 0)
      operator delete(__dst[0]);
  }
  else
  {
    (*(void (**)(uint64_t, _QWORD, _QWORD))(a4 + 16))(a4, 0, 0);
  }
}

- (uint64_t)evaluatePossibleFalseExitFromNotification:(__int128 *)a3
{
  _QWORD v6[5];
  char v7[1608];
  char v8[1608];

  sub_1008A44AC(v8, a3);
  v6[0] = _NSConcreteStackBlock;
  v6[1] = 3321888768;
  v6[2] = sub_100FF0BE0;
  v6[3] = &unk_102198808;
  sub_1008A44AC(v7, a3);
  v6[4] = a1;
  objc_msgSend(a1, "conditionsSatisfiedForFalseExitFromNotification:handler:", v8, v6);
  sub_100115F78((uint64_t)v8);
  return sub_100115F78((uint64_t)v7);
}

- (uint64_t)submitAllMetricsFromNotification:(__int128 *)a3
{
  uint64_t v5;
  _QWORD v7[5];
  char v8;
  char v9[1608];

  sub_100197040();
  v5 = sub_10075D288();
  sub_1008A44AC(v9, a3);
  v7[0] = _NSConcreteStackBlock;
  v7[1] = 3221225472;
  v7[2] = sub_100FF10BC;
  v7[3] = &unk_102198860;
  v7[4] = a1;
  v8 = v5;
  objc_msgSend(a1, "extractAnalyticsFromNotification:isInternal:handler:", v9, v5, v7);
  return sub_100115F78((uint64_t)v9);
}

- (CLIntersiloUniverse)universe
{
  return self->_universe;
}

- (void)setUniverse:(id)a3
{
  objc_setProperty_nonatomic(self, a2, a3, 48);
}

- (CLFenceAnalyticsManager)fenceAnalyticsManager
{
  return self->_fenceAnalyticsManager;
}

- (void)setFenceAnalyticsManager:(id)a3
{
  objc_setProperty_nonatomic(self, a2, a3, 56);
}

@end
