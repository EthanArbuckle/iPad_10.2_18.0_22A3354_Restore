@implementation CLVO2MaxService

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
  if (qword_102301C40 != -1)
    dispatch_once(&qword_102301C40, &stru_102144A48);
  return (id)qword_102301C38;
}

- (void)updateBypassParameters
{
  uint64_t v3;
  BOOL *p_fShouldBypassMinDelta;
  std::__shared_weak_count *v5;
  unint64_t *p_shared_owners;
  unint64_t v7;
  NSObject *v8;
  _BOOL4 v9;
  uint64_t v10;
  BOOL *p_fShouldBypassPreviousSampleInternal;
  std::__shared_weak_count *v12;
  unint64_t *v13;
  unint64_t v14;
  NSObject *v15;
  _BOOL4 v16;
  uint64_t v17;
  BOOL *p_fShouldBypassMinEstimatesUpdatedRatio;
  std::__shared_weak_count *v19;
  unint64_t *v20;
  unint64_t v21;
  NSObject *v22;
  _BOOL4 v23;
  _BOOL4 v24;
  const char *v25;
  uint8_t *v26;
  _BOOL4 v27;
  const char *v28;
  uint8_t *v29;
  _BOOL4 v30;
  const char *v31;
  uint8_t *v32;
  uint64_t v33;
  int v34;
  _BOOL4 v35;
  uint8_t buf[8];
  std::__shared_weak_count *v37;

  v3 = sub_100127B9C();
  sub_100081C10(v3, buf);
  p_fShouldBypassMinDelta = &self->fShouldBypassMinDelta;
  sub_1001E4874(*(uint64_t *)buf, "VO2MaxRetrocomputeMinMeanDelta_Bypass", &self->fShouldBypassMinDelta);
  v5 = v37;
  if (v37)
  {
    p_shared_owners = (unint64_t *)&v37->__shared_owners_;
    do
      v7 = __ldaxr(p_shared_owners);
    while (__stlxr(v7 - 1, p_shared_owners));
    if (!v7)
    {
      ((void (*)(std::__shared_weak_count *))v5->__on_zero_shared)(v5);
      std::__shared_weak_count::__release_weak(v5);
    }
  }
  if (qword_10229FEC0 != -1)
    dispatch_once(&qword_10229FEC0, &stru_102144B90);
  v8 = qword_10229FEC8;
  if (os_log_type_enabled((os_log_t)qword_10229FEC8, OS_LOG_TYPE_INFO))
  {
    v9 = *p_fShouldBypassMinDelta;
    *(_DWORD *)buf = 67240192;
    *(_DWORD *)&buf[4] = v9;
    _os_log_impl((void *)&_mh_execute_header, v8, OS_LOG_TYPE_INFO, "Updated fShouldBypassMinDelta to %{public}d", buf, 8u);
  }
  if (sub_1001BFF7C(115, 2))
  {
    bzero(buf, 0x65CuLL);
    if (qword_10229FEC0 != -1)
      dispatch_once(&qword_10229FEC0, &stru_102144B90);
    v24 = *p_fShouldBypassMinDelta;
    v34 = 67240192;
    v35 = v24;
    _os_log_send_and_compose_impl(2, 0, buf, 1628, &_mh_execute_header, qword_10229FEC8, 1, "Updated fShouldBypassMinDelta to %{public}d", &v34, 8);
    v26 = (uint8_t *)v25;
    sub_100512490("Generic", 1, 0, 2, "-[CLVO2MaxService updateBypassParameters]", "%s\n", v25);
    if (v26 != buf)
      free(v26);
  }
  v10 = sub_100127B9C();
  sub_100081C10(v10, buf);
  p_fShouldBypassPreviousSampleInternal = &self->fShouldBypassPreviousSampleInternal;
  sub_1001E4874(*(uint64_t *)buf, "VO2MaxRetrocomputeMinPrevAlgSampleInterval_Bypass", &self->fShouldBypassPreviousSampleInternal);
  v12 = v37;
  if (v37)
  {
    v13 = (unint64_t *)&v37->__shared_owners_;
    do
      v14 = __ldaxr(v13);
    while (__stlxr(v14 - 1, v13));
    if (!v14)
    {
      ((void (*)(std::__shared_weak_count *))v12->__on_zero_shared)(v12);
      std::__shared_weak_count::__release_weak(v12);
    }
  }
  if (qword_10229FEC0 != -1)
    dispatch_once(&qword_10229FEC0, &stru_102144B90);
  v15 = qword_10229FEC8;
  if (os_log_type_enabled((os_log_t)qword_10229FEC8, OS_LOG_TYPE_INFO))
  {
    v16 = *p_fShouldBypassPreviousSampleInternal;
    *(_DWORD *)buf = 67240192;
    *(_DWORD *)&buf[4] = v16;
    _os_log_impl((void *)&_mh_execute_header, v15, OS_LOG_TYPE_INFO, "Updated fShouldBypassPreviousSampleInternal to %{public}d", buf, 8u);
  }
  if (sub_1001BFF7C(115, 2))
  {
    bzero(buf, 0x65CuLL);
    if (qword_10229FEC0 != -1)
      dispatch_once(&qword_10229FEC0, &stru_102144B90);
    v27 = *p_fShouldBypassPreviousSampleInternal;
    v34 = 67240192;
    v35 = v27;
    LODWORD(v33) = 8;
    _os_log_send_and_compose_impl(2, 0, buf, 1628, &_mh_execute_header, qword_10229FEC8, 1, "Updated fShouldBypassPreviousSampleInternal to %{public}d", &v34, v33);
    v29 = (uint8_t *)v28;
    sub_100512490("Generic", 1, 0, 2, "-[CLVO2MaxService updateBypassParameters]", "%s\n", v28);
    if (v29 != buf)
      free(v29);
  }
  v17 = sub_100127B9C();
  sub_100081C10(v17, buf);
  p_fShouldBypassMinEstimatesUpdatedRatio = &self->fShouldBypassMinEstimatesUpdatedRatio;
  sub_1001E4874(*(uint64_t *)buf, "VO2MaxRetrocomputeMinEstimatesUpdatedRatio_Bypass", p_fShouldBypassMinEstimatesUpdatedRatio);
  v19 = v37;
  if (v37)
  {
    v20 = (unint64_t *)&v37->__shared_owners_;
    do
      v21 = __ldaxr(v20);
    while (__stlxr(v21 - 1, v20));
    if (!v21)
    {
      ((void (*)(std::__shared_weak_count *))v19->__on_zero_shared)(v19);
      std::__shared_weak_count::__release_weak(v19);
    }
  }
  if (qword_10229FEC0 != -1)
    dispatch_once(&qword_10229FEC0, &stru_102144B90);
  v22 = qword_10229FEC8;
  if (os_log_type_enabled((os_log_t)qword_10229FEC8, OS_LOG_TYPE_INFO))
  {
    v23 = *p_fShouldBypassMinEstimatesUpdatedRatio;
    *(_DWORD *)buf = 67240192;
    *(_DWORD *)&buf[4] = v23;
    _os_log_impl((void *)&_mh_execute_header, v22, OS_LOG_TYPE_INFO, "Updated fShouldBypassMinEstimatesUpdatedRatio to %{public}d", buf, 8u);
  }
  if (sub_1001BFF7C(115, 2))
  {
    bzero(buf, 0x65CuLL);
    if (qword_10229FEC0 != -1)
      dispatch_once(&qword_10229FEC0, &stru_102144B90);
    v30 = *p_fShouldBypassMinEstimatesUpdatedRatio;
    v34 = 67240192;
    v35 = v30;
    LODWORD(v33) = 8;
    _os_log_send_and_compose_impl(2, 0, buf, 1628, &_mh_execute_header, qword_10229FEC8, 1, "Updated fShouldBypassMinEstimatesUpdatedRatio to %{public}d", &v34, v33);
    v32 = (uint8_t *)v31;
    sub_100512490("Generic", 1, 0, 2, "-[CLVO2MaxService updateBypassParameters]", "%s\n", v31);
    if (v32 != buf)
      free(v32);
  }
}

- (void)forceClearHistoryDatabase
{
  NSObject *v3;
  const char *v4;
  uint8_t *v5;
  _WORD v6[8];
  uint8_t buf[1640];

  if (qword_10229FEC0 != -1)
    dispatch_once(&qword_10229FEC0, &stru_102144B90);
  v3 = qword_10229FEC8;
  if (os_log_type_enabled((os_log_t)qword_10229FEC8, OS_LOG_TYPE_INFO))
  {
    *(_WORD *)buf = 0;
    _os_log_impl((void *)&_mh_execute_header, v3, OS_LOG_TYPE_INFO, "Force clearing history database", buf, 2u);
  }
  if (sub_1001BFF7C(115, 2))
  {
    bzero(buf, 0x65CuLL);
    if (qword_10229FEC0 != -1)
      dispatch_once(&qword_10229FEC0, &stru_102144B90);
    v6[0] = 0;
    _os_log_send_and_compose_impl(2, 0, buf, 1628, &_mh_execute_header, qword_10229FEC8, 1, "Force clearing history database", v6, 2);
    v5 = (uint8_t *)v4;
    sub_100512490("Generic", 1, 0, 2, "-[CLVO2MaxService forceClearHistoryDatabase]", "%s\n", v4);
    if (v5 != buf)
      free(v5);
  }
  sub_101139070((_QWORD *)self->fRetrocomputeDb.__ptr_.__value_ + 9);
}

- (CLVO2MaxService)init
{
  objc_super v3;

  v3.receiver = self;
  v3.super_class = (Class)CLVO2MaxService;
  return -[CLVO2MaxService initWithInboundProtocol:outboundProtocol:](&v3, "initWithInboundProtocol:outboundProtocol:", &OBJC_PROTOCOL___CLVO2MaxServiceProtocol, &OBJC_PROTOCOL___CLVO2MaxServiceClientProtocol);
}

+ (BOOL)isSupported
{
  if (qword_102301C50 != -1)
    dispatch_once(&qword_102301C50, &stru_102144A68);
  return byte_102301C48;
}

- (void)beginService
{
  NSObject *v3;
  std::__shared_weak_count *v4;
  unint64_t *v5;
  unint64_t v6;
  std::__shared_weak_count *v7;
  unint64_t *v8;
  unint64_t v9;
  NSObject *v10;
  const char *v11;
  __int128 *v12;
  const char *v13;
  __int128 *v14;
  uint64_t v15;
  _WORD v16[8];
  __int128 buf;

  if ((_os_feature_enabled_impl("CoreLocation", "VO2MaxRetrocompute") & 1) != 0)
  {
    if (qword_10229FEC0 != -1)
      dispatch_once(&qword_10229FEC0, &stru_102144B90);
    v3 = qword_10229FEC8;
    if (os_log_type_enabled((os_log_t)qword_10229FEC8, OS_LOG_TYPE_DEFAULT))
    {
      LOWORD(buf) = 0;
      _os_log_impl((void *)&_mh_execute_header, v3, OS_LOG_TYPE_DEFAULT, "Starting up CLVO2MaxService", (uint8_t *)&buf, 2u);
    }
    if (sub_1001BFF7C(115, 2))
    {
      bzero(&buf, 0x65CuLL);
      if (qword_10229FEC0 != -1)
        dispatch_once(&qword_10229FEC0, &stru_102144B90);
      v16[0] = 0;
      LODWORD(v15) = 2;
      _os_log_send_and_compose_impl(2, 0, &buf, 1628, &_mh_execute_header, qword_10229FEC8, 0, "Starting up CLVO2MaxService", v16, v15);
      v12 = (__int128 *)v11;
      sub_100512490("Generic", 1, 0, 2, "-[CLVO2MaxService beginService]", "%s\n", v11);
      if (v12 != &buf)
        free(v12);
    }
    HIBYTE(v15) = 0;
    sub_10050C4D8((unsigned __int8 *)&v15 + 7, &buf);
    sub_1002B7674((uint64_t)&self->fInputCache, &buf);
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
    sub_10050C5D8((uint64_t *)&self->fInputCache, &buf);
    sub_1002B7674((uint64_t)&self->fInputStore, &buf);
    v7 = (std::__shared_weak_count *)*((_QWORD *)&buf + 1);
    if (*((_QWORD *)&buf + 1))
    {
      v8 = (unint64_t *)(*((_QWORD *)&buf + 1) + 8);
      do
        v9 = __ldaxr(v8);
      while (__stlxr(v9 - 1, v8));
      if (!v9)
      {
        ((void (*)(std::__shared_weak_count *))v7->__on_zero_shared)(v7);
        std::__shared_weak_count::__release_weak(v7);
      }
    }
    operator new();
  }
  if (qword_10229FEC0 != -1)
    dispatch_once(&qword_10229FEC0, &stru_102144B90);
  v10 = qword_10229FEC8;
  if (os_log_type_enabled((os_log_t)qword_10229FEC8, OS_LOG_TYPE_DEFAULT))
  {
    LOWORD(buf) = 0;
    _os_log_impl((void *)&_mh_execute_header, v10, OS_LOG_TYPE_DEFAULT, "Not starting up CLVO2MaxService because it is not enabled", (uint8_t *)&buf, 2u);
  }
  if (sub_1001BFF7C(115, 2))
  {
    bzero(&buf, 0x65CuLL);
    if (qword_10229FEC0 != -1)
      dispatch_once(&qword_10229FEC0, &stru_102144B90);
    v16[0] = 0;
    LODWORD(v15) = 2;
    _os_log_send_and_compose_impl(2, 0, &buf, 1628, &_mh_execute_header, qword_10229FEC8, 0, "Not starting up CLVO2MaxService because it is not enabled", v16, v15);
    v14 = (__int128 *)v13;
    sub_100512490("Generic", 1, 0, 2, "-[CLVO2MaxService beginService]", "%s\n", v13);
    if (v14 != &buf)
      free(v14);
  }
}

- (void)endService
{
  NSObject *v3;
  const char *v4;
  uint8_t *v5;
  _WORD v6[8];
  uint8_t buf[1640];

  if (qword_10229FEC0 != -1)
    dispatch_once(&qword_10229FEC0, &stru_102144B90);
  v3 = qword_10229FEC8;
  if (os_log_type_enabled((os_log_t)qword_10229FEC8, OS_LOG_TYPE_DEFAULT))
  {
    *(_WORD *)buf = 0;
    _os_log_impl((void *)&_mh_execute_header, v3, OS_LOG_TYPE_DEFAULT, "Shutting down CLVO2MaxService", buf, 2u);
  }
  if (sub_1001BFF7C(115, 2))
  {
    bzero(buf, 0x65CuLL);
    if (qword_10229FEC0 != -1)
      dispatch_once(&qword_10229FEC0, &stru_102144B90);
    v6[0] = 0;
    _os_log_send_and_compose_impl(2, 0, buf, 1628, &_mh_execute_header, qword_10229FEC8, 0, "Shutting down CLVO2MaxService", v6, 2);
    v5 = (uint8_t *)v4;
    sub_100512490("Generic", 1, 0, 2, "-[CLVO2MaxService endService]", "%s\n", v4);
    if (v5 != buf)
      free(v5);
  }

  self->fHkHealthStore = 0;
}

- (void)registerForRetrocomputeStatusUpdates:(id)a3
{
  id v5;
  id v6;
  id v7;
  id v8;
  id v9;
  id v10;
  id v11[2];
  _QWORD v12[2];
  int v13;
  __int128 v14;
  _DWORD v15[7];
  __int128 v16;
  __int128 v17;
  _BYTE v18[28];
  uint64_t v19;

  -[NSMutableSet addObject:](-[CLVO2MaxService retrocomputeStatusClients](self, "retrocomputeStatusClients"), "addObject:", a3);
  sub_100131938(v11, (uint64_t)"com.apple.locationd.VO2MaxService.Retrocompute", 0);
  v12[0] = 0;
  v12[1] = 0;
  v13 = 3;
  v19 = 0;
  v14 = 0u;
  memset(v15, 0, sizeof(v15));
  v16 = 0u;
  v17 = 0u;
  memset(v18, 0, sizeof(v18));
  if (sub_100804F78((uint64_t)self->fRetrocomputeDb.__ptr_.__value_, 3, (uint64_t)v12) == 100)
  {
    v5 = objc_alloc((Class)NSDate);
    v6 = objc_msgSend(v5, "initWithTimeIntervalSinceReferenceDate:", *(double *)((char *)&v14 + 4));
    v7 = objc_alloc((Class)NSDate);
    v8 = objc_msgSend(v7, "initWithTimeIntervalSinceReferenceDate:", *(double *)&v15[1]);
    v9 = objc_alloc((Class)NSNumber);
    v10 = objc_msgSend(v9, "initWithDouble:", *(double *)&v16);
    objc_msgSend(a3, "onRetrocomputeStatusUpdate:", objc_msgSend(objc_alloc((Class)CMVO2MaxRetrocomputeState), "initWithStatus:startDate:endDate:meanDelta:", (int)v14, v6, v8, v10));
  }
  sub_100131740(v11);
}

- (void)unregisterForRetrocomputeStatusUpdates:(id)a3
{
  -[NSMutableSet removeObject:](-[CLVO2MaxService retrocomputeStatusClients](self, "retrocomputeStatusClients"), "removeObject:", a3);
}

- (void)sendRetroComputeAnalytics
{
  unsigned __int8 v3;
  NSObject *v4;
  const char *v5;
  uint8_t *v6;
  NSObject *v7;
  const char *v8;
  _WORD v9[8];
  _QWORD v10[5];
  __int128 v11;
  __int128 v12;
  __int128 v13;
  __int128 v14;
  __int128 v15;
  __int128 v16;
  __int128 v17;
  __int128 v18;
  __int128 v19;
  uint64_t v20;
  __int128 v21;
  _OWORD v22[4];
  __int128 v23;
  __int128 v24;
  _BYTE v25[32];
  uint64_t v26;
  uint8_t buf[16];
  __int128 v28;
  __int128 v29;
  _OWORD v30[99];

  if (objc_opt_class(MCProfileConnection, a2)
    && (objc_msgSend(+[MCProfileConnection sharedConnection](MCProfileConnection, "sharedConnection"), "isHealthDataSubmissionAllowed") & 1) != 0)
  {
    v3 = atomic_load((unsigned __int8 *)&qword_102301C70);
    if ((v3 & 1) == 0 && __cxa_guard_acquire(&qword_102301C70))
    {
      v29 = xmmword_101BB69A0;
      v30[0] = unk_101BB69B0;
      *(_OWORD *)((char *)v30 + 12) = unk_101BB69BC;
      *(_OWORD *)buf = xmmword_101BB6980;
      v28 = unk_101BB6990;
      sub_10041C4B4(&qword_102301C58, buf, 0x13uLL);
      __cxa_atexit((void (*)(void *))sub_10041C534, &qword_102301C58, (void *)&_mh_execute_header);
      __cxa_guard_release(&qword_102301C70);
    }
    v21 = 0uLL;
    LODWORD(v22[0]) = 3;
    v26 = 0;
    memset((char *)v22 + 4, 0, 44);
    v23 = 0u;
    v24 = 0u;
    memset(v25, 0, 28);
    if (sub_100804F78((uint64_t)self->fRetrocomputeDb.__ptr_.__value_, 3, (uint64_t)&v21) != 109)
    {
      v10[1] = 3221225472;
      v17 = v24;
      v18 = *(_OWORD *)v25;
      v19 = *(_OWORD *)&v25[16];
      v13 = v22[1];
      v14 = v22[2];
      v15 = v22[3];
      v16 = v23;
      v11 = v21;
      v10[0] = _NSConcreteStackBlock;
      v10[2] = sub_100574548;
      v10[3] = &unk_102144A90;
      v10[4] = self;
      v20 = v26;
      v12 = v22[0];
      AnalyticsSendEventLazy(CFSTR("com.apple.VO2MaxRetroCompute"), v10);
      if (qword_10229FEC0 != -1)
        dispatch_once(&qword_10229FEC0, &stru_102144B90);
      v4 = qword_10229FEC8;
      if (os_log_type_enabled((os_log_t)qword_10229FEC8, OS_LOG_TYPE_DEBUG))
      {
        *(_WORD *)buf = 0;
        _os_log_impl((void *)&_mh_execute_header, v4, OS_LOG_TYPE_DEBUG, "Succesfully accessed history table, sent Core Analytics event", buf, 2u);
      }
      if (sub_1001BFF7C(115, 2))
      {
        bzero(buf, 0x65CuLL);
        if (qword_10229FEC0 != -1)
          dispatch_once(&qword_10229FEC0, &stru_102144B90);
        v9[0] = 0;
        _os_log_send_and_compose_impl(2, 0, buf, 1628, &_mh_execute_header, qword_10229FEC8, 2, "Succesfully accessed history table, sent Core Analytics event", v9, 2);
        v6 = (uint8_t *)v5;
        sub_100512490("Generic", 1, 0, 2, "-[CLVO2MaxService sendRetroComputeAnalytics]", "%s\n", v5);
LABEL_22:
        if (v6 != buf)
          free(v6);
      }
    }
  }
  else
  {
    if (qword_10229FEC0 != -1)
      dispatch_once(&qword_10229FEC0, &stru_102144B90);
    v7 = qword_10229FEC8;
    if (os_log_type_enabled((os_log_t)qword_10229FEC8, OS_LOG_TYPE_DEBUG))
    {
      *(_WORD *)buf = 0;
      _os_log_impl((void *)&_mh_execute_header, v7, OS_LOG_TYPE_DEBUG, "Retro-compute, not sending analytics, no IHA permission", buf, 2u);
    }
    if (sub_1001BFF7C(115, 2))
    {
      bzero(buf, 0x65CuLL);
      if (qword_10229FEC0 != -1)
        dispatch_once(&qword_10229FEC0, &stru_102144B90);
      LOWORD(v21) = 0;
      _os_log_send_and_compose_impl(2, 0, buf, 1628, &_mh_execute_header, qword_10229FEC8, 2, "Retro-compute, not sending analytics, no IHA permission", &v21, 2);
      v6 = (uint8_t *)v8;
      sub_100512490("Generic", 1, 0, 2, "-[CLVO2MaxService sendRetroComputeAnalytics]", "%s\n", v8);
      goto LABEL_22;
    }
  }
}

- (void)scheduleRetrocomputePreprocessing
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
  sub_1001FD98C(v20, "VO2MaxRetrocomputeNextPreprocessingTime", &v19);
  v5 = v19;
  if (v19 > Current + (double)XPC_ACTIVITY_INTERVAL_1_DAY)
  {
    if (qword_10229FEC0 != -1)
      dispatch_once(&qword_10229FEC0, &stru_102144B90);
    v6 = qword_10229FEC8;
    if (os_log_type_enabled((os_log_t)qword_10229FEC8, OS_LOG_TYPE_ERROR))
    {
      *(_DWORD *)buf = 136446466;
      v29 = "VO2MaxRetrocomputeNextPreprocessingTime";
      v30 = 2050;
      v31 = v19;
      _os_log_impl((void *)&_mh_execute_header, v6, OS_LOG_TYPE_ERROR, "%{public}s is too far in the future (%{public}.2f). Resetting!", buf, 0x16u);
    }
    if (sub_1001BFF7C(115, 0))
    {
      bzero(buf, 0x65CuLL);
      if (qword_10229FEC0 != -1)
        dispatch_once(&qword_10229FEC0, &stru_102144B90);
      v22 = 136446466;
      v23 = "VO2MaxRetrocomputeNextPreprocessingTime";
      v24 = 2050;
      v25 = v19;
      _os_log_send_and_compose_impl(2, 0, buf, 1628, &_mh_execute_header, qword_10229FEC8, 16, "%{public}s is too far in the future (%{public}.2f). Resetting!", &v22, 22);
      v16 = (uint8_t *)v15;
      sub_100512490("Generic", 1, 0, 0, "-[CLVO2MaxService scheduleRetrocomputePreprocessing]", "%s\n", v15);
      if (v16 != buf)
        free(v16);
    }
    sub_100525484(v20, "VO2MaxRetrocomputeNextPreprocessingTime", 0xFFFFFFFFLL);
    v19 = 0.0;
    v5 = 0.0;
  }
  v7 = v5 - Current;
  if (XPC_ACTIVITY_INTERVAL_30_MIN <= (uint64_t)v7)
    v8 = (uint64_t)v7;
  else
    v8 = XPC_ACTIVITY_INTERVAL_30_MIN;
  if (qword_10229FEC0 != -1)
    dispatch_once(&qword_10229FEC0, &stru_102144B90);
  v9 = qword_10229FEC8;
  if (os_log_type_enabled((os_log_t)qword_10229FEC8, OS_LOG_TYPE_DEFAULT))
  {
    *(_DWORD *)buf = 136446722;
    v29 = "com.apple.locationd.VO2Max.RetrocomputePreprocessing";
    v30 = 2050;
    v31 = v19;
    v32 = 2050;
    v33 = v8;
    _os_log_impl((void *)&_mh_execute_header, v9, OS_LOG_TYPE_DEFAULT, "%{public}s: Registering XPC Activity with nextPreprocessingTime=(%{public}.2f) and delay=(%{public}lld)", buf, 0x20u);
  }
  if (sub_1001BFF7C(115, 2))
  {
    bzero(buf, 0x65CuLL);
    if (qword_10229FEC0 != -1)
      dispatch_once(&qword_10229FEC0, &stru_102144B90);
    v22 = 136446722;
    v23 = "com.apple.locationd.VO2Max.RetrocomputePreprocessing";
    v24 = 2050;
    v25 = v19;
    v26 = 2050;
    v27 = v8;
    LODWORD(v17) = 32;
    _os_log_send_and_compose_impl(2, 0, buf, 1628, &_mh_execute_header, qword_10229FEC8, 0, "%{public}s: Registering XPC Activity with nextPreprocessingTime=(%{public}.2f) and delay=(%{public}lld)", &v22, v17);
    v14 = (uint8_t *)v13;
    sub_100512490("Generic", 1, 0, 2, "-[CLVO2MaxService scheduleRetrocomputePreprocessing]", "%s\n", v13);
    if (v14 != buf)
      free(v14);
  }
  xpc_activity_unregister("com.apple.locationd.VO2Max.RetrocomputePreprocessing");
  handler[0] = _NSConcreteStackBlock;
  handler[1] = 3221225472;
  handler[2] = sub_100574C7C;
  handler[3] = &unk_1021384B8;
  handler[4] = objc_msgSend(objc_msgSend(-[CLVO2MaxService universe](self, "universe"), "vendor"), "proxyForService:", CFSTR("CLVO2MaxService"));
  handler[5] = v8;
  xpc_activity_register("com.apple.locationd.VO2Max.RetrocomputePreprocessing", XPC_ACTIVITY_CHECK_IN, handler);
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

- (void)resetRetrocomputePreProcessingActivity:(id)a3 withDelay:(int64_t)a4
{
  double v6;
  NSObject *v7;
  uint64_t v8;
  std::__shared_weak_count *v9;
  unint64_t *v10;
  unint64_t v11;
  const char *v12;
  char *v13;
  double v14;
  int v15;
  const char *v16;
  __int16 v17;
  double v18;
  _BYTE buf[1628];

  v6 = CFAbsoluteTimeGetCurrent() + (double)a4;
  v14 = v6;
  if (qword_10229FEC0 != -1)
    dispatch_once(&qword_10229FEC0, &stru_102144B90);
  v7 = qword_10229FEC8;
  if (os_log_type_enabled((os_log_t)qword_10229FEC8, OS_LOG_TYPE_DEFAULT))
  {
    *(_DWORD *)buf = 136446466;
    *(_QWORD *)&buf[4] = "VO2MaxRetrocomputeNextPreprocessingTime";
    *(_WORD *)&buf[12] = 2050;
    *(double *)&buf[14] = v6;
    _os_log_impl((void *)&_mh_execute_header, v7, OS_LOG_TYPE_DEFAULT, "%{public}s: Resetting next activity time to: %{public}.1f", buf, 0x16u);
  }
  if (sub_1001BFF7C(115, 2))
  {
    bzero(buf, 0x65CuLL);
    if (qword_10229FEC0 != -1)
      dispatch_once(&qword_10229FEC0, &stru_102144B90);
    v15 = 136446466;
    v16 = "VO2MaxRetrocomputeNextPreprocessingTime";
    v17 = 2050;
    v18 = v6;
    _os_log_send_and_compose_impl(2, 0, buf, 1628, &_mh_execute_header, qword_10229FEC8, 0, "%{public}s: Resetting next activity time to: %{public}.1f", &v15, 22);
    v13 = (char *)v12;
    sub_100512490("Generic", 1, 0, 2, "-[CLVO2MaxService resetRetrocomputePreProcessingActivity:withDelay:]", "%s\n", v12);
    if (v13 != buf)
      free(v13);
  }
  v8 = sub_100127B9C();
  sub_100081C10(v8, buf);
  sub_10018A4CC(*(uint64_t *)buf, "VO2MaxRetrocomputeNextPreprocessingTime", &v14);
  v9 = *(std::__shared_weak_count **)&buf[8];
  if (*(_QWORD *)&buf[8])
  {
    v10 = (unint64_t *)(*(_QWORD *)&buf[8] + 8);
    do
      v11 = __ldaxr(v10);
    while (__stlxr(v11 - 1, v10));
    if (!v11)
    {
      ((void (*)(std::__shared_weak_count *))v9->__on_zero_shared)(v9);
      std::__shared_weak_count::__release_weak(v9);
    }
  }
  -[CLVO2MaxService markXpcActivityDone:](self, "markXpcActivityDone:", a3);
  -[CLVO2MaxService scheduleRetrocomputePreprocessing](self, "scheduleRetrocomputePreprocessing");
}

- (void)onRetrocomputePreprocessingActivity:(id)a3
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
    if (qword_10229FEC0 != -1)
      dispatch_once(&qword_10229FEC0, &stru_102144B90);
    v8 = qword_10229FEC8;
    if (os_log_type_enabled((os_log_t)qword_10229FEC8, OS_LOG_TYPE_ERROR))
    {
      *(_WORD *)buf = 0;
      _os_log_impl((void *)&_mh_execute_header, v8, OS_LOG_TYPE_ERROR, "Invalid xpc activity.", buf, 2u);
    }
    if (!sub_1001BFF7C(115, 0))
      return;
    bzero(buf, 0x65CuLL);
    if (qword_10229FEC0 != -1)
      dispatch_once(&qword_10229FEC0, &stru_102144B90);
    _os_log_send_and_compose_impl(2, 0, buf, 1628, &_mh_execute_header, qword_10229FEC8, 16, "Invalid xpc activity.");
LABEL_31:
    v13 = (uint8_t *)v9;
    sub_100512490("Generic", 1, 0, 0, "-[CLVO2MaxService onRetrocomputePreprocessingActivity:]", "%s\n", v9);
    if (v13 != buf)
      free(v13);
    return;
  }
  state = xpc_activity_get_state((xpc_activity_t)a3);
  if (state == 4 || (v6 = state, state == 2))
  {
    if (qword_10229FEC0 != -1)
      dispatch_once(&qword_10229FEC0, &stru_102144B90);
    v7 = qword_10229FEC8;
    if (os_log_type_enabled((os_log_t)qword_10229FEC8, OS_LOG_TYPE_DEFAULT))
    {
      *(_WORD *)buf = 0;
      _os_log_impl((void *)&_mh_execute_header, v7, OS_LOG_TYPE_DEFAULT, "Preparing to execute VO2MaxRetrocomputePreProcessing", buf, 2u);
    }
    if (sub_1001BFF7C(115, 2))
    {
      bzero(buf, 0x65CuLL);
      if (qword_10229FEC0 != -1)
        dispatch_once(&qword_10229FEC0, &stru_102144B90);
      LOWORD(v14) = 0;
      _os_log_send_and_compose_impl(2, 0, buf, 1628, &_mh_execute_header, qword_10229FEC8, 0, "Preparing to execute VO2MaxRetrocomputePreProcessing", &v14, 2);
      v12 = (uint8_t *)v11;
      sub_100512490("Generic", 1, 0, 2, "-[CLVO2MaxService onRetrocomputePreprocessingActivity:]", "%s\n", v11);
      if (v12 != buf)
        free(v12);
    }
    -[CLVO2MaxService executeRetrocomputePreprocessing:](self, "executeRetrocomputePreprocessing:", a3);
    return;
  }
  if (qword_10229FEC0 != -1)
    dispatch_once(&qword_10229FEC0, &stru_102144B90);
  v10 = qword_10229FEC8;
  if (os_log_type_enabled((os_log_t)qword_10229FEC8, OS_LOG_TYPE_ERROR))
  {
    *(_DWORD *)buf = 134217984;
    v16 = v6;
    _os_log_impl((void *)&_mh_execute_header, v10, OS_LOG_TYPE_ERROR, "Unexpected VO2MaxRetrocomputePreProcessing activity state: %ld", buf, 0xCu);
  }
  if (sub_1001BFF7C(115, 0))
  {
    bzero(buf, 0x65CuLL);
    if (qword_10229FEC0 != -1)
      dispatch_once(&qword_10229FEC0, &stru_102144B90);
    _os_log_send_and_compose_impl(2, 0, buf, 1628, &_mh_execute_header, qword_10229FEC8, 16, "Unexpected VO2MaxRetrocomputePreProcessing activity state: %ld", &v14);
    goto LABEL_31;
  }
}

- (void)queryVO2MaxRetrocomputeStatusWithReply:(id)a3
{
  uint64_t v4;
  id v5;
  id v6;
  id v7;
  id v8;
  id v9;
  id v10;
  id v11;
  NSObject *v12;
  uint64_t v13;
  NSObject *v14;
  uint64_t v15;
  const char *v16;
  uint8_t *v17;
  const char *v18;
  uint8_t *v19;
  const char *v20;
  int v21;
  int v22;
  __int16 v23;
  id v24;
  uint8_t buf[4];
  int v26;
  __int16 v27;
  id v28;
  _QWORD v29[2];
  int v30;
  __int128 v31;
  _DWORD v32[7];
  __int128 v33;
  __int128 v34;
  _BYTE v35[28];
  uint64_t v36;

  v29[0] = 0;
  v29[1] = 0;
  v30 = 3;
  v36 = 0;
  v31 = 0u;
  memset(v32, 0, sizeof(v32));
  v33 = 0u;
  v34 = 0u;
  memset(v35, 0, sizeof(v35));
  v4 = sub_100804F78((uint64_t)self->fRetrocomputeDb.__ptr_.__value_, 3, (uint64_t)v29);
  if ((_DWORD)v4 == 100)
  {
    v5 = objc_alloc((Class)NSDate);
    v6 = objc_msgSend(v5, "initWithTimeIntervalSinceReferenceDate:", *(double *)((char *)&v31 + 4));
    v7 = objc_alloc((Class)NSDate);
    v8 = objc_msgSend(v7, "initWithTimeIntervalSinceReferenceDate:", *(double *)&v32[1]);
    v9 = objc_alloc((Class)NSNumber);
    v10 = objc_msgSend(v9, "initWithDouble:", *(double *)&v33);
    v11 = objc_msgSend(objc_alloc((Class)CMVO2MaxRetrocomputeState), "initWithStatus:startDate:endDate:meanDelta:", (int)v31, v6, v8, v10);
    if (qword_10229FEC0 != -1)
      dispatch_once(&qword_10229FEC0, &stru_102144B90);
    v12 = qword_10229FEC8;
    if (os_log_type_enabled((os_log_t)qword_10229FEC8, OS_LOG_TYPE_DEBUG))
    {
      *(_DWORD *)buf = 67109378;
      v26 = 3;
      v27 = 2080;
      v28 = objc_msgSend(objc_msgSend(v11, "description"), "UTF8String");
      _os_log_impl((void *)&_mh_execute_header, v12, OS_LOG_TYPE_DEBUG, "Queried VO2MaxRetrocomputeHistory for algVersion = %d and received %s", buf, 0x12u);
    }
    if (sub_1001BFF7C(115, 2))
    {
      bzero(buf, 0x65CuLL);
      if (qword_10229FEC0 != -1)
        dispatch_once(&qword_10229FEC0, &stru_102144B90);
      v15 = qword_10229FEC8;
      v21 = 67109378;
      v22 = 3;
      v23 = 2080;
      v24 = objc_msgSend(objc_msgSend(v11, "description"), "UTF8String");
      LODWORD(v20) = 18;
      _os_log_send_and_compose_impl(2, 0, buf, 1628, &_mh_execute_header, v15, 2, "Queried VO2MaxRetrocomputeHistory for algVersion = %d and received %s", &v21, v20);
      v17 = (uint8_t *)v16;
      sub_100512490("Generic", 1, 0, 2, "-[CLVO2MaxService queryVO2MaxRetrocomputeStatusWithReply:]", "%s\n", v16);
      if (v17 != buf)
        free(v17);
    }
    (*((void (**)(id, id, uint64_t))a3 + 2))(a3, v11, 100);

  }
  else
  {
    v13 = v4;
    if (qword_10229FEC0 != -1)
      dispatch_once(&qword_10229FEC0, &stru_102144B90);
    v14 = qword_10229FEC8;
    if (os_log_type_enabled((os_log_t)qword_10229FEC8, OS_LOG_TYPE_ERROR))
    {
      *(_DWORD *)buf = 67109120;
      v26 = v13;
      _os_log_impl((void *)&_mh_execute_header, v14, OS_LOG_TYPE_ERROR, "Error querying VO2MaxRetrocomputeHistory: %u", buf, 8u);
    }
    if (sub_1001BFF7C(115, 0))
    {
      bzero(buf, 0x65CuLL);
      if (qword_10229FEC0 != -1)
        dispatch_once(&qword_10229FEC0, &stru_102144B90);
      v21 = 67109120;
      v22 = v13;
      _os_log_send_and_compose_impl(2, 0, buf, 1628, &_mh_execute_header, qword_10229FEC8, 16, "Error querying VO2MaxRetrocomputeHistory: %u", &v21);
      v19 = (uint8_t *)v18;
      sub_100512490("Generic", 1, 0, 0, "-[CLVO2MaxService queryVO2MaxRetrocomputeStatusWithReply:]", "%s\n", v18);
      if (v19 != buf)
        free(v19);
    }
    (*((void (**)(id, _QWORD, uint64_t))a3 + 2))(a3, 0, v13);
  }
}

- (void)executeRetrocomputePreprocessing:(id)a3
{
  uint64_t *v5;
  uint64_t *v6;
  CFAbsoluteTime Current;
  unsigned __int8 *v8;
  int v9;
  NSObject *v10;
  std::__shared_weak_count *v11;
  unint64_t *v12;
  unint64_t v13;
  NSObject *v14;
  int v15;
  int v16;
  uint64_t v17;
  std::__shared_weak_count *v18;
  unint64_t *v19;
  unint64_t v20;
  NSObject *v21;
  uint64_t v22;
  std::__shared_weak_count *v23;
  unint64_t *v24;
  unint64_t v25;
  NSObject *v26;
  id v27;
  id v28;
  uint64_t v29;
  void *i;
  NSObject *v31;
  int v32;
  NSObject *v33;
  NSObject *v34;
  NSObject *v35;
  __int128 v36;
  __int128 v37;
  __int128 v38;
  NSObject *v39;
  double v40;
  double v41;
  id v42;
  double v43;
  id v44;
  NSPredicate *v45;
  NSSortDescriptor *v46;
  id v47;
  HKQuantityType *v48;
  id v49;
  NSObject *v50;
  unint64_t *p_shared_owners;
  unint64_t v52;
  std::__shared_weak_count *v53;
  unint64_t *v54;
  unint64_t v55;
  const char *v56;
  uint8_t *v57;
  int v58;
  int v59;
  const char *v60;
  uint8_t *v61;
  const char *v62;
  uint8_t *v63;
  const char *v64;
  uint8_t *v65;
  const char *v66;
  uint8_t *v67;
  const char *v68;
  uint8_t *v69;
  const char *v70;
  uint8_t *v71;
  const char *v72;
  uint8_t *v73;
  uint64_t v74;
  _QWORD block[11];
  std::__shared_weak_count *v76;
  _QWORD v77[7];
  __int128 v78;
  __int128 v79;
  __int128 v80;
  __int128 v81;
  double v82;
  double v83;
  uint64_t v84;
  uint64_t *v85;
  uint64_t v86;
  char v87;
  uint64_t v88;
  std::__shared_weak_count *v89;
  void **v90;
  NSSortDescriptor *v91;
  _BYTE v92[128];
  uint64_t v93;
  uint64_t v94;
  int v95;
  uint64_t v96;
  uint64_t v97;
  uint8_t buf[8];
  uint8_t *v99;
  uint64_t v100;
  __n128 (*v101)(__n128 *, __n128 *);
  void (*v102)(uint64_t);
  void *v103;
  _QWORD v104[198];
  uint64_t v105;
  uint64_t *v106;
  uint64_t v107;
  __n128 (*v108)(uint64_t, uint64_t);
  uint64_t (*v109)();
  void *v110;
  _QWORD v111[2];
  int v112;
  __int128 v113;
  _BYTE v114[108];
  uint64_t v115;

  if (!objc_opt_class(HKQuery, a2))
  {
    -[CLVO2MaxService markXpcActivityDone:](self, "markXpcActivityDone:", a3);
    -[CLVO2MaxService sendRetroComputeAnalytics](self, "sendRetroComputeAnalytics");
    return;
  }
  sub_1005804F4((uint64_t *)&off_102144AB0, &v88);
  -[CLVO2MaxService runAggregationForStagingTables](self, "runAggregationForStagingTables");
  v105 = 0;
  v106 = &v105;
  v107 = 0xC812000000;
  v108 = sub_100206C90;
  v109 = nullsub_52;
  v111[1] = 0;
  v110 = &unk_102080316;
  v111[0] = 0;
  v112 = 3;
  v115 = 0;
  v113 = 0u;
  memset(v114, 0, 28);
  memset(&v114[44], 0, 60);
  v84 = 0;
  v85 = &v84;
  v86 = 0x2020000000;
  v87 = 0;
  if (sub_100804F78((uint64_t)self->fRetrocomputeDb.__ptr_.__value_, 3, (uint64_t)v111) == 109)
  {
    v5 = v85;
LABEL_4:
    *((_BYTE *)v5 + 24) = 1;
    goto LABEL_10;
  }
  if (v106[6])
  {
    if (!-[CLVO2MaxService isEligibleForPreProcessing:](self, "isEligibleForPreProcessing:", v106 + 6))
    {
      if (qword_10229FEC0 != -1)
        dispatch_once(&qword_10229FEC0, &stru_102144B90);
      v14 = qword_10229FEC8;
      if (os_log_type_enabled((os_log_t)qword_10229FEC8, OS_LOG_TYPE_DEFAULT))
      {
        v15 = *((_DWORD *)v106 + 17);
        v16 = *((_DWORD *)v106 + 46);
        *(_DWORD *)buf = 67240704;
        *(_DWORD *)&buf[4] = v15;
        LOWORD(v99) = 1026;
        *(_DWORD *)((char *)&v99 + 2) = v16;
        HIWORD(v99) = 1026;
        LODWORD(v100) = 3;
        _os_log_impl((void *)&_mh_execute_header, v14, OS_LOG_TYPE_DEFAULT, "Will not attempt retrocompute pre-processing, status: %{public}d, unavailableReasons: %{public}d, algVersion: %{public}d", buf, 0x14u);
      }
      if (sub_1001BFF7C(115, 2))
      {
        bzero(buf, 0x65CuLL);
        if (qword_10229FEC0 != -1)
          dispatch_once(&qword_10229FEC0, &stru_102144B90);
        v58 = *((_DWORD *)v106 + 17);
        v59 = *((_DWORD *)v106 + 46);
        LODWORD(v93) = 67240704;
        HIDWORD(v93) = v58;
        LOWORD(v94) = 1026;
        *(_DWORD *)((char *)&v94 + 2) = v59;
        HIWORD(v94) = 1026;
        v95 = 3;
        _os_log_send_and_compose_impl(2, 0, buf, 1628, &_mh_execute_header, qword_10229FEC8, 0, "Will not attempt retrocompute pre-processing, status: %{public}d, unavailableReasons: %{public}d, algVersion: %{public}d", &v93, 20);
        v61 = (uint8_t *)v60;
        sub_100512490("Generic", 1, 0, 2, "-[CLVO2MaxService executeRetrocomputePreprocessing:]", "%s\n", v60);
        if (v61 != buf)
          free(v61);
      }
      -[CLVO2MaxService resetRetrocomputePreProcessingActivity:withDelay:](self, "resetRetrocomputePreProcessingActivity:withDelay:", a3, XPC_ACTIVITY_INTERVAL_1_DAY);
      if (*((_DWORD *)v106 + 17) == 2 && !self->fTriggerRetrocomputeInProgress)
        -[CLVO2MaxService retryTriggerRetrocompute](self, "retryTriggerRetrocompute");
      -[CLVO2MaxService sendRetroComputeAnalytics](self, "sendRetroComputeAnalytics");
      goto LABEL_20;
    }
    v6 = v106;
    *((_DWORD *)v106 + 39) = 0;
    *((_DWORD *)v6 + 46) = 0;
    v5 = v85;
  }
  else
  {
    sub_1011F6E30(self->fStagingOutputStore.__ptr_.__value_);
    Current = CFAbsoluteTimeGetCurrent();
    v8 = (unsigned __int8 *)v106;
    *((CFAbsoluteTime *)v106 + 7) = Current;
    uuid_clear(v8 + 112);
    sub_100423B04((uint64_t)self->fRetrocomputeDb.__ptr_.__value_, (uint64_t)(v106 + 6));
    v9 = sub_100804F78((uint64_t)self->fRetrocomputeDb.__ptr_.__value_, 3, (uint64_t)(v106 + 6));
    v5 = v85;
    if (v9 == 109)
      goto LABEL_4;
  }
LABEL_10:
  v93 = 0;
  v94 = 0;
  v95 = 3;
  v97 = 0;
  v96 = 0;
  if (*((_BYTE *)v5 + 24))
  {
LABEL_14:
    if (qword_10229FEC0 != -1)
      dispatch_once(&qword_10229FEC0, &stru_102144B90);
    v10 = qword_10229FEC8;
    if (os_log_type_enabled((os_log_t)qword_10229FEC8, OS_LOG_TYPE_DEFAULT))
    {
      *(_WORD *)buf = 0;
      _os_log_impl((void *)&_mh_execute_header, v10, OS_LOG_TYPE_DEFAULT, "VO2MaxRetrocomputeHistory query failed due to device lock", buf, 2u);
    }
    if (sub_1001BFF7C(115, 2))
    {
      bzero(buf, 0x65CuLL);
      if (qword_10229FEC0 != -1)
        dispatch_once(&qword_10229FEC0, &stru_102144B90);
      LOWORD(v90) = 0;
      _os_log_send_and_compose_impl(2, 0, buf, 1628, &_mh_execute_header, qword_10229FEC8, 0, "VO2MaxRetrocomputeHistory query failed due to device lock", &v90, 2);
      v57 = (uint8_t *)v56;
      sub_100512490("Generic", 1, 0, 2, "-[CLVO2MaxService executeRetrocomputePreprocessing:]", "%s\n", v56);
      if (v57 != buf)
        free(v57);
    }
    -[CLVO2MaxService resetRetrocomputePreProcessingActivity:withDelay:](self, "resetRetrocomputePreProcessingActivity:withDelay:", a3, XPC_ACTIVITY_INTERVAL_30_MIN);
    goto LABEL_20;
  }
  if (sub_100423D58((uint64_t)self->fRetrocomputeBodyMetricsDb.__ptr_.__value_) == 109)
  {
    *((_BYTE *)v85 + 24) = 1;
    goto LABEL_14;
  }
  if (*((_BYTE *)v85 + 24))
    goto LABEL_14;
  v83 = 47304000.0;
  v17 = sub_100127B9C();
  sub_100081C10(v17, buf);
  sub_1001FD98C(*(uint64_t *)buf, "VO2MaxRetrocomputeAlgVersionEligibilityDuration", &v83);
  v18 = (std::__shared_weak_count *)v99;
  if (v99)
  {
    v19 = (unint64_t *)(v99 + 8);
    do
      v20 = __ldaxr(v19);
    while (__stlxr(v20 - 1, v19));
    if (!v20)
    {
      ((void (*)(std::__shared_weak_count *))v18->__on_zero_shared)(v18);
      std::__shared_weak_count::__release_weak(v18);
    }
  }
  if (CFAbsoluteTimeGetCurrent() - v83 > *((double *)v106 + 7))
  {
    if (qword_10229FEC0 != -1)
      dispatch_once(&qword_10229FEC0, &stru_102144B90);
    v21 = qword_10229FEC8;
    if (os_log_type_enabled((os_log_t)qword_10229FEC8, OS_LOG_TYPE_DEFAULT))
    {
      *(_WORD *)buf = 0;
      _os_log_impl((void *)&_mh_execute_header, v21, OS_LOG_TYPE_DEFAULT, "Will not attempt retrocompute pre-processing, algVersion aged out for retrocompute", buf, 2u);
    }
    if (sub_1001BFF7C(115, 2))
    {
      bzero(buf, 0x65CuLL);
      if (qword_10229FEC0 != -1)
        dispatch_once(&qword_10229FEC0, &stru_102144B90);
      LOWORD(v90) = 0;
      _os_log_send_and_compose_impl(2, 0, buf, 1628, &_mh_execute_header, qword_10229FEC8, 0, "Will not attempt retrocompute pre-processing, algVersion aged out for retrocompute", &v90, 2);
      v63 = (uint8_t *)v62;
      sub_100512490("Generic", 1, 0, 2, "-[CLVO2MaxService executeRetrocomputePreprocessing:]", "%s\n", v62);
      if (v63 != buf)
        free(v63);
    }
    *((_DWORD *)v106 + 46) |= 0x100u;
  }
  v82 = 15552000.0;
  v22 = sub_100127B9C();
  sub_100081C10(v22, buf);
  sub_1001FD98C(*(uint64_t *)buf, "VO2MaxRetrocomputeMaxAvailabilityDuration", &v82);
  v23 = (std::__shared_weak_count *)v99;
  if (v99)
  {
    v24 = (unint64_t *)(v99 + 8);
    do
      v25 = __ldaxr(v24);
    while (__stlxr(v25 - 1, v24));
    if (!v25)
    {
      ((void (*)(std::__shared_weak_count *))v23->__on_zero_shared)(v23);
      std::__shared_weak_count::__release_weak(v23);
    }
  }
  if (*((_DWORD *)v106 + 17) == 1
    && *((double *)v106 + 24) > 0.0
    && CFAbsoluteTimeGetCurrent() - v82 > *((double *)v106 + 24))
  {
    if (qword_10229FEC0 != -1)
      dispatch_once(&qword_10229FEC0, &stru_102144B90);
    v26 = qword_10229FEC8;
    if (os_log_type_enabled((os_log_t)qword_10229FEC8, OS_LOG_TYPE_DEFAULT))
    {
      *(_WORD *)buf = 0;
      _os_log_impl((void *)&_mh_execute_header, v26, OS_LOG_TYPE_DEFAULT, "Will not attempt retrocompute pre-processing, availability has expired", buf, 2u);
    }
    if (sub_1001BFF7C(115, 2))
    {
      bzero(buf, 0x65CuLL);
      if (qword_10229FEC0 != -1)
        dispatch_once(&qword_10229FEC0, &stru_102144B90);
      LOWORD(v90) = 0;
      LODWORD(v74) = 2;
      _os_log_send_and_compose_impl(2, 0, buf, 1628, &_mh_execute_header, qword_10229FEC8, 0, "Will not attempt retrocompute pre-processing, availability has expired", &v90, v74);
      v71 = (uint8_t *)v70;
      sub_100512490("Generic", 1, 0, 2, "-[CLVO2MaxService executeRetrocomputePreprocessing:]", "%s\n", v70);
      if (v71 != buf)
        free(v71);
    }
    *((_DWORD *)v106 + 46) |= 0x80u;
  }
  if (-[objc_class isPaired](-[objc_class sharedInstance](off_1022A2D90(), "sharedInstance"), "isPaired"))
  {
    v27 = -[objc_class getPairedDevices](-[objc_class sharedInstance](off_1022A2D90(), "sharedInstance"), "getPairedDevices");
    v80 = 0u;
    v81 = 0u;
    v78 = 0u;
    v79 = 0u;
    v28 = objc_msgSend(v27, "countByEnumeratingWithState:objects:count:", &v78, v92, 16);
    if (v28)
    {
      v29 = *(_QWORD *)v79;
      while (2)
      {
        for (i = 0; i != v28; i = (char *)i + 1)
        {
          if (*(_QWORD *)v79 != v29)
            objc_enumerationMutation(v27);
          if ((objc_msgSend(*(id *)(*((_QWORD *)&v78 + 1) + 8 * (_QWORD)i), "supportsCapability:", objc_msgSend(objc_alloc((Class)NSUUID), "initWithUUIDString:", CFSTR("3C190EF7-40E9-47BF-9B87-3408FD90B9E6"))) & 1) == 0)
          {
            if (qword_10229FEC0 != -1)
              dispatch_once(&qword_10229FEC0, &stru_102144B90);
            v33 = qword_10229FEC8;
            if (os_log_type_enabled((os_log_t)qword_10229FEC8, OS_LOG_TYPE_DEFAULT))
            {
              *(_WORD *)buf = 0;
              _os_log_impl((void *)&_mh_execute_header, v33, OS_LOG_TYPE_DEFAULT, "Will not attempt retrocompute pre-processing, paired watch found with incompatible algorithm version", buf, 2u);
            }
            if (sub_1001BFF7C(115, 2))
            {
              bzero(buf, 0x65CuLL);
              if (qword_10229FEC0 != -1)
                dispatch_once(&qword_10229FEC0, &stru_102144B90);
              LOWORD(v90) = 0;
              LODWORD(v74) = 2;
              _os_log_send_and_compose_impl(2, 0, buf, 1628, &_mh_execute_header, qword_10229FEC8, 0, "Will not attempt retrocompute pre-processing, paired watch found with incompatible algorithm version", &v90, v74);
              v69 = (uint8_t *)v68;
              sub_100512490("Generic", 1, 0, 2, "-[CLVO2MaxService executeRetrocomputePreprocessing:]", "%s\n", v68);
              if (v69 != buf)
                free(v69);
              v32 = 1;
            }
            else
            {
              v32 = 1;
            }
            goto LABEL_83;
          }
        }
        v28 = objc_msgSend(v27, "countByEnumeratingWithState:objects:count:", &v78, v92, 16);
        if (v28)
          continue;
        break;
      }
    }
  }
  else
  {
    if (qword_10229FEC0 != -1)
      dispatch_once(&qword_10229FEC0, &stru_102144B90);
    v31 = qword_10229FEC8;
    if (os_log_type_enabled((os_log_t)qword_10229FEC8, OS_LOG_TYPE_DEFAULT))
    {
      *(_WORD *)buf = 0;
      _os_log_impl((void *)&_mh_execute_header, v31, OS_LOG_TYPE_DEFAULT, "Will not attempt retrocompute pre-processing, no paired watch found", buf, 2u);
    }
    if (sub_1001BFF7C(115, 2))
    {
      bzero(buf, 0x65CuLL);
      if (qword_10229FEC0 != -1)
        dispatch_once(&qword_10229FEC0, &stru_102144B90);
      LOWORD(v90) = 0;
      LODWORD(v74) = 2;
      _os_log_send_and_compose_impl(2, 0, buf, 1628, &_mh_execute_header, qword_10229FEC8, 0, "Will not attempt retrocompute pre-processing, no paired watch found", &v90, v74);
      v65 = (uint8_t *)v64;
      sub_100512490("Generic", 1, 0, 2, "-[CLVO2MaxService executeRetrocomputePreprocessing:]", "%s\n", v64);
      if (v65 != buf)
        free(v65);
      v32 = 2;
    }
    else
    {
      v32 = 2;
    }
LABEL_83:
    *((_DWORD *)v106 + 46) |= v32;
  }
  if (self->fUserInfo._isAgeSet)
  {
    if (!*((_DWORD *)v106 + 46))
    {
      if (v93)
      {
        self->fOriginalBodyMetrics.age = *((float *)&v96 + 1);
        self->fOriginalBodyMetrics.biologicalSex = v96;
        *(_QWORD *)&self->fOriginalBodyMetrics.heightM = v97;
        if (!-[CLVO2MaxService validateBodyMetrics](self, "validateBodyMetrics"))
        {
          if (qword_10229FEC0 != -1)
            dispatch_once(&qword_10229FEC0, &stru_102144B90);
          v34 = qword_10229FEC8;
          if (os_log_type_enabled((os_log_t)qword_10229FEC8, OS_LOG_TYPE_DEFAULT))
          {
            *(_WORD *)buf = 0;
            _os_log_impl((void *)&_mh_execute_header, v34, OS_LOG_TYPE_DEFAULT, "Will not attempt retrocompute pre-processing, body metrics changed significantly", buf, 2u);
          }
          if (sub_1001BFF7C(115, 2))
          {
            bzero(buf, 0x65CuLL);
            if (qword_10229FEC0 != -1)
              dispatch_once(&qword_10229FEC0, &stru_102144B90);
            LOWORD(v90) = 0;
            LODWORD(v74) = 2;
            _os_log_send_and_compose_impl(2, 0, buf, 1628, &_mh_execute_header, qword_10229FEC8, 0, "Will not attempt retrocompute pre-processing, body metrics changed significantly", &v90, v74);
            v73 = (uint8_t *)v72;
            sub_100512490("Generic", 1, 0, 2, "-[CLVO2MaxService executeRetrocomputePreprocessing:]", "%s\n", v72);
            if (v73 != buf)
              free(v73);
          }
          *((_DWORD *)v106 + 46) |= 0x200u;
          -[CLVO2MaxService updateRetrocomputeStatus:unavailableReasons:](self, "updateRetrocomputeStatus:unavailableReasons:", 0);
          -[CLVO2MaxService sendRetroComputeAnalytics](self, "sendRetroComputeAnalytics");
          sub_100423B14((uint64_t)self->fRetrocomputeBodyMetricsDb.__ptr_.__value_);
          goto LABEL_20;
        }
      }
      else
      {
        HIDWORD(v96) = LODWORD(self->fUserInfo.age);
        LODWORD(v96) = self->fUserInfo.biologicalSex;
        v97 = *(_QWORD *)&self->fUserInfo.heightM;
        sub_100423B04((uint64_t)self->fRetrocomputeBodyMetricsDb.__ptr_.__value_, (uint64_t)&v93);
        v37 = *(_OWORD *)&self->fUserInfo.vo2max;
        v36 = *(_OWORD *)&self->fUserInfo.hronset;
        v38 = *(_OWORD *)&self->fUserInfo.gender;
        *(_OWORD *)&self->fOriginalBodyMetrics.runVo2max = *(_OWORD *)&self->fUserInfo.runVo2max;
        *(_OWORD *)&self->fOriginalBodyMetrics.vo2max = v37;
        *(_OWORD *)&self->fOriginalBodyMetrics.hronset = v36;
        *(_OWORD *)&self->fOriginalBodyMetrics.gender = v38;
      }
      v39 = dispatch_group_create();
      *(_QWORD *)buf = 0;
      v99 = buf;
      v101 = sub_100577088;
      v102 = sub_1005770AC;
      v100 = 0x4812000000;
      v103 = &unk_102080316;
      memset(v104, 0, 24);
      v40 = CFAbsoluteTimeGetCurrent();
      v41 = *((double *)v106 + 13);
      v42 = objc_alloc((Class)NSDate);
      v43 = v40 + -63072000.0;
      if (v40 + -63072000.0 < v41 + 1.0)
        v43 = v41 + 1.0;
      v44 = objc_msgSend(v42, "initWithTimeIntervalSinceReferenceDate:", v43);
      v45 = +[HKQuery predicateForSamplesWithStartDate:endDate:options:](HKQuery, "predicateForSamplesWithStartDate:endDate:options:", v44, +[NSDate date](NSDate, "date"), 3);
      v46 = +[NSSortDescriptor sortDescriptorWithKey:ascending:](NSSortDescriptor, "sortDescriptorWithKey:ascending:", HKSampleSortIdentifierStartDate, 1);
      dispatch_group_enter(v39);
      v47 = objc_alloc((Class)HKSampleQuery);
      v48 = +[HKObjectType quantityTypeForIdentifier:](HKObjectType, "quantityTypeForIdentifier:", HKQuantityTypeIdentifierVO2Max);
      v91 = v46;
      v77[0] = _NSConcreteStackBlock;
      v77[1] = 3221225472;
      v77[2] = sub_1005770D4;
      v77[3] = &unk_102144AC0;
      v77[5] = &v84;
      v77[6] = buf;
      v77[4] = v39;
      v49 = objc_msgSend(v47, "initWithSampleType:predicate:limit:sortDescriptors:resultsHandler:", v48, v45, 0, +[NSArray arrayWithObjects:count:](NSArray, "arrayWithObjects:count:", &v91, 1), v77);
      -[HKHealthStore executeQuery:](self->fHkHealthStore, "executeQuery:", v49);

      v50 = objc_msgSend(objc_msgSend(-[CLVO2MaxService universe](self, "universe"), "silo"), "queue");
      block[0] = _NSConcreteStackBlock;
      block[1] = 3321888768;
      block[2] = sub_1005779D8;
      block[3] = &unk_102144AE8;
      block[4] = v39;
      block[10] = v88;
      v76 = v89;
      if (v89)
      {
        p_shared_owners = (unint64_t *)&v89->__shared_owners_;
        do
          v52 = __ldxr(p_shared_owners);
        while (__stxr(v52 + 1, p_shared_owners));
      }
      block[5] = a3;
      block[6] = self;
      block[7] = &v84;
      block[8] = buf;
      block[9] = &v105;
      dispatch_group_notify(v39, v50, block);
      v53 = v76;
      if (v76)
      {
        v54 = (unint64_t *)&v76->__shared_owners_;
        do
          v55 = __ldaxr(v54);
        while (__stlxr(v55 - 1, v54));
        if (!v55)
        {
          ((void (*)(std::__shared_weak_count *))v53->__on_zero_shared)(v53);
          std::__shared_weak_count::__release_weak(v53);
        }
      }
      _Block_object_dispose(buf, 8);
      v90 = (void **)v104;
      sub_1005805F4(&v90);
      goto LABEL_20;
    }
  }
  else
  {
    if (qword_10229FEC0 != -1)
      dispatch_once(&qword_10229FEC0, &stru_102144B90);
    v35 = qword_10229FEC8;
    if (os_log_type_enabled((os_log_t)qword_10229FEC8, OS_LOG_TYPE_DEFAULT))
    {
      *(_WORD *)buf = 0;
      _os_log_impl((void *)&_mh_execute_header, v35, OS_LOG_TYPE_DEFAULT, "Will not attempt retrocompute pre-processing, no age set", buf, 2u);
    }
    if (sub_1001BFF7C(115, 2))
    {
      bzero(buf, 0x65CuLL);
      if (qword_10229FEC0 != -1)
        dispatch_once(&qword_10229FEC0, &stru_102144B90);
      LOWORD(v90) = 0;
      LODWORD(v74) = 2;
      _os_log_send_and_compose_impl(2, 0, buf, 1628, &_mh_execute_header, qword_10229FEC8, 0, "Will not attempt retrocompute pre-processing, no age set", &v90, v74);
      v67 = (uint8_t *)v66;
      sub_100512490("Generic", 1, 0, 2, "-[CLVO2MaxService executeRetrocomputePreprocessing:]", "%s\n", v66);
      if (v67 != buf)
        free(v67);
    }
    *((_DWORD *)v106 + 46) |= 4u;
  }
  -[CLVO2MaxService updateRetrocomputeStatus:unavailableReasons:](self, "updateRetrocomputeStatus:unavailableReasons:", 0);
  -[CLVO2MaxService resetRetrocomputePreProcessingActivity:withDelay:](self, "resetRetrocomputePreProcessingActivity:withDelay:", a3, XPC_ACTIVITY_INTERVAL_1_DAY);
  -[CLVO2MaxService sendRetroComputeAnalytics](self, "sendRetroComputeAnalytics");
LABEL_20:
  _Block_object_dispose(&v84, 8);
  _Block_object_dispose(&v105, 8);
  v11 = v89;
  if (v89)
  {
    v12 = (unint64_t *)&v89->__shared_owners_;
    do
      v13 = __ldaxr(v12);
    while (__stlxr(v13 - 1, v12));
    if (!v13)
    {
      ((void (*)(std::__shared_weak_count *))v11->__on_zero_shared)(v11);
      std::__shared_weak_count::__release_weak(v11);
    }
  }
}

- (void)markXpcActivityDone:(id)a3
{
  NSObject *v4;
  uint64_t v5;
  const char *v6;
  uint8_t *v7;
  int v8;
  xpc_activity_state_t v9;
  uint8_t buf[4];
  xpc_activity_state_t state;

  if (!xpc_activity_set_state((xpc_activity_t)a3, 5))
  {
    if (qword_10229FEC0 != -1)
      dispatch_once(&qword_10229FEC0, &stru_102144B90);
    v4 = qword_10229FEC8;
    if (os_log_type_enabled((os_log_t)qword_10229FEC8, OS_LOG_TYPE_FAULT))
    {
      *(_DWORD *)buf = 134349056;
      state = xpc_activity_get_state((xpc_activity_t)a3);
      _os_log_impl((void *)&_mh_execute_header, v4, OS_LOG_TYPE_FAULT, "Failed to mark activity as done. Current state is %{public}ld", buf, 0xCu);
    }
    if (sub_1001BFF7C(115, 0))
    {
      bzero(buf, 0x65CuLL);
      if (qword_10229FEC0 != -1)
        dispatch_once(&qword_10229FEC0, &stru_102144B90);
      v5 = qword_10229FEC8;
      v8 = 134349056;
      v9 = xpc_activity_get_state((xpc_activity_t)a3);
      _os_log_send_and_compose_impl(2, 0, buf, 1628, &_mh_execute_header, v5, 17, "Failed to mark activity as done. Current state is %{public}ld", &v8, 12);
      v7 = (uint8_t *)v6;
      sub_100512490("Generic", 1, 0, 0, "-[CLVO2MaxService markXpcActivityDone:]", "%s\n", v6);
      if (v7 != buf)
        free(v7);
    }
  }
}

- (void)runAggregationForStagingTables
{
  sub_1011F6BDC((uint64_t)self->fStagingOutputStore.__ptr_.__value_);
}

- (BOOL)isEligibleForPreProcessing:(VO2MaxRetrocomputeHistory *)a3
{
  return (a3->var19 & 0x340) == 0 && (a3->var3 & 0xFFFFFFFE) != 2;
}

- (unsigned)retrocomputeForSamples:(const void *)a3 withRetrocomputeHistory:(VO2MaxRetrocomputeHistory *)a4
{
  uint64_t v6;
  unint64_t v7;
  uint64_t v8;
  double *v9;
  double *v10;
  unint64_t v11;
  __int128 v12;
  __int128 v13;
  __int128 v14;
  int v15;
  int v16;
  uint64_t v17;
  uint64_t v18;
  id v19;
  double var4;
  _BOOL4 v21;
  NSObject *v22;
  id v23;
  uint64_t v24;
  uint64_t v25;
  id v26;
  uint64_t v27;
  const char *v28;
  uint8_t *v29;
  uint64_t v30;
  __int128 v31;
  __int128 v32;
  unsigned int v33;
  NSObject *v34;
  uint64_t v35;
  id v36;
  NSObject *v37;
  id v38;
  uint64_t v39;
  id v40;
  const char *v41;
  uint8_t *v42;
  const char *v44;
  uint8_t *v45;
  uint64_t v46;
  double *v47;
  unsigned int v48;
  void *v50;
  double *v51;
  uint64_t v52;
  __int128 v53;
  _OWORD v54[2];
  std::string __p;
  int v56;
  id v57;
  __int16 v58;
  uint64_t v59;
  __int16 v60;
  _BOOL4 v61;
  __int128 v62;
  _BYTE v63[28];
  std::string v64;
  _OWORD v65[5];
  uint8_t buf[4];
  id v67;
  __int16 v68;
  uint64_t v69;
  __int16 v70;
  _BOOL4 v71;

  if (*(_QWORD *)a3 == *((_QWORD *)a3 + 1))
  {
    if (qword_10229FEC0 != -1)
      dispatch_once(&qword_10229FEC0, &stru_102144B90);
    v34 = qword_10229FEC8;
    if (os_log_type_enabled((os_log_t)qword_10229FEC8, OS_LOG_TYPE_DEFAULT))
    {
      *(_WORD *)buf = 0;
      _os_log_impl((void *)&_mh_execute_header, v34, OS_LOG_TYPE_DEFAULT, "There are no VO2Max HealthKit samples to retrocompute", buf, 2u);
    }
    if (sub_1001BFF7C(115, 2))
    {
      bzero(buf, 0x65CuLL);
      if (qword_10229FEC0 != -1)
        dispatch_once(&qword_10229FEC0, &stru_102144B90);
      LOWORD(v65[0]) = 0;
      _os_log_send_and_compose_impl(2, 0, buf, 1628, &_mh_execute_header, qword_10229FEC8, 0, "There are no VO2Max HealthKit samples to retrocompute", v65, 2);
      v45 = (uint8_t *)v44;
      sub_100512490("Generic", 1, 0, 2, "-[CLVO2MaxService retrocomputeForSamples:withRetrocomputeHistory:]", "%s\n", v44);
      if (v45 != buf)
        free(v45);
    }
    return 0;
  }
  else
  {
    v50 = 0;
    v51 = 0;
    v52 = 0;
    v6 = sub_101125448();
    sub_101125E14(v6, &v50);
    v7 = 126 - 2 * __clz(0xCCCCCCCCCCCCCCCDLL * (((char *)v51 - (_BYTE *)v50) >> 4));
    if (v51 == v50)
      v8 = 0;
    else
      v8 = v7;
    sub_100580A64((uint64_t)v50, v51, v8, 1);
    v10 = (double *)v50;
    v9 = v51;
    if (v50 == v51)
    {
      LODWORD(v11) = 0;
LABEL_44:
      if (0x8E38E38E38E38E39 * ((uint64_t)(*((_QWORD *)a3 + 1) - *(_QWORD *)a3) >> 3) > (int)v11)
      {
        v11 = (int)v11;
        v35 = 72 * (int)v11 + 24;
        do
        {
          v36 = objc_msgSend(objc_alloc((Class)NSUUID), "initWithUUIDBytes:", *(_QWORD *)a3 + v35);
          if (qword_10229FEC0 != -1)
            dispatch_once(&qword_10229FEC0, &stru_102144B90);
          v37 = qword_10229FEC8;
          if (os_log_type_enabled((os_log_t)qword_10229FEC8, OS_LOG_TYPE_DEFAULT))
          {
            v38 = objc_msgSend(v36, "UUIDString");
            *(_DWORD *)buf = 138477827;
            v67 = v38;
            _os_log_impl((void *)&_mh_execute_header, v37, OS_LOG_TYPE_DEFAULT, "Retrocompute encountered HealthKit sample with no SessionAttributes for sessionId %{private}@", buf, 0xCu);
          }
          if (sub_1001BFF7C(115, 2))
          {
            bzero(buf, 0x65CuLL);
            if (qword_10229FEC0 != -1)
              dispatch_once(&qword_10229FEC0, &stru_102144B90);
            v39 = qword_10229FEC8;
            v40 = objc_msgSend(v36, "UUIDString");
            LODWORD(v65[0]) = 138477827;
            *(_QWORD *)((char *)v65 + 4) = v40;
            LODWORD(v46) = 12;
            _os_log_send_and_compose_impl(2, 0, buf, 1628, &_mh_execute_header, v39, 0, "Retrocompute encountered HealthKit sample with no SessionAttributes for sessionId %{private}@", v65, v46);
            v42 = (uint8_t *)v41;
            sub_100512490("Generic", 1, 0, 2, "-[CLVO2MaxService retrocomputeForSamples:withRetrocomputeHistory:]", "%s\n", v41);
            if (v42 != buf)
              free(v42);
          }
          ++a4->var15;
          ++v11;
          v35 += 72;
        }
        while (0x8E38E38E38E38E39 * ((uint64_t)(*((_QWORD *)a3 + 1) - *(_QWORD *)a3) >> 3) > v11);
      }
      v33 = -[CLVO2MaxService updateRetrocomputeHistoryPostProcessing:](self, "updateRetrocomputeHistoryPostProcessing:", a4);
    }
    else
    {
      v11 = 0;
      v47 = v51;
      while (1)
      {
        v65[0] = *(_OWORD *)v10;
        v12 = *((_OWORD *)v10 + 1);
        v13 = *((_OWORD *)v10 + 2);
        v14 = *((_OWORD *)v10 + 4);
        v65[3] = *((_OWORD *)v10 + 3);
        v65[4] = v14;
        v65[1] = v12;
        v65[2] = v13;
        v62 = 0uLL;
        *(_QWORD *)v63 = 0xBFF0000000000000;
        *(_DWORD *)&v63[24] = 0;
        sub_1015A2E04(&v64, "");
        v15 = -[CLVO2MaxService getIndexInHealthKitSamples:forSessionAttributes:withStartIndex:](self, "getIndexInHealthKitSamples:forSessionAttributes:withStartIndex:", a3, v65, v11);
        v16 = v15;
        if ((v15 & 0x80000000) == 0)
        {
          v48 = v15;
          if ((int)v11 < v15)
          {
            v17 = 72 * (int)v11;
            v18 = v15 - (uint64_t)(int)v11;
            do
            {
              v19 = objc_msgSend(objc_alloc((Class)NSUUID), "initWithUUIDBytes:", *(_QWORD *)a3 + v17 + 24);
              var4 = a4->var4;
              v21 = var4 > 0.0 && *(double *)(*(_QWORD *)a3 + v17) > var4;
              if (qword_10229FEC0 != -1)
                dispatch_once(&qword_10229FEC0, &stru_102144B90);
              v22 = qword_10229FEC8;
              if (os_log_type_enabled((os_log_t)qword_10229FEC8, OS_LOG_TYPE_DEFAULT))
              {
                v23 = objc_msgSend(v19, "UUIDString");
                v24 = *(_QWORD *)(*(_QWORD *)a3 + v17);
                *(_DWORD *)buf = 138478339;
                v67 = v23;
                v68 = 2049;
                v69 = v24;
                v70 = 1026;
                v71 = v21;
                _os_log_impl((void *)&_mh_execute_header, v22, OS_LOG_TYPE_DEFAULT, "Retrocompute encountered HealthKit sample with no SessionAttributes for sessionId %{private}@, startTime:%{private}f, isLostEstimate:%{public}d", buf, 0x1Cu);
              }
              if (sub_1001BFF7C(115, 2))
              {
                bzero(buf, 0x65CuLL);
                if (qword_10229FEC0 != -1)
                  dispatch_once(&qword_10229FEC0, &stru_102144B90);
                v25 = qword_10229FEC8;
                v26 = objc_msgSend(v19, "UUIDString");
                v27 = *(_QWORD *)(*(_QWORD *)a3 + v17);
                v56 = 138478339;
                v57 = v26;
                v58 = 2049;
                v59 = v27;
                v60 = 1026;
                v61 = v21;
                LODWORD(v46) = 28;
                _os_log_send_and_compose_impl(2, 0, buf, 1628, &_mh_execute_header, v25, 0, "Retrocompute encountered HealthKit sample with no SessionAttributes for sessionId %{private}@, startTime:%{private}f, isLostEstimate:%{public}d", &v56, v46);
                v29 = (uint8_t *)v28;
                sub_100512490("Generic", 1, 0, 2, "-[CLVO2MaxService retrocomputeForSamples:withRetrocomputeHistory:]", "%s\n", v28);
                if (v29 != buf)
                  free(v29);
              }
              if (v21)
              {
                ++a4->var14;
                -[CLVO2MaxService persistLostEstimateToStagingTables:](self, "persistLostEstimateToStagingTables:", *(_QWORD *)a3 + v17);
              }
              v17 += 72;
              --v18;
            }
            while (v18);
            LODWORD(v11) = v16;
            v9 = v47;
          }
          v30 = *(_QWORD *)a3 + 72 * v48;
          v31 = *(_OWORD *)(v30 + 28);
          v32 = *(_OWORD *)(v30 + 16);
          v62 = *(_OWORD *)v30;
          *(_OWORD *)v63 = v32;
          *(_OWORD *)&v63[12] = v31;
          std::string::operator=(&v64, (const std::string *)(v30 + 48));
          v11 = (v11 + 1);
        }
        v53 = v62;
        v54[0] = *(_OWORD *)v63;
        *(_OWORD *)((char *)v54 + 12) = *(_OWORD *)&v63[12];
        if (SHIBYTE(v64.__r_.__value_.__r.__words[2]) < 0)
          sub_100115CE4(&__p, v64.__r_.__value_.__l.__data_, v64.__r_.__value_.__l.__size_);
        else
          __p = v64;
        v33 = -[CLVO2MaxService retrocomputeSession:withHealthKitSample:withRetrocomputeHistory:](self, "retrocomputeSession:withHealthKitSample:withRetrocomputeHistory:", v65, &v53, a4);
        if (SHIBYTE(__p.__r_.__value_.__r.__words[2]) < 0)
          operator delete(__p.__r_.__value_.__l.__data_);
        if (SHIBYTE(v64.__r_.__value_.__r.__words[2]) < 0)
          operator delete(v64.__r_.__value_.__l.__data_);
        if (v33)
          break;
        v10 += 10;
        if (v10 == v9)
          goto LABEL_44;
      }
    }
    if (v50)
    {
      v51 = (double *)v50;
      operator delete(v50);
    }
  }
  return v33;
}

- (int)getIndexInHealthKitSamples:(const void *)a3 forSessionAttributes:(const VO2MaxSessionAttributes *)a4 withStartIndex:(int)a5
{
  uint64_t v7;
  uint64_t v8;
  unsigned __int8 *var2;
  id v10;
  uint64_t v11;
  unint64_t v12;
  NSObject *v13;
  uint64_t v14;
  const char *v15;
  uint8_t *v16;
  NSObject *v17;
  uint64_t v19;
  const char *v20;
  uint8_t *v21;
  int v22;
  id v23;
  __int16 v24;
  int v25;
  __int16 v26;
  unint64_t v27;
  uint8_t buf[4];
  id v29;
  __int16 v30;
  int v31;
  __int16 v32;
  unint64_t v33;

  v7 = *((_QWORD *)a3 + 1);
  v8 = *(_QWORD *)a3 + 72 * a5;
  var2 = a4->var2;
  if (v8 != v7)
  {
    while (uuid_compare(var2, (const unsigned __int8 *)(v8 + 24)))
    {
      v8 += 72;
      if (v8 == v7)
      {
        v8 = v7;
        break;
      }
    }
  }
  v10 = objc_msgSend(objc_alloc((Class)NSUUID), "initWithUUIDBytes:", var2);
  if (v8 == *((_QWORD *)a3 + 1))
  {
    if (qword_10229FEC0 != -1)
      dispatch_once(&qword_10229FEC0, &stru_102144B90);
    v17 = qword_10229FEC8;
    if (os_log_type_enabled((os_log_t)qword_10229FEC8, OS_LOG_TYPE_DEBUG))
    {
      *(_DWORD *)buf = 138478083;
      v29 = objc_msgSend(v10, "UUIDString");
      v30 = 1026;
      v31 = a5;
      _os_log_impl((void *)&_mh_execute_header, v17, OS_LOG_TYPE_DEBUG, "CLVO2MaxService::getIndexInHealthKitSamples - index not found for sessionId: %{private}@, startIndex: %{public}d", buf, 0x12u);
    }
    if (sub_1001BFF7C(115, 2))
    {
      bzero(buf, 0x65CuLL);
      if (qword_10229FEC0 != -1)
        dispatch_once(&qword_10229FEC0, &stru_102144B90);
      v19 = qword_10229FEC8;
      v22 = 138478083;
      v23 = objc_msgSend(v10, "UUIDString");
      v24 = 1026;
      v25 = a5;
      _os_log_send_and_compose_impl(2, 0, buf, 1628, &_mh_execute_header, v19, 2, "CLVO2MaxService::getIndexInHealthKitSamples - index not found for sessionId: %{private}@, startIndex: %{public}d", &v22, 18);
      v21 = (uint8_t *)v20;
      sub_100512490("Generic", 1, 0, 2, "-[CLVO2MaxService getIndexInHealthKitSamples:forSessionAttributes:withStartIndex:]", "%s\n", v20);
      if (v21 != buf)
        free(v21);
    }
    LODWORD(v12) = -1;
  }
  else
  {
    v11 = (v8 - *(_QWORD *)a3) >> 3;
    if (qword_10229FEC0 != -1)
      dispatch_once(&qword_10229FEC0, &stru_102144B90);
    v12 = 0x8E38E38E38E38E39 * v11;
    v13 = qword_10229FEC8;
    if (os_log_type_enabled((os_log_t)qword_10229FEC8, OS_LOG_TYPE_DEBUG))
    {
      *(_DWORD *)buf = 138478339;
      v29 = objc_msgSend(v10, "UUIDString");
      v30 = 1026;
      v31 = a5;
      v32 = 2050;
      v33 = v12;
      _os_log_impl((void *)&_mh_execute_header, v13, OS_LOG_TYPE_DEBUG, "CLVO2MaxService::getIndexInHealthKitSamples - sessionId: %{private}@, startIndex: %{public}d, index: %{public}zu", buf, 0x1Cu);
    }
    if (sub_1001BFF7C(115, 2))
    {
      bzero(buf, 0x65CuLL);
      if (qword_10229FEC0 != -1)
        dispatch_once(&qword_10229FEC0, &stru_102144B90);
      v14 = qword_10229FEC8;
      v22 = 138478339;
      v23 = objc_msgSend(v10, "UUIDString");
      v24 = 1026;
      v25 = a5;
      v26 = 2050;
      v27 = v12;
      _os_log_send_and_compose_impl(2, 0, buf, 1628, &_mh_execute_header, v14, 2, "CLVO2MaxService::getIndexInHealthKitSamples - sessionId: %{private}@, startIndex: %{public}d, index: %{public}zu", &v22, 28);
      v16 = (uint8_t *)v15;
      sub_100512490("Generic", 1, 0, 2, "-[CLVO2MaxService getIndexInHealthKitSamples:forSessionAttributes:withStartIndex:]", "%s\n", v15);
      if (v16 != buf)
        free(v16);
    }
  }
  return v12;
}

- (unsigned)retrocomputeSession:(const VO2MaxSessionAttributes *)a3 withHealthKitSample:(VO2MaxHealthKitSample *)a4 withRetrocomputeHistory:
{
  uint64_t v4;
  uint64_t v5;
  __int128 v9;
  __int128 v10;
  NSObject *v11;
  unsigned int v12;
  double v13;
  uint64_t v14;
  NSObject *v15;
  const char *v16;
  char *v17;
  NSObject *v18;
  const char *v19;
  char *v20;
  char *v21;
  uint64_t v22;
  uint64_t v23;
  uint64_t v24;
  char *v25;
  __int128 v26;
  __int128 v27;
  __int128 v28;
  __int128 v29;
  __int128 v30;
  __int128 v31;
  __int128 v32;
  __int128 v33;
  __int128 v34;
  void *v35;
  char *v36;
  unint64_t v37;
  unint64_t v38;
  unint64_t v39;
  char *v40;
  char *v41;
  __int128 v42;
  __int128 v43;
  __int128 v44;
  __int128 v45;
  __int128 v46;
  __int128 v47;
  __int128 v48;
  __int128 v49;
  __int128 v50;
  char *v51;
  __int128 v52;
  __int128 v53;
  __int128 v54;
  __int128 v55;
  __int128 v56;
  __int128 v57;
  __int128 v58;
  __int128 v59;
  __int128 v60;
  char *v61;
  uint64_t v62;
  BOOL v63;
  NSObject *v64;
  uint64_t v65;
  float v66;
  NSObject *v67;
  const char *v69;
  char *v70;
  const char *v71;
  char *v72;
  const char *v73;
  char *v74;
  uint64_t v75;
  int v76[2];
  void *v77;
  char *v78;
  uint64_t v79;
  void *__p;
  void *__dst;
  unint64_t v82;
  void *v83;
  void *v84;
  _OWORD v85[2];
  void *v86;
  void *v87;
  uint64_t v88;
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
  _OWORD v99[2];
  __int128 v100;
  uint64_t v101;
  int v102;
  void *v103;
  char *v104;
  uint64_t v105;
  uuid_t uu;
  _BYTE dst[25];
  __int128 v108;
  _QWORD v109[19];
  __int128 v110;
  _OWORD v111[2];
  __int128 __src;
  uint64_t v113;
  int var7;
  __int128 buf;
  __int128 v116;
  __int128 v117;
  _BYTE v118[96];
  _BYTE v119[32];
  uint64_t v120;

  v5 = v4;
  if (-[CLVO2MaxService validateBodyMetrics](self, "validateBodyMetrics"))
  {
    *(_QWORD *)&dst[8] = 0;
    *(_QWORD *)dst = 0;
    *(double *)&dst[16] = a3->var1;
    dst[24] = a3->var6;
    v108 = 0u;
    memset(v109, 0, sizeof(v109));
    v9 = *(_OWORD *)&a4->var0;
    v10 = *(_OWORD *)&a4->var2;
    *(_OWORD *)((char *)v111 + 12) = *(_OWORD *)&a4->var3[4];
    v111[0] = v10;
    v110 = v9;
    if (*((char *)&a4->var5.__r_.__value_.var0.var1 + 23) < 0)
    {
      sub_100115CE4(&__src, a4->var5.__r_.__value_.var0.var1.__data_, a4->var5.__r_.__value_.var0.var1.__size_);
    }
    else
    {
      __src = *(_OWORD *)a4->var5.__r_.__value_.var0.var0.__data_;
      v113 = *((_QWORD *)&a4->var5.__r_.__value_.var0.var1 + 2);
    }
    var7 = a3->var7;
    uuid_copy(dst, a3->var2);
    memset(uu, 0, sizeof(uu));
    uuid_copy(uu, a3->var2);
    sub_1011F6B28((uint64_t)self->fStagingOutputStore.__ptr_.__value_, uu);
    sub_1011F6B18(self->fStagingOutputStore.__ptr_.__value_, uu);
    sub_1011F6E6C((uint64_t)self->fStagingOutputStore.__ptr_.__value_, uu);
    sub_101109468(uu, (uint64_t *)self->fInputStore.__ptr_, &v83);
    __p = 0;
    __dst = 0;
    v82 = 0;
    v13 = *(double *)&dst[16] + -18144000.0;
    if (*(double *)(v5 + 32) == 0.0)
    {
      v14 = sub_101125448();
      if (!sub_101125E70(v14, &__p))
      {
        if (qword_10229FEC0 != -1)
          dispatch_once(&qword_10229FEC0, &stru_102144B90);
        v15 = qword_10229FEC8;
        if (os_log_type_enabled((os_log_t)qword_10229FEC8, OS_LOG_TYPE_DEFAULT))
        {
          LOWORD(buf) = 0;
          _os_log_impl((void *)&_mh_execute_header, v15, OS_LOG_TYPE_DEFAULT, "Query for historical summaries failed due to device lock", (uint8_t *)&buf, 2u);
        }
        if (sub_1001BFF7C(115, 2))
        {
          bzero(&buf, 0x65CuLL);
          if (qword_10229FEC0 != -1)
            dispatch_once(&qword_10229FEC0, &stru_102144B90);
          LOWORD(v103) = 0;
          _os_log_send_and_compose_impl(2, 0, &buf, 1628, &_mh_execute_header, qword_10229FEC8, 0, "Query for historical summaries failed due to device lock", &v103, 2);
          v17 = (char *)v16;
          sub_100512490("Generic", 1, 0, 2, "-[CLVO2MaxService retrocomputeSession:withHealthKitSample:withRetrocomputeHistory:]", "%s\n", v16);
          if (v17 != (char *)&buf)
            free(v17);
        }
LABEL_71:
        v12 = 2;
LABEL_88:
        if (__p)
        {
          __dst = __p;
          operator delete(__p);
        }
        if (v83)
        {
          v84 = v83;
          operator delete(v83);
        }
        if (SHIBYTE(v113) < 0)
          operator delete((void *)__src);
        if ((_QWORD)v108)
        {
          *((_QWORD *)&v108 + 1) = v108;
          operator delete((void *)v108);
        }
        return v12;
      }
LABEL_65:
      v77 = 0;
      v78 = 0;
      v79 = 0;
      v65 = sub_101125448();
      if (sub_101125E38(v65, uu, &v77))
      {
        if (v83 != v84 && v77 != v78)
        {
          v66 = *((double *)v77 + 8);
          self->fUserInfo.hrmax = v66;
          self->fUserInfo.betaBlockerUse = a3->var6;
          *(_QWORD *)&buf = 0;
          v103 = 0;
          sub_100579F98();
        }
        v85[0] = *(_OWORD *)dst;
        *(_OWORD *)((char *)v85 + 9) = *(_OWORD *)&dst[9];
        v87 = 0;
        v88 = 0;
        v86 = 0;
        sub_10055CCF0(&v86, (const void *)v108, *((uint64_t *)&v108 + 1), 0xD37A6F4DE9BD37A7 * ((uint64_t)(*((_QWORD *)&v108 + 1) - v108) >> 3));
        v94 = *(_OWORD *)&v109[11];
        v95 = *(_OWORD *)&v109[13];
        v96 = *(_OWORD *)&v109[15];
        v97 = *(_OWORD *)&v109[17];
        v90 = *(_OWORD *)&v109[3];
        v91 = *(_OWORD *)&v109[5];
        v92 = *(_OWORD *)&v109[7];
        v93 = *(_OWORD *)&v109[9];
        v89 = *(_OWORD *)&v109[1];
        v98 = v110;
        v99[0] = v111[0];
        *(_OWORD *)((char *)v99 + 12) = *(_OWORD *)((char *)v111 + 12);
        if (SHIBYTE(v113) < 0)
        {
          sub_100115CE4(&v100, (void *)__src, *((unint64_t *)&__src + 1));
        }
        else
        {
          v100 = __src;
          v101 = v113;
        }
        v102 = var7;
        -[CLVO2MaxService updateRetrocomputeHistory:withResult:](self, "updateRetrocomputeHistory:withResult:", v5, v85);
        if (SHIBYTE(v101) < 0)
          operator delete((void *)v100);
        if (v86)
        {
          v87 = v86;
          operator delete(v86);
        }
        v12 = 0;
      }
      else
      {
        if (qword_10229FEC0 != -1)
          dispatch_once(&qword_10229FEC0, &stru_102144B90);
        v67 = qword_10229FEC8;
        if (os_log_type_enabled((os_log_t)qword_10229FEC8, OS_LOG_TYPE_DEFAULT))
        {
          LOWORD(buf) = 0;
          _os_log_impl((void *)&_mh_execute_header, v67, OS_LOG_TYPE_DEFAULT, "Query for pre-existing summaries for current session failed due to device lock", (uint8_t *)&buf, 2u);
        }
        if (sub_1001BFF7C(115, 2))
        {
          bzero(&buf, 0x65CuLL);
          if (qword_10229FEC0 != -1)
            dispatch_once(&qword_10229FEC0, &stru_102144B90);
          LOWORD(v103) = 0;
          LODWORD(v75) = 2;
          _os_log_send_and_compose_impl(2, 0, &buf, 1628, &_mh_execute_header, qword_10229FEC8, 0, "Query for pre-existing summaries for current session failed due to device lock", &v103, v75);
          v72 = (char *)v71;
          sub_100512490("Generic", 1, 0, 2, "-[CLVO2MaxService retrocomputeSession:withHealthKitSample:withRetrocomputeHistory:]", "%s\n", v71);
          if (v72 != (char *)&buf)
            free(v72);
        }
        v12 = 2;
      }
      if (v77)
      {
        v78 = (char *)v77;
        operator delete(v77);
      }
      goto LABEL_88;
    }
    v104 = 0;
    v103 = 0;
    v105 = 0;
    if (sub_1011F6B74((uint64_t)self->fStagingOutputStore.__ptr_.__value_, &v103) == 109)
    {
      if (qword_10229FEC0 != -1)
        dispatch_once(&qword_10229FEC0, &stru_102144B90);
      v18 = qword_10229FEC8;
      if (os_log_type_enabled((os_log_t)qword_10229FEC8, OS_LOG_TYPE_DEFAULT))
      {
        LOWORD(buf) = 0;
        _os_log_impl((void *)&_mh_execute_header, v18, OS_LOG_TYPE_DEFAULT, "Query for staged summaries failed due to device lock", (uint8_t *)&buf, 2u);
      }
      if (sub_1001BFF7C(115, 2))
      {
        bzero(&buf, 0x65CuLL);
        if (qword_10229FEC0 != -1)
          dispatch_once(&qword_10229FEC0, &stru_102144B90);
        LOWORD(v77) = 0;
        _os_log_send_and_compose_impl(2, 0, &buf, 1628, &_mh_execute_header, qword_10229FEC8, 0, "Query for staged summaries failed due to device lock", &v77, 2);
        v20 = (char *)v19;
        sub_100512490("Generic", 1, 0, 2, "-[CLVO2MaxService retrocomputeSession:withHealthKitSample:withRetrocomputeHistory:]", "%s\n", v19);
        if (v20 != (char *)&buf)
          free(v20);
      }
    }
    else
    {
      v21 = (char *)v103;
      if (v103 != v104)
      {
        do
        {
          *(_QWORD *)&buf = 0;
          v22 = *((_QWORD *)v21 + 1);
          *(_QWORD *)&v117 = 0;
          v116 = 0uLL;
          v23 = *((_QWORD *)v21 + 5);
          *((_QWORD *)&buf + 1) = v22;
          *((_QWORD *)&v117 + 1) = v23;
          *(_QWORD *)v118 = *((_QWORD *)v21 + 6);
          *(_OWORD *)&v118[8] = *(_OWORD *)(v21 + 56);
          *(_OWORD *)&v118[24] = *(_OWORD *)(v21 + 72);
          *(_OWORD *)&v118[40] = *(_OWORD *)(v21 + 88);
          *(_OWORD *)&v118[56] = *(_OWORD *)(v21 + 104);
          *(_OWORD *)&v118[72] = *(_OWORD *)(v21 + 120);
          *(_QWORD *)&v118[88] = *((_QWORD *)v21 + 17);
          *(_QWORD *)v119 = 0;
          *(_OWORD *)&v119[8] = *(_OWORD *)(v21 + 152);
          v24 = *((_QWORD *)v21 + 22);
          *(_QWORD *)&v119[24] = *((_QWORD *)v21 + 21);
          v120 = v24;
          uuid_copy((unsigned __int8 *)&v116 + 8, (const unsigned __int8 *)v21 + 24);
          v25 = (char *)__dst;
          if ((unint64_t)__dst >= v82)
          {
            v36 = (char *)__p;
            v37 = 0xD37A6F4DE9BD37A7 * (((_BYTE *)__dst - (_BYTE *)__p) >> 3);
            v38 = v37 + 1;
            if (v37 + 1 > 0x1642C8590B21642)
              sub_100259694();
            if (0xA6F4DE9BD37A6F4ELL * ((uint64_t)(v82 - (_QWORD)__p) >> 3) > v38)
              v38 = 0xA6F4DE9BD37A6F4ELL * ((uint64_t)(v82 - (_QWORD)__p) >> 3);
            if (0xD37A6F4DE9BD37A7 * ((uint64_t)(v82 - (_QWORD)__p) >> 3) >= 0xB21642C8590B21)
              v39 = 0x1642C8590B21642;
            else
              v39 = v38;
            if (v39)
            {
              v40 = (char *)sub_10055ADA8((uint64_t)&v82, v39);
              v36 = (char *)__p;
              v25 = (char *)__dst;
            }
            else
            {
              v40 = 0;
            }
            v41 = &v40[8 * (((_BYTE *)__dst - (_BYTE *)__p) >> 3)];
            v42 = buf;
            v43 = v116;
            v44 = *(_OWORD *)v118;
            *((_OWORD *)v41 + 2) = v117;
            *((_OWORD *)v41 + 3) = v44;
            *(_OWORD *)v41 = v42;
            *((_OWORD *)v41 + 1) = v43;
            v45 = *(_OWORD *)&v118[16];
            v46 = *(_OWORD *)&v118[32];
            v47 = *(_OWORD *)&v118[64];
            *((_OWORD *)v41 + 6) = *(_OWORD *)&v118[48];
            *((_OWORD *)v41 + 7) = v47;
            *((_OWORD *)v41 + 4) = v45;
            *((_OWORD *)v41 + 5) = v46;
            v48 = *(_OWORD *)&v118[80];
            v49 = *(_OWORD *)v119;
            v50 = *(_OWORD *)&v119[16];
            *((_QWORD *)v41 + 22) = v120;
            *((_OWORD *)v41 + 9) = v49;
            *((_OWORD *)v41 + 10) = v50;
            *((_OWORD *)v41 + 8) = v48;
            if (v25 == v36)
            {
              v61 = &v40[184 * v37];
            }
            else
            {
              v51 = &v40[184 * v37];
              do
              {
                v52 = *(_OWORD *)(v25 - 184);
                v53 = *(_OWORD *)(v25 - 168);
                v54 = *(_OWORD *)(v25 - 152);
                *(_OWORD *)(v51 - 136) = *(_OWORD *)(v25 - 136);
                *(_OWORD *)(v51 - 152) = v54;
                *(_OWORD *)(v51 - 168) = v53;
                *(_OWORD *)(v51 - 184) = v52;
                v55 = *(_OWORD *)(v25 - 120);
                v56 = *(_OWORD *)(v25 - 104);
                v57 = *(_OWORD *)(v25 - 88);
                *(_OWORD *)(v51 - 72) = *(_OWORD *)(v25 - 72);
                *(_OWORD *)(v51 - 88) = v57;
                *(_OWORD *)(v51 - 104) = v56;
                *(_OWORD *)(v51 - 120) = v55;
                v58 = *(_OWORD *)(v25 - 56);
                v59 = *(_OWORD *)(v25 - 40);
                v60 = *(_OWORD *)(v25 - 24);
                v61 = v51 - 184;
                *((_QWORD *)v51 - 1) = *((_QWORD *)v25 - 1);
                *(_OWORD *)(v51 - 24) = v60;
                *(_OWORD *)(v51 - 40) = v59;
                *(_OWORD *)(v51 - 56) = v58;
                v25 -= 184;
                v51 -= 184;
              }
              while (v25 != v36);
            }
            v35 = v41 + 184;
            __p = v61;
            __dst = v41 + 184;
            v82 = (unint64_t)&v40[184 * v39];
            if (v36)
              operator delete(v36);
          }
          else
          {
            v26 = buf;
            v27 = v116;
            v28 = *(_OWORD *)v118;
            *((_OWORD *)__dst + 2) = v117;
            *((_OWORD *)v25 + 3) = v28;
            *(_OWORD *)v25 = v26;
            *((_OWORD *)v25 + 1) = v27;
            v29 = *(_OWORD *)&v118[16];
            v30 = *(_OWORD *)&v118[32];
            v31 = *(_OWORD *)&v118[64];
            *((_OWORD *)v25 + 6) = *(_OWORD *)&v118[48];
            *((_OWORD *)v25 + 7) = v31;
            *((_OWORD *)v25 + 4) = v29;
            *((_OWORD *)v25 + 5) = v30;
            v32 = *(_OWORD *)&v118[80];
            v33 = *(_OWORD *)v119;
            v34 = *(_OWORD *)&v119[16];
            *((_QWORD *)v25 + 22) = v120;
            *((_OWORD *)v25 + 9) = v33;
            *((_OWORD *)v25 + 10) = v34;
            *((_OWORD *)v25 + 8) = v32;
            v35 = v25 + 184;
          }
          __dst = v35;
          v21 += 184;
        }
        while (v21 != v104);
      }
      if (v13 >= *(double *)(v5 + 32))
        goto LABEL_63;
      v77 = 0;
      v78 = 0;
      v79 = 0;
      v62 = sub_101125448();
      v63 = sub_101125E70(v62, &v77);
      if (v63)
      {
        sub_100581C30((uint64_t)&__p, (uint64_t)__dst, (char *)v77, v78, 0xD37A6F4DE9BD37A7 * ((v78 - (_BYTE *)v77) >> 3));
      }
      else
      {
        if (qword_10229FEC0 != -1)
          dispatch_once(&qword_10229FEC0, &stru_102144B90);
        v64 = qword_10229FEC8;
        if (os_log_type_enabled((os_log_t)qword_10229FEC8, OS_LOG_TYPE_DEFAULT))
        {
          LOWORD(buf) = 0;
          _os_log_impl((void *)&_mh_execute_header, v64, OS_LOG_TYPE_DEFAULT, "Query for historical summaries failed due to device lock", (uint8_t *)&buf, 2u);
        }
        if (sub_1001BFF7C(115, 2))
        {
          bzero(&buf, 0x65CuLL);
          if (qword_10229FEC0 != -1)
            dispatch_once(&qword_10229FEC0, &stru_102144B90);
          LOWORD(v76[0]) = 0;
          _os_log_send_and_compose_impl(2, 0, &buf, 1628, &_mh_execute_header, qword_10229FEC8, 0, "Query for historical summaries failed due to device lock", v76, 2);
          v74 = (char *)v73;
          sub_100512490("Generic", 1, 0, 2, "-[CLVO2MaxService retrocomputeSession:withHealthKitSample:withRetrocomputeHistory:]", "%s\n", v73);
          if (v74 != (char *)&buf)
            free(v74);
        }
      }
      if (v77)
      {
        v78 = (char *)v77;
        operator delete(v77);
      }
      if (v63)
      {
LABEL_63:
        if (v103)
        {
          v104 = (char *)v103;
          operator delete(v103);
        }
        goto LABEL_65;
      }
    }
    if (v103)
    {
      v104 = (char *)v103;
      operator delete(v103);
    }
    goto LABEL_71;
  }
  if (qword_10229FEC0 != -1)
    dispatch_once(&qword_10229FEC0, &stru_102144B90);
  v11 = qword_10229FEC8;
  if (os_log_type_enabled((os_log_t)qword_10229FEC8, OS_LOG_TYPE_DEFAULT))
  {
    LOWORD(buf) = 0;
    _os_log_impl((void *)&_mh_execute_header, v11, OS_LOG_TYPE_DEFAULT, "Will not attempt retrocompute pre-processing, body metrics changed significantly.", (uint8_t *)&buf, 2u);
  }
  if (sub_1001BFF7C(115, 2))
  {
    bzero(&buf, 0x65CuLL);
    if (qword_10229FEC0 != -1)
      dispatch_once(&qword_10229FEC0, &stru_102144B90);
    *(_WORD *)dst = 0;
    _os_log_send_and_compose_impl(2, 0, &buf, 1628, &_mh_execute_header, qword_10229FEC8, 0, "Will not attempt retrocompute pre-processing, body metrics changed significantly.", dst, 2);
    v70 = (char *)v69;
    sub_100512490("Generic", 1, 0, 2, "-[CLVO2MaxService retrocomputeSession:withHealthKitSample:withRetrocomputeHistory:]", "%s\n", v69);
    if (v70 != (char *)&buf)
      free(v70);
  }
  *(_DWORD *)(v5 + 136) |= 0x200u;
  -[CLVO2MaxService updateRetrocomputeStatus:unavailableReasons:](self, "updateRetrocomputeStatus:unavailableReasons:", 0);
  -[CLVO2MaxService sendRetroComputeAnalytics](self, "sendRetroComputeAnalytics");
  sub_100423B14((uint64_t)self->fRetrocomputeBodyMetricsDb.__ptr_.__value_);
  return 4;
}

- (void)persistRetrocomputeResultsToStagingTables:(VO2MaxRetrocomputeSessionResult *)a3
{
  VO2MaxSummary *var0;
  VO2MaxSummary *var1;
  char *v7;
  VO2MaxSummary *v8;
  __int128 v9;
  unsigned int v10;
  _QWORD v11[2];
  uint64_t v12;
  _QWORD v13[2];
  int64_t var4;
  _OWORD v15[8];
  uint64_t v16;
  double var2;

  var0 = a3->var3.var0;
  var1 = a3->var3.var1;
  if (var0 != var1)
  {
    v7 = (char *)var0 + 88;
    do
    {
      v11[0] = 0;
      v12 = 0;
      var4 = 0x7FEFFFFFFFFFFFFFLL;
      memset(v15, 0, sizeof(v15));
      LODWORD(v16) = 1;
      v11[1] = *((_QWORD *)v7 - 10);
      uuid_copy((unsigned __int8 *)v13, (const unsigned __int8 *)v7 - 64);
      v12 = *((_QWORD *)v7 - 9);
      var4 = *((_QWORD *)v7 - 6);
      *(_QWORD *)&v15[0] = *((_QWORD *)v7 - 5);
      *(_OWORD *)((char *)v15 + 8) = *((_OWORD *)v7 - 2);
      *(_OWORD *)((char *)&v15[1] + 8) = *((_OWORD *)v7 - 1);
      *(_OWORD *)((char *)&v15[2] + 8) = *(_OWORD *)v7;
      *(_OWORD *)((char *)&v15[3] + 8) = *((_OWORD *)v7 + 1);
      *(_OWORD *)((char *)&v15[4] + 8) = *((_OWORD *)v7 + 2);
      *(_OWORD *)((char *)&v15[5] + 8) = *((_OWORD *)v7 + 3);
      *(_OWORD *)((char *)&v15[6] + 8) = *((_OWORD *)v7 + 4);
      *((_QWORD *)&v15[7] + 1) = *((_QWORD *)v7 + 10);
      v16 = *((_QWORD *)v7 + 11);
      sub_1011F6B1C((uint64_t)self->fStagingOutputStore.__ptr_.__value_, (uint64_t)v11);
      v8 = (VO2MaxSummary *)(v7 + 96);
      v7 += 184;
    }
    while (v8 != var1);
  }
  if (a3->var4.var2 > 0.0)
  {
    v13[0] = 0;
    memset((char *)&v15[4] + 8, 0, 24);
    *(_QWORD *)&v15[6] = 3;
    BYTE8(v15[6]) = 0;
    sub_1015A2E04(&v15[7], "");
    var2 = -1.0;
    v13[0] = *(_QWORD *)&a3->var4.var2;
    uuid_copy((unsigned __int8 *)&v15[1] + 8, a3->var4.var8);
    v13[1] = *(_QWORD *)&a3->var4.var3;
    var4 = a3->var4.var4;
    v15[0] = *(_OWORD *)&a3->var4.var5;
    *(double *)&v15[1] = a3->var4.var7;
    *(_OWORD *)((char *)&v15[2] + 8) = *(_OWORD *)&a3->var4.var9;
    DWORD2(v15[3]) = a3->var4.var11;
    WORD6(v15[3]) = *(_WORD *)&a3->var4.var12;
    LODWORD(v15[4]) = a3->var4.var14;
    v9 = *(_OWORD *)&a3->var4.var15;
    v10 = a3->var5.var4 + 1;
    LODWORD(v15[6]) = 3;
    DWORD1(v15[6]) = v10;
    BYTE8(v15[6]) = a3->var2;
    *(_OWORD *)((char *)&v15[4] + 8) = v9;
    std::string::operator=((std::string *)&v15[7], (const std::string *)&a3->var5.var5);
    var2 = a3->var5.var2;
    sub_1011F6B10(self->fStagingOutputStore.__ptr_.__value_, (uint64_t)v11);
    if (SHIBYTE(v16) < 0)
      operator delete(*(void **)&v15[7]);
  }
}

- (void)persistLostEstimateToStagingTables:(const void *)a3
{
  _QWORD v4[2];
  unsigned __int8 v5[16];

  v4[0] = 0;
  v4[1] = *(_QWORD *)a3;
  uuid_copy(v5, (const unsigned __int8 *)a3 + 24);
  sub_1011F6E60((uint64_t)self->fStagingOutputStore.__ptr_.__value_, (uint64_t)v4);
}

- (void)updateRetrocomputeHistory:(VO2MaxRetrocomputeHistory *)a3 withResult:(VO2MaxRetrocomputeSessionResult *)a4
{
  double var1;
  unsigned __int8 *var9;
  double var2;
  double v10;
  unsigned int var12;
  double v12;
  double v13;
  VO2MaxSummary *var0;
  NSObject *v15;
  CLVO2MaxService *v16;
  double v17;
  int v18;
  int var3;
  double var8;
  id v21;
  double var4;
  double var6;
  double var7;
  double var10;
  double var11;
  unsigned int v27;
  unsigned int var13;
  unsigned int var14;
  uint64_t v30;
  double v31;
  int v32;
  int v33;
  double v34;
  id v35;
  double v36;
  double v37;
  double v38;
  double v39;
  double v40;
  unsigned int v41;
  unsigned int v42;
  unsigned int v43;
  const char *v44;
  uint8_t *v45;
  id v46;
  int v47;
  double v48;
  __int16 v49;
  int v50;
  __int16 v51;
  int v52;
  __int16 v53;
  double v54;
  __int16 v55;
  id v56;
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
  unsigned int v68;
  __int16 v69;
  unsigned int v70;
  __int16 v71;
  unsigned int v72;
  uint8_t buf[4];
  double v74;
  __int16 v75;
  int v76;
  __int16 v77;
  int v78;
  __int16 v79;
  double v80;
  __int16 v81;
  id v82;
  __int16 v83;
  double v84;
  __int16 v85;
  double v86;
  __int16 v87;
  double v88;
  __int16 v89;
  double v90;
  __int16 v91;
  double v92;
  __int16 v93;
  unsigned int v94;
  __int16 v95;
  unsigned int v96;
  __int16 v97;
  unsigned int v98;

  var1 = a4->var1;
  a3->var8 = var1;
  var9 = a3->var9;
  uuid_copy(a3->var9, a4->var0);
  if (a4->var4.var2 <= 0.0)
  {
    if (a3->var4 > 0.0 && a4->var5.var2 > -1.0)
    {
      ++a3->var14;
      -[CLVO2MaxService persistLostEstimateToStagingTables:](self, "persistLostEstimateToStagingTables:", &a4->var5);
    }
  }
  else
  {
    if (a4->var5.var5.__r_.var0 <= 2)
    {
      if (a3->var4 == 0.0)
        a3->var4 = var1;
      a3->var7 = var1;
    }
    a3->var6 = var1;
    var2 = a4->var5.var2;
    if (var2 == -1.0)
    {
      ++a3->var13;
    }
    else
    {
      v10 = a4->var4.var3 - var2;
      var12 = a3->var12;
      v12 = v10 + a3->var10 * (double)var12;
      v13 = v10 / var2 + a3->var11 * (double)var12++;
      a3->var12 = var12;
      a3->var10 = v12 / (double)var12;
      a3->var11 = v13 / (double)var12;
    }
  }
  if (a3->var5 == 0.0)
  {
    var0 = a4->var3.var0;
    if (var0 != a4->var3.var1)
      a3->var5 = *((double *)var0 + 1);
  }
  v46 = objc_msgSend(objc_alloc((Class)NSUUID), "initWithUUIDBytes:", var9);
  if (qword_10229FEC0 != -1)
    dispatch_once(&qword_10229FEC0, &stru_102144B90);
  v15 = qword_10229FEC8;
  if (os_log_type_enabled((os_log_t)qword_10229FEC8, OS_LOG_TYPE_DEFAULT))
  {
    v16 = self;
    v17 = a3->var1;
    v18 = a3->var2;
    var3 = a3->var3;
    var8 = a3->var8;
    v21 = objc_msgSend(v46, "UUIDString");
    var4 = a3->var4;
    var6 = a3->var6;
    var7 = a3->var7;
    var10 = a3->var10;
    var11 = a3->var11;
    v27 = a3->var12;
    var13 = a3->var13;
    var14 = a3->var14;
    *(_DWORD *)buf = 134286595;
    v74 = v17;
    self = v16;
    v75 = 1025;
    v76 = v18;
    v77 = 1025;
    v78 = var3;
    v79 = 2049;
    v80 = var8;
    v81 = 2113;
    v82 = v21;
    v83 = 2049;
    v84 = var4;
    v85 = 2049;
    v86 = var6;
    v87 = 2049;
    v88 = var7;
    v89 = 2049;
    v90 = var10;
    v91 = 2049;
    v92 = var11;
    v93 = 1025;
    v94 = v27;
    v95 = 1025;
    v96 = var13;
    v97 = 1025;
    v98 = var14;
    _os_log_impl((void *)&_mh_execute_header, v15, OS_LOG_TYPE_DEFAULT, "Updating VO2MaxRetrocomputeHistory: startTime,%{private}f,algVersion,%{private}d,status,%{private}d,lastSessionTimestamp,%{private}f,lastSessionId,%{private}@,firstSampleDate,%{private}f,lastSampleDate,%{private}f,lastSampleDatePrevAlg,%{private}f,meanDelta,%{private}f,meanPercentileDelta,%{private}f,numUpdatedEstimates,%{private}d,numNewEstimates,%{private}d,numLostEstimates,%{private}d", buf, 0x70u);
  }
  if (sub_1001BFF7C(115, 2))
  {
    bzero(buf, 0x65CuLL);
    if (qword_10229FEC0 != -1)
      dispatch_once(&qword_10229FEC0, &stru_102144B90);
    v30 = qword_10229FEC8;
    v31 = a3->var1;
    v32 = a3->var2;
    v33 = a3->var3;
    v34 = a3->var8;
    v35 = objc_msgSend(v46, "UUIDString");
    v36 = a3->var4;
    v37 = a3->var6;
    v38 = a3->var7;
    v39 = a3->var10;
    v40 = a3->var11;
    v41 = a3->var12;
    v42 = a3->var13;
    v43 = a3->var14;
    v47 = 134286595;
    v48 = v31;
    v49 = 1025;
    v50 = v32;
    v51 = 1025;
    v52 = v33;
    v53 = 2049;
    v54 = v34;
    v55 = 2113;
    v56 = v35;
    v57 = 2049;
    v58 = v36;
    v59 = 2049;
    v60 = v37;
    v61 = 2049;
    v62 = v38;
    v63 = 2049;
    v64 = v39;
    v65 = 2049;
    v66 = v40;
    v67 = 1025;
    v68 = v41;
    v69 = 1025;
    v70 = v42;
    v71 = 1025;
    v72 = v43;
    _os_log_send_and_compose_impl(2, 0, buf, 1628, &_mh_execute_header, v30, 0, "Updating VO2MaxRetrocomputeHistory: startTime,%{private}f,algVersion,%{private}d,status,%{private}d,lastSessionTimestamp,%{private}f,lastSessionId,%{private}@,firstSampleDate,%{private}f,lastSampleDate,%{private}f,lastSampleDatePrevAlg,%{private}f,meanDelta,%{private}f,meanPercentileDelta,%{private}f,numUpdatedEstimates,%{private}d,numNewEstimates,%{private}d,numLostEstimates,%{private}d", &v47, 112);
    v45 = (uint8_t *)v44;
    sub_100512490("Generic", 1, 0, 2, "-[CLVO2MaxService updateRetrocomputeHistory:withResult:]", "%s\n", v44);
    if (v45 != buf)
      free(v45);
  }
  sub_100804C78((uint64_t)self->fRetrocomputeDb.__ptr_.__value_, (uint64_t)a3, a3->var0);
}

- (unsigned)updateRetrocomputeHistoryPostProcessing:(VO2MaxRetrocomputeHistory *)a3
{
  uint64_t v5;
  uint64_t v6;
  int v7;
  int v8;
  double v9;
  double v10;
  double v11;
  double v12;
  __int128 v13;
  __int128 v14;
  __int128 v15;
  __int128 v16;
  __int128 v17;
  __int128 v18;
  uint64_t v19;
  __int128 v20;
  double v21;
  double v22;
  double v23;
  double v24;
  int v25;
  double v26;
  double v27;
  double *v28;
  double *v29;
  double *v30;
  uint64_t v31;
  unint64_t v32;
  uint64_t v33;
  unint64_t v34;
  char *v35;
  double *v36;
  uint64_t v37;
  double v38;
  double v39;
  double v40;
  double v41;
  NSObject *v42;
  unsigned int v43;
  NSObject *v44;
  uint64_t v45;
  std::__shared_weak_count *v46;
  unint64_t *v47;
  unint64_t v48;
  double v49;
  int v50;
  uint64_t v51;
  std::__shared_weak_count *v52;
  unint64_t *v53;
  unint64_t v54;
  double v55;
  uint64_t v56;
  std::__shared_weak_count *v57;
  unint64_t *v58;
  unint64_t v59;
  uint64_t v60;
  uint64_t v61;
  NSObject *v62;
  double var10;
  int var3;
  char v65;
  const char *v67;
  char *v68;
  const char *v69;
  char *v70;
  double v71;
  int v72;
  const char *v73;
  char *v74;
  double v75;
  double v76;
  double v77;
  double v78;
  double v79;
  void *__p;
  double *v81;
  double *v82;
  uint64_t v83;
  uint64_t v84;
  uint64_t v85;
  uint64_t v86;
  uint64_t v87;
  uint64_t v88;
  int v89;
  double v90;
  __int16 v91;
  double v92;
  __int16 v93;
  double v94;
  __int16 v95;
  double v96;
  __int16 v97;
  double v98;
  __int16 v99;
  double v100;
  __int16 v101;
  _BOOL4 v102;
  __int16 v103;
  int v104;
  __int16 v105;
  int v106;
  __int16 v107;
  int v108;
  _BYTE buf[32];
  _BYTE v110[32];
  __int128 v111;
  __int128 v112;
  __int128 v113;
  __int128 v114;
  __int128 v115;
  uint64_t v116;
  char v117;
  __int128 v118;
  uint64_t v119;
  double v120;

  v86 = 0;
  v87 = 0;
  v88 = 0;
  if (sub_1011F6B80((uint64_t)self->fStagingOutputStore.__ptr_.__value_, &v86) == 100)
  {
    v83 = 0;
    v84 = 0;
    v85 = 0;
    if (sub_1011F6BD8(self->fStagingOutputStore.__ptr_.__value_, &v83) == 100)
    {
      __p = 0;
      v81 = 0;
      v82 = 0;
      v5 = v86;
      v6 = v87;
      if (v86 == v87)
      {
        a3->var17 = 0.0;
        v41 = 0.0;
        v40 = 0.0;
      }
      else
      {
        v7 = 0;
        v8 = 0;
        v9 = 0.0;
        v10 = 0.0;
        v75 = 0.0;
        v76 = 0.0;
        v11 = 0.0;
        v12 = 0.0;
        do
        {
          *(_OWORD *)buf = *(_OWORD *)v5;
          v13 = *(_OWORD *)(v5 + 16);
          v14 = *(_OWORD *)(v5 + 32);
          v15 = *(_OWORD *)(v5 + 64);
          *(_OWORD *)&v110[16] = *(_OWORD *)(v5 + 48);
          v111 = v15;
          *(_OWORD *)&buf[16] = v13;
          *(_OWORD *)v110 = v14;
          v16 = *(_OWORD *)(v5 + 80);
          v17 = *(_OWORD *)(v5 + 96);
          v18 = *(_OWORD *)(v5 + 128);
          v114 = *(_OWORD *)(v5 + 112);
          v115 = v18;
          v112 = v16;
          v113 = v17;
          v19 = *(_QWORD *)(v5 + 144);
          v117 = *(_BYTE *)(v5 + 152);
          v116 = v19;
          if (*(char *)(v5 + 183) < 0)
          {
            sub_100115CE4(&v118, *(void **)(v5 + 160), *(_QWORD *)(v5 + 168));
          }
          else
          {
            v20 = *(_OWORD *)(v5 + 160);
            v119 = *(_QWORD *)(v5 + 176);
            v118 = v20;
          }
          v21 = *(double *)(v5 + 184);
          v120 = v21;
          if (v21 <= 0.0)
          {
            v26 = v12;
            v22 = v11;
            v23 = v10;
            v24 = v9;
          }
          else
          {
            v22 = 0.0;
            v23 = 0.0;
            v24 = v21;
            if (v8)
            {
              v24 = v9 + (v21 - v9) / (double)(v8 + 1);
              v23 = v10 + (v21 - v9) * (v21 - v24);
              v76 = v23;
            }
            v25 = v7 + 1;
            v26 = *(double *)v110;
            if (v7)
            {
              v26 = v12 + (*(double *)v110 - v12) / (double)v25;
              v22 = v11 + (*(double *)v110 - v12) * (*(double *)v110 - v26);
              v75 = v22;
            }
            v27 = *(double *)v110 - v21;
            v28 = v81;
            if (v81 >= v82)
            {
              v30 = (double *)__p;
              v31 = ((char *)v81 - (_BYTE *)__p) >> 3;
              v32 = v31 + 1;
              if ((unint64_t)(v31 + 1) >> 61)
                sub_100259694();
              v33 = (char *)v82 - (_BYTE *)__p;
              if (((char *)v82 - (_BYTE *)__p) >> 2 > v32)
                v32 = v33 >> 2;
              if ((unint64_t)v33 >= 0x7FFFFFFFFFFFFFF8)
                v34 = 0x1FFFFFFFFFFFFFFFLL;
              else
                v34 = v32;
              if (v34)
              {
                v35 = (char *)sub_10025E6A0((uint64_t)&v82, v34);
                v30 = (double *)__p;
                v28 = v81;
              }
              else
              {
                v35 = 0;
              }
              v36 = (double *)&v35[8 * v31];
              *v36 = v27;
              v29 = v36 + 1;
              while (v28 != v30)
              {
                v37 = *((_QWORD *)v28-- - 1);
                *((_QWORD *)v36-- - 1) = v37;
              }
              __p = v36;
              v81 = v29;
              v82 = (double *)&v35[8 * v34];
              if (v30)
                operator delete(v30);
            }
            else
            {
              *v81 = v27;
              v29 = v28 + 1;
            }
            v81 = v29;
            ++v8;
            v7 = v25;
          }
          if (SHIBYTE(v119) < 0)
            operator delete((void *)v118);
          v5 += 192;
          v9 = v24;
          v10 = v23;
          v11 = v22;
          v12 = v26;
        }
        while (v5 != v6);
        v38 = 0.0;
        v39 = 0.0;
        if (__p != v81)
          v39 = sub_1011A2EC8((uint64_t)&__p, 90);
        a3->var17 = v39;
        if (v7 >= 2)
          v38 = v75 / (double)(v7 - 1);
        v40 = 0.0;
        v41 = sqrt(v38);
        if (v8 >= 2)
          v40 = v76 / (double)(v8 - 1);
      }
      a3->var18 = v41 - sqrt(v40);
      v79 = 15552000.0;
      v45 = sub_100127B9C();
      sub_100081C10(v45, buf);
      sub_1001FD98C(*(uint64_t *)buf, "VO2MaxRetrocomputeMinPrevAlgSampleInterval", &v79);
      v46 = *(std::__shared_weak_count **)&buf[8];
      if (*(_QWORD *)&buf[8])
      {
        v47 = (unint64_t *)(*(_QWORD *)&buf[8] + 8);
        do
          v48 = __ldaxr(v47);
        while (__stlxr(v48 - 1, v47));
        if (!v48)
        {
          ((void (*)(std::__shared_weak_count *))v46->__on_zero_shared)(v46);
          std::__shared_weak_count::__release_weak(v46);
        }
      }
      v49 = a3->var7 - a3->var4;
      if (v49 >= v79 || self->fShouldBypassPreviousSampleInternal)
      {
        v50 = 0;
      }
      else
      {
        a3->var19 |= 8u;
        v50 = 1;
      }
      v78 = 0.9;
      v51 = sub_100127B9C();
      sub_100081C10(v51, buf);
      sub_1001FD98C(*(uint64_t *)buf, "VO2MaxRetrocomputeMinEstimatesUpdatedRatio", &v78);
      v52 = *(std::__shared_weak_count **)&buf[8];
      if (*(_QWORD *)&buf[8])
      {
        v53 = (unint64_t *)(*(_QWORD *)&buf[8] + 8);
        do
          v54 = __ldaxr(v53);
        while (__stlxr(v54 - 1, v53));
        if (!v54)
        {
          ((void (*)(std::__shared_weak_count *))v52->__on_zero_shared)(v52);
          std::__shared_weak_count::__release_weak(v52);
        }
      }
      v55 = (double)a3->var12 / (double)(a3->var14 + a3->var12 + a3->var15);
      if (!a3->var3 && v55 < v78 && !self->fShouldBypassMinEstimatesUpdatedRatio)
      {
        a3->var19 |= 0x10u;
        v50 = 1;
      }
      v77 = 1.0;
      v56 = sub_100127B9C();
      sub_100081C10(v56, buf);
      sub_1001FD98C(*(uint64_t *)buf, "VO2MaxRetrocomputeMinMeanDelta", &v77);
      v57 = *(std::__shared_weak_count **)&buf[8];
      if (*(_QWORD *)&buf[8])
      {
        v58 = (unint64_t *)(*(_QWORD *)&buf[8] + 8);
        do
          v59 = __ldaxr(v58);
        while (__stlxr(v59 - 1, v58));
        if (!v59)
        {
          ((void (*)(std::__shared_weak_count *))v57->__on_zero_shared)(v57);
          std::__shared_weak_count::__release_weak(v57);
        }
      }
      if (!a3->var3 && fabs(a3->var10) < v77 && !self->fShouldBypassMinDelta)
      {
        a3->var19 |= 0x20u;
        v50 = 1;
      }
      v60 = v83;
      v61 = v84;
      if (v83 != v84)
      {
        a3->var19 |= 0x40u;
        v50 = 1;
      }
      if (qword_10229FEC0 != -1)
        dispatch_once(&qword_10229FEC0, &stru_102144B90);
      v62 = qword_10229FEC8;
      if (os_log_type_enabled((os_log_t)qword_10229FEC8, OS_LOG_TYPE_DEFAULT))
      {
        var10 = a3->var10;
        var3 = a3->var3;
        *(_DWORD *)buf = 134285825;
        *(double *)&buf[4] = v49;
        *(_WORD *)&buf[12] = 2049;
        *(double *)&buf[14] = v79;
        *(_WORD *)&buf[22] = 2049;
        *(double *)&buf[24] = v55;
        *(_WORD *)v110 = 2049;
        *(double *)&v110[2] = v78;
        *(_WORD *)&v110[10] = 2049;
        *(double *)&v110[12] = var10;
        *(_WORD *)&v110[20] = 2049;
        *(double *)&v110[22] = v77;
        *(_WORD *)&v110[30] = 1026;
        LODWORD(v111) = v60 != v61;
        WORD2(v111) = 1025;
        *(_DWORD *)((char *)&v111 + 6) = v50;
        WORD5(v111) = 1026;
        HIDWORD(v111) = var3;
        LOWORD(v112) = 1026;
        *(_DWORD *)((char *)&v112 + 2) = v50 ^ 1;
        _os_log_impl((void *)&_mh_execute_header, v62, OS_LOG_TYPE_DEFAULT, "VO2MaxRetrocomputeHistory data checks: prevAlgSampleInterval,%{private}f,minPrevAlgSampleInterval,%{private}f,estimatesUpdatedRatio,%{private}f,minEstimatesUpdatedRatio,%{private}f,meanDelta,%{private}f,minMeanDelta,%{private}f,badStagingDataExists,%{public}d,failedDataCheck,%{private}d,oldRetrocomputeStatus,%{public}d,newRetrocomputeStatus,%{public}d", buf, 0x56u);
      }
      if (sub_1001BFF7C(115, 2))
      {
        bzero(buf, 0x65CuLL);
        if (qword_10229FEC0 != -1)
          dispatch_once(&qword_10229FEC0, &stru_102144B90);
        v71 = a3->var10;
        v72 = a3->var3;
        v89 = 134285825;
        v90 = v49;
        v91 = 2049;
        v92 = v79;
        v93 = 2049;
        v94 = v55;
        v95 = 2049;
        v96 = v78;
        v97 = 2049;
        v98 = v71;
        v99 = 2049;
        v100 = v77;
        v101 = 1026;
        v102 = v60 != v61;
        v103 = 1025;
        v104 = v50;
        v105 = 1026;
        v106 = v72;
        v107 = 1026;
        v108 = v50 ^ 1;
        _os_log_send_and_compose_impl(2, 0, buf, 1628, &_mh_execute_header, qword_10229FEC8, 0, "VO2MaxRetrocomputeHistory data checks: prevAlgSampleInterval,%{private}f,minPrevAlgSampleInterval,%{private}f,estimatesUpdatedRatio,%{private}f,minEstimatesUpdatedRatio,%{private}f,meanDelta,%{private}f,minMeanDelta,%{private}f,badStagingDataExists,%{public}d,failedDataCheck,%{private}d,oldRetrocomputeStatus,%{public}d,newRetrocomputeStatus,%{public}d", &v89, 86);
        v74 = (char *)v73;
        sub_100512490("Generic", 1, 0, 2, "-[CLVO2MaxService updateRetrocomputeHistoryPostProcessing:]", "%s\n", v73);
        if (v74 != buf)
          free(v74);
      }
      if (a3->var3 == 1)
        v65 = 1;
      else
        v65 = v50;
      if ((v65 & 1) == 0)
        a3->var20 = CFAbsoluteTimeGetCurrent();
      a3->var3 = v50 ^ 1;
      sub_100804C78((uint64_t)self->fRetrocomputeDb.__ptr_.__value_, (uint64_t)a3, a3->var0);
      if (__p)
      {
        v81 = (double *)__p;
        operator delete(__p);
      }
      v43 = 0;
    }
    else
    {
      if (qword_10229FEC0 != -1)
        dispatch_once(&qword_10229FEC0, &stru_102144B90);
      v44 = qword_10229FEC8;
      if (os_log_type_enabled((os_log_t)qword_10229FEC8, OS_LOG_TYPE_DEFAULT))
      {
        *(_WORD *)buf = 0;
        _os_log_impl((void *)&_mh_execute_header, v44, OS_LOG_TYPE_DEFAULT, "Unable to check for bad staging data due to device lock", buf, 2u);
      }
      if (sub_1001BFF7C(115, 2))
      {
        bzero(buf, 0x65CuLL);
        if (qword_10229FEC0 != -1)
          dispatch_once(&qword_10229FEC0, &stru_102144B90);
        LOWORD(v89) = 0;
        _os_log_send_and_compose_impl(2, 0, buf, 1628, &_mh_execute_header, qword_10229FEC8, 0, "Unable to check for bad staging data due to device lock", &v89, 2);
        v70 = (char *)v69;
        sub_100512490("Generic", 1, 0, 2, "-[CLVO2MaxService updateRetrocomputeHistoryPostProcessing:]", "%s\n", v69);
        if (v70 != buf)
          free(v70);
      }
      v43 = 2;
    }
    *(_QWORD *)buf = &v83;
    sub_100582124((void ***)buf);
  }
  else
  {
    if (qword_10229FEC0 != -1)
      dispatch_once(&qword_10229FEC0, &stru_102144B90);
    v42 = qword_10229FEC8;
    if (os_log_type_enabled((os_log_t)qword_10229FEC8, OS_LOG_TYPE_DEFAULT))
    {
      *(_WORD *)buf = 0;
      _os_log_impl((void *)&_mh_execute_header, v42, OS_LOG_TYPE_DEFAULT, "Unable to query for staging output due to device lock", buf, 2u);
    }
    if (sub_1001BFF7C(115, 2))
    {
      bzero(buf, 0x65CuLL);
      if (qword_10229FEC0 != -1)
        dispatch_once(&qword_10229FEC0, &stru_102144B90);
      LOWORD(v89) = 0;
      _os_log_send_and_compose_impl(2, 0, buf, 1628, &_mh_execute_header, qword_10229FEC8, 0, "Unable to query for staging output due to device lock", &v89, 2);
      v68 = (char *)v67;
      sub_100512490("Generic", 1, 0, 2, "-[CLVO2MaxService updateRetrocomputeHistoryPostProcessing:]", "%s\n", v67);
      if (v68 != buf)
        free(v68);
    }
    v43 = 2;
  }
  *(_QWORD *)buf = &v86;
  sub_100582124((void ***)buf);
  return v43;
}

- (void)triggerRetrocomputeWithReply:(id)a3
{
  NSObject *v5;
  uint64_t v6;
  VO2MaxStagingOutput *end;
  __int128 v8;
  __int128 v9;
  __int128 v10;
  __int128 v11;
  __int128 v12;
  __int128 v13;
  uint64_t v14;
  __int128 v15;
  NSObject *v16;
  NSObject *v17;
  const char *v18;
  uint8_t *v19;
  const char *v20;
  uint8_t *v21;
  const char *v22;
  uint8_t *v23;
  uint64_t v24;
  id v25[2];
  _OWORD v26[9];
  uint64_t v27;
  char v28;
  __int128 __p;
  uint64_t v30;
  int64_t var0;
  _DWORD v32[4];
  uint8_t buf[4];
  int v34;

  sub_100131938(v25, (uint64_t)"com.apple.locationd.VO2MaxService.Retrocompute", 0);
  self->fTriggerRetrocomputeInProgress = 1;
  if (qword_10229FEC0 != -1)
    dispatch_once(&qword_10229FEC0, &stru_102144B90);
  v5 = qword_10229FEC8;
  if (os_log_type_enabled((os_log_t)qword_10229FEC8, OS_LOG_TYPE_DEFAULT))
  {
    *(_WORD *)buf = 0;
    _os_log_impl((void *)&_mh_execute_header, v5, OS_LOG_TYPE_DEFAULT, "Retrocompute triggered", buf, 2u);
  }
  if (sub_1001BFF7C(115, 2))
  {
    bzero(buf, 0x65CuLL);
    if (qword_10229FEC0 != -1)
      dispatch_once(&qword_10229FEC0, &stru_102144B90);
    LOWORD(v32[0]) = 0;
    _os_log_send_and_compose_impl(2, 0, buf, 1628, &_mh_execute_header, qword_10229FEC8, 0, "Retrocompute triggered", v32, 2);
    v19 = (uint8_t *)v18;
    sub_100512490("Generic", 1, 0, 2, "-[CLVO2MaxService triggerRetrocomputeWithReply:]", "%s\n", v18);
    if (v19 != buf)
      free(v19);
  }
  -[CLVO2MaxService updateRetrocomputeStatus:unavailableReasons:](self, "updateRetrocomputeStatus:unavailableReasons:", 2, 0);
  self->fUpdateRetrocomputedDataSuccess = 0;
  self->fUpdateRetrocomputedDataAttempts = 0;
  self->fDeleteHealthKitSamplesSuccess = 0;
  self->fDeleteHealthKitSamplesAttempts = 0;
  sub_100582164((uint64_t *)&self->fPendingHealthKitWrites);
  v6 = sub_1011F6B80((uint64_t)self->fStagingOutputStore.__ptr_.__value_, (uint64_t *)&self->fPendingHealthKitWrites);
  if ((_DWORD)v6 != 100)
  {
    if (qword_10229FEC0 != -1)
      dispatch_once(&qword_10229FEC0, &stru_102144B90);
    v16 = qword_10229FEC8;
    if (os_log_type_enabled((os_log_t)qword_10229FEC8, OS_LOG_TYPE_ERROR))
    {
      *(_DWORD *)buf = 67109120;
      v34 = v6;
      _os_log_impl((void *)&_mh_execute_header, v16, OS_LOG_TYPE_ERROR, "Unable to query for staging output: %d", buf, 8u);
    }
    if (sub_1001BFF7C(115, 0))
    {
      bzero(buf, 0x65CuLL);
      if (qword_10229FEC0 != -1)
        dispatch_once(&qword_10229FEC0, &stru_102144B90);
      v32[0] = 67109120;
      v32[1] = v6;
      _os_log_send_and_compose_impl(2, 0, buf, 1628, &_mh_execute_header, qword_10229FEC8, 16, "Unable to query for staging output: %d", v32);
      v21 = (uint8_t *)v20;
      sub_100512490("Generic", 1, 0, 0, "-[CLVO2MaxService triggerRetrocomputeWithReply:]", "%s\n", v20);
      if (v21 != buf)
        free(v21);
    }
    -[CLVO2MaxService updateRetrocomputeStatus:unavailableReasons:](self, "updateRetrocomputeStatus:unavailableReasons:", 1, 0);
    (*((void (**)(id, uint64_t))a3 + 2))(a3, v6);
    goto LABEL_22;
  }
  (*((void (**)(id, uint64_t))a3 + 2))(a3, 100);
  end = self->fPendingHealthKitWrites.__end_;
  if (self->fPendingHealthKitWrites.__begin_ == end)
  {
    if (qword_10229FEC0 != -1)
      dispatch_once(&qword_10229FEC0, &stru_102144B90);
    v17 = qword_10229FEC8;
    if (os_log_type_enabled((os_log_t)qword_10229FEC8, OS_LOG_TYPE_DEFAULT))
    {
      *(_WORD *)buf = 0;
      _os_log_impl((void *)&_mh_execute_header, v17, OS_LOG_TYPE_DEFAULT, "No staging data found", buf, 2u);
    }
    if (sub_1001BFF7C(115, 2))
    {
      bzero(buf, 0x65CuLL);
      if (qword_10229FEC0 != -1)
        dispatch_once(&qword_10229FEC0, &stru_102144B90);
      LOWORD(v32[0]) = 0;
      LODWORD(v24) = 2;
      _os_log_send_and_compose_impl(2, 0, buf, 1628, &_mh_execute_header, qword_10229FEC8, 0, "No staging data found", v32, v24);
      v23 = (uint8_t *)v22;
      sub_100512490("Generic", 1, 0, 2, "-[CLVO2MaxService triggerRetrocomputeWithReply:]", "%s\n", v22);
      if (v23 != buf)
        free(v23);
    }
    -[CLVO2MaxService updateRetrocomputeStatus:unavailableReasons:](self, "updateRetrocomputeStatus:unavailableReasons:", 3, 0);
    sub_100423B14((uint64_t)self->fRetrocomputeBodyMetricsDb.__ptr_.__value_);
LABEL_22:
    self->fTriggerRetrocomputeInProgress = 0;
    goto LABEL_26;
  }
  v26[0] = *(_OWORD *)end[-1].var1;
  v8 = *(_OWORD *)&end[-1].var2;
  v9 = *(_OWORD *)&end[-1].var4;
  v10 = *(_OWORD *)end[-1].var8;
  v26[3] = *(_OWORD *)&end[-1].var6;
  v26[4] = v10;
  v26[1] = v8;
  v26[2] = v9;
  v11 = *(_OWORD *)&end[-1].var9;
  v12 = *(_OWORD *)&end[-1].var11;
  v13 = *(_OWORD *)&end[-1].var17;
  v26[7] = *(_OWORD *)&end[-1].var15;
  v26[8] = v13;
  v26[5] = v11;
  v26[6] = v12;
  v14 = *(_QWORD *)&end[-1].var20;
  v28 = end[-1].var21.__r_.__value_.var0.var0.__data_[0];
  v27 = v14;
  if (*((char *)&end[-1].var21.__r_.var1 + 3) < 0)
  {
    sub_100115CE4(&__p, (void *)end[-1].var21.__r_.__value_.var0.var1.__size_, *((_QWORD *)&end[-1].var21.__r_.__value_.var0.var1 + 2));
  }
  else
  {
    v15 = *(_OWORD *)&end[-1].var21.__r_.__value_.var0.var1.__size_;
    v30 = *(_QWORD *)&end[-1].var21.__r_.var0;
    __p = v15;
  }
  var0 = end[-1].var21.var0;
  -[CLVO2MaxService saveStagingOutputToHealthKit:activity:](self, "saveStagingOutputToHealthKit:activity:", v26, 0);
  if (SHIBYTE(v30) < 0)
    operator delete((void *)__p);
LABEL_26:
  sub_100131740(v25);
}

- (void)saveStagingOutputToHealthKit:(VO2MaxStagingOutput *)a3 activity:
{
  uint64_t v3;
  uint64_t v4;
  id v7;
  double var2;
  NSDate *v9;
  HKQuantity *v10;
  id v11;
  id v12;
  void *v13;
  HKQuantitySample *v14;
  NSObject *v15;
  id v16;
  basic_string<char, std::char_traits<char>, std::allocator<char>> *p_var21;
  HKHealthStore *v18;
  NSArray *v19;
  _QWORD *v20;
  HKHealthStore *v21;
  HKHealthStore *fHkHealthStore;
  uint64_t v23;
  const char *v24;
  uint8_t *v25;
  _QWORD v26[7];
  _QWORD v27[7];
  HKQuantitySample *v28;
  HKQuantitySample *v29;
  int v30;
  id v31;
  uint8_t buf[4];
  id v33;

  v4 = v3;
  v7 = +[HKQuantityType quantityTypeForIdentifier:](HKQuantityType, "quantityTypeForIdentifier:", HKQuantityTypeIdentifierVO2Max);
  var2 = a3->var2;
  v9 = +[NSDate dateWithTimeIntervalSinceReferenceDate:](NSDate, "dateWithTimeIntervalSinceReferenceDate:", var2);
  v10 = +[HKQuantity quantityWithUnit:doubleValue:](HKQuantity, "quantityWithUnit:doubleValue:", +[HKUnit unitFromString:](HKUnit, "unitFromString:", CFSTR("ml/(kg*min)")), round(a3->var3 * 100.0) / 100.0);
  v11 = objc_msgSend(objc_alloc((Class)NSUUID), "initWithUUIDBytes:", a3->var8);
  v12 = objc_alloc_init((Class)NSMutableDictionary);
  objc_msgSend(v12, "setObject:forKeyedSubscript:", &off_10221B198, HKMetadataKeyVO2MaxTestType);
  if (a3->var20)
    v13 = &__kCFBooleanTrue;
  else
    v13 = &__kCFBooleanFalse;
  objc_msgSend(v12, "setObject:forKeyedSubscript:", v13, _HKPrivateMetadataKeyUserOnBetaBlocker);
  objc_msgSend(v12, "setObject:forKeyedSubscript:", objc_msgSend(v11, "UUIDString"), HKMetadataKeySyncIdentifier);
  objc_msgSend(v12, "setObject:forKeyedSubscript:", +[NSNumber numberWithInt:](NSNumber, "numberWithInt:", a3->var19), HKMetadataKeySyncVersion);
  v14 = +[HKQuantitySample quantitySampleWithType:quantity:startDate:endDate:metadata:](HKQuantitySample, "quantitySampleWithType:quantity:startDate:endDate:metadata:", v7, v10, v9, v9, v12);
  if (qword_10229FEC0 != -1)
    dispatch_once(&qword_10229FEC0, &stru_102144B90);
  v15 = qword_10229FEC8;
  if (os_log_type_enabled((os_log_t)qword_10229FEC8, OS_LOG_TYPE_DEBUG))
  {
    *(_DWORD *)buf = 138543362;
    v33 = objc_msgSend(v11, "UUIDString");
    _os_log_impl((void *)&_mh_execute_header, v15, OS_LOG_TYPE_DEBUG, "Adding retrocomputed sample to HKHealthStore: %{public}@", buf, 0xCu);
  }
  if (sub_1001BFF7C(115, 2))
  {
    bzero(buf, 0x65CuLL);
    if (qword_10229FEC0 != -1)
      dispatch_once(&qword_10229FEC0, &stru_102144B90);
    v23 = qword_10229FEC8;
    v30 = 138543362;
    v31 = objc_msgSend(v11, "UUIDString");
    _os_log_send_and_compose_impl(2, 0, buf, 1628, &_mh_execute_header, v23, 2, "Adding retrocomputed sample to HKHealthStore: %{public}@", &v30, 12);
    v25 = (uint8_t *)v24;
    sub_100512490("Generic", 1, 0, 2, "-[CLVO2MaxService saveStagingOutputToHealthKit:activity:]", "%s\n", v24);
    if (v25 != buf)
      free(v25);
  }
  v16 = objc_msgSend(objc_msgSend(-[CLVO2MaxService universe](self, "universe"), "vendor"), "proxyForService:", CFSTR("CLVO2MaxService"));
  if (*((char *)&a3->var21.__r_.__value_.var0.var1 + 23) < 0)
  {
    if (a3->var21.__r_.__value_.var0.var1.__size_)
      goto LABEL_11;
LABEL_15:
    fHkHealthStore = self->fHkHealthStore;
    v29 = v14;
    v19 = +[NSArray arrayWithObjects:count:](NSArray, "arrayWithObjects:count:", &v29, 1);
    v27[0] = _NSConcreteStackBlock;
    v27[1] = 3221225472;
    v27[2] = sub_10057BF54;
    v27[3] = &unk_102144B20;
    v27[4] = v16;
    v27[5] = v4;
    *(double *)&v27[6] = var2;
    v20 = v27;
    v21 = fHkHealthStore;
    goto LABEL_16;
  }
  if (!*((_BYTE *)&a3->var21.__r_.__value_.var0.var1 + 23))
    goto LABEL_15;
LABEL_11:
  p_var21 = &a3->var21;
  v18 = (HKHealthStore *)objc_alloc_init((Class)HKHealthStore);
  if (*((char *)&a3->var21.__r_.__value_.var0.var1 + 23) < 0)
    p_var21 = (basic_string<char, std::char_traits<char>, std::allocator<char>> *)p_var21->__r_.__value_.var0.var1.__data_;
  -[HKHealthStore setSourceBundleIdentifier:](v18, "setSourceBundleIdentifier:", +[NSString stringWithUTF8String:](NSString, "stringWithUTF8String:", p_var21));
  -[HKHealthStore resume](v18, "resume");
  v28 = v14;
  v19 = +[NSArray arrayWithObjects:count:](NSArray, "arrayWithObjects:count:", &v28, 1);
  v26[0] = _NSConcreteStackBlock;
  v26[1] = 3221225472;
  v26[2] = sub_10057C244;
  v26[3] = &unk_102144B20;
  v26[4] = v16;
  v26[5] = v4;
  *(double *)&v26[6] = var2;
  v20 = v26;
  v21 = v18;
LABEL_16:
  -[HKHealthStore saveObjects:withCompletion:](v21, "saveObjects:withCompletion:", v19, v20);

}

- (void)onRetrocomputeHealthKitSampleSavedWithStartTime:(double)a3 activity:(id)a4
{
  vector<VO2MaxStagingOutput, std::allocator<VO2MaxStagingOutput>> *p_fPendingHealthKitWrites;
  VO2MaxStagingOutput *end;
  NSObject *v9;
  VO2MaxStagingOutput *v10;
  unint64_t v11;
  double var3;
  NSObject *v13;
  VO2MaxStagingOutput *v14;
  __int128 v15;
  __int128 v16;
  __int128 v17;
  __int128 v18;
  __int128 v19;
  __int128 v20;
  char *data;
  __int128 v22;
  VO2MaxStagingOutput *v23;
  unint64_t v24;
  double v25;
  const char *v26;
  uint8_t *v27;
  const char *v28;
  uint8_t *v29;
  _OWORD v30[9];
  char *v31;
  char v32;
  __int128 __p;
  int64_t var0;
  unint64_t v35;
  int v36;
  double v37;
  __int16 v38;
  double v39;
  __int16 v40;
  double v41;
  uint8_t buf[4];
  double v43;
  __int16 v44;
  double v45;
  __int16 v46;
  double v47;

  p_fPendingHealthKitWrites = &self->fPendingHealthKitWrites;
  end = self->fPendingHealthKitWrites.__end_;
  if (self->fPendingHealthKitWrites.__begin_ != end && end[-1].var3 == a3)
  {
    if (!-[CLVO2MaxService updateRetrocomputeLastTimestampToHealthKit:](self, "updateRetrocomputeLastTimestampToHealthKit:", a3))
    {
      if (qword_10229FEC0 != -1)
        dispatch_once(&qword_10229FEC0, &stru_102144B90);
      v13 = qword_10229FEC8;
      if (os_log_type_enabled((os_log_t)qword_10229FEC8, OS_LOG_TYPE_DEFAULT))
      {
        *(_DWORD *)buf = 134283521;
        v43 = a3;
        _os_log_impl((void *)&_mh_execute_header, v13, OS_LOG_TYPE_DEFAULT, "Failed to update retrocompute history record with lastTimestampToHealthKit (%{private}f). Will attempt to proceed with remaining HealthKit writes.", buf, 0xCu);
      }
      if (sub_1001BFF7C(115, 2))
      {
        bzero(buf, 0x65CuLL);
        if (qword_10229FEC0 != -1)
          dispatch_once(&qword_10229FEC0, &stru_102144B90);
        v36 = 134283521;
        v37 = a3;
        _os_log_send_and_compose_impl(2, 0, buf, 1628, &_mh_execute_header, qword_10229FEC8, 0, "Failed to update retrocompute history record with lastTimestampToHealthKit (%{private}f). Will attempt to proceed with remaining HealthKit writes.", &v36, 12);
        v29 = (uint8_t *)v28;
        sub_100512490("Generic", 1, 0, 2, "-[CLVO2MaxService onRetrocomputeHealthKitSampleSavedWithStartTime:activity:]", "%s\n", v28);
        if (v29 != buf)
          free(v29);
      }
    }
    self->fUpdateRetrocomputedDataAttempts = 0;
    v14 = p_fPendingHealthKitWrites->__end_;
    if (*((char *)&v14[-1].var21.__r_.var1 + 3) < 0)
      operator delete((void *)v14[-1].var21.__r_.__value_.var0.var1.__size_);
    p_fPendingHealthKitWrites->__end_ = (VO2MaxStagingOutput *)((char *)v14 - 192);
    if (p_fPendingHealthKitWrites->__begin_ == (VO2MaxStagingOutput *)v14[-1].var1)
    {
      -[CLVO2MaxService promoteStagingData:](self, "promoteStagingData:", a4);
    }
    else
    {
      v30[0] = *(_OWORD *)&v14[-2].var1[8];
      v15 = *(_OWORD *)&v14[-2].var3;
      v16 = *(_OWORD *)&v14[-2].var5;
      v17 = *(_OWORD *)&v14[-2].var8[8];
      v30[3] = *(_OWORD *)&v14[-2].var7;
      v30[4] = v17;
      v30[1] = v15;
      v30[2] = v16;
      v18 = *(_OWORD *)&v14[-2].var10;
      v19 = *(_OWORD *)&v14[-2].var14;
      v20 = *(_OWORD *)&v14[-2].var18;
      v30[7] = *(_OWORD *)&v14[-2].var16;
      v30[8] = v20;
      v30[5] = v18;
      v30[6] = v19;
      data = v14[-2].var21.__r_.__value_.var0.var1.__data_;
      v32 = v14[-2].var21.__r_.__value_.var0.var0.__data_[8];
      v31 = data;
      if (SHIBYTE(v14[-2].var21.var0) < 0)
      {
        sub_100115CE4(&__p, *((void **)&v14[-2].var21.__r_.__value_.var0.var1 + 2), *(_QWORD *)&v14[-2].var21.__r_.var0);
      }
      else
      {
        v22 = *((_OWORD *)&v14[-2].var21.__r_.__value_.var0.var1 + 1);
        var0 = v14[-2].var21.var0;
        __p = v22;
      }
      v35 = v14[-1].var0;
      -[CLVO2MaxService saveStagingOutputToHealthKit:activity:](self, "saveStagingOutputToHealthKit:activity:", v30, a4);
      if (SHIBYTE(var0) < 0)
        operator delete((void *)__p);
    }
  }
  else
  {
    if (qword_10229FEC0 != -1)
      dispatch_once(&qword_10229FEC0, &stru_102144B90);
    v9 = qword_10229FEC8;
    if (os_log_type_enabled((os_log_t)qword_10229FEC8, OS_LOG_TYPE_ERROR))
    {
      v10 = p_fPendingHealthKitWrites->__end_;
      v11 = 0xAAAAAAAAAAAAAAABLL * (((char *)v10 - (char *)p_fPendingHealthKitWrites->__begin_) >> 6);
      if (v10 == p_fPendingHealthKitWrites->__begin_)
        var3 = 0.0;
      else
        var3 = v10[-1].var3;
      *(_DWORD *)buf = 134349569;
      v43 = *(double *)&v11;
      v44 = 2049;
      v45 = a3;
      v46 = 2049;
      v47 = var3;
      _os_log_impl((void *)&_mh_execute_header, v9, OS_LOG_TYPE_ERROR, "Will retry retrocompute trigger due to unexpected state. fPendingHealthKitWrites count: %{public}lu, expected sample startTime: %{private}f, actual sample startTime: %{private}f", buf, 0x20u);
    }
    if (sub_1001BFF7C(115, 0))
    {
      bzero(buf, 0x65CuLL);
      if (qword_10229FEC0 != -1)
        dispatch_once(&qword_10229FEC0, &stru_102144B90);
      v23 = p_fPendingHealthKitWrites->__end_;
      v24 = 0xAAAAAAAAAAAAAAABLL * (((char *)v23 - (char *)p_fPendingHealthKitWrites->__begin_) >> 6);
      if (v23 == p_fPendingHealthKitWrites->__begin_)
        v25 = 0.0;
      else
        v25 = v23[-1].var3;
      v36 = 134349569;
      v37 = *(double *)&v24;
      v38 = 2049;
      v39 = a3;
      v40 = 2049;
      v41 = v25;
      _os_log_send_and_compose_impl(2, 0, buf, 1628, &_mh_execute_header, qword_10229FEC8, 16, "Will retry retrocompute trigger due to unexpected state. fPendingHealthKitWrites count: %{public}lu, expected sample startTime: %{private}f, actual sample startTime: %{private}f", &v36, 32);
      v27 = (uint8_t *)v26;
      sub_100512490("Generic", 1, 0, 0, "-[CLVO2MaxService onRetrocomputeHealthKitSampleSavedWithStartTime:activity:]", "%s\n", v26);
      if (v27 != buf)
        free(v27);
    }
    if (a4)
      -[CLVO2MaxService markXpcActivityDone:](self, "markXpcActivityDone:", a4);
    else
      -[CLVO2MaxService retryTriggerRetrocompute](self, "retryTriggerRetrocompute");
  }
}

- (void)onRetrocomputeHealthKitSampleFailed:(id)a3
{
  if (a3)
    -[CLVO2MaxService markXpcActivityDone:](self, "markXpcActivityDone:");
  else
    -[CLVO2MaxService retryTriggerRetrocompute](self, "retryTriggerRetrocompute");
}

- (void)promoteStagingData:(id)a3
{
  int v5;
  int v6;
  NSObject *v7;
  const char *v8;
  uint8_t *v9;
  _DWORD v10[4];
  uint8_t buf[4];
  int v12;

  v5 = sub_1011F6B7C(self->fStagingOutputStore.__ptr_.__value_, a2);
  if (v5 != 100)
  {
    v6 = v5;
    if (qword_10229FEC0 != -1)
      dispatch_once(&qword_10229FEC0, &stru_102144B90);
    v7 = qword_10229FEC8;
    if (os_log_type_enabled((os_log_t)qword_10229FEC8, OS_LOG_TYPE_ERROR))
    {
      *(_DWORD *)buf = 67109120;
      v12 = v6;
      _os_log_impl((void *)&_mh_execute_header, v7, OS_LOG_TYPE_ERROR, "Could not promote staging data: %d", buf, 8u);
    }
    if (sub_1001BFF7C(115, 0))
    {
      bzero(buf, 0x65CuLL);
      if (qword_10229FEC0 != -1)
        dispatch_once(&qword_10229FEC0, &stru_102144B90);
      v10[0] = 67109120;
      v10[1] = v6;
      _os_log_send_and_compose_impl(2, 0, buf, 1628, &_mh_execute_header, qword_10229FEC8, 16, "Could not promote staging data: %d", v10);
      v9 = (uint8_t *)v8;
      sub_100512490("Generic", 1, 0, 0, "-[CLVO2MaxService promoteStagingData:]", "%s\n", v8);
      if (v9 != buf)
        free(v9);
    }
    if (!a3)
    {
      -[CLVO2MaxService retryTriggerRetrocompute](self, "retryTriggerRetrocompute");
      return;
    }
LABEL_10:
    -[CLVO2MaxService markXpcActivityDone:](self, "markXpcActivityDone:", a3);
    return;
  }
  -[CLVO2MaxService updateRetrocomputeStatus:unavailableReasons:](self, "updateRetrocomputeStatus:unavailableReasons:", 3, 0);
  self->fUpdateRetrocomputedDataSuccess = 1;
  sub_100423B14((uint64_t)self->fRetrocomputeBodyMetricsDb.__ptr_.__value_);
  -[CLVO2MaxService deleteHealthKitSamples:](self, "deleteHealthKitSamples:", 1);
  self->fTriggerRetrocomputeInProgress = 0;
  if (a3)
    goto LABEL_10;
}

- (void)retryTriggerRetrocompute
{
  NSObject *v3;
  xpc_object_t v4;
  const char *v5;
  uint8_t *v6;
  _QWORD handler[5];
  int v8;
  const char *v9;
  uint8_t buf[4];
  const char *v11;

  self->fTriggerRetrocomputeInProgress = 1;
  self->fUpdateRetrocomputedDataSuccess = 0;
  self->fUpdateRetrocomputedDataAttempts = 0;
  if (qword_10229FEC0 != -1)
    dispatch_once(&qword_10229FEC0, &stru_102144B90);
  v3 = qword_10229FEC8;
  if (os_log_type_enabled((os_log_t)qword_10229FEC8, OS_LOG_TYPE_DEFAULT))
  {
    *(_DWORD *)buf = 136446210;
    v11 = "com.apple.locationd.VO2Max.RetrocomputeRetryTrigger";
    _os_log_impl((void *)&_mh_execute_header, v3, OS_LOG_TYPE_DEFAULT, "Setting up %{public}s activity", buf, 0xCu);
  }
  if (sub_1001BFF7C(115, 2))
  {
    bzero(buf, 0x65CuLL);
    if (qword_10229FEC0 != -1)
      dispatch_once(&qword_10229FEC0, &stru_102144B90);
    v8 = 136446210;
    v9 = "com.apple.locationd.VO2Max.RetrocomputeRetryTrigger";
    _os_log_send_and_compose_impl(2, 0, buf, 1628, &_mh_execute_header, qword_10229FEC8, 0, "Setting up %{public}s activity", &v8, 12);
    v6 = (uint8_t *)v5;
    sub_100512490("Generic", 1, 0, 2, "-[CLVO2MaxService retryTriggerRetrocompute]", "%s\n", v5);
    if (v6 != buf)
      free(v6);
  }
  v4 = xpc_dictionary_create(0, 0, 0);
  xpc_dictionary_set_BOOL(v4, XPC_ACTIVITY_REPEATING, 1);
  xpc_dictionary_set_int64(v4, XPC_ACTIVITY_DELAY, XPC_ACTIVITY_INTERVAL_1_MIN);
  xpc_dictionary_set_int64(v4, XPC_ACTIVITY_GRACE_PERIOD, XPC_ACTIVITY_INTERVAL_1_MIN);
  xpc_dictionary_set_string(v4, XPC_ACTIVITY_PRIORITY, XPC_ACTIVITY_PRIORITY_UTILITY);
  xpc_dictionary_set_BOOL(v4, XPC_ACTIVITY_REQUIRES_CLASS_B, 1);
  xpc_dictionary_set_BOOL(v4, XPC_ACTIVITY_ALLOW_BATTERY, 1);
  xpc_activity_unregister("com.apple.locationd.VO2Max.RetrocomputeRetryTrigger");
  handler[0] = _NSConcreteStackBlock;
  handler[1] = 3221225472;
  handler[2] = sub_10057CF58;
  handler[3] = &unk_102144B48;
  handler[4] = objc_msgSend(objc_msgSend(-[CLVO2MaxService universe](self, "universe"), "vendor"), "proxyForService:", CFSTR("CLVO2MaxService"));
  xpc_activity_register("com.apple.locationd.VO2Max.RetrocomputeRetryTrigger", v4, handler);
  xpc_release(v4);
}

- (void)onRetryTriggerRetrocompute:(id)a3
{
  xpc_activity_state_t state;
  xpc_activity_state_t v6;
  NSObject *v7;
  const char *v8;
  NSObject *v9;
  uint8_t *v10;
  __int128 v11;
  uint8_t buf[4];
  xpc_activity_state_t v13;

  if (!a3)
  {
    if (qword_10229FEC0 != -1)
      dispatch_once(&qword_10229FEC0, &stru_102144B90);
    v7 = qword_10229FEC8;
    if (os_log_type_enabled((os_log_t)qword_10229FEC8, OS_LOG_TYPE_ERROR))
    {
      *(_WORD *)buf = 0;
      _os_log_impl((void *)&_mh_execute_header, v7, OS_LOG_TYPE_ERROR, "Invalid xpc activity.", buf, 2u);
    }
    if (!sub_1001BFF7C(115, 0))
      return;
    bzero(buf, 0x65CuLL);
    if (qword_10229FEC0 != -1)
      dispatch_once(&qword_10229FEC0, &stru_102144B90);
    _os_log_send_and_compose_impl(2, 0, buf, 1628, &_mh_execute_header, qword_10229FEC8, 16, "Invalid xpc activity.");
LABEL_22:
    v10 = (uint8_t *)v8;
    sub_100512490("Generic", 1, 0, 0, "-[CLVO2MaxService onRetryTriggerRetrocompute:]", "%s\n", v8);
    if (v10 != buf)
      free(v10);
    return;
  }
  state = xpc_activity_get_state((xpc_activity_t)a3);
  if (state == 4 || (v6 = state, state == 2))
  {
    -[CLVO2MaxService handleRetryTriggerRetrocompute:](self, "handleRetryTriggerRetrocompute:", a3);
    return;
  }
  if (qword_10229FEC0 != -1)
    dispatch_once(&qword_10229FEC0, &stru_102144B90);
  v9 = qword_10229FEC8;
  if (os_log_type_enabled((os_log_t)qword_10229FEC8, OS_LOG_TYPE_ERROR))
  {
    *(_DWORD *)buf = 134217984;
    v13 = v6;
    _os_log_impl((void *)&_mh_execute_header, v9, OS_LOG_TYPE_ERROR, "Unexpected activity state: %ld", buf, 0xCu);
  }
  if (sub_1001BFF7C(115, 0))
  {
    bzero(buf, 0x65CuLL);
    if (qword_10229FEC0 != -1)
      dispatch_once(&qword_10229FEC0, &stru_102144B90);
    _os_log_send_and_compose_impl(2, 0, buf, 1628, &_mh_execute_header, qword_10229FEC8, 16, "Unexpected activity state: %ld", &v11);
    goto LABEL_22;
  }
}

- (void)handleRetryTriggerRetrocompute:(id)a3
{
  NSObject *v5;
  NSObject *v6;
  NSObject *v7;
  NSObject *v8;
  NSObject *v9;
  int v10;
  VO2MaxStagingOutput *end;
  NSObject *v12;
  const char *v13;
  uint8_t *v14;
  const char *v15;
  uint8_t *v16;
  const char *v17;
  const char *v18;
  uint8_t *v19;
  const char *v20;
  uint8_t *v21;
  const char *v22;
  id v23[2];
  _BYTE v24[160];
  void *__p;
  char v26;
  int v27;
  int v28;
  __int16 v29;
  int v30;
  uint8_t buf[4];
  int v32;
  __int16 v33;
  int v34;
  _QWORD v35[2];
  int v36;
  __int128 v37;
  _DWORD v38[7];
  __int128 v39;
  __int128 v40;
  double v41[5];

  sub_100131938(v23, (uint64_t)"com.apple.locationd.VO2MaxService.Retrocompute", 0);
  v35[0] = 0;
  v35[1] = 0;
  v36 = 3;
  v41[4] = 0.0;
  v37 = 0u;
  memset(v38, 0, sizeof(v38));
  v39 = 0u;
  v40 = 0u;
  memset(v41, 0, 28);
  if (self->fUpdateRetrocomputedDataSuccess)
  {
    if (qword_10229FEC0 != -1)
      dispatch_once(&qword_10229FEC0, &stru_102144B90);
    v5 = qword_10229FEC8;
    if (os_log_type_enabled((os_log_t)qword_10229FEC8, OS_LOG_TYPE_DEFAULT))
    {
      *(_WORD *)buf = 0;
      _os_log_impl((void *)&_mh_execute_header, v5, OS_LOG_TYPE_DEFAULT, "Retrying retrocompute trigger already succeeded, cancelling activity", buf, 2u);
    }
    if (!sub_1001BFF7C(115, 2))
      goto LABEL_7;
    bzero(buf, 0x65CuLL);
    if (qword_10229FEC0 != -1)
      dispatch_once(&qword_10229FEC0, &stru_102144B90);
    LOWORD(v27) = 0;
    _os_log_send_and_compose_impl(2, 0, buf, 1628, &_mh_execute_header, qword_10229FEC8, 0, "Retrying retrocompute trigger already succeeded, cancelling activity", &v27, 2);
    v14 = (uint8_t *)v13;
    sub_100512490("Generic", 1, 0, 2, "-[CLVO2MaxService handleRetryTriggerRetrocompute:]", "%s\n", v13);
    if (v14 == buf)
      goto LABEL_7;
    goto LABEL_51;
  }
  if (sub_100804F78((uint64_t)self->fRetrocomputeDb.__ptr_.__value_, 3, (uint64_t)v35) == 109)
  {
    if (qword_10229FEC0 != -1)
      dispatch_once(&qword_10229FEC0, &stru_102144B90);
    v6 = qword_10229FEC8;
    if (os_log_type_enabled((os_log_t)qword_10229FEC8, OS_LOG_TYPE_ERROR))
    {
      *(_WORD *)buf = 0;
      _os_log_impl((void *)&_mh_execute_header, v6, OS_LOG_TYPE_ERROR, "Unable to query for retrocompute history due to device lock", buf, 2u);
    }
    if (!sub_1001BFF7C(115, 0))
      goto LABEL_16;
    bzero(buf, 0x65CuLL);
    if (qword_10229FEC0 != -1)
      dispatch_once(&qword_10229FEC0, &stru_102144B90);
    LOWORD(v27) = 0;
    _os_log_send_and_compose_impl(2, 0, buf, 1628, &_mh_execute_header, qword_10229FEC8, 16, "Unable to query for retrocompute history due to device lock", &v27, 2);
    v16 = (uint8_t *)v15;
    sub_100512490("Generic", 1, 0, 0, "-[CLVO2MaxService handleRetryTriggerRetrocompute:]", "%s\n", v15);
    if (v16 == buf)
      goto LABEL_16;
    goto LABEL_55;
  }
  if ((_DWORD)v37 != 2)
  {
    if (qword_10229FEC0 != -1)
      dispatch_once(&qword_10229FEC0, &stru_102144B90);
    v8 = qword_10229FEC8;
    if (os_log_type_enabled((os_log_t)qword_10229FEC8, OS_LOG_TYPE_DEFAULT))
    {
      *(_DWORD *)buf = 67240448;
      v32 = v37;
      v33 = 1026;
      v34 = v36;
      _os_log_impl((void *)&_mh_execute_header, v8, OS_LOG_TYPE_DEFAULT, "Will not attempt to retry retrocompute trigger, status: %{public}d, algVersion: %{public}d", buf, 0xEu);
    }
    if (!sub_1001BFF7C(115, 2))
      goto LABEL_7;
    bzero(buf, 0x65CuLL);
    if (qword_10229FEC0 != -1)
      dispatch_once(&qword_10229FEC0, &stru_102144B90);
    v27 = 67240448;
    v28 = v37;
    v29 = 1026;
    v30 = v36;
    _os_log_send_and_compose_impl(2, 0, buf, 1628, &_mh_execute_header, qword_10229FEC8, 0, "Will not attempt to retry retrocompute trigger, status: %{public}d, algVersion: %{public}d", &v27, 14);
    v14 = (uint8_t *)v17;
    sub_100512490("Generic", 1, 0, 2, "-[CLVO2MaxService handleRetryTriggerRetrocompute:]", "%s\n", v17);
    if (v14 == buf)
      goto LABEL_7;
LABEL_51:
    free(v14);
LABEL_7:
    -[CLVO2MaxService markXpcActivityDone:](self, "markXpcActivityDone:", a3);
    xpc_activity_unregister("com.apple.locationd.VO2Max.RetrocomputeRetryTrigger");
LABEL_8:
    self->fTriggerRetrocomputeInProgress = 0;
    goto LABEL_9;
  }
  if (self->fUpdateRetrocomputedDataAttempts >= 3)
  {
    if (qword_10229FEC0 != -1)
      dispatch_once(&qword_10229FEC0, &stru_102144B90);
    v7 = qword_10229FEC8;
    if (os_log_type_enabled((os_log_t)qword_10229FEC8, OS_LOG_TYPE_DEFAULT))
    {
      *(_WORD *)buf = 0;
      _os_log_impl((void *)&_mh_execute_header, v7, OS_LOG_TYPE_DEFAULT, "Giving up attempting to retry retrocompute trigger", buf, 2u);
    }
    if (sub_1001BFF7C(115, 2))
    {
      bzero(buf, 0x65CuLL);
      if (qword_10229FEC0 != -1)
        dispatch_once(&qword_10229FEC0, &stru_102144B90);
      LOWORD(v27) = 0;
      _os_log_send_and_compose_impl(2, 0, buf, 1628, &_mh_execute_header, qword_10229FEC8, 0, "Giving up attempting to retry retrocompute trigger", &v27, 2);
      v19 = (uint8_t *)v18;
      sub_100512490("Generic", 1, 0, 2, "-[CLVO2MaxService handleRetryTriggerRetrocompute:]", "%s\n", v18);
      if (v19 != buf)
        free(v19);
    }
    -[CLVO2MaxService markXpcActivityDone:](self, "markXpcActivityDone:", a3);
    xpc_activity_unregister("com.apple.locationd.VO2Max.RetrocomputeRetryHealthKitDelete");
    if (v41[0] == 0.0)
      -[CLVO2MaxService updateRetrocomputeStatus:unavailableReasons:](self, "updateRetrocomputeStatus:unavailableReasons:", 1, 0, v41[0]);
    goto LABEL_8;
  }
  if (qword_10229FEC0 != -1)
    dispatch_once(&qword_10229FEC0, &stru_102144B90);
  v9 = qword_10229FEC8;
  if (os_log_type_enabled((os_log_t)qword_10229FEC8, OS_LOG_TYPE_DEFAULT))
  {
    *(_WORD *)buf = 0;
    _os_log_impl((void *)&_mh_execute_header, v9, OS_LOG_TYPE_DEFAULT, "Retrying retrocompute trigger", buf, 2u);
  }
  if (sub_1001BFF7C(115, 2))
  {
    bzero(buf, 0x65CuLL);
    if (qword_10229FEC0 != -1)
      dispatch_once(&qword_10229FEC0, &stru_102144B90);
    LOWORD(v27) = 0;
    _os_log_send_and_compose_impl(2, 0, buf, 1628, &_mh_execute_header, qword_10229FEC8, 0, "Retrying retrocompute trigger", &v27, 2);
    v21 = (uint8_t *)v20;
    sub_100512490("Generic", 1, 0, 2, "-[CLVO2MaxService handleRetryTriggerRetrocompute:]", "%s\n", v20);
    if (v21 != buf)
      free(v21);
  }
  ++self->fUpdateRetrocomputedDataAttempts;
  self->fDeleteHealthKitSamplesSuccess = 0;
  self->fDeleteHealthKitSamplesAttempts = 0;
  sub_100582164((uint64_t *)&self->fPendingHealthKitWrites);
  v10 = sub_1011F6B80((uint64_t)self->fStagingOutputStore.__ptr_.__value_, (uint64_t *)&self->fPendingHealthKitWrites);
  if (v10 != 100)
  {
    if (qword_10229FEC0 != -1)
      dispatch_once(&qword_10229FEC0, &stru_102144B90);
    v12 = qword_10229FEC8;
    if (os_log_type_enabled((os_log_t)qword_10229FEC8, OS_LOG_TYPE_ERROR))
    {
      *(_DWORD *)buf = 67109120;
      v32 = v10;
      _os_log_impl((void *)&_mh_execute_header, v12, OS_LOG_TYPE_ERROR, "Unable to query for staging output: %d", buf, 8u);
    }
    if (!sub_1001BFF7C(115, 0))
      goto LABEL_16;
    bzero(buf, 0x65CuLL);
    if (qword_10229FEC0 != -1)
      dispatch_once(&qword_10229FEC0, &stru_102144B90);
    v27 = 67109120;
    v28 = v10;
    _os_log_send_and_compose_impl(2, 0, buf, 1628, &_mh_execute_header, qword_10229FEC8, 16, "Unable to query for staging output: %d", &v27);
    v16 = (uint8_t *)v22;
    sub_100512490("Generic", 1, 0, 0, "-[CLVO2MaxService handleRetryTriggerRetrocompute:]", "%s\n", v22);
    if (v16 == buf)
      goto LABEL_16;
LABEL_55:
    free(v16);
LABEL_16:
    -[CLVO2MaxService markXpcActivityDone:](self, "markXpcActivityDone:", a3);
    goto LABEL_9;
  }
  end = self->fPendingHealthKitWrites.__end_;
  if (self->fPendingHealthKitWrites.__begin_ == end)
  {
    -[CLVO2MaxService promoteStagingData:](self, "promoteStagingData:", a3);
  }
  else
  {
    sub_10057B460((uint64_t)v24, (uint64_t)end[-1].var1);
    -[CLVO2MaxService saveStagingOutputToHealthKit:activity:](self, "saveStagingOutputToHealthKit:activity:", v24, a3);
    if (v26 < 0)
      operator delete(__p);
  }
LABEL_9:
  sub_100131740(v23);
}

- (void)deleteHealthKitSamples:(BOOL)a3
{
  _BOOL8 v3;
  NSObject *v5;
  NSObject *v6;
  NSObject *v7;
  const char *v8;
  uint8_t *v9;
  const char *v10;
  uint8_t *v11;
  const char *v12;
  uint8_t *v13;
  uint64_t v14;
  void *__p;
  void *v16;
  uint64_t v17;
  _WORD v18[8];
  void *v19;
  _BYTE *v20;
  uint64_t v21;
  uint8_t buf[1640];

  v3 = a3;
  if (qword_10229FEC0 != -1)
    dispatch_once(&qword_10229FEC0, &stru_102144B90);
  v5 = qword_10229FEC8;
  if (os_log_type_enabled((os_log_t)qword_10229FEC8, OS_LOG_TYPE_INFO))
  {
    *(_WORD *)buf = 0;
    _os_log_impl((void *)&_mh_execute_header, v5, OS_LOG_TYPE_INFO, "Attempting to delete samples without estimates in HKHealthStore", buf, 2u);
  }
  if (sub_1001BFF7C(115, 2))
  {
    bzero(buf, 0x65CuLL);
    if (qword_10229FEC0 != -1)
      dispatch_once(&qword_10229FEC0, &stru_102144B90);
    LOWORD(v19) = 0;
    _os_log_send_and_compose_impl(2, 0, buf, 1628, &_mh_execute_header, qword_10229FEC8, 1, "Attempting to delete samples without estimates in HKHealthStore", &v19, 2);
    v9 = (uint8_t *)v8;
    sub_100512490("Generic", 1, 0, 2, "-[CLVO2MaxService deleteHealthKitSamples:]", "%s\n", v8);
    if (v9 != buf)
      free(v9);
  }
  v19 = 0;
  v20 = 0;
  v21 = 0;
  if (sub_1011F6E74((uint64_t)self->fStagingOutputStore.__ptr_.__value_, &v19) == 100)
  {
    if (v19 == v20)
    {
      if (qword_10229FEC0 != -1)
        dispatch_once(&qword_10229FEC0, &stru_102144B90);
      v7 = qword_10229FEC8;
      if (os_log_type_enabled((os_log_t)qword_10229FEC8, OS_LOG_TYPE_INFO))
      {
        *(_WORD *)buf = 0;
        _os_log_impl((void *)&_mh_execute_header, v7, OS_LOG_TYPE_INFO, "No sessions to delete from HKHealthStore", buf, 2u);
      }
      if (sub_1001BFF7C(115, 2))
      {
        bzero(buf, 0x65CuLL);
        if (qword_10229FEC0 != -1)
          dispatch_once(&qword_10229FEC0, &stru_102144B90);
        v18[0] = 0;
        LODWORD(v14) = 2;
        _os_log_send_and_compose_impl(2, 0, buf, 1628, &_mh_execute_header, qword_10229FEC8, 1, "No sessions to delete from HKHealthStore", v18, v14);
        v13 = (uint8_t *)v12;
        sub_100512490("Generic", 1, 0, 2, "-[CLVO2MaxService deleteHealthKitSamples:]", "%s\n", v12);
        if (v13 != buf)
          free(v13);
      }
    }
    else
    {
      __p = 0;
      v16 = 0;
      v17 = 0;
      sub_10053C1B0(&__p, v19, (uint64_t)v20, (v20 - (_BYTE *)v19) >> 5);
      -[CLVO2MaxService deleteSessionsFromHealthKit:withRetry:](self, "deleteSessionsFromHealthKit:withRetry:", &__p, v3);
      if (__p)
      {
        v16 = __p;
        operator delete(__p);
      }
    }
  }
  else
  {
    if (qword_10229FEC0 != -1)
      dispatch_once(&qword_10229FEC0, &stru_102144B90);
    v6 = qword_10229FEC8;
    if (os_log_type_enabled((os_log_t)qword_10229FEC8, OS_LOG_TYPE_INFO))
    {
      *(_WORD *)buf = 0;
      _os_log_impl((void *)&_mh_execute_header, v6, OS_LOG_TYPE_INFO, "Unable to fetch sessions without estimates", buf, 2u);
    }
    if (sub_1001BFF7C(115, 2))
    {
      bzero(buf, 0x65CuLL);
      if (qword_10229FEC0 != -1)
        dispatch_once(&qword_10229FEC0, &stru_102144B90);
      v18[0] = 0;
      LODWORD(v14) = 2;
      _os_log_send_and_compose_impl(2, 0, buf, 1628, &_mh_execute_header, qword_10229FEC8, 1, "Unable to fetch sessions without estimates", v18, v14);
      v11 = (uint8_t *)v10;
      sub_100512490("Generic", 1, 0, 2, "-[CLVO2MaxService deleteHealthKitSamples:]", "%s\n", v10);
      if (v11 != buf)
        free(v11);
    }
    if (v3)
      -[CLVO2MaxService retryHealthKitDeleteSamples](self, "retryHealthKitDeleteSamples");
  }
  if (v19)
  {
    v20 = v19;
    operator delete(v19);
  }
}

- (void)retryHealthKitDeleteSamples
{
  NSObject *v3;
  xpc_object_t v4;
  const char *v5;
  uint8_t *v6;
  _QWORD handler[5];
  _WORD v8[8];
  uint8_t buf[1640];

  if (qword_10229FEC0 != -1)
    dispatch_once(&qword_10229FEC0, &stru_102144B90);
  v3 = qword_10229FEC8;
  if (os_log_type_enabled((os_log_t)qword_10229FEC8, OS_LOG_TYPE_INFO))
  {
    *(_WORD *)buf = 0;
    _os_log_impl((void *)&_mh_execute_header, v3, OS_LOG_TYPE_INFO, "Setting up activity to attempt deleting sessions without estimates from HKHealthStore", buf, 2u);
  }
  if (sub_1001BFF7C(115, 2))
  {
    bzero(buf, 0x65CuLL);
    if (qword_10229FEC0 != -1)
      dispatch_once(&qword_10229FEC0, &stru_102144B90);
    v8[0] = 0;
    _os_log_send_and_compose_impl(2, 0, buf, 1628, &_mh_execute_header, qword_10229FEC8, 1, "Setting up activity to attempt deleting sessions without estimates from HKHealthStore", v8, 2);
    v6 = (uint8_t *)v5;
    sub_100512490("Generic", 1, 0, 2, "-[CLVO2MaxService retryHealthKitDeleteSamples]", "%s\n", v5);
    if (v6 != buf)
      free(v6);
  }
  v4 = xpc_dictionary_create(0, 0, 0);
  xpc_dictionary_set_BOOL(v4, XPC_ACTIVITY_REPEATING, 1);
  xpc_dictionary_set_int64(v4, XPC_ACTIVITY_INTERVAL, 30);
  xpc_dictionary_set_string(v4, XPC_ACTIVITY_PRIORITY, XPC_ACTIVITY_PRIORITY_UTILITY);
  xpc_dictionary_set_BOOL(v4, XPC_ACTIVITY_REQUIRES_CLASS_B, 1);
  xpc_dictionary_set_BOOL(v4, XPC_ACTIVITY_ALLOW_BATTERY, 1);
  handler[0] = _NSConcreteStackBlock;
  handler[1] = 3221225472;
  handler[2] = sub_10057E57C;
  handler[3] = &unk_102144B48;
  handler[4] = objc_msgSend(objc_msgSend(-[CLVO2MaxService universe](self, "universe"), "vendor"), "proxyForService:", CFSTR("CLVO2MaxService"));
  xpc_activity_register("com.apple.locationd.VO2Max.RetrocomputeRetryHealthKitDelete", v4, handler);
  xpc_release(v4);
}

- (void)onRetryHealthKitDeleteSamples:(id)a3
{
  xpc_activity_state_t state;
  xpc_activity_state_t v6;
  NSObject *v7;
  const char *v8;
  uint8_t *v9;
  NSObject *v10;
  const char *v11;
  int v12;
  xpc_activity_state_t v13;
  uint8_t buf[4];
  xpc_activity_state_t v15;

  if (!a3)
  {
    if (qword_10229FEC0 != -1)
      dispatch_once(&qword_10229FEC0, &stru_102144B90);
    v7 = qword_10229FEC8;
    if (os_log_type_enabled((os_log_t)qword_10229FEC8, OS_LOG_TYPE_ERROR))
    {
      *(_WORD *)buf = 0;
      _os_log_impl((void *)&_mh_execute_header, v7, OS_LOG_TYPE_ERROR, "Invalid xpc activity.", buf, 2u);
    }
    if (!sub_1001BFF7C(115, 0))
      return;
    bzero(buf, 0x65CuLL);
    if (qword_10229FEC0 != -1)
      dispatch_once(&qword_10229FEC0, &stru_102144B90);
    LOWORD(v12) = 0;
    _os_log_send_and_compose_impl(2, 0, buf, 1628, &_mh_execute_header, qword_10229FEC8, 16, "Invalid xpc activity.", &v12, 2);
    v9 = (uint8_t *)v8;
    sub_100512490("Generic", 1, 0, 0, "-[CLVO2MaxService onRetryHealthKitDeleteSamples:]", "%s\n", v8);
LABEL_22:
    if (v9 != buf)
      free(v9);
    return;
  }
  state = xpc_activity_get_state((xpc_activity_t)a3);
  if (state == 4 || (v6 = state, state == 2))
  {
    sub_100131938(buf, (uint64_t)"com.apple.locationd.VO2MaxService.Retrocompute", 0);
    -[CLVO2MaxService handleRetryHealthKitDeleteSamples:](self, "handleRetryHealthKitDeleteSamples:", a3);
    sub_100131740((id *)buf);
    return;
  }
  if (qword_10229FEC0 != -1)
    dispatch_once(&qword_10229FEC0, &stru_102144B90);
  v10 = qword_10229FEC8;
  if (os_log_type_enabled((os_log_t)qword_10229FEC8, OS_LOG_TYPE_ERROR))
  {
    *(_DWORD *)buf = 134217984;
    v15 = v6;
    _os_log_impl((void *)&_mh_execute_header, v10, OS_LOG_TYPE_ERROR, "Unexpected activity state: %ld", buf, 0xCu);
  }
  if (sub_1001BFF7C(115, 0))
  {
    bzero(buf, 0x65CuLL);
    if (qword_10229FEC0 != -1)
      dispatch_once(&qword_10229FEC0, &stru_102144B90);
    v12 = 134217984;
    v13 = v6;
    _os_log_send_and_compose_impl(2, 0, buf, 1628, &_mh_execute_header, qword_10229FEC8, 16, "Unexpected activity state: %ld", &v12);
    v9 = (uint8_t *)v11;
    sub_100512490("Generic", 1, 0, 0, "-[CLVO2MaxService onRetryHealthKitDeleteSamples:]", "%s\n", v11);
    goto LABEL_22;
  }
}

- (void)handleRetryHealthKitDeleteSamples:(id)a3
{
  NSObject *v5;
  const char *v6;
  NSObject *v7;
  NSObject *v8;
  const char *v9;
  uint8_t *v10;
  uint8_t *v11;
  _QWORD v12[2];
  uint8_t buf[1640];

  if (self->fDeleteHealthKitSamplesSuccess)
  {
    if (qword_10229FEC0 != -1)
      dispatch_once(&qword_10229FEC0, &stru_102144B90);
    v5 = qword_10229FEC8;
    if (os_log_type_enabled((os_log_t)qword_10229FEC8, OS_LOG_TYPE_INFO))
    {
      *(_WORD *)buf = 0;
      _os_log_impl((void *)&_mh_execute_header, v5, OS_LOG_TYPE_INFO, "HealthKit samples without an estimate have been deleted, cancelling activity", buf, 2u);
    }
    if (!sub_1001BFF7C(115, 2))
      goto LABEL_22;
    bzero(buf, 0x65CuLL);
    if (qword_10229FEC0 != -1)
      dispatch_once(&qword_10229FEC0, &stru_102144B90);
    LOWORD(v12[0]) = 0;
    _os_log_send_and_compose_impl(2, 0, buf, 1628, &_mh_execute_header, qword_10229FEC8, 1, "HealthKit samples without an estimate have been deleted, cancelling activity", v12, 2, v12[0]);
LABEL_30:
    v11 = (uint8_t *)v6;
    sub_100512490("Generic", 1, 0, 2, "-[CLVO2MaxService handleRetryHealthKitDeleteSamples:]", "%s\n", v6);
    if (v11 != buf)
      free(v11);
LABEL_22:
    -[CLVO2MaxService markXpcActivityDone:](self, "markXpcActivityDone:", a3);
    xpc_activity_unregister("com.apple.locationd.VO2Max.RetrocomputeRetryHealthKitDelete");
    return;
  }
  if (self->fDeleteHealthKitSamplesAttempts > 2)
  {
    if (qword_10229FEC0 != -1)
      dispatch_once(&qword_10229FEC0, &stru_102144B90);
    v8 = qword_10229FEC8;
    if (os_log_type_enabled((os_log_t)qword_10229FEC8, OS_LOG_TYPE_INFO))
    {
      *(_WORD *)buf = 0;
      _os_log_impl((void *)&_mh_execute_header, v8, OS_LOG_TYPE_INFO, "Giving up attempting to delete HealthKit samples without an estimate", buf, 2u);
    }
    if (!sub_1001BFF7C(115, 2))
      goto LABEL_22;
    bzero(buf, 0x65CuLL);
    if (qword_10229FEC0 != -1)
      dispatch_once(&qword_10229FEC0, &stru_102144B90);
    LOWORD(v12[0]) = 0;
    _os_log_send_and_compose_impl(2, 0, buf, 1628, &_mh_execute_header, qword_10229FEC8, 1, "Giving up attempting to delete HealthKit samples without an estimate", v12, 2, v12[0]);
    goto LABEL_30;
  }
  if (qword_10229FEC0 != -1)
    dispatch_once(&qword_10229FEC0, &stru_102144B90);
  v7 = qword_10229FEC8;
  if (os_log_type_enabled((os_log_t)qword_10229FEC8, OS_LOG_TYPE_INFO))
  {
    *(_WORD *)buf = 0;
    _os_log_impl((void *)&_mh_execute_header, v7, OS_LOG_TYPE_INFO, "Attempting to retry deleting HealthKit samples without an estimate", buf, 2u);
  }
  if (sub_1001BFF7C(115, 2))
  {
    bzero(buf, 0x65CuLL);
    if (qword_10229FEC0 != -1)
      dispatch_once(&qword_10229FEC0, &stru_102144B90);
    LOWORD(v12[0]) = 0;
    _os_log_send_and_compose_impl(2, 0, buf, 1628, &_mh_execute_header, qword_10229FEC8, 1, "Attempting to retry deleting HealthKit samples without an estimate", v12, 2);
    v10 = (uint8_t *)v9;
    sub_100512490("Generic", 1, 0, 2, "-[CLVO2MaxService handleRetryHealthKitDeleteSamples:]", "%s\n", v9);
    if (v10 != buf)
      free(v10);
  }
  ++self->fDeleteHealthKitSamplesAttempts;
  -[CLVO2MaxService deleteHealthKitSamples:](self, "deleteHealthKitSamples:", 0);
  -[CLVO2MaxService markXpcActivityDone:](self, "markXpcActivityDone:", a3);
}

- (void)deleteSessionsFromHealthKit:()vector<VO2MaxStagingLostEstimate withRetry:(std:(BOOL)a4 :allocator<VO2MaxStagingLostEstimate>> *)a3
{
  id v5;
  VO2MaxStagingLostEstimate *var0;
  VO2MaxStagingLostEstimate *var1;
  __int128 v8;
  id v9;
  NSObject *v10;
  id v11;
  uint64_t v12;
  id v13;
  const char *v14;
  uint8_t *v15;
  id v16;
  id v17;
  id v18;
  HKHealthStore *fHkHealthStore;
  NSObject *v20;
  const char *v21;
  uint8_t *v22;
  uint64_t v23;
  _QWORD v26[6];
  BOOL v27;
  int v28;
  id v29;
  uint8_t buf[4];
  id v31;
  __int128 v32;
  __int128 v33;

  v5 = objc_alloc_init((Class)NSMutableArray);
  var0 = a3->var0;
  var1 = a3->var1;
  if (a3->var0 != var1)
  {
    do
    {
      v8 = *((_OWORD *)var0 + 1);
      v32 = *(_OWORD *)var0;
      v33 = v8;
      v9 = objc_msgSend(objc_alloc((Class)NSUUID), "initWithUUIDBytes:", &v33);
      objc_msgSend(v5, "addObject:", objc_msgSend(v9, "UUIDString"));
      if (qword_10229FEC0 != -1)
        dispatch_once(&qword_10229FEC0, &stru_102144B90);
      v10 = qword_10229FEC8;
      if (os_log_type_enabled((os_log_t)qword_10229FEC8, OS_LOG_TYPE_DEBUG))
      {
        v11 = objc_msgSend(v9, "UUIDString");
        *(_DWORD *)buf = 138412290;
        v31 = v11;
        _os_log_impl((void *)&_mh_execute_header, v10, OS_LOG_TYPE_DEBUG, "Deleting session %@ from HKHealthStore", buf, 0xCu);
      }
      if (sub_1001BFF7C(115, 2))
      {
        bzero(buf, 0x65CuLL);
        if (qword_10229FEC0 != -1)
          dispatch_once(&qword_10229FEC0, &stru_102144B90);
        v12 = qword_10229FEC8;
        v13 = objc_msgSend(v9, "UUIDString");
        v28 = 138412290;
        v29 = v13;
        LODWORD(v23) = 12;
        _os_log_send_and_compose_impl(2, 0, buf, 1628, &_mh_execute_header, v12, 2, "Deleting session %@ from HKHealthStore", &v28, v23);
        v15 = (uint8_t *)v14;
        sub_100512490("Generic", 1, 0, 2, "-[CLVO2MaxService deleteSessionsFromHealthKit:withRetry:]", "%s\n", v14);
        if (v15 != buf)
          free(v15);
      }

      var0 = (VO2MaxStagingLostEstimate *)((char *)var0 + 32);
    }
    while (var0 != var1);
  }
  if (objc_msgSend(v5, "count"))
  {
    v16 = objc_msgSend(objc_msgSend(-[CLVO2MaxService universe](self, "universe"), "vendor"), "proxyForService:", CFSTR("CLVO2MaxService"));
    v17 = +[HKQuantityType quantityTypeForIdentifier:](HKQuantityType, "quantityTypeForIdentifier:", HKQuantityTypeIdentifierVO2Max);
    v18 = +[HKSampleQuery predicateForObjectsWithMetadataKey:allowedValues:](HKSampleQuery, "predicateForObjectsWithMetadataKey:allowedValues:", HKMetadataKeySyncIdentifier, v5);
    fHkHealthStore = self->fHkHealthStore;
    v26[0] = _NSConcreteStackBlock;
    v26[1] = 3221225472;
    v26[2] = sub_10057F2BC;
    v26[3] = &unk_102144B70;
    v27 = a4;
    v26[4] = self;
    v26[5] = v16;
    -[HKHealthStore deleteObjectsOfType:predicate:withCompletion:](fHkHealthStore, "deleteObjectsOfType:predicate:withCompletion:", v17, v18, v26);
  }
  else
  {
    if (qword_10229FEC0 != -1)
      dispatch_once(&qword_10229FEC0, &stru_102144B90);
    v20 = qword_10229FEC8;
    if (os_log_type_enabled((os_log_t)qword_10229FEC8, OS_LOG_TYPE_INFO))
    {
      *(_WORD *)buf = 0;
      _os_log_impl((void *)&_mh_execute_header, v20, OS_LOG_TYPE_INFO, "No sessions found without estimates to delete from HKHealthStore", buf, 2u);
    }
    if (sub_1001BFF7C(115, 2))
    {
      bzero(buf, 0x65CuLL);
      if (qword_10229FEC0 != -1)
        dispatch_once(&qword_10229FEC0, &stru_102144B90);
      LOWORD(v32) = 0;
      LODWORD(v23) = 2;
      _os_log_send_and_compose_impl(2, 0, buf, 1628, &_mh_execute_header, qword_10229FEC8, 1, "No sessions found without estimates to delete from HKHealthStore", &v32, v23);
      v22 = (uint8_t *)v21;
      sub_100512490("Generic", 1, 0, 2, "-[CLVO2MaxService deleteSessionsFromHealthKit:withRetry:]", "%s\n", v21);
      if (v22 != buf)
        free(v22);
    }
  }

}

- (void)updateRetrocomputeStatus:(int)a3 unavailableReasons:(unsigned int)a4
{
  int v7;
  id v8;
  id v9;
  id v10;
  id v11;
  id v12;
  id v13;
  id v14;
  NSMutableSet *v15;
  id v16;
  id v17;
  uint64_t v18;
  void *v19;
  __int128 v20;
  __int128 v21;
  __int128 v22;
  __int128 v23;
  _BYTE v24[128];
  sqlite3_int64 v25[2];
  int v26;
  __int128 v27;
  _DWORD v28[7];
  __int128 v29;
  __int128 v30;
  _OWORD v31[2];
  uint64_t v32;

  v25[0] = 0;
  v25[1] = 0;
  v26 = 3;
  v32 = 0;
  v27 = 0u;
  memset(v28, 0, sizeof(v28));
  v29 = 0u;
  v30 = 0u;
  memset(v31, 0, 28);
  if (sub_100804F78((uint64_t)self->fRetrocomputeDb.__ptr_.__value_, 3, (uint64_t)v25) == 100)
  {
    v7 = v27;
    LODWORD(v27) = a3;
    DWORD2(v31[1]) = a4;
    sub_100804C78((uint64_t)self->fRetrocomputeDb.__ptr_.__value_, (uint64_t)v25, v25[0]);
    if (v7 != a3)
    {
      v8 = objc_alloc((Class)NSDate);
      v9 = objc_msgSend(v8, "initWithTimeIntervalSinceReferenceDate:", *(double *)((char *)&v27 + 4));
      v10 = objc_alloc((Class)NSDate);
      v11 = objc_msgSend(v10, "initWithTimeIntervalSinceReferenceDate:", *(double *)&v28[1]);
      v12 = objc_alloc((Class)NSNumber);
      v13 = objc_msgSend(v12, "initWithDouble:", *(double *)&v29);
      v14 = objc_msgSend(objc_alloc((Class)CMVO2MaxRetrocomputeState), "initWithStatus:startDate:endDate:meanDelta:", (int)v27, v9, v11, v13);
      v20 = 0u;
      v21 = 0u;
      v22 = 0u;
      v23 = 0u;
      v15 = -[CLVO2MaxService retrocomputeStatusClients](self, "retrocomputeStatusClients", 0);
      v16 = -[NSMutableSet countByEnumeratingWithState:objects:count:](v15, "countByEnumeratingWithState:objects:count:", &v20, v24, 16);
      if (v16)
      {
        v17 = v16;
        v18 = *(_QWORD *)v21;
        do
        {
          v19 = 0;
          do
          {
            if (*(_QWORD *)v21 != v18)
              objc_enumerationMutation(v15);
            objc_msgSend(*(id *)(*((_QWORD *)&v20 + 1) + 8 * (_QWORD)v19), "onRetrocomputeStatusUpdate:", v14);
            v19 = (char *)v19 + 1;
          }
          while (v17 != v19);
          v17 = -[NSMutableSet countByEnumeratingWithState:objects:count:](v15, "countByEnumeratingWithState:objects:count:", &v20, v24, 16);
        }
        while (v17);
      }
      if (a3 == 3)
        objc_msgSend(objc_msgSend(objc_msgSend(-[CLVO2MaxService universe](self, "universe"), "vendor"), "proxyForService:", CFSTR("CLVO2MaxCloudKitManager")), "saveRetrocomputedOutputs");
    }
  }
}

- (BOOL)updateRetrocomputeLastTimestampToHealthKit:(double)a3
{
  sqlite3_int64 v6[2];
  int v7;
  __int128 v8;
  _BYTE v9[108];
  uint64_t v10;

  v6[0] = 0;
  v6[1] = 0;
  v7 = 3;
  v10 = 0;
  v8 = 0u;
  memset(v9, 0, 28);
  memset(&v9[44], 0, 60);
  if (sub_100804F78((uint64_t)self->fRetrocomputeDb.__ptr_.__value_, 3, (uint64_t)v6) != 100)
    return 0;
  *(double *)&v9[76] = a3;
  return sub_100804C78((uint64_t)self->fRetrocomputeDb.__ptr_.__value_, (uint64_t)v6, v6[0]);
}

- (BOOL)validateBodyMetrics
{
  CLBodyMetrics *p_fOriginalBodyMetrics;
  CLBodyMetrics *p_fUserInfo;
  NSObject *v4;
  int biologicalSex;
  double age;
  double heightM;
  double weightKG;
  int v9;
  double v10;
  double v11;
  double v12;
  _BOOL4 v13;
  int v14;
  double v15;
  double v16;
  double v17;
  int v18;
  double v19;
  double v20;
  double v21;
  const char *v22;
  uint8_t *v23;
  _DWORD v25[2];
  __int16 v26;
  double v27;
  __int16 v28;
  double v29;
  __int16 v30;
  double v31;
  __int16 v32;
  int v33;
  __int16 v34;
  double v35;
  __int16 v36;
  double v37;
  __int16 v38;
  double v39;
  uint8_t buf[4];
  int v41;
  __int16 v42;
  double v43;
  __int16 v44;
  double v45;
  __int16 v46;
  double v47;
  __int16 v48;
  int v49;
  __int16 v50;
  double v51;
  __int16 v52;
  double v53;
  __int16 v54;
  double v55;

  p_fOriginalBodyMetrics = &self->fOriginalBodyMetrics;
  p_fUserInfo = &self->fUserInfo;
  if (self->fOriginalBodyMetrics.biologicalSex == self->fUserInfo.biologicalSex
    && vabds_f32(self->fOriginalBodyMetrics.age, self->fUserInfo.age) <= 3.0
    && vabds_f32(self->fOriginalBodyMetrics.heightM, self->fUserInfo.heightM) <= 0.0254
    && vabds_f32(self->fOriginalBodyMetrics.weightKG, self->fUserInfo.weightKG) <= 9.08)
  {
    LOBYTE(v13) = 1;
  }
  else
  {
    if (qword_10229FEC0 != -1)
      dispatch_once(&qword_10229FEC0, &stru_102144B90);
    v4 = qword_10229FEC8;
    if (os_log_type_enabled((os_log_t)qword_10229FEC8, OS_LOG_TYPE_DEFAULT))
    {
      biologicalSex = p_fUserInfo->biologicalSex;
      age = p_fUserInfo->age;
      heightM = p_fUserInfo->heightM;
      weightKG = p_fUserInfo->weightKG;
      v9 = p_fOriginalBodyMetrics->biologicalSex;
      v10 = p_fOriginalBodyMetrics->age;
      v11 = p_fOriginalBodyMetrics->heightM;
      v12 = p_fOriginalBodyMetrics->weightKG;
      *(_DWORD *)buf = 67176449;
      v41 = biologicalSex;
      v42 = 2049;
      v43 = age;
      v44 = 2049;
      v45 = heightM;
      v46 = 2049;
      v47 = weightKG;
      v48 = 1025;
      v49 = v9;
      v50 = 2049;
      v51 = v10;
      v52 = 2049;
      v53 = v11;
      v54 = 2049;
      v55 = v12;
      _os_log_impl((void *)&_mh_execute_header, v4, OS_LOG_TYPE_DEFAULT, "Significant change in BodyMetrics during pre-processing. Original values -- biologicalSex: %{private}d, age: %{private}f, height: %{private}f, weight: %{private}f\n\nCurrent values -- biologicalSex: %{private}d, age: %{private}f, height: %{private}f, weight: %{private}f", buf, 0x4Au);
    }
    v13 = sub_1001BFF7C(115, 2);
    if (v13)
    {
      bzero(buf, 0x65CuLL);
      if (qword_10229FEC0 != -1)
        dispatch_once(&qword_10229FEC0, &stru_102144B90);
      v14 = p_fUserInfo->biologicalSex;
      v15 = p_fUserInfo->age;
      v16 = p_fUserInfo->heightM;
      v17 = p_fUserInfo->weightKG;
      v18 = p_fOriginalBodyMetrics->biologicalSex;
      v19 = p_fOriginalBodyMetrics->age;
      v20 = p_fOriginalBodyMetrics->heightM;
      v21 = p_fOriginalBodyMetrics->weightKG;
      v25[0] = 67176449;
      v25[1] = v14;
      v26 = 2049;
      v27 = v15;
      v28 = 2049;
      v29 = v16;
      v30 = 2049;
      v31 = v17;
      v32 = 1025;
      v33 = v18;
      v34 = 2049;
      v35 = v19;
      v36 = 2049;
      v37 = v20;
      v38 = 2049;
      v39 = v21;
      _os_log_send_and_compose_impl(2, 0, buf, 1628, &_mh_execute_header, qword_10229FEC8, 0, "Significant change in BodyMetrics during pre-processing. Original values -- biologicalSex: %{private}d, age: %{private}f, height: %{private}f, weight: %{private}f\n\nCurrent values -- biologicalSex: %{private}d, age: %{private}f, height: %{private}f, weight: %{private}f", v25, 74);
      v23 = (uint8_t *)v22;
      sub_100512490("Generic", 1, 0, 2, "-[CLVO2MaxService validateBodyMetrics]", "%s\n", v22);
      if (v23 != buf)
        free(v23);
      LOBYTE(v13) = 0;
    }
  }
  return v13;
}

- (void)onUserInfoUpdate:(const int *)a3 data:(const NotificationData *)a4
{
  CLBodyMetrics *p_fUserInfo;
  __int128 v8;
  __int128 v9;
  __int128 v10;
  NSObject *v11;
  _BOOL4 isAgeSet;
  double age;
  int biologicalSex;
  _BOOL4 isHeightSet;
  double heightM;
  _BOOL4 isWeightSet;
  double weightKG;
  _BOOL4 v19;
  double v20;
  int v21;
  _BOOL4 v22;
  double v23;
  _BOOL4 v24;
  double v25;
  const char *v26;
  NSObject *v27;
  int v28;
  uint8_t *v29;
  uint64_t v30;
  __int128 v31;
  uint64_t v32;
  uint64_t v33;
  uint8_t buf[4];
  int v35;
  __int16 v36;
  double v37;
  __int16 v38;
  int v39;
  __int16 v40;
  _BOOL4 v41;
  __int16 v42;
  double v43;
  __int16 v44;
  _BOOL4 v45;
  __int16 v46;
  double v47;

  objc_msgSend(-[CLVO2MaxService universe](self, "universe"), "silo");
  if (*a3 == 2)
  {
    p_fUserInfo = &self->fUserInfo;
    v9 = *((_OWORD *)a4 + 1);
    v8 = *((_OWORD *)a4 + 2);
    v10 = *(_OWORD *)a4;
    *(_OWORD *)&p_fUserInfo->runVo2max = *(_OWORD *)((char *)a4 + 44);
    *(_OWORD *)&p_fUserInfo->vo2max = v9;
    *(_OWORD *)&p_fUserInfo->hronset = v8;
    *(_OWORD *)&p_fUserInfo->gender = v10;
    if (qword_10229FEC0 != -1)
      dispatch_once(&qword_10229FEC0, &stru_102144B90);
    v11 = qword_10229FEC8;
    if (os_log_type_enabled((os_log_t)qword_10229FEC8, OS_LOG_TYPE_DEFAULT))
    {
      isAgeSet = p_fUserInfo->_isAgeSet;
      age = p_fUserInfo->age;
      biologicalSex = p_fUserInfo->biologicalSex;
      isHeightSet = p_fUserInfo->_isHeightSet;
      heightM = p_fUserInfo->heightM;
      isWeightSet = p_fUserInfo->_isWeightSet;
      weightKG = p_fUserInfo->weightKG;
      *(_DWORD *)buf = 67241729;
      v35 = isAgeSet;
      v36 = 2049;
      v37 = age;
      v38 = 1025;
      v39 = biologicalSex;
      v40 = 1026;
      v41 = isHeightSet;
      v42 = 2049;
      v43 = heightM;
      v44 = 1026;
      v45 = isWeightSet;
      v46 = 2049;
      v47 = weightKG;
      _os_log_impl((void *)&_mh_execute_header, v11, OS_LOG_TYPE_DEFAULT, "CLVO2MaxService: Received user info update. IsAgeSet,%{public}d,Age,%{private}f,BiologicalSex,%{private}d,IsHeightSet,%{public}d,Height,%{private}f,IsWeightSet,%{public}d,Weight,%{private}f", buf, 0x38u);
    }
    if (sub_1001BFF7C(115, 2))
    {
      bzero(buf, 0x65CuLL);
      if (qword_10229FEC0 != -1)
        dispatch_once(&qword_10229FEC0, &stru_102144B90);
      v19 = p_fUserInfo->_isAgeSet;
      v20 = p_fUserInfo->age;
      v21 = p_fUserInfo->biologicalSex;
      v22 = p_fUserInfo->_isHeightSet;
      v23 = p_fUserInfo->heightM;
      v24 = p_fUserInfo->_isWeightSet;
      v25 = p_fUserInfo->weightKG;
      LODWORD(v30) = 67241729;
      HIDWORD(v30) = v19;
      LOWORD(v31) = 2049;
      *(double *)((char *)&v31 + 2) = v20;
      WORD5(v31) = 1025;
      HIDWORD(v31) = v21;
      LOWORD(v32) = 1026;
      *(_DWORD *)((char *)&v32 + 2) = v22;
      HIWORD(v32) = 2049;
      LOWORD(v33) = 1026;
      *(_DWORD *)((char *)&v33 + 2) = v24;
      HIWORD(v33) = 2049;
      _os_log_send_and_compose_impl(2, 0, buf, 1628, &_mh_execute_header, qword_10229FEC8, 0, "CLVO2MaxService: Received user info update. IsAgeSet,%{public}d,Age,%{private}f,BiologicalSex,%{private}d,IsHeightSet,%{public}d,Height,%{private}f,IsWeightSet,%{public}d,Weight,%{private}f", &v30, 56, v30, v31, v32, *(_QWORD *)&v23, v33, *(_QWORD *)&v25);
LABEL_19:
      v29 = (uint8_t *)v26;
      sub_100512490("Generic", 1, 0, 2, "-[CLVO2MaxService onUserInfoUpdate:data:]", "%s\n", v26);
      if (v29 != buf)
        free(v29);
    }
  }
  else
  {
    if (qword_10229FEC0 != -1)
      dispatch_once(&qword_10229FEC0, &stru_102144B90);
    v27 = qword_10229FEC8;
    if (os_log_type_enabled((os_log_t)qword_10229FEC8, OS_LOG_TYPE_DEFAULT))
    {
      v28 = *a3;
      *(_DWORD *)buf = 67109120;
      v35 = v28;
      _os_log_impl((void *)&_mh_execute_header, v27, OS_LOG_TYPE_DEFAULT, "#Warning Unhandled notification type, %d", buf, 8u);
    }
    if (sub_1001BFF7C(115, 2))
    {
      bzero(buf, 0x65CuLL);
      if (qword_10229FEC0 != -1)
        dispatch_once(&qword_10229FEC0, &stru_102144B90);
      _os_log_send_and_compose_impl(2, 0, buf, 1628, &_mh_execute_header, qword_10229FEC8, 0, "#Warning Unhandled notification type, %d", &v30);
      goto LABEL_19;
    }
  }
}

- (NSMutableSet)retrocomputeStatusClients
{
  return self->_retrocomputeStatusClients;
}

- (void)setRetrocomputeStatusClients:(id)a3
{
  objc_setProperty_nonatomic(self, a2, a3, 296);
}

- (void).cxx_destruct
{
  Client *value;
  CLVO2MaxRetrocomputeBodyMetricsDb *v4;
  CLVO2MaxRetrocomputeRecorderDb *v5;
  CLVO2MaxStagingOutputStore *v6;
  vector<VO2MaxStagingOutput, std::allocator<VO2MaxStagingOutput>> *p_fPendingHealthKitWrites;

  p_fPendingHealthKitWrites = &self->fPendingHealthKitWrites;
  sub_100582124((void ***)&p_fPendingHealthKitWrites);
  value = self->fUserInfoClient.__ptr_.__value_;
  self->fUserInfoClient.__ptr_.__value_ = 0;
  if (value)
    (*(void (**)(Client *))(*(_QWORD *)value + 8))(value);
  sub_100261F44((uint64_t)&self->fVO2MaxSummaryRecorderDb);
  sub_100261F44((uint64_t)&self->fVO2MaxOutputRecorderDb);
  sub_100261F44((uint64_t)&self->fVO2MaxSessionAttributesDb);
  v4 = self->fRetrocomputeBodyMetricsDb.__ptr_.__value_;
  self->fRetrocomputeBodyMetricsDb.__ptr_.__value_ = 0;
  if (v4)
    (*(void (**)(CLVO2MaxRetrocomputeBodyMetricsDb *))(*(_QWORD *)v4 + 24))(v4);
  v5 = self->fRetrocomputeDb.__ptr_.__value_;
  self->fRetrocomputeDb.__ptr_.__value_ = 0;
  if (v5)
    (*(void (**)(CLVO2MaxRetrocomputeRecorderDb *))(*(_QWORD *)v5 + 24))(v5);
  v6 = self->fStagingOutputStore.__ptr_.__value_;
  self->fStagingOutputStore.__ptr_.__value_ = 0;
  if (v6)
    sub_10050C830((uint64_t)&self->fStagingOutputStore, (uint64_t)v6);
  sub_100261F44((uint64_t)&self->fInputStore);
  sub_100261F44((uint64_t)&self->fInputCache);
}

- (id).cxx_construct
{
  *((_QWORD *)self + 2) = 0;
  *((_QWORD *)self + 3) = 0;
  *((_QWORD *)self + 4) = 0;
  *((_QWORD *)self + 5) = 0;
  *((_QWORD *)self + 6) = 0;
  *((_QWORD *)self + 7) = 0;
  *((_QWORD *)self + 8) = 0;
  *((_QWORD *)self + 9) = 0;
  *((_QWORD *)self + 10) = 0;
  *((_QWORD *)self + 11) = 0;
  *((_QWORD *)self + 12) = 0;
  *((_QWORD *)self + 13) = 0;
  *((_QWORD *)self + 14) = 0;
  *((_QWORD *)self + 18) = 0;
  *((_QWORD *)self + 35) = 0;
  *((_QWORD *)self + 36) = 0;
  *((_QWORD *)self + 34) = 0;
  return self;
}

@end
