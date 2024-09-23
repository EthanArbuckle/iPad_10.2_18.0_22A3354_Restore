@implementation CLElevationProfileEstimator

- (CLElevationProfileEstimator)initWithContextManager:(id)a3
{
  CLElevationProfileEstimator *v4;
  uint64_t v5;
  uint64_t v6;
  NSObject *v7;
  const char *v9;
  uint8_t *v10;
  unsigned __int8 v11[16];
  objc_super v12;
  uint8_t buf[4];
  float v14;
  double v15;

  v12.receiver = self;
  v12.super_class = (Class)CLElevationProfileEstimator;
  v4 = -[CLElevationProfileEstimator init](&v12, "init");
  if (v4)
  {
    sub_1018BEA14(buf, "ElevationProfileMeanSeaLevelPressureSamplingPeriod", &qword_101BBF520, 0);
    v4->_meanSeaLevelPressureSamplingPeriod = v15;
    sub_1018BEA14(buf, "ElevationProfileDataDecimationPeriod", &qword_101BBF528, 0);
    v4->_decimationPeriod = v15;
    sub_1018BEA14(buf, "ElevationLocationFilterWindowSize", &qword_101BBF530, 0);
    v4->_windowSize = v15;
    v11[0] = 0;
    sub_1018BF25C(buf, "ElevationVerbose", v11, 0);
    v4->_isVerboseLogging = buf[1];
    sub_1018C2254(buf, "ElevationProfileElevationInitialVar", &dword_101BBF538, 0);
    v4->_elevationInitialVar = v14;
    sub_1018C2254(buf, "ElevationProfileElevationProcessNoiseVar", &dword_101BBF53C, 0);
    v4->_elevationProcessNoiseVar = v14;
    sub_1018C2254(buf, "ElevationProfileMeanSeaLevelPressureInitialVar", &dword_101BBF540, 0);
    v4->_meanSeaLevelPressureInitialVar = v14;
    sub_1018C2254(buf, "ElevationProfileMeanSeaLevelPressureProcessNoiseVar", &dword_101BBF544, 0);
    v4->_meanSeaLevelPressureProcessNoiseVar = v14;
    *(_DWORD *)v11 = 1101004800;
    sub_1018C2254(buf, "ElevationProfileLocationMaxVerticalAccuracy", v11, 0);
    v4->_locationMaxVerticalAccuracy = v14;
    sub_1018BEA14(buf, "ElevationProfileMaxOutlierRatio", &qword_101BBF548, 0);
    v4->_maxOutlierRatio = v15;
    v4->_elevationBatchSize = vcvtad_u64_f64((v4->_meanSeaLevelPressureSamplingPeriod + v4->_meanSeaLevelPressureSamplingPeriod)/ 2.56);
    sub_1018C1A0C(buf, "ElevationProfileLocationBatchSize", dword_101BBF550, 0);
    *(float *)&v4->_locationBatchSize = v14;
    v4->_refreshMslpXpcTaskScheduleTimestamp = 1.79769313e308;
    v6 = objc_opt_class(CLContextManagerElevationProfile, v5);
    if ((objc_opt_isKindOfClass(a3, v6) & 1) != 0)
    {
      v4->_elevationProfileContextManager = (CLContextManagerElevationProfile *)a3;
    }
    else
    {
      if (qword_10229FE80 != -1)
        dispatch_once(&qword_10229FE80, &stru_102150F80);
      v7 = qword_10229FE88;
      if (os_log_type_enabled((os_log_t)qword_10229FE88, OS_LOG_TYPE_ERROR))
      {
        *(_WORD *)buf = 0;
        _os_log_impl((void *)&_mh_execute_header, v7, OS_LOG_TYPE_ERROR, "initWithContextManager,elevation profile context manager does not exist!", buf, 2u);
      }
      if (sub_1001BFF7C(115, 0))
      {
        bzero(buf, 0x65CuLL);
        if (qword_10229FE80 != -1)
          dispatch_once(&qword_10229FE80, &stru_102150F80);
        *(_WORD *)v11 = 0;
        _os_log_send_and_compose_impl(2, 0, buf, 1628, &_mh_execute_header, qword_10229FE88, 16, "initWithContextManager,elevation profile context manager does not exist!", v11, 2);
        v10 = (uint8_t *)v9;
        sub_100512490("Generic", 1, 0, 0, "-[CLElevationProfileEstimator initWithContextManager:]", "%s\n", v9);
        if (v10 != buf)
          free(v10);
      }
    }
  }
  return v4;
}

- (void)_setXPCCriteriaForActivity:(id)a3 withDescription:(id)a4
{
  xpc_object_t v6;

  v6 = xpc_dictionary_create(0, 0, 0);
  xpc_dictionary_set_string(v6, XPC_ACTIVITY_GROUP_NAME, (const char *)objc_msgSend(a4, "UTF8String"));
  xpc_dictionary_set_int64(v6, XPC_ACTIVITY_GROUP_CONCURRENCY_LIMIT, 1);
  xpc_dictionary_set_BOOL(v6, XPC_ACTIVITY_REPEATING, 0);
  xpc_dictionary_set_string(v6, XPC_ACTIVITY_PRIORITY, XPC_ACTIVITY_PRIORITY_UTILITY);
  xpc_dictionary_set_BOOL(v6, XPC_ACTIVITY_CPU_INTENSIVE, 1);
  xpc_dictionary_set_BOOL(v6, XPC_ACTIVITY_MEMORY_INTENSIVE, 1);
  xpc_dictionary_set_BOOL(v6, XPC_ACTIVITY_ALLOW_BATTERY, 1);
  xpc_activity_set_criteria((xpc_activity_t)a3, v6);
  xpc_release(v6);
}

- (void)_sendHistoricalMeanSeaLevelPressureWithKSEstimatesBuffer:(id)a3 andCompletionBlock:(id)a4
{
  int v7;
  uint64_t v8;
  unint64_t v9;
  double v10;
  __objc2_class *v11;
  double v12;
  double v13;
  double v14;
  double v15;
  id v16;
  NSObject *isa;
  uint64_t v18;
  float v19;
  float v20;
  float v21;
  double v22;
  double v23;
  float v24;
  double v25;
  double v26;
  double v27;
  double v28;
  float v29;
  double v30;
  float v31;
  float v32;
  NSObject *v33;
  uint64_t v34;
  uint64_t v35;
  float v36;
  double v37;
  float v38;
  uint64_t v39;
  uint64_t v40;
  uint64_t v41;
  float v42;
  double v43;
  float v44;
  const char *v45;
  uint8_t *v46;
  double v47;
  double v48;
  double v49;
  double v50;
  float v51;
  float v52;
  float v53;
  CLMeanSeaLevelPressureData *v54;
  float v55;
  float v56;
  NSObject *v57;
  uint64_t v58;
  uint64_t v59;
  double v60;
  double v61;
  double v62;
  double v63;
  double v64;
  double v65;
  double v66;
  float v67;
  float v68;
  float v69;
  double v70;
  float v71;
  float v72;
  float v73;
  __objc2_class *v74;
  uint64_t v75;
  uint64_t v76;
  float v77;
  double v78;
  float v79;
  double v80;
  float v81;
  double v82;
  float v83;
  double v84;
  float v85;
  double v86;
  float v87;
  const char *v88;
  uint8_t *v89;
  uint64_t v90;
  uint64_t v91;
  uint64_t v92;
  double v93;
  double v94;
  double v95;
  double v96;
  double v97;
  const char *v98;
  uint8_t *v99;
  CLMeanSeaLevelPressureData *v100;
  float v101;
  float v102;
  NSObject *v103;
  uint64_t v104;
  uint64_t v105;
  double v106;
  double v107;
  double v108;
  double v109;
  double v110;
  id v111;
  uint64_t v112;
  uint64_t v113;
  uint64_t v114;
  double v115;
  double v116;
  double v117;
  double v118;
  double v119;
  const char *v120;
  uint8_t *v121;
  double v122;
  double v123;
  double v124;
  double v125;
  double v126;
  double v127;
  double v128;
  id v129;
  uint64_t v130;
  id v131;
  double v132;
  double v133;
  uint64_t v134;
  int v135;
  uint64_t v136;
  __int16 v137;
  double v138;
  __int16 v139;
  double v140;
  __int16 v141;
  double v142;
  __int16 v143;
  double v144;
  __int16 v145;
  double v146;
  __int16 v147;
  double v148;
  uint8_t buf[4];
  uint64_t v150;
  __int16 v151;
  double v152;
  __int16 v153;
  double v154;
  __int16 v155;
  double v156;
  __int16 v157;
  double v158;
  __int16 v159;
  double v160;
  __int16 v161;
  double v162;

  v131 = objc_alloc_init((Class)NSMutableArray);
  if (!objc_msgSend(a3, "count"))
  {
    (*((void (**)(id, id))a4 + 2))(a4, v131);

    return;
  }
  v7 = objc_msgSend(a3, "count");
  v8 = (v7 - 1);
  if (v7 - 1 < 0)
    goto LABEL_49;
  v129 = a4;
  v9 = 0;
  v10 = 0.0;
  v11 = DefaultObserver;
  v130 = 134218752;
  v12 = 0.0;
  v13 = 0.0;
  v14 = 0.0;
  v15 = 0.0;
  do
  {
    v16 = objc_msgSend(a3, "objectAtIndex:", v8);
    if (self->_isVerboseLogging)
    {
      if (qword_10229FE80 != -1)
        dispatch_once(&qword_10229FE80, &stru_102150F80);
      isa = v11[93].isa;
      if (os_log_type_enabled(isa, OS_LOG_TYPE_DEBUG))
      {
        objc_msgSend(v16, "timestamp");
        v134 = v18;
        objc_msgSend(v16, "fState");
        v133 = v19;
        objc_msgSend(v16, "fState");
        v132 = v20;
        objc_msgSend(v16, "fCovariance");
        v22 = v21;
        objc_msgSend(v16, "fCovariance");
        v23 = v14;
        v25 = v24;
        objc_msgSend(v16, "fCovariance");
        v26 = v13;
        v27 = v12;
        v28 = v10;
        v30 = v29;
        objc_msgSend(v16, "fCovariance");
        *(_DWORD *)buf = 134219520;
        v150 = v134;
        v151 = 2048;
        v152 = v133;
        v153 = 2048;
        v154 = v132;
        v155 = 2048;
        v156 = v22;
        v157 = 2048;
        v158 = v25;
        v14 = v23;
        v159 = 2048;
        v160 = v30;
        v10 = v28;
        v12 = v27;
        v13 = v26;
        v161 = 2048;
        v162 = v31;
        _os_log_impl((void *)&_mh_execute_header, isa, OS_LOG_TYPE_DEBUG, "historical mslp estimation,timestamp,%f,elevation,%f,mslp,%f,P00,%f,P01,%f,P10,%f,P11,%f", buf, 0x48u);
      }
      if (sub_1001BFF7C(115, 2))
      {
        bzero(buf, 0x65CuLL);
        v126 = v14;
        v127 = v10;
        v124 = v15;
        if (qword_10229FE80 != -1)
          dispatch_once(&qword_10229FE80, &stru_102150F80);
        v74 = v11[93].isa;
        objc_msgSend(v16, "timestamp");
        v76 = v75;
        objc_msgSend(v16, "fState");
        v78 = v77;
        objc_msgSend(v16, "fState");
        v80 = v79;
        objc_msgSend(v16, "fCovariance");
        v82 = v81;
        objc_msgSend(v16, "fCovariance");
        v84 = v83;
        objc_msgSend(v16, "fCovariance");
        v86 = v85;
        objc_msgSend(v16, "fCovariance");
        v135 = 134219520;
        v136 = v76;
        v137 = 2048;
        v138 = v78;
        v139 = 2048;
        v140 = v80;
        v141 = 2048;
        v142 = v82;
        v143 = 2048;
        v144 = v84;
        v145 = 2048;
        v146 = v86;
        v147 = 2048;
        v148 = v87;
        LODWORD(v122) = 72;
        _os_log_send_and_compose_impl(2, 0, buf, 1628, &_mh_execute_header, v74, 2, "historical mslp estimation,timestamp,%f,elevation,%f,mslp,%f,P00,%f,P01,%f,P10,%f,P11,%f", COERCE_DOUBLE(&v135), v122, v124, v126, v127, *(double *)&v129, *(double *)&v130);
        v89 = (uint8_t *)v88;
        sub_100512490("Generic", 1, 0, 2, "-[CLElevationProfileEstimator _sendHistoricalMeanSeaLevelPressureWithKSEstimatesBuffer:andCompletionBlock:]", "%s\n", v88);
        if (v89 != buf)
          free(v89);
        v11 = DefaultObserver;
        v14 = v125;
        v10 = v128;
        v15 = v123;
      }
    }
    objc_msgSend(v16, "fCovariance");
    if (v32 < 0.0)
    {
      if (qword_10229FE80 != -1)
        dispatch_once(&qword_10229FE80, &stru_102150F80);
      v33 = v11[93].isa;
      if (os_log_type_enabled(v33, OS_LOG_TYPE_DEFAULT))
      {
        objc_msgSend(v16, "timestamp");
        v35 = v34;
        objc_msgSend(v16, "fState");
        v37 = v36;
        objc_msgSend(v16, "fCovariance");
        *(_DWORD *)buf = 134218496;
        v150 = v35;
        v151 = 2048;
        v152 = v37;
        v153 = 2048;
        v154 = v38;
        _os_log_impl((void *)&_mh_execute_header, v33, OS_LOG_TYPE_DEFAULT, "warning: negative mslp variance,timestamp,%f,mslp,%f,var,%f", buf, 0x20u);
      }
      if (sub_1001BFF7C(115, 2))
      {
        bzero(buf, 0x65CuLL);
        if (qword_10229FE80 != -1)
          dispatch_once(&qword_10229FE80, &stru_102150F80);
        v39 = qword_10229FE88;
        objc_msgSend(v16, "timestamp");
        v41 = v40;
        objc_msgSend(v16, "fState");
        v43 = v42;
        objc_msgSend(v16, "fCovariance");
        v135 = 134218496;
        v136 = v41;
        v137 = 2048;
        v138 = v43;
        v139 = 2048;
        v140 = v44;
        LODWORD(v122) = 32;
        _os_log_send_and_compose_impl(2, 0, buf, 1628, &_mh_execute_header, v39, 0, "warning: negative mslp variance,timestamp,%f,mslp,%f,var,%f", COERCE_DOUBLE(&v135), v122, v123);
        v46 = (uint8_t *)v45;
        sub_100512490("Generic", 1, 0, 2, "-[CLElevationProfileEstimator _sendHistoricalMeanSeaLevelPressureWithKSEstimatesBuffer:andCompletionBlock:]", "%s\n", v45);
        if (v46 != buf)
          free(v46);
      }
LABEL_29:
      v11 = DefaultObserver;
      goto LABEL_30;
    }
    objc_msgSend(v16, "timestamp");
    v48 = v47;
    if (v9)
    {
      v49 = v10 - v47;
      if (v10 - v48 < self->_meanSeaLevelPressureSamplingPeriod)
      {
        objc_msgSend(v16, "timestamp", v49);
        v12 = v12 + v50;
        objc_msgSend(v16, "fState");
        v13 = v13 + v51;
        objc_msgSend(v16, "fCovariance");
        v14 = v14 + sqrtf(v52);
        objc_msgSend(v16, "fState");
        v15 = v15 + v53;
        ++v9;
        goto LABEL_30;
      }
      v54 = objc_alloc_init(CLMeanSeaLevelPressureData);
      -[CLMeanSeaLevelPressureData setTimestamp:](v54, "setTimestamp:", v12 / (double)v9);
      -[CLMeanSeaLevelPressureData setMeanSeaLevelPressure:](v54, "setMeanSeaLevelPressure:", v13 / (double)v9);
      -[CLMeanSeaLevelPressureData setUncertainty:](v54, "setUncertainty:", v14 / (double)v9);
      v55 = v15 / (double)v9;
      v56 = v13 / (double)v9;
      -[CLMeanSeaLevelPressureData setPressureMeasurement:](v54, "setPressureMeasurement:", sub_1013D3670(v55, v56));
      objc_msgSend(v131, "addObject:", v54);
      if (qword_10229FE80 != -1)
        dispatch_once(&qword_10229FE80, &stru_102150F80);
      v57 = v11[93].isa;
      if (os_log_type_enabled(v57, OS_LOG_TYPE_DEBUG))
      {
        -[CLMeanSeaLevelPressureData timestamp](v54, "timestamp");
        v59 = v58;
        -[CLMeanSeaLevelPressureData meanSeaLevelPressure](v54, "meanSeaLevelPressure");
        v61 = v60;
        -[CLMeanSeaLevelPressureData uncertainty](v54, "uncertainty");
        v63 = v62;
        -[CLMeanSeaLevelPressureData pressureMeasurement](v54, "pressureMeasurement");
        *(_DWORD *)buf = v130;
        v150 = v59;
        v151 = 2048;
        v152 = v61;
        v153 = 2048;
        v154 = v63;
        v155 = 2048;
        v156 = v64;
        _os_log_impl((void *)&_mh_execute_header, v57, OS_LOG_TYPE_DEBUG, "historical mslp array element,timestamp,%f,meanSeaLevelPressure,%f,uncertainty,%f,pressureMeasurement,%f", buf, 0x2Au);
      }
      if (sub_1001BFF7C(115, 2))
      {
        bzero(buf, 0x65CuLL);
        if (qword_10229FE80 != -1)
          dispatch_once(&qword_10229FE80, &stru_102150F80);
        v90 = qword_10229FE88;
        -[CLMeanSeaLevelPressureData timestamp](v54, "timestamp");
        v92 = v91;
        -[CLMeanSeaLevelPressureData meanSeaLevelPressure](v54, "meanSeaLevelPressure");
        v94 = v93;
        -[CLMeanSeaLevelPressureData uncertainty](v54, "uncertainty");
        v96 = v95;
        -[CLMeanSeaLevelPressureData pressureMeasurement](v54, "pressureMeasurement");
        v135 = v130;
        v136 = v92;
        v137 = 2048;
        v138 = v94;
        v139 = 2048;
        v140 = v96;
        v141 = 2048;
        v142 = v97;
        LODWORD(v122) = 42;
        _os_log_send_and_compose_impl(2, 0, buf, 1628, &_mh_execute_header, v90, 2, "historical mslp array element,timestamp,%f,meanSeaLevelPressure,%f,uncertainty,%f,pressureMeasurement,%f", COERCE_DOUBLE(&v135), v122, v123, v125);
        v99 = (uint8_t *)v98;
        sub_100512490("Generic", 1, 0, 2, "-[CLElevationProfileEstimator _sendHistoricalMeanSeaLevelPressureWithKSEstimatesBuffer:andCompletionBlock:]", "%s\n", v98);
        if (v99 != buf)
          free(v99);
      }

      objc_msgSend(v16, "timestamp");
      v10 = v65;
      objc_msgSend(v16, "timestamp");
      v12 = v66;
      objc_msgSend(v16, "fState");
      v13 = v67;
      objc_msgSend(v16, "fCovariance");
      v14 = sqrtf(v68);
      objc_msgSend(v16, "fState");
      v15 = v69;
      v9 = 1;
      goto LABEL_29;
    }
    objc_msgSend(v16, "timestamp");
    v12 = v70;
    objc_msgSend(v16, "fState");
    v13 = v71;
    objc_msgSend(v16, "fCovariance");
    v14 = sqrtf(v72);
    objc_msgSend(v16, "fState");
    v15 = v73;
    v9 = 1;
    v10 = v48;
LABEL_30:
    --v7;
    --v8;
  }
  while (v7 > 0);
  a4 = v129;
  if (v9)
  {
    v100 = objc_alloc_init(CLMeanSeaLevelPressureData);
    -[CLMeanSeaLevelPressureData setTimestamp:](v100, "setTimestamp:", v12 / (double)v9);
    -[CLMeanSeaLevelPressureData setMeanSeaLevelPressure:](v100, "setMeanSeaLevelPressure:", v13 / (double)v9);
    -[CLMeanSeaLevelPressureData setUncertainty:](v100, "setUncertainty:", v14 / (double)v9);
    v101 = v15 / (double)v9;
    v102 = v13 / (double)v9;
    -[CLMeanSeaLevelPressureData setPressureMeasurement:](v100, "setPressureMeasurement:", sub_1013D3670(v101, v102));
    objc_msgSend(v131, "addObject:", v100);
    if (qword_10229FE80 != -1)
      dispatch_once(&qword_10229FE80, &stru_102150F80);
    v103 = v11[93].isa;
    if (os_log_type_enabled(v103, OS_LOG_TYPE_DEBUG))
    {
      -[CLMeanSeaLevelPressureData timestamp](v100, "timestamp");
      v105 = v104;
      -[CLMeanSeaLevelPressureData meanSeaLevelPressure](v100, "meanSeaLevelPressure");
      v107 = v106;
      -[CLMeanSeaLevelPressureData uncertainty](v100, "uncertainty");
      v109 = v108;
      -[CLMeanSeaLevelPressureData pressureMeasurement](v100, "pressureMeasurement");
      *(_DWORD *)buf = v130;
      v150 = v105;
      v151 = 2048;
      v152 = v107;
      v153 = 2048;
      v154 = v109;
      v155 = 2048;
      v156 = v110;
      _os_log_impl((void *)&_mh_execute_header, v103, OS_LOG_TYPE_DEBUG, "historical mslp array element,timestamp,%f,meanSeaLevelPressure,%f,uncertainty,%f,pressureMeasurement,%f", buf, 0x2Au);
    }
    if (sub_1001BFF7C(115, 2))
    {
      bzero(buf, 0x65CuLL);
      if (qword_10229FE80 != -1)
        dispatch_once(&qword_10229FE80, &stru_102150F80);
      v112 = qword_10229FE88;
      -[CLMeanSeaLevelPressureData timestamp](v100, "timestamp");
      v114 = v113;
      -[CLMeanSeaLevelPressureData meanSeaLevelPressure](v100, "meanSeaLevelPressure");
      v116 = v115;
      -[CLMeanSeaLevelPressureData uncertainty](v100, "uncertainty");
      v118 = v117;
      -[CLMeanSeaLevelPressureData pressureMeasurement](v100, "pressureMeasurement");
      v135 = v130;
      v136 = v114;
      v137 = 2048;
      v138 = v116;
      v139 = 2048;
      v140 = v118;
      v141 = 2048;
      v142 = v119;
      LODWORD(v122) = 42;
      _os_log_send_and_compose_impl(2, 0, buf, 1628, &_mh_execute_header, v112, 2, "historical mslp array element,timestamp,%f,meanSeaLevelPressure,%f,uncertainty,%f,pressureMeasurement,%f", COERCE_DOUBLE(&v135), v122, v123, v125);
      v121 = (uint8_t *)v120;
      sub_100512490("Generic", 1, 0, 2, "-[CLElevationProfileEstimator _sendHistoricalMeanSeaLevelPressureWithKSEstimatesBuffer:andCompletionBlock:]", "%s\n", v120);
      if (v121 != buf)
        free(v121);
      a4 = v129;
    }

  }
LABEL_49:
  v111 = objc_msgSend(objc_msgSend(objc_msgSend(v131, "reverseObjectEnumerator"), "allObjects"), "mutableCopy");
  objc_msgSend(v131, "removeAllObjects");
  objc_msgSend(v131, "addObjectsFromArray:", v111);
  (*((void (**)(id, id))a4 + 2))(a4, v131);

}

- (void)registerAndRunXPCActivity:(id)a3 withActivityIdentifier:(id)a4 andDescription:(id)a5
{
  _QWORD handler[7];

  handler[0] = _NSConcreteStackBlock;
  handler[1] = 3221225472;
  handler[2] = sub_10074962C;
  handler[3] = &unk_102150E48;
  handler[4] = self;
  handler[5] = a5;
  handler[6] = a3;
  xpc_activity_register((const char *)objc_msgSend(a4, "UTF8String"), XPC_ACTIVITY_CHECK_IN, handler);
}

- (void)sendAnalyticsEventWithXpcTaskWaitingTime:(double)a3
{
  NSObject *v4;
  const char *v5;
  uint8_t *v6;
  _QWORD v7[5];
  int v8;
  double v9;
  uint8_t buf[4];
  double v11;

  if (qword_10229FE80 != -1)
    dispatch_once(&qword_10229FE80, &stru_102150F80);
  v4 = qword_10229FE88;
  if (os_log_type_enabled((os_log_t)qword_10229FE88, OS_LOG_TYPE_DEFAULT))
  {
    *(_DWORD *)buf = 134217984;
    v11 = a3;
    _os_log_impl((void *)&_mh_execute_header, v4, OS_LOG_TYPE_DEFAULT, "sent refresh mslp xpc task waiting time to CoreAnalytics,waitingTime,%f", buf, 0xCu);
  }
  if (sub_1001BFF7C(115, 2))
  {
    bzero(buf, 0x65CuLL);
    if (qword_10229FE80 != -1)
      dispatch_once(&qword_10229FE80, &stru_102150F80);
    v8 = 134217984;
    v9 = a3;
    _os_log_send_and_compose_impl(2, 0, buf, 1628, &_mh_execute_header, qword_10229FE88, 0, "sent refresh mslp xpc task waiting time to CoreAnalytics,waitingTime,%f", COERCE_DOUBLE(&v8));
    v6 = (uint8_t *)v5;
    sub_100512490("Generic", 1, 0, 2, "-[CLElevationProfileEstimator sendAnalyticsEventWithXpcTaskWaitingTime:]", "%s\n", v5);
    if (v6 != buf)
      free(v6);
  }
  v7[0] = _NSConcreteStackBlock;
  v7[1] = 3221225472;
  v7[2] = sub_100749B44;
  v7[3] = &unk_102131FE8;
  *(double *)&v7[4] = a3;
  AnalyticsSendEventLazy(CFSTR("com.apple.Motion.Altimeter.RefreshMslpXpcTaskExecuteEvent"), v7);
}

- (void)computeHistoricalMeanSeaLevelPressureWithStartTime:(double)a3 andEndTime:(double)a4 andCompletionBlock:(id)a5
{
  uint64_t v9;

  self->_refreshMslpXpcTaskScheduleTimestamp = CFAbsoluteTimeGetCurrent();
  -[CLContextManagerElevationProfileBase setRegisteredXPCTaskMSLP:](self->_elevationProfileContextManager, "setRegisteredXPCTaskMSLP:", 1, _NSConcreteStackBlock, 3221225472, sub_100749C70, &unk_102150E98, self, a5, *(_QWORD *)&a3, *(_QWORD *)&a4);
  -[CLElevationProfileEstimator registerAndRunXPCActivity:withActivityIdentifier:andDescription:](self, "registerAndRunXPCActivity:withActivityIdentifier:andDescription:", &v9, +[NSString stringWithUTF8String:](NSString, "stringWithUTF8String:", "com.apple.altimeter.historicalmslp"), CFSTR("mslp estimation"));
}

- (BOOL)_queryVisitStateByTimestamp:(double)a3 withHistoricalVisits:(id)a4 andVisitSearchStartIndex:(int)a5
{
  uint64_t v7;
  double v8;
  double v9;
  double v10;
  double v11;
  BOOL result;
  double v13;

  if (a5 < 0)
    return 0;
  v7 = a5;
  while (1)
  {
    objc_msgSend(objc_msgSend(a4, "objectAtIndexedSubscript:", v7), "startTime");
    if (v8 <= a3)
    {
      objc_msgSend(objc_msgSend(a4, "objectAtIndexedSubscript:", v7), "endTime");
      if (v9 >= a3)
        break;
    }
    objc_msgSend(objc_msgSend(a4, "objectAtIndexedSubscript:", v7), "startTime");
    if (v10 <= a3)
    {
      objc_msgSend(objc_msgSend(a4, "objectAtIndexedSubscript:", v7), "endTime");
      if (v11 == 0.0)
        break;
    }
    objc_msgSend(objc_msgSend(a4, "objectAtIndexedSubscript:", v7), "startTime");
    result = 0;
    if (v13 <= a3 && v7-- > 0)
      continue;
    return result;
  }
  return 1;
}

- (void)_gatherLocationArray:(id)a3 andElevationArray:(id)a4 andTaskType:(unint64_t)a5 withStartTime:(double)a6 andEndTime:(double)a7 andVisitArray:(id)a8 andVisitSearchStartIndex:(int)a9 andCompletionBlock:(id)a10
{
  double v16;
  double v17;
  NSObject *v18;
  const char *v19;
  uint8_t *v20;
  double v21;
  int v22;
  double v23;
  __int16 v24;
  double v25;
  uint8_t buf[4];
  double v27;
  __int16 v28;
  double v29;

  if (+[CLContextManagerElevationProfileBase isQueryValidWithStartTime:andEndTime:](CLContextManagerElevationProfileBase, "isQueryValidWithStartTime:andEndTime:"))
  {
    if (self->_meanSeaLevelPressureSamplingPeriod + a6 >= a7)
      v16 = a7;
    else
      v16 = self->_meanSeaLevelPressureSamplingPeriod + a6;
    if ((a9 & 0x80000000) == 0)
    {
      objc_msgSend(objc_msgSend(a8, "objectAtIndexedSubscript:", a9), "endTime");
      if (v17 != 0.0)
        objc_msgSend(objc_msgSend(a8, "objectAtIndexedSubscript:", a9), "endTime");
    }
    objc_alloc_init((Class)NSMutableArray);
    -[CLContextManagerElevationProfile fetchLocationsWithStartTime:andEndTime:andBatchSize:andLocationArray:andVisitSearchStartIndex:andCompletionBlock:](self->_elevationProfileContextManager, "fetchLocationsWithStartTime:andEndTime:andBatchSize:andLocationArray:andVisitSearchStartIndex:andCompletionBlock:", self->_locationBatchSize, a6, v16);
  }
  else
  {
    if (qword_10229FE80 != -1)
      dispatch_once(&qword_10229FE80, &stru_102150F80);
    v18 = qword_10229FE88;
    if (os_log_type_enabled((os_log_t)qword_10229FE88, OS_LOG_TYPE_ERROR))
    {
      *(_DWORD *)buf = 134218240;
      v27 = a6;
      v28 = 2048;
      v29 = a7;
      _os_log_impl((void *)&_mh_execute_header, v18, OS_LOG_TYPE_ERROR, "query location and elevation with false startTime,%f,endTime,%f", buf, 0x16u);
    }
    if (sub_1001BFF7C(115, 0))
    {
      bzero(buf, 0x65CuLL);
      if (qword_10229FE80 != -1)
        dispatch_once(&qword_10229FE80, &stru_102150F80);
      v22 = 134218240;
      v23 = a6;
      v24 = 2048;
      v25 = a7;
      LODWORD(v21) = 22;
      _os_log_send_and_compose_impl(2, 0, buf, 1628, &_mh_execute_header, qword_10229FE88, 16, "query location and elevation with false startTime,%f,endTime,%f", COERCE_DOUBLE(&v22), v21);
      v20 = (uint8_t *)v19;
      sub_100512490("Generic", 1, 0, 0, "-[CLElevationProfileEstimator _gatherLocationArray:andElevationArray:andTaskType:withStartTime:andEndTime:andVisitArray:andVisitSearchStartIndex:andCompletionBlock:]", "%s\n", v19);
      if (v20 != buf)
        free(v20);
    }
    (*((void (**)(id))a10 + 2))(a10);
  }
}

- (void)_removeInVisitLocation:(id)a3 withVisitArray:(id)a4 andVisitSearchStartIndex:(int)a5
{
  uint64_t v5;
  id v9;
  uint64_t v10;
  id v11;

  v5 = *(_QWORD *)&a5;
  v9 = objc_msgSend(a4, "count");
  if ((v5 & 0x80000000) == 0 && v9)
  {
    v11 = objc_alloc_init((Class)NSMutableIndexSet);
    if ((int)objc_msgSend(a3, "count") >= 1)
    {
      v10 = 0;
      do
      {
        objc_msgSend(objc_msgSend(a3, "objectAtIndexedSubscript:", v10), "timestamp");
        if (-[CLElevationProfileEstimator _queryVisitStateByTimestamp:withHistoricalVisits:andVisitSearchStartIndex:](self, "_queryVisitStateByTimestamp:withHistoricalVisits:andVisitSearchStartIndex:", a4, v5))
        {
          objc_msgSend(v11, "addIndex:", v10);
        }
        ++v10;
      }
      while (v10 < (int)objc_msgSend(a3, "count"));
    }
    if (objc_msgSend(v11, "count"))
      objc_msgSend(a3, "removeObjectsAtIndexes:", v11);

  }
}

- (void)_decimateLocationsWithStartTime:(double)a3 andEndTime:(double)a4 andLocationArray:(id)a5 andElevationArray:(id)a6 andRawLocationArray:(id)a7 andRawElevationArray:(id)a8 andTaskType:(unint64_t)a9 andVisitArray:(id)a10 andVisitSearchStartIndex:(int)a11
{
  double v16;
  double v17;
  id v18;
  double v19;
  double v20;
  id v21;
  id v22;
  CLElevationLocationFilter *v23;
  id v24;
  id v25;
  uint64_t v26;
  void *i;
  void *v28;
  double v29;
  double v30;
  double v31;
  double v32;
  __int128 v37;
  __int128 v38;
  __int128 v39;
  __int128 v40;
  _BYTE v41[128];

  objc_msgSend(objc_msgSend(a8, "firstObject"), "timestamp");
  v17 = v16;
  v18 = a8;
  objc_msgSend(objc_msgSend(a8, "lastObject"), "timestamp");
  v20 = v19;
  v21 = objc_alloc_init((Class)NSMutableArray);
  v22 = objc_alloc_init((Class)NSMutableArray);
  v23 = -[CLElevationLocationFilter initWithWindowSize:]([CLElevationLocationFilter alloc], "initWithWindowSize:", self->_windowSize);
  v37 = 0u;
  v38 = 0u;
  v39 = 0u;
  v40 = 0u;
  v24 = objc_msgSend(a7, "countByEnumeratingWithState:objects:count:", &v37, v41, 16);
  if (v24)
  {
    v25 = v24;
    v26 = *(_QWORD *)v38;
    do
    {
      for (i = 0; i != v25; i = (char *)i + 1)
      {
        if (*(_QWORD *)v38 != v26)
          objc_enumerationMutation(a7);
        v28 = *(void **)(*((_QWORD *)&v37 + 1) + 8 * (_QWORD)i);
        objc_msgSend(v28, "timestamp");
        if (v29 >= v17)
        {
          objc_msgSend(v28, "timestamp");
          if (v30 <= v20)
          {
            objc_msgSend(v28, "verticalAccuracy");
            if (v31 >= 0.0)
            {
              objc_msgSend(v28, "verticalAccuracy");
              if (v32 <= self->_locationMaxVerticalAccuracy)
              {
                -[CLElevationLocationFilter append:](v23, "append:", v28);
                if (-[CLElevationLocationFilter readyToFilter](v23, "readyToFilter"))
                {
                  -[CLElevationLocationFilter fetchFilteredLocations:withElevationArray:](v23, "fetchFilteredLocations:withElevationArray:", v22, v18);
                  -[CLElevationProfileEstimator _removeInVisitLocation:withVisitArray:andVisitSearchStartIndex:](self, "_removeInVisitLocation:withVisitArray:andVisitSearchStartIndex:", v22, a10, a11);
                  -[CLElevationProfileEstimator _logValuesOfFilteredLocations:andTaskType:](self, "_logValuesOfFilteredLocations:andTaskType:", v22, a9);
                  -[CLElevationLocationFilter aggregateFilteredLocations:andAddTo:](v23, "aggregateFilteredLocations:andAddTo:", v22, v21);
                  objc_msgSend(v22, "removeAllObjects");
                }
              }
            }
          }
        }
      }
      v25 = objc_msgSend(a7, "countByEnumeratingWithState:objects:count:", &v37, v41, 16);
    }
    while (v25);
  }
  -[CLElevationLocationFilter fetchFilteredLocations:withElevationArray:](v23, "fetchFilteredLocations:withElevationArray:", v22, v18);
  -[CLElevationProfileEstimator _removeInVisitLocation:withVisitArray:andVisitSearchStartIndex:](self, "_removeInVisitLocation:withVisitArray:andVisitSearchStartIndex:", v22, a10, a11);
  -[CLElevationProfileEstimator _logValuesOfFilteredLocations:andTaskType:](self, "_logValuesOfFilteredLocations:andTaskType:", v22, a9);
  -[CLElevationLocationFilter aggregateFilteredLocations:andAddTo:](v23, "aggregateFilteredLocations:andAddTo:", v22, v21);
  objc_msgSend(v22, "removeAllObjects");
  -[CLElevationProfileEstimator _decimateElevationsWithStartTime:andEndTime:andLocationArray:andElevationArray:andAggregatedLocationArray:andRawElevationArray:](self, "_decimateElevationsWithStartTime:andEndTime:andLocationArray:andElevationArray:andAggregatedLocationArray:andRawElevationArray:", a5, a6, v21, v18, a3, a4);

}

- (void)_decimateElevationsWithStartTime:(double)a3 andEndTime:(double)a4 andLocationArray:(id)a5 andElevationArray:(id)a6 andAggregatedLocationArray:(id)a7 andRawElevationArray:(id)a8
{
  double v13;
  double v14;
  id v15;
  id v16;
  uint64_t v17;
  uint64_t v18;
  void *i;
  void *v20;
  double v21;
  double v22;
  double v23;
  double v24;
  double v25;
  CLElevationDBEntry *v26;
  id v27;
  double v28;
  double v29;
  double v30;
  double v31;
  __int128 v34;
  __int128 v35;
  __int128 v36;
  __int128 v37;
  _BYTE v38[128];

  if (objc_msgSend(a7, "count"))
  {
    objc_msgSend(objc_msgSend(a7, "objectAtIndex:", 0), "timestamp");
    v14 = v13;
  }
  else
  {
    v14 = 1.79769313e308;
  }
  v36 = 0u;
  v37 = 0u;
  v34 = 0u;
  v35 = 0u;
  v15 = objc_msgSend(a8, "countByEnumeratingWithState:objects:count:", &v34, v38, 16);
  if (v15)
  {
    v16 = v15;
    v17 = 0;
    v18 = *(_QWORD *)v35;
    do
    {
      for (i = 0; i != v16; i = (char *)i + 1)
      {
        if (*(_QWORD *)v35 != v18)
          objc_enumerationMutation(a8);
        v20 = *(void **)(*((_QWORD *)&v34 + 1) + 8 * (_QWORD)i);
        objc_msgSend(v20, "timestamp");
        if (v21 >= a3)
        {
          objc_msgSend(v20, "timestamp");
          if (v22 <= a4)
          {
            while (1)
            {
              objc_msgSend(v20, "timestamp");
              if (v14 >= v23)
                break;
              objc_msgSend(objc_msgSend(a5, "lastObject"), "timestamp");
              if (v14 > v24)
              {
                objc_msgSend(objc_msgSend(a6, "lastObject"), "timestamp");
                if (v14 > v25)
                {
                  v26 = objc_alloc_init(CLElevationDBEntry);
                  v27 = objc_msgSend(a7, "objectAtIndex:", v17);
                  objc_msgSend(v27, "timestamp");
                  -[CLElevationDBEntry setTimestamp:](v26, "setTimestamp:");
                  objc_msgSend(v27, "interpPressure");
                  -[CLElevationDBEntry setPressure:](v26, "setPressure:");
                  objc_msgSend(a5, "addObject:", v27);
                  objc_msgSend(a6, "addObject:", v26);

                }
              }
              if (++v17 >= (unint64_t)objc_msgSend(a7, "count"))
              {
                v14 = 1.79769313e308;
              }
              else
              {
                objc_msgSend(objc_msgSend(a7, "objectAtIndex:", v17), "timestamp");
                v14 = v28;
              }
            }
            objc_msgSend(v20, "timestamp");
            v30 = v29;
            objc_msgSend(objc_msgSend(a6, "lastObject"), "timestamp");
            if (v30 - v31 > self->_decimationPeriod)
              objc_msgSend(a6, "addObject:", v20);
          }
        }
      }
      v16 = objc_msgSend(a8, "countByEnumeratingWithState:objects:count:", &v34, v38, 16);
    }
    while (v16);
  }
}

- (void)_alignElevationArray:(id)a3 andLocationArray:(id)a4
{
  double v6;
  double v7;
  double v8;
  double v9;
  double v10;
  double v11;
  id v12;
  id v13;
  id v14;
  uint64_t v15;
  void *i;
  void *v17;
  double v18;
  double v19;
  NSObject *v20;
  uint64_t v21;
  const char *v22;
  uint8_t *v23;
  __int128 v24;
  __int128 v25;
  __int128 v26;
  __int128 v27;
  _BYTE v28[128];
  _DWORD v29[2];
  __int16 v30;
  unsigned int v31;
  uint8_t buf[4];
  unsigned int v33;
  __int16 v34;
  unsigned int v35;

  if (objc_msgSend(a3, "count") && objc_msgSend(a4, "count"))
  {
    objc_msgSend(objc_msgSend(a3, "firstObject"), "timestamp");
    v7 = v6 + -0.000001;
    objc_msgSend(objc_msgSend(a3, "lastObject"), "timestamp");
    v9 = v8 + 0.000001;
    objc_msgSend(objc_msgSend(a4, "firstObject"), "timestamp");
    if (v7 >= v10 || (objc_msgSend(objc_msgSend(a4, "lastObject"), "timestamp"), v11 >= v9))
    {
      v12 = objc_alloc_init((Class)NSMutableArray);
      v24 = 0u;
      v25 = 0u;
      v26 = 0u;
      v27 = 0u;
      v13 = objc_msgSend(a4, "countByEnumeratingWithState:objects:count:", &v24, v28, 16);
      if (v13)
      {
        v14 = v13;
        v15 = *(_QWORD *)v25;
        do
        {
          for (i = 0; i != v14; i = (char *)i + 1)
          {
            if (*(_QWORD *)v25 != v15)
              objc_enumerationMutation(a4);
            v17 = *(void **)(*((_QWORD *)&v24 + 1) + 8 * (_QWORD)i);
            objc_msgSend(v17, "timestamp");
            if (v18 > v7)
            {
              objc_msgSend(v17, "timestamp");
              if (v19 < v9)
                objc_msgSend(v12, "addObject:", v17);
            }
          }
          v14 = objc_msgSend(a4, "countByEnumeratingWithState:objects:count:", &v24, v28, 16);
        }
        while (v14);
      }
      objc_msgSend(a4, "removeAllObjects");
      objc_msgSend(a4, "addObjectsFromArray:", v12);

    }
  }
  else
  {
    if (qword_10229FE80 != -1)
      dispatch_once(&qword_10229FE80, &stru_102150F80);
    v20 = qword_10229FE88;
    if (os_log_type_enabled((os_log_t)qword_10229FE88, OS_LOG_TYPE_DEFAULT))
    {
      *(_DWORD *)buf = 67109376;
      v33 = objc_msgSend(a3, "count");
      v34 = 1024;
      v35 = objc_msgSend(a4, "count");
      _os_log_impl((void *)&_mh_execute_header, v20, OS_LOG_TYPE_DEFAULT, "zero elevation or location for kalman smoother,elevationCount,%d,locationCount,%d", buf, 0xEu);
    }
    if (sub_1001BFF7C(115, 2))
    {
      bzero(buf, 0x65CuLL);
      if (qword_10229FE80 != -1)
        dispatch_once(&qword_10229FE80, &stru_102150F80);
      v21 = qword_10229FE88;
      v29[0] = 67109376;
      v29[1] = objc_msgSend(a3, "count");
      v30 = 1024;
      v31 = objc_msgSend(a4, "count");
      _os_log_send_and_compose_impl(2, 0, buf, 1628, &_mh_execute_header, v21, 0, "zero elevation or location for kalman smoother,elevationCount,%d,locationCount,%d", v29, 14);
      v23 = (uint8_t *)v22;
      sub_100512490("Generic", 1, 0, 2, "-[CLElevationProfileEstimator _alignElevationArray:andLocationArray:]", "%s\n", v22);
      if (v23 != buf)
        free(v23);
    }
  }
}

- (void)_initKalmanFilter:(id)a3 withLocationArray:(id)a4 andElevationArray:(id)a5 andTaskType:(unint64_t)a6
{
  id v10;
  id v11;
  id v12;
  uint64_t v13;
  float v14;
  double v15;
  void *v16;
  double v17;
  void *v18;
  double v19;
  double v20;
  double v21;
  double v22;
  double v23;
  float v24;
  double v25;
  float v26;
  double v27;
  double v28;
  double v29;
  double v30;
  double v31;
  double v32;
  NSObject *v33;
  const char *v34;
  uint8_t *v35;
  double v36;
  double v37;
  int v38;
  double v39;
  int v40;
  float elevationInitialVar;
  uint64_t v42;
  float meanSeaLevelPressureInitialVar;
  __int128 v44;
  __int128 v45;
  __int128 v46;
  __int128 v47;
  int v48;
  unint64_t v49;
  __int16 v50;
  double v51;
  __int16 v52;
  double v53;
  uint8_t buf[4];
  unint64_t v55;
  __int16 v56;
  double v57;
  __int16 v58;
  double v59;
  _BYTE v60[128];

  v10 = objc_msgSend(a4, "firstObject");
  v44 = 0u;
  v45 = 0u;
  v46 = 0u;
  v47 = 0u;
  v11 = objc_msgSend(a5, "countByEnumeratingWithState:objects:count:", &v44, v60, 16);
  if (v11)
  {
    v12 = v11;
    v13 = *(_QWORD *)v45;
    v14 = 0.0;
    v15 = 1.79769313e308;
LABEL_3:
    v16 = 0;
    v17 = v15;
    while (1)
    {
      if (*(_QWORD *)v45 != v13)
        objc_enumerationMutation(a5);
      v18 = *(void **)(*((_QWORD *)&v44 + 1) + 8 * (_QWORD)v16);
      objc_msgSend(v18, "timestamp");
      v20 = v19;
      objc_msgSend(v10, "timestamp");
      v15 = vabdd_f64(v20, v21);
      if (v15 > v17)
        break;
      objc_msgSend(v18, "pressure");
      v14 = v22;
      v16 = (char *)v16 + 1;
      v17 = v15;
      if (v12 == v16)
      {
        v12 = objc_msgSend(a5, "countByEnumeratingWithState:objects:count:", &v44, v60, 16);
        if (v12)
          goto LABEL_3;
        break;
      }
    }
  }
  else
  {
    v14 = 0.0;
  }
  objc_msgSend(v10, "elevation");
  *(float *)&v23 = v23;
  v24 = sub_1013D36B0(*(float *)&v23, v14);
  objc_msgSend(objc_msgSend(a5, "firstObject"), "pressure");
  *(float *)&v25 = v25;
  v26 = sub_10024806C(*(float *)&v25, v24);
  v42 = 0;
  elevationInitialVar = self->_elevationInitialVar;
  meanSeaLevelPressureInitialVar = self->_meanSeaLevelPressureInitialVar;
  sub_10074BF38((uint64_t)&v39, (uint64_t)&elevationInitialVar);
  *(float *)&v27 = v26;
  *(float *)&v28 = v24;
  objc_msgSend(a3, "setFState:", v27, v28);
  v37 = v39;
  v38 = v40;
  objc_msgSend(a3, "setFP:", &v37);
  *(float *)&v29 = self->_elevationProcessNoiseVar;
  *(float *)&v30 = self->_meanSeaLevelPressureProcessNoiseVar;
  objc_msgSend(a3, "setFQ:", v29, v30);
  LODWORD(v31) = 1.0;
  LODWORD(v32) = 0;
  objc_msgSend(a3, "setFH:", v31, v32);
  if (self->_isVerboseLogging)
  {
    if (qword_10229FE80 != -1)
      dispatch_once(&qword_10229FE80, &stru_102150F80);
    v33 = qword_10229FE88;
    if (os_log_type_enabled((os_log_t)qword_10229FE88, OS_LOG_TYPE_DEBUG))
    {
      *(_DWORD *)buf = 134218496;
      v55 = a6;
      v56 = 2048;
      v57 = v26;
      v58 = 2048;
      v59 = v24;
      _os_log_impl((void *)&_mh_execute_header, v33, OS_LOG_TYPE_DEBUG, "initialize Kalman filter,taskType,%lu,elevation,%f,mslp,%f", buf, 0x20u);
    }
    if (sub_1001BFF7C(115, 2))
    {
      bzero(buf, 0x65CuLL);
      if (qword_10229FE80 != -1)
        dispatch_once(&qword_10229FE80, &stru_102150F80);
      v48 = 134218496;
      v49 = a6;
      v50 = 2048;
      v51 = v26;
      v52 = 2048;
      v53 = v24;
      LODWORD(v36) = 32;
      _os_log_send_and_compose_impl(2, 0, buf, 1628, &_mh_execute_header, qword_10229FE88, 2, "initialize Kalman filter,taskType,%lu,elevation,%f,mslp,%f", &v48, v36, v37);
      v35 = (uint8_t *)v34;
      sub_100512490("Generic", 1, 0, 2, "-[CLElevationProfileEstimator _initKalmanFilter:withLocationArray:andElevationArray:andTaskType:]", "%s\n", v34);
      if (v35 != buf)
        free(v35);
    }
  }
}

- (double)_getTimestampWithLocationArray:(id)a3 atIndex:(unsigned int)a4
{
  double result;

  if ((unint64_t)objc_msgSend(a3, "count") <= a4)
    return 1.79769313e308;
  objc_msgSend(objc_msgSend(a3, "objectAtIndex:", a4), "timestamp");
  return result;
}

- (double)_getTimestampWithElevationArray:(id)a3 atIndex:(unsigned int)a4
{
  double result;

  if ((unint64_t)objc_msgSend(a3, "count") <= a4)
    return 1.79769313e308;
  objc_msgSend(objc_msgSend(a3, "objectAtIndex:", a4), "timestamp");
  return result;
}

- (void)_predictionUpdate:(id)a3 withElevation:(id)a4 withNextElevation:(id)a5 withTravelVelocity:(double)a6
{
  double v11;
  float v12;
  double v13;
  float v14;
  float v15;
  float v16;
  int v17;
  double v18;
  double v19;
  double v20;
  double v21;
  float v22;
  float v23;
  float v24;
  float v25;
  float v26;
  float v27;
  NSObject *v28;
  float v29;
  float v30;
  double v31;
  int v32;
  uint64_t v33;
  double v34;
  double v35;
  double v36;
  double v37;
  float v38;
  const char *v39;
  char *v40;
  double v41;
  double v42;
  double v43;
  float v44;
  double v45;
  float v46;
  double v47;
  float v48;
  double v49;
  double v50;
  int v51;
  _DWORD v52[2];
  double v53;
  int v54;
  int v55;
  double v56;
  __int16 v57;
  double v58;
  __int16 v59;
  double v60;
  __int16 v61;
  double v62;
  __int16 v63;
  double v64;
  __int16 v65;
  double v66;
  __int16 v67;
  double v68;
  __int16 v69;
  double v70;
  _BYTE buf[12];
  _BYTE v72[10];
  __int16 v73;
  double v74;
  __int16 v75;
  double v76;
  __int16 v77;
  double v78;
  __int16 v79;
  double v80;
  __int16 v81;
  double v82;
  __int16 v83;
  double v84;

  objc_msgSend(a4, "pressure");
  v12 = v11;
  objc_msgSend(a5, "pressure");
  v14 = v13;
  objc_msgSend(a3, "fState");
  v16 = v15;
  if (a3)
  {
    objc_msgSend(a3, "fP");
  }
  else
  {
    v54 = 0;
    v53 = 0.0;
  }
  objc_msgSend(a3, "fQ");
  v52[0] = v17;
  objc_msgSend(a5, "timestamp");
  v19 = v18;
  objc_msgSend(a4, "timestamp");
  v21 = vabdd_f64(v19, v20);
  if (v12 == 0.0)
    v22 = 1.0;
  else
    v22 = 101320.0 / v12;
  v23 = v21 * 100.0 / 3600.0 + v21 * 0.00200000009 * a6;
  v24 = vabds_f32(v14, v12);
  v25 = v24 * sub_100083204(v12);
  sub_1013D36F0(v12, v16);
  v27 = v25 / v26;
  if (self->_isVerboseLogging)
  {
    if (qword_10229FE80 != -1)
      dispatch_once(&qword_10229FE80, &stru_102150F80);
    v28 = qword_10229FE88;
    if (os_log_type_enabled((os_log_t)qword_10229FE88, OS_LOG_TYPE_DEBUG))
    {
      v42 = v27;
      v45 = v24;
      v43 = sub_100083204(v12);
      sub_1013D36F0(v12, v16);
      *(_DWORD *)buf = 134219776;
      *(double *)&buf[4] = v23;
      *(_WORD *)v72 = 2048;
      *(double *)&v72[2] = v22;
      v73 = 2048;
      v74 = v27;
      v75 = 2048;
      v76 = v24;
      v77 = 2048;
      v78 = a6;
      v79 = 2048;
      v80 = v21;
      v81 = 2048;
      v82 = v43;
      v83 = 2048;
      v84 = v29;
      _os_log_impl((void *)&_mh_execute_header, v28, OS_LOG_TYPE_DEBUG, "mslp uncertainty model,deltaMslpDue2TimeAndDistance,%f,pressure2MslpFactor,%f,estBaroModelUncReflectedInMslp,%f,deltaPressure,%f,travelVelocity,%f,timeDifference,%f,slopeDiffDElevationDPressure,%f,dHdMslp,%f", buf, 0x52u);
    }
    if (sub_1001BFF7C(115, 2))
    {
      bzero(buf, 0x65CuLL);
      v49 = a6;
      if (qword_10229FE80 != -1)
        dispatch_once(&qword_10229FE80, &stru_102150F80);
      v33 = qword_10229FE88;
      *((float *)&v47 + 1) = v21 * 100.0 / 3600.0 + v21 * 0.00200000009 * a6;
      v34 = v23;
      *(float *)&v45 = v22;
      *(float *)&v43 = v27;
      v35 = v27;
      v36 = v24;
      v37 = sub_100083204(v12);
      sub_1013D36F0(v12, v16);
      v55 = 134219776;
      v56 = v34;
      v57 = 2048;
      v58 = v22;
      v59 = 2048;
      v60 = v35;
      v61 = 2048;
      v62 = v36;
      v63 = 2048;
      v64 = v49;
      v65 = 2048;
      v66 = v21;
      v67 = 2048;
      v68 = v37;
      v69 = 2048;
      v70 = v38;
      LODWORD(v41) = 82;
      _os_log_send_and_compose_impl(2, 0, buf, 1628, &_mh_execute_header, v33, 2, "mslp uncertainty model,deltaMslpDue2TimeAndDistance,%f,pressure2MslpFactor,%f,estBaroModelUncReflectedInMslp,%f,deltaPressure,%f,travelVelocity,%f,timeDifference,%f,slopeDiffDElevationDPressure,%f,dHdMslp,%f", COERCE_DOUBLE(&v55), v41, v42, v43, v45, v47, v49, v50);
      v40 = (char *)v39;
      sub_100512490("Generic", 1, 0, 2, "-[CLElevationProfileEstimator _predictionUpdate:withElevation:withNextElevation:withTravelVelocity:]", "%s\n", v39);
      if (v40 != buf)
        free(v40);
      v22 = v46;
      v23 = v48;
      v27 = v44;
    }
  }
  *(float *)&v52[1] = (float)(v27 + (float)(v22 * v23)) * (float)(v27 + (float)(v22 * v23));
  v30 = sub_10024806C(v12, v16);
  objc_msgSend(a3, "fState");
  *(float *)&v31 = v30;
  objc_msgSend(a3, "setFState:", v31);
  sub_1013D36F0(v12, v16);
  *(_QWORD *)buf = 0;
  *(_DWORD *)&buf[8] = v32;
  *(_DWORD *)v72 = 1065353216;
  objc_msgSend(a3, "setF01:");
  sub_10074C6DC((uint64_t)&v53, (uint64_t)buf, (uint64_t)v52);
  v50 = v53;
  v51 = v54;
  objc_msgSend(a3, "setFP:", &v50);
}

- (void)_measurementUpdate:(id)a3 withLocation:(id)a4
{
  float v6;
  float v7;
  float v8;
  float v9;
  double v10;
  double v11;
  double v12;
  double v13;
  float v14;
  float v15;
  double v16;
  float v17;
  float v18;
  float v19;
  float v20;
  float v21;
  double v22;
  float v23;
  double v24;
  uint64_t v25;
  int v26;
  _DWORD v27[2];
  uint64_t v28;
  int v29;
  float v30;
  int v31;

  if (a3)
  {
    objc_msgSend(a3, "fP");
  }
  else
  {
    v29 = 0;
    v28 = 0;
  }
  objc_msgSend(a3, "fH");
  v7 = v6;
  v9 = v8;
  *(float *)v27 = v6;
  *(float *)&v27[1] = v8;
  objc_msgSend(a4, "verticalAccuracy");
  v11 = v10;
  objc_msgSend(a4, "verticalAccuracy");
  *(float *)&v12 = v11 * v12;
  v31 = LODWORD(v12);
  objc_msgSend(a4, "elevation");
  *(float *)&v11 = v13;
  objc_msgSend(a3, "fState");
  v30 = *(float *)&v11 - (float)((float)(v7 * v14) + (float)(v9 * v15));
  LODWORD(v16) = 2139095039;
  objc_msgSend(a3, "setF01:", v16);
  sub_10074CC94((float *)&v28, (uint64_t)v27, (float *)&v31, &v30);
  v18 = v17;
  v20 = v19;
  v25 = v28;
  v26 = v29;
  objc_msgSend(a3, "setFP:", &v25);
  objc_msgSend(a3, "fState");
  *(float *)&v22 = v18 + v21;
  *(float *)&v24 = v20 + v23;
  objc_msgSend(a3, "setFState:", v22, v24);
}

- (BOOL)_rejectOutlyingLocation:(id)a3 withKFEstimates:(id)a4
{
  float v5;
  double v6;
  double v7;
  double v8;
  double v9;

  objc_msgSend(a4, "fState");
  v6 = v5;
  objc_msgSend(a3, "elevation");
  v8 = vabdd_f64(v6, v7);
  objc_msgSend(a3, "verticalAccuracy");
  return v8 > v9 * 5.0;
}

- (BOOL)_forwardProcessingWithLocationArray:(id)a3 andElevationArray:(id)a4 andKFEstimatesBuffer:(id)a5 andKeepAllLocations:(BOOL)a6 andTaskType:(unint64_t)a7
{
  CLKFRunningEstimates *v11;
  uint64_t v12;
  uint64_t v13;
  __int128 v14;
  uint64_t v15;
  double v16;
  double v17;
  double v18;
  double v19;
  double v20;
  unint64_t v21;
  id v22;
  id v23;
  uint64_t v24;
  id v25;
  id v26;
  CLKalmanFilterEstimates *v27;
  NSObject *v28;
  unsigned int v29;
  uint64_t v30;
  uint64_t v31;
  float v32;
  double v33;
  float v34;
  double v35;
  float v36;
  double v37;
  float v38;
  double v39;
  float v40;
  double v41;
  float v42;
  uint64_t v43;
  unsigned int v44;
  uint64_t v45;
  uint64_t v46;
  float v47;
  double v48;
  float v49;
  double v50;
  float v51;
  double v52;
  float v53;
  double v54;
  float v55;
  double v56;
  float v57;
  const char *v58;
  uint8_t *v59;
  NSObject *v60;
  uint64_t v61;
  uint64_t v62;
  uint64_t v63;
  uint64_t v64;
  uint64_t v65;
  uint64_t v66;
  uint64_t v67;
  uint64_t v68;
  uint64_t v69;
  uint64_t v70;
  uint64_t v71;
  const char *v72;
  uint8_t *v73;
  double v74;
  double maxOutlierRatio;
  NSObject *v76;
  id v77;
  uint64_t v79;
  id v80;
  const char *v81;
  uint8_t *v82;
  double v83;
  __int128 v84;
  double v85;
  double v86;
  __int128 v87;
  double v88;
  double v91;
  int v92;
  double v93;
  __int16 v94;
  _BYTE v95[34];
  __int16 v96;
  double v97;
  __int16 v98;
  double v99;
  __int16 v100;
  double v101;
  __int16 v102;
  double v103;
  uint8_t buf[12];
  __int16 v105;
  _BYTE v106[34];
  __int16 v107;
  double v108;
  __int16 v109;
  double v110;
  __int16 v111;
  double v112;
  __int16 v113;
  double v114;

  v91 = 0.0;
  v11 = objc_alloc_init(CLKFRunningEstimates);
  v88 = *(double *)&a7;
  -[CLElevationProfileEstimator _initKalmanFilter:withLocationArray:andElevationArray:andTaskType:](self, "_initKalmanFilter:withLocationArray:andElevationArray:andTaskType:", v11, a3, a4, a7);
  HIDWORD(v86) = 0;
  v12 = 0;
  v13 = 0;
  *(_QWORD *)&v14 = 134218752;
  v84 = v14;
  *(_QWORD *)&v14 = 134220032;
  v87 = v14;
LABEL_2:
  v15 = v13;
  while ((unint64_t)objc_msgSend(a3, "count") > v15
       || (unint64_t)objc_msgSend(a4, "count") > v12)
  {
    -[CLElevationProfileEstimator _getTimestampWithLocationArray:atIndex:](self, "_getTimestampWithLocationArray:atIndex:", a3, v15);
    v17 = v16;
    -[CLElevationProfileEstimator _getTimestampWithElevationArray:atIndex:](self, "_getTimestampWithElevationArray:atIndex:", a4, v12);
    v19 = v18 + -0.000001;
    if (v17 >= v18 + -0.000001)
      v20 = v18;
    else
      v20 = v17;
    if (v17 >= v18 + -0.000001)
    {
      if ((char *)objc_msgSend(a4, "count") - 1 == (_BYTE *)v12)
        v24 = v12;
      else
        v24 = (v12 + 1);
      v25 = objc_msgSend(a4, "objectAtIndex:", v12);
      v26 = objc_msgSend(a4, "objectAtIndex:", v24);
      -[CLElevationProfileEstimator _predictionUpdate:withElevation:withNextElevation:withTravelVelocity:](self, "_predictionUpdate:withElevation:withNextElevation:withTravelVelocity:", v11, v25, v26, v91);
      v12 = (v12 + 1);
    }
    else
    {
      v13 = (v15 + 1);
      if ((char *)objc_msgSend(a3, "count") - 1 == (_BYTE *)v15)
        v21 = v15;
      else
        v21 = (v15 + 1);
      v22 = objc_msgSend(a3, "objectAtIndex:", v15);
      v23 = objc_msgSend(a3, "objectAtIndex:", v21);
      if (!a6
        && -[CLElevationProfileEstimator _rejectOutlyingLocation:withKFEstimates:](self, "_rejectOutlyingLocation:withKFEstimates:", v22, v11))
      {
        if (self->_isVerboseLogging)
        {
          if (qword_10229FE80 != -1)
            dispatch_once(&qword_10229FE80, &stru_102150F80);
          v60 = qword_10229FE88;
          if (os_log_type_enabled((os_log_t)qword_10229FE88, OS_LOG_TYPE_DEBUG))
          {
            objc_msgSend(v22, "timestamp");
            v62 = v61;
            objc_msgSend(v22, "elevation");
            v64 = v63;
            objc_msgSend(v22, "verticalAccuracy");
            *(_DWORD *)buf = v84;
            *(double *)&buf[4] = v88;
            v105 = 2048;
            *(_QWORD *)v106 = v62;
            *(_WORD *)&v106[8] = 2048;
            *(_QWORD *)&v106[10] = v64;
            *(_WORD *)&v106[18] = 2048;
            *(_QWORD *)&v106[20] = v65;
            _os_log_impl((void *)&_mh_execute_header, v60, OS_LOG_TYPE_DEBUG, "reject location outlier,taskType,%lu,timestamp,%f,elevation,%f,verticalAccuracy,%f", buf, 0x2Au);
          }
          if (sub_1001BFF7C(115, 2))
          {
            bzero(buf, 0x65CuLL);
            if (qword_10229FE80 != -1)
              dispatch_once(&qword_10229FE80, &stru_102150F80);
            v66 = qword_10229FE88;
            objc_msgSend(v22, "timestamp");
            v68 = v67;
            objc_msgSend(v22, "elevation");
            v70 = v69;
            objc_msgSend(v22, "verticalAccuracy");
            v92 = v84;
            v93 = v88;
            v94 = 2048;
            *(_QWORD *)v95 = v68;
            *(_WORD *)&v95[8] = 2048;
            *(_QWORD *)&v95[10] = v70;
            *(_WORD *)&v95[18] = 2048;
            *(_QWORD *)&v95[20] = v71;
            LODWORD(v83) = 42;
            _os_log_send_and_compose_impl(2, 0, buf, 1628, &_mh_execute_header, v66, 2, "reject location outlier,taskType,%lu,timestamp,%f,elevation,%f,verticalAccuracy,%f", &v92, v83, *(double *)&v84, *((double *)&v84 + 1));
            v73 = (uint8_t *)v72;
            sub_100512490("Generic", 1, 0, 2, "-[CLElevationProfileEstimator _forwardProcessingWithLocationArray:andElevationArray:andKFEstimatesBuffer:andKeepAllLocations:andTaskType:]", "%s\n", v72);
            if (v73 != buf)
              free(v73);
          }
        }
        ++HIDWORD(v86);
        goto LABEL_2;
      }
      if ((unint64_t)objc_msgSend(a3, "count") <= v21)
        v91 = 0.0;
      else
        -[CLElevationProfileEstimator getTravelVelocity:withCurrLocation:andNextLocation:](self, "getTravelVelocity:withCurrLocation:andNextLocation:", &v91, v22, v23);
      -[CLElevationProfileEstimator _measurementUpdate:withLocation:](self, "_measurementUpdate:withLocation:", v11, v22);
      v15 = v13;
    }
    v27 = objc_alloc_init(CLKalmanFilterEstimates);
    -[CLKFRunningEstimates fState](v11, "fState");
    -[CLKalmanFilterEstimates setFState:](v27, "setFState:");
    if (v11)
      -[CLKFRunningEstimates fP](v11, "fP");
    else
      memset(buf, 0, sizeof(buf));
    sub_100750CB8((uint64_t)buf, 0, 0);
    -[CLKalmanFilterEstimates setFCovariance:](v27, "setFCovariance:");
    -[CLKalmanFilterEstimates setIsMeasurement:](v27, "setIsMeasurement:", v17 < v19);
    -[CLKalmanFilterEstimates setTimestamp:](v27, "setTimestamp:", v20);
    -[CLKFRunningEstimates F01](v11, "F01");
    -[CLKalmanFilterEstimates setF01:](v27, "setF01:");
    objc_msgSend(a5, "addObject:", v27);
    if (self->_isVerboseLogging)
    {
      if (qword_10229FE80 != -1)
        dispatch_once(&qword_10229FE80, &stru_102150F80);
      v28 = qword_10229FE88;
      if (os_log_type_enabled((os_log_t)qword_10229FE88, OS_LOG_TYPE_DEBUG))
      {
        v29 = -[CLKalmanFilterEstimates isMeasurement](v27, "isMeasurement");
        -[CLKalmanFilterEstimates timestamp](v27, "timestamp");
        v31 = v30;
        -[CLKalmanFilterEstimates fState](v27, "fState");
        v33 = v32;
        -[CLKalmanFilterEstimates fState](v27, "fState");
        v35 = v34;
        -[CLKalmanFilterEstimates fCovariance](v27, "fCovariance");
        v37 = v36;
        -[CLKalmanFilterEstimates fCovariance](v27, "fCovariance");
        v39 = v38;
        -[CLKalmanFilterEstimates fCovariance](v27, "fCovariance");
        v41 = v40;
        -[CLKalmanFilterEstimates fCovariance](v27, "fCovariance");
        *(_DWORD *)buf = v87;
        *(double *)&buf[4] = v88;
        v105 = 1024;
        *(_DWORD *)v106 = v29;
        *(_WORD *)&v106[4] = 2048;
        *(_QWORD *)&v106[6] = v31;
        *(_WORD *)&v106[14] = 2048;
        *(double *)&v106[16] = v33;
        *(_WORD *)&v106[24] = 2048;
        *(double *)&v106[26] = v35;
        v107 = 2048;
        v108 = v37;
        v109 = 2048;
        v110 = v39;
        v111 = 2048;
        v112 = v41;
        v113 = 2048;
        v114 = v42;
        _os_log_impl((void *)&_mh_execute_header, v28, OS_LOG_TYPE_DEBUG, "enumerate KF estimates,taskType,%lu,isMeasurement,%d,timestamp,%f,elevation,%f,mslp,%f,P00,%f,P01,%f,P10,%f,P11,%f", buf, 0x58u);
      }
      if (sub_1001BFF7C(115, 2))
      {
        bzero(buf, 0x65CuLL);
        if (qword_10229FE80 != -1)
          dispatch_once(&qword_10229FE80, &stru_102150F80);
        v43 = qword_10229FE88;
        v44 = -[CLKalmanFilterEstimates isMeasurement](v27, "isMeasurement");
        -[CLKalmanFilterEstimates timestamp](v27, "timestamp");
        v46 = v45;
        -[CLKalmanFilterEstimates fState](v27, "fState");
        v48 = v47;
        -[CLKalmanFilterEstimates fState](v27, "fState");
        v50 = v49;
        -[CLKalmanFilterEstimates fCovariance](v27, "fCovariance");
        v52 = v51;
        -[CLKalmanFilterEstimates fCovariance](v27, "fCovariance");
        v54 = v53;
        -[CLKalmanFilterEstimates fCovariance](v27, "fCovariance");
        v56 = v55;
        -[CLKalmanFilterEstimates fCovariance](v27, "fCovariance");
        v92 = v87;
        v93 = v88;
        v94 = 1024;
        *(_DWORD *)v95 = v44;
        *(_WORD *)&v95[4] = 2048;
        *(_QWORD *)&v95[6] = v46;
        *(_WORD *)&v95[14] = 2048;
        *(double *)&v95[16] = v48;
        *(_WORD *)&v95[24] = 2048;
        *(double *)&v95[26] = v50;
        v96 = 2048;
        v97 = v52;
        v98 = 2048;
        v99 = v54;
        v100 = 2048;
        v101 = v56;
        v102 = 2048;
        v103 = v57;
        _os_log_send_and_compose_impl(2, 0, buf, 1628, &_mh_execute_header, v43, 2, "enumerate KF estimates,taskType,%lu,isMeasurement,%d,timestamp,%f,elevation,%f,mslp,%f,P00,%f,P01,%f,P10,%f,P11,%f", &v92, 88, *(double *)&v84, *((double *)&v84 + 1), v85, v86, *(double *)&v87, *((double *)&v87 + 1), v88);
        v59 = (uint8_t *)v58;
        sub_100512490("Generic", 1, 0, 2, "-[CLElevationProfileEstimator _forwardProcessingWithLocationArray:andElevationArray:andKFEstimatesBuffer:andKeepAllLocations:andTaskType:]", "%s\n", v58);
        if (v59 != buf)
          free(v59);
      }
    }

  }
  v74 = (double)HIDWORD(v86) / (double)(unint64_t)objc_msgSend(a3, "count");
  maxOutlierRatio = self->_maxOutlierRatio;
  if (!a6)
  {
    if (qword_10229FD70 != -1)
      dispatch_once(&qword_10229FD70, &stru_102150FA0);
    v76 = qword_10229FD78;
    if (os_log_type_enabled((os_log_t)qword_10229FD78, OS_LOG_TYPE_DEBUG))
    {
      v77 = objc_msgSend(a3, "count");
      *(_DWORD *)buf = 134219008;
      *(double *)&buf[4] = v88;
      v105 = 2048;
      *(_QWORD *)v106 = HIDWORD(v86);
      *(_WORD *)&v106[8] = 2048;
      *(_QWORD *)&v106[10] = v77;
      *(_WORD *)&v106[18] = 2048;
      *(double *)&v106[20] = v74;
      *(_WORD *)&v106[28] = 1024;
      *(_DWORD *)&v106[30] = v74 > maxOutlierRatio;
      _os_log_impl((void *)&_mh_execute_header, v76, OS_LOG_TYPE_DEBUG, "outlier rejection summary,taskType,%lu,outlierCount,%lu,totalCount,%lu,outlierRatio,%f,isRepeatKF,%d", buf, 0x30u);
    }
    if (sub_1001BFF7C(115, 2))
    {
      bzero(buf, 0x65CuLL);
      if (qword_10229FD70 != -1)
        dispatch_once(&qword_10229FD70, &stru_102150FA0);
      v79 = qword_10229FD78;
      v80 = objc_msgSend(a3, "count");
      v92 = 134219008;
      v93 = v88;
      v94 = 2048;
      *(_QWORD *)v95 = HIDWORD(v86);
      *(_WORD *)&v95[8] = 2048;
      *(_QWORD *)&v95[10] = v80;
      *(_WORD *)&v95[18] = 2048;
      *(double *)&v95[20] = v74;
      *(_WORD *)&v95[28] = 1024;
      *(_DWORD *)&v95[30] = v74 > maxOutlierRatio;
      LODWORD(v83) = 48;
      _os_log_send_and_compose_impl(2, 0, buf, 1628, &_mh_execute_header, v79, 2, "outlier rejection summary,taskType,%lu,outlierCount,%lu,totalCount,%lu,outlierRatio,%f,isRepeatKF,%d", &v92, *(_QWORD *)&v83, (_QWORD)v84, *((double *)&v84 + 1), LODWORD(v85));
      v82 = (uint8_t *)v81;
      sub_100512490("Generic", 1, 0, 2, "-[CLElevationProfileEstimator _forwardProcessingWithLocationArray:andElevationArray:andKFEstimatesBuffer:andKeepAllLocations:andTaskType:]", "%s\n", v81);
      if (v82 != buf)
        free(v82);
    }
  }
  return v74 > maxOutlierRatio;
}

- (void)getTravelVelocity:(double *)a3 withCurrLocation:(id)a4 andNextLocation:(id)a5
{
  double v8;
  double v9;
  double v10;
  double v11;
  double v12;
  double v13;
  double v14;
  double v15;
  double v16;
  double v17;
  double v18;
  double v19;

  objc_msgSend(a5, "timestamp");
  v9 = v8;
  objc_msgSend(a4, "timestamp");
  v11 = v9 - v10;
  v12 = 0.0;
  if (v11 != 0.0)
  {
    objc_msgSend(a4, "latitude", 0.0);
    v14 = v13;
    objc_msgSend(a4, "longitude");
    v16 = v15;
    objc_msgSend(a5, "latitude");
    v18 = v17;
    objc_msgSend(a5, "longitude");
    v12 = fabs(fabs(sub_100124100(v14, v16, v18, v19)) / v11);
  }
  *a3 = v12;
}

- (int)_getLastPredictionIndexWithKFEstimatesBuffer:(id)a3 fromIndex:(int)a4
{
  int v6;

  do
  {
    v6 = a4;
    if (a4 < 1)
      break;
    --a4;
  }
  while ((objc_msgSend(objc_msgSend(a3, "objectAtIndex:", (v6 - 1)), "isMeasurement") & 1) != 0);
  return v6 - 1;
}

- (void)_kalmanSmootherUpdateWithKFEstimatesBuffer:(id)a3 andKSEstimatesBuffer:(id)a4 andCurrPredictionIndex:(int)a5 andNextPredictionIndex:(int)a6
{
  uint64_t v10;
  float v11;
  float v12;
  float v13;
  float v14;
  float v15;
  float v16;
  float v17;
  float v18;
  float v19;
  float v20;
  float v21;
  float v22;
  float v23;
  float v24;
  float v25;
  float v26;
  int v27;
  float v28;
  float v29;
  float v30;
  float v31;
  float v32;
  float v33;
  float v34;
  float v35;
  float v36;
  float v37;
  float v38;
  float v39;
  float v40;
  float v41;
  unint64_t v42;
  char v43;
  char v44;
  int v45;
  int v46;
  int v47;
  int v48;
  _DWORD *v49;
  CLKalmanSmootherEstimates *v50;
  double v51;
  float v52;
  double v53;
  float v54;
  float v55;
  float v56;
  float v57;
  int v58;
  int v59;
  int v60;
  unsigned int v61;
  unsigned int v62;
  int v63;
  unsigned int v64;
  unsigned int v65;
  int v66;
  double v67;
  double v68;
  double v69;
  double v70;
  NSObject *v71;
  unint64_t v72;
  unint64_t v73;
  uint64_t v74;
  uint64_t v75;
  unint64_t v76;
  unint64_t v77;
  uint64_t v78;
  const char *v79;
  uint8_t *v80;
  float v81;
  float v82;
  float v83;
  float v84;
  float v85;
  float v86;
  _DWORD v87[4];
  _BYTE v88[12];
  float v89[4];
  _BYTE v90[16];
  _BYTE v91[16];
  char v92[8];
  _BYTE v93[16];
  _DWORD v94[4];
  _DWORD v95[4];
  float v96;
  float v97;
  float v98;
  float v99;
  float v100;
  unint64_t v101;
  _DWORD v102[5];
  uint8_t buf[4];
  unint64_t v104;
  _DWORD v105[407];

  v10 = a6 - 1;
  objc_msgSend(objc_msgSend(a3, "objectAtIndex:", v10), "fState");
  v85 = v12;
  v86 = v11;
  objc_msgSend(objc_msgSend(a3, "objectAtIndex:", v10), "fCovariance");
  v96 = v13;
  v97 = v14;
  v98 = v15;
  v99 = v16;
  objc_msgSend(objc_msgSend(a3, "objectAtIndex:", a6), "fState");
  v83 = v18;
  v84 = v17;
  objc_msgSend(objc_msgSend(a3, "objectAtIndex:", a6), "fCovariance");
  v20 = v19;
  v22 = v21;
  v24 = v23;
  v26 = v25;
  *(float *)v94 = v19;
  *(float *)&v94[1] = v21;
  *(float *)&v94[2] = v23;
  *(float *)&v94[3] = v25;
  v95[0] = 0;
  v95[2] = 0;
  objc_msgSend(objc_msgSend(a3, "objectAtIndex:", a6), "F01");
  v95[1] = v27;
  v95[3] = 1065353216;
  objc_msgSend(objc_msgSend(a4, "lastObject"), "fState");
  v29 = v28;
  v31 = v30;
  objc_msgSend(objc_msgSend(a4, "lastObject"), "fCovariance");
  v81 = v33;
  v82 = v32;
  v35 = v34;
  v37 = v36;
  v38 = sub_10074E024((uint64_t)&v96, (uint64_t)v95);
  sub_10074E11C((uint64_t)v91, v38, v39, v40, v41);
  sub_10074E11C((uint64_t)v93, v20, v22, v24, v26);
  sub_10074BF38((uint64_t)v88, (uint64_t)v93);
  v42 = 0;
  v43 = 1;
  do
  {
    v44 = v43;
    v45 = *(_DWORD *)sub_100749250((uint64_t)v91, 0, v42);
    *(_DWORD *)sub_100749078((uint64_t)v92, 0) = v45;
    v46 = *(_DWORD *)sub_100749250((uint64_t)v91, 1uLL, v42);
    *(_DWORD *)sub_100749078((uint64_t)v92, 1uLL) = v46;
    sub_10074E1F0((uint64_t)v88, (uint64_t)v92);
    v47 = *(_DWORD *)sub_100749078((uint64_t)v92, 0);
    *(_DWORD *)sub_100749250((uint64_t)v89, 0, v42) = v47;
    v48 = *(_DWORD *)sub_100749078((uint64_t)v92, 1uLL);
    v49 = (_DWORD *)sub_100749250((uint64_t)v89, 1uLL, v42);
    v43 = 0;
    *v49 = v48;
    v42 = 1;
  }
  while ((v44 & 1) != 0);
  sub_10074E11C((uint64_t)v90, v89[0], v89[1], v89[2], v89[3]);
  v50 = objc_alloc_init(CLKalmanSmootherEstimates);
  objc_msgSend(objc_msgSend(a3, "objectAtIndex:", a5), "timestamp");
  -[CLKalmanSmootherEstimates setTimestamp:](v50, "setTimestamp:");
  *(float *)buf = v29 - v84;
  *(float *)&v104 = v31 - v83;
  *(float *)&v51 = v86 + sub_10074E4A4((uint64_t)v90, (float *)buf);
  *(float *)&v53 = v85 + v52;
  -[CLKalmanSmootherEstimates setFState:](v50, "setFState:", v51, v53);
  v54 = v96;
  v55 = v97;
  v56 = v98;
  v57 = v99;
  v87[0] = sub_10074E5B8((uint64_t)v94, v82, v81, v35, v37);
  v87[1] = v58;
  v87[2] = v59;
  v87[3] = v60;
  v100 = sub_10074E024((uint64_t)v90, (uint64_t)v87);
  v101 = __PAIR64__(v62, v61);
  v102[0] = v63;
  *(float *)buf = sub_10074E024((uint64_t)&v100, (uint64_t)v89);
  v104 = __PAIR64__(v65, v64);
  v105[0] = v66;
  *(float *)&v67 = sub_10074E550((uint64_t)buf, v54, v55, v56, v57);
  -[CLKalmanSmootherEstimates setFCovariance:](v50, "setFCovariance:", v67);
  if (objc_msgSend(a4, "count"))
  {
    objc_msgSend(objc_msgSend(a4, "lastObject"), "timestamp");
    v69 = v68;
    -[CLKalmanSmootherEstimates timestamp](v50, "timestamp");
    if (v69 < v70)
    {
      if (qword_10229FE80 != -1)
        dispatch_once(&qword_10229FE80, &stru_102150F80);
      v71 = qword_10229FE88;
      if (os_log_type_enabled((os_log_t)qword_10229FE88, OS_LOG_TYPE_INFO))
      {
        -[CLKalmanSmootherEstimates timestamp](v50, "timestamp");
        v73 = v72;
        objc_msgSend(objc_msgSend(a4, "lastObject"), "timestamp");
        *(float *)buf = 3.9123e-34;
        v104 = v73;
        LOWORD(v105[0]) = 2050;
        *(_QWORD *)((char *)v105 + 2) = v74;
        _os_log_impl((void *)&_mh_execute_header, v71, OS_LOG_TYPE_INFO, "Time order error in Kalman smoother estimate,currEntryTimestamp,%{public}f,prevEntryTimestamp,%{public}f", buf, 0x16u);
      }
      if (sub_1001BFF7C(115, 2))
      {
        bzero(buf, 0x65CuLL);
        if (qword_10229FE80 != -1)
          dispatch_once(&qword_10229FE80, &stru_102150F80);
        v75 = qword_10229FE88;
        -[CLKalmanSmootherEstimates timestamp](v50, "timestamp");
        v77 = v76;
        objc_msgSend(objc_msgSend(a4, "lastObject"), "timestamp");
        v100 = 3.9123e-34;
        v101 = v77;
        LOWORD(v102[0]) = 2050;
        *(_QWORD *)((char *)v102 + 2) = v78;
        _os_log_send_and_compose_impl(2, 0, buf, 1628, &_mh_execute_header, v75, 1, "Time order error in Kalman smoother estimate,currEntryTimestamp,%{public}f,prevEntryTimestamp,%{public}f", &v100, 22);
        v80 = (uint8_t *)v79;
        sub_100512490("Generic", 1, 0, 2, "-[CLElevationProfileEstimator _kalmanSmootherUpdateWithKFEstimatesBuffer:andKSEstimatesBuffer:andCurrPredictionIndex:andNextPredictionIndex:]", "%s\n", v79);
        if (v80 != buf)
          free(v80);
      }
    }
  }
  objc_msgSend(a4, "addObject:", v50);

}

- (void)_backwardProcessingWithKFEstimatesBuffer:(id)a3 andKSEstimatesBuffer:(id)a4
{
  id v7;
  CLKalmanSmootherEstimates *v8;
  id v9;
  uint64_t v10;
  uint64_t i;
  uint64_t v12;
  id v13;

  v7 = objc_msgSend(a3, "count");
  if ((_DWORD)v7)
  {
    v8 = objc_alloc_init(CLKalmanSmootherEstimates);
    v9 = objc_msgSend(a3, "lastObject");
    objc_msgSend(v9, "timestamp");
    -[CLKalmanSmootherEstimates setTimestamp:](v8, "setTimestamp:");
    objc_msgSend(v9, "fState");
    -[CLKalmanSmootherEstimates setFState:](v8, "setFState:");
    objc_msgSend(v9, "fCovariance");
    -[CLKalmanSmootherEstimates setFCovariance:](v8, "setFCovariance:");
    objc_msgSend(a4, "addObject:", v8);

    v10 = -[CLElevationProfileEstimator _getLastPredictionIndexWithKFEstimatesBuffer:fromIndex:](self, "_getLastPredictionIndexWithKFEstimatesBuffer:fromIndex:", a3, v7);
    for (i = -[CLElevationProfileEstimator _getLastPredictionIndexWithKFEstimatesBuffer:fromIndex:](self, "_getLastPredictionIndexWithKFEstimatesBuffer:fromIndex:", a3, v10); (i & 0x80000000) == 0; v10 = v12)
    {
      v12 = i;
      -[CLElevationProfileEstimator _kalmanSmootherUpdateWithKFEstimatesBuffer:andKSEstimatesBuffer:andCurrPredictionIndex:andNextPredictionIndex:](self, "_kalmanSmootherUpdateWithKFEstimatesBuffer:andKSEstimatesBuffer:andCurrPredictionIndex:andNextPredictionIndex:", a3, a4, i, v10);
      i = -[CLElevationProfileEstimator _getLastPredictionIndexWithKFEstimatesBuffer:fromIndex:](self, "_getLastPredictionIndexWithKFEstimatesBuffer:fromIndex:", a3, v12);
    }
    objc_msgSend(a3, "removeAllObjects");
    v13 = objc_msgSend(objc_msgSend(objc_msgSend(a4, "reverseObjectEnumerator"), "allObjects"), "mutableCopy");
    objc_msgSend(a4, "removeAllObjects");
    objc_msgSend(a4, "addObjectsFromArray:", v13);

  }
}

- (void)_elevationBatchProcessingWithStartTime:(double)a3 andEndTime:(double)a4 andLocationBuffer:(id)a5 andKSEstimatesBuffer:(id)a6 andTaskType:(unint64_t)a7 andCompletionBlock:(id)a8
{
  NSObject *v12;
  const char *v13;
  uint8_t *v14;
  double v15;
  double v16;
  int v17;
  unint64_t v18;
  __int16 v19;
  double v20;
  __int16 v21;
  double v22;
  uint8_t buf[4];
  unint64_t v24;
  __int16 v25;
  double v26;
  __int16 v27;
  double v28;

  if (qword_10229FE80 != -1)
    dispatch_once(&qword_10229FE80, &stru_102150F80);
  v12 = qword_10229FE88;
  if (os_log_type_enabled((os_log_t)qword_10229FE88, OS_LOG_TYPE_DEBUG))
  {
    *(_DWORD *)buf = 134218496;
    v24 = a7;
    v25 = 2048;
    v26 = a3;
    v27 = 2048;
    v28 = a4;
    _os_log_impl((void *)&_mh_execute_header, v12, OS_LOG_TYPE_DEBUG, "start elevation batch processing,taskType,%lu,startTime,%f,endTime,%f", buf, 0x20u);
  }
  if (sub_1001BFF7C(115, 2))
  {
    bzero(buf, 0x65CuLL);
    if (qword_10229FE80 != -1)
      dispatch_once(&qword_10229FE80, &stru_102150F80);
    v17 = 134218496;
    v18 = a7;
    v19 = 2048;
    v20 = a3;
    v21 = 2048;
    v22 = a4;
    LODWORD(v15) = 32;
    _os_log_send_and_compose_impl(2, 0, buf, 1628, &_mh_execute_header, qword_10229FE88, 2, "start elevation batch processing,taskType,%lu,startTime,%f,endTime,%f", &v17, v15, v16);
    v14 = (uint8_t *)v13;
    sub_100512490("Generic", 1, 0, 2, "-[CLElevationProfileEstimator _elevationBatchProcessingWithStartTime:andEndTime:andLocationBuffer:andKSEstimatesBuffer:andTaskType:andCompletionBlock:]", "%s\n", v13);
    if (v14 != buf)
      free(v14);
  }
  objc_alloc_init((Class)NSMutableArray);
  -[CLContextManagerElevationProfile getStoredVisit:betweenStartTime:andEndTime:withCompletionBlock:](self->_elevationProfileContextManager, "getStoredVisit:betweenStartTime:andEndTime:withCompletionBlock:", a3, a4);
}

- (void)computeElevationProfileWithStartTime:(double)a3 andEndTime:(double)a4
{
  _QWORD v5[7];

  v5[0] = _NSConcreteStackBlock;
  v5[1] = 3221225472;
  v5[2] = sub_10074F130;
  v5[3] = &unk_102150F60;
  *(double *)&v5[5] = a3;
  *(double *)&v5[6] = a4;
  v5[4] = self;
  -[CLContextManagerElevationProfileBase setRegisteredXPCTaskElevationProfile:](self->_elevationProfileContextManager, "setRegisteredXPCTaskElevationProfile:", 1);
  -[CLElevationProfileEstimator registerAndRunXPCActivity:withActivityIdentifier:andDescription:](self, "registerAndRunXPCActivity:withActivityIdentifier:andDescription:", v5, +[NSString stringWithUTF8String:](NSString, "stringWithUTF8String:", "com.apple.altimeter.historicalelevation"), CFSTR("elevation profile calculation"));
}

- (void)_logValuesOfLocationArray:(id)a3 andElevationArray:(id)a4 andTaskType:(unint64_t)a5
{
  id v6;
  __int128 v7;
  id v8;
  uint64_t v9;
  void *v10;
  void *v11;
  NSObject *v12;
  uint64_t v13;
  uint64_t v14;
  uint64_t v15;
  uint64_t v16;
  uint64_t v17;
  uint64_t v18;
  uint64_t v19;
  uint64_t v20;
  uint64_t v21;
  uint64_t v22;
  uint64_t v23;
  const char *v24;
  uint8_t *v25;
  id v26;
  id v27;
  id v28;
  uint64_t v29;
  void *v30;
  void *v31;
  NSObject *v32;
  uint64_t v33;
  uint64_t v34;
  uint64_t v35;
  uint64_t v36;
  uint64_t v37;
  uint64_t v38;
  uint64_t v39;
  const char *v40;
  uint8_t *v41;
  id v42;
  double v43;
  __int128 v44;
  uint64_t v45;
  __int128 v48;
  __int128 v49;
  __int128 v50;
  __int128 v51;
  __int128 v52;
  __int128 v53;
  __int128 v54;
  __int128 v55;
  _BYTE v56[128];
  int v57;
  unint64_t v58;
  __int16 v59;
  uint64_t v60;
  __int16 v61;
  uint64_t v62;
  __int16 v63;
  uint64_t v64;
  uint8_t buf[4];
  unint64_t v66;
  __int16 v67;
  uint64_t v68;
  __int16 v69;
  uint64_t v70;
  __int16 v71;
  uint64_t v72;
  _BYTE v73[128];

  if (self->_isVerboseLogging)
  {
    if (objc_msgSend(a3, "count"))
    {
      v54 = 0u;
      v55 = 0u;
      v52 = 0u;
      v53 = 0u;
      v6 = objc_msgSend(a3, "countByEnumeratingWithState:objects:count:", &v52, v73, 16);
      if (v6)
      {
        v8 = v6;
        v9 = *(_QWORD *)v53;
        *(_QWORD *)&v7 = 134218752;
        v44 = v7;
        do
        {
          v10 = 0;
          do
          {
            if (*(_QWORD *)v53 != v9)
              objc_enumerationMutation(a3);
            v11 = *(void **)(*((_QWORD *)&v52 + 1) + 8 * (_QWORD)v10);
            if (qword_10229FE80 != -1)
              dispatch_once(&qword_10229FE80, &stru_102150F80);
            v12 = qword_10229FE88;
            if (os_log_type_enabled((os_log_t)qword_10229FE88, OS_LOG_TYPE_DEBUG))
            {
              objc_msgSend(v11, "timestamp");
              v14 = v13;
              objc_msgSend(v11, "elevation");
              v16 = v15;
              objc_msgSend(v11, "verticalAccuracy");
              *(_DWORD *)buf = v44;
              v66 = a5;
              v67 = 2048;
              v68 = v14;
              v69 = 2048;
              v70 = v16;
              v71 = 2048;
              v72 = v17;
              _os_log_impl((void *)&_mh_execute_header, v12, OS_LOG_TYPE_DEBUG, "enumerate locations,taskType,%lu,timestamp,%f,elevation,%f,verticalAccuracy,%f", buf, 0x2Au);
            }
            if (sub_1001BFF7C(115, 2))
            {
              bzero(buf, 0x65CuLL);
              if (qword_10229FE80 != -1)
                dispatch_once(&qword_10229FE80, &stru_102150F80);
              v18 = qword_10229FE88;
              objc_msgSend(v11, "timestamp");
              v20 = v19;
              objc_msgSend(v11, "elevation");
              v22 = v21;
              objc_msgSend(v11, "verticalAccuracy");
              v57 = v44;
              v58 = a5;
              v59 = 2048;
              v60 = v20;
              v61 = 2048;
              v62 = v22;
              v63 = 2048;
              v64 = v23;
              LODWORD(v43) = 42;
              _os_log_send_and_compose_impl(2, 0, buf, 1628, &_mh_execute_header, v18, 2, "enumerate locations,taskType,%lu,timestamp,%f,elevation,%f,verticalAccuracy,%f", &v57, v43, *(double *)&v44, *((double *)&v44 + 1));
              v25 = (uint8_t *)v24;
              sub_100512490("Generic", 1, 0, 2, "-[CLElevationProfileEstimator _logValuesOfLocationArray:andElevationArray:andTaskType:]", "%s\n", v24);
              if (v25 != buf)
                free(v25);
            }
            v10 = (char *)v10 + 1;
          }
          while (v8 != v10);
          v26 = objc_msgSend(a3, "countByEnumeratingWithState:objects:count:", &v52, v73, 16);
          v8 = v26;
        }
        while (v26);
      }
    }
    if (objc_msgSend(a4, "count"))
    {
      v50 = 0u;
      v51 = 0u;
      v48 = 0u;
      v49 = 0u;
      v27 = objc_msgSend(a4, "countByEnumeratingWithState:objects:count:", &v48, v56, 16);
      if (v27)
      {
        v28 = v27;
        v29 = *(_QWORD *)v49;
        v45 = 134218496;
        do
        {
          v30 = 0;
          do
          {
            if (*(_QWORD *)v49 != v29)
              objc_enumerationMutation(a4);
            v31 = *(void **)(*((_QWORD *)&v48 + 1) + 8 * (_QWORD)v30);
            if (qword_10229FE80 != -1)
              dispatch_once(&qword_10229FE80, &stru_102150F80);
            v32 = qword_10229FE88;
            if (os_log_type_enabled((os_log_t)qword_10229FE88, OS_LOG_TYPE_DEBUG))
            {
              objc_msgSend(v31, "timestamp");
              v34 = v33;
              objc_msgSend(v31, "pressure");
              *(_DWORD *)buf = v45;
              v66 = a5;
              v67 = 2048;
              v68 = v34;
              v69 = 2048;
              v70 = v35;
              _os_log_impl((void *)&_mh_execute_header, v32, OS_LOG_TYPE_DEBUG, "enumerate elevations,taskType,%lu,timestamp,%f,pressure,%f", buf, 0x20u);
            }
            if (sub_1001BFF7C(115, 2))
            {
              bzero(buf, 0x65CuLL);
              if (qword_10229FE80 != -1)
                dispatch_once(&qword_10229FE80, &stru_102150F80);
              v36 = qword_10229FE88;
              objc_msgSend(v31, "timestamp");
              v38 = v37;
              objc_msgSend(v31, "pressure");
              v57 = v45;
              v58 = a5;
              v59 = 2048;
              v60 = v38;
              v61 = 2048;
              v62 = v39;
              LODWORD(v43) = 32;
              _os_log_send_and_compose_impl(2, 0, buf, 1628, &_mh_execute_header, v36, 2, "enumerate elevations,taskType,%lu,timestamp,%f,pressure,%f", &v57, v43, *(double *)&v45);
              v41 = (uint8_t *)v40;
              sub_100512490("Generic", 1, 0, 2, "-[CLElevationProfileEstimator _logValuesOfLocationArray:andElevationArray:andTaskType:]", "%s\n", v40);
              if (v41 != buf)
                free(v41);
            }
            v30 = (char *)v30 + 1;
          }
          while (v28 != v30);
          v42 = objc_msgSend(a4, "countByEnumeratingWithState:objects:count:", &v48, v56, 16);
          v28 = v42;
        }
        while (v42);
      }
    }
  }
}

- (void)_logValuesOfFilteredLocations:(id)a3 andTaskType:(unint64_t)a4
{
  id v5;
  __int128 v6;
  id v7;
  uint64_t v8;
  void *v9;
  void *v10;
  NSObject *v11;
  uint64_t v12;
  uint64_t v13;
  uint64_t v14;
  uint64_t v15;
  uint64_t v16;
  uint64_t v17;
  uint64_t v18;
  uint64_t v19;
  uint64_t v20;
  uint64_t v21;
  uint64_t v22;
  uint64_t v23;
  uint64_t v24;
  uint64_t v25;
  uint64_t v26;
  const char *v27;
  uint8_t *v28;
  id v29;
  double v30;
  __int128 v31;
  double v32;
  __int128 v34;
  __int128 v35;
  __int128 v36;
  __int128 v37;
  int v38;
  unint64_t v39;
  __int16 v40;
  uint64_t v41;
  __int16 v42;
  uint64_t v43;
  __int16 v44;
  uint64_t v45;
  __int16 v46;
  uint64_t v47;
  uint8_t buf[4];
  unint64_t v49;
  __int16 v50;
  uint64_t v51;
  __int16 v52;
  uint64_t v53;
  __int16 v54;
  uint64_t v55;
  __int16 v56;
  uint64_t v57;
  _BYTE v58[128];

  if (self->_isVerboseLogging)
  {
    v36 = 0u;
    v37 = 0u;
    v34 = 0u;
    v35 = 0u;
    v5 = objc_msgSend(a3, "countByEnumeratingWithState:objects:count:", &v34, v58, 16);
    if (v5)
    {
      v7 = v5;
      v8 = *(_QWORD *)v35;
      *(_QWORD *)&v6 = 134219008;
      v31 = v6;
      do
      {
        v9 = 0;
        do
        {
          if (*(_QWORD *)v35 != v8)
            objc_enumerationMutation(a3);
          v10 = *(void **)(*((_QWORD *)&v34 + 1) + 8 * (_QWORD)v9);
          if (qword_10229FE80 != -1)
            dispatch_once(&qword_10229FE80, &stru_102150F80);
          v11 = qword_10229FE88;
          if (os_log_type_enabled((os_log_t)qword_10229FE88, OS_LOG_TYPE_DEBUG))
          {
            objc_msgSend(v10, "timestamp");
            v13 = v12;
            objc_msgSend(v10, "elevation");
            v15 = v14;
            objc_msgSend(v10, "verticalAccuracy");
            v17 = v16;
            objc_msgSend(v10, "interpPressure");
            *(_DWORD *)buf = v31;
            v49 = a4;
            v50 = 2048;
            v51 = v13;
            v52 = 2048;
            v53 = v15;
            v54 = 2048;
            v55 = v17;
            v56 = 2048;
            v57 = v18;
            _os_log_impl((void *)&_mh_execute_header, v11, OS_LOG_TYPE_DEBUG, "enumerate filtered locations,taskType,%lu,timestamp,%f,elevation,%f,verticalAccuracy,%f,interpPressure,%f", buf, 0x34u);
          }
          if (sub_1001BFF7C(115, 2))
          {
            bzero(buf, 0x65CuLL);
            if (qword_10229FE80 != -1)
              dispatch_once(&qword_10229FE80, &stru_102150F80);
            v19 = qword_10229FE88;
            objc_msgSend(v10, "timestamp");
            v21 = v20;
            objc_msgSend(v10, "elevation");
            v23 = v22;
            objc_msgSend(v10, "verticalAccuracy");
            v25 = v24;
            objc_msgSend(v10, "interpPressure");
            v38 = v31;
            v39 = a4;
            v40 = 2048;
            v41 = v21;
            v42 = 2048;
            v43 = v23;
            v44 = 2048;
            v45 = v25;
            v46 = 2048;
            v47 = v26;
            LODWORD(v30) = 52;
            _os_log_send_and_compose_impl(2, 0, buf, 1628, &_mh_execute_header, v19, 2, "enumerate filtered locations,taskType,%lu,timestamp,%f,elevation,%f,verticalAccuracy,%f,interpPressure,%f", &v38, v30, *(double *)&v31, *((double *)&v31 + 1), v32);
            v28 = (uint8_t *)v27;
            sub_100512490("Generic", 1, 0, 2, "-[CLElevationProfileEstimator _logValuesOfFilteredLocations:andTaskType:]", "%s\n", v27);
            if (v28 != buf)
              free(v28);
          }
          v9 = (char *)v9 + 1;
        }
        while (v7 != v9);
        v29 = objc_msgSend(a3, "countByEnumeratingWithState:objects:count:", &v34, v58, 16);
        v7 = v29;
      }
      while (v29);
    }
  }
}

- (CLContextManagerElevationProfile)elevationProfileContextManager
{
  return self->_elevationProfileContextManager;
}

- (void)setElevationProfileContextManager:(id)a3
{
  self->_elevationProfileContextManager = (CLContextManagerElevationProfile *)a3;
}

@end
