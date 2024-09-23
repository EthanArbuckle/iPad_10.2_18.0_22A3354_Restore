@implementation CLNatalimetryNotifierAdapter

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
  if (qword_10230D408 != -1)
    dispatch_once(&qword_10230D408, &stru_1021A5B70);
  return (id)qword_10230D400;
}

- (CLNatalimetryNotifierAdapter)init
{
  objc_super v3;

  v3.receiver = self;
  v3.super_class = (Class)CLNatalimetryNotifierAdapter;
  return -[CLNatalimetryNotifierAdapter initWithInboundProtocol:outboundProtocol:](&v3, "initWithInboundProtocol:outboundProtocol:", &OBJC_PROTOCOL___CLNatalimetryNotifierProtocol, &OBJC_PROTOCOL___CLNatalimetryNotifierClientProtocol);
}

- (void)beginService
{
  -[CLNotifierServiceAdapter setAdaptedNotifier:](self, "setAdaptedNotifier:", sub_1011C35C4((uint64_t)-[CLNatalimetryNotifierAdapter universe](self, "universe")));
  if (!-[CLNotifierServiceAdapter notifier](self, "notifier"))
    sub_101945534();
}

- (void)endService
{
  CLNotifierBase *v2;

  v2 = -[CLNotifierServiceAdapter notifier](self, "notifier");
  (*((void (**)(CLNotifierBase *))v2->var0 + 2))(v2);
}

- (void)adaptee
{
  void *result;

  result = -[CLNotifierServiceAdapter notifier](self, "notifier");
  if (result)
  return result;
}

- (void)doAsync:(id)a3
{
  (*((void (**)(id, void *))a3 + 2))(a3, -[CLNatalimetryNotifierAdapter adaptee](self, "adaptee"));
}

- (void)doAsync:(id)a3 withReply:(id)a4
{
  (*((void (**)(id, void *))a3 + 2))(a3, -[CLNatalimetryNotifierAdapter adaptee](self, "adaptee"));
  (*((void (**)(id))a4 + 2))(a4);
}

- (BOOL)syncgetDoSync:(id)a3
{
  (*((void (**)(id, void *))a3 + 2))(a3, -[CLNatalimetryNotifierAdapter adaptee](self, "adaptee"));
  return 0;
}

- (void)updatePAL:(double)a3
{
  void *v4;
  float v5;

  v4 = -[CLNatalimetryNotifierAdapter adaptee](self, "adaptee");
  v5 = a3;
  sub_1011C3748((uint64_t)v4, v5);
}

- (void)pause
{
  _QWORD **v2;

  v2 = -[CLNatalimetryNotifierAdapter adaptee](self, "adaptee");
  (*(void (**)(_QWORD *))(*v2[346] + 24))(v2[346]);
}

- (void)resume
{
  _QWORD **v2;

  v2 = -[CLNatalimetryNotifierAdapter adaptee](self, "adaptee");
  (*(void (**)(_QWORD *))(*v2[346] + 32))(v2[346]);
}

- (void)refreshMetrics
{
  sub_1011C38A0((uint64_t)-[CLNatalimetryNotifierAdapter adaptee](self, "adaptee"));
}

- (void)setActiveVo2maxOverride:(BOOL)a3
{
  sub_1011C40D4((uint64_t)-[CLNatalimetryNotifierAdapter adaptee](self, "adaptee"), a3);
}

- (id)syncgetUserProfile
{
  return sub_1011C42C0((uint64_t)-[CLNatalimetryNotifierAdapter adaptee](self, "adaptee"));
}

- (id)syncgetUserProfileInternal
{
  return sub_1011C4430((uint64_t)-[CLNatalimetryNotifierAdapter adaptee](self, "adaptee"));
}

- (void)setUserProfileFromCMNatalimeter:(id)a3
{
  sub_1011C468C((uint64_t)-[CLNatalimetryNotifierAdapter adaptee](self, "adaptee"), a3);
}

- (void)setUserProfile:(id)a3 merge:(BOOL)a4
{
  sub_1011CB9E0((uint64_t)-[CLNatalimetryNotifierAdapter adaptee](self, "adaptee"), a3, a4, 0);
}

- (void)resetUserProfileForKeys:(id)a3
{
  sub_1011C487C((uint64_t)-[CLNatalimetryNotifierAdapter adaptee](self, "adaptee"), a3);
}

- (int)syncgetQueryNatalieDataSince:(CLNatalieData *)a3 records:(void *)a4
{
  return sub_101386214(*((_QWORD *)-[CLNatalimetryNotifierAdapter adaptee](self, "adaptee") + 16));
}

- (int)syncgetQueryExerciseMinuteDataSince:(CLExerciseMinuteData *)a3 records:(void *)a4
{
  return sub_100A05088(*((_QWORD *)-[CLNatalimetryNotifierAdapter adaptee](self, "adaptee") + 24));
}

- (void)queryMetMinutesInTimeRange:(id)a3 withReply:(id)a4
{
  uint64_t v5;
  NSMutableArray *v6;
  double *v7;
  double *v8;
  id v9;
  void *__p;
  double *v11;
  uint64_t v12;

  __p = 0;
  v11 = 0;
  v12 = 0;
  v5 = sub_1011C4F0C((uint64_t)-[CLNatalimetryNotifierAdapter adaptee](self, "adaptee"), (uint64_t)&__p, a3.var0);
  if ((_DWORD)v5 == 100)
  {
    v6 = +[NSMutableArray arrayWithCapacity:](NSMutableArray, "arrayWithCapacity:", ((char *)v11 - (_BYTE *)__p) >> 4);
    v7 = (double *)__p;
    v8 = v11;
    if (__p != v11)
    {
      do
      {
        v9 = objc_msgSend(objc_alloc((Class)CMMetMinute), "initWithSample:", *v7, v7[1]);
        -[NSMutableArray addObject:](v6, "addObject:", v9);

        v7 += 2;
      }
      while (v7 != v8);
    }
    (*((void (**)(id, NSMutableArray *, uint64_t))a4 + 2))(a4, v6, 100);
  }
  else
  {
    (*((void (**)(id, _QWORD, uint64_t))a4 + 2))(a4, 0, v5);
  }
  if (__p)
  {
    v11 = (double *)__p;
    operator delete(__p);
  }
}

- (void)queryWorkoutMets:(id)a3 withReply:(id)a4
{
  uint64_t v7;
  NSObject *v8;
  const char *v9;
  uint8_t *v10;
  _QWORD v11[2];
  uint8_t buf[8];
  uint64_t v13;
  unsigned __int8 v14[16];
  unsigned __int8 v15[16];
  uint64_t v16;

  if (a3)
  {
    uuid_clear(v14);
    uuid_clear(v15);
    v16 = 0;
    *(_QWORD *)buf = 0;
    v13 = 0;
    v11[0] = 0;
    v11[1] = 0;
    objc_msgSend(a3, "getUUIDBytes:", v11);
    v7 = sub_101387810(*((_QWORD *)-[CLNatalimetryNotifierAdapter adaptee](self, "adaptee") + 16), (const unsigned __int8 *)v11, (uint64_t)buf);
    if ((_DWORD)v7 == 100)
      (*((void (**)(id, id, uint64_t))a4 + 2))(a4, objc_msgSend(objc_alloc((Class)CMWorkoutMetsData), "initWithCLWorkoutMets:", buf), 100);
    else
      (*((void (**)(id, _QWORD, uint64_t))a4 + 2))(a4, 0, v7);
  }
  else
  {
    if (qword_10229FC90 != -1)
      dispatch_once(&qword_10229FC90, &stru_1021A5F68);
    v8 = qword_10229FC98;
    if (os_log_type_enabled((os_log_t)qword_10229FC98, OS_LOG_TYPE_DEFAULT))
    {
      *(_WORD *)buf = 0;
      _os_log_impl((void *)&_mh_execute_header, v8, OS_LOG_TYPE_DEFAULT, "queryWorkoutMets nil sessionId", buf, 2u);
    }
    if (sub_1001BFF7C(115, 2))
    {
      bzero(buf, 0x65CuLL);
      if (qword_10229FC90 != -1)
        dispatch_once(&qword_10229FC90, &stru_1021A5F68);
      LOWORD(v11[0]) = 0;
      _os_log_send_and_compose_impl(2, 0, buf, 1628, &_mh_execute_header, qword_10229FC98, 0, "queryWorkoutMets nil sessionId", v11, 2);
      v10 = (uint8_t *)v9;
      sub_100512490("Generic", 1, 0, 2, "-[CLNatalimetryNotifierAdapter queryWorkoutMets:withReply:]", "%s\n", v9);
      if (v10 != buf)
        free(v10);
    }
    (*((void (**)(id, _QWORD, uint64_t))a4 + 2))(a4, 0, 107);
  }
}

- (void)queryVO2MaxInputsFromRecord:(VO2MaxInput *)a3 withReply:(id)a4
{
  uint64_t *v6;
  __int128 v7;
  __int128 v8;
  __int128 v9;
  uint64_t v10;
  NSMutableArray *v11;
  __int128 *v12;
  __int128 *v13;
  id v14;
  id v15;
  void *__p;
  __int128 *v17;
  uint64_t v18;
  _OWORD v19[7];
  __int128 v20;
  __int128 v21;
  __int128 v22;
  __int128 v23;
  __int128 v24;
  __int128 v25;
  __int128 v26;

  __p = 0;
  v17 = 0;
  v18 = 0;
  v6 = (uint64_t *)*((_QWORD *)-[CLNatalimetryNotifierAdapter adaptee](self, "adaptee") + 393);
  v7 = *(_OWORD *)&a3->var12;
  v24 = *(_OWORD *)&a3->var8;
  v25 = v7;
  v26 = *(_OWORD *)&a3->var14;
  v8 = *(_OWORD *)&a3->var1[8];
  v20 = *(_OWORD *)&a3->var0;
  v21 = v8;
  v9 = *(_OWORD *)&a3->var6;
  v22 = *(_OWORD *)&a3->var3;
  v23 = v9;
  v10 = sub_1009D8B7C(v6, &v20, (uint64_t)&__p);
  if ((_DWORD)v10 == 100)
  {
    v11 = +[NSMutableArray arrayWithCapacity:](NSMutableArray, "arrayWithCapacity:", 0x6DB6DB6DB6DB6DB7 * (((char *)v17 - (_BYTE *)__p) >> 4));
    v12 = (__int128 *)__p;
    v13 = v17;
    if (__p != v17)
    {
      do
      {
        v23 = v12[3];
        v24 = v12[4];
        v25 = v12[5];
        v26 = v12[6];
        v20 = *v12;
        v21 = v12[1];
        v22 = v12[2];
        v14 = objc_alloc((Class)CMVO2MaxInputs);
        v19[4] = v24;
        v19[5] = v25;
        v19[6] = v26;
        v19[0] = v20;
        v19[1] = v21;
        v19[2] = v22;
        v19[3] = v23;
        v15 = objc_msgSend(v14, "initWithSample:", v19);
        -[NSMutableArray addObject:](v11, "addObject:", v15);

        v12 += 7;
      }
      while (v12 != v13);
    }
    (*((void (**)(id, NSMutableArray *, uint64_t))a4 + 2))(a4, v11, 100);
  }
  else
  {
    (*((void (**)(id, _QWORD, uint64_t))a4 + 2))(a4, 0, v10);
  }
  if (__p)
  {
    v17 = (__int128 *)__p;
    operator delete(__p);
  }
}

- (void)onCalorieAggregationActivity:(id)a3
{
  sub_1011C53E0((uint64_t)-[CLNatalimetryNotifierAdapter adaptee](self, "adaptee"), (xpc_activity_t)a3);
}

+ (BOOL)isSupported
{
  if (qword_10230D418 != -1)
    dispatch_once(&qword_10230D418, &stru_1021A5B90);
  return byte_10230D410;
}

@end
