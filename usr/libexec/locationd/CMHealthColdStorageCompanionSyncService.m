@implementation CMHealthColdStorageCompanionSyncService

+ (void)becameFatallyBlocked:(id)a3 index:(unint64_t)a4
{
  unint64_t v5;

  v5 = a4 + 1;
  if (a4 + 1 < (unint64_t)objc_msgSend(a3, "count"))
    objc_msgSend(objc_msgSend(a3, "objectAtIndexedSubscript:", v5), "becameFatallyBlocked:index:", a3, v5);
}

+ (void)performSyncOnSilo:(id)a3 invoker:(id)a4
{
  objc_msgSend(a3, "sync:", a4);
}

+ (id)getSilo
{
  if (qword_10230C488 != -1)
    dispatch_once(&qword_10230C488, &stru_10219FB30);
  return (id)qword_10230C480;
}

- (CMHealthColdStorageCompanionSyncService)init
{
  objc_super v3;

  v3.receiver = self;
  v3.super_class = (Class)CMHealthColdStorageCompanionSyncService;
  return -[CMHealthColdStorageCompanionSyncService initWithInboundProtocol:outboundProtocol:](&v3, "initWithInboundProtocol:outboundProtocol:", &OBJC_PROTOCOL___CMHealthColdStorageCompanionSyncServiceProtocol, &OBJC_PROTOCOL___CMHealthColdStorageCompanionSyncServiceClientProtocol);
}

+ (BOOL)isSupported
{
  if (qword_10230C498 != -1)
    dispatch_once(&qword_10230C498, &stru_10219FB50);
  return byte_10230C490;
}

- (void)beginService
{
  NSObject *v3;
  std::__shared_weak_count *v4;
  unint64_t *v5;
  unint64_t v6;
  const char *v7;
  __int128 *v8;
  uint64_t v9;
  uint64_t v10;
  __int128 buf;

  if (qword_10229FFA0 != -1)
    dispatch_once(&qword_10229FFA0, &stru_10219FB70);
  v3 = qword_10229FFA8;
  if (os_log_type_enabled((os_log_t)qword_10229FFA8, OS_LOG_TYPE_DEFAULT))
  {
    LOWORD(buf) = 0;
    _os_log_impl((void *)&_mh_execute_header, v3, OS_LOG_TYPE_DEFAULT, "Starting up CMHealthColdStorageCompanionSyncService", (uint8_t *)&buf, 2u);
  }
  if (sub_1001BFF7C(115, 2))
  {
    bzero(&buf, 0x65CuLL);
    if (qword_10229FFA0 != -1)
      dispatch_once(&qword_10229FFA0, &stru_10219FB70);
    LOWORD(v9) = 0;
    _os_log_send_and_compose_impl(2, 0, &buf, 1628, &_mh_execute_header, qword_10229FFA8, 0, "Starting up CMHealthColdStorageCompanionSyncService", &v9, 2);
    v8 = (__int128 *)v7;
    sub_100512490("Generic", 1, 0, 2, "-[CMHealthColdStorageCompanionSyncService beginService]", "%s\n", v7);
    if (v8 != &buf)
      free(v8);
  }
  LOBYTE(v10) = 0;
  sub_1004EBF2C((unsigned __int8 *)&v10, &buf);
  sub_1002B7674((uint64_t)&self->fInputHRDb, &buf);
  v4 = (std::__shared_weak_count *)*((_QWORD *)&buf + 1);
  if (*((_QWORD *)&buf + 1))
  {
    v5 = (unint64_t *)(*((_QWORD *)&buf + 1) + 8);
    do
      v6 = __ldaxr(v5);
    while (__stlxr(v6 - 1, v5));
    if (!v6)
    {
      ((void (*)(std::__shared_weak_count *))v4->__on_zero_shared)(v4);
      std::__shared_weak_count::__release_weak(v4);
    }
  }
  operator new();
}

- (void)endService
{
  NSObject *v3;
  NSObject *fAggregationTimer;
  NSObject *fCoreAnalyticsTimer;
  const char *v6;
  uint8_t *v7;
  _WORD v8[8];
  uint8_t buf[1640];

  if (qword_10229FFA0 != -1)
    dispatch_once(&qword_10229FFA0, &stru_10219FB70);
  v3 = qword_10229FFA8;
  if (os_log_type_enabled((os_log_t)qword_10229FFA8, OS_LOG_TYPE_DEFAULT))
  {
    *(_WORD *)buf = 0;
    _os_log_impl((void *)&_mh_execute_header, v3, OS_LOG_TYPE_DEFAULT, "Shutting down CMHealthColdStorageCompanionSyncService", buf, 2u);
  }
  if (sub_1001BFF7C(115, 2))
  {
    bzero(buf, 0x65CuLL);
    if (qword_10229FFA0 != -1)
      dispatch_once(&qword_10229FFA0, &stru_10219FB70);
    v8[0] = 0;
    _os_log_send_and_compose_impl(2, 0, buf, 1628, &_mh_execute_header, qword_10229FFA8, 0, "Shutting down CMHealthColdStorageCompanionSyncService", v8, 2);
    v7 = (uint8_t *)v6;
    sub_100512490("Generic", 1, 0, 2, "-[CMHealthColdStorageCompanionSyncService endService]", "%s\n", v6);
    if (v7 != buf)
      free(v7);
  }
  fAggregationTimer = self->fAggregationTimer;
  if (fAggregationTimer)
  {
    dispatch_source_cancel(fAggregationTimer);
    dispatch_release((dispatch_object_t)self->fAggregationTimer);
    self->fAggregationTimer = 0;
  }
  fCoreAnalyticsTimer = self->fCoreAnalyticsTimer;
  if (fCoreAnalyticsTimer)
  {
    dispatch_source_cancel(fCoreAnalyticsTimer);
    dispatch_release((dispatch_object_t)self->fCoreAnalyticsTimer);
    self->fCoreAnalyticsTimer = 0;
  }
}

- (void)setUpAggregationOnTimer
{
  uint64_t v3;
  std::__shared_weak_count *v4;
  unint64_t *p_shared_owners;
  unint64_t v6;
  uint64_t v7;
  OS_dispatch_source *v8;
  NSObject *fAggregationTimer;
  _QWORD v10[5];
  uint64_t v11;
  std::__shared_weak_count *v12;
  int v13;

  sub_1004E7AF0((void **)self->fInputHRAggregator.__ptr_.__value_, 604800.0);
  sub_1004E7DA4((void **)self->fInputWRAggregator.__ptr_.__value_, 604800.0);
  sub_1004E8058((void **)self->fSessionAggregator.__ptr_.__value_, 15552000.0);
  sub_10061125C((void **)self->fElevationGradeAggregator.__ptr_.__value_, 604800.0);
  v13 = 86400;
  v3 = sub_100127B9C();
  sub_100081C10(v3, &v11);
  sub_1001E4B84(v11, "HRRecoveryAggregationTimeInterval", &v13);
  v4 = v12;
  if (v12)
  {
    p_shared_owners = (unint64_t *)&v12->__shared_owners_;
    do
      v6 = __ldaxr(p_shared_owners);
    while (__stlxr(v6 - 1, p_shared_owners));
    if (!v6)
    {
      ((void (*)(std::__shared_weak_count *))v4->__on_zero_shared)(v4);
      std::__shared_weak_count::__release_weak(v4);
    }
  }
  v7 = 1000000000 * v13;
  v8 = (OS_dispatch_source *)dispatch_source_create((dispatch_source_type_t)&_dispatch_source_type_timer, 0, 0, (dispatch_queue_t)objc_msgSend(objc_msgSend(-[CMHealthColdStorageCompanionSyncService universe](self, "universe"), "silo"), "queue"));
  self->fAggregationTimer = v8;
  dispatch_source_set_timer((dispatch_source_t)v8, 0, v7, 0xDF8475800uLL);
  fAggregationTimer = self->fAggregationTimer;
  v10[0] = _NSConcreteStackBlock;
  v10[1] = 3221225472;
  v10[2] = sub_1010C2650;
  v10[3] = &unk_10212BB58;
  v10[4] = self;
  dispatch_source_set_event_handler(fAggregationTimer, v10);
  dispatch_resume((dispatch_object_t)self->fAggregationTimer);
}

- (void)receiveColdStorageDataUpdate:(id)a3
{
  id v5;
  uint64_t v6;
  uint64_t v7;
  id v8;
  id v9;
  uint64_t v10;
  void *i;
  void *v12;
  uint64_t v13;
  uint64_t v14;
  uint64_t v15;
  NSObject *v16;
  const char *v17;
  NSObject *v18;
  id v19;
  uint64_t v20;
  uint64_t v21;
  id v22;
  id v23;
  uint64_t v24;
  void *j;
  void *v26;
  uint64_t v27;
  uint64_t v28;
  uint64_t v29;
  uint64_t v30;
  NSObject *v31;
  id v32;
  uint64_t v33;
  uint64_t v34;
  id v35;
  id v36;
  uint64_t v37;
  void *k;
  void *v39;
  NSObject *v40;
  id v41;
  uint64_t v42;
  uint64_t v43;
  id v44;
  id v45;
  uint64_t v46;
  void *m;
  void *v48;
  uint64_t v49;
  double v50;
  uint64_t v51;
  uint64_t v52;
  uint64_t v53;
  NSObject *v54;
  NSObject *v55;
  id v56;
  uint64_t v57;
  uint64_t v58;
  id v59;
  id v60;
  uint64_t v61;
  void *n;
  void *v63;
  uint64_t v64;
  float v65;
  NSObject *v66;
  id v67;
  NSObject *v68;
  const char *v69;
  uint8_t *v70;
  const char *v71;
  uint8_t *v72;
  const char *v73;
  uint8_t *v74;
  const char *v75;
  uint8_t *v76;
  const char *v77;
  uint8_t *v78;
  uint64_t v79;
  id v80;
  const char *v81;
  uint8_t *v82;
  uint8_t *v83;
  uint64_t v84;
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
  __int128 v101;
  __int128 v102;
  __int128 v103;
  __int128 v104;
  int v105;
  id v106;
  _BYTE v107[128];
  _BYTE v108[128];
  __int128 v109;
  double v110;
  unsigned int v111;
  uint64_t v112;
  uint64_t v113;
  uint64_t v114;
  unsigned int v115;
  __int128 v116;
  __int128 v117;
  __int128 v118;
  uint64_t v119;
  _BYTE v120[128];
  _BYTE v121[128];
  uint8_t v122[128];
  uint8_t buf[16];
  __int128 v124;
  __int128 v125;
  __int128 v126;
  __int128 v127;
  __int128 v128;
  __int128 v129;
  __int128 v130;
  __int128 v131;
  __int128 v132;

  if (!a3)
  {
    if (qword_10229FFA0 != -1)
      dispatch_once(&qword_10229FFA0, &stru_10219FB70);
    v16 = qword_10229FFA8;
    if (os_log_type_enabled((os_log_t)qword_10229FFA8, OS_LOG_TYPE_ERROR))
    {
      *(_WORD *)buf = 0;
      _os_log_impl((void *)&_mh_execute_header, v16, OS_LOG_TYPE_ERROR, "[CompanionSyncService] received empty message from watch", buf, 2u);
    }
    if (!sub_1001BFF7C(115, 0))
      goto LABEL_102;
    bzero(buf, 0x65CuLL);
    if (qword_10229FFA0 != -1)
      dispatch_once(&qword_10229FFA0, &stru_10219FB70);
    LOWORD(v109) = 0;
    _os_log_send_and_compose_impl(2, 0, buf, 1628, &_mh_execute_header, qword_10229FFA8, 16, "[CompanionSyncService] received empty message from watch", &v109, 2);
    goto LABEL_136;
  }
  if (objc_msgSend(a3, "objectForKeyedSubscript:", CFSTR("HRRecoveryInputHRKey")))
  {
    v5 = objc_msgSend(a3, "objectForKeyedSubscript:", CFSTR("HRRecoveryInputHRKey"));
    v7 = objc_opt_class(NSArray, v6);
    if ((objc_opt_isKindOfClass(v5, v7) & 1) != 0)
    {
      memset(buf, 0, sizeof(buf));
      v101 = 0u;
      v102 = 0u;
      v103 = 0u;
      v104 = 0u;
      v8 = objc_msgSend(v5, "countByEnumeratingWithState:objects:count:", &v101, v122, 16);
      if (v8)
      {
        v9 = v8;
        v10 = *(_QWORD *)v102;
        do
        {
          for (i = 0; i != v9; i = (char *)i + 1)
          {
            if (*(_QWORD *)v102 != v10)
              objc_enumerationMutation(v5);
            v12 = *(void **)(*((_QWORD *)&v101 + 1) + 8 * (_QWORD)i);
            *(_QWORD *)buf = objc_msgSend(v12, "recordId");
            objc_msgSend(v12, "startTime");
            *(_QWORD *)&buf[8] = v13;
            objc_msgSend(v12, "hr");
            *(_QWORD *)&v124 = v14;
            objc_msgSend(v12, "hrConfidence");
            *((_QWORD *)&v124 + 1) = v15;
            sub_100423B04((uint64_t)self->fInputHRDb.__ptr_, (uint64_t)buf);
          }
          v9 = objc_msgSend(v5, "countByEnumeratingWithState:objects:count:", &v101, v122, 16);
        }
        while (v9);
      }
      self->fStats.numRecordsSync_HRRIHH += objc_msgSend(v5, "count");
    }
    else
    {
      if (qword_10229FFA0 != -1)
        dispatch_once(&qword_10229FFA0, &stru_10219FB70);
      v18 = qword_10229FFA8;
      if (os_log_type_enabled((os_log_t)qword_10229FFA8, OS_LOG_TYPE_ERROR))
      {
        *(_DWORD *)buf = 138412290;
        *(_QWORD *)&buf[4] = v5;
        _os_log_impl((void *)&_mh_execute_header, v18, OS_LOG_TYPE_ERROR, "[CompanionSyncService] Received malformed HRRecoveryInputHRKey %@", buf, 0xCu);
      }
      if (sub_1001BFF7C(115, 0))
      {
        bzero(buf, 0x65CuLL);
        if (qword_10229FFA0 != -1)
          dispatch_once(&qword_10229FFA0, &stru_10219FB70);
        LODWORD(v109) = 138412290;
        *(_QWORD *)((char *)&v109 + 4) = v5;
        _os_log_send_and_compose_impl(2, 0, buf, 1628, &_mh_execute_header, qword_10229FFA8, 16, "[CompanionSyncService] Received malformed HRRecoveryInputHRKey %@", &v109, 12);
        v70 = (uint8_t *)v69;
        sub_100512490("Generic", 1, 0, 0, "-[CMHealthColdStorageCompanionSyncService receiveColdStorageDataUpdate:]", "%s\n", v69);
        if (v70 != buf)
          free(v70);
      }
      ++self->fStats.numErrors;
    }
  }
  if (objc_msgSend(a3, "objectForKeyedSubscript:", CFSTR("HRRecoveryInputWRKey")))
  {
    v19 = objc_msgSend(a3, "objectForKeyedSubscript:", CFSTR("HRRecoveryInputWRKey"));
    v21 = objc_opt_class(NSArray, v20);
    if ((objc_opt_isKindOfClass(v19, v21) & 1) != 0)
    {
      memset(buf, 0, sizeof(buf));
      DWORD2(v124) = 0;
      *(_QWORD *)&v124 = 0;
      v125 = 0uLL;
      LODWORD(v126) = 3;
      v97 = 0u;
      v98 = 0u;
      v99 = 0u;
      v100 = 0u;
      v22 = objc_msgSend(v19, "countByEnumeratingWithState:objects:count:", &v97, v121, 16);
      if (v22)
      {
        v23 = v22;
        v24 = *(_QWORD *)v98;
        do
        {
          for (j = 0; j != v23; j = (char *)j + 1)
          {
            if (*(_QWORD *)v98 != v24)
              objc_enumerationMutation(v19);
            v26 = *(void **)(*((_QWORD *)&v97 + 1) + 8 * (_QWORD)j);
            *(_QWORD *)buf = objc_msgSend(v26, "recordId");
            objc_msgSend(v26, "startTime");
            *(_QWORD *)&buf[8] = v27;
            objc_msgSend(v26, "mets");
            *(_QWORD *)&v124 = v28;
            DWORD2(v124) = objc_msgSend(v26, "gradeType");
            objc_msgSend(v26, "grade");
            *(_QWORD *)&v125 = v29;
            objc_msgSend(v26, "userMets");
            *((_QWORD *)&v125 + 1) = v30;
            LODWORD(v126) = objc_msgSend(v26, "userMetsSource");
            sub_100423B04((uint64_t)self->fInputWRDb.__ptr_, (uint64_t)buf);
          }
          v23 = objc_msgSend(v19, "countByEnumeratingWithState:objects:count:", &v97, v121, 16);
        }
        while (v23);
      }
      self->fStats.numRecordsSync_HRRIWH += objc_msgSend(v19, "count");
    }
    else
    {
      if (qword_10229FFA0 != -1)
        dispatch_once(&qword_10229FFA0, &stru_10219FB70);
      v31 = qword_10229FFA8;
      if (os_log_type_enabled((os_log_t)qword_10229FFA8, OS_LOG_TYPE_ERROR))
      {
        *(_DWORD *)buf = 138412290;
        *(_QWORD *)&buf[4] = v19;
        _os_log_impl((void *)&_mh_execute_header, v31, OS_LOG_TYPE_ERROR, "[CompanionSyncService] Received malformed HRRecoveryInputWRKey %@", buf, 0xCu);
      }
      if (sub_1001BFF7C(115, 0))
      {
        bzero(buf, 0x65CuLL);
        if (qword_10229FFA0 != -1)
          dispatch_once(&qword_10229FFA0, &stru_10219FB70);
        LODWORD(v109) = 138412290;
        *(_QWORD *)((char *)&v109 + 4) = v19;
        LODWORD(v84) = 12;
        _os_log_send_and_compose_impl(2, 0, buf, 1628, &_mh_execute_header, qword_10229FFA8, 16, "[CompanionSyncService] Received malformed HRRecoveryInputWRKey %@", &v109, v84);
        v72 = (uint8_t *)v71;
        sub_100512490("Generic", 1, 0, 0, "-[CMHealthColdStorageCompanionSyncService receiveColdStorageDataUpdate:]", "%s\n", v71);
        if (v72 != buf)
          free(v72);
      }
      ++self->fStats.numErrors;
    }
  }
  if (objc_msgSend(a3, "objectForKeyedSubscript:", CFSTR("HRRecoverySessionKey")))
  {
    v32 = objc_msgSend(a3, "objectForKeyedSubscript:", CFSTR("HRRecoverySessionKey"));
    v34 = objc_opt_class(NSArray, v33);
    if ((objc_opt_isKindOfClass(v32, v34) & 1) != 0)
    {
      v95 = 0u;
      v96 = 0u;
      v93 = 0u;
      v94 = 0u;
      v35 = objc_msgSend(v32, "countByEnumeratingWithState:objects:count:", &v93, v120, 16);
      if (v35)
      {
        v36 = v35;
        v37 = *(_QWORD *)v94;
        do
        {
          for (k = 0; k != v36; k = (char *)k + 1)
          {
            if (*(_QWORD *)v94 != v37)
              objc_enumerationMutation(v32);
            v39 = *(void **)(*((_QWORD *)&v93 + 1) + 8 * (_QWORD)k);
            if (v39)
            {
              objc_msgSend(v39, "recoverySession");
            }
            else
            {
              v132 = 0u;
              v131 = 0u;
              v130 = 0u;
              v129 = 0u;
              v128 = 0u;
              v127 = 0u;
              v126 = 0u;
              v125 = 0u;
              v124 = 0u;
              *(_OWORD *)buf = 0u;
            }
            sub_100423B04((uint64_t)self->fSessionDb.__ptr_, (uint64_t)buf);
          }
          v36 = objc_msgSend(v32, "countByEnumeratingWithState:objects:count:", &v93, v120, 16);
        }
        while (v36);
      }
      self->fStats.numRecordsSync_HRRSH += objc_msgSend(v32, "count");
    }
    else
    {
      if (qword_10229FFA0 != -1)
        dispatch_once(&qword_10229FFA0, &stru_10219FB70);
      v40 = qword_10229FFA8;
      if (os_log_type_enabled((os_log_t)qword_10229FFA8, OS_LOG_TYPE_ERROR))
      {
        *(_DWORD *)buf = 138412290;
        *(_QWORD *)&buf[4] = v32;
        _os_log_impl((void *)&_mh_execute_header, v40, OS_LOG_TYPE_ERROR, "[CompanionSyncService] Received malformed HRRecoverySessionKey %@", buf, 0xCu);
      }
      if (sub_1001BFF7C(115, 0))
      {
        bzero(buf, 0x65CuLL);
        if (qword_10229FFA0 != -1)
          dispatch_once(&qword_10229FFA0, &stru_10219FB70);
        LODWORD(v109) = 138412290;
        *(_QWORD *)((char *)&v109 + 4) = v32;
        LODWORD(v84) = 12;
        _os_log_send_and_compose_impl(2, 0, buf, 1628, &_mh_execute_header, qword_10229FFA8, 16, "[CompanionSyncService] Received malformed HRRecoverySessionKey %@", &v109, v84);
        v74 = (uint8_t *)v73;
        sub_100512490("Generic", 1, 0, 0, "-[CMHealthColdStorageCompanionSyncService receiveColdStorageDataUpdate:]", "%s\n", v73);
        if (v74 != buf)
          free(v74);
      }
      ++self->fStats.numErrors;
    }
  }
  if (objc_msgSend(a3, "objectForKeyedSubscript:", CFSTR("PredictedWalkDistanceBoutKey")))
  {
    v41 = objc_msgSend(a3, "objectForKeyedSubscript:", CFSTR("PredictedWalkDistanceBoutKey"));
    v43 = objc_opt_class(NSArray, v42);
    if ((objc_opt_isKindOfClass(v41, v43) & 1) != 0)
    {
      LODWORD(v109) = 0;
      v110 = 0.0;
      *((_QWORD *)&v109 + 1) = 0;
      v111 = 0;
      v114 = 0;
      v112 = 0;
      v113 = 0;
      v115 = 0;
      v116 = 0u;
      v117 = 0u;
      v118 = 0u;
      v119 = 0;
      v89 = 0u;
      v90 = 0u;
      v91 = 0u;
      v92 = 0u;
      v44 = objc_msgSend(v41, "countByEnumeratingWithState:objects:count:", &v89, v108, 16);
      if (v44)
      {
        v45 = v44;
        v46 = *(_QWORD *)v90;
        do
        {
          for (m = 0; m != v45; m = (char *)m + 1)
          {
            if (*(_QWORD *)v90 != v46)
              objc_enumerationMutation(v41);
            v48 = *(void **)(*((_QWORD *)&v89 + 1) + 8 * (_QWORD)m);
            LODWORD(v109) = objc_msgSend(v48, "recordId");
            objc_msgSend(v48, "startTime");
            *((_QWORD *)&v109 + 1) = v49;
            objc_msgSend(v48, "endTime");
            v110 = v50;
            v111 = objc_msgSend(v48, "stepCount");
            objc_msgSend(v48, "distance");
            v112 = v51;
            objc_msgSend(v48, "activeTime");
            v113 = v52;
            LODWORD(v114) = objc_msgSend(v48, "elevationAscended");
            HIDWORD(v114) = objc_msgSend(v48, "elevationDescended");
            v115 = objc_msgSend(v48, "stepCountGPS");
            objc_msgSend(v48, "distanceGPS");
            *(_QWORD *)&v116 = v53;
            DWORD2(v116) = objc_msgSend(v48, "boutType");
            (*(void (**)(CLPredictedWalkDistanceBoutRecorderDb *, __int128 *))(*(_QWORD *)self->fPredWalkDistanceBoutDb.__ptr_
                                                                                        + 160))(self->fPredWalkDistanceBoutDb.__ptr_, &v109);
          }
          v45 = objc_msgSend(v41, "countByEnumeratingWithState:objects:count:", &v89, v108, 16);
        }
        while (v45);
      }
      if (qword_10229FFA0 != -1)
        dispatch_once(&qword_10229FFA0, &stru_10219FB70);
      v54 = qword_10229FFA8;
      if (os_log_type_enabled((os_log_t)qword_10229FFA8, OS_LOG_TYPE_DEBUG))
      {
        *(_WORD *)buf = 0;
        _os_log_impl((void *)&_mh_execute_header, v54, OS_LOG_TYPE_DEBUG, "[CompanionSyncService] Received cold storage data of type PredictedWalkDistanceBoutKey", buf, 2u);
      }
      if (sub_1001BFF7C(115, 2))
      {
        bzero(buf, 0x65CuLL);
        if (qword_10229FFA0 != -1)
          dispatch_once(&qword_10229FFA0, &stru_10219FB70);
        LOWORD(v105) = 0;
        LODWORD(v84) = 2;
        _os_log_send_and_compose_impl(2, 0, buf, 1628, &_mh_execute_header, qword_10229FFA8, 2, "[CompanionSyncService] Received cold storage data of type PredictedWalkDistanceBoutKey", &v105, v84);
        v76 = (uint8_t *)v75;
        sub_100512490("Generic", 1, 0, 2, "-[CMHealthColdStorageCompanionSyncService receiveColdStorageDataUpdate:]", "%s\n", v75);
        if (v76 != buf)
          free(v76);
      }
      self->fStats.numRecordsSync_PWDBH += objc_msgSend(v41, "count");
    }
    else
    {
      if (qword_10229FFA0 != -1)
        dispatch_once(&qword_10229FFA0, &stru_10219FB70);
      v55 = qword_10229FFA8;
      if (os_log_type_enabled((os_log_t)qword_10229FFA8, OS_LOG_TYPE_ERROR))
      {
        *(_DWORD *)buf = 138412290;
        *(_QWORD *)&buf[4] = v41;
        _os_log_impl((void *)&_mh_execute_header, v55, OS_LOG_TYPE_ERROR, "[CompanionSyncService] Received malformed PredictedWalkDistanceBoutKey %@", buf, 0xCu);
      }
      if (sub_1001BFF7C(115, 0))
      {
        bzero(buf, 0x65CuLL);
        if (qword_10229FFA0 != -1)
          dispatch_once(&qword_10229FFA0, &stru_10219FB70);
        LODWORD(v109) = 138412290;
        *(_QWORD *)((char *)&v109 + 4) = v41;
        LODWORD(v84) = 12;
        _os_log_send_and_compose_impl(2, 0, buf, 1628, &_mh_execute_header, qword_10229FFA8, 16, "[CompanionSyncService] Received malformed PredictedWalkDistanceBoutKey %@", &v109, v84);
        v78 = (uint8_t *)v77;
        sub_100512490("Generic", 1, 0, 0, "-[CMHealthColdStorageCompanionSyncService receiveColdStorageDataUpdate:]", "%s\n", v77);
        if (v78 != buf)
          free(v78);
      }
      ++self->fStats.numErrors;
    }
  }
  if (objc_msgSend(a3, "objectForKeyedSubscript:", CFSTR("ElevationGradeKey")))
  {
    v56 = objc_msgSend(a3, "objectForKeyedSubscript:", CFSTR("ElevationGradeKey"));
    v58 = objc_opt_class(NSArray, v57);
    if ((objc_opt_isKindOfClass(v56, v58) & 1) != 0)
    {
      v109 = 0uLL;
      v110 = 0.0;
      v85 = 0u;
      v86 = 0u;
      v87 = 0u;
      v88 = 0u;
      v59 = objc_msgSend(v56, "countByEnumeratingWithState:objects:count:", &v85, v107, 16);
      if (v59)
      {
        v60 = v59;
        v61 = *(_QWORD *)v86;
        do
        {
          for (n = 0; n != v60; n = (char *)n + 1)
          {
            if (*(_QWORD *)v86 != v61)
              objc_enumerationMutation(v56);
            v63 = *(void **)(*((_QWORD *)&v85 + 1) + 8 * (_QWORD)n);
            *(_QWORD *)&v109 = objc_msgSend(v63, "recordId");
            objc_msgSend(v63, "startTime");
            *((_QWORD *)&v109 + 1) = v64;
            objc_msgSend(v63, "fractionalGrade");
            v110 = v65;
            sub_10041B300(self->fElevationGradeRecorderDb.__ptr_, (uint64_t)&v109, 0);
          }
          v60 = objc_msgSend(v56, "countByEnumeratingWithState:objects:count:", &v85, v107, 16);
        }
        while (v60);
      }
      if (qword_10229FFA0 != -1)
        dispatch_once(&qword_10229FFA0, &stru_10219FB70);
      v66 = qword_10229FFA8;
      if (os_log_type_enabled((os_log_t)qword_10229FFA8, OS_LOG_TYPE_DEBUG))
      {
        v67 = objc_msgSend(v56, "count");
        *(_DWORD *)buf = 134217984;
        *(_QWORD *)&buf[4] = v67;
        _os_log_impl((void *)&_mh_execute_header, v66, OS_LOG_TYPE_DEBUG, "[CompanionSyncService] Received cold storage data of type ElevationGradeKey, count: %lu", buf, 0xCu);
      }
      if (sub_1001BFF7C(115, 2))
      {
        bzero(buf, 0x65CuLL);
        if (qword_10229FFA0 != -1)
          dispatch_once(&qword_10229FFA0, &stru_10219FB70);
        v79 = qword_10229FFA8;
        v80 = objc_msgSend(v56, "count");
        v105 = 134217984;
        v106 = v80;
        _os_log_send_and_compose_impl(2, 0, buf, 1628, &_mh_execute_header, v79, 2, "[CompanionSyncService] Received cold storage data of type ElevationGradeKey, count: %lu", &v105);
        v82 = (uint8_t *)v81;
        sub_100512490("Generic", 1, 0, 2, "-[CMHealthColdStorageCompanionSyncService receiveColdStorageDataUpdate:]", "%s\n", v81);
        if (v82 != buf)
          free(v82);
      }
      self->fStats.numRecordsSync_EGH += objc_msgSend(v56, "count");
      goto LABEL_103;
    }
    if (qword_10229FFA0 != -1)
      dispatch_once(&qword_10229FFA0, &stru_10219FB70);
    v68 = qword_10229FFA8;
    if (os_log_type_enabled((os_log_t)qword_10229FFA8, OS_LOG_TYPE_ERROR))
    {
      *(_DWORD *)buf = 138412290;
      *(_QWORD *)&buf[4] = v56;
      _os_log_impl((void *)&_mh_execute_header, v68, OS_LOG_TYPE_ERROR, "[CompanionSyncService] Received malformed ElevationGradeKey %@", buf, 0xCu);
    }
    if (!sub_1001BFF7C(115, 0))
    {
LABEL_102:
      ++self->fStats.numErrors;
      goto LABEL_103;
    }
    bzero(buf, 0x65CuLL);
    if (qword_10229FFA0 != -1)
      dispatch_once(&qword_10229FFA0, &stru_10219FB70);
    LODWORD(v109) = 138412290;
    *(_QWORD *)((char *)&v109 + 4) = v56;
    LODWORD(v84) = 12;
    _os_log_send_and_compose_impl(2, 0, buf, 1628, &_mh_execute_header, qword_10229FFA8, 16, "[CompanionSyncService] Received malformed ElevationGradeKey %@", &v109, v84);
LABEL_136:
    v83 = (uint8_t *)v17;
    sub_100512490("Generic", 1, 0, 0, "-[CMHealthColdStorageCompanionSyncService receiveColdStorageDataUpdate:]", "%s\n", v17);
    if (v83 != buf)
      free(v83);
    goto LABEL_102;
  }
LABEL_103:
  -[CMHealthColdStorageCompanionSyncService resetCoreAnalyticsTimer](self, "resetCoreAnalyticsTimer");
}

- (void)resetCoreAnalyticsTimer
{
  NSObject *v3;
  NSObject *fCoreAnalyticsTimer;
  dispatch_time_t v5;
  const char *v6;
  uint8_t *v7;
  int v8;
  uint64_t v9;
  uint8_t buf[4];
  uint64_t v11;

  objc_msgSend(-[CMHealthColdStorageCompanionSyncService universe](self, "universe"), "silo");
  if (qword_10229FFA0 != -1)
    dispatch_once(&qword_10229FFA0, &stru_10219FB70);
  v3 = qword_10229FFA8;
  if (os_log_type_enabled((os_log_t)qword_10229FFA8, OS_LOG_TYPE_INFO))
  {
    *(_DWORD *)buf = 134349056;
    v11 = 60000000000;
    _os_log_impl((void *)&_mh_execute_header, v3, OS_LOG_TYPE_INFO, "Reset CoreAnalytics timer to fire in %{public}lld seconds", buf, 0xCu);
  }
  if (sub_1001BFF7C(115, 2))
  {
    bzero(buf, 0x65CuLL);
    if (qword_10229FFA0 != -1)
      dispatch_once(&qword_10229FFA0, &stru_10219FB70);
    v8 = 134349056;
    v9 = 60000000000;
    _os_log_send_and_compose_impl(2, 0, buf, 1628, &_mh_execute_header, qword_10229FFA8, 1, "Reset CoreAnalytics timer to fire in %{public}lld seconds", &v8, 12);
    v7 = (uint8_t *)v6;
    sub_100512490("Generic", 1, 0, 2, "-[CMHealthColdStorageCompanionSyncService resetCoreAnalyticsTimer]", "%s\n", v6);
    if (v7 != buf)
      free(v7);
  }
  fCoreAnalyticsTimer = self->fCoreAnalyticsTimer;
  v5 = dispatch_time(0, 60000000000);
  dispatch_source_set_timer(fCoreAnalyticsTimer, v5, 0xFFFFFFFFFFFFFFFFLL, 0x3B9ACA00uLL);
}

- (void)sendAnalytics
{
  NSDictionary *v3;
  NSObject *v4;
  NSObject *v5;
  const char *v6;
  uint8_t *v7;
  const char *v8;
  uint8_t *v9;
  _QWORD v10[5];
  int v11;
  NSDictionary *v12;
  _QWORD v13[6];
  _QWORD v14[6];
  uint8_t buf[4];
  NSDictionary *v16;

  if (objc_opt_class(MCProfileConnection, a2)
    && (objc_msgSend(+[MCProfileConnection sharedConnection](MCProfileConnection, "sharedConnection"), "isHealthDataSubmissionAllowed") & 1) != 0)
  {
    v13[0] = CFSTR("NumErrors");
    v14[0] = +[NSNumber numberWithInt:](NSNumber, "numberWithInt:", self->fStats.numErrors);
    v13[1] = CFSTR("NumRecordsSync_EGH");
    v14[1] = +[NSNumber numberWithInt:](NSNumber, "numberWithInt:", self->fStats.numRecordsSync_EGH);
    v13[2] = CFSTR("NumRecordsSync_HRRIHH");
    v14[2] = +[NSNumber numberWithInt:](NSNumber, "numberWithInt:", self->fStats.numRecordsSync_HRRIHH);
    v13[3] = CFSTR("NumRecordsSync_HRRIWH");
    v14[3] = +[NSNumber numberWithInt:](NSNumber, "numberWithInt:", self->fStats.numRecordsSync_HRRIWH);
    v13[4] = CFSTR("NumRecordsSync_HRRSH");
    v14[4] = +[NSNumber numberWithInt:](NSNumber, "numberWithInt:", self->fStats.numRecordsSync_HRRSH);
    v13[5] = CFSTR("NumRecordsSync_PWDBH");
    v14[5] = +[NSNumber numberWithInt:](NSNumber, "numberWithInt:", self->fStats.numRecordsSync_PWDBH);
    v3 = +[NSDictionary dictionaryWithObjects:forKeys:count:](NSDictionary, "dictionaryWithObjects:forKeys:count:", v14, v13, 6);
    v10[0] = _NSConcreteStackBlock;
    v10[1] = 3221225472;
    v10[2] = sub_1010C40F0;
    v10[3] = &unk_102132010;
    v10[4] = v3;
    AnalyticsSendEventLazy(CFSTR("com.apple.CoreMotion.ColdStorageWatchSync"), v10);
    if (qword_10229FFA0 != -1)
      dispatch_once(&qword_10229FFA0, &stru_10219FB70);
    v4 = qword_10229FFA8;
    if (os_log_type_enabled((os_log_t)qword_10229FFA8, OS_LOG_TYPE_INFO))
    {
      *(_DWORD *)buf = 138543362;
      v16 = v3;
      _os_log_impl((void *)&_mh_execute_header, v4, OS_LOG_TYPE_INFO, "Sent Core Analytics event: %{public}@", buf, 0xCu);
    }
    if (sub_1001BFF7C(115, 2))
    {
      bzero(buf, 0x65CuLL);
      if (qword_10229FFA0 != -1)
        dispatch_once(&qword_10229FFA0, &stru_10219FB70);
      v11 = 138543362;
      v12 = v3;
      _os_log_send_and_compose_impl(2, 0, buf, 1628, &_mh_execute_header, qword_10229FFA8, 1, "Sent Core Analytics event: %{public}@", &v11, 12);
      v9 = (uint8_t *)v8;
      sub_100512490("Generic", 1, 0, 2, "-[CMHealthColdStorageCompanionSyncService sendAnalytics]", "%s\n", v8);
      if (v9 != buf)
        free(v9);
    }
    -[CMHealthColdStorageCompanionSyncService resetAnalytics](self, "resetAnalytics");
  }
  else
  {
    if (qword_10229FFA0 != -1)
      dispatch_once(&qword_10229FFA0, &stru_10219FB70);
    v5 = qword_10229FFA8;
    if (os_log_type_enabled((os_log_t)qword_10229FFA8, OS_LOG_TYPE_DEBUG))
    {
      *(_WORD *)buf = 0;
      _os_log_impl((void *)&_mh_execute_header, v5, OS_LOG_TYPE_DEBUG, "Not sending analytics, no IHA permission", buf, 2u);
    }
    if (sub_1001BFF7C(115, 2))
    {
      bzero(buf, 0x65CuLL);
      if (qword_10229FFA0 != -1)
        dispatch_once(&qword_10229FFA0, &stru_10219FB70);
      LOWORD(v11) = 0;
      _os_log_send_and_compose_impl(2, 0, buf, 1628, &_mh_execute_header, qword_10229FFA8, 2, "Not sending analytics, no IHA permission", &v11, 2);
      v7 = (uint8_t *)v6;
      sub_100512490("Generic", 1, 0, 2, "-[CMHealthColdStorageCompanionSyncService sendAnalytics]", "%s\n", v6);
      if (v7 != buf)
        free(v7);
    }
  }
}

- (void)resetAnalytics
{
  *(_QWORD *)&self->fStats.numRecordsSync_HRRIHH = 0;
  *(_QWORD *)&self->fStats.numRecordsSync_HRRSH = 0;
  *(_QWORD *)&self->fStats.numErrors = 0;
}

- (void).cxx_destruct
{
  sub_10041D2EC((uint64_t *)&self->fElevationGradeAggregator, 0);
  sub_100261F44((uint64_t)&self->fElevationGradeRecorderDb);
  sub_100261F44((uint64_t)&self->fPredWalkDistanceBoutDb);
  sub_10041D2EC((uint64_t *)&self->fSessionAggregator, 0);
  sub_100261F44((uint64_t)&self->fSessionDb);
  sub_10041D2EC((uint64_t *)&self->fInputWRAggregator, 0);
  sub_100261F44((uint64_t)&self->fInputWRDb);
  sub_10041D2EC((uint64_t *)&self->fInputHRAggregator, 0);
  sub_100261F44((uint64_t)&self->fInputHRDb);
}

- (id).cxx_construct
{
  *((_QWORD *)self + 1) = 0;
  *((_QWORD *)self + 2) = 0;
  *((_QWORD *)self + 3) = 0;
  *((_QWORD *)self + 4) = 0;
  *((_QWORD *)self + 5) = 0;
  *((_QWORD *)self + 6) = 0;
  *((_QWORD *)self + 7) = 0;
  *((_QWORD *)self + 8) = 0;
  *((_QWORD *)self + 9) = 0;
  *((_QWORD *)self + 11) = 0;
  *((_QWORD *)self + 12) = 0;
  *((_QWORD *)self + 13) = 0;
  *((_QWORD *)self + 14) = 0;
  *((_QWORD *)self + 15) = 0;
  *((_QWORD *)self + 18) = 0;
  *((_QWORD *)self + 19) = 0;
  *((_QWORD *)self + 17) = 0;
  return self;
}

@end
