@implementation CLSwimNotifierAdapter

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
  if (qword_10230F7A0 != -1)
    dispatch_once(&qword_10230F7A0, &stru_1021B8E08);
  return (id)qword_10230F798;
}

- (CLSwimNotifierAdapter)init
{
  objc_super v3;

  v3.receiver = self;
  v3.super_class = (Class)CLSwimNotifierAdapter;
  return -[CLSwimNotifierAdapter initWithInboundProtocol:outboundProtocol:](&v3, "initWithInboundProtocol:outboundProtocol:", &OBJC_PROTOCOL___CLSwimNotifierProtocol, &OBJC_PROTOCOL___CLSwimNotifierClientProtocol);
}

- (void)beginService
{
  uint64_t v3;

  -[CLNotifierServiceAdapter setAdaptedNotifier:](self, "setAdaptedNotifier:", sub_10149465C((uint64_t)-[CLSwimNotifierAdapter universe](self, "universe")));
  if (!-[CLNotifierServiceAdapter notifier](self, "notifier"))
  {
    v3 = sub_101956CBC();
    sub_10149465C(v3);
  }
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
  (*((void (**)(id, void *))a3 + 2))(a3, -[CLSwimNotifierAdapter adaptee](self, "adaptee"));
}

- (void)doAsync:(id)a3 withReply:(id)a4
{
  (*((void (**)(id, void *))a3 + 2))(a3, -[CLSwimNotifierAdapter adaptee](self, "adaptee"));
  (*((void (**)(id))a4 + 2))(a4);
}

- (BOOL)syncgetDoSync:(id)a3
{
  (*((void (**)(id, void *))a3 + 2))(a3, -[CLSwimNotifierAdapter adaptee](self, "adaptee"));
  return 0;
}

+ (BOOL)isSupported
{
  if (qword_10230F7B0 != -1)
    dispatch_once(&qword_10230F7B0, &stru_1021B8E28);
  return byte_10230F7A8;
}

- (void)queryUsingRecord:(CLSwimEntry *)a3 withReply:(id)a4
{
  NSMutableArray *v5;
  _OWORD *v6;
  _BYTE *v7;
  __int128 v8;
  __int128 v9;
  __int128 v10;
  __int128 v11;
  __int128 v12;
  __int128 v13;
  __int128 v14;
  id v15;
  void *__p;
  _BYTE *v17;
  _OWORD v18[9];
  uint64_t v19;

  sub_1014949B8((uint64_t)-[CLSwimNotifierAdapter adaptee](self, "adaptee"), (uint64_t)a3, (uint64_t *)&__p);
  v5 = +[NSMutableArray arrayWithCapacity:](NSMutableArray, "arrayWithCapacity:", 0x86BCA1AF286BCA1BLL * ((v17 - (_BYTE *)__p) >> 3));
  v6 = __p;
  v7 = v17;
  if (__p != v17)
  {
    do
    {
      v8 = v6[1];
      v18[0] = *v6;
      v18[1] = v8;
      v9 = v6[2];
      v10 = v6[3];
      v11 = v6[5];
      v18[4] = v6[4];
      v18[5] = v11;
      v18[2] = v9;
      v18[3] = v10;
      v12 = v6[6];
      v13 = v6[7];
      v14 = v6[8];
      v19 = *((_QWORD *)v6 + 18);
      v18[7] = v13;
      v18[8] = v14;
      v18[6] = v12;
      v15 = objc_msgSend(objc_alloc((Class)CMSwimData), "initWithSwimEntry:", v18);
      -[NSMutableArray addObject:](v5, "addObject:", v15);

      v6 = (_OWORD *)((char *)v6 + 152);
    }
    while (v6 != (_OWORD *)v7);
  }
  (*((void (**)(id, NSMutableArray *))a4 + 2))(a4, v5);
  if (__p)
  {
    v17 = __p;
    operator delete(__p);
  }
}

- (void)querySessionSWOLF:(id)a3 withReply:(id)a4
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
  __int128 v16;
  __int128 v17;
  uint64_t v18;

  if (a3)
  {
    uuid_clear(v14);
    uuid_clear(v15);
    *(_QWORD *)buf = 0;
    v13 = 0;
    v16 = 0u;
    v17 = 0u;
    v18 = 0;
    v11[0] = 0;
    v11[1] = 0;
    objc_msgSend(a3, "getUUIDBytes:", v11);
    v7 = sub_101494C40((uint64_t)-[CLSwimNotifierAdapter adaptee](self, "adaptee"), (const unsigned __int8 *)v11, (uint64_t)buf);
    if ((_DWORD)v7 == 100)
      (*((void (**)(id, id, uint64_t))a4 + 2))(a4, objc_msgSend(objc_alloc((Class)CMSWOLFSummary), "initWithCLSWOLFSummary:", buf), 100);
    else
      (*((void (**)(id, _QWORD, uint64_t))a4 + 2))(a4, 0, v7);
  }
  else
  {
    if (qword_10229FCA0 != -1)
      dispatch_once(&qword_10229FCA0, &stru_1021B8FD0);
    v8 = qword_10229FCA8;
    if (os_log_type_enabled((os_log_t)qword_10229FCA8, OS_LOG_TYPE_DEFAULT))
    {
      *(_WORD *)buf = 0;
      _os_log_impl((void *)&_mh_execute_header, v8, OS_LOG_TYPE_DEFAULT, "session SWOLF query nil sessionId", buf, 2u);
    }
    if (sub_1001BFF7C(115, 2))
    {
      bzero(buf, 0x65CuLL);
      if (qword_10229FCA0 != -1)
        dispatch_once(&qword_10229FCA0, &stru_1021B8FD0);
      LOWORD(v11[0]) = 0;
      _os_log_send_and_compose_impl(2, 0, buf, 1628, &_mh_execute_header, qword_10229FCA8, 0, "session SWOLF query nil sessionId", v11, 2);
      v10 = (uint8_t *)v9;
      sub_100512490("Generic", 1, 0, 2, "-[CLSwimNotifierAdapter querySessionSWOLF:withReply:]", "%s\n", v9);
      if (v10 != buf)
        free(v10);
    }
    (*((void (**)(id, _QWORD, uint64_t))a4 + 2))(a4, 0, 107);
  }
}

- (void)clearCalibrations
{
  sub_10047EF7C((uint64_t)-[CLSwimNotifierAdapter adaptee](self, "adaptee") + 168);
}

- (BOOL)syncget_prepareSessionEndForSessionType:(int64_t)a3 atEndTime:(double)a4
{
  return 1;
}

@end
