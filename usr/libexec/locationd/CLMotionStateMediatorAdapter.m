@implementation CLMotionStateMediatorAdapter

- (void)onOutdoorUpdate:(id)a3
{
  void *v4;
  _QWORD v5[7];

  v4 = -[CLMotionStateMediatorAdapter adaptee](self, "adaptee");
  (*((void (**)(_QWORD *__return_ptr, id))a3 + 2))(v5, a3);
  sub_10008C75C((uint64_t)v4, (uint64_t)v5);
}

- (void)adaptee
{
  void *result;

  result = -[CLNotifierServiceAdapter notifier](self, "notifier");
  if (result)
  return result;
}

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
  if (qword_102303328 != -1)
    dispatch_once(&qword_102303328, &stru_10214D0C0);
  return (id)qword_102303320;
}

- (CLMotionStateMediatorAdapter)init
{
  objc_super v3;

  v3.receiver = self;
  v3.super_class = (Class)CLMotionStateMediatorAdapter;
  return -[CLMotionStateMediatorAdapter initWithInboundProtocol:outboundProtocol:](&v3, "initWithInboundProtocol:outboundProtocol:", &OBJC_PROTOCOL___CLMotionStateMediatorProtocol, &OBJC_PROTOCOL___CLMotionStateMediatorClientProtocol);
}

- (void)beginService
{
  -[CLNotifierServiceAdapter setAdaptedNotifier:](self, "setAdaptedNotifier:", sub_1006B9FCC((uint64_t)-[CLMotionStateMediatorAdapter universe](self, "universe")));
  if (!-[CLNotifierServiceAdapter notifier](self, "notifier"))
    sub_1019057C4();
}

- (void)endService
{
  CLNotifierBase *v2;

  v2 = -[CLNotifierServiceAdapter notifier](self, "notifier");
  (*((void (**)(CLNotifierBase *))v2->var0 + 2))(v2);
}

- (void)doAsync:(id)a3
{
  (*((void (**)(id, void *))a3 + 2))(a3, -[CLMotionStateMediatorAdapter adaptee](self, "adaptee"));
}

- (void)doAsync:(id)a3 withReply:(id)a4
{
  (*((void (**)(id, void *))a3 + 2))(a3, -[CLMotionStateMediatorAdapter adaptee](self, "adaptee"));
  (*((void (**)(id))a4 + 2))(a4);
}

- (BOOL)syncgetDoSync:(id)a3
{
  (*((void (**)(id, void *))a3 + 2))(a3, -[CLMotionStateMediatorAdapter adaptee](self, "adaptee"));
  return 0;
}

- (void)onVisit:(id)a3
{
  uint64_t v4;

  v4 = *((_QWORD *)-[CLMotionStateMediatorAdapter adaptee](self, "adaptee") + 1046);
  if (v4)
    sub_100CAE640(v4, a3);
}

- (void)didUpdateWeather:(id)a3
{
  std::string *v4;

  v4 = (std::string *)*((_QWORD *)-[CLMotionStateMediatorAdapter adaptee](self, "adaptee") + 1046);
  if (v4)
    sub_100CAE1EC(v4, a3);
}

- (void)addClient:(id)a3 prepareSessionEndForSessionType:(int64_t)a4
{
  sub_1006BA194((uint64_t)-[CLMotionStateMediatorAdapter adaptee](self, "adaptee"), (uint64_t)a3, a4);
}

- (void)removeClient:(id)a3 prepareSessionEndForSessionType:(int64_t)a4
{
  sub_1006BA40C((uint64_t)-[CLMotionStateMediatorAdapter adaptee](self, "adaptee"), (uint64_t)a3, a4);
}

- (void)setWorkoutSuggestedStopTimeout:(double)a3
{
  sub_1006BA728((uint64_t)-[CLMotionStateMediatorAdapter adaptee](self, "adaptee"), a3);
}

- (void)userDismissedWorkoutAlert
{
  sub_1006BA8FC((uint64_t)-[CLMotionStateMediatorAdapter adaptee](self, "adaptee"));
}

- (void)triggerWorkoutLocationEventForTesting:(int64_t)a3 withReply:(id)a4
{
  uint64_t v5;

  if (sub_100DDCA00((uint64_t)-[CLMotionStateMediatorAdapter adaptee](self, "adaptee") + 6624, a3))
    v5 = 100;
  else
    v5 = 108;
  (*((void (**)(id, uint64_t))a4 + 2))(a4, v5);
}

- (void)lastKnownIndoorOutdoorStateWithReply:(id)a3
{
  _OWORD *v4;
  __int128 v5;
  uint64_t v6;

  v4 = -[CLMotionStateMediatorAdapter adaptee](self, "adaptee");
  v5 = v4[635];
  v6 = *((_QWORD *)v4 + 1272);
  (*((void (**)(id, __int128 *))a3 + 2))(a3, &v5);
}

- (void)didExitGeoFence
{
  NSObject *v3;
  const char *v4;
  uint8_t *v5;
  _WORD v6[8];
  uint8_t buf[1640];

  if (qword_10229FE60 != -1)
    dispatch_once(&qword_10229FE60, &stru_10214D4A8);
  v3 = qword_10229FE68;
  if (os_log_type_enabled((os_log_t)qword_10229FE68, OS_LOG_TYPE_DEBUG))
  {
    *(_WORD *)buf = 0;
    _os_log_impl((void *)&_mh_execute_header, v3, OS_LOG_TYPE_DEBUG, "#gfc didExitGeoFence() received in adapter", buf, 2u);
  }
  if (sub_1001BFF7C(115, 2))
  {
    bzero(buf, 0x65CuLL);
    if (qword_10229FE60 != -1)
      dispatch_once(&qword_10229FE60, &stru_10214D4A8);
    v6[0] = 0;
    _os_log_send_and_compose_impl(2, 0, buf, 1628, &_mh_execute_header, qword_10229FE68, 2, "#gfc didExitGeoFence() received in adapter", v6, 2);
    v5 = (uint8_t *)v4;
    sub_100512490("Generic", 1, 0, 2, "-[CLMotionStateMediatorAdapter didExitGeoFence]", "%s\n", v4);
    if (v5 != buf)
      free(v5);
  }
  sub_1006BACFC((uint64_t)-[CLMotionStateMediatorAdapter adaptee](self, "adaptee"));
}

- (void)didTimeoutGeoFence
{
  NSObject *v3;
  const char *v4;
  uint8_t *v5;
  _WORD v6[8];
  uint8_t buf[1640];

  if (qword_10229FE60 != -1)
    dispatch_once(&qword_10229FE60, &stru_10214D4A8);
  v3 = qword_10229FE68;
  if (os_log_type_enabled((os_log_t)qword_10229FE68, OS_LOG_TYPE_DEBUG))
  {
    *(_WORD *)buf = 0;
    _os_log_impl((void *)&_mh_execute_header, v3, OS_LOG_TYPE_DEBUG, "#gfc didTimeout() received in adapter", buf, 2u);
  }
  if (sub_1001BFF7C(115, 2))
  {
    bzero(buf, 0x65CuLL);
    if (qword_10229FE60 != -1)
      dispatch_once(&qword_10229FE60, &stru_10214D4A8);
    v6[0] = 0;
    _os_log_send_and_compose_impl(2, 0, buf, 1628, &_mh_execute_header, qword_10229FE68, 2, "#gfc didTimeout() received in adapter", v6, 2);
    v5 = (uint8_t *)v4;
    sub_100512490("Generic", 1, 0, 2, "-[CLMotionStateMediatorAdapter didTimeoutGeoFence]", "%s\n", v4);
    if (v5 != buf)
      free(v5);
  }
  sub_1006BB074((uint64_t)-[CLMotionStateMediatorAdapter adaptee](self, "adaptee"));
}

- (id)syncgetActivityOverride
{
  unint64_t *p_shared_owners;
  unint64_t v3;
  id v4;
  std::__shared_weak_count *v5;
  unint64_t *v6;
  unint64_t v7;
  std::__shared_weak_count *v8;
  unint64_t *v9;
  unint64_t v10;
  uint64_t v12;
  std::__shared_weak_count *v13;
  uint64_t v14;
  std::__shared_weak_count *v15;

  sub_1006BB314((uint64_t)-[CLMotionStateMediatorAdapter adaptee](self, "adaptee"), &v14);
  v12 = v14;
  v13 = v15;
  if (v15)
  {
    p_shared_owners = (unint64_t *)&v15->__shared_owners_;
    do
      v3 = __ldxr(p_shared_owners);
    while (__stxr(v3 + 1, p_shared_owners));
  }
  v4 = sub_1006BB3B0(&v12);
  v5 = v13;
  if (v13)
  {
    v6 = (unint64_t *)&v13->__shared_owners_;
    do
      v7 = __ldaxr(v6);
    while (__stlxr(v7 - 1, v6));
    if (!v7)
    {
      ((void (*)(std::__shared_weak_count *))v5->__on_zero_shared)(v5);
      std::__shared_weak_count::__release_weak(v5);
    }
  }
  v8 = v15;
  if (v15)
  {
    v9 = (unint64_t *)&v15->__shared_owners_;
    do
      v10 = __ldaxr(v9);
    while (__stlxr(v10 - 1, v9));
    if (!v10)
    {
      ((void (*)(std::__shared_weak_count *))v8->__on_zero_shared)(v8);
      std::__shared_weak_count::__release_weak(v8);
    }
  }
  return v4;
}

- (void)registerForWorkoutSessionUpdates:(id)a3
{
  sub_1006BB4A8((uint64_t)-[CLMotionStateMediatorAdapter adaptee](self, "adaptee"), (uint64_t)a3);
}

- (void)unregisterForWorkoutSessionUpdates:(id)a3
{
  sub_1006BB66C((uint64_t)-[CLMotionStateMediatorAdapter adaptee](self, "adaptee"), (uint64_t)a3);
}

- (void)beginWorkoutSession:(WorkoutSettings *)a3 withOverview:(id)a4 enableWorkoutChangeDetection:(BOOL)a5
{
  _BOOL4 v5;
  void *v8;
  void *v9[4];
  char v10;
  _QWORD v11[6];

  v5 = a5;
  v8 = -[CLMotionStateMediatorAdapter adaptee](self, "adaptee");
  (*((void (**)(void **__return_ptr, id))a4 + 2))(v9, a4);
  sub_1006BB8D0((uint64_t)v8, a3->sessionId, (uint64_t)v9, v5);
  sub_100544F70(v11);
  if (v10 < 0)
    operator delete(v9[2]);
}

- (void)setCurrentWorkoutType:(WorkoutSettings *)a3 isManualTransition:(BOOL)a4
{
  sub_1006BBFDC((uint64_t)-[CLMotionStateMediatorAdapter adaptee](self, "adaptee"), a3->sessionId, a4);
}

- (void)endWorkoutSession:(WorkoutSettings *)a3
{
  sub_1006B96B4((uint64_t)-[CLMotionStateMediatorAdapter adaptee](self, "adaptee"), a3->sessionId);
}

- (void)pauseWorkout:(WorkoutSettings *)a3
{
  sub_1006BC270((uint64_t)-[CLMotionStateMediatorAdapter adaptee](self, "adaptee"), a3->sessionId);
}

- (void)resumeWorkout:(WorkoutSettings *)a3
{
  sub_1006BC46C((uint64_t)-[CLMotionStateMediatorAdapter adaptee](self, "adaptee"), a3->sessionId);
}

- (void)currentWorkoutActiveStateWithReply:(id)a3
{
  char *v4;
  __int128 v5;
  __int128 v6;
  __int128 v7;
  __int128 v8;
  __int128 v9;
  uint64_t v10;
  id v11;
  _QWORD v12[3];
  unsigned int v13;
  __int128 v14;
  __int128 v15;
  uint64_t v16;
  _QWORD v17[7];
  _OWORD v18[10];
  uint64_t v19;
  int v20;
  __int128 v21;
  __int128 v22;
  __int128 v23;
  __int128 v24;
  __int128 v25;
  __int128 v26;
  __int128 v27;
  __int128 v28;
  __int128 v29;
  __int128 v30;
  uint64_t v31;
  uint64_t v32;
  void *__p;
  char v34;
  _QWORD v35[6];
  __int128 v36;
  __int128 __src;
  _QWORD v38[7];
  _OWORD v39[10];
  uint64_t v40;

  v13 = 0;
  __src = 0u;
  memset(v38, 0, sizeof(v38));
  v4 = -[CLMotionStateMediatorAdapter adaptee](self, "adaptee");
  v5 = *(_OWORD *)(v4 + 9640);
  v28 = *(_OWORD *)(v4 + 9656);
  v6 = *(_OWORD *)(v4 + 9688);
  v29 = *(_OWORD *)(v4 + 9672);
  v30 = v6;
  v7 = *(_OWORD *)(v4 + 9576);
  v24 = *(_OWORD *)(v4 + 9592);
  v8 = *(_OWORD *)(v4 + 9624);
  v25 = *(_OWORD *)(v4 + 9608);
  v26 = v8;
  v27 = v5;
  v9 = *(_OWORD *)(v4 + 9560);
  v21 = *(_OWORD *)(v4 + 9544);
  v22 = v9;
  v20 = *((_DWORD *)v4 + 2225);
  v31 = *((_QWORD *)v4 + 1213);
  v23 = v7;
  sub_1006D1C1C((uint64_t)&v32, (uint64_t)(v4 + 8808));
  v12[0] = &v13;
  v12[1] = v39;
  v12[2] = &v36;
  sub_1006D29C8((uint64_t)v12, (uint64_t)&v20);
  sub_100691160(v35);
  if (v34 < 0)
    operator delete(__p);
  v10 = v13;
  v18[8] = v39[8];
  v18[9] = v39[9];
  v19 = v40;
  v18[4] = v39[4];
  v18[5] = v39[5];
  v18[6] = v39[6];
  v18[7] = v39[7];
  v18[0] = v39[0];
  v18[1] = v39[1];
  v18[2] = v39[2];
  v18[3] = v39[3];
  v14 = v36;
  if (SHIBYTE(v38[0]) < 0)
  {
    sub_100115CE4(&v15, (void *)__src, *((unint64_t *)&__src + 1));
  }
  else
  {
    v15 = __src;
    v16 = v38[0];
  }
  sub_1006CCC70((uint64_t)v17, &v38[1]);
  v11 = sub_1006BC8D0(&v14);
  (*((void (**)(id, uint64_t, _OWORD *, id))a3 + 2))(a3, v10, v18, v11);
  sub_100691160(v17);
  if (SHIBYTE(v16) < 0)
    operator delete((void *)v15);
  sub_100691160(&v38[1]);
  if (SHIBYTE(v38[0]) < 0)
    operator delete((void *)__src);
}

- (void)workoutSnapshotWithReply:(id)a3
{
  char *v4;
  __int128 v5;
  __int128 v6;
  __int128 v7;
  __int128 v8;
  __int128 v9;
  __int128 v10;
  __int128 v11;
  __int128 v12;
  _OWORD v13[16];

  v4 = -[CLMotionStateMediatorAdapter adaptee](self, "adaptee");
  v5 = *(_OWORD *)(v4 + 10104);
  v13[12] = *(_OWORD *)(v4 + 10088);
  v13[13] = v5;
  v6 = *(_OWORD *)(v4 + 10136);
  v13[14] = *(_OWORD *)(v4 + 10120);
  v13[15] = v6;
  v7 = *(_OWORD *)(v4 + 10040);
  v13[8] = *(_OWORD *)(v4 + 10024);
  v13[9] = v7;
  v8 = *(_OWORD *)(v4 + 10072);
  v13[10] = *(_OWORD *)(v4 + 10056);
  v13[11] = v8;
  v9 = *(_OWORD *)(v4 + 9976);
  v13[4] = *(_OWORD *)(v4 + 9960);
  v13[5] = v9;
  v10 = *(_OWORD *)(v4 + 10008);
  v13[6] = *(_OWORD *)(v4 + 9992);
  v13[7] = v10;
  v11 = *(_OWORD *)(v4 + 9912);
  v13[0] = *(_OWORD *)(v4 + 9896);
  v13[1] = v11;
  v12 = *(_OWORD *)(v4 + 9944);
  v13[2] = *(_OWORD *)(v4 + 9928);
  v13[3] = v12;
  (*((void (**)(id, _OWORD *))a3 + 2))(a3, v13);
}

- (void)updateWorkoutReminderMuteSetting:(int64_t)a3 mute:(BOOL)a4
{
  sub_1006BCB14((unsigned __int8 *)-[CLMotionStateMediatorAdapter adaptee](self, "adaptee"), a3, a4);
}

+ (BOOL)isSupported
{
  if (qword_102303338 != -1)
    dispatch_once(&qword_102303338, &stru_10214D0E0);
  return byte_102303330;
}

@end
