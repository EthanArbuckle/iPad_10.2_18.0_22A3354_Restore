@implementation CLPredictedWalkDistanceServiceCompanion

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
  if (qword_102301288 != -1)
    dispatch_once(&qword_102301288, &stru_102138470);
  return (id)qword_102301280;
}

- (CLPredictedWalkDistanceServiceCompanion)init
{
  objc_super v3;

  v3.receiver = self;
  v3.super_class = (Class)CLPredictedWalkDistanceServiceCompanion;
  return -[CLPredictedWalkDistanceServiceCompanion initWithInboundProtocol:outboundProtocol:](&v3, "initWithInboundProtocol:outboundProtocol:", &OBJC_PROTOCOL___CLPredictedWalkDistanceServiceCompanionProtocol, &OBJC_PROTOCOL___CLPredictedWalkDistanceServiceCompanionClientProtocol);
}

+ (BOOL)isSupported
{
  if (qword_102301298 != -1)
    dispatch_once(&qword_102301298, &stru_102138490);
  return byte_102301290;
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

  if (qword_10229FEA0 != -1)
    dispatch_once(&qword_10229FEA0, &stru_102138720);
  v3 = qword_10229FEA8;
  if (os_log_type_enabled((os_log_t)qword_10229FEA8, OS_LOG_TYPE_DEFAULT))
  {
    LOWORD(buf) = 0;
    _os_log_impl((void *)&_mh_execute_header, v3, OS_LOG_TYPE_DEFAULT, "Starting up CLPredictedWalkDistanceServiceCompanion", (uint8_t *)&buf, 2u);
  }
  if (sub_1001BFF7C(115, 2))
  {
    bzero(&buf, 0x65CuLL);
    if (qword_10229FEA0 != -1)
      dispatch_once(&qword_10229FEA0, &stru_102138720);
    LOWORD(v10) = 0;
    _os_log_send_and_compose_impl(2, 0, &buf, 1628, &_mh_execute_header, qword_10229FEA8, 0, "Starting up CLPredictedWalkDistanceServiceCompanion", &v10, 2);
    v8 = (__int128 *)v7;
    sub_100512490("Generic", 1, 0, 2, "-[CLPredictedWalkDistanceServiceCompanion beginService]", "%s\n", v7);
    if (v8 != &buf)
      free(v8);
  }
  LOBYTE(v9) = 0;
  sub_10041CFEC((unsigned __int8 *)&v9, &buf);
  sub_1002B7674((uint64_t)&self->fBoutDb, &buf);
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
  NSObject *fAggregationTimer;

  fAggregationTimer = self->fAggregationTimer;
  if (fAggregationTimer)
  {
    dispatch_source_cancel(fAggregationTimer);
    dispatch_release((dispatch_object_t)self->fAggregationTimer);
    self->fAggregationTimer = 0;
  }

  self->fHkHealthStore = 0;
}

- (void)scheduleEstimate
{
  double Current;
  uint64_t v4;
  double v5;
  NSObject *v6;
  double v7;
  int64_t v8;
  NSObject *v9;
  std::__shared_weak_count *v10;
  unint64_t *p_shared_owners;
  unint64_t v12;
  const char *v13;
  uint8_t *v14;
  const char *v15;
  uint8_t *v16;
  uint64_t v17;
  _QWORD handler[6];
  double v19;
  uint64_t v20;
  std::__shared_weak_count *v21;
  int v22;
  const char *v23;
  __int16 v24;
  double v25;
  __int16 v26;
  int64_t v27;
  uint8_t buf[4];
  const char *v29;
  __int16 v30;
  double v31;
  __int16 v32;
  int64_t v33;

  Current = CFAbsoluteTimeGetCurrent();
  v4 = sub_100127B9C();
  sub_100081C10(v4, &v20);
  v19 = 0.0;
  sub_1001FD98C(v20, "kP6MWDNextEstimateTime", &v19);
  v5 = v19;
  if (v19 > Current + 604800.0)
  {
    if (qword_10229FEA0 != -1)
      dispatch_once(&qword_10229FEA0, &stru_102138720);
    v6 = qword_10229FEA8;
    if (os_log_type_enabled((os_log_t)qword_10229FEA8, OS_LOG_TYPE_ERROR))
    {
      *(_DWORD *)buf = 136446466;
      v29 = "kP6MWDNextEstimateTime";
      v30 = 2050;
      v31 = v19;
      _os_log_impl((void *)&_mh_execute_header, v6, OS_LOG_TYPE_ERROR, "%{public}s is too far in the future (%{public}.2f). Resetting!", buf, 0x16u);
    }
    if (sub_1001BFF7C(115, 0))
    {
      bzero(buf, 0x65CuLL);
      if (qword_10229FEA0 != -1)
        dispatch_once(&qword_10229FEA0, &stru_102138720);
      v22 = 136446466;
      v23 = "kP6MWDNextEstimateTime";
      v24 = 2050;
      v25 = v19;
      _os_log_send_and_compose_impl(2, 0, buf, 1628, &_mh_execute_header, qword_10229FEA8, 16, "%{public}s is too far in the future (%{public}.2f). Resetting!", &v22, 22);
      v16 = (uint8_t *)v15;
      sub_100512490("Generic", 1, 0, 0, "-[CLPredictedWalkDistanceServiceCompanion scheduleEstimate]", "%s\n", v15);
      if (v16 != buf)
        free(v16);
    }
    sub_100525484(v20, "kP6MWDNextEstimateTime", 0xFFFFFFFFLL);
    v19 = 0.0;
    v5 = 0.0;
  }
  v7 = v5 - Current;
  if (XPC_ACTIVITY_INTERVAL_30_MIN <= (uint64_t)v7)
    v8 = (uint64_t)v7;
  else
    v8 = XPC_ACTIVITY_INTERVAL_30_MIN;
  if (qword_10229FEA0 != -1)
    dispatch_once(&qword_10229FEA0, &stru_102138720);
  v9 = qword_10229FEA8;
  if (os_log_type_enabled((os_log_t)qword_10229FEA8, OS_LOG_TYPE_DEFAULT))
  {
    *(_DWORD *)buf = 136446722;
    v29 = "com.apple.locationd.P6MWD";
    v30 = 2050;
    v31 = v19;
    v32 = 2050;
    v33 = v8;
    _os_log_impl((void *)&_mh_execute_header, v9, OS_LOG_TYPE_DEFAULT, "%{public}s: Registering XPC Activity with nextEstimateTime=(%{public}.2f) and delay=(%{public}lld)", buf, 0x20u);
  }
  if (sub_1001BFF7C(115, 2))
  {
    bzero(buf, 0x65CuLL);
    if (qword_10229FEA0 != -1)
      dispatch_once(&qword_10229FEA0, &stru_102138720);
    v22 = 136446722;
    v23 = "com.apple.locationd.P6MWD";
    v24 = 2050;
    v25 = v19;
    v26 = 2050;
    v27 = v8;
    LODWORD(v17) = 32;
    _os_log_send_and_compose_impl(2, 0, buf, 1628, &_mh_execute_header, qword_10229FEA8, 0, "%{public}s: Registering XPC Activity with nextEstimateTime=(%{public}.2f) and delay=(%{public}lld)", &v22, v17);
    v14 = (uint8_t *)v13;
    sub_100512490("Generic", 1, 0, 2, "-[CLPredictedWalkDistanceServiceCompanion scheduleEstimate]", "%s\n", v13);
    if (v14 != buf)
      free(v14);
  }
  xpc_activity_unregister("com.apple.locationd.P6MWD");
  handler[0] = _NSConcreteStackBlock;
  handler[1] = 3221225472;
  handler[2] = sub_100413658;
  handler[3] = &unk_1021384B8;
  handler[4] = objc_msgSend(objc_msgSend(-[CLPredictedWalkDistanceServiceCompanion universe](self, "universe"), "vendor"), "proxyForService:", CFSTR("CLPredictedWalkDistanceServiceCompanion"));
  handler[5] = v8;
  xpc_activity_register("com.apple.locationd.P6MWD", XPC_ACTIVITY_CHECK_IN, handler);
  v10 = v21;
  if (v21)
  {
    p_shared_owners = (unint64_t *)&v21->__shared_owners_;
    do
      v12 = __ldaxr(p_shared_owners);
    while (__stlxr(v12 - 1, p_shared_owners));
    if (!v12)
    {
      ((void (*)(std::__shared_weak_count *))v10->__on_zero_shared)(v10);
      std::__shared_weak_count::__release_weak(v10);
    }
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

  sub_100413DB8((void **)self->fBoutAggregator.__ptr_.__value_, 2419200.0);
  v13 = 86400;
  v3 = sub_100127B9C();
  sub_100081C10(v3, &v11);
  sub_1001E4B84(v11, "P6MWDAggregationTimeInterval", &v13);
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
  v8 = (OS_dispatch_source *)dispatch_source_create((dispatch_source_type_t)&_dispatch_source_type_timer, 0, 0, (dispatch_queue_t)objc_msgSend(objc_msgSend(-[CLPredictedWalkDistanceServiceCompanion universe](self, "universe"), "silo"), "queue"));
  self->fAggregationTimer = v8;
  dispatch_source_set_timer((dispatch_source_t)v8, 0, v7, 0xDF8475800uLL);
  fAggregationTimer = self->fAggregationTimer;
  v10[0] = _NSConcreteStackBlock;
  v10[1] = 3221225472;
  v10[2] = sub_10041406C;
  v10[3] = &unk_10212BB58;
  v10[4] = self;
  dispatch_source_set_event_handler(fAggregationTimer, v10);
  dispatch_resume((dispatch_object_t)self->fAggregationTimer);
}

- (void)onP6MWDActivity:(id)a3
{
  xpc_activity_state_t state;
  xpc_activity_state_t v6;
  NSObject *v7;
  NSObject *v8;
  const char *v9;
  NSObject *v10;
  const char *v11;
  uint8_t *v12;
  uint8_t *v13;
  __int128 v14;
  uint8_t buf[4];
  xpc_activity_state_t v16;

  if (!a3)
  {
    if (qword_10229FEA0 != -1)
      dispatch_once(&qword_10229FEA0, &stru_102138720);
    v8 = qword_10229FEA8;
    if (os_log_type_enabled((os_log_t)qword_10229FEA8, OS_LOG_TYPE_ERROR))
    {
      *(_WORD *)buf = 0;
      _os_log_impl((void *)&_mh_execute_header, v8, OS_LOG_TYPE_ERROR, "Invalid xpc activity.", buf, 2u);
    }
    if (!sub_1001BFF7C(115, 0))
      return;
    bzero(buf, 0x65CuLL);
    if (qword_10229FEA0 != -1)
      dispatch_once(&qword_10229FEA0, &stru_102138720);
    _os_log_send_and_compose_impl(2, 0, buf, 1628, &_mh_execute_header, qword_10229FEA8, 16, "Invalid xpc activity.");
LABEL_31:
    v13 = (uint8_t *)v9;
    sub_100512490("Generic", 1, 0, 0, "-[CLPredictedWalkDistanceServiceCompanion onP6MWDActivity:]", "%s\n", v9);
    if (v13 != buf)
      free(v13);
    return;
  }
  state = xpc_activity_get_state((xpc_activity_t)a3);
  if (state == 4 || (v6 = state, state == 2))
  {
    if (qword_10229FEA0 != -1)
      dispatch_once(&qword_10229FEA0, &stru_102138720);
    v7 = qword_10229FEA8;
    if (os_log_type_enabled((os_log_t)qword_10229FEA8, OS_LOG_TYPE_DEFAULT))
    {
      *(_WORD *)buf = 0;
      _os_log_impl((void *)&_mh_execute_header, v7, OS_LOG_TYPE_DEFAULT, "Preparing to make weekly 6MWD prediction", buf, 2u);
    }
    if (sub_1001BFF7C(115, 2))
    {
      bzero(buf, 0x65CuLL);
      if (qword_10229FEA0 != -1)
        dispatch_once(&qword_10229FEA0, &stru_102138720);
      LOWORD(v14) = 0;
      _os_log_send_and_compose_impl(2, 0, buf, 1628, &_mh_execute_header, qword_10229FEA8, 0, "Preparing to make weekly 6MWD prediction", &v14, 2);
      v12 = (uint8_t *)v11;
      sub_100512490("Generic", 1, 0, 2, "-[CLPredictedWalkDistanceServiceCompanion onP6MWDActivity:]", "%s\n", v11);
      if (v12 != buf)
        free(v12);
    }
    -[CLPredictedWalkDistanceServiceCompanion getSixMinuteWalkDistancePrediction:](self, "getSixMinuteWalkDistancePrediction:", a3);
    return;
  }
  if (qword_10229FEA0 != -1)
    dispatch_once(&qword_10229FEA0, &stru_102138720);
  v10 = qword_10229FEA8;
  if (os_log_type_enabled((os_log_t)qword_10229FEA8, OS_LOG_TYPE_ERROR))
  {
    *(_DWORD *)buf = 134217984;
    v16 = v6;
    _os_log_impl((void *)&_mh_execute_header, v10, OS_LOG_TYPE_ERROR, "Unexpected activity state: %ld", buf, 0xCu);
  }
  if (sub_1001BFF7C(115, 0))
  {
    bzero(buf, 0x65CuLL);
    if (qword_10229FEA0 != -1)
      dispatch_once(&qword_10229FEA0, &stru_102138720);
    _os_log_send_and_compose_impl(2, 0, buf, 1628, &_mh_execute_header, qword_10229FEA8, 16, "Unexpected activity state: %ld", &v14);
    goto LABEL_31;
  }
}

- (void)getSixMinuteWalkDistancePrediction:(id)a3
{
  double Current;
  uint64_t v6;
  std::__shared_weak_count *v7;
  unint64_t *v8;
  unint64_t v9;
  NSObject *v10;
  uint64_t v11;
  int v12;
  std::__shared_weak_count *v13;
  unint64_t *v14;
  unint64_t v15;
  int v16;
  NSDate *v17;
  NSDate *v18;
  NSObject *v19;
  NSObject *global_queue;
  id v21;
  id v22;
  uint64_t v23;
  int v24;
  id v25;
  uint64_t v26;
  int v27;
  int v28;
  unsigned int v29;
  NSObject *v30;
  double v31;
  double v32;
  double v33;
  id v34;
  NSDate *v35;
  NSObject *v36;
  uint64_t v37;
  uint64_t v38;
  uint64_t v39;
  NSCalendar *v40;
  NSDateComponents *v41;
  NSDateComponents *v42;
  NSPredicate *v43;
  id v44;
  NSPredicate *v45;
  id v46;
  NSCompoundPredicate *v47;
  id v48;
  id v49;
  id v50;
  const char *v51;
  char *v52;
  double v53;
  double v54;
  double v55;
  const char *v56;
  char *v57;
  uint64_t v58;
  double v59;
  double v60;
  double v61;
  const char *v62;
  char *v63;
  uint64_t v64;
  _QWORD v65[23];
  _QWORD v66[9];
  _QWORD v67[8];
  _QWORD v68[10];
  _QWORD v69[10];
  _QWORD v70[9];
  _QWORD v71[6];
  _QWORD v72[6];
  _QWORD block[10];
  _QWORD v74[6];
  int v75;
  __int128 v76;
  __int128 v77;
  _QWORD v78[6];
  int v79;
  __int128 v80;
  __int128 v81;
  _QWORD v82[6];
  void *__p;
  void *v84;
  uint64_t v85;
  _QWORD v86[6];
  void *v87;
  void *v88;
  uint64_t v89;
  _QWORD v90[6];
  void *v91;
  void *v92;
  uint64_t v93;
  _QWORD v94[6];
  void *v95;
  void *v96;
  uint64_t v97;
  _QWORD v98[6];
  void *v99;
  void *v100;
  uint64_t v101;
  _QWORD v102[6];
  void *v103;
  void *v104;
  uint64_t v105;
  _QWORD v106[6];
  void *v107;
  void *v108;
  uint64_t v109;
  _QWORD v110[6];
  void *v111;
  void *v112;
  uint64_t v113;
  _QWORD v114[6];
  void *v115;
  void *v116;
  uint64_t v117;
  _QWORD v118[6];
  void *v119;
  void *v120;
  uint64_t v121;
  _QWORD v122[3];
  char v123;
  _QWORD v124[3];
  char v125;
  int v126;
  double v127;
  _QWORD v128[2];
  int v129;
  double v130;
  __int16 v131;
  double v132;
  __int16 v133;
  double v134;
  _BYTE v135[24];
  __n128 (*v136)(uint64_t, uint64_t);
  uint64_t (*v137)();
  void *v138;
  __int128 v139;
  __int128 v140;
  _OWORD v141[2];
  _BYTE buf[22];
  __int16 v143;
  double v144;

  if (objc_opt_class(HKQuery, a2)
    && !-[CLPredictedWalkDistanceServiceCompanion isWheelchairMode](self, "isWheelchairMode"))
  {
    Current = CFAbsoluteTimeGetCurrent();
    v127 = 0.0;
    v6 = sub_100127B9C();
    sub_100081C10(v6, buf);
    sub_1001FD98C(*(uint64_t *)buf, "kP6MWDNextEstimateTime", &v127);
    v7 = *(std::__shared_weak_count **)&buf[8];
    if (*(_QWORD *)&buf[8])
    {
      v8 = (unint64_t *)(*(_QWORD *)&buf[8] + 8);
      do
        v9 = __ldaxr(v8);
      while (__stlxr(v9 - 1, v8));
      if (!v9)
      {
        ((void (*)(std::__shared_weak_count *))v7->__on_zero_shared)(v7);
        std::__shared_weak_count::__release_weak(v7);
      }
    }
    if (Current >= v127)
    {
      v126 = 0;
      v126 = *(_DWORD *)self->fP6MWDEstimator.__ptr_.__value_;
      v11 = sub_100127B9C();
      sub_100081C10(v11, buf);
      v12 = sub_1001E4B84(*(uint64_t *)buf, "P6MWDActivityHistoryDuration", &v126);
      v13 = *(std::__shared_weak_count **)&buf[8];
      if (*(_QWORD *)&buf[8])
      {
        v14 = (unint64_t *)(*(_QWORD *)&buf[8] + 8);
        do
          v15 = __ldaxr(v14);
        while (__stlxr(v15 - 1, v14));
        if (!v15)
        {
          ((void (*)(std::__shared_weak_count *))v13->__on_zero_shared)(v13);
          std::__shared_weak_count::__release_weak(v13);
        }
      }
      if (v12)
        *(_DWORD *)self->fP6MWDEstimator.__ptr_.__value_ = v126;
      v16 = v126;
      v17 = +[NSDate date](NSDate, "date");
      v18 = -[NSDate dateByAddingTimeInterval:](v17, "dateByAddingTimeInterval:", (double)v16 * -86400.0);
      v19 = dispatch_group_create();
      v124[0] = 0;
      v124[1] = v124;
      v124[2] = 0x2020000000;
      v125 = 0;
      v122[0] = 0;
      v122[1] = v122;
      v122[2] = 0x2020000000;
      v123 = 0;
      v118[0] = 0;
      v118[1] = v118;
      v118[2] = 0x4812000000;
      v118[3] = sub_100206C4C;
      v118[4] = sub_100207A8C;
      v118[5] = &unk_102080316;
      v119 = 0;
      v121 = 0;
      v120 = 0;
      v114[0] = 0;
      v114[1] = v114;
      v114[2] = 0x4812000000;
      v114[3] = sub_100415E5C;
      v114[4] = sub_100415E80;
      v114[5] = &unk_102080316;
      v115 = 0;
      v117 = 0;
      v116 = 0;
      v110[0] = 0;
      v110[1] = v110;
      v110[2] = 0x4812000000;
      v110[3] = sub_100415E5C;
      v110[4] = sub_100415E80;
      v110[5] = &unk_102080316;
      v111 = 0;
      v113 = 0;
      v112 = 0;
      v106[0] = 0;
      v106[1] = v106;
      v106[2] = 0x4812000000;
      v106[3] = sub_100415E5C;
      v106[4] = sub_100415E80;
      v106[5] = &unk_102080316;
      v107 = 0;
      v109 = 0;
      v108 = 0;
      v102[0] = 0;
      v102[1] = v102;
      v102[2] = 0x4812000000;
      v102[3] = sub_100415E5C;
      v102[4] = sub_100415E80;
      v102[5] = &unk_102080316;
      v103 = 0;
      v105 = 0;
      v104 = 0;
      v98[0] = 0;
      v98[1] = v98;
      v98[2] = 0x4812000000;
      v98[3] = sub_100415E5C;
      v98[4] = sub_100415E80;
      v98[5] = &unk_102080316;
      v99 = 0;
      v101 = 0;
      v100 = 0;
      v94[0] = 0;
      v94[1] = v94;
      v94[2] = 0x4812000000;
      v94[3] = sub_100415E98;
      v94[4] = sub_100415EBC;
      v94[5] = &unk_102080316;
      v95 = 0;
      v97 = 0;
      v96 = 0;
      v90[0] = 0;
      v90[1] = v90;
      v90[2] = 0x4812000000;
      v90[3] = sub_100415ED4;
      v90[4] = sub_100415EF8;
      v90[5] = &unk_102080316;
      v91 = 0;
      v93 = 0;
      v92 = 0;
      v86[0] = 0;
      v86[1] = v86;
      v86[2] = 0x4812000000;
      v86[3] = sub_100415ED4;
      v86[4] = sub_100415EF8;
      v86[5] = &unk_102080316;
      v87 = 0;
      v89 = 0;
      v88 = 0;
      v82[0] = 0;
      v82[1] = v82;
      v82[2] = 0x4812000000;
      v82[3] = sub_100415F10;
      v82[4] = sub_100415F34;
      v82[5] = &unk_102080316;
      __p = 0;
      v85 = 0;
      v84 = 0;
      v78[0] = 0;
      v78[1] = v78;
      v78[2] = 0x5812000000;
      v78[3] = sub_100415F4C;
      v78[4] = nullsub_175;
      v78[5] = &unk_102080316;
      v79 = 0;
      v80 = 0u;
      v81 = 0u;
      v74[0] = 0;
      v74[1] = v74;
      v74[2] = 0x5812000000;
      v74[3] = sub_100415F4C;
      v74[4] = nullsub_175;
      v74[5] = &unk_102080316;
      v75 = 0;
      v76 = 0u;
      v77 = 0u;
      dispatch_group_enter(v19);
      global_queue = dispatch_get_global_queue(0, 0);
      block[0] = _NSConcreteStackBlock;
      block[1] = 3221225472;
      block[2] = sub_100415F64;
      block[3] = &unk_1021384E0;
      block[4] = self;
      block[5] = v18;
      block[8] = v118;
      block[9] = v124;
      block[6] = v17;
      block[7] = v19;
      dispatch_async(global_queue, block);
      v21 = objc_msgSend(objc_msgSend(objc_msgSend(objc_msgSend(-[CLPredictedWalkDistanceServiceCompanion universe](self, "universe"), "vendor"), "proxyForService:", CFSTR("CLNatalimetryNotifier")), "syncgetUserProfile"), "copy");
      *(_QWORD *)v135 = 0;
      *(_QWORD *)&v135[8] = v135;
      v136 = sub_1004162B0;
      v137 = nullsub_176;
      v138 = &unk_102080316;
      *(_QWORD *)&v135[16] = 0x7012000000;
      v139 = xmmword_101BB0058;
      v140 = unk_101BB0068;
      v141[0] = xmmword_101BB0078;
      *(_OWORD *)((char *)v141 + 12) = *(__int128 *)((char *)&xmmword_101BB0078 + 12);
      v22 = objc_msgSend(v21, "objectForKey:", CMNatalimeterSetUserAgeYr);
      if (v22)
      {
        v23 = *(_QWORD *)&v135[8];
        objc_msgSend(v22, "floatValue");
        *(_BYTE *)(v23 + 104) = 1;
        *(_DWORD *)(v23 + 68) = v24;
      }
      v25 = objc_msgSend(v21, "objectForKey:", CMNatalimeterSetUserHeightMeter);
      if (v25)
      {
        v26 = *(_QWORD *)&v135[8];
        objc_msgSend(v25, "floatValue");
        *(_BYTE *)(v26 + 105) = 1;
        *(_DWORD *)(v26 + 56) = v27;
      }
      objc_msgSend(objc_msgSend(v21, "objectForKey:", CMNatalimeterSetUserWeightKG), "floatValue");
      *(_DWORD *)(*(_QWORD *)&v135[8] + 60) = v28;
      v29 = objc_msgSend(objc_msgSend(v21, "objectForKey:", CMNatalimeterSetUserBiologicalSex), "intValue");
      *(_DWORD *)(*(_QWORD *)&v135[8] + 52) = v29;
      if (qword_10229FEA0 != -1)
        dispatch_once(&qword_10229FEA0, &stru_102138720);
      v30 = qword_10229FEA8;
      if (os_log_type_enabled((os_log_t)qword_10229FEA8, OS_LOG_TYPE_DEBUG))
      {
        v31 = *(float *)(*(_QWORD *)&v135[8] + 68);
        v32 = *(float *)(*(_QWORD *)&v135[8] + 56);
        v33 = *(float *)(*(_QWORD *)&v135[8] + 60);
        *(_DWORD *)buf = 134284033;
        *(double *)&buf[4] = v31;
        *(_WORD *)&buf[12] = 2049;
        *(double *)&buf[14] = v32;
        v143 = 2049;
        v144 = v33;
        _os_log_impl((void *)&_mh_execute_header, v30, OS_LOG_TYPE_DEBUG, "Retrieved demographics: age=%{private}.0f, height=%{private}.2f, weight=%{private}.1f", buf, 0x20u);
      }
      if (sub_1001BFF7C(115, 2))
      {
        bzero(buf, 0x65CuLL);
        if (qword_10229FEA0 != -1)
          dispatch_once(&qword_10229FEA0, &stru_102138720);
        v53 = *(float *)(*(_QWORD *)&v135[8] + 68);
        v54 = *(float *)(*(_QWORD *)&v135[8] + 56);
        v55 = *(float *)(*(_QWORD *)&v135[8] + 60);
        v129 = 134284033;
        v130 = v53;
        v131 = 2049;
        v132 = v54;
        v133 = 2049;
        v134 = v55;
        _os_log_send_and_compose_impl(2, 0, buf, 1628, &_mh_execute_header, qword_10229FEA8, 2, "Retrieved demographics: age=%{private}.0f, height=%{private}.2f, weight=%{private}.1f", &v129, 32);
        v57 = (char *)v56;
        sub_100512490("Generic", 1, 0, 2, "-[CLPredictedWalkDistanceServiceCompanion getSixMinuteWalkDistancePrediction:]", "%s\n", v56);
        if (v57 != buf)
          free(v57);
      }
      v34 = objc_alloc_init((Class)CMPedometer);
      dispatch_group_enter(v19);
      v72[0] = _NSConcreteStackBlock;
      v72[1] = 3221225472;
      v72[2] = sub_1004162D0;
      v72[3] = &unk_102138508;
      v72[5] = v90;
      v72[4] = v19;
      objc_msgSend(v34, "queryRemoteStepCadenceToStrideLengthBinsWithHandler:", v72);
      dispatch_group_enter(v19);
      v71[0] = _NSConcreteStackBlock;
      v71[1] = 3221225472;
      v71[2] = sub_100416798;
      v71[3] = &unk_102138508;
      v71[5] = v86;
      v71[4] = v19;
      objc_msgSend(v34, "queryStepCadenceToStrideLengthBinsWithHandler:", v71);
      dispatch_group_enter(v19);
      v70[0] = _NSConcreteStackBlock;
      v70[1] = 3221225472;
      v70[2] = sub_100416C60;
      v70[3] = &unk_102138530;
      v70[4] = self;
      v70[5] = v17;
      v70[8] = v124;
      v70[7] = v82;
      v70[6] = v19;
      dispatch_async(global_queue, v70);
      v35 = -[NSDate dateByAddingTimeInterval:](v18, "dateByAddingTimeInterval:", -86400.0);
      if (qword_10229FEA0 != -1)
        dispatch_once(&qword_10229FEA0, &stru_102138720);
      v36 = qword_10229FEA8;
      if (os_log_type_enabled((os_log_t)qword_10229FEA8, OS_LOG_TYPE_DEBUG))
      {
        -[NSDate timeIntervalSinceReferenceDate](v35, "timeIntervalSinceReferenceDate");
        v38 = v37;
        -[NSDate timeIntervalSinceReferenceDate](v17, "timeIntervalSinceReferenceDate");
        *(_DWORD *)buf = 134349312;
        *(_QWORD *)&buf[4] = v38;
        *(_WORD *)&buf[12] = 2050;
        *(_QWORD *)&buf[14] = v39;
        _os_log_impl((void *)&_mh_execute_header, v36, OS_LOG_TYPE_DEBUG, "HealthKit queries from %{public}.0f to %{public}.0f", buf, 0x16u);
      }
      if (sub_1001BFF7C(115, 2))
      {
        bzero(buf, 0x65CuLL);
        if (qword_10229FEA0 != -1)
          dispatch_once(&qword_10229FEA0, &stru_102138720);
        v58 = qword_10229FEA8;
        -[NSDate timeIntervalSinceReferenceDate](v35, "timeIntervalSinceReferenceDate");
        v60 = v59;
        -[NSDate timeIntervalSinceReferenceDate](v17, "timeIntervalSinceReferenceDate");
        v129 = 134349312;
        v130 = v60;
        v131 = 2050;
        v132 = v61;
        LODWORD(v64) = 22;
        _os_log_send_and_compose_impl(2, 0, buf, 1628, &_mh_execute_header, v58, 2, "HealthKit queries from %{public}.0f to %{public}.0f", &v129, v64);
        v63 = (char *)v62;
        sub_100512490("Generic", 1, 0, 2, "-[CLPredictedWalkDistanceServiceCompanion getSixMinuteWalkDistancePrediction:]", "%s\n", v62);
        if (v63 != buf)
          free(v63);
      }
      v40 = +[NSCalendar calendarWithIdentifier:](NSCalendar, "calendarWithIdentifier:", NSCalendarIdentifierGregorian);
      v41 = -[NSCalendar components:fromDate:](v40, "components:fromDate:", 30, v35);
      -[NSDateComponents setCalendar:](v41, "setCalendar:", v40);
      v42 = -[NSCalendar components:fromDate:](v40, "components:fromDate:", 30, v17);
      -[NSDateComponents setCalendar:](v42, "setCalendar:", v40);
      v43 = +[HKQuery predicateForActivitySummariesBetweenStartDateComponents:endDateComponents:](HKQuery, "predicateForActivitySummariesBetweenStartDateComponents:endDateComponents:", v41, v42);
      dispatch_group_enter(v19);
      v69[0] = _NSConcreteStackBlock;
      v69[1] = 3221225472;
      v69[2] = sub_100416F8C;
      v69[3] = &unk_102138580;
      v69[6] = v124;
      v69[7] = v114;
      v69[8] = v106;
      v69[9] = v102;
      v69[4] = self;
      v69[5] = v19;
      v44 = objc_msgSend(objc_alloc((Class)HKActivitySummaryQuery), "initWithPredicate:resultsHandler:", v43, v69);
      -[HKHealthStore executeQuery:](self->fHkHealthStore, "executeQuery:", v44);

      v45 = +[HKQuery predicateForSamplesWithStartDate:endDate:options:](HKQuery, "predicateForSamplesWithStartDate:endDate:options:", v35, v17, 3);
      v46 = +[HKQuery _predicateForObjectsFromAppleWatches](HKQuery, "_predicateForObjectsFromAppleWatches");
      v128[0] = v45;
      v128[1] = v46;
      v47 = +[NSCompoundPredicate andPredicateWithSubpredicates:](NSCompoundPredicate, "andPredicateWithSubpredicates:", +[NSArray arrayWithObjects:count:](NSArray, "arrayWithObjects:count:", v128, 2));
      dispatch_group_enter(v19);
      v68[0] = _NSConcreteStackBlock;
      v68[1] = 3221225472;
      v68[2] = sub_1004179A0;
      v68[3] = &unk_1021385A8;
      v68[6] = v124;
      v68[7] = v94;
      v68[8] = v78;
      v68[9] = v74;
      v68[4] = self;
      v68[5] = v19;
      v48 = objc_msgSend(objc_alloc((Class)HKSampleQuery), "initWithSampleType:predicate:limit:sortDescriptors:resultsHandler:", +[HKSampleType workoutType](HKSampleType, "workoutType"), v47, 0, 0, v68);
      -[HKHealthStore executeQuery:](self->fHkHealthStore, "executeQuery:", v48);

      dispatch_group_enter(v19);
      v67[0] = _NSConcreteStackBlock;
      v67[1] = 3221225472;
      v67[2] = sub_100418334;
      v67[3] = &unk_1021385F8;
      v67[6] = v124;
      v67[7] = v98;
      v67[4] = self;
      v67[5] = v19;
      v49 = objc_msgSend(objc_alloc((Class)HKSampleQuery), "initWithSampleType:predicate:limit:sortDescriptors:resultsHandler:", +[HKObjectType categoryTypeForIdentifier:](HKObjectType, "categoryTypeForIdentifier:", HKCategoryTypeIdentifierAppleStandHour), v47, 0, 0, v67);
      -[HKHealthStore executeQuery:](self->fHkHealthStore, "executeQuery:", v49);

      dispatch_group_enter(v19);
      v66[0] = _NSConcreteStackBlock;
      v66[1] = 3221225472;
      v66[2] = sub_100418A74;
      v66[3] = &unk_102138648;
      v66[6] = v124;
      v66[7] = v122;
      v66[8] = v110;
      v66[4] = self;
      v66[5] = v19;
      v50 = objc_msgSend(objc_alloc((Class)HKSampleQuery), "initWithSampleType:predicate:limit:sortDescriptors:resultsHandler:", +[HKSampleType quantityTypeForIdentifier:](HKSampleType, "quantityTypeForIdentifier:", HKQuantityTypeIdentifierFlightsClimbed), v45, 0, 0, v66);
      -[HKHealthStore executeQuery:](self->fHkHealthStore, "executeQuery:", v50);

      v65[0] = _NSConcreteStackBlock;
      v65[1] = 3221225472;
      v65[2] = sub_10041937C;
      v65[3] = &unk_102138670;
      v65[4] = v19;
      v65[5] = a3;
      v65[8] = v124;
      v65[9] = v118;
      v65[6] = self;
      v65[7] = v17;
      v65[10] = v114;
      v65[11] = v98;
      v65[12] = v90;
      v65[13] = v135;
      v65[14] = v86;
      v65[15] = v82;
      v65[16] = v122;
      v65[17] = v110;
      v65[18] = v102;
      v65[19] = v106;
      v65[20] = v94;
      v65[21] = v78;
      v65[22] = v74;
      dispatch_group_notify(v19, (dispatch_queue_t)objc_msgSend(objc_msgSend(-[CLPredictedWalkDistanceServiceCompanion universe](self, "universe"), "silo"), "queue"), v65);
      _Block_object_dispose(v135, 8);
      _Block_object_dispose(v74, 8);
      _Block_object_dispose(v78, 8);
      _Block_object_dispose(v82, 8);
      if (__p)
      {
        v84 = __p;
        operator delete(__p);
      }
      _Block_object_dispose(v86, 8);
      if (v87)
      {
        v88 = v87;
        operator delete(v87);
      }
      _Block_object_dispose(v90, 8);
      if (v91)
      {
        v92 = v91;
        operator delete(v91);
      }
      _Block_object_dispose(v94, 8);
      if (v95)
      {
        v96 = v95;
        operator delete(v95);
      }
      _Block_object_dispose(v98, 8);
      if (v99)
      {
        v100 = v99;
        operator delete(v99);
      }
      _Block_object_dispose(v102, 8);
      if (v103)
      {
        v104 = v103;
        operator delete(v103);
      }
      _Block_object_dispose(v106, 8);
      if (v107)
      {
        v108 = v107;
        operator delete(v107);
      }
      _Block_object_dispose(v110, 8);
      if (v111)
      {
        v112 = v111;
        operator delete(v111);
      }
      _Block_object_dispose(v114, 8);
      if (v115)
      {
        v116 = v115;
        operator delete(v115);
      }
      _Block_object_dispose(v118, 8);
      if (v119)
      {
        v120 = v119;
        operator delete(v119);
      }
      _Block_object_dispose(v122, 8);
      _Block_object_dispose(v124, 8);
    }
    else
    {
      if (qword_10229FEA0 != -1)
        dispatch_once(&qword_10229FEA0, &stru_102138720);
      v10 = qword_10229FEA8;
      if (os_log_type_enabled((os_log_t)qword_10229FEA8, OS_LOG_TYPE_ERROR))
      {
        *(_DWORD *)buf = 136446466;
        *(_QWORD *)&buf[4] = "kP6MWDNextEstimateTime";
        *(_WORD *)&buf[12] = 2050;
        *(double *)&buf[14] = v127;
        _os_log_impl((void *)&_mh_execute_header, v10, OS_LOG_TYPE_ERROR, "Estimate should not be made now. %{public}s is in the future (%{public}.2f). Resetting!", buf, 0x16u);
      }
      if (sub_1001BFF7C(115, 0))
      {
        bzero(buf, 0x65CuLL);
        if (qword_10229FEA0 != -1)
          dispatch_once(&qword_10229FEA0, &stru_102138720);
        *(_DWORD *)v135 = 136446466;
        *(_QWORD *)&v135[4] = "kP6MWDNextEstimateTime";
        *(_WORD *)&v135[12] = 2050;
        *(double *)&v135[14] = v127;
        _os_log_send_and_compose_impl(2, 0, buf, 1628, &_mh_execute_header, qword_10229FEA8, 16, "Estimate should not be made now. %{public}s is in the future (%{public}.2f). Resetting!", v135, 22);
        v52 = (char *)v51;
        sub_100512490("Generic", 1, 0, 0, "-[CLPredictedWalkDistanceServiceCompanion getSixMinuteWalkDistancePrediction:]", "%s\n", v51);
        if (v52 != buf)
          free(v52);
      }
      -[CLPredictedWalkDistanceServiceCompanion completeActivity:withNextEstimateTime:](self, "completeActivity:withNextEstimateTime:", a3, v127);
    }
  }
  else
  {
    -[CLPredictedWalkDistanceServiceCompanion completeActivity:withNextEstimateTime:](self, "completeActivity:withNextEstimateTime:", a3, CFAbsoluteTimeGetCurrent() + (double)self->fP6MWDPredictionInterval);
  }
}

- (void)completeActivity:(id)a3 withNextEstimateTime:(double)a4
{
  uint64_t v6;
  std::__shared_weak_count *v7;
  unint64_t *v8;
  unint64_t v9;
  NSObject *v10;
  xpc_activity_state_t state;
  uint64_t v12;
  xpc_activity_state_t v13;
  const char *v14;
  char *v15;
  double v16;
  int v17;
  const char *v18;
  __int16 v19;
  xpc_activity_state_t v20;
  _BYTE buf[1628];

  v16 = a4;
  v6 = sub_100127B9C();
  sub_100081C10(v6, buf);
  sub_10018A4CC(*(uint64_t *)buf, "kP6MWDNextEstimateTime", &v16);
  v7 = *(std::__shared_weak_count **)&buf[8];
  if (*(_QWORD *)&buf[8])
  {
    v8 = (unint64_t *)(*(_QWORD *)&buf[8] + 8);
    do
      v9 = __ldaxr(v8);
    while (__stlxr(v9 - 1, v8));
    if (!v9)
    {
      ((void (*)(std::__shared_weak_count *))v7->__on_zero_shared)(v7);
      std::__shared_weak_count::__release_weak(v7);
    }
  }
  if (!xpc_activity_set_state((xpc_activity_t)a3, 5))
  {
    if (qword_10229FEA0 != -1)
      dispatch_once(&qword_10229FEA0, &stru_102138720);
    v10 = qword_10229FEA8;
    if (os_log_type_enabled((os_log_t)qword_10229FEA8, OS_LOG_TYPE_FAULT))
    {
      state = xpc_activity_get_state((xpc_activity_t)a3);
      *(_DWORD *)buf = 136446466;
      *(_QWORD *)&buf[4] = "com.apple.locationd.P6MWD";
      *(_WORD *)&buf[12] = 2050;
      *(_QWORD *)&buf[14] = state;
      _os_log_impl((void *)&_mh_execute_header, v10, OS_LOG_TYPE_FAULT, "Failed to mark %{public}s activity as Done. Current state is %{public}ld", buf, 0x16u);
    }
    if (sub_1001BFF7C(115, 0))
    {
      bzero(buf, 0x65CuLL);
      if (qword_10229FEA0 != -1)
        dispatch_once(&qword_10229FEA0, &stru_102138720);
      v12 = qword_10229FEA8;
      v13 = xpc_activity_get_state((xpc_activity_t)a3);
      v17 = 136446466;
      v18 = "com.apple.locationd.P6MWD";
      v19 = 2050;
      v20 = v13;
      _os_log_send_and_compose_impl(2, 0, buf, 1628, &_mh_execute_header, v12, 17, "Failed to mark %{public}s activity as Done. Current state is %{public}ld", &v17, 22);
      v15 = (char *)v14;
      sub_100512490("Generic", 1, 0, 0, "-[CLPredictedWalkDistanceServiceCompanion completeActivity:withNextEstimateTime:]", "%s\n", v14);
      if (v15 != buf)
        free(v15);
    }
  }
  -[CLPredictedWalkDistanceServiceCompanion scheduleEstimate](self, "scheduleEstimate");
}

- (void)writeToHealthKitPrediction:(double)a3 estimateTime:(double)a4 earliestTimeUsed:(double)a5 calibrationStatus:(BOOL)a6
{
  _BOOL4 v6;
  double v11;
  NSObject *v12;
  id v13;
  NSMutableDictionary *v14;
  NSMutableDictionary *v15;
  void *v16;
  HKQuantitySample *v17;
  HKHealthStore *fHkHealthStore;
  const char *v19;
  uint8_t *v20;
  HKQuantitySample *v21;
  int v22;
  double v23;
  __int16 v24;
  double v25;
  __int16 v26;
  double v27;
  __int16 v28;
  _BOOL4 v29;
  __int16 v30;
  double v31;
  uint8_t buf[4];
  double v33;
  __int16 v34;
  double v35;
  __int16 v36;
  double v37;
  __int16 v38;
  _BOOL4 v39;
  __int16 v40;
  double v41;

  v6 = a6;
  if (objc_opt_class(HKQuantityType, a2))
  {
    if (qword_10229FEA0 != -1)
      dispatch_once(&qword_10229FEA0, &stru_102138720);
    v11 = round(a3);
    v12 = qword_10229FEA8;
    if (os_log_type_enabled((os_log_t)qword_10229FEA8, OS_LOG_TYPE_DEBUG))
    {
      *(_DWORD *)buf = 134350081;
      v33 = a4;
      v34 = 2050;
      v35 = a4;
      v36 = 2049;
      v37 = v11;
      v38 = 1025;
      v39 = v6;
      v40 = 2049;
      v41 = a5;
      _os_log_impl((void *)&_mh_execute_header, v12, OS_LOG_TYPE_DEBUG, "Writing predicted 6MWD to HealthKit, startTime: %{public}f, endTime: %{public}f, prediction: %{private}f, calibrationStatus: %{private}d, earliestTimeUsed: %{private}f", buf, 0x30u);
    }
    if (sub_1001BFF7C(115, 2))
    {
      bzero(buf, 0x65CuLL);
      if (qword_10229FEA0 != -1)
        dispatch_once(&qword_10229FEA0, &stru_102138720);
      v22 = 134350081;
      v23 = a4;
      v24 = 2050;
      v25 = a4;
      v26 = 2049;
      v27 = v11;
      v28 = 1025;
      v29 = v6;
      v30 = 2049;
      v31 = a5;
      _os_log_send_and_compose_impl(2, 0, buf, 1628, &_mh_execute_header, qword_10229FEA8, 2, "Writing predicted 6MWD to HealthKit, startTime: %{public}f, endTime: %{public}f, prediction: %{private}f, calibrationStatus: %{private}d, earliestTimeUsed: %{private}f", &v22, 48);
      v20 = (uint8_t *)v19;
      sub_100512490("Generic", 1, 0, 2, "-[CLPredictedWalkDistanceServiceCompanion writeToHealthKitPrediction:estimateTime:earliestTimeUsed:calibrationStatus:]", "%s\n", v19);
      if (v20 != buf)
        free(v20);
    }
    v13 = +[HKQuantityType quantityTypeForIdentifier:](HKQuantityType, "quantityTypeForIdentifier:", HKQuantityTypeIdentifierSixMinuteWalkTestDistance);
    v14 = objc_opt_new(NSMutableDictionary);
    v15 = v14;
    if (v6)
      v16 = &__kCFBooleanTrue;
    else
      v16 = &__kCFBooleanFalse;
    -[NSMutableDictionary setObject:forKeyedSubscript:](v14, "setObject:forKeyedSubscript:", v16, HKMetadataKeyAppleDeviceCalibrated);
    if (a5 != 0.0)
      -[NSMutableDictionary setObject:forKeyedSubscript:](v15, "setObject:forKeyedSubscript:", +[NSDate dateWithTimeIntervalSinceReferenceDate:](NSDate, "dateWithTimeIntervalSinceReferenceDate:", a5), HKMetadataKeyDateOfEarliestDataUsedForEstimate);
    v17 = +[HKQuantitySample quantitySampleWithType:quantity:startDate:endDate:metadata:](HKQuantitySample, "quantitySampleWithType:quantity:startDate:endDate:metadata:", v13, +[HKQuantity quantityWithUnit:doubleValue:](HKQuantity, "quantityWithUnit:doubleValue:", +[HKUnit unitFromString:](HKUnit, "unitFromString:", CFSTR("m")), v11), +[NSDate dateWithTimeIntervalSinceReferenceDate:](NSDate, "dateWithTimeIntervalSinceReferenceDate:", a4), +[NSDate dateWithTimeIntervalSinceReferenceDate:](NSDate, "dateWithTimeIntervalSinceReferenceDate:", a4), v15);
    fHkHealthStore = self->fHkHealthStore;
    v21 = v17;
    -[HKHealthStore saveObjects:withCompletion:](fHkHealthStore, "saveObjects:withCompletion:", +[NSArray arrayWithObjects:count:](NSArray, "arrayWithObjects:count:", &v21, 1), &stru_1021386B0);

  }
}

- (void)receivePredictedWalkDistanceBout:(id)a3
{
  NSObject *v5;
  NSObject *v6;
  list<CLPredictedWalkDistanceBoutEntry, std::allocator<CLPredictedWalkDistanceBoutEntry>> *p_fPendingWatchBouts;
  _OWORD *v8;
  __int128 v9;
  __int128 v10;
  __int128 v11;
  _QWORD *prev;
  unint64_t v13;
  _OWORD *next;
  __int128 v15;
  __int128 v16;
  __int128 v17;
  __int128 v18;
  __int128 v19;
  GaitMetricsRecorderDb *ptr;
  char *v21;
  BOOL v22;
  CLWalkingSpeedCalRecorderDb *v23;
  uint64_t v24;
  uint64_t v25;
  uint64_t *v26;
  uint64_t v27;
  NSObject *v28;
  const char *v29;
  uint8_t *v30;
  const char *v31;
  uint8_t *v32;
  const char *v33;
  uint8_t *v34;
  uint64_t v35;
  __int16 v36[8];
  __int128 v37;
  __int128 v38;
  __int128 v39;
  __int128 v40;
  __int128 v41;
  __int128 v42;
  __int128 v43;
  uint64_t v44;
  _BYTE v45[32];
  __int128 v46;
  __int128 v47;
  __int128 v48;
  __int128 v49;
  __int128 v50;
  uint64_t v51;
  uint8_t buf[4];
  uint64_t v53;
  __int16 v54;
  uint64_t v55;

  if (qword_10229FEA0 != -1)
    dispatch_once(&qword_10229FEA0, &stru_102138720);
  v5 = qword_10229FEA8;
  if (os_log_type_enabled((os_log_t)qword_10229FEA8, OS_LOG_TYPE_DEFAULT))
  {
    *(_WORD *)buf = 0;
    _os_log_impl((void *)&_mh_execute_header, v5, OS_LOG_TYPE_DEFAULT, "Received message in CLPredictedWalkDistanceServiceCompanion", buf, 2u);
  }
  if (sub_1001BFF7C(115, 2))
  {
    bzero(buf, 0x65CuLL);
    if (qword_10229FEA0 != -1)
      dispatch_once(&qword_10229FEA0, &stru_102138720);
    LOWORD(v37) = 0;
    _os_log_send_and_compose_impl(2, 0, buf, 1628, &_mh_execute_header, qword_10229FEA8, 0, "Received message in CLPredictedWalkDistanceServiceCompanion", &v37, 2);
    v30 = (uint8_t *)v29;
    sub_100512490("Generic", 1, 0, 2, "-[CLPredictedWalkDistanceServiceCompanion receivePredictedWalkDistanceBout:]", "%s\n", v29);
    if (v30 != buf)
      free(v30);
  }
  LODWORD(v37) = 0;
  *((_QWORD *)&v37 + 1) = 0;
  *(_QWORD *)&v38 = 0;
  DWORD2(v38) = 0;
  *(_QWORD *)&v40 = 0;
  v39 = 0uLL;
  DWORD2(v40) = 0;
  v41 = 0u;
  v42 = 0u;
  v43 = 0u;
  v44 = 0;
  objc_msgSend(a3, "getBytes:length:", &v37, 120);
  if (qword_10229FEA0 != -1)
    dispatch_once(&qword_10229FEA0, &stru_102138720);
  v6 = qword_10229FEA8;
  if (os_log_type_enabled((os_log_t)qword_10229FEA8, OS_LOG_TYPE_DEFAULT))
  {
    *(_DWORD *)buf = 134283777;
    v53 = *((_QWORD *)&v37 + 1);
    v54 = 2049;
    v55 = v38;
    _os_log_impl((void *)&_mh_execute_header, v6, OS_LOG_TYPE_DEFAULT, "Received bout from watch...,startTime,%{private}f,endTime,%{private}f", buf, 0x16u);
  }
  if (sub_1001BFF7C(115, 2))
  {
    bzero(buf, 0x65CuLL);
    if (qword_10229FEA0 != -1)
      dispatch_once(&qword_10229FEA0, &stru_102138720);
    *(_DWORD *)v45 = 134283777;
    *(_QWORD *)&v45[4] = *((_QWORD *)&v37 + 1);
    *(_WORD *)&v45[12] = 2049;
    *(_QWORD *)&v45[14] = v38;
    LODWORD(v35) = 22;
    _os_log_send_and_compose_impl(2, 0, buf, 1628, &_mh_execute_header, qword_10229FEA8, 0, "Received bout from watch...,startTime,%{private}f,endTime,%{private}f", v45, v35);
    v32 = (uint8_t *)v31;
    sub_100512490("Generic", 1, 0, 2, "-[CLPredictedWalkDistanceServiceCompanion receivePredictedWalkDistanceBout:]", "%s\n", v31);
    if (v32 != buf)
      free(v32);
  }
  sub_10041B300(self->fBoutDb.__ptr_, (uint64_t)&v37, 0);
  p_fPendingWatchBouts = &self->fPendingWatchBouts;
  if (DWORD2(v41) == 1)
  {
    v8 = operator new(0x88uLL);
    v9 = v42;
    v8[5] = v41;
    v8[6] = v9;
    v8[7] = v43;
    *((_QWORD *)v8 + 16) = v44;
    v10 = v38;
    v8[1] = v37;
    v8[2] = v10;
    v11 = v40;
    v8[3] = v39;
    v8[4] = v11;
    prev = p_fPendingWatchBouts->__end_.__prev_;
    *(_QWORD *)v8 = p_fPendingWatchBouts->__end_.__prev_;
    *((_QWORD *)v8 + 1) = p_fPendingWatchBouts;
    prev[1] = v8;
    p_fPendingWatchBouts->__end_.__prev_ = v8;
    v13 = self->fPendingWatchBouts.__size_alloc_.__value_ + 1;
    self->fPendingWatchBouts.__size_alloc_.__value_ = v13;
    if (v13)
      goto LABEL_15;
  }
  else if (self->fPendingWatchBouts.__size_alloc_.__value_)
  {
LABEL_15:
    while (1)
    {
      next = self->fPendingWatchBouts.__end_.__next_;
      v15 = next[1];
      v16 = next[2];
      v17 = next[4];
      v46 = next[3];
      v47 = v17;
      v18 = next[5];
      v19 = next[7];
      v49 = next[6];
      v50 = v19;
      v51 = *((_QWORD *)next + 16);
      v48 = v18;
      ptr = self->fGaitMetricsDb.__ptr_;
      v21 = (char *)ptr + 400;
      v22 = ptr == 0;
      v23 = self->fWalkingSpeedCalDb.__ptr_;
      v24 = v22 ? 0 : (uint64_t)v21;
      v25 = v23 ? (uint64_t)v23 + 352 : 0;
      *(_OWORD *)v45 = v15;
      *(_OWORD *)&v45[16] = v16;
      if (sub_10064F208((uint64_t)v45, v24, v25) == 109)
        break;
      v26 = (uint64_t *)self->fPendingWatchBouts.__end_.__next_;
      v27 = *v26;
      *(_QWORD *)(v27 + 8) = v26[1];
      *(_QWORD *)v26[1] = v27;
      --self->fPendingWatchBouts.__size_alloc_.__value_;
      operator delete(v26);
      if (!self->fPendingWatchBouts.__size_alloc_.__value_)
        return;
    }
    if (qword_10229FEA0 != -1)
      dispatch_once(&qword_10229FEA0, &stru_102138720);
    v28 = qword_10229FEA8;
    if (os_log_type_enabled((os_log_t)qword_10229FEA8, OS_LOG_TYPE_DEBUG))
    {
      *(_WORD *)buf = 0;
      _os_log_impl((void *)&_mh_execute_header, v28, OS_LOG_TYPE_DEBUG, "Gait Metrics unavailable, likely because device is locked.", buf, 2u);
    }
    if (sub_1001BFF7C(115, 2))
    {
      bzero(buf, 0x65CuLL);
      if (qword_10229FEA0 != -1)
        dispatch_once(&qword_10229FEA0, &stru_102138720);
      v36[0] = 0;
      LODWORD(v35) = 2;
      _os_log_send_and_compose_impl(2, 0, buf, 1628, &_mh_execute_header, qword_10229FEA8, 2, "Gait Metrics unavailable, likely because device is locked.", v36, v35);
      v34 = (uint8_t *)v33;
      sub_100512490("Generic", 1, 0, 2, "-[CLPredictedWalkDistanceServiceCompanion receivePredictedWalkDistanceBout:]", "%s\n", v33);
      if (v34 != buf)
        free(v34);
    }
  }
}

- (void)onUserInfoUpdate:(const int *)a3 data:(const NotificationData *)a4
{
  NSObject *v7;
  __int128 v8;
  __int128 v9;
  __int128 v10;
  NSObject *v11;
  int v12;
  const char *v13;
  uint8_t *v14;
  int v15;
  const char *v16;
  uint8_t *v17;
  _DWORD v18[4];
  uint8_t buf[4];
  int v20;

  objc_msgSend(-[CLPredictedWalkDistanceServiceCompanion universe](self, "universe"), "silo");
  if (*a3 == 2)
  {
    if (qword_10229FEA0 != -1)
      dispatch_once(&qword_10229FEA0, &stru_102138720);
    v7 = qword_10229FEA8;
    if (os_log_type_enabled((os_log_t)qword_10229FEA8, OS_LOG_TYPE_DEBUG))
    {
      *(_WORD *)buf = 0;
      _os_log_impl((void *)&_mh_execute_header, v7, OS_LOG_TYPE_DEBUG, "CLPredictedWalkDistanceServiceCompanion: Received user info update", buf, 2u);
    }
    if (sub_1001BFF7C(115, 2))
    {
      bzero(buf, 0x65CuLL);
      if (qword_10229FEA0 != -1)
        dispatch_once(&qword_10229FEA0, &stru_102138720);
      LOWORD(v18[0]) = 0;
      _os_log_send_and_compose_impl(2, 0, buf, 1628, &_mh_execute_header, qword_10229FEA8, 2, "CLPredictedWalkDistanceServiceCompanion: Received user info update", v18, 2);
      v14 = (uint8_t *)v13;
      sub_100512490("Generic", 1, 0, 2, "-[CLPredictedWalkDistanceServiceCompanion onUserInfoUpdate:data:]", "%s\n", v13);
      if (v14 != buf)
        free(v14);
    }
    v9 = *((_OWORD *)a4 + 1);
    v8 = *((_OWORD *)a4 + 2);
    v10 = *(_OWORD *)a4;
    *(_OWORD *)&self->fUserInfo.runVo2max = *(_OWORD *)((char *)a4 + 44);
    *(_OWORD *)&self->fUserInfo.vo2max = v9;
    *(_OWORD *)&self->fUserInfo.hronset = v8;
    *(_OWORD *)&self->fUserInfo.gender = v10;
  }
  else
  {
    if (qword_10229FEA0 != -1)
      dispatch_once(&qword_10229FEA0, &stru_102138720);
    v11 = qword_10229FEA8;
    if (os_log_type_enabled((os_log_t)qword_10229FEA8, OS_LOG_TYPE_DEFAULT))
    {
      v12 = *a3;
      *(_DWORD *)buf = 67109120;
      v20 = v12;
      _os_log_impl((void *)&_mh_execute_header, v11, OS_LOG_TYPE_DEFAULT, "#Warning Unhandled notification type, %d", buf, 8u);
    }
    if (sub_1001BFF7C(115, 2))
    {
      bzero(buf, 0x65CuLL);
      if (qword_10229FEA0 != -1)
        dispatch_once(&qword_10229FEA0, &stru_102138720);
      v15 = *a3;
      v18[0] = 67109120;
      v18[1] = v15;
      _os_log_send_and_compose_impl(2, 0, buf, 1628, &_mh_execute_header, qword_10229FEA8, 0, "#Warning Unhandled notification type, %d", v18);
      v17 = (uint8_t *)v16;
      sub_100512490("Generic", 1, 0, 2, "-[CLPredictedWalkDistanceServiceCompanion onUserInfoUpdate:data:]", "%s\n", v16);
      if (v17 != buf)
        free(v17);
    }
  }
}

- (void)sendAnalyticsWeeklyEstimate:(CLPredictedWalkDistanceEstimate *)a3 strideCalInfo:(StrideCalInfo *)a4 walkingWorkoutPaceStats:(CLRunningStat *)a5 runningWorkoutPaceStats:(CLRunningStat *)a6 userInfo:(CLBodyMetrics *)a7
{
  double v13;
  id v14;
  id v15;
  NSPredicate *v16;
  id v17;
  __int128 v18;
  __int128 v19;
  __int128 v20;
  __int128 v21;
  __int128 v22;
  __int128 v23;
  __int128 v24;
  __int128 v25;
  __int128 v26;
  __int128 v27;
  __int128 v28;
  double var4;
  double v30;
  __int128 v31;
  __int128 v32;
  __int128 v33;
  id v34;
  NSObject *v35;
  const char *v36;
  uint8_t *v37;
  id v38;
  _QWORD v39[5];
  __int128 v40;
  __int128 v41;
  __int128 v42;
  __int128 v43;
  __int128 v44;
  __int128 v45;
  __int128 v46;
  __int128 v47;
  __int128 v48;
  __int128 v49;
  __int128 v50;
  __int128 v51;
  __int128 v52;
  __int128 v53;
  __int128 v54;
  __int128 v55;
  __int128 v56;
  __int128 v57;
  __int128 v58;
  __int128 v59;
  double var9;
  __int128 v61;
  __int128 v62;
  double v63;
  __int128 v64;
  __int128 v65;
  double v66;
  __int128 v67;
  __int128 v68;
  _OWORD v69[2];
  _WORD v70[8];
  uint8_t buf[1640];

  if (objc_opt_class(MCProfileConnection, a2)
    && (objc_msgSend(+[MCProfileConnection sharedConnection](MCProfileConnection, "sharedConnection"), "isHealthDataSubmissionAllowed") & 1) != 0)
  {
    v13 = a3->var0 + -7862400.0;
    v14 = objc_msgSend(objc_alloc((Class)NSDate), "initWithTimeIntervalSinceReferenceDate:", a3->var0);
    v15 = objc_msgSend(objc_alloc((Class)NSDate), "initWithTimeIntervalSinceReferenceDate:", v13);
    v38 = +[HKQuantityType quantityTypeForIdentifier:](HKQuantityType, "quantityTypeForIdentifier:", HKQuantityTypeIdentifierSixMinuteWalkTestDistance);
    v16 = +[HKQuery predicateForSamplesWithStartDate:endDate:options:](HKQuery, "predicateForSamplesWithStartDate:endDate:options:", v15, v14, 3);
    v17 = objc_alloc((Class)HKSampleQuery);
    v39[0] = _NSConcreteStackBlock;
    v39[1] = 3221225472;
    v39[2] = sub_10041BA40;
    v39[3] = &unk_102138700;
    v39[4] = self;
    v18 = *(_OWORD *)&a3->var34;
    v54 = *(_OWORD *)&a3->var32;
    v55 = v18;
    v19 = *(_OWORD *)&a3->var29;
    v52 = *(_OWORD *)&a3->var27;
    v53 = v19;
    v20 = *(_OWORD *)&a3->var21;
    v48 = *(_OWORD *)&a3->var19;
    v49 = v20;
    v21 = *(_OWORD *)&a3->var25;
    v50 = *(_OWORD *)&a3->var23;
    v51 = v21;
    v22 = *(_OWORD *)&a3->var10;
    v44 = *(_OWORD *)&a3->var8;
    v45 = v22;
    v23 = *(_OWORD *)&a3->var16;
    v46 = *(_OWORD *)&a3->var14;
    v47 = v23;
    v24 = *(_OWORD *)&a3->var2;
    v40 = *(_OWORD *)&a3->var0;
    v41 = v24;
    v25 = *(_OWORD *)&a3->var6;
    v42 = *(_OWORD *)&a3->var4;
    v43 = v25;
    v26 = *(_OWORD *)&a4->var7;
    v58 = *(_OWORD *)&a4->var5;
    v59 = v26;
    v27 = *(_OWORD *)&a4->var3;
    v56 = *(_OWORD *)&a4->var0;
    v57 = v27;
    var9 = a4->var9;
    v28 = *(_OWORD *)&a5->var2;
    v61 = *(_OWORD *)&a5->var0;
    v62 = v28;
    var4 = a5->var4;
    v30 = a6->var4;
    v31 = *(_OWORD *)&a6->var2;
    v64 = *(_OWORD *)&a6->var0;
    v65 = v31;
    v63 = var4;
    v66 = v30;
    *(_OWORD *)((char *)v69 + 12) = *(_OWORD *)&a7->runVo2max;
    v32 = *(_OWORD *)&a7->hronset;
    v33 = *(_OWORD *)&a7->gender;
    v68 = *(_OWORD *)&a7->vo2max;
    v69[0] = v32;
    v67 = v33;
    v34 = objc_msgSend(v17, "initWithSampleType:predicate:limit:sortDescriptors:resultsHandler:", v38, v16, 0, 0, v39);
    -[HKHealthStore executeQuery:](self->fHkHealthStore, "executeQuery:", v34);

  }
  else
  {
    if (qword_10229FEA0 != -1)
      dispatch_once(&qword_10229FEA0, &stru_102138720);
    v35 = qword_10229FEA8;
    if (os_log_type_enabled((os_log_t)qword_10229FEA8, OS_LOG_TYPE_DEBUG))
    {
      *(_WORD *)buf = 0;
      _os_log_impl((void *)&_mh_execute_header, v35, OS_LOG_TYPE_DEBUG, "Not sending analytics, no IHA permission", buf, 2u);
    }
    if (sub_1001BFF7C(115, 2))
    {
      bzero(buf, 0x65CuLL);
      if (qword_10229FEA0 != -1)
        dispatch_once(&qword_10229FEA0, &stru_102138720);
      v70[0] = 0;
      _os_log_send_and_compose_impl(2, 0, buf, 1628, &_mh_execute_header, qword_10229FEA8, 2, "Not sending analytics, no IHA permission", v70, 2);
      v37 = (uint8_t *)v36;
      sub_100512490("Generic", 1, 0, 2, "-[CLPredictedWalkDistanceServiceCompanion sendAnalyticsWeeklyEstimate:strideCalInfo:walkingWorkoutPaceStats:runningWorkoutPaceStats:userInfo:]", "%s\n", v36);
      if (v37 != buf)
        free(v37);
    }
  }
}

- (void)sendToCoreAnalyticsWeeklyEstimate:(const CLPredictedWalkDistanceEstimateAnalytics *)a3
{
  unsigned __int8 v3;
  unsigned __int8 v4;
  unsigned __int8 v5;
  const CLPredictedWalkDistanceEstimateAnalytics *v6;
  int v7;
  const CLPredictedWalkDistanceEstimateAnalytics *v8;
  int v9;
  const CLPredictedWalkDistanceEstimateAnalytics *v10;
  int v11;
  _QWORD v12[5];
  _BYTE v13[32];
  __int128 v14;
  __int128 v15;
  int v16;

  v3 = atomic_load((unsigned __int8 *)&qword_1023012B8);
  if ((v3 & 1) == 0)
  {
    v6 = a3;
    v7 = __cxa_guard_acquire(&qword_1023012B8);
    a3 = v6;
    if (v7)
    {
      v16 = 1119092736;
      *(_OWORD *)v13 = xmmword_101BB0094;
      *(_OWORD *)&v13[16] = unk_101BB00A4;
      v14 = xmmword_101BB00B4;
      v15 = unk_101BB00C4;
      sub_10041C4B4(&qword_1023012A0, v13, 0x11uLL);
      __cxa_atexit((void (*)(void *))sub_10041C534, &qword_1023012A0, (void *)&_mh_execute_header);
      __cxa_guard_release(&qword_1023012B8);
      a3 = v6;
    }
  }
  v4 = atomic_load((unsigned __int8 *)&qword_1023012D8);
  if ((v4 & 1) == 0)
  {
    v8 = a3;
    v9 = __cxa_guard_acquire(&qword_1023012D8);
    a3 = v8;
    if (v9)
    {
      *(_OWORD *)v13 = xmmword_101BB00D8;
      *(_OWORD *)&v13[12] = *(__int128 *)((char *)&xmmword_101BB00D8 + 12);
      sub_10041C4B4(&qword_1023012C0, v13, 7uLL);
      __cxa_atexit((void (*)(void *))sub_10041C534, &qword_1023012C0, (void *)&_mh_execute_header);
      __cxa_guard_release(&qword_1023012D8);
      a3 = v8;
    }
  }
  v5 = atomic_load((unsigned __int8 *)&qword_1023012F8);
  if ((v5 & 1) == 0)
  {
    v10 = a3;
    v11 = __cxa_guard_acquire(&qword_1023012F8);
    a3 = v10;
    if (v11)
    {
      *(_OWORD *)v13 = xmmword_101BB00F4;
      *(_OWORD *)&v13[12] = *(__int128 *)((char *)&xmmword_101BB00F4 + 12);
      sub_10041C4B4(&qword_1023012E0, v13, 7uLL);
      __cxa_atexit((void (*)(void *))sub_10041C534, &qword_1023012E0, (void *)&_mh_execute_header);
      __cxa_guard_release(&qword_1023012F8);
      a3 = v10;
    }
  }
  v12[0] = _NSConcreteStackBlock;
  v12[1] = 3221225472;
  v12[2] = sub_10041C564;
  v12[3] = &unk_102131FE8;
  v12[4] = a3;
  AnalyticsSendEventLazy(CFSTR("com.apple.CoreMotion.6MWD.WeeklyEstimate"), v12);
}

- (BOOL)isWheelchairMode
{
  return self->fUserInfo.condition != 0;
}

- (void).cxx_destruct
{
  Client *value;
  CLPredictedWalkDistanceEstimator *v4;

  value = self->fUserInfoClient.__ptr_.__value_;
  self->fUserInfoClient.__ptr_.__value_ = 0;
  if (value)
    (*(void (**)(Client *, SEL))(*(_QWORD *)value + 8))(value, a2);
  sub_100261F44((uint64_t)&self->fWalkingSpeedCalDb);
  sub_1000F34E0(&self->fPendingWatchBouts.__end_.__prev_);
  sub_100261F44((uint64_t)&self->fGaitMetricsDb);
  v4 = self->fP6MWDEstimator.__ptr_.__value_;
  self->fP6MWDEstimator.__ptr_.__value_ = 0;
  if (v4)
    operator delete();
  sub_10041D2EC((uint64_t *)&self->fBoutAggregator, 0);
  sub_100261F44((uint64_t)&self->fBoutDb);
}

- (id).cxx_construct
{
  *((_QWORD *)self + 1) = 0;
  *((_QWORD *)self + 2) = 0;
  *((_QWORD *)self + 3) = 0;
  *((_QWORD *)self + 5) = 0;
  *((_QWORD *)self + 6) = 0;
  *((_QWORD *)self + 7) = 0;
  *((_QWORD *)self + 8) = (char *)self + 64;
  *((_QWORD *)self + 9) = (char *)self + 64;
  *((_QWORD *)self + 10) = 0;
  *((_QWORD *)self + 11) = 0;
  *((_QWORD *)self + 12) = 0;
  *((_QWORD *)self + 13) = 0;
  return self;
}

@end
